@implementation HDLocalCountrySetAvailabilityProvider

- (HDLocalCountrySetAvailabilityProvider)initWithFeatureIdentifier:(id)a3 defaultCountrySet:(id)a4 healthDaemon:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HDLocalCountrySetAvailabilityProvider *v13;

  v8 = (void *)MEMORY[0x1E0C99EA0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "hk_localCountrySetOverrideUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDLocalCountrySetAvailabilityProvider initWithFeatureIdentifier:defaultCountrySet:healthDaemon:overrideUserDefaults:](self, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:overrideUserDefaults:", v11, v10, v9, v12);

  return v13;
}

- (HDLocalCountrySetAvailabilityProvider)initWithFeatureIdentifier:(id)a3 defaultCountrySet:(id)a4 healthDaemon:(id)a5 overrideUserDefaults:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDLocalCountrySetAvailabilityProvider *v14;
  uint64_t v15;
  NSString *featureIdentifier;
  uint64_t v17;
  HKCountrySet *defaultCountrySet;
  id WeakRetained;
  void *v20;
  NSUserDefaults *overrideUserDefaults;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HDLocalCountrySetAvailabilityProvider;
  v14 = -[HDLocalCountrySetAvailabilityProvider init](&v23, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    featureIdentifier = v14->_featureIdentifier;
    v14->_featureIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    defaultCountrySet = v14->_defaultCountrySet;
    v14->_defaultCountrySet = (HKCountrySet *)v17;

    objc_storeWeak((id *)&v14->_healthDaemon, v12);
    objc_storeStrong((id *)&v14->_overrideUserDefaults, a6);
    WeakRetained = objc_loadWeakRetained((id *)&v14->_healthDaemon);
    objc_msgSend(WeakRetained, "OTAFeatureAvailabilityManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "registerObserver:queue:", v14, 0);

    overrideUserDefaults = v14->_overrideUserDefaults;
    if (overrideUserDefaults)
      -[NSUserDefaults addObserver:forKeyPath:options:context:](overrideUserDefaults, "addObserver:forKeyPath:options:context:", v14, v10, 0, 0);
  }

  return v14;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@:%p"), objc_opt_class(), self->_featureIdentifier, self);
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_healthDaemon);
  objc_msgSend(WeakRetained, "OTAFeatureAvailabilityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:", self);

  -[NSUserDefaults removeObserver:forKeyPath:](self->_overrideUserDefaults, "removeObserver:forKeyPath:", self, self->_featureIdentifier);
  v5.receiver = self;
  v5.super_class = (Class)HDLocalCountrySetAvailabilityProvider;
  -[HDLocalCountrySetAvailabilityProvider dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id obj;

  obj = a3;
  if (obj)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      v7 = objc_loadWeakRetained((id *)&self->_delegate);

      if (v7 != obj)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDLocalCountrySetAvailabilityProvider.m"), 72, CFSTR("Delegate cannot be changed after it is set"));

      }
    }
  }
  objc_storeWeak((id *)&self->_delegate, obj);

}

- (HKCountrySet)countrySet
{
  id WeakRetained;
  void *v4;
  NSString *featureIdentifier;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  HKCountrySet *v10;
  NSObject *v11;
  HKCountrySet *v12;
  void *v13;
  HKCountrySet *v14;
  NSObject *v15;
  HKCountrySet *v16;
  void *v18;
  id v19;
  uint8_t buf[4];
  HDLocalCountrySetAvailabilityProvider *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!self)
  {
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_healthDaemon);
  objc_msgSend(WeakRetained, "OTAFeatureAvailabilityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  featureIdentifier = self->_featureIdentifier;
  v19 = 0;
  objc_msgSend(v4, "featureAvailabilityInfoForFeature:error:", featureIdentifier, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  objc_msgSend(v6, "allowedCountrySet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if ((objc_msgSend(v7, "hk_isHealthKitErrorWithCode:", 11) & 1) == 0)
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v21 = self;
        v22 = 2114;
        v23 = v7;
        _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected error attempting to read OTA info: %{public}@", buf, 0x16u);
      }

    }
    goto LABEL_10;
  }

  v9 = objc_msgSend(v8, "contentVersion");
  if (v9 >= -[HKCountrySet contentVersion](self->_defaultCountrySet, "contentVersion"))
  {
    v10 = v8;
    v8 = v10;
    goto LABEL_12;
  }
LABEL_11:
  v10 = self->_defaultCountrySet;
LABEL_12:
  v12 = v10;
  -[NSUserDefaults hk_countrySetForKey:](self->_overrideUserDefaults, "hk_countrySetForKey:", self->_featureIdentifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  if (v13)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v18;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Internal country set override present: %{public}@", buf, 0x16u);

    }
    v14 = (HKCountrySet *)v13;
  }
  v16 = v14;

  return v16;
}

- (void)OTAFeatureAvailabilityManagerDidUpdateFeatureAvailabilityInfo:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "regionAvailabilityProvidingDidUpdate:", self);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  NSUserDefaults *v11;
  id v12;
  id WeakRetained;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  objc_super v17;
  uint8_t buf[4];
  HDLocalCountrySetAvailabilityProvider *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (NSUserDefaults *)a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", self->_featureIdentifier)
    && self->_overrideUserDefaults == v11)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject regionAvailabilityProvidingDidUpdate:](v14, "regionAvailabilityProvidingDidUpdate:", self);
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

      if (!v16)
        goto LABEL_4;
      HKLogInfrastructure();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v19 = self;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_INFO, "[%{public}@] No delegate to receive observation message", buf, 0xCu);
      }
    }

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HDLocalCountrySetAvailabilityProvider;
    -[HDLocalCountrySetAvailabilityProvider observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }
LABEL_4:

}

- (id)onboardingEligibilityForCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HDLocalCountrySetAvailabilityProvider regionAvailability](self, "regionAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "onboardingEligibilityForCountryCode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 device:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[HDLocalCountrySetAvailabilityProvider regionAvailability](self, "regionAvailability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "onboardingEligibilityForCountryCode:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)regionAvailability
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB6AC8];
  v3 = (void *)MEMORY[0x1E0CB62A8];
  -[HDLocalCountrySetAvailabilityProvider countrySet](self, "countrySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allowedCountriesInLocalSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allowedInSomeCountries:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)downloadLatestOTAAvailabilityInfoWithCompletion:(id)a3
{
  HDDaemon **p_healthDaemon;
  id v4;
  void *v5;
  id WeakRetained;

  p_healthDaemon = &self->_healthDaemon;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_healthDaemon);
  objc_msgSend(WeakRetained, "OTAFeatureAvailabilityManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "downloadWithCompletion:", v4);

}

- (HDRegionAvailabilityProvidingDelegate)delegate
{
  return (HDRegionAvailabilityProvidingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideUserDefaults, 0);
  objc_destroyWeak((id *)&self->_healthDaemon);
  objc_storeStrong((id *)&self->_defaultCountrySet, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
