@implementation AAUIAppleIDRepairController

- (AAUIAppleIDRepairController)init
{
  void *v3;
  __CFString *v4;
  int v5;
  void *v6;
  AAUIAppleIDRepairController *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("UPDATING_APPLE_ID_LABEL");
  if ((objc_msgSend(CFSTR("UPDATING_APPLE_ID_LABEL"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("UPDATING_APPLE_ID_LABEL"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = 1;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_1EA2E2A18, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)AAUIAppleIDRepairController;
  v7 = -[OBSetupAssistantSpinnerController initWithSpinnerText:](&v17, sel_initWithSpinnerText_, v6);

  if (v5)
  if (v7)
  {
    -[OBBaseWelcomeController navigationItem](v7, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidesBackButton:animated:", 1, 0);

    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aa_primaryAppleAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAppleIDRepairController setPrimaryAccount:](v7, "setPrimaryAccount:", v10);

    v11 = objc_alloc_init(MEMORY[0x1E0D00300]);
    -[AAUIAppleIDRepairController setAuthContext:](v7, "setAuthContext:", v11);

    -[AAUIAppleIDRepairController primaryAccount](v7, "primaryAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aa_altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAppleIDRepairController authContext](v7, "authContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAltDSID:", v13);

    -[AAUIAppleIDRepairController authContext](v7, "authContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNeedsRepair:", 1);

  }
  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AAUIAppleIDRepairController;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[AAUIAppleIDRepairController _prepareAction](self, "_prepareAction");
}

- (void)_prepareAction
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__AAUIAppleIDRepairController__prepareAction__block_invoke;
  v3[3] = &unk_1EA2DBC18;
  objc_copyWeak(&v4, &location);
  -[AAUIOBSpinnerViewController setActionBlock:](self, "setActionBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __45__AAUIAppleIDRepairController__prepareAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_alloc_init(MEMORY[0x1E0D00130]);
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Starting Apple ID repair flow...", buf, 2u);
  }

  objc_msgSend(WeakRetained, "authContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__AAUIAppleIDRepairController__prepareAction__block_invoke_28;
  v6[3] = &unk_1EA2DC1D0;
  v7 = WeakRetained;
  v5 = WeakRetained;
  objc_msgSend(v2, "authenticateWithContext:completion:", v4, v6);

}

void __45__AAUIAppleIDRepairController__prepareAction__block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  void *v13;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    *(_DWORD *)v14 = 138412290;
    *(_QWORD *)&v14[4] = v6;
    v9 = "Repair flow completed with error: %@";
    v10 = v7;
    v11 = 12;
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    *(_WORD *)v14 = 0;
    v9 = "Repair flow completed successfully!";
    v10 = v7;
    v11 = 2;
  }
  _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, v9, v14, v11);
LABEL_7:

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "repairController:didCompleteWithSuccess:", *(_QWORD *)(a1 + 32), v6 == 0);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[AAUIAppleIDRepairController authContext](self, "authContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAppleIDRepairController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentingViewController:", v6);

  v7.receiver = self;
  v7.super_class = (Class)AAUIAppleIDRepairController;
  -[AAUIOBSpinnerViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
}

- (AAUIAppleIDRepairControllerDelegate)delegate
{
  return (AAUIAppleIDRepairControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ACAccount)primaryAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setPrimaryAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (AKAppleIDAuthenticationPurpleBuddyContext)authContext
{
  return (AKAppleIDAuthenticationPurpleBuddyContext *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setAuthContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
