@implementation HMDMicroLocationLogEventObserver

- (HMDMicroLocationLogEventObserver)initWithDataSource:(id)a3 microLocationManager:(id)a4
{
  id v6;
  id v7;
  HMDMicroLocationLogEventObserver *v8;
  HMDMicroLocationLogEventObserver *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDMicroLocationLogEventObserver;
  v8 = -[HMDMicroLocationLogEventObserver init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeStrong((id *)&v9->_microLocationManager, a4);
  }

  return v9;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  int v4;
  int v5;
  int v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id Property;
  id v11;
  id v12;

  v12 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v12, "shouldTriggerMicroLocationRecordingScanForLogEventObserver:", self);
    v5 = objc_msgSend(v12, "shouldTriggerMicroLocationLocalizationScanForLogEventObserver:", self);
    v6 = v5;
    if ((v4 & 1) != 0 || v5)
    {
      objc_msgSend(v12, "microLocationMetadataForLogEventObserver:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "microLocationScanTriggerTypeForLogEventObserver:", self);
      if (v6)
      {
        if (self)
          Property = objc_getProperty(self, v8, 8, 1);
        else
          Property = 0;
        objc_msgSend(Property, "triggerThrottledMicroLocationLocalizationScanWithMetadata:triggerType:", v7, v9);
      }
      if (v4)
      {
        if (self)
          v11 = objc_getProperty(self, v8, 8, 1);
        else
          v11 = 0;
        objc_msgSend(v11, "triggerThrottledMicroLocationRecordingScanWithMetadata:triggerType:", v7, v9);
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_microLocationManager, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_3459 != -1)
    dispatch_once(&logCategory__hmf_once_t1_3459, &__block_literal_global_3460);
  return (id)logCategory__hmf_once_v2_3461;
}

void __47__HMDMicroLocationLogEventObserver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_3461;
  logCategory__hmf_once_v2_3461 = v0;

}

- (id)isEligibleForDonationWithHAPServiceType:(void *)a3 HAPCharacteristicType:
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  int v10;
  unsigned int v11;
  void *v12;
  id *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 2);
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "hapMetadataForMicroLocationLogEventObserver:", a1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("00000228-0000-1000-8000-0026BB765291")) & 1) != 0
        || (objc_msgSend(v9, "shouldFilterServiceOfTypeFromApp:", v5) & 1) == 0)
      {
        v10 = objc_msgSend(v9, "isStandardServiceType:", v5);
      }
      else
      {
        v10 = 0;
      }
      if ((objc_msgSend(v9, "shouldFilterCharacteristicOfTypeFromApp:", v6) & 1) != 0)
        v11 = 0;
      else
        v11 = objc_msgSend(v9, "isStandardCharacteristicType:", v6);
      a1 = (id *)(v10 & v11);

    }
    else
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = a1;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v15;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Event ineligible for donation because data source is nil", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      a1 = 0;
    }

  }
  return a1;
}

@end
