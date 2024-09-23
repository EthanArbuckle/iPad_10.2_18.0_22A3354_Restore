@implementation _HKFeatureStatusProvidingObserverBridge

- (_HKFeatureStatusProvidingObserverBridge)initWithFeatureIdentifierAndContext:(id)a3 handle:(id)a4
{
  id v7;
  id v8;
  _HKFeatureStatusProvidingObserverBridge *v9;
  _HKFeatureStatusProvidingObserverBridge *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKFeatureStatusProvidingObserverBridge;
  v9 = -[_HKFeatureStatusProvidingObserverBridge init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureIdentifierAndContext, a3);
    objc_storeStrong((id *)&v10->_handle, a4);
  }

  return v10;
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;

  v5 = a4;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

  if (v7)
  {
    HKLogInfrastructure();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_HKFeatureStatusProvidingObserverBridge featureStatusProviding:didUpdateFeatureStatus:].cold.1((uint64_t)self, v8);

  }
  -[HKObserverBridgeHandle notifyObserversOfChangeForKey:newValue:](self->_handle, "notifyObserversOfChangeForKey:newValue:", self->_featureIdentifierAndContext, v5);

}

- (HKFeatureIdentifierAndContext)featureIdentifierAndContext
{
  return self->_featureIdentifierAndContext;
}

- (HKObserverBridgeHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_featureIdentifierAndContext, 0);
}

- (void)featureStatusProviding:(uint64_t)a1 didUpdateFeatureStatus:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_class();
  v5 = *(_QWORD *)(a1 + 8);
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v5;
  v6 = v4;
  _os_log_debug_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@]: Observed feature status update for %{public}@, notifying observers", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_1_0();
}

@end
