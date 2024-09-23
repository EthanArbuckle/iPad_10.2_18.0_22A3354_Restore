@implementation CRKClassKitAccountStateProvider

- (void)dealloc
{
  objc_super v3;

  -[CRKClassKitAccountStateProvider endObservingAccountChanges](self, "endObservingAccountChanges");
  v3.receiver = self;
  v3.super_class = (Class)CRKClassKitAccountStateProvider;
  -[CRKClassKitAccountStateProvider dealloc](&v3, sel_dealloc);
}

- (CRKClassKitAccountStateProvider)init
{
  CRKClassKitAccountStateProvider *v2;
  uint64_t v3;
  ACAccountStore *accountStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKClassKitAccountStateProvider;
  v2 = -[CRKClassKitAccountStateProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v3 = objc_claimAutoreleasedReturnValue();
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v3;

    -[CRKClassKitAccountStateProvider beginObservingAccountChanges](v2, "beginObservingAccountChanges");
    -[CRKClassKitAccountStateProvider updateAccountState](v2, "updateAccountState");
  }
  return v2;
}

- (void)beginObservingAccountChanges
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_accountStoreDidChange_, *MEMORY[0x24BDB41E0], 0);

}

- (void)endObservingAccountChanges
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDB41E0], 0);

}

- (void)accountStoreDidChange:(id)a3
{
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassKitAccountStateProvider.m"), 65, CFSTR("%@ must be called from the main thread"), v6);

  }
  -[CRKClassKitAccountStateProvider updateAccountState](self, "updateAccountState");
}

- (void)updateAccountState
{
  int64_t v3;

  v3 = -[CRKClassKitAccountStateProvider accountState](self, "accountState");
  if (v3 != -[CRKClassKitAccountStateProvider currentAccountState](self, "currentAccountState"))
    -[CRKClassKitAccountStateProvider setAccountState:](self, "setAccountState:", -[CRKClassKitAccountStateProvider currentAccountState](self, "currentAccountState"));
}

- (int64_t)currentAccountState
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLoginUser");

  if ((v4 & 1) != 0)
    return 1;
  if (objc_msgSend(MEMORY[0x24BDB8550], "isAvailable"))
    return 2;
  return 0;
}

- (int64_t)accountState
{
  return self->_accountState;
}

- (void)setAccountState:(int64_t)a3
{
  self->_accountState = a3;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
