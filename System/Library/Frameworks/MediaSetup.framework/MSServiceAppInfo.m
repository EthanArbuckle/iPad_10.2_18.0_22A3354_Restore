@implementation MSServiceAppInfo

- (MSServiceAppInfo)initWithServiceName:(id)a3 serviceBundleID:(id)a4
{
  id v7;
  id v8;
  MSServiceAppInfo *v9;
  MSServiceAppInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSServiceAppInfo;
  v9 = -[MSServiceAppInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceName, a3);
    objc_storeStrong((id *)&v10->_serviceBundleID, a4);
  }

  return v10;
}

- (MSServiceAppInfo)initWithServiceName:(id)a3 serviceBundleID:(id)a4 useInHome:(BOOL)a5 subscriptionStatus:(int64_t)a6
{
  MSServiceAppInfo *result;

  result = -[MSServiceAppInfo initWithServiceName:serviceBundleID:](self, "initWithServiceName:serviceBundleID:", a3, a4);
  if (result)
  {
    result->_useInHome = a5;
    result->_subscriptionStatus = a6;
  }
  return result;
}

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceName, CFSTR("serviceName"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceBundleID, CFSTR("bundleID"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_alternateBundleIDS, CFSTR("alternateBundleID"));
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
  NSString *serviceName;
  id v5;

  serviceName = self->_serviceName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serviceName, CFSTR("MSSServiceNameEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceBundleID, CFSTR("MSSServiceBundleIDEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternateBundleIDS, CFSTR("MSSAlternateBundleIDSEncodedKey"));

}

- (MSServiceAppInfo)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *serviceName;
  NSString *v7;
  NSString *serviceBundleID;
  MSServiceAppInfo *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *alternateBundleIDS;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSServiceNameEncodedKey"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceName = self->_serviceName;
  self->_serviceName = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSServiceBundleIDEncodedKey"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceBundleID = self->_serviceBundleID;
  self->_serviceBundleID = v7;

  v9 = -[MSServiceAppInfo initWithServiceName:serviceBundleID:](self, "initWithServiceName:serviceBundleID:", self->_serviceName, self->_serviceBundleID);
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("MSSAlternateBundleIDSEncodedKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    alternateBundleIDS = v9->_alternateBundleIDS;
    v9->_alternateBundleIDS = (NSArray *)v13;

  }
  return v9;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)serviceBundleID
{
  return self->_serviceBundleID;
}

- (NSArray)alternateBundleIDS
{
  return self->_alternateBundleIDS;
}

- (void)setAlternateBundleIDS:(id)a3
{
  objc_storeStrong((id *)&self->_alternateBundleIDS, a3);
}

- (BOOL)useInHome
{
  return self->_useInHome;
}

- (int64_t)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateBundleIDS, 0);
  objc_storeStrong((id *)&self->_serviceBundleID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
