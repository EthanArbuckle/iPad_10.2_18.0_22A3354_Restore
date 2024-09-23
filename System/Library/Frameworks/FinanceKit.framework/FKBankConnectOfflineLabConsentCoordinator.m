@implementation FKBankConnectOfflineLabConsentCoordinator

- (FKBankConnectOfflineLabConsentCoordinator)init
{
  FKBankConnectOfflineLabConsentCoordinator *v2;
  _TtC10FinanceKit39BankConnectOfflineLabConsentCoordinator *v3;
  _TtC10FinanceKit39BankConnectOfflineLabConsentCoordinator *wrappedCoordinator;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectOfflineLabConsentCoordinator;
  v2 = -[FKBankConnectOfflineLabConsentCoordinator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC10FinanceKit39BankConnectOfflineLabConsentCoordinator);
    wrappedCoordinator = v2->_wrappedCoordinator;
    v2->_wrappedCoordinator = v3;

  }
  return v2;
}

- (BOOL)isOfflineLabPreferenceAvailable
{
  return 1;
}

- (void)loadOfflineLabSharingPermissionWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __91__FKBankConnectOfflineLabConsentCoordinator_loadOfflineLabSharingPermissionWithCompletion___block_invoke;
  v6[3] = &unk_250466D18;
  v7 = v4;
  v5 = v4;
  -[FKBankConnectOfflineLabConsentCoordinator loadOfflineLabSharingPreferenceWithCompletion:](self, "loadOfflineLabSharingPreferenceWithCompletion:", v6);

}

uint64_t __91__FKBankConnectOfflineLabConsentCoordinator_loadOfflineLabSharingPermissionWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadOfflineLabSharingPreferenceWithCompletion:(id)a3
{
  -[BankConnectOfflineLabConsentCoordinator loadOfflineLabSharingPreferenceWithCompletion:](self->_wrappedCoordinator, "loadOfflineLabSharingPreferenceWithCompletion:", a3);
}

- (void)saveOfflineLabSharingPermission:(BOOL)a3 withCompletion:(id)a4
{
  -[BankConnectOfflineLabConsentCoordinator saveOfflineLabSharingPermission:withCompletion:](self->_wrappedCoordinator, "saveOfflineLabSharingPermission:withCompletion:", a3, a4);
}

- (id)offlineLabPrivacyBundleIdentifier
{
  return -[BankConnectOfflineLabConsentCoordinator offlineLabPrivacyBundleIdentifier](self->_wrappedCoordinator, "offlineLabPrivacyBundleIdentifier");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedCoordinator, 0);
}

@end
