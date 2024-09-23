@implementation HKFeatureStatusProvidingDataSource

- (HKFeatureStatusProvidingDataSource)init
{
  HKFeatureStatusProvidingDataSource *v2;
  HKFeatureStatusProvidingDataSource *v3;
  uint64_t v4;
  NSMutableDictionary *featureStatusProvidingByFeatureIdentifierAndContext;
  uint64_t v6;
  OS_dispatch_queue *observationQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKFeatureStatusProvidingDataSource;
  v2 = -[HKObserverBridge init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    featureStatusProvidingByFeatureIdentifierAndContext = v3->_featureStatusProvidingByFeatureIdentifierAndContext;
    v3->_featureStatusProvidingByFeatureIdentifierAndContext = (NSMutableDictionary *)v4;

    HKCreateSerialDispatchQueue(v3, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    observationQueue = v3->_observationQueue;
    v3->_observationQueue = (OS_dispatch_queue *)v6;

  }
  return v3;
}

- (id)featureStatusProvidingForFeatureIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  HKFeatureIdentifierAndContext *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[HKFeatureIdentifierAndContext initWithFeatureIdentifier:context:]([HKFeatureIdentifierAndContext alloc], "initWithFeatureIdentifier:context:", v7, v6);

  -[HKFeatureStatusProvidingDataSource _featureStatusProvidingForFeatureIdentifierAndContext:](self, "_featureStatusProvidingForFeatureIdentifierAndContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_featureStatusProvidingForFeatureIdentifierAndContext:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_featureStatusProvidingByFeatureIdentifierAndContext, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v4, "featureIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKFeatureStatusProvidingDataSource _makeFeatureStatusProviderForFeatureIdentifier:context:dataSource:](self, "_makeFeatureStatusProviderForFeatureIdentifier:context:dataSource:", v8, v9, WeakRetained);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_featureStatusProvidingByFeatureIdentifierAndContext, "setObject:forKeyedSubscript:", v10, v4);
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_featureStatusProvidingByFeatureIdentifierAndContext, "objectForKeyedSubscript:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[HKFeatureStatusProvidingDataSource _featureStatusProvidingForFeatureIdentifierAndContext:].cold.1((uint64_t)self, v12);

    os_unfair_lock_unlock(&self->_lock);
    v11 = 0;
  }

  return v11;
}

- (id)_makeFeatureStatusProviderForFeatureIdentifier:(id)a3 context:(id)a4 dataSource:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a3;
  objc_msgSend(v8, "setWithObject:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKFeatureAvailabilityContextConstraint onlySomeContexts:](HKFeatureAvailabilityContextConstraint, "onlySomeContexts:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "featureAvailabilityProvidingDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "featureAvailabilityProvidingForFeatureIdentifier:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[HKFeatureStatusManager childFeatureStatusManagerWithFeatureAvailabilityProviding:featureAvailabilityDataSource:contextConstraint:](HKFeatureStatusManager, "childFeatureStatusManagerWithFeatureAvailabilityProviding:featureAvailabilityDataSource:contextConstraint:", v13, v7, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _HKFeatureStatusProvidingObserverBridge *v9;

  v6 = a4;
  v7 = a3;
  -[HKFeatureStatusProvidingDataSource _featureStatusProvidingForFeatureIdentifierAndContext:](self, "_featureStatusProvidingForFeatureIdentifierAndContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_HKFeatureStatusProvidingObserverBridge initWithFeatureIdentifierAndContext:handle:]([_HKFeatureStatusProvidingObserverBridge alloc], "initWithFeatureIdentifierAndContext:handle:", v7, v6);

  objc_msgSend(v8, "registerObserver:queue:", v9, self->_observationQueue);
  return v9;
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[HKFeatureStatusProvidingDataSource _featureStatusProvidingForFeatureIdentifierAndContext:](self, "_featureStatusProvidingForFeatureIdentifierAndContext:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterObserver:", v6);

}

- (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSource
{
  return (HKFeatureAvailabilityRequirementEvaluationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableDictionary)featureStatusProvidingByFeatureIdentifierAndContext
{
  return self->_featureStatusProvidingByFeatureIdentifierAndContext;
}

- (OS_dispatch_queue)observationQueue
{
  return self->_observationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationQueue, 0);
  objc_storeStrong((id *)&self->_featureStatusProvidingByFeatureIdentifierAndContext, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)_featureStatusProvidingForFeatureIdentifierAndContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138543362;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "[%{public}@]: Data source is nil", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

@end
