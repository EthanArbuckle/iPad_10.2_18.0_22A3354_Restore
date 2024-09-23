@implementation BKUIPasscodeEntryController

- (BKUIPasscodeEntryController)initWithVerifiedPasscodeAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BKUIPasscodeEntryController *v11;
  uint64_t v12;
  id passcodeEntryAction;
  objc_super v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("PASSCODE_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1EA281248, CFSTR("Pearl-periocular"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("PASSCODE_DETAIL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_1EA281248, CFSTR("Pearl-periocular"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15.receiver = self;
  v15.super_class = (Class)BKUIPasscodeEntryController;
  v11 = -[BKUIPasscodeEntryController initWithTitle:detailText:icon:](&v15, sel_initWithTitle_detailText_icon_, v7, v10, 0);
  if (v11)
  {
    v12 = objc_msgSend(v4, "copy");
    passcodeEntryAction = v11->_passcodeEntryAction;
    v11->_passcodeEntryAction = (id)v12;

  }
  return v11;
}

+ (BOOL)isDevicePasscodeSet
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (int)unlockType
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unlockScreenType");

  return v3;
}

- (int)simplePasscodeType
{
  void *v2;
  int v4;

  v4 = 0;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unlockScreenTypeWithOutSimplePasscodeType:", &v4);

  return v4;
}

- (BOOL)verifyPasscode:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;

  v3 = (void *)MEMORY[0x1E0D47230];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "unlockDeviceWithPasscode:outError:", v4, &v10);

  v7 = v10;
  if ((v6 & 1) == 0)
  {
    _BKUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BKUIPasscodeEntryController verifyPasscode:].cold.1(v7, v8);

  }
  return v6;
}

- (void)setUnlockScreenType:(int)a3 simplePasscodeType:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  if (a3 == 2)
  {
    v4 = 0;
    v5 = 1;
  }
  else
  {
    if (!a3)
    {
      switch(a4)
      {
        case 0:
          v5 = 0;
          v4 = 4;
          goto LABEL_10;
        case 1:
          v5 = 0;
          v4 = 6;
          goto LABEL_10;
        case -1:
          -[BKUIPasscodeEntryController setUnlockScreenType:simplePasscodeType:].cold.1();
      }
    }
    v4 = 0;
    v5 = 0;
  }
LABEL_10:
  v6.receiver = self;
  v6.super_class = (Class)BKUIPasscodeEntryController;
  -[OBPasscodeViewController configureForPasscodeEntry:length:](&v6, sel_configureForPasscodeEntry_length_, v5, v4);
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKUIPasscodeEntryController;
  -[OBPasscodeViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[OBPasscodeViewController setDelegate:](self, "setDelegate:", self);
  -[BKUIPasscodeEntryController setUnlockScreenType:simplePasscodeType:](self, "setUnlockScreenType:simplePasscodeType:", -[BKUIPasscodeEntryController unlockType](self, "unlockType"), -[BKUIPasscodeEntryController simplePasscodeType](self, "simplePasscodeType"));
  v3 = objc_alloc(MEMORY[0x1E0CEA380]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1EA281248, CFSTR("Pearl-periocular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel_cancelPasscodeEntry);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

}

- (void)cancelPasscodeEntry
{
  void (**v2)(id, _QWORD);

  -[BKUIPasscodeEntryController passcodeEntryAction](self, "passcodeEntryAction");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, 0);

}

- (id)completionButtonTitleForPasscodeViewController:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_1EA281248, CFSTR("Pearl-periocular"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)passcodeViewController:(id)a3 didEnterPasscode:(id)a4
{
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a4;
  if (-[BKUIPasscodeEntryController verifyPasscode:](self, "verifyPasscode:"))
  {
    -[BKUIPasscodeEntryController passcodeEntryAction](self, "passcodeEntryAction");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

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

- (id)passcodeEntryAction
{
  return self->_passcodeEntryAction;
}

- (void)setPasscodeEntryAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1216);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_passcodeEntryAction, 0);
}

- (void)verifyPasscode:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DB281000, a2, OS_LOG_TYPE_ERROR, "Failed to verify passcode %@", (uint8_t *)&v4, 0xCu);

}

- (void)setUnlockScreenType:simplePasscodeType:.cold.1()
{
  __assert_rtn("-[BKUIPasscodeEntryController setUnlockScreenType:simplePasscodeType:]", "BKUIPasscodeEntryController.m", 86, "0");
}

@end
