@implementation __HMDExtensionApplicationInfo

- (__HMDExtensionApplicationInfo)initWithRecord:(id)a3
{
  id v4;
  __HMDExtensionApplicationInfo *v5;
  void *v6;
  void *v7;
  __HMDExtensionApplicationInfo *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *bundleIdentifier;
  id v15;
  void *v16;
  id v17;
  void *v18;
  __HMDExtensionApplicationInfo *v19;
  NSObject *v20;
  void *v21;
  __HMDApplicationInfo *v22;
  HMDApplicationInfo *hostApplicationInfo;
  __HMDExtensionApplicationInfo *v24;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v26.receiver = self;
    v26.super_class = (Class)__HMDExtensionApplicationInfo;
    v5 = -[__HMDBundleApplicationInfo initWithRecord:](&v26, sel_initWithRecord_, v4);
    if (v5)
    {
      objc_msgSend(v4, "containingBundleRecord");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = v5;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "effectiveBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v28 = v10;
        v29 = 2112;
        v30 = v6;
        v31 = 2112;
        v32 = v11;
        v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@container: %@/ bundleID: %@, effective bundle id: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(v4, "bundleIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      bundleIdentifier = v8->super.super._bundleIdentifier;
      v8->super.super._bundleIdentifier = (NSString *)v13;

      v15 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      if (v17)
      {
        v18 = (void *)MEMORY[0x1D17BA0A0]();
        v19 = v8;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v21;
          v29 = 2112;
          v30 = v17;
          _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@host record: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v18);
        v22 = -[__HMDApplicationInfo initWithRecord:]([__HMDApplicationInfo alloc], "initWithRecord:", v17);
        hostApplicationInfo = v19->_hostApplicationInfo;
        v19->_hostApplicationInfo = &v22->super.super;

      }
    }
    self = v5;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)__HMDExtensionApplicationInfo;
  -[HMDApplicationInfo attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[__HMDExtensionApplicationInfo hostApplicationInfo](self, "hostApplicationInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Host Application"), v5);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  __HMDExtensionApplicationInfo *v4;
  __HMDExtensionApplicationInfo *v5;
  __HMDExtensionApplicationInfo *v6;
  __HMDExtensionApplicationInfo *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = (__HMDExtensionApplicationInfo *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)__HMDExtensionApplicationInfo;
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

- (id)vendorIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)__HMDExtensionApplicationInfo;
  -[HMDApplicationInfo vendorIdentifier](&v8, sel_vendorIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[__HMDExtensionApplicationInfo hostApplicationInfo](self, "hostApplicationInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vendorIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)isInstalled
{
  void *v2;
  void *v3;
  char v4;

  -[__HMDExtensionApplicationInfo hostApplicationInfo](self, "hostApplicationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isInstalled");
  else
    v4 = 1;

  return v4;
}

- (id)hostApplicationInfo
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostApplicationInfo, 0);
}

@end
