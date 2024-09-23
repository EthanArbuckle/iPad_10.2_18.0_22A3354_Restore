@implementation DKPasscodeViewController

- (DKPasscodeViewController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DKPasscodeViewController *v7;
  DKPasscodeViewController *v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PASSCODE_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PASSCODE_DETAIL"), &stru_24F20EA28, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)DKPasscodeViewController;
  v7 = -[DKPasscodeViewController initWithTitle:detailText:icon:contentLayout:](&v10, sel_initWithTitle_detailText_icon_contentLayout_, v4, v6, 0, 2);
  v8 = v7;
  if (v7)
    -[OBPasscodeViewController setDelegate:](v7, "setDelegate:", v7);

  return v8;
}

- (void)setUnlockScreenType:(int)a3 simplePasscodeType:(int)a4
{
  uint64_t v7;
  uint64_t v8;

  -[DKPasscodeViewController setSimplePasscodeType:](self, "setSimplePasscodeType:", *(_QWORD *)&a4);
  if (a3 == 2)
  {
    v7 = 0;
    v8 = 1;
  }
  else
  {
    if (!a3)
    {
      switch(a4)
      {
        case 0:
          v8 = 0;
          v7 = 4;
          goto LABEL_10;
        case 1:
          v8 = 0;
          v7 = 6;
          goto LABEL_10;
        case -1:
          -[DKPasscodeViewController setUnlockScreenType:simplePasscodeType:].cold.1();
      }
    }
    v7 = 0;
    v8 = 0;
  }
LABEL_10:
  -[OBPasscodeViewController configureForPasscodeEntry:length:](self, "configureForPasscodeEntry:length:", v8, v7);
}

- (id)completionButtonTitleForPasscodeViewController:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_24F20EA28, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)passcodeViewController:(id)a3 didEnterPasscode:(id)a4
{
  uint64_t (**v5)(_QWORD, _QWORD);
  int v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a4;
  -[DKPasscodeViewController verifyPasscode](self, "verifyPasscode");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = ((uint64_t (**)(_QWORD, id))v5)[2](v5, v8);

  if (v6)
  {
    -[DKPasscodeViewController passcodeVerified](self, "passcodeVerified");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v7)[2](v7, v8, -[DKPasscodeViewController simplePasscodeType](self, "simplePasscodeType"));

  }
  else
  {
    -[OBPasscodeViewController shakePasscodeEntry](self, "shakePasscodeEntry");
    -[OBPasscodeViewController clearPasscodeEntry](self, "clearPasscodeEntry");
  }

}

- (BOOL)passcodeViewController:(id)a3 shouldEnableCompletionButtonForPasscode:(id)a4
{
  return objc_msgSend(a4, "length", a3) != 0;
}

- (id)verifyPasscode
{
  return self->_verifyPasscode;
}

- (void)setVerifyPasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (id)passcodeVerified
{
  return self->_passcodeVerified;
}

- (void)setPasscodeVerified:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1232);
}

- (int)simplePasscodeType
{
  return self->_simplePasscodeType;
}

- (void)setSimplePasscodeType:(int)a3
{
  self->_simplePasscodeType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_passcodeVerified, 0);
  objc_storeStrong(&self->_verifyPasscode, 0);
}

- (void)setUnlockScreenType:simplePasscodeType:.cold.1()
{
  __assert_rtn("-[DKPasscodeViewController setUnlockScreenType:simplePasscodeType:]", "DKPasscodeViewController.m", 54, "0");
}

@end
