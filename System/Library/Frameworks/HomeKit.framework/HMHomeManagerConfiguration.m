@implementation HMHomeManagerConfiguration

- (HMFLocationAuthorization)locationAuthorization
{
  return (HMFLocationAuthorization *)objc_getProperty(self, a2, 40, 1);
}

- (NSURL)cacheURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)isAdaptive
{
  return self->_adaptive;
}

- (NSOperationQueue)delegateQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (HMHomeManagerConfiguration)initWithOptions:(unint64_t)a3 cachePolicy:(unint64_t)a4
{
  HMHomeManagerConfiguration *v6;
  HMHomeManagerConfiguration *v7;
  uint64_t v8;
  NSOperationQueue *delegateQueue;
  uint64_t v10;
  HMFLocationAuthorization *locationAuthorization;
  void *v12;
  uint64_t v13;
  NSURL *cacheURL;
  void *v15;
  HMHomeManagerConfiguration *v16;
  NSObject *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)HMHomeManagerConfiguration;
  v6 = -[HMHomeManagerConfiguration init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_cachePolicy = a4;
    v6->_options = a3;
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    delegateQueue = v7->_delegateQueue;
    v7->_delegateQueue = (NSOperationQueue *)v8;

    objc_msgSend(MEMORY[0x1E0D285B8], "sharedAuthorization");
    v10 = objc_claimAutoreleasedReturnValue();
    locationAuthorization = v7->_locationAuthorization;
    v7->_locationAuthorization = (HMFLocationAuthorization *)v10;

    if (-[HMHomeManagerConfiguration canUseCache](v7, "canUseCache")
      || -[HMHomeManagerConfiguration canWriteToCache](v7, "canWriteToCache"))
    {
      HMCreateConfigurationsCacheDirectory();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        cacheURL = v7->_cacheURL;
        v7->_cacheURL = (NSURL *)v13;

      }
      else
      {
        v15 = (void *)MEMORY[0x1A1AC1AAC]();
        v16 = v7;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v22 = v18;
          _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create the home configuration cache folder -- turning off the caching support", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v15);
        v7->_cachePolicy = 0;
      }

    }
  }
  return v7;
}

- (BOOL)canWriteToCache
{
  return -[HMHomeManagerConfiguration cachePolicy](self, "cachePolicy") == 3
      || -[HMHomeManagerConfiguration canUseCache](self, "canUseCache");
}

- (BOOL)canUseCache
{
  return -[HMHomeManagerConfiguration cachePolicy](self, "cachePolicy") - 1 < 2;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (BOOL)shouldConnect
{
  return -[HMHomeManagerConfiguration cachePolicy](self, "cachePolicy") != 2;
}

+ (id)defaultPrivateConfiguration
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptions:cachePolicy:", -1, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_locationAuthorization, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

- (HMHomeManagerConfiguration)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  __HMHomeManagerConfigurationCreateCopy(self, 1, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[8];

  v26[7] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  HMHomeManagerOptionsToString(-[HMHomeManagerConfiguration options](self, "options"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Options"), v25);
  v26[0] = v24;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  HMHomeManagerCachePolicyToString(-[HMHomeManagerConfiguration cachePolicy](self, "cachePolicy"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Cache Policy"), v23);
  v26[1] = v22;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeManagerConfiguration isDiscretionary](self, "isDiscretionary");
  HMFBooleanToString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Discretionary"), v21);
  v26[2] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeManagerConfiguration isAdaptive](self, "isAdaptive");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Adaptive"), v8);
  v26[3] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeManagerConfiguration delegateQueue](self, "delegateQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Delegate Queue"), v11);
  v26[4] = v12;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeManagerConfiguration locationAuthorization](self, "locationAuthorization");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Location Authorization"), v14);
  v26[5] = v15;
  v16 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeManagerConfiguration shouldConnect](self, "shouldConnect");
  HMFBooleanToString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("Should Connect"), v17);
  v26[6] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v19;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

+ (id)defaultConfiguration
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptions:cachePolicy:", -16385, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
