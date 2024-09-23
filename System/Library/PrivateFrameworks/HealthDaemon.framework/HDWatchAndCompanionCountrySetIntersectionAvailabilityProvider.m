@implementation HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider

- (HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider)initWithAllowedCountriesDataSource:(id)a3 profile:(id)a4 featureCapability:(id)a5 loggingCategory:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "daemon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "behavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isAppleWatch");

  v17 = -[HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider initWithAllowedCountriesDataSource:profile:featureCapability:reloadsLocalCountrySetOnRemoteCountrySetUpdate:loggingCategory:](self, "initWithAllowedCountriesDataSource:profile:featureCapability:reloadsLocalCountrySetOnRemoteCountrySetUpdate:loggingCategory:", v13, v12, v11, v16, v10);
  return v17;
}

- (HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider)initWithAllowedCountriesDataSource:(id)a3 profile:(id)a4 featureCapability:(id)a5 reloadsLocalCountrySetOnRemoteCountrySetUpdate:(BOOL)a6 loggingCategory:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider *v17;
  HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider *v18;
  void *v19;
  uint64_t v20;
  HDPairedDeviceCapabilityProviding *pairedDeviceCapabilityProvider;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider;
  v17 = -[HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_allowedCountriesDataSource, a3);
    objc_storeWeak((id *)&v18->_profile, v14);
    objc_msgSend(v14, "daemon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "nanoRegistryDeviceCapabilityProvider");
    v20 = objc_claimAutoreleasedReturnValue();
    pairedDeviceCapabilityProvider = v18->_pairedDeviceCapabilityProvider;
    v18->_pairedDeviceCapabilityProvider = (HDPairedDeviceCapabilityProviding *)v20;

    objc_storeStrong((id *)&v18->_featureCapability, a5);
    v18->_reloadsLocalCountrySetOnRemoteCountrySetUpdate = a6;
    objc_storeStrong((id *)&v18->_loggingCategory, a7);
    -[HDAllowedCountriesDataSource setDelegate:](v18->_allowedCountriesDataSource, "setDelegate:", v18);
  }

  return v18;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HDAllowedCountriesDataSource featureIdentifier](self->_allowedCountriesDataSource, "featureIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)onboardingEligibilityForCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider regionAvailability](self, "regionAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "onboardingEligibilityForCountryCode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 device:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider regionAvailabilityForDevice:](self, "regionAvailabilityForDevice:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "onboardingEligibilityForCountryCode:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)regionAvailability
{
  void *v3;
  void *v4;

  -[HDPairedDeviceCapabilityProviding activePairedDevice](self->_pairedDeviceCapabilityProvider, "activePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider regionAvailabilityForDevice:](self, "regionAvailabilityForDevice:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)regionAvailabilityForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSUUID *featureCapability;
  void *v10;

  v4 = a3;
  -[HDAllowedCountriesDataSource localCountrySet](self->_allowedCountriesDataSource, "localCountrySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HDAllowedCountriesDataSource remoteCountrySetForDevice:](self->_allowedCountriesDataSource, "remoteCountrySetForDevice:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB62A8], "allowedCountriesInIntersectionOfLocalSet:remoteSet:", v5, v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      featureCapability = self->_featureCapability;
      if (featureCapability
        && (-[HDPairedDeviceCapabilityProviding isCapabilitySupported:onDevice:](self->_pairedDeviceCapabilityProvider, "isCapabilitySupported:onDevice:", featureCapability, v4) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB62A8], "capabilityNotSupportedOnRemoteDevice:", v5);
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB62A8], "allowedCountriesInIntersectionOfLocalAndRemoteSetPendingSync:", v5);
        v7 = objc_claimAutoreleasedReturnValue();
      }
    }
    v8 = (void *)v7;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB62A8], "noRemoteDevice:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB6AC8], "allowedInSomeCountries:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)allowedCountriesDataSourceDidUpdateLocalCountrySet:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "regionAvailabilityProvidingDidUpdate:", self);

}

- (void)allowedCountriesDataSourceDidUpdateActiveRemoteCountrySet:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *loggingCategory;
  _BOOL4 v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  HDAllowedCountriesDataSource *allowedCountriesDataSource;
  id WeakRetained;
  id v21;
  _BYTE buf[24];
  void *v23;
  HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider *v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_reloadsLocalCountrySetOnRemoteCountrySetUpdate)
  {
    -[HDAllowedCountriesDataSource activeRemoteCountrySet](self->_allowedCountriesDataSource, "activeRemoteCountrySet", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = objc_msgSend(v4, "contentVersion");
      v21 = 0;
      -[HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider _lastContentVersionDuringReloadAttemptDomain]((uint64_t)self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDAllowedCountriesDataSource featureIdentifier](self->_allowedCountriesDataSource, "featureIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberForKey:error:", v8, &v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v21;
      v11 = v10;
      if (v9 || !v10)
      {
        v13 = objc_msgSend(v9, "integerValue") < v6;
      }
      else
      {
        _HKInitializeLogging();
        loggingCategory = self->_loggingCategory;
        if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v11;
          _os_log_error_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Could not read last content version to determine reload attempt eligibility: %{public}@", buf, 0x16u);
        }
        v13 = 0;
      }

      _HKInitializeLogging();
      v17 = self->_loggingCategory;
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v18)
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = self;
          _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting reload of local country set", buf, 0xCu);
        }
        allowedCountriesDataSource = self->_allowedCountriesDataSource;
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __87__HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider__reloadLocalCountrySet__block_invoke;
        v23 = &unk_1E6CF5708;
        v24 = self;
        v25 = v6;
        -[HDAllowedCountriesDataSource reloadLocalCountrySetWithCompletion:](allowedCountriesDataSource, "reloadLocalCountrySetWithCompletion:", buf);
        goto LABEL_18;
      }
      if (v18)
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        v15 = "[%{public}@] Skipping reload of local country set: already attempted for current remote country set version";
        v16 = v17;
        goto LABEL_17;
      }
    }
    else
    {
      _HKInitializeLogging();
      v14 = self->_loggingCategory;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        v15 = "[%{public}@] Skipping reload of local country set due to missing remote country set";
        v16 = v14;
LABEL_17:
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      }
    }
LABEL_18:

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "regionAvailabilityProvidingDidUpdate:", self);

}

void __87__HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider__reloadLocalCountrySet__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v16 = 0;
      -[HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider _lastContentVersionDuringReloadAttemptDomain](v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v6 + 8), "featureIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "setNumber:forKey:error:", v9, v10, &v16);

      v12 = v16;
      if ((v11 & 1) == 0)
      {
        _HKInitializeLogging();
        v13 = *(NSObject **)(v6 + 48);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v18 = v6;
          v19 = 2114;
          v20 = v12;
          _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting last content version: %{public}@", buf, 0x16u);
        }
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(NSObject **)(v14 + 48);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2114;
      v20 = v5;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to initiate local country set reload: %{public}@", buf, 0x16u);
    }
  }

}

+ (id)lastContentVersionDuringReloadAttemptDomainForProfile:(id)a3
{
  id v3;
  HDKeyValueDomain *v4;

  v3 = a3;
  v4 = -[HDKeyValueDomain initWithCategory:domainName:profile:]([HDKeyValueDomain alloc], "initWithCategory:domainName:profile:", 0, CFSTR("HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider_LastContentVersionDuringReloadAttempt"), v3);

  return v4;
}

- (id)_lastContentVersionDuringReloadAttemptDomain
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  objc_msgSend(v2, "lastContentVersionDuringReloadAttemptDomainForProfile:", WeakRetained);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HDRegionAvailabilityProvidingDelegate)delegate
{
  return (HDRegionAvailabilityProvidingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_featureCapability, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapabilityProvider, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_allowedCountriesDataSource, 0);
}

@end
