@implementation NPKPrecursorPassUpgradeRequestController

- (NPKPrecursorPassUpgradeRequestController)initWithPass:(id)a3
{
  id v5;
  NPKPrecursorPassUpgradeRequestController *v6;
  NPKPrecursorPassUpgradeRequestController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPrecursorPassUpgradeRequestController;
  v6 = -[NPKPrecursorPassUpgradeRequestController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pass, a3);

  return v7;
}

- (PKPrecursorPassUpgradeController)upgradeController
{
  PKPrecursorPassUpgradeController *upgradeController;
  id v4;
  PKSecureElementPass *pass;
  void *v6;
  PKPrecursorPassUpgradeController *v7;
  PKPrecursorPassUpgradeController *v8;

  upgradeController = self->_upgradeController;
  if (!upgradeController)
  {
    v4 = objc_alloc(MEMORY[0x24BE6EE58]);
    pass = self->_pass;
    objc_msgSend(MEMORY[0x24BE6EDB0], "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PKPrecursorPassUpgradeController *)objc_msgSend(v4, "initWithPass:webService:", pass, v6);
    v8 = self->_upgradeController;
    self->_upgradeController = v7;

    -[PKPrecursorPassUpgradeController setDelegate:](self->_upgradeController, "setDelegate:", self);
    upgradeController = self->_upgradeController;
  }
  return upgradeController;
}

- (id)pass
{
  return self->_pass;
}

- (id)upgradeRequestDescription
{
  return self->_upgradeRequestDescription;
}

- (void)fetchUpgradeRequestsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  -[NPKPrecursorPassUpgradeRequestController upgradeController](self, "upgradeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devicePrimaryPrecursorRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[NPKPrecursorPassUpgradeRequestController upgradeController](self, "upgradeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__NPKPrecursorPassUpgradeRequestController_fetchUpgradeRequestsWithCompletion___block_invoke;
  v9[3] = &unk_24CFEA1A8;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "requestDescriptionFor:completion:", v6, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __79__NPKPrecursorPassUpgradeRequestController_fetchUpgradeRequestsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_storeStrong(WeakRetained + 2, a2);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

- (void)precursorPassUpgradeRequestDidChange
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id buf[2];

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKPrecursorPassUpgradeRequestController: Received precursor pass upgrade request did change.", (uint8_t *)buf, 2u);
    }

  }
  objc_initWeak(buf, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __80__NPKPrecursorPassUpgradeRequestController_precursorPassUpgradeRequestDidChange__block_invoke;
  v6[3] = &unk_24CFEA1D0;
  objc_copyWeak(&v7, buf);
  -[NPKPrecursorPassUpgradeRequestController fetchUpgradeRequestsWithCompletion:](self, "fetchUpgradeRequestsWithCompletion:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __80__NPKPrecursorPassUpgradeRequestController_precursorPassUpgradeRequestDidChange__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "precursorPassUpgradeRequestsDidChangeForUpgradeController:", WeakRetained);

}

- (NPKPrecursorPassUpgradeRequestControllerDelegate)delegate
{
  return (NPKPrecursorPassUpgradeRequestControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setUpgradeController:(id)a3
{
  objc_storeStrong((id *)&self->_upgradeController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upgradeController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_upgradeRequestDescription, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
