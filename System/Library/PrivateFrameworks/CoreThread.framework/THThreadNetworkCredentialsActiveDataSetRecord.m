@implementation THThreadNetworkCredentialsActiveDataSetRecord

- (THThreadNetworkCredentialsActiveDataSetRecord)initWithBorderAgent:(id)a3 credentialsDataSet:(id)a4 network:(id)a5 credentials:(id)a6 uniqueIdentifier:(id)a7 keychainAccessGroup:(id)a8 creationDate:(id)a9 lastModificationDate:(id)a10
{
  id v17;
  id v18;
  THThreadNetworkCredentialsActiveDataSetRecord *v19;
  THThreadNetworkCredentialsActiveDataSetRecord *v20;
  id obj;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v27 = a4;
  v26 = a5;
  v25 = a6;
  v24 = a7;
  obj = a8;
  v23 = a8;
  v17 = a9;
  v18 = a10;
  v29.receiver = self;
  v29.super_class = (Class)THThreadNetworkCredentialsActiveDataSetRecord;
  v19 = -[THThreadNetworkCredentialsActiveDataSetRecord init](&v29, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_borderAgent, a3);
    objc_storeStrong((id *)&v20->_credentialsDataSet, a4);
    objc_storeStrong((id *)&v20->_network, a5);
    objc_storeStrong((id *)&v20->_credentials, a6);
    objc_storeStrong((id *)&v20->_uniqueIdentifier, a7);
    objc_storeStrong((id *)&v20->_creationDate, a9);
    objc_storeStrong((id *)&v20->_lastModificationDate, a10);
    objc_storeStrong((id *)&v20->_keychainAccessGroup, obj);
  }

  return v20;
}

- (THThreadNetworkCredentialsActiveDataSetRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  THThreadNetworkCredentialsActiveDataSetRecord *v13;
  THThreadNetworkCredentialsActiveDataSetRecord *v14;
  void *v15;
  THThreadNetworkCredentialsActiveDataSetRecord *v16;
  NSObject *v17;
  uint64_t v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ba"));
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("net"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cred"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cr"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lm"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("grp"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = 0;
    v20 = v5;
    if (v7 && v8 && v11)
    {
      v14 = self;
      v15 = (void *)v19;
      v13 = -[THThreadNetworkCredentialsActiveDataSetRecord initWithBorderAgent:credentialsDataSet:network:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:](v14, "initWithBorderAgent:credentialsDataSet:network:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:", v19, v6, v7, v8, v5, v12, v9, v10);
      v16 = v13;
    }
    else
    {
      v16 = self;
      v15 = (void *)v19;
    }

    self = v16;
    v5 = v20;
  }
  else
  {
    THLogHandleForCategory(1);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[THThreadNetworkCredentialsActiveDataSetRecord initWithCoder:].cold.1(v17);

    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[THThreadNetworkCredentialsActiveDataSetRecord uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

  -[THThreadNetworkCredentialsActiveDataSetRecord borderAgent](self, "borderAgent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ba"));

  -[THThreadNetworkCredentialsActiveDataSetRecord credentialsDataSet](self, "credentialsDataSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ds"));

  -[THThreadNetworkCredentialsActiveDataSetRecord network](self, "network");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("net"));

  -[THThreadNetworkCredentialsActiveDataSetRecord credentials](self, "credentials");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("cred"));

  -[THThreadNetworkCredentialsActiveDataSetRecord creationDate](self, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("cr"));

  -[THThreadNetworkCredentialsActiveDataSetRecord lastModificationDate](self, "lastModificationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("lm"));

  -[THThreadNetworkCredentialsActiveDataSetRecord keychainAccessGroup](self, "keychainAccessGroup");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("grp"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THThreadNetworkBorderAgent)borderAgent
{
  return self->_borderAgent;
}

- (THThreadNetworkCredentialsDataSet)credentialsDataSet
{
  return self->_credentialsDataSet;
}

- (THThreadNetwork)network
{
  return self->_network;
}

- (THThreadNetworkCredentials)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(id)a3
{
  objc_storeStrong((id *)&self->_credentials, a3);
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
  objc_storeStrong((id *)&self->_credentialsDataSet, 0);
  objc_storeStrong((id *)&self->_borderAgent, 0);
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
  v2 = "-[THThreadNetworkCredentialsActiveDataSetRecord initWithCoder:]";
  v3 = 1024;
  v4 = 57;
  _os_log_error_impl(&dword_21572C000, log, OS_LOG_TYPE_ERROR, "%s:%d: Could not decode uniqueIdentifier", (uint8_t *)&v1, 0x12u);
}

@end
