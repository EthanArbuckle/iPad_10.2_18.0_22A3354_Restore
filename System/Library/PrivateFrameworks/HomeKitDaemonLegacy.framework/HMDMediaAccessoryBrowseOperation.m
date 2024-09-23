@implementation HMDMediaAccessoryBrowseOperation

- (HMDMediaAccessoryBrowseOperation)initWithAccessoryIdentifier:(id)a3
{
  return -[HMDMediaAccessoryBrowseOperation initWithAccessoryIdentifier:timeout:](self, "initWithAccessoryIdentifier:timeout:", a3, 0.0);
}

- (HMDMediaAccessoryBrowseOperation)initWithAccessoryIdentifier:(id)a3 timeout:(double)a4
{
  id v6;
  double v7;
  HMDMediaAccessoryBrowseOperation *v8;
  HMDMediaAccessoryBrowseOperation *v9;
  uint64_t v10;
  NSString *accessoryIdentifier;
  HMDMediaAccessoryBrowseOperation *v12;
  HMDMediaAccessoryBrowseOperation *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    if (a4 <= 0.0)
    {
      +[HMDMediaAccessoryBrowseOperation defaultTimeout](HMDMediaAccessoryBrowseOperation, "defaultTimeout");
      a4 = v7;
    }
    v18.receiver = self;
    v18.super_class = (Class)HMDMediaAccessoryBrowseOperation;
    v8 = -[HMFOperation initWithTimeout:](&v18, sel_initWithTimeout_, a4);
    v9 = v8;
    if (v8)
    {
      v8->_endpointFeatures = -1;
      v10 = objc_msgSend(v6, "copy");
      accessoryIdentifier = v9->_accessoryIdentifier;
      v9->_accessoryIdentifier = (NSString *)v10;

    }
    v12 = v9;
    v13 = v12;
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to create reconnaissance session with nil identifier", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  void *session;
  objc_super v4;

  session = self->_session;
  if (session)
    CFRelease(session);
  v4.receiver = self;
  v4.super_class = (Class)HMDMediaAccessoryBrowseOperation;
  -[HMDMediaAccessoryBrowseOperation dealloc](&v4, sel_dealloc);
}

- (unsigned)endpointFeatures
{
  HMDMediaAccessoryBrowseOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LODWORD(v2) = v2->_endpointFeatures;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)setEndpointFeatures:(unsigned int)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_endpointFeatures = a3;
  os_unfair_lock_unlock(p_lock);
}

- (HMDMediaEndpoint)endpoint
{
  os_unfair_lock_s *p_lock;
  HMDMediaEndpoint *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_endpoint;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)outputDevices
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_outputDevices;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)main
{
  unsigned int v3;
  unsigned int v4;
  void *v5;
  HMDMediaAccessoryBrowseOperation *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  NSString *accessoryIdentifier;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[HMDMediaAccessoryBrowseOperation endpointFeatures](self, "endpointFeatures");
  if (v3 != -1)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      v16 = 1024;
      v17 = v4;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting features: %u", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v5);
  }
  accessoryIdentifier = self->_accessoryIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &accessoryIdentifier, 1);
  -[HMDMediaAccessoryBrowseOperation endpointFeatures](self, "endpointFeatures");
  self->_session = (void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();
  objc_initWeak((id *)buf, self);
  -[HMFOperation timeoutDate](self, "timeoutDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceNow");
  v11 = v10;

  if (v11 <= 0.0)
    +[HMDMediaAccessoryBrowseOperation defaultTimeout](HMDMediaAccessoryBrowseOperation, "defaultTimeout");
  objc_copyWeak(&v12, (id *)buf);
  MRAVReconnaissanceSessionBeginSearch();
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDMediaAccessoryBrowseOperation;
  -[HMFOperation cancel](&v3, sel_cancel);
  if (self->_session)
    MEMORY[0x1D17B91F4]();
}

- (NSString)accessoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 352, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

void __40__HMDMediaAccessoryBrowseOperation_main__block_invoke(uint64_t a1, const __CFArray *a2, uint64_t a3, void *a4)
{
  char *WeakRetained;
  char *v8;
  HMDMediaEndpoint *v9;
  CFIndex Count;
  CFIndex v11;
  void *v12;
  CFIndex v13;
  void **p_cache;
  int *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;
  NSObject *v22;
  const __CFArray *v23;
  char *v24;
  void **v25;
  void *v26;
  void *v27;
  void *v28;
  char *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDMediaEndpoint *v34;
  CFIndex v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "isExecuting"))
  {
    if (a3)
    {
      v9 = -[HMDMediaEndpoint initWithEndpoint:]([HMDMediaEndpoint alloc], "initWithEndpoint:", a3);
      if (!a2)
        goto LABEL_16;
    }
    else
    {
      v9 = 0;
      if (!a2)
        goto LABEL_16;
    }
    Count = CFArrayGetCount(a2);
    if (Count < 1)
    {
      a2 = 0;
      if (v9)
        goto LABEL_22;
LABEL_17:
      if (!-[__CFArray count](a2, "count"))
      {
        v28 = (void *)MEMORY[0x1D17BA0A0]();
        v29 = v8;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v31;
          v38 = 2112;
          v39 = a4;
          _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to find accessory with error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v28);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, 0, 0, 0, a4);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "cancelWithError:", v32);

        goto LABEL_23;
      }
LABEL_22:
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)v8 + 42, v9);
      objc_storeStrong((id *)v8 + 43, a2);
      os_unfair_lock_unlock((os_unfair_lock_t)v8 + 78);
      objc_msgSend(v8, "finish");
LABEL_23:

      goto LABEL_24;
    }
    v11 = Count;
    v33 = a4;
    v34 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    p_cache = HMDCameraVideoTierParameters.cache;
    v15 = &OBJC_IVAR___HMDConfigurationLogEvent__totalThirdPartyMediaCategoryBitMask;
    v35 = v11;
    do
    {
      v16 = (void *)objc_msgSend(objc_alloc((Class)(p_cache + 238)), "initWithOutputDevice:", CFArrayGetValueAtIndex(a2, v13));
      v17 = v16;
      if (v16)
      {
        v18 = *(void **)&v8[v15[801]];
        objc_msgSend(v16, "uniqueIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v18) = objc_msgSend(v18, "isEqualToString:", v19);

        if ((_DWORD)v18)
        {
          v20 = (void *)MEMORY[0x1D17BA0A0]();
          v21 = v8;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v23 = a2;
            v24 = v8;
            v25 = p_cache;
            v26 = v12;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v37 = v27;
            v38 = 2112;
            v39 = v17;
            _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Found output device: %@", buf, 0x16u);

            v12 = v26;
            p_cache = v25;
            v8 = v24;
            a2 = v23;
            v11 = v35;
          }

          objc_autoreleasePoolPop(v20);
          objc_msgSend(v12, "addObject:", v17);
          v15 = &OBJC_IVAR___HMDConfigurationLogEvent__totalThirdPartyMediaCategoryBitMask;
        }
      }

      ++v13;
    }
    while (v11 != v13);
    a2 = (const __CFArray *)objc_msgSend(v12, "copy");

    a4 = v33;
    v9 = v34;
LABEL_16:
    if (v9)
      goto LABEL_22;
    goto LABEL_17;
  }
LABEL_24:

}

+ (double)defaultTimeout
{
  if (defaultTimeout_onceToken != -1)
    dispatch_once(&defaultTimeout_onceToken, &__block_literal_global_43875);
  return *(double *)&defaultTimeout_timeout;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_43870 != -1)
    dispatch_once(&logCategory__hmf_once_t9_43870, &__block_literal_global_13_43871);
  return (id)logCategory__hmf_once_v10_43872;
}

void __47__HMDMediaAccessoryBrowseOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_43872;
  logCategory__hmf_once_v10_43872 = v0;

}

void __50__HMDMediaAccessoryBrowseOperation_defaultTimeout__block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  BOOL v3;
  double v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferenceForKey:", CFSTR("mediaAccessoryResolutionTimeout"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v3 = fabs(v2) < 2.22044605e-16 || v2 <= 0.0;
  v4 = v2 + 3.0;
  if (v3)
    v4 = 3.0;
  defaultTimeout_timeout = *(_QWORD *)&v4;

}

@end
