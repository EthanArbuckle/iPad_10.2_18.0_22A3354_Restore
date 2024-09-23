@implementation HMDApplicationInfo

- (NSData)vendorIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  if (-[HMDApplicationInfo isEntitledForSPIAccess](self, "isEntitledForSPIAccess"))
  {
    +[HMDApplicationInfo privateVendorIdentifier](HMDApplicationInfo, "privateVendorIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[HMDApplicationVendorIDStore sharedStore](HMDApplicationVendorIDStore, "sharedStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDApplicationInfo bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vendorIDForApplication:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSData *)v3;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDApplicationInfo bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Bundle Identifier"), v4);
  v12[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDApplicationInfo vendorIdentifier](self, "vendorIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F250], "defaultFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:options:formatter:", CFSTR("Vendor Identifier"), v7, 1, v8);
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (NSData)privateVendorIdentifier
{
  return (NSData *)objc_msgSend(CFSTR("29E1AAEC-B83A-445E-920E-582C3E9DFF99"), "dataUsingEncoding:", 4);
}

- (NSURL)bundleURL
{
  NSURL *bundleURL;
  void *v4;
  void *v5;
  void *v6;
  NSURL *v7;
  NSURL *v8;

  bundleURL = self->_bundleURL;
  if (!bundleURL)
  {
    v4 = (void *)MEMORY[0x24BDD1488];
    -[HMDApplicationInfo bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "bundleURL");
    v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v8 = self->_bundleURL;
    self->_bundleURL = v7;

    bundleURL = self->_bundleURL;
  }
  return bundleURL;
}

+ (id)applicationInfoForBundleURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  __HMDApplicationInfo *v14;
  void *v15;
  __HMDApplicationInfo *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithURL:error:", v4, 0);
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v9;
      v21 = 2112;
      v22 = v4;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Initializing application info with URL: %@, extension: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v18 = 0;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithURL:allowPlaceholder:error:", v4, 0, &v18);
    v11 = v18;
    objc_msgSend(v10, "applicationState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isValid");

    if (v13)
    {
      v14 = [__HMDApplicationInfo alloc];
      v15 = v10;
    }
    else
    {
      if (!v5)
      {
        v16 = 0;
        goto LABEL_10;
      }
      v14 = [__HMDExtensionApplicationInfo alloc];
      v15 = v5;
    }
    v16 = -[__HMDApplicationInfo initWithRecord:](v14, "initWithRecord:", v15);
LABEL_10:

    goto LABEL_11;
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (void)removeProcess:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    -[NSHashTable removeObject:](self->_processes, "removeObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_117052 != -1)
    dispatch_once(&logCategory__hmf_once_t6_117052, &__block_literal_global_117053);
  return (id)logCategory__hmf_once_v7_117054;
}

- (NSArray)processes
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSHashTable allObjects](self->_processes, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)clientIdentifierSalt:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;

  if (!-[HMDApplicationInfo isEntitledForSPIAccess](self, "isEntitledForSPIAccess"))
  {
    -[HMDApplicationInfo vendorIdentifier](self, "vendorIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[HMDHomeManager createIdentifierSalt:deviceSpecific:](HMDHomeManager, "createIdentifierSalt:deviceSpecific:", v6, 1);
      v7 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v7;
      if (!a3 || v7)
        goto LABEL_11;
      v8 = CFSTR("Unable to generate device specific salt.");
    }
    else
    {
      if (!a3)
      {
        v5 = 0;
        goto LABEL_11;
      }
      v8 = CFSTR("Unable to determine vendor identifier.");
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, 0, v8, 0);
    v5 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    return v5;
  }
  +[HMDProcessInfo privateClientIdentifierSalt](HMDProcessInfo, "privateClientIdentifierSalt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

void __33__HMDApplicationInfo_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_117054;
  logCategory__hmf_once_v7_117054 = v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (HMDApplicationInfo)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDApplicationInfo)initWithBundleIdentifier:(id)a3 bundleURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDApplicationInfo *v9;
  uint64_t v10;
  NSURL *bundleURL;
  uint64_t v12;
  NSString *bundleIdentifier;
  uint64_t v14;
  NSHashTable *processes;
  HMDApplicationInfo *v17;
  SEL v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    v19.receiver = self;
    v19.super_class = (Class)HMDApplicationInfo;
    v9 = -[HMDApplicationInfo init](&v19, sel_init);
    if (v9)
    {
      v10 = objc_msgSend(v8, "copy");
      bundleURL = v9->_bundleURL;
      v9->_bundleURL = (NSURL *)v10;

      v12 = objc_msgSend(v6, "copy");
      bundleIdentifier = v9->_bundleIdentifier;
      v9->_bundleIdentifier = (NSString *)v12;

      v9->_independent = 1;
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v14 = objc_claimAutoreleasedReturnValue();
      processes = v9->_processes;
      v9->_processes = (NSHashTable *)v14;

    }
    return v9;
  }
  else
  {
    v17 = (HMDApplicationInfo *)_HMFPreconditionFailure();
    return (HMDApplicationInfo *)-[HMDApplicationInfo hash](v17, v18);
  }
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDApplicationInfo bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDApplicationInfo *v4;
  HMDApplicationInfo *v5;
  HMDApplicationInfo *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDApplicationInfo *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDApplicationInfo bundleIdentifier](self, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDApplicationInfo bundleIdentifier](v6, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDApplicationInfo bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Application %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDApplicationInfo)hostApplicationInfo
{
  return 0;
}

- (BOOL)isInstalled
{
  return 0;
}

- (BOOL)isEntitledForAPIAccess
{
  return 0;
}

- (BOOL)isEntitledForSPIAccess
{
  return 0;
}

- (void)addProcess:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    -[NSHashTable addObject:](self->_processes, "addObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

+ (id)applicationInfoForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  __HMDApplicationInfo *v14;
  void *v15;
  __HMDApplicationInfo *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v4, 0);
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v9;
      v21 = 2112;
      v22 = v4;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Initializing application info with URL: %@, extension: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v18 = 0;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v18);
    v11 = v18;
    objc_msgSend(v10, "applicationState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isValid");

    if (v13)
    {
      v14 = [__HMDApplicationInfo alloc];
      v15 = v10;
    }
    else
    {
      if (!v5)
      {
        v16 = 0;
        goto LABEL_10;
      }
      v14 = [__HMDExtensionApplicationInfo alloc];
      v15 = v5;
    }
    v16 = -[__HMDApplicationInfo initWithRecord:](v14, "initWithRecord:", v15);
LABEL_10:

    goto LABEL_11;
  }
  v16 = 0;
LABEL_11:

  return v16;
}

@end
