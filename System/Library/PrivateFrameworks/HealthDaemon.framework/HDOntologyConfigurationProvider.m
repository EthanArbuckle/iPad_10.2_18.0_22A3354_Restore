@implementation HDOntologyConfigurationProvider

- (HDOntologyConfigurationProvider)init
{
  HDOntologyConfigurationProvider *v2;
  uint64_t v3;
  HDHealthOntologyConfiguration *ontologyConfiguration;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDOntologyConfigurationProvider;
  v2 = -[HDOntologyConfigurationProvider init](&v6, sel_init);
  if (v2)
  {
    +[HDHealthOntologyConfiguration bundledHealthOntologyConfiguration](HDHealthOntologyConfiguration, "bundledHealthOntologyConfiguration");
    v3 = objc_claimAutoreleasedReturnValue();
    ontologyConfiguration = v2->_ontologyConfiguration;
    v2->_ontologyConfiguration = (HDHealthOntologyConfiguration *)v3;

  }
  return v2;
}

- (_QWORD)ontologyConfiguration
{
  void *v1;

  if (a1)
  {
    v1 = (void *)a1[3];
    if (!v1)
      v1 = (void *)a1[1];
    a1 = v1;
  }
  return a1;
}

- (BOOL)isCountrySupported:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  int v10;
  HDOntologyConfigurationProvider *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HDOntologyConfigurationProvider isCountryCodeSupported:](self, "isCountryCodeSupported:", v6);

  }
  else
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v4;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: passing a locale without country code (%{public}@) to isCountrySupported:, will return NO", (uint8_t *)&v10, 0x16u);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)isCountryCodeSupported:(id)a3
{
  void *v3;
  BOOL v4;

  -[HDOntologyConfigurationProvider ontologyConfigurationForCountryCode:](self, "ontologyConfigurationForCountryCode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (NSSet)allSupportedCountryCodes
{
  void *v2;
  void *v3;
  void *v4;

  -[HDOntologyConfigurationProvider ontologyConfiguration](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allCountryConfigurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_mapToSet:", &__block_literal_global_138);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

uint64_t __59__HDOntologyConfigurationProvider_allSupportedCountryCodes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "countryCode");
}

- (NSSet)improveHealthRecordsGatedAnalyticsEnabledCountryCodes
{
  void *v2;
  void *v3;
  void *v4;

  -[HDOntologyConfigurationProvider ontologyConfiguration](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allCountryConfigurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_mapToSet:", &__block_literal_global_184);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

id __88__HDOntologyConfigurationProvider_improveHealthRecordsGatedAnalyticsEnabledCountryCodes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "analyticsOptions") & 1) != 0)
  {
    objc_msgSend(v2, "countryCode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSSet)optInDataCollectionEnabledCountryCodes
{
  void *v2;
  void *v3;
  void *v4;

  -[HDOntologyConfigurationProvider ontologyConfiguration](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allCountryConfigurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_mapToSet:", &__block_literal_global_185);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

id __73__HDOntologyConfigurationProvider_optInDataCollectionEnabledCountryCodes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "analyticsOptions") & 2) != 0)
  {
    objc_msgSend(v2, "countryCode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)ontologyConfigurationForCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HDOntologyConfigurationProvider ontologyConfiguration](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationForCountryCode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HDHealthOntologyConfiguration)unitTesting_ontologyConfigurationOverride
{
  return self->_unitTesting_ontologyConfigurationOverride;
}

- (void)setUnitTesting_ontologyConfigurationOverride:(id)a3
{
  objc_storeStrong((id *)&self->_unitTesting_ontologyConfigurationOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTesting_ontologyConfigurationOverride, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_ontologyConfiguration, 0);
}

@end
