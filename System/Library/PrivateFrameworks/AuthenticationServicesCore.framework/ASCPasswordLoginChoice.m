@implementation ASCPasswordLoginChoice

- (ASCPasswordLoginChoice)initWithUsername:(id)a3 site:(id)a4 externalCredentialIdentity:(id)a5 customTitle:(id)a6 groupName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ASCPasswordLoginChoice *v17;
  uint64_t v18;
  NSString *username;
  uint64_t v20;
  NSString *site;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *providerBundleIdentifier;
  uint64_t v26;
  NSString *customTitle;
  uint64_t v28;
  NSString *groupName;
  ASCPasswordLoginChoice *v30;
  objc_super v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)ASCPasswordLoginChoice;
  v17 = -[ASCPasswordLoginChoice init](&v32, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    username = v17->_username;
    v17->_username = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    site = v17->_site;
    v17->_site = (NSString *)v20;

    objc_msgSend(v14, "owningExtensionState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "providerBundleID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "copy");
    providerBundleIdentifier = v17->_providerBundleIdentifier;
    v17->_providerBundleIdentifier = (NSString *)v24;

    objc_storeStrong((id *)&v17->_externalCredentialIdentity, a5);
    if (objc_msgSend(v15, "length"))
    {
      v26 = objc_msgSend(v15, "copy");
      customTitle = v17->_customTitle;
      v17->_customTitle = (NSString *)v26;
    }
    else
    {
      customTitle = v17->_customTitle;
      v17->_customTitle = 0;
    }

    if (objc_msgSend(v16, "length"))
    {
      v28 = objc_msgSend(v16, "copy");
      groupName = v17->_groupName;
      v17->_groupName = (NSString *)v28;
    }
    else
    {
      groupName = v17->_groupName;
      v17->_groupName = 0;
    }

    v30 = v17;
  }

  return v17;
}

- (BOOL)isExternal
{
  return self->_externalCredentialIdentity != 0;
}

- (unint64_t)loginChoiceKind
{
  return 1;
}

- (BOOL)isSharedCredential
{
  void *v2;
  BOOL v3;

  -[ASCPasswordLoginChoice groupName](self, "groupName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[NSString isEqualToString:](self->_username, "isEqualToString:", v5[1])
      && self->_externalCredentialIdentity == (SFCredentialIdentity *)v5[5]
      && -[NSString isEqualToString:](self->_site, "isEqualToString:", v5[2]);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *username;
  id v5;

  username = self->_username;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", username, CFSTR("passwordLoginChoiceUsername"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_site, CFSTR("passwordLoginChoiceSite"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customTitle, CFSTR("passwordLoginChoiceCustomTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupName, CFSTR("passwordLoginChoiceGroupNameKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalCredentialIdentity, CFSTR("externalPasswordIdentity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerBundleIdentifier, CFSTR("providerBundleIdentifier"));

}

- (ASCPasswordLoginChoice)initWithCoder:(id)a3
{
  id v4;
  ASCPasswordLoginChoice *v5;
  uint64_t v6;
  NSString *username;
  uint64_t v8;
  NSString *site;
  uint64_t v10;
  NSString *customTitle;
  uint64_t v12;
  NSString *groupName;
  uint64_t v14;
  SFCredentialIdentity *externalCredentialIdentity;
  uint64_t v16;
  NSString *providerBundleIdentifier;
  ASCPasswordLoginChoice *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ASCPasswordLoginChoice;
  v5 = -[ASCPasswordLoginChoice init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passwordLoginChoiceUsername"));
    v6 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passwordLoginChoiceSite"));
    v8 = objc_claimAutoreleasedReturnValue();
    site = v5->_site;
    v5->_site = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passwordLoginChoiceCustomTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    customTitle = v5->_customTitle;
    v5->_customTitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passwordLoginChoiceGroupNameKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalPasswordIdentity"));
    v14 = objc_claimAutoreleasedReturnValue();
    externalCredentialIdentity = v5->_externalCredentialIdentity;
    v5->_externalCredentialIdentity = (SFCredentialIdentity *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerBundleIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v16;

    v18 = v5;
  }

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  if (-[ASCPasswordLoginChoice isExternal](self, "isExternal") && !objc_msgSend(v4, "isExternal"))
    goto LABEL_9;
  if (!-[ASCPasswordLoginChoice isExternal](self, "isExternal") && (objc_msgSend(v4, "isExternal") & 1) != 0)
    goto LABEL_5;
  if (!-[ASCPasswordLoginChoice isExternal](self, "isExternal") || !objc_msgSend(v4, "isExternal"))
    goto LABEL_11;
  v6 = -[SFCredentialIdentity rank](self->_externalCredentialIdentity, "rank");
  objc_msgSend(v4, "externalCredentialIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rank");

  if (v6 > v8)
  {
LABEL_9:
    v5 = -1;
    goto LABEL_12;
  }
  v9 = -[SFCredentialIdentity rank](self->_externalCredentialIdentity, "rank");
  objc_msgSend(v4, "externalCredentialIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rank");

  if (v9 >= v11)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
LABEL_5:
  v5 = 1;
LABEL_12:

  return v5;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)site
{
  return self->_site;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (SFCredentialIdentity)externalCredentialIdentity
{
  return self->_externalCredentialIdentity;
}

- (NSString)providerBundleIdentifier
{
  return self->_providerBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_externalCredentialIdentity, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_site, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
