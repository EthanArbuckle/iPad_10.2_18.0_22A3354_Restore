@implementation HMDApplicationVendorIDStoreValue

- (NSData)vendorIdSha1
{
  return self->_vendorIdSha1;
}

- (HMDApplicationVendorIDStoreValue)initWithVendorIDSha1:(id)a3 applicationBundleId:(id)a4 companionAppBundleId:(id)a5 spiClient:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  HMDApplicationVendorIDStoreValue *v13;
  uint64_t v14;
  NSData *vendorIdSha1;
  uint64_t v16;
  NSString *applicationBundleId;
  uint64_t v18;
  NSString *companionAppBundleId;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HMDApplicationVendorIDStoreValue;
  v13 = -[HMDApplicationVendorIDStoreValue init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    vendorIdSha1 = v13->_vendorIdSha1;
    v13->_vendorIdSha1 = (NSData *)v14;

    v16 = objc_msgSend(v11, "copy");
    applicationBundleId = v13->_applicationBundleId;
    v13->_applicationBundleId = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    companionAppBundleId = v13->_companionAppBundleId;
    v13->_companionAppBundleId = (NSString *)v18;

    v13->_spiClient = a6;
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDApplicationVendorIDStoreValue vendorIdSha1](self, "vendorIdSha1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDApplicationVendorIDStoreValue applicationBundleId](self, "applicationBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDApplicationVendorIDStoreValue companionAppBundleId](self, "companionAppBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDApplicationVendorIDStoreValue spiClient](self, "spiClient");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[V:%@, A:%@, C:%@ S:%@]"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMDApplicationVendorIDStoreValue)initWithCoder:(id)a3
{
  id v4;
  HMDApplicationVendorIDStoreValue *v5;
  void *v6;
  uint64_t v7;
  NSData *vendorIdSha1;
  void *v9;
  uint64_t v10;
  NSString *applicationBundleId;
  void *v12;
  uint64_t v13;
  NSString *companionAppBundleId;

  v4 = a3;
  v5 = -[HMDApplicationVendorIDStoreValue init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.vendorID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    vendorIdSha1 = v5->_vendorIdSha1;
    v5->_vendorIdSha1 = (NSData *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.applicationBundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    applicationBundleId = v5->_applicationBundleId;
    v5->_applicationBundleId = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.companionApplicationBundleID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    companionAppBundleId = v5->_companionAppBundleId;
    v5->_companionAppBundleId = (NSString *)v13;

    v5->_spiClient = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.isSPIApplication"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMDApplicationVendorIDStoreValue vendorIdSha1](self, "vendorIdSha1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("HM.vendorID"));

  -[HMDApplicationVendorIDStoreValue applicationBundleId](self, "applicationBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("HM.applicationBundleID"));

  -[HMDApplicationVendorIDStoreValue companionAppBundleId](self, "companionAppBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("HM.companionApplicationBundleID"));

  objc_msgSend(v7, "encodeBool:forKey:", -[HMDApplicationVendorIDStoreValue spiClient](self, "spiClient"), CFSTR("HM.isSPIApplication"));
}

- (NSString)applicationBundleId
{
  return self->_applicationBundleId;
}

- (NSString)companionAppBundleId
{
  return self->_companionAppBundleId;
}

- (BOOL)spiClient
{
  return self->_spiClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionAppBundleId, 0);
  objc_storeStrong((id *)&self->_applicationBundleId, 0);
  objc_storeStrong((id *)&self->_vendorIdSha1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
