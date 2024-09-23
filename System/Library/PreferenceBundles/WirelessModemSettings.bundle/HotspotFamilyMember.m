@implementation HotspotFamilyMember

- (HotspotFamilyMember)init
{
  HotspotFamilyMember *v2;
  HotspotFamilyMember *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HotspotFamilyMember;
  v2 = -[HotspotFamilyMember init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HotspotFamilyMember setAltDSID:](v2, "setAltDSID:", &stru_24FDBBCF8);
    -[HotspotFamilyMember setDisplayName:](v3, "setDisplayName:", &stru_24FDBBCF8);
    -[HotspotFamilyMember setShareOption:](v3, "setShareOption:", 1);
  }
  return v3;
}

- (HotspotFamilyMember)initWithAltDSID:(id)a3 displayName:(id)a4 shareOption:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  HotspotFamilyMember *v10;
  HotspotFamilyMember *v11;
  objc_super v13;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HotspotFamilyMember;
  v10 = -[HotspotFamilyMember init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[HotspotFamilyMember setAltDSID:](v10, "setAltDSID:", v8);
    -[HotspotFamilyMember setDisplayName:](v11, "setDisplayName:", v9);
    -[HotspotFamilyMember setShareOption:](v11, "setShareOption:", v5);
  }

  return v11;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (int)shareOption
{
  return self->_shareOption;
}

- (void)setShareOption:(int)a3
{
  self->_shareOption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
