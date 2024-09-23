@implementation MSDCodeEntryAlertController

- (MSDCodeEntryAlertController)initWithVerificationCode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MSDCodeEntryAlertController *v8;
  MSDCodeEntryAlertController *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  MSDCodeEntryContentViewController *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id location;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[MSDCodeEntryAlertController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    -[MSDCodeEntryAlertController setCompletion:](v8, "setCompletion:", v7);
    -[MSDCodeEntryAlertController setPreferredStyle:](v9, "setPreferredStyle:", 1);
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("DDL_AUTHENTICATION_TITLE"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("DDL_AUTHENTICATION_DESCRIPTION"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("DDL_AUTHENTICATION_ERROR_DESCRIPTION"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("CANCEL_OPTION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v10);
    v13 = objc_msgSend(v10, "rangeOfString:", CFSTR("demounit.apple.com"));
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = v13;
      v16 = v14;
      v28 = *MEMORY[0x24BEBB440];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAttributes:range:", v18, v15, v16);

    }
    v19 = -[MSDCodeEntryContentViewController initWithTitle:message:verificationCode:verificationErrorMesssage:andDelegate:]([MSDCodeEntryContentViewController alloc], "initWithTitle:message:verificationCode:verificationErrorMesssage:andDelegate:", v24, v12, v6, v23, v9);
    -[MSDCodeEntryAlertController setContentViewController:](v9, "setContentViewController:", v19);
    objc_initWeak(&location, v9);
    v20 = (void *)MEMORY[0x24BDF67E8];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __67__MSDCodeEntryAlertController_initWithVerificationCode_completion___block_invoke;
    v25[3] = &unk_24F47D268;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v20, "actionWithTitle:style:handler:", v11, 1, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDCodeEntryAlertController addAction:](v9, "addAction:", v21);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  return v9;
}

void __67__MSDCodeEntryAlertController_initWithVerificationCode_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  uint8_t v6[16];

  defaultLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22A6E6000, v2, OS_LOG_TYPE_DEFAULT, "Verification Code Alert cancelled", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "completion");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0);

  }
}

- (void)didCompleteVerification:(BOOL)a3 forCode:(id)a4
{
  void (**v4)(id, uint64_t);

  if (a3)
  {
    -[MSDCodeEntryAlertController completion](self, "completion", a3, a4);
    v4 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 1);

  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
