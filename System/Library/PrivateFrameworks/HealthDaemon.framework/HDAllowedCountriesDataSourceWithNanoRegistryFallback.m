@implementation HDAllowedCountriesDataSourceWithNanoRegistryFallback

- (HDAllowedCountriesDataSourceWithNanoRegistryFallback)initWithDaemon:(id)a3 allowedCountriesDataSource:(id)a4 availableRegionsDevicePropertyName:(id)a5 loggingCategory:(id)a6 shouldReturnLocalAvailabilityForNilDeviceRegions:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HDAllowedCountriesDataSourceWithNanoRegistryFallback *v16;
  HDAllowedCountriesDataSourceWithNanoRegistryFallback *v17;
  uint64_t v18;
  HDPairedDeviceCapabilityProviding *pairedDeviceCapabilityProvider;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HDAllowedCountriesDataSourceWithNanoRegistryFallback;
  v16 = -[HDAllowedCountriesDataSourceWithNanoRegistryFallback init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_allowedCountriesDataSource, a4);
    objc_msgSend(v12, "nanoRegistryDeviceCapabilityProvider");
    v18 = objc_claimAutoreleasedReturnValue();
    pairedDeviceCapabilityProvider = v17->_pairedDeviceCapabilityProvider;
    v17->_pairedDeviceCapabilityProvider = (HDPairedDeviceCapabilityProviding *)v18;

    objc_storeStrong((id *)&v17->_devicePropertyName, a5);
    objc_storeStrong((id *)&v17->_loggingCategory, a6);
    v17->_shouldReturnLocalAvailabilityForNilDeviceRegions = a7;
  }

  return v17;
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
  int v9;
  HDAllowedCountriesDataSourceWithNanoRegistryFallback *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
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
    if (v6)
    {
      -[HDAllowedCountriesDataSourceWithNanoRegistryFallback _nanoRegistryCountryListForDevice:]((uint64_t)self, v6);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = self;
        _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] No active paired device found", (uint8_t *)&v9, 0xCu);
      }
      v5 = 0;
    }

  }
  return (HKCountrySet *)v5;
}

- (id)_nanoRegistryCountryListForDevice:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "valueForProperty:", *(_QWORD *)(a1 + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6538]), "initWithDictionaryRepresentation:provenance:", v5, 2);
    }
    else
    {
      _HKInitializeLogging();
      v7 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543618;
        v11 = a1;
        v12 = 2114;
        v13 = v4;
        _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Nil available regions found for paired device %{public}@", (uint8_t *)&v10, 0x16u);
      }
      if (!*(_BYTE *)(a1 + 40))
      {
        a1 = 0;
        goto LABEL_11;
      }
      _HKInitializeLogging();
      v8 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543618;
        v11 = a1;
        v12 = 2114;
        v13 = v4;
        _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Returning local device availability for paired device %{public}@", (uint8_t *)&v10, 0x16u);
      }
      objc_msgSend((id)a1, "localCountrySet");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    a1 = v6;
LABEL_11:

  }
  return (id)a1;
}

- (id)remoteCountrySetForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

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
    -[HDAllowedCountriesDataSourceWithNanoRegistryFallback _nanoRegistryCountryListForDevice:]((uint64_t)self, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)reloadLocalCountrySetWithCompletion:(id)a3
{
  -[HDAllowedCountriesDataSource reloadLocalCountrySetWithCompletion:](self->_allowedCountriesDataSource, "reloadLocalCountrySetWithCompletion:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_devicePropertyName, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapabilityProvider, 0);
  objc_storeStrong((id *)&self->_allowedCountriesDataSource, 0);
}

@end
