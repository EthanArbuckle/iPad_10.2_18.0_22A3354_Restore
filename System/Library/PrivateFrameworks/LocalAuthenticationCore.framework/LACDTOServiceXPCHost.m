@implementation LACDTOServiceXPCHost

- (LACDTOServiceXPCHost)initWithFeatureController:(id)a3 ratchetStateProvider:(id)a4 trustStateProvider:(id)a5 pendingEvaluationController:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LACDTOServiceXPCHost *v15;
  LACDTOServiceXPCHost *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)LACDTOServiceXPCHost;
  v15 = -[LACDTOServiceXPCHost init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_featureController, a3);
    objc_storeStrong((id *)&v16->_ratchetStateProvider, a4);
    objc_storeStrong((id *)&v16->_pendingEvaluationController, a6);
    objc_storeStrong((id *)&v16->_trustStateProvider, a5);
  }

  return v16;
}

- (void)checkIsFeatureEnabledWithCompletion:(id)a3
{
  -[LACDTOFeatureControlling checkIsFeatureEnabledWithCompletion:](self->_featureController, "checkIsFeatureEnabledWithCompletion:", a3);
}

- (void)checkIsFeatureSupportedWithCompletion:(id)a3
{
  -[LACDTOFeatureControlling checkIsFeatureSupportedWithCompletion:](self->_featureController, "checkIsFeatureSupportedWithCompletion:", a3);
}

- (void)checkIsFeatureAvailableWithCompletion:(id)a3
{
  -[LACDTOFeatureControlling checkIsFeatureAvailableWithCompletion:](self->_featureController, "checkIsFeatureAvailableWithCompletion:", a3);
}

- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3
{
  -[LACDTOFeatureControlling checkIsFeatureStrictModeEnabledWithCompletion:](self->_featureController, "checkIsFeatureStrictModeEnabledWithCompletion:", a3);
}

- (void)checkIsSensorTrustedWithCompletion:(id)a3
{
  -[LACDTOSensorTrustStateProvider checkIsSensorTrustedWithCompletion:](self->_trustStateProvider, "checkIsSensorTrustedWithCompletion:", a3);
}

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
  -[LACDTOFeatureControlling checkCanEnableFeatureWithCompletion:](self->_featureController, "checkCanEnableFeatureWithCompletion:", a3);
}

- (void)enableFeatureWithCompletion:(id)a3
{
  -[LACDTOFeatureControlling enableFeatureWithCompletion:](self->_featureController, "enableFeatureWithCompletion:", a3);
}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
  -[LACDTOFeatureControlling disableFeatureWithContext:completion:](self->_featureController, "disableFeatureWithContext:completion:", a3, a4);
}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
  -[LACDTOFeatureControlling enableFeatureStrictModeWithCompletion:](self->_featureController, "enableFeatureStrictModeWithCompletion:", a3);
}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
  -[LACDTOFeatureControlling disableFeatureStrictModeWithContext:completion:](self->_featureController, "disableFeatureStrictModeWithContext:completion:", a3, a4);
}

- (void)ratchetStateWithCompletion:(id)a3
{
  -[LACDTORatchetStateProvider ratchetStateWithCompletion:](self->_ratchetStateProvider, "ratchetStateWithCompletion:", a3);
}

- (void)ratchetStateCompositeWithCompletion:(id)a3
{
  -[LACDTORatchetStateProvider ratchetStateCompositeWithCompletion:](self->_ratchetStateProvider, "ratchetStateCompositeWithCompletion:", a3);
}

- (void)cancelPendingEvaluationWithRatchetIdentifier:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  LACXPCClient *v11;
  void *v12;
  LACXPCClient *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [LACXPCClient alloc];
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[LACXPCClient initWithConnection:](v11, "initWithConnection:", v12);

  -[LACDTOPendingPolicyEvaluationController cancelPendingEvaluationForClient:ratchetIdentifier:reason:completion:](self->_pendingEvaluationController, "cancelPendingEvaluationForClient:ratchetIdentifier:reason:completion:", v13, v10, v9, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEvaluationController, 0);
  objc_storeStrong((id *)&self->_trustStateProvider, 0);
  objc_storeStrong((id *)&self->_ratchetStateProvider, 0);
  objc_storeStrong((id *)&self->_featureController, 0);
}

@end
