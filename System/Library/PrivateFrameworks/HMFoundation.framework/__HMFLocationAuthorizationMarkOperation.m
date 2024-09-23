@implementation __HMFLocationAuthorizationMarkOperation

+ (id)logCategory
{
  if (_MergedGlobals_52 != -1)
    dispatch_once(&_MergedGlobals_52, &__block_literal_global);
  return (id)qword_1ED0130B8;
}

- (void)main
{
  void *v3;
  void *v4;
  __HMFLocationAuthorizationMarkOperation *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[__HMFLocationManagerOperation manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1A1AC355C]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_INFO, "%{public}@Marking as having received location", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "markAsHavingReceivedLocation");
    -[HMFOperation finish](v5, "finish");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_ERROR, "%{public}@Missing internal location manager", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 11, CFSTR("Unexpected internal state."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFOperation cancelWithError:](v5, "cancelWithError:", v10);

  }
}

@end
