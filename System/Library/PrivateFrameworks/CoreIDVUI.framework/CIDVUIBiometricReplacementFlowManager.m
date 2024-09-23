@implementation CIDVUIBiometricReplacementFlowManager

- (CIDVUIBiometricReplacementFlowManager)init
{
  CIDVUIBiometricReplacementFlowManager *v2;
  _TtC9CoreIDVUI45CIDVUIInternalBiometricReplacementFlowManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CIDVUIBiometricReplacementFlowManager;
  v2 = -[CIDVUIBiometricReplacementFlowManager init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC9CoreIDVUI45CIDVUIInternalBiometricReplacementFlowManager);
    -[CIDVUIBiometricReplacementFlowManager setBiometricReplacementFlowManager:](v2, "setBiometricReplacementFlowManager:", v3);

  }
  return v2;
}

- (void)beginBiometricReplacement:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CIDVUIBiometricReplacementFlowManager biometricReplacementFlowManager](self, "biometricReplacementFlowManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginBiometricReplacementForTarget:withAuthHandler:andCompletionHandler:", 1, v4, 0);

}

- (void)beginBiometricReplacementForWatch:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CIDVUIBiometricReplacementFlowManager biometricReplacementFlowManager](self, "biometricReplacementFlowManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginBiometricReplacementForTarget:withAuthHandler:andCompletionHandler:", 2, v4, 0);

}

- (void)beginBiometricReplacementWithAuthenticationHandler:(id)a3 andCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CIDVUIBiometricReplacementFlowManager biometricReplacementFlowManager](self, "biometricReplacementFlowManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginBiometricReplacementForTarget:withAuthHandler:andCompletionHandler:", 1, v7, v6);

}

- (_TtC9CoreIDVUI45CIDVUIInternalBiometricReplacementFlowManager)biometricReplacementFlowManager
{
  return self->_biometricReplacementFlowManager;
}

- (void)setBiometricReplacementFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->_biometricReplacementFlowManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricReplacementFlowManager, 0);
}

@end
