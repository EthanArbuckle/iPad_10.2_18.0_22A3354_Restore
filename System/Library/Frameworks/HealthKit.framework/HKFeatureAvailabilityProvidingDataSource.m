@implementation HKFeatureAvailabilityProvidingDataSource

- (HKFeatureAvailabilityProvidingDataSource)initWithHealthDataSource:(id)a3
{
  id v4;
  HKFeatureAvailabilityProvidingDataSource *v5;
  HKFeatureAvailabilityProvidingDataSource *v6;
  uint64_t v7;
  NSMutableDictionary *featureAvailabilityProvidingByFeatureIdentifier;
  uint64_t v9;
  OS_dispatch_queue *observationQueue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKFeatureAvailabilityProvidingDataSource;
  v5 = -[HKObserverBridge init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_healthDataSource, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    featureAvailabilityProvidingByFeatureIdentifier = v6->_featureAvailabilityProvidingByFeatureIdentifier;
    v6->_featureAvailabilityProvidingByFeatureIdentifier = (NSMutableDictionary *)v7;

    HKCreateSerialDispatchQueue(v6, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    observationQueue = v6->_observationQueue;
    v6->_observationQueue = (OS_dispatch_queue *)v9;

  }
  return v6;
}

- (void)setKnownFeatureAvailabilityProviding:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "featureIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_featureAvailabilityProvidingByFeatureIdentifier, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_featureAvailabilityProvidingByFeatureIdentifier, "setObject:forKeyedSubscript:", v5, v6);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[HKFeatureAvailabilityProvidingDataSource setKnownFeatureAvailabilityProviding:].cold.1();
  }

}

- (id)featureAvailabilityProvidingForFeatureIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_healthDataSource);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "requiresWeakRetention"))
    {
      objc_msgSend(v6, "featureAvailabilityProvidingForFeatureIdentifier:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_featureAvailabilityProvidingByFeatureIdentifier, "objectForKeyedSubscript:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
LABEL_14:

        goto LABEL_15;
      }
      if (!v7)
      {
        _HKInitializeLogging();
        HKLogInfrastructure();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[HKFeatureAvailabilityProvidingDataSource featureAvailabilityProvidingForFeatureIdentifier:].cold.2((uint64_t)self, (uint64_t)v4, v9);

        goto LABEL_14;
      }
    }
    else
    {
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_featureAvailabilityProvidingByFeatureIdentifier, "objectForKeyedSubscript:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
LABEL_15:
        -[NSMutableDictionary objectForKeyedSubscript:](self->_featureAvailabilityProvidingByFeatureIdentifier, "objectForKeyedSubscript:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_unlock(&self->_lock);
        goto LABEL_16;
      }
      objc_msgSend(v6, "featureAvailabilityProvidingForFeatureIdentifier:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_featureAvailabilityProvidingByFeatureIdentifier, "setObject:forKeyedSubscript:", v7, v4);
    goto LABEL_14;
  }
  _HKInitializeLogging();
  HKLogInfrastructure();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[HKFeatureAvailabilityProvidingDataSource featureAvailabilityProvidingForFeatureIdentifier:].cold.1();

  v11 = 0;
LABEL_16:

  return v11;
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v6;
  void *v7;
  _HKFeatureAvailabilityProvidingObserverBridge *v8;

  v6 = a4;
  -[HKFeatureAvailabilityProvidingDataSource featureAvailabilityProvidingForFeatureIdentifier:](self, "featureAvailabilityProvidingForFeatureIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_HKFeatureAvailabilityProvidingObserverBridge initWithHandle:]([_HKFeatureAvailabilityProvidingObserverBridge alloc], "initWithHandle:", v6);

  objc_msgSend(v7, "registerObserver:queue:", v8, self->_observationQueue);
  return v8;
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[HKFeatureAvailabilityProvidingDataSource featureAvailabilityProvidingForFeatureIdentifier:](self, "featureAvailabilityProvidingForFeatureIdentifier:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterObserver:", v6);

}

- (HKFeatureAvailabilityHealthDataSource)healthDataSource
{
  return (HKFeatureAvailabilityHealthDataSource *)objc_loadWeakRetained((id *)&self->_healthDataSource);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableDictionary)featureAvailabilityProvidingByFeatureIdentifier
{
  return self->_featureAvailabilityProvidingByFeatureIdentifier;
}

- (OS_dispatch_queue)observationQueue
{
  return self->_observationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationQueue, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityProvidingByFeatureIdentifier, 0);
  objc_destroyWeak((id *)&self->_healthDataSource);
}

- (void)setKnownFeatureAvailabilityProviding:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_2_2();
  v1 = OUTLINED_FUNCTION_3_0(v0);
  OUTLINED_FUNCTION_0_4(&dword_19A0E6000, v2, v3, "[%{public}@]: Given nil featureAvailabilityProviding in -setKnownFeatureAvailabilityProviding:", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)featureAvailabilityProvidingForFeatureIdentifier:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_2_2();
  v1 = OUTLINED_FUNCTION_3_0(v0);
  OUTLINED_FUNCTION_0_4(&dword_19A0E6000, v2, v3, "[%{public}@]: Health data source is nil", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)featureAvailabilityProvidingForFeatureIdentifier:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;

  v6 = 138543618;
  v7 = (id)OUTLINED_FUNCTION_2_2();
  v8 = 2114;
  v9 = a2;
  v5 = v7;
  _os_log_fault_impl(&dword_19A0E6000, a3, OS_LOG_TYPE_FAULT, "[%{public}@]: Unknown feature identifier %{public}@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_1_0();
}

@end
