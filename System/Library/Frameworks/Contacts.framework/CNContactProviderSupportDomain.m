@implementation CNContactProviderSupportDomain

- (CNContactProviderSupportDomain)initWithDomainIdentifer:(id)a3 displayName:(id)a4 userInfo:(id)a5 bundleIdentifier:(id)a6 enabled:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CNContactProviderSupportDomain *v17;
  CNContactProviderSupportDomain *v18;
  CNContactProviderSupportDomain *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CNContactProviderSupportDomain;
  v17 = -[CNContactProviderSupportDomain init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_domainIdentifier, a3);
    objc_storeStrong((id *)&v18->_displayName, a4);
    objc_storeStrong((id *)&v18->_userInfo, a5);
    objc_storeStrong((id *)&v18->_bundleIdentifier, a6);
    v18->_enabled = a7;
    v19 = v18;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactProviderSupportDomain)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CNContactProviderSupportDomain *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domainIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v7, v12, CFSTR("userInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEnabled"));

  v16 = -[CNContactProviderSupportDomain initWithDomainIdentifer:displayName:userInfo:bundleIdentifier:enabled:]([CNContactProviderSupportDomain alloc], "initWithDomainIdentifer:displayName:userInfo:bundleIdentifier:enabled:", v5, v6, v13, v14, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *domainIdentifier;
  id v5;

  domainIdentifier = self->_domainIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", domainIdentifier, CFSTR("domainIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabled, CFSTR("isEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CNContactProviderSupportDomain *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CNContactProviderSupportDomain *v9;

  v4 = [CNContactProviderSupportDomain alloc];
  -[CNContactProviderSupportDomain domainIdentifier](self, "domainIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportDomain displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportDomain userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportDomain bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNContactProviderSupportDomain initWithDomainIdentifer:displayName:userInfo:bundleIdentifier:enabled:](v4, "initWithDomainIdentifer:displayName:userInfo:bundleIdentifier:enabled:", v5, v6, v7, v8, -[CNContactProviderSupportDomain isEnabled](self, "isEnabled"));

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CNContactProviderSupportDomain *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _BOOL4 v13;
  _BOOL4 v14;

  v4 = (CNContactProviderSupportDomain *)a3;
  if (self == v4)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_12;
    v5 = (unint64_t)-[CNContactProviderSupportDomain domainIdentifier](self, "domainIdentifier");
    v6 = (unint64_t)-[CNContactProviderSupportDomain domainIdentifier](v4, "domainIdentifier");
    if (v5 | v6)
    {
      if (!objc_msgSend((id)v5, "isEqual:", v6))
        goto LABEL_12;
    }
    if (((v7 = (unint64_t)-[CNContactProviderSupportDomain displayName](self, "displayName"),
           v8 = (unint64_t)-[CNContactProviderSupportDomain displayName](v4, "displayName"),
           !(v7 | v8))
       || objc_msgSend((id)v7, "isEqual:", v8))
      && ((v9 = (unint64_t)-[CNContactProviderSupportDomain userInfo](self, "userInfo"),
           v10 = (unint64_t)-[CNContactProviderSupportDomain userInfo](v4, "userInfo"),
           !(v9 | v10))
       || objc_msgSend((id)v9, "isEqual:", v10))
      && ((v11 = (unint64_t)-[CNContactProviderSupportDomain bundleIdentifier](self, "bundleIdentifier"),
           v12 = (unint64_t)-[CNContactProviderSupportDomain bundleIdentifier](v4, "bundleIdentifier"),
           !(v11 | v12))
       || objc_msgSend((id)v11, "isEqual:", v12)))
    {
      v13 = -[CNContactProviderSupportDomain isEnabled](self, "isEnabled");
      v14 = v13 ^ -[CNContactProviderSupportDomain isEnabled](v4, "isEnabled") ^ 1;
    }
    else
    {
LABEL_12:
      LOBYTE(v14) = 0;
    }
  }

  return v14;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end
