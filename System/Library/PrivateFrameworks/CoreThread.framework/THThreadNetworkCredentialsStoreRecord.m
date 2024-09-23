@implementation THThreadNetworkCredentialsStoreRecord

- (THThreadNetworkCredentialsStoreRecord)initWithNetwork:(id)a3 credentials:(id)a4 uniqueIdentifier:(id)a5 keychainAccessGroup:(id)a6 creationDate:(id)a7 lastModificationDate:(id)a8
{
  id v15;
  id v16;
  id v17;
  THThreadNetworkCredentialsStoreRecord *v18;
  THThreadNetworkCredentialsStoreRecord *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)THThreadNetworkCredentialsStoreRecord;
  v18 = -[THThreadNetworkCredentialsStoreRecord init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_network, a3);
    objc_storeStrong((id *)&v19->_credentials, a4);
    objc_storeStrong((id *)&v19->_uniqueIdentifier, a5);
    objc_storeStrong((id *)&v19->_creationDate, a7);
    objc_storeStrong((id *)&v19->_lastModificationDate, a8);
    objc_storeStrong((id *)&v19->_keychainAccessGroup, a6);
  }

  return v19;
}

- (THThreadNetworkCredentialsStoreRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  THThreadNetworkCredentialsStoreRecord *v12;
  NSObject *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("net"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cr"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("grp"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = 0;
    if (v6 && v7 && v10)
    {
      self = -[THThreadNetworkCredentialsStoreRecord initWithNetwork:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:](self, "initWithNetwork:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:", v6, v7, v5, v10, v8, v9);
      v12 = self;
    }

  }
  else
  {
    THLogHandleForCategory(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[THThreadNetworkCredentialsStoreRecord initWithCoder:].cold.1(v13);

    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[THThreadNetworkCredentialsStoreRecord uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

  -[THThreadNetworkCredentialsStoreRecord network](self, "network");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("net"));

  -[THThreadNetworkCredentialsStoreRecord credentials](self, "credentials");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cred"));

  -[THThreadNetworkCredentialsStoreRecord creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("cr"));

  -[THThreadNetworkCredentialsStoreRecord lastModificationDate](self, "lastModificationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("lm"));

  -[THThreadNetworkCredentialsStoreRecord keychainAccessGroup](self, "keychainAccessGroup");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("grp"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THThreadNetwork)network
{
  return self->_network;
}

- (THThreadNetworkCredentials)credentials
{
  return self->_credentials;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)keychainAccessGroup
{
  return self->_keychainAccessGroup;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_network, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "-[THThreadNetworkCredentialsStoreRecord initWithCoder:]";
  v3 = 1024;
  v4 = 52;
  _os_log_error_impl(&dword_21572C000, log, OS_LOG_TYPE_ERROR, "%s:%d: Could not decode uniqueIdentifier", (uint8_t *)&v1, 0x12u);
}

@end
