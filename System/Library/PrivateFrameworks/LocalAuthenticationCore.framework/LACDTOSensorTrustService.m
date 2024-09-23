@implementation LACDTOSensorTrustService

- (LACDTOSensorTrustService)initWithReplyQueue:(id)a3 uiController:(id)a4 store:(id)a5 featureStateProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LACDTOSensorTrustService *v15;
  LACDTOSensorTrustService *v16;
  uint64_t v17;
  LACFlagsProvider *flags;
  LACDTOSensorTrustStateProvider *v19;
  LACDTOSensorTrustStateProvider *trustStateProvider;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)LACDTOSensorTrustService;
  v15 = -[LACDTOSensorTrustService init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_replyQueue, a3);
    objc_storeStrong((id *)&v16->_uiController, a4);
    objc_storeStrong((id *)&v16->_store, a5);
    objc_storeStrong((id *)&v16->_featureStateProvider, a6);
    +[LACFlags sharedInstance](LACFlags, "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    flags = v16->_flags;
    v16->_flags = (LACFlagsProvider *)v17;

    v19 = -[LACDTOSensorTrustStateProvider initWithStore:]([LACDTOSensorTrustStateProvider alloc], "initWithStore:", v16->_store);
    trustStateProvider = v16->_trustStateProvider;
    v16->_trustStateProvider = v19;

  }
  return v16;
}

- (id)evaluationProcessor
{
  void *v3;
  void *v4;
  void *v5;
  LACDTOSensorTrustController *v6;

  -[LACDTOSensorTrustService _trustVerifier](self, "_trustVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOSensorTrustService _trustStore](self, "_trustStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOSensorTrustService _uiPresenter](self, "_uiPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LACDTOSensorTrustController initWithReplyQueue:ui:store:verifier:flags:]([LACDTOSensorTrustController alloc], "initWithReplyQueue:ui:store:verifier:flags:", self->_replyQueue, v5, v4, v3, self->_flags);

  return v6;
}

- (id)trustStateProvider
{
  return self->_trustStateProvider;
}

- (id)_repairStateProvider
{
  return +[LACDTOSensorRepairStateProviderFactory repairStateProviderWithReplyQueue:flags:](LACDTOSensorRepairStateProviderFactory, "repairStateProviderWithReplyQueue:flags:", self->_replyQueue, self->_flags);
}

- (id)_trustVerifier
{
  LACDTOSensorTrustVerifier *v3;
  void *v4;
  LACDTOFeatureStateProviding *featureStateProvider;
  void *v6;
  LACDTOSensorTrustVerifier *v7;

  v3 = [LACDTOSensorTrustVerifier alloc];
  -[LACDTOSensorTrustService trustStateProvider](self, "trustStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  featureStateProvider = self->_featureStateProvider;
  -[LACDTOSensorTrustService _repairStateProvider](self, "_repairStateProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LACDTOSensorTrustVerifier initWithTrustStateProvider:featureStateProvider:repairStateProvider:](v3, "initWithTrustStateProvider:featureStateProvider:repairStateProvider:", v4, featureStateProvider, v6);

  return v7;
}

- (id)_trustStore
{
  return -[LACDTOSensorTrustStoreKVSAdapter initWithKVStore:]([LACDTOSensorTrustStoreKVSAdapter alloc], "initWithKVStore:", self->_store);
}

- (id)_uiPresenter
{
  return -[LACUserInterfacePresenter initWithReplyQueue:uiController:]([LACUserInterfacePresenter alloc], "initWithReplyQueue:uiController:", self->_replyQueue, self->_uiController);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustStateProvider, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_featureStateProvider, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_uiController, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

@end
