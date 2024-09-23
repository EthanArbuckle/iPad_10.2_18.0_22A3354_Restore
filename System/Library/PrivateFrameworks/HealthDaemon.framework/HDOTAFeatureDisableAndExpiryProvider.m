@implementation HDOTAFeatureDisableAndExpiryProvider

- (HDOTAFeatureDisableAndExpiryProvider)initWithDaemon:(id)a3 featureIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *loggingCategory;
  void *v9;
  void *v10;
  HDOTAFeatureDisableAndExpiryProvider *v11;
  uint8_t buf[4];
  HDOTAFeatureDisableAndExpiryProvider *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v6;
    _os_log_debug_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEBUG, "[%{public}@] Initializing with a featureIdentifier: %{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Disable%@"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expire%@"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDOTAFeatureDisableAndExpiryProvider initWithDaemon:remoteDisableCondition:seedExpirationCondition:](self, "initWithDaemon:remoteDisableCondition:seedExpirationCondition:", v7, v9, v10);

  return v11;
}

- (HDOTAFeatureDisableAndExpiryProvider)initWithDaemon:(id)a3 remoteDisableCondition:(id)a4 seedExpirationCondition:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDOTAFeatureDisableAndExpiryProvider *v11;
  uint64_t v12;
  NSString *remoteDisableCondition;
  uint64_t v14;
  NSString *seedExpirationCondition;
  uint64_t v16;
  OS_os_log *loggingCategory;
  uint64_t v18;
  HDOTAFeatureAvailabilityManager *OTAFeatureAvailabilityManager;
  uint64_t v20;
  HDPairedDeviceCapabilityProviding *nanoRegistryDeviceCapabilityProvider;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HDOTAFeatureDisableAndExpiryProvider;
  v11 = -[HDOTAFeatureDisableAndExpiryProvider init](&v23, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    remoteDisableCondition = v11->_remoteDisableCondition;
    v11->_remoteDisableCondition = (NSString *)v12;

    v14 = objc_msgSend(v10, "copy");
    seedExpirationCondition = v11->_seedExpirationCondition;
    v11->_seedExpirationCondition = (NSString *)v14;

    HKLogInfrastructure();
    v16 = objc_claimAutoreleasedReturnValue();
    loggingCategory = v11->_loggingCategory;
    v11->_loggingCategory = (OS_os_log *)v16;

    objc_msgSend(v8, "OTAFeatureAvailabilityManager");
    v18 = objc_claimAutoreleasedReturnValue();
    OTAFeatureAvailabilityManager = v11->_OTAFeatureAvailabilityManager;
    v11->_OTAFeatureAvailabilityManager = (HDOTAFeatureAvailabilityManager *)v18;

    objc_msgSend(v8, "nanoRegistryDeviceCapabilityProvider");
    v20 = objc_claimAutoreleasedReturnValue();
    nanoRegistryDeviceCapabilityProvider = v11->_nanoRegistryDeviceCapabilityProvider;
    v11->_nanoRegistryDeviceCapabilityProvider = (HDPairedDeviceCapabilityProviding *)v20;

    -[HDOTAFeatureAvailabilityManager registerObserver:queue:](v11->_OTAFeatureAvailabilityManager, "registerObserver:queue:", v11, 0);
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@|%@"), objc_opt_class(), self->_remoteDisableCondition, self->_seedExpirationCondition);
}

- (id)rescindedStatusOnActivePairedDeviceForCountryCode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (self)
  {
    -[HDPairedDeviceCapabilityProviding activePairedDevice](self->_nanoRegistryDeviceCapabilityProvider, "activePairedDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[HDOTAFeatureDisableAndExpiryProvider rescindedStatusForCountryCode:device:error:](self, "rescindedStatusForCountryCode:device:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)rescindedStatusForCountryCode:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  HDWatchRemoteFeatureAvailabilityDataSource *v10;
  HDOTAFeatureAvailabilityManager *OTAFeatureAvailabilityManager;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSString *seedExpirationCondition;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *loggingCategory;
  void *v27;
  void *v28;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *log;
  id v36;
  uint8_t buf[4];
  HDOTAFeatureDisableAndExpiryProvider *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[HDWatchRemoteFeatureAvailabilityDataSource initWithDevice:]([HDWatchRemoteFeatureAvailabilityDataSource alloc], "initWithDevice:", v9);

  -[HDWatchRemoteFeatureAvailabilityDataSource setOnboardingCountryCode:](v10, "setOnboardingCountryCode:", v8);
  OTAFeatureAvailabilityManager = self->_OTAFeatureAvailabilityManager;
  v36 = 0;
  -[HDOTAFeatureAvailabilityManager disableAndExpiryConditionsDictionaryWithError:](OTAFeatureAvailabilityManager, "disableAndExpiryConditionsDictionaryWithError:", &v36);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v36;
  v14 = v13;
  if (v12)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB6AD0]);
    v16 = (void *)MEMORY[0x1E0C99E60];
    seedExpirationCondition = self->_seedExpirationCondition;
    v45[0] = self->_remoteDisableCondition;
    v45[1] = seedExpirationCondition;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v15, "initWithRawValue:dataSource:supportedConditions:", v12, v10, v19);

    objc_msgSend(v20, "evaluateAll");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", self->_remoteDisableCondition);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v21, "objectForKeyedSubscript:", self->_seedExpirationCondition);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLValue");

    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEBUG))
    {
      v33 = (void *)MEMORY[0x1E0CB37E8];
      log = loggingCategory;
      objc_msgSend(v33, "numberWithBool:", v23);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25);
      v31 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v38 = self;
      v39 = 2112;
      v40 = v8;
      v41 = 2112;
      v42 = v34;
      v43 = 2112;
      v44 = v31;
      v32 = (void *)v31;
      _os_log_debug_impl(&dword_1B7802000, log, OS_LOG_TYPE_DEBUG, "[%{public}@] rescindedStatusForCountryCode: %@ -> (isDisabled: %@, isExpired: %@)", buf, 0x2Au);

    }
    v27 = &unk_1E6DFE420;
    if ((_DWORD)v23)
      v27 = &unk_1E6DFE450;
    if ((_DWORD)v25)
      v28 = &unk_1E6DFE438;
    else
      v28 = v27;

    goto LABEL_10;
  }
  if ((objc_msgSend(v13, "hk_isHealthKitErrorWithCode:", 11) & 1) != 0)
  {
    v28 = &unk_1E6DFE420;
    goto LABEL_11;
  }
  v30 = v14;
  v20 = v30;
  if (!v30)
    goto LABEL_18;
  if (!a5)
  {
    _HKLogDroppedError();
LABEL_18:
    v28 = 0;
    goto LABEL_10;
  }
  v20 = objc_retainAutorelease(v30);
  v28 = 0;
  *a5 = v20;
LABEL_10:

LABEL_11:
  return v28;
}

- (void)OTAFeatureAvailabilityManagerDidUpdateFeatureAvailabilityInfo:(id)a3
{
  id v4;

  -[HDOTAFeatureDisableAndExpiryProvider delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disableAndExpiryProviderDidUpdate:", self);

}

- (HDFeatureDisableAndExpiryProvidingDelegate)delegate
{
  return (HDFeatureDisableAndExpiryProvidingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_OTAFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_nanoRegistryDeviceCapabilityProvider, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_seedExpirationCondition, 0);
  objc_storeStrong((id *)&self->_remoteDisableCondition, 0);
}

@end
