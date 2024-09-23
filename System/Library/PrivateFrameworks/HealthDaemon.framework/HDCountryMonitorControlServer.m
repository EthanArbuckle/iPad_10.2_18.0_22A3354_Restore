@implementation HDCountryMonitorControlServer

- (void)remote_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:(id)a3
{
  id v4;
  HDOTAFeatureAvailabilityManager *OTAFeatureAvailabilityManager;
  HDPeriodicCountryMonitor *countryMonitor;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  OTAFeatureAvailabilityManager = self->_OTAFeatureAvailabilityManager;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99__HDCountryMonitorControlServer_remote_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke;
  v8[3] = &unk_1E6CE77C8;
  v8[4] = self;
  -[HDOTAFeatureAvailabilityManager downloadWithCompletion:](OTAFeatureAvailabilityManager, "downloadWithCompletion:", v8);
  countryMonitor = self->_countryMonitor;
  if (countryMonitor)
  {
    -[HDPeriodicCountryMonitor fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:](countryMonitor, "fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 110, CFSTR("Country monitoring not available"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v7);

  }
}

void __99__HDCountryMonitorControlServer_remote_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543618;
      v8 = (id)objc_opt_class();
      v9 = 2114;
      v10 = v4;
      v6 = v8;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Error performing immediate download: %{public}@", (uint8_t *)&v7, 0x16u);

    }
  }

}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HDPeriodicCountryMonitor *v15;
  HDCountryMonitorControlServer *v16;
  HDPeriodicCountryMonitor *countryMonitor;
  HDPeriodicCountryMonitor *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HDOTAFeatureAvailabilityManager *OTAFeatureAvailabilityManager;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "periodicCountryMonitor");
  v15 = (HDPeriodicCountryMonitor *)objc_claimAutoreleasedReturnValue();

  v16 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:]([HDCountryMonitorControlServer alloc], "initWithUUID:configuration:client:delegate:", v13, v12, v11, v10);
  countryMonitor = v16->_countryMonitor;
  v16->_countryMonitor = v15;
  v18 = v15;

  objc_msgSend(v11, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "daemon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "OTAFeatureAvailabilityManager");
  v21 = objc_claimAutoreleasedReturnValue();
  OTAFeatureAvailabilityManager = v16->_OTAFeatureAvailabilityManager;
  v16->_OTAFeatureAvailabilityManager = (HDOTAFeatureAvailabilityManager *)v21;

  return v16;
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6530], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OTAFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_countryMonitor, 0);
}

@end
