@implementation CIDVUIBiometricBindingFlowManager

- (CIDVUIBiometricBindingFlowManager)init
{
  CIDVUIBiometricBindingFlowManager *v2;
  _TtC9CoreIDVUI34CIDVUIInternalBiometricFlowManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CIDVUIBiometricBindingFlowManager;
  v2 = -[CIDVUIBiometricBindingFlowManager init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC9CoreIDVUI34CIDVUIInternalBiometricFlowManager);
    -[CIDVUIBiometricBindingFlowManager setBioBindingFlowManager:](v2, "setBioBindingFlowManager:", v3);

  }
  return v2;
}

- (void)evaluateBoundACL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CIDVUIBiometricBindingFlowManager bioBindingFlowManager](self, "bioBindingFlowManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evaluateBoundACLWithCompletionHandler:", v4);

}

- (void)deleteBoundACLWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CIDVUIBiometricBindingFlowManager bioBindingFlowManager](self, "bioBindingFlowManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteBoundACLWithCompletionHandler:", v4);

}

- (void)fetchBiometricBindingDetails:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CIDVUIBiometricBindingFlowManager bioBindingFlowManager](self, "bioBindingFlowManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchBiometricBindingDetailsWithCompletionHandler:", v4);

}

- (void)globalAuthACLTemplateUUIDsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CIDVUIBiometricBindingFlowManager bioBindingFlowManager](self, "bioBindingFlowManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globalAuthACLTemplateUUIDsWithCompletionHandler:", v4);

}

- (_TtC9CoreIDVUI34CIDVUIInternalBiometricFlowManager)bioBindingFlowManager
{
  return self->_bioBindingFlowManager;
}

- (void)setBioBindingFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->_bioBindingFlowManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bioBindingFlowManager, 0);
}

@end
