@implementation AAUIManateeStateValidator

- (AAUIManateeStateValidator)initWithFlowContext:(id)a3 withPresentingViewController:(id)a4
{
  id v7;
  id v8;
  AAUIManateeStateValidator *v9;
  AAUIManateeStateValidator *v10;
  void *v11;
  uint64_t v12;
  CDPContext *context;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AAUIManateeStateValidator;
  v9 = -[AAUIManateeStateValidator init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentingViewController, a4);
    objc_storeStrong((id *)&v10->_flowContext, a3);
    objc_msgSend(MEMORY[0x1E0D15760], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contextForPrimaryAccount");
    v12 = objc_claimAutoreleasedReturnValue();
    context = v10->_context;
    v10->_context = (CDPContext *)v12;

  }
  return v10;
}

- (void)repairIfPrimaryAppleAccountIsCDP:(id)a3
{
  void *v4;
  void (**v5)(id, uint64_t, _QWORD);
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0D15760];
  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryAccountDSID");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D15760], "isICDPEnabledForDSID:checkWithServer:", v7, 0))
    -[AAUIManateeStateValidator verifyAndRepairManateeWithCompletion:](self, "verifyAndRepairManateeWithCompletion:", v5);
  else
    v5[2](v5, 1, 0);

}

- (void)verifyAndRepairManateeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  UIViewController *presentingViewController;
  UIViewController **p_presentingViewController;
  UIViewController *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Attempting manatee state repair.", buf, 2u);
  }

  p_presentingViewController = &self->_presentingViewController;
  presentingViewController = self->_presentingViewController;
  v8 = p_presentingViewController[1];
  -[UIViewController setPresentingViewController:](v8, "setPresentingViewController:", presentingViewController);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D157D8]), "initWithContext:", v8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__AAUIManateeStateValidator_verifyAndRepairManateeWithCompletion___block_invoke;
  v11[3] = &unk_1EA2DBC90;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "performDeviceToDeviceEncryptionStateRepairWithCompletion:", v11);

}

void __66__AAUIManateeStateValidator_verifyAndRepairManateeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);
  uint8_t v7[16];

  v4 = a3;
  if (objc_msgSend(v4, "cdp_isCDPErrorWithCode:", 5903))
  {
    _AAUILogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Manatee state validation completed. Already in good-state", v7, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (CDPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_flowContext, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end
