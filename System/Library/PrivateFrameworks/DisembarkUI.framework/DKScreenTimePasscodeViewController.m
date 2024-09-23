@implementation DKScreenTimePasscodeViewController

- (DKScreenTimePasscodeViewController)initWithDeviceName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  DKScreenTimePasscodeViewController *v12;
  DKScreenTimePasscodeViewController *v13;
  objc_super v15;

  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SCREEN_TIME_PASSCODE_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SCREEN_TIME_PASSCODE_DETAIL"), &stru_24F20EA28, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15.receiver = self;
  v15.super_class = (Class)DKScreenTimePasscodeViewController;
  v12 = -[DKScreenTimePasscodeViewController initWithTitle:detailText:icon:contentLayout:](&v15, sel_initWithTitle_detailText_icon_contentLayout_, v7, v11, 0, 2);
  v13 = v12;
  if (v12)
  {
    -[OBPasscodeViewController setDelegate:](v12, "setDelegate:", v12);
    -[OBPasscodeViewController configureForPasscodeEntry:length:](v13, "configureForPasscodeEntry:length:", 0, 4);
  }

  return v13;
}

- (id)completionButtonTitleForPasscodeViewController:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[DKScreenTimePasscodeViewController completionButtonTitleForPasscodeViewController:]", "DKScreenTimePasscodeViewController.m", 37, "0");
}

- (void)passcodeViewController:(id)a3 didEnterPasscode:(id)a4
{
  id v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  int v7;
  void (**v8)(void);

  v5 = a4;
  -[DKScreenTimePasscodeViewController verifyPasscode](self, "verifyPasscode");
  v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v5);

  if (v7)
  {
    -[DKScreenTimePasscodeViewController passcodeVerified](self, "passcodeVerified");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
  else
  {
    -[OBPasscodeViewController shakePasscodeEntry](self, "shakePasscodeEntry");
    -[OBPasscodeViewController clearPasscodeEntry](self, "clearPasscodeEntry");
  }
}

- (BOOL)passcodeViewController:(id)a3 shouldEnableCompletionButtonForPasscode:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[DKScreenTimePasscodeViewController passcodeViewController:shouldEnableCompletionButtonForPasscode:]", "DKScreenTimePasscodeViewController.m", 53, "0");
}

- (id)verifyPasscode
{
  return self->_verifyPasscode;
}

- (void)setVerifyPasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1216);
}

- (id)passcodeVerified
{
  return self->_passcodeVerified;
}

- (void)setPasscodeVerified:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_passcodeVerified, 0);
  objc_storeStrong(&self->_verifyPasscode, 0);
}

@end
