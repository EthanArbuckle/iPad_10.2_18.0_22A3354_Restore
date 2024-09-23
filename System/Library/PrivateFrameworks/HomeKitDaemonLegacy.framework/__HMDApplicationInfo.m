@implementation __HMDApplicationInfo

- (id)vendorIdentifier
{
  NSData *v3;
  NSData *vendorIdentifier;
  NSData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)__HMDApplicationInfo;
  -[HMDApplicationInfo vendorIdentifier](&v7, sel_vendorIdentifier);
  v3 = (NSData *)objc_claimAutoreleasedReturnValue();
  vendorIdentifier = v3;
  if (!v3)
    vendorIdentifier = self->_vendorIdentifier;
  v5 = vendorIdentifier;

  return v5;
}

- (BOOL)isInstalled
{
  return self->_installed;
}

- (__HMDApplicationInfo)initWithRecord:(id)a3
{
  id v4;
  __HMDApplicationInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSData *vendorIdentifier;
  __HMDApplicationInfo *v11;
  objc_super v13;

  v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)__HMDApplicationInfo;
    v5 = -[__HMDBundleApplicationInfo initWithRecord:](&v13, sel_initWithRecord_, v4);
    if (v5)
    {
      objc_msgSend(v4, "applicationState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_installed = objc_msgSend(v6, "isInstalled");

      objc_msgSend(v4, "deviceIdentifierForVendor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hm_generateSHA1");
      v9 = objc_claimAutoreleasedReturnValue();
      vendorIdentifier = v5->_vendorIdentifier;
      v5->_vendorIdentifier = (NSData *)v9;

    }
    self = v5;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  __HMDApplicationInfo *v4;
  __HMDApplicationInfo *v5;
  __HMDApplicationInfo *v6;
  __HMDApplicationInfo *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = (__HMDApplicationInfo *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)__HMDApplicationInfo;
    if (-[HMDApplicationInfo isEqual:](&v12, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (v7)
      {
        -[HMDApplicationInfo bundleURL](self, "bundleURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDApplicationInfo bundleURL](v7, "bundleURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = HMFEqualObjects();

      }
      else
      {
        v10 = 1;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
}

@end
