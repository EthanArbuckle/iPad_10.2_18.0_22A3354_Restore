@implementation AKPrivateEmailContext

- (AKPrivateEmailContext)initWithKey:(id)a3
{
  id v5;
  AKPrivateEmailContext *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKPrivateEmailContext;
  v6 = -[AKPrivateEmailContext init](&v8, sel_init);
  if (v6 == self)
    objc_storeStrong((id *)&self->_key, a3);

  return v6;
}

- (AKPrivateEmailContext)initWithKey:(id)a3 altDSID:(id)a4
{
  id v7;
  id v8;
  AKPrivateEmailContext *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AKPrivateEmailContext;
  v9 = -[AKPrivateEmailContext init](&v11, sel_init);
  if (v9 == self)
  {
    objc_storeStrong((id *)&self->_key, a3);
    objc_storeStrong((id *)&self->_altDSID, a4);
  }

  return v9;
}

- (AKPrivateEmailContext)initWithKey:(id)a3 altDSID:(id)a4 clientAppBundleId:(id)a5
{
  id v9;
  id v10;
  id v11;
  AKPrivateEmailContext *v12;
  NSString *originType;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AKPrivateEmailContext;
  v12 = -[AKPrivateEmailContext init](&v15, sel_init);
  if (v12 == self)
  {
    objc_storeStrong((id *)&self->_key, a3);
    objc_storeStrong((id *)&self->_altDSID, a4);
    objc_storeStrong((id *)&self->_clientAppBundleId, a5);
    originType = self->_originType;
    self->_originType = (NSString *)CFSTR("ThirdPartyApp");

    objc_storeStrong((id *)&self->_originIdentifier, a5);
  }

  return v12;
}

- (AKPrivateEmailContext)initWithKey:(id)a3 altDSID:(id)a4 originType:(id)a5 originIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AKPrivateEmailContext *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AKPrivateEmailContext;
  v15 = -[AKPrivateEmailContext init](&v17, sel_init);
  if (v15 == self)
  {
    objc_storeStrong((id *)&self->_key, a3);
    objc_storeStrong((id *)&self->_altDSID, a4);
    objc_storeStrong((id *)&self->_originType, a5);
    objc_storeStrong((id *)&self->_originIdentifier, a6);
  }

  return v15;
}

- (AKPrivateEmailContext)initWithContext:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  AKPrivateEmailContext *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "upgradeBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v7, "upgradeBundleIdentifier");
  else
    objc_msgSend(v6, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AKPrivateEmailContext initWithContext:bundleID:](self, "initWithContext:bundleID:", v7, v9);

  return v10;
}

- (AKPrivateEmailContext)initWithContext:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  AKPrivateEmailContext *v8;
  uint64_t v9;
  NSString *key;
  uint64_t v11;
  NSString *altDSID;
  uint64_t v13;
  NSString *clientAppBundleId;
  uint64_t v15;
  NSString *proxiedAppID;
  uint64_t v17;
  NSString *proxiedAppName;
  uint64_t v19;
  NSString *proxiedBundleIdentifier;
  uint64_t v21;
  NSString *originType;
  uint64_t v23;
  NSString *originIdentifier;
  uint64_t v25;
  NSString *metadataString;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AKPrivateEmailContext;
  v8 = -[AKPrivateEmailContext init](&v28, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "key");
    v9 = objc_claimAutoreleasedReturnValue();
    key = v8->_key;
    v8->_key = (NSString *)v9;

    objc_msgSend(v6, "altDSID");
    v11 = objc_claimAutoreleasedReturnValue();
    altDSID = v8->_altDSID;
    v8->_altDSID = (NSString *)v11;

    objc_msgSend(v6, "clientAppBundleId");
    v13 = objc_claimAutoreleasedReturnValue();
    clientAppBundleId = v8->_clientAppBundleId;
    v8->_clientAppBundleId = (NSString *)v13;

    objc_msgSend(v6, "proxiedAppID");
    v15 = objc_claimAutoreleasedReturnValue();
    proxiedAppID = v8->_proxiedAppID;
    v8->_proxiedAppID = (NSString *)v15;

    objc_msgSend(v6, "proxiedAppName");
    v17 = objc_claimAutoreleasedReturnValue();
    proxiedAppName = v8->_proxiedAppName;
    v8->_proxiedAppName = (NSString *)v17;

    objc_msgSend(v6, "proxiedBundleIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    proxiedBundleIdentifier = v8->_proxiedBundleIdentifier;
    v8->_proxiedBundleIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v8->_upgradeBundleIdentifier, a4);
    objc_msgSend(v6, "originType");
    v21 = objc_claimAutoreleasedReturnValue();
    originType = v8->_originType;
    v8->_originType = (NSString *)v21;

    objc_msgSend(v6, "originIdentifier");
    v23 = objc_claimAutoreleasedReturnValue();
    originIdentifier = v8->_originIdentifier;
    v8->_originIdentifier = (NSString *)v23;

    objc_msgSend(v6, "metadataString");
    v25 = objc_claimAutoreleasedReturnValue();
    metadataString = v8->_metadataString;
    v8->_metadataString = (NSString *)v25;

  }
  return v8;
}

- (void)sanitiseInternalState
{
  NSString *v3;
  NSString *key;
  NSString *v5;
  NSString *metadataString;
  NSString *v7;
  NSString *originIdentifier;

  -[NSString lowercaseString](self->_key, "lowercaseString");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  key = self->_key;
  self->_key = v3;

  -[NSString lowercaseString](self->_metadataString, "lowercaseString");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  metadataString = self->_metadataString;
  self->_metadataString = v5;

  -[NSString lowercaseString](self->_originIdentifier, "lowercaseString");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  originIdentifier = self->_originIdentifier;
  self->_originIdentifier = v7;

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HmeContext:{%@:%@:%@}"), self->_altDSID, self->_key, self->_clientAppBundleId);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("contextKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("contextAltDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedAppID, CFSTR("contextProxiedApp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedBundleIdentifier, CFSTR("contextBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedAppName, CFSTR("contextAppName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_upgradeBundleIdentifier, CFSTR("upgradeBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientAppBundleId, CFSTR("privateEmailClientBundle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originType, CFSTR("originType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originIdentifier, CFSTR("originIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadataString, CFSTR("metadataString"));

}

- (AKPrivateEmailContext)initWithCoder:(id)a3
{
  id v4;
  AKPrivateEmailContext *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  NSString *key;
  uint64_t v10;
  NSString *proxiedAppID;
  uint64_t v12;
  NSString *proxiedBundleIdentifier;
  uint64_t v14;
  NSString *proxiedAppName;
  uint64_t v16;
  NSString *upgradeBundleIdentifier;
  uint64_t v18;
  NSString *clientAppBundleId;
  uint64_t v20;
  NSString *originType;
  uint64_t v22;
  NSString *originIdentifier;
  uint64_t v24;
  NSString *metadataString;

  v4 = a3;
  v5 = -[AKPrivateEmailContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextAltDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextProxiedApp"));
    v10 = objc_claimAutoreleasedReturnValue();
    proxiedAppID = v5->_proxiedAppID;
    v5->_proxiedAppID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextBundleID"));
    v12 = objc_claimAutoreleasedReturnValue();
    proxiedBundleIdentifier = v5->_proxiedBundleIdentifier;
    v5->_proxiedBundleIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextAppName"));
    v14 = objc_claimAutoreleasedReturnValue();
    proxiedAppName = v5->_proxiedAppName;
    v5->_proxiedAppName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("upgradeBundleID"));
    v16 = objc_claimAutoreleasedReturnValue();
    upgradeBundleIdentifier = v5->_upgradeBundleIdentifier;
    v5->_upgradeBundleIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateEmailClientBundle"));
    v18 = objc_claimAutoreleasedReturnValue();
    clientAppBundleId = v5->_clientAppBundleId;
    v5->_clientAppBundleId = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originType"));
    v20 = objc_claimAutoreleasedReturnValue();
    originType = v5->_originType;
    v5->_originType = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    originIdentifier = v5->_originIdentifier;
    v5->_originIdentifier = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadataString"));
    v24 = objc_claimAutoreleasedReturnValue();
    metadataString = v5->_metadataString;
    v5->_metadataString = (NSString *)v24;

  }
  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)proxiedAppID
{
  return self->_proxiedAppID;
}

- (void)setProxiedAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)proxiedBundleIdentifier
{
  return self->_proxiedBundleIdentifier;
}

- (void)setProxiedBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)proxiedAppName
{
  return self->_proxiedAppName;
}

- (void)setProxiedAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)upgradeBundleIdentifier
{
  return self->_upgradeBundleIdentifier;
}

- (NSString)clientAppBundleId
{
  return self->_clientAppBundleId;
}

- (void)setClientAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)keyAndBundleIdAreHashed
{
  return self->_keyAndBundleIdAreHashed;
}

- (void)setKeyAndBundleIdAreHashed:(BOOL)a3
{
  self->_keyAndBundleIdAreHashed = a3;
}

- (NSString)originType
{
  return self->_originType;
}

- (NSString)originIdentifier
{
  return self->_originIdentifier;
}

- (NSString)metadataString
{
  return self->_metadataString;
}

- (void)setMetadataString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataString, 0);
  objc_storeStrong((id *)&self->_originIdentifier, 0);
  objc_storeStrong((id *)&self->_originType, 0);
  objc_storeStrong((id *)&self->_clientAppBundleId, 0);
  objc_storeStrong((id *)&self->_upgradeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedAppName, 0);
  objc_storeStrong((id *)&self->_proxiedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedAppID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
