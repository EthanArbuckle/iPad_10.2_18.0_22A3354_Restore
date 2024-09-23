@implementation AISRepairContext

- (AISRepairContext)initWithAltDSID:(id)a3
{
  id v4;
  AISRepairContext *v5;
  uint64_t v6;
  NSString *altDSID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AISRepairContext;
  v5 = -[AISSetupContext init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

  }
  return v5;
}

- (AISRepairContext)initWithUserProfileIdentifier:(id)a3
{
  id v4;
  AISRepairContext *v5;
  uint64_t v6;
  NSString *userProfileIdentifier;

  v4 = a3;
  v5 = -[AISRepairContext initWithAltDSID:](self, "initWithAltDSID:", &stru_2507DF370);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    userProfileIdentifier = v5->_userProfileIdentifier;
    v5->_userProfileIdentifier = (NSString *)v6;

  }
  return v5;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)userProfileIdentifier
{
  return self->_userProfileIdentifier;
}

- (void)setUserProfileIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
