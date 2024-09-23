@implementation HDAllowedCountriesDataSourceWithLocalCountrySetFallback

- (HDAllowedCountriesDataSourceWithLocalCountrySetFallback)initWithDaemon:(id)a3 allowedCountriesDataSource:(id)a4 loggingCategory:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDAllowedCountriesDataSourceWithLocalCountrySetFallback *v11;
  HDAllowedCountriesDataSourceWithLocalCountrySetFallback *v12;
  uint64_t v13;
  HDPairedDeviceCapabilityProviding *pairedDeviceCapabilityProvider;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDAllowedCountriesDataSourceWithLocalCountrySetFallback;
  v11 = -[HDAllowedCountriesDataSourceWithLocalCountrySetFallback init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_allowedCountriesDataSource, a4);
    objc_msgSend(v8, "nanoRegistryDeviceCapabilityProvider");
    v13 = objc_claimAutoreleasedReturnValue();
    pairedDeviceCapabilityProvider = v12->_pairedDeviceCapabilityProvider;
    v12->_pairedDeviceCapabilityProvider = (HDPairedDeviceCapabilityProviding *)v13;

    objc_storeStrong((id *)&v12->_loggingCategory, a5);
  }

  return v12;
}

- (HDAllowedCountriesDataSourceObserver)delegate
{
  return (HDAllowedCountriesDataSourceObserver *)-[HDAllowedCountriesDataSource delegate](self->_allowedCountriesDataSource, "delegate");
}

- (void)setDelegate:(id)a3
{
  -[HDAllowedCountriesDataSource setDelegate:](self->_allowedCountriesDataSource, "setDelegate:", a3);
}

- (NSString)featureIdentifier
{
  return (NSString *)-[HDAllowedCountriesDataSource featureIdentifier](self->_allowedCountriesDataSource, "featureIdentifier");
}

- (HKCountrySet)localCountrySet
{
  return (HKCountrySet *)-[HDAllowedCountriesDataSource localCountrySet](self->_allowedCountriesDataSource, "localCountrySet");
}

- (HKCountrySet)activeRemoteCountrySet
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *loggingCategory;
  _BOOL4 v8;
  int v10;
  HDAllowedCountriesDataSourceWithLocalCountrySetFallback *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HDAllowedCountriesDataSource activeRemoteCountrySet](self->_allowedCountriesDataSource, "activeRemoteCountrySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HDPairedDeviceCapabilityProviding activePairedDevice](self->_pairedDeviceCapabilityProvider, "activePairedDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    v8 = os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        v10 = 138543618;
        v11 = self;
        v12 = 2114;
        v13 = v6;
        _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Returning local device availability for paired device %{public}@", (uint8_t *)&v10, 0x16u);
      }
      -[HDAllowedCountriesDataSourceWithLocalCountrySetFallback localCountrySet](self, "localCountrySet");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v8)
      {
        v10 = 138543362;
        v11 = self;
        _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] No active paired device found", (uint8_t *)&v10, 0xCu);
      }
      v5 = 0;
    }

  }
  return (HKCountrySet *)v5;
}

- (id)remoteCountrySetForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *loggingCategory;
  void *v9;
  int v11;
  HDAllowedCountriesDataSourceWithLocalCountrySetFallback *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDAllowedCountriesDataSource remoteCountrySetForDevice:](self->_allowedCountriesDataSource, "remoteCountrySetForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Returning local device availability for paired device %{public}@", (uint8_t *)&v11, 0x16u);
    }
    -[HDAllowedCountriesDataSourceWithLocalCountrySetFallback localCountrySet](self, "localCountrySet");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  return v9;
}

- (void)reloadLocalCountrySetWithCompletion:(id)a3
{
  -[HDAllowedCountriesDataSource reloadLocalCountrySetWithCompletion:](self->_allowedCountriesDataSource, "reloadLocalCountrySetWithCompletion:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapabilityProvider, 0);
  objc_storeStrong((id *)&self->_allowedCountriesDataSource, 0);
}

@end
