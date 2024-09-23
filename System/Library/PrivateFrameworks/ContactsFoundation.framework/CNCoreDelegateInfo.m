@implementation CNCoreDelegateInfo

- (CNCoreDelegateInfo)init
{
  return -[CNCoreDelegateInfo initWithDSID:altDSID:appleID:principalPath:nameComponents:isMe:](self, "initWithDSID:altDSID:appleID:principalPath:nameComponents:isMe:", 0, 0, 0, 0, 0, 1);
}

- (CNCoreDelegateInfo)initWithAltDSID:(id)a3
{
  return -[CNCoreDelegateInfo initWithDSID:altDSID:appleID:principalPath:nameComponents:isMe:](self, "initWithDSID:altDSID:appleID:principalPath:nameComponents:isMe:", 0, a3, 0, 0, 0, a3 == 0);
}

- (CNCoreDelegateInfo)initWithDSID:(id)a3 altDSID:(id)a4 appleID:(id)a5 principalPath:(id)a6 nameComponents:(id)a7 isMe:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  CNCoreDelegateInfo *v19;
  uint64_t v20;
  NSNumber *dsid;
  uint64_t v22;
  NSString *altDSID;
  uint64_t v24;
  NSString *appleID;
  uint64_t v26;
  NSString *principalPath;
  uint64_t v28;
  NSPersonNameComponents *nameComponents;
  CNCoreDelegateInfo *v30;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v32.receiver = self;
  v32.super_class = (Class)CNCoreDelegateInfo;
  v19 = -[CNCoreDelegateInfo init](&v32, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    dsid = v19->_dsid;
    v19->_dsid = (NSNumber *)v20;

    v22 = objc_msgSend(v15, "copy");
    altDSID = v19->_altDSID;
    v19->_altDSID = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    appleID = v19->_appleID;
    v19->_appleID = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    principalPath = v19->_principalPath;
    v19->_principalPath = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    nameComponents = v19->_nameComponents;
    v19->_nameComponents = (NSPersonNameComponents *)v28;

    v19->_isMe = a8;
    v30 = v19;
  }

  return v19;
}

- (CNCoreDelegateInfo)initWithFamilyMember:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CNCoreDelegateInfo *v11;

  v4 = a3;
  objc_msgSend(v4, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCoreDelegateInfo _hardCodedPrincipalPathForFamilyMember:](self, "_hardCodedPrincipalPathForFamilyMember:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "nameComponentsForFamilyMember:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "isMe");

  v11 = -[CNCoreDelegateInfo initWithDSID:altDSID:appleID:principalPath:nameComponents:isMe:](self, "initWithDSID:altDSID:appleID:principalPath:nameComponents:isMe:", v5, v6, v7, v8, v9, v10);
  return v11;
}

+ (id)nameComponentsForFamilyMember:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  id v11;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(v3, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CNIsStringNonempty_block_invoke_2((uint64_t)&__block_literal_global_109, v5);

  if (v6)
  {
    objc_msgSend(v3, "firstName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGivenName:", v7);

  }
  objc_msgSend(v3, "lastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CNIsStringNonempty_block_invoke_2((uint64_t)&__block_literal_global_109, v8);

  if (v9)
  {
    objc_msgSend(v3, "lastName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFamilyName:", v10);

  }
  else if (!v6)
  {
    v11 = 0;
    goto LABEL_8;
  }
  v11 = v4;
LABEL_8:

  return v11;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("dsid"), self->_dsid);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("altDSID"), self->_altDSID);
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("appleID"), self->_appleID);
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("principalPath"), self->_principalPath);
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("altDSID"), self->_altDSID);
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("nameComponents"), self->_nameComponents);
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CNCoreDelegateInfo *v4;
  NSNumber *dsid;
  NSString *altDSID;
  NSString *appleID;
  NSString *principalPath;
  NSPersonNameComponents *nameComponents;
  BOOL v10;

  v4 = (CNCoreDelegateInfo *)a3;
  v10 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (dsid = self->_dsid, (unint64_t)dsid | (unint64_t)v4->_dsid)
      && !-[NSNumber isEqual:](dsid, "isEqual:")
      || (altDSID = self->_altDSID, (unint64_t)altDSID | (unint64_t)v4->_altDSID)
      && !-[NSString isEqual:](altDSID, "isEqual:")
      || (appleID = self->_appleID, (unint64_t)appleID | (unint64_t)v4->_appleID)
      && !-[NSString isEqual:](appleID, "isEqual:")
      || (principalPath = self->_principalPath, (unint64_t)principalPath | (unint64_t)v4->_principalPath)
      && !-[NSString isEqual:](principalPath, "isEqual:")
      || (nameComponents = self->_nameComponents,
          (unint64_t)nameComponents | (unint64_t)v4->_nameComponents)
      && !-[NSPersonNameComponents isEqual:](nameComponents, "isEqual:"))
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", self->_dsid);
  v4 = +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", self->_altDSID) - v3 + 32 * v3;
  v5 = +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", self->_appleID) - v4 + 32 * v4;
  v6 = +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", self->_principalPath) - v5 + 32 * v5;
  return +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", self->_nameComponents)
       - v6
       + 32 * v6
       + 486695567;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CNCoreDelegateInfo initWithDSID:altDSID:appleID:principalPath:nameComponents:isMe:]([CNCoreMutableDelegateInfo alloc], "initWithDSID:altDSID:appleID:principalPath:nameComponents:isMe:", self->_dsid, self->_altDSID, self->_appleID, self->_principalPath, self->_nameComponents, self->_isMe);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNCoreDelegateInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CNCoreDelegateInfo *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dsid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_principalPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_nameComponents"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isMe"));

  v11 = -[CNCoreDelegateInfo initWithDSID:altDSID:appleID:principalPath:nameComponents:isMe:](self, "initWithDSID:altDSID:appleID:principalPath:nameComponents:isMe:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *dsid;
  id v5;

  dsid = self->_dsid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dsid, CFSTR("_dsid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("_altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleID, CFSTR("_appleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_principalPath, CFSTR("_principalPath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nameComponents, CFSTR("_nameComponents"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isMe, CFSTR("_isMe"));

}

+ (id)hardCodedPrincipalPathForDSID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@/principal/"), a3);
}

- (id)_hardCodedPrincipalPathForFamilyMember:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "dsid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "hardCodedPrincipalPathForDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)principalPath
{
  return self->_principalPath;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_principalPath, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
