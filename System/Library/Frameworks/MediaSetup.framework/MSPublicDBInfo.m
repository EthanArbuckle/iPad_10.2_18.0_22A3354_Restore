@implementation MSPublicDBInfo

- (MSPublicDBInfo)initWithServiceName:(id)a3 serviceID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MSPublicDBInfo *v10;
  MSPublicDBInfo *v11;
  id *p_isa;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)MSPublicDBInfo;
    v11 = -[MSPublicDBInfo init](&v14, sel_init);
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_serviceName, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceName, CFSTR("serviceName"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceID, CFSTR("serviceIdentifier"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_recordName, CFSTR("recordName"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceType, CFSTR("serviceType"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceIconPath, CFSTR("serviceIconPath"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_bundleIDS, CFSTR("bundleIDS"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_configurationPublicKey, CFSTR("configurationPublicKey"));
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSArray *bundleIDS;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceName, CFSTR("_serviceName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceID, CFSTR("_serviceID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_recordName, CFSTR("_recordName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceType, CFSTR("_serviceType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceIconPath, CFSTR("_serviceIconPath"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_configurationPublicKey, CFSTR("_configurationPublicKey"));
  bundleIDS = self->_bundleIDS;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", bundleIDS, 1, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  v8 = v7;
  if (v7)
    NSLog(CFSTR("Error encoding bundleID data %@"), v7);
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_bundleIDS"));

}

- (MSPublicDBInfo)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *serviceName;
  NSString *v7;
  NSString *serviceID;
  MSPublicDBInfo *v9;
  uint64_t v10;
  NSString *recordName;
  uint64_t v12;
  NSString *serviceType;
  uint64_t v14;
  NSURL *serviceIconPath;
  uint64_t v16;
  NSString *configurationPublicKey;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *bundleIDS;
  MSPublicDBInfo *v26;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceName"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceName = self->_serviceName;
  self->_serviceName = v5;

  if (self->_serviceName
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceID")),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        serviceID = self->_serviceID,
        self->_serviceID = v7,
        serviceID,
        self->_serviceID))
  {
    v9 = -[MSPublicDBInfo initWithServiceName:serviceID:](self, "initWithServiceName:serviceID:", self->_serviceName);
    if (v9)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recordName"));
      v10 = objc_claimAutoreleasedReturnValue();
      recordName = v9->_recordName;
      v9->_recordName = (NSString *)v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceType"));
      v12 = objc_claimAutoreleasedReturnValue();
      serviceType = v9->_serviceType;
      v9->_serviceType = (NSString *)v12;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceIconPath"));
      v14 = objc_claimAutoreleasedReturnValue();
      serviceIconPath = v9->_serviceIconPath;
      v9->_serviceIconPath = (NSURL *)v14;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_configurationPublicKey"));
      v16 = objc_claimAutoreleasedReturnValue();
      configurationPublicKey = v9->_configurationPublicKey;
      v9->_configurationPublicKey = (NSString *)v16;

      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_bundleIDS"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BDD1620];
      v20 = (void *)MEMORY[0x24BDBCF20];
      v21 = objc_opt_class();
      v22 = objc_opt_class();
      objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "unarchivedObjectOfClasses:fromData:error:", v23, v18, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      bundleIDS = v9->_bundleIDS;
      v9->_bundleIDS = (NSArray *)v24;

    }
    self = v9;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)configurationPublicKey
{
  return self->_configurationPublicKey;
}

- (void)setConfigurationPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)serviceIconPath
{
  return self->_serviceIconPath;
}

- (void)setServiceIconPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)bundleIDS
{
  return self->_bundleIDS;
}

- (void)setBundleIDS:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDS, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDS, 0);
  objc_storeStrong((id *)&self->_serviceIconPath, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_configurationPublicKey, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
