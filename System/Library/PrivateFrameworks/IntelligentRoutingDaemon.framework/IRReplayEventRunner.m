@implementation IRReplayEventRunner

+ (id)historyEventsContainerDO:(id)a3 RemovingEventsAfter:(id)a4
{
  return a3;
}

- (IRReplayEventRunner)initWithServicePackage:(int64_t)a3
{
  IRReplayEventRunner *v4;
  IRPolicyEngine *v5;
  IRPolicyEngine *policyEngine;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IRReplayEventRunner;
  v4 = -[IRReplayEventRunner init](&v8, sel_init);
  if (v4)
  {
    v5 = -[IRPolicyEngine initWithServicePackage:]([IRPolicyEngine alloc], "initWithServicePackage:", a3);
    policyEngine = v4->_policyEngine;
    v4->_policyEngine = v5;

  }
  return v4;
}

- (void)runSingleReplayEvent:(id)a3 withHistoryEventsContainer:(id)a4
{
  IRPolicyEngine *policyEngine;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  IRContextInspection *v14;
  void *v15;
  void *v16;
  void *v17;
  IRContextInspection *v18;
  IRContextInspection *contextsInspection;
  uint64_t v20;
  id v21;

  policyEngine = self->_policyEngine;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "candidatesContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "miloLslPrediction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nearbyDeviceContainerDO");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = 1;
  -[IRPolicyEngine updateContextWithDate:candidatesContainer:historyEventsContainer:systemState:miloProviderLslPredictionResults:nearbyDeviceContainer:fillInspection:](policyEngine, "updateContextWithDate:candidatesContainer:historyEventsContainer:systemState:miloProviderLslPredictionResults:nearbyDeviceContainer:fillInspection:", v9, v10, v7, v11, v12, v13, v20);

  v14 = [IRContextInspection alloc];
  objc_msgSend(v8, "date");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[IRPolicyEngine policyInspections](self->_policyEngine, "policyInspections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "appInFocusBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[IRContextInspection initWithDate:policies:foregroundApp:](v14, "initWithDate:policies:foregroundApp:", v21, v15, v17);
  contextsInspection = self->_contextsInspection;
  self->_contextsInspection = v18;

}

- (NSDictionary)contexts
{
  return -[IRPolicyEngine contexts](self->_policyEngine, "contexts");
}

- (IRContextInspection)contextsInspection
{
  return self->_contextsInspection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextsInspection, 0);
  objc_storeStrong((id *)&self->_policyEngine, 0);
}

@end
