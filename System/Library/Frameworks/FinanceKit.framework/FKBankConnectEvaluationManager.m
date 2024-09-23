@implementation FKBankConnectEvaluationManager

- (FKBankConnectEvaluationManager)init
{
  FKBankConnectEvaluationManager *v2;
  _TtC10FinanceKit35BankConnectEvaluationManagerWrapper *v3;
  _TtC10FinanceKit35BankConnectEvaluationManagerWrapper *wrappedManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectEvaluationManager;
  v2 = -[FKBankConnectEvaluationManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC10FinanceKit35BankConnectEvaluationManagerWrapper);
    wrappedManager = v2->_wrappedManager;
    v2->_wrappedManager = v3;

  }
  return v2;
}

- (void)reevaluateEligibilityWithCompletion:(id)a3
{
  -[BankConnectEvaluationManagerWrapper reevaluateEligibilityWithCompletionHandler:](self->_wrappedManager, "reevaluateEligibilityWithCompletionHandler:", a3);
}

- (void)reevaluateEligibilityAndConnectionsWithCompletion:(id)a3
{
  -[BankConnectEvaluationManagerWrapper reevaluateEligibilityAndReturnShouldReloadDiscoveryItemsWithCompletionHandler:](self->_wrappedManager, "reevaluateEligibilityAndReturnShouldReloadDiscoveryItemsWithCompletionHandler:", a3);
}

- (BOOL)hasAnyConnectedCardWithBankConnect
{
  return -[BankConnectEvaluationManagerWrapper hasAnyConnectedCardWithBankConnect](self->_wrappedManager, "hasAnyConnectedCardWithBankConnect");
}

- (BOOL)hasAnyEligibleBankConnectCard
{
  return -[BankConnectEvaluationManagerWrapper hasAnyEligibleBankConnectCard](self->_wrappedManager, "hasAnyEligibleBankConnectCard");
}

- (BOOL)hasAnyEligibleBankConectCard
{
  return -[BankConnectEvaluationManagerWrapper hasAnyEligibleBankConnectCard](self->_wrappedManager, "hasAnyEligibleBankConnectCard");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedManager, 0);
}

@end
