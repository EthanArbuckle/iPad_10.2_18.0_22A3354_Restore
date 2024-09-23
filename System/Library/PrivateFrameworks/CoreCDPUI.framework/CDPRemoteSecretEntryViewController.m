@implementation CDPRemoteSecretEntryViewController

- (CDPRemoteSecretEntryViewController)initWithDevice:(id)a3 validator:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  CDPRemoteSecretEntryViewController *v14;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = objc_msgSend(v9, "hasNumericSecret");
  objc_msgSend(v9, "numericSecretLength");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CDPRemoteSecretEntryViewController initWithIsNumeric:numericLength:validator:delegate:](self, "initWithIsNumeric:numericLength:validator:delegate:", v12, v13, v11, v10);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_remoteRecoveryDevice, a3);
    v14->_remainingAttempts = -[CDPDevice remainingAttempts](v14->_remoteRecoveryDevice, "remainingAttempts");
  }

  return v14;
}

- (CDPRemoteSecretEntryViewController)initWithIsNumeric:(BOOL)a3 numericLength:(id)a4 validator:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  CDPRemoteSecretEntryViewController *v13;
  CDPRemoteSecretEntryViewController *v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  id WeakRetained;
  int v19;
  void *v20;
  void *v21;

  v11 = a4;
  v12 = a6;
  v13 = -[CDPRemoteSecretEntryViewController initWithValidator:](self, "initWithValidator:", a5);
  v14 = v13;
  if (v13)
  {
    *(&v13->_hasNumericSecret + 1) = a3;
    objc_storeStrong((id *)&v13->_numericSecretLength, a4);
    v14->_remainingAttempts = 3;
    objc_storeWeak((id *)&v14->_delegate, v12);
    -[DevicePINController setPinDelegate:](v14, "setPinDelegate:", v14);
    if (-[CDPRemoteSecretEntryViewController simplePIN](v14, "simplePIN"))
      -[DevicePINController setPinLength:](v14, "setPinLength:", -[NSNumber integerValue](v14->_numericSecretLength, "integerValue"));
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    v17 = v16 != 1 && *(&v14->_hasNumericSecret + 1);
    -[DevicePINController setNumericPIN:](v14, "setNumericPIN:", v17);
    WeakRetained = objc_loadWeakRetained((id *)&v14->_delegate);
    v19 = objc_msgSend(WeakRetained, "performingAccountRecovery");

    if (v19)
    {
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_NEXT_BUTTON"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DevicePINController setDoneButtonTitle:](v14, "setDoneButtonTitle:", v21);

    }
  }

  return v14;
}

- (CDPRemoteSecretEntryViewController)initWithValidator:(id)a3
{
  id v5;
  CDPRemoteSecretEntryViewController *v6;
  CDPRemoteSecretEntryViewController *v7;

  v5 = a3;
  v6 = -[CDPPassphraseEntryViewController init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_validator, a3);

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  CDPRemoteSecretEntryViewController *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CDPRemoteSecretEntryViewController;
  -[DevicePINController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[CDPRemoteSecretEntryViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (CDPRemoteSecretEntryViewController *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    -[CDPRemoteSecretEntryViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setBackgroundOpacity:", 0.0);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDPRemoteSecretEntryViewController;
  -[DevicePINController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CDPRemoteSecretEntryViewController enableUserInteractionAndStopSpinner](self, "enableUserInteractionAndStopSpinner");
}

- (BOOL)useProgressiveDelays
{
  return 0;
}

- (void)setPane:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPRemoteSecretEntryViewController;
  -[DevicePINController setPane:](&v9, sel_setPane_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "setRemoteSecretType:", 0);
    objc_msgSend(v5, "setDevice:", self->_remoteRecoveryDevice);
    -[CDPRemoteSecretEntryViewController escapeOffer](self, "escapeOffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPresentingViewController:", self);

    -[CDPRemoteSecretEntryViewController escapeOffer](self, "escapeOffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEscapeOffer:", v7);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "setRemoteAccountRecovery:", objc_msgSend(WeakRetained, "performingAccountRecovery"));

  }
}

- (id)title
{
  return 0;
}

- (id)_passcodeEntryRequestForDevice
{
  void *v3;
  id WeakRetained;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  if (!-[CDPDevice isCurrentDevice](self->_remoteRecoveryDevice, "isCurrentDevice"))
  {
    if (!self->_remoteRecoveryDevice)
    {
      CDPLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      return v18;
    }
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_MESSAGE_OTHER"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSecretType:", -[CDPDevice localSecretType](self->_remoteRecoveryDevice, "localSecretType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDevice modelClass](self->_remoteRecoveryDevice, "modelClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addUnqualifiedDeviceClass:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDevice localizedName](self->_remoteRecoveryDevice, "localizedName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasLocalSecret") & 1) == 0)
  {

    goto LABEL_10;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "performingAccountRecovery");

  if (!v5)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_MESSAGE_SAME"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSecretType:", -[CDPDevice localSecretType](self->_remoteRecoveryDevice, "localSecretType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDevice modelClass](self->_remoteRecoveryDevice, "modelClass");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addUnqualifiedDeviceClass:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    return v18;
  }
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BE1A458];
  v9 = CFSTR("ACCOUNT_RECOVERY_CURRENT_DEVICE_REMOTE_SECRET_INSTRUCTIONS");
  if ((objc_msgSend(CFSTR("ACCOUNT_RECOVERY_CURRENT_DEVICE_REMOTE_SECRET_INSTRUCTIONS"), "containsString:", CFSTR("REBRAND")) & 1) != 0|| !_os_feature_enabled_impl())
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("ACCOUNT_RECOVERY_CURRENT_DEVICE_REMOTE_SECRET_INSTRUCTIONS"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
  }
  objc_msgSend(v8, "builderForKey:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSecretType:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addDeviceClass:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  return v18;
}

- (id)_passcodeEntryExplaination
{
  void *v3;
  __CFString *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BE1A458];
  v4 = CFSTR("REMOTE_SECRET_ENTRY_SUBTITLE");
  if ((objc_msgSend(CFSTR("REMOTE_SECRET_ENTRY_SUBTITLE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("REMOTE_SECRET_ENTRY_SUBTITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = 1;
  }
  objc_msgSend(v3, "builderForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSecretType:", -[CDPDevice localSecretType](self->_remoteRecoveryDevice, "localSecretType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  return v8;
}

- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4
{
  return 1;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  if (self->_validationState == 2)
  {
    self->_validationState = 0;
    -[CDPRemoteSecretEntryViewController didEnterValidRemoteSecret:](self, "didEnterValidRemoteSecret:", a3);
  }
}

- (void)didCancelEnteringPIN
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cancelledRemoteSecretEntry:", self);

}

- (BOOL)validatePIN:(id)a3
{
  id v4;
  void *v5;
  uint64_t *p_validationState;
  NSObject *v7;
  CDPRemoteDeviceSecretValidator *validator;
  char v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  CDPRemoteDeviceSecretValidator *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSDetailController pane](self, "pane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  p_validationState = (uint64_t *)&self->_validationState;
  switch(self->_validationState)
  {
    case 0uLL:
      _CDPLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        validator = self->_validator;
        v15 = 138412290;
        v16 = validator;
        _os_log_impl(&dword_20DC8F000, v7, OS_LOG_TYPE_DEFAULT, "\"ValidationStateNone - Requesting validation using %@\", (uint8_t *)&v15, 0xCu);
      }

      v9 = 1;
      *p_validationState = 1;
      -[CDPRemoteSecretEntryViewController _handleSecretValidationWithPasscode:](self, "_handleSecretValidationWithPasscode:", v4);
      goto LABEL_17;
    case 1uLL:
      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[CDPRemoteSecretEntryViewController validatePIN:].cold.5();
      goto LABEL_12;
    case 2uLL:
      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[CDPRemoteSecretEntryViewController validatePIN:].cold.3();
LABEL_12:

      goto LABEL_13;
    case 3uLL:
      _CDPLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[CDPRemoteSecretEntryViewController validatePIN:].cold.4();

      v9 = 0;
      *p_validationState = 0;
      goto LABEL_17;
    default:
      _CDPLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[CDPRemoteSecretEntryViewController validatePIN:].cold.2(p_validationState, v10);

LABEL_13:
      v9 = 1;
LABEL_17:
      _CDPLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[CDPRemoteSecretEntryViewController validatePIN:].cold.1(v9, v13);

      return v9;
  }
}

- (void)didEnterValidRemoteSecret:(id)a3
{
  NSObject *v4;
  id WeakRetained;

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CDPRemoteSecretEntryViewController didEnterValidRemoteSecret:].cold.1();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteSecretEntry:didAcceptValidRemoteSecretForDevice:", self, self->_remoteRecoveryDevice);

}

- (BOOL)simplePIN
{
  return *(&self->_hasNumericSecret + 1)
      && (-[NSNumber integerValue](self->_numericSecretLength, "integerValue") & 0xFFFFFFFFFFFFFFFDLL) == 4;
}

- (void)_handleSecretValidationWithPasscode:(id)a3
{
  id v4;
  CDPRemoteDeviceSecretValidator *validator;
  CDPDevice *remoteRecoveryDevice;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CDPRemoteSecretEntryViewController disableUserInteractionAndStartSpinner](self, "disableUserInteractionAndStartSpinner");
  validator = self->_validator;
  remoteRecoveryDevice = self->_remoteRecoveryDevice;
  if (remoteRecoveryDevice)
  {
    v11[0] = self->_remoteRecoveryDevice;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke;
  v9[3] = &unk_24C854A60;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[CDPRemoteDeviceSecretValidator validateSecret:devices:type:withCompletion:](validator, "validateSecret:devices:type:withCompletion:", v8, v7, 0, v9);
  if (remoteRecoveryDevice)

}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[16];

  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v9 = *(void **)(v8 + 1232);
    *(_QWORD *)(v8 + 1232) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1248) = 2;
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v10, OS_LOG_TYPE_DEFAULT, "\"Validator provided response, moved to ValidationStateValid\", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "pinEntered:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    --*(_QWORD *)(v8 + 1224);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "setRemainingAttempts:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "remainingAttempts") - 1);
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "enableUserInteractionAndStopSpinner");
      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DC8F000, v11, OS_LOG_TYPE_DEFAULT, "\"Validator provided response, moved to ValidationStateInvalid\", buf, 2u);
      }

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1248) = 3;
      v13 = *(void **)(a1 + 32);
      v12 = *(void **)(a1 + 40);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_30;
      v29[3] = &unk_24C854520;
      v29[4] = v13;
      v30 = v12;
      objc_msgSend(v13, "showIncorrectRemoteSecretAlertForPasscode:withRecoveryError:completion:", v30, v7, v29);
      v14 = v30;
    }
    else
    {
      _CDPLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_cold_1((uint64_t)v7, v15, v16, v17, v18, v19, v20, v21);

      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(v22 + 1232);
      *(_QWORD *)(v22 + 1232) = 0;

      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_32;
      v26[3] = &unk_24C854520;
      v24 = v7;
      v25 = *(_QWORD *)(a1 + 32);
      v27 = v24;
      v28 = v25;
      dispatch_async(MEMORY[0x24BDAC9B8], v26);
      v14 = v27;
    }

  }
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_30(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pinEntered:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "pane");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_32(uint64_t a1)
{
  id *v2;
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  id WeakRetained;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE1A368]);

  if (!v4)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_32_cold_5();

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));
    objc_msgSend(WeakRetained, "finishValidation:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    goto LABEL_8;
  }
  v5 = objc_msgSend(*v2, "code");
  if (v5 <= -5213)
  {
    switch(v5)
    {
      case -5223:
        objc_msgSend(*(id *)(a1 + 40), "enableUserInteractionAndStopSpinner");
        v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));

        if (!v10)
        {
          _CDPLogSystem();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_32_cold_4();

        }
        v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));
        objc_msgSend(v12, "performPiggybackingRecovery:", *(_QWORD *)(a1 + 40));

        break;
      case -5221:
        objc_msgSend(*(id *)(a1 + 40), "enableUserInteractionAndStopSpinner");
        v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));

        if (!v13)
        {
          _CDPLogSystem();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_32_cold_3();

        }
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));
        objc_msgSend(WeakRetained, "presentDeviceSelection:", *(_QWORD *)(a1 + 40));
        goto LABEL_8;
      case -5218:
        objc_msgSend(*(id *)(a1 + 40), "enableUserInteractionAndStopSpinner");
        v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));

        if (!v8)
        {
          _CDPLogSystem();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_32_cold_2();

        }
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));
        objc_msgSend(WeakRetained, "performCustodianRecovery:", *(_QWORD *)(a1 + 40));
LABEL_8:

        return;
    }
LABEL_33:
    v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));
    objc_msgSend(v15, "dismissRecoveryFlow:completion:", *(_QWORD *)(a1 + 40), 0);

    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_32_cold_1((uint64_t)v2, v16, v17, v18, v19, v20, v21, v22);

    return;
  }
  switch(v5)
  {
    case -5212:
      objc_msgSend(*(id *)(a1 + 40), "enableUserInteractionAndStopSpinner");
      v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));
      objc_msgSend(v23, "performRecoveryKeyRecovery:", *(_QWORD *)(a1 + 40));
      break;
    case -5209:
      objc_msgSend(*(id *)(a1 + 40), "enableUserInteractionAndStopSpinner");
      v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));
      objc_msgSend(v23, "performRemoteApproval:", *(_QWORD *)(a1 + 40));
      break;
    case -5208:
      v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));
      objc_msgSend(v23, "performAccountReset:", *(_QWORD *)(a1 + 40));
      break;
    case -5206:
      objc_msgSend(*(id *)(a1 + 40), "enableUserInteractionAndStopSpinner");
      v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));
      objc_msgSend(v23, "remoteSecretEntry:depletedRemainingAttemptsForDevice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1216));
      break;
    case -5203:
      objc_msgSend(*(id *)(a1 + 40), "enableUserInteractionAndStopSpinner");
      v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));
      objc_msgSend(v23, "exceededMaximumAttemptsForRemoteSecretEntry:", *(_QWORD *)(a1 + 40));
      break;
    case -5200:
      v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));
      objc_msgSend(v23, "finishValidation:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
      break;
    default:
      goto LABEL_33;
  }

}

- (void)showIncorrectRemoteSecretAlertForPasscode:(id)a3 withRecoveryError:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id WeakRetained;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[5];
  id v53;
  id v54;

  v8 = a3;
  v9 = a5;
  if (self->_remoteRecoveryDevice)
  {
    objc_msgSend(a4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v12, "cdp_isCDPErrorWithCode:", -5205))
    {
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_RECOVERY_ERROR_TITLE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedString");
      v51 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_RECOVERY_ERROR_MESSAGE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSecretType:", -[CDPDevice localSecretType](self->_remoteRecoveryDevice, "localSecretType"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPDevice modelClass](self->_remoteRecoveryDevice, "modelClass");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addDeviceClass:", v20);
      v21 = v9;
      v22 = v12;
      v23 = v10;
      v24 = v8;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v24;
      v10 = v23;
      v12 = v22;
      v9 = v21;
      v15 = (void *)v51;

LABEL_16:
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deviceClass");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    -[CDPDevice modelClass](self->_remoteRecoveryDevice, "modelClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      -[CDPDevice modelClass](self->_remoteRecoveryDevice, "modelClass");
      v50 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = 0;
    }

    v26 = -[CDPDevice localSecretType](self->_remoteRecoveryDevice, "localSecretType");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v48 = v8;
    if ((objc_msgSend(WeakRetained, "performingAccountRecovery") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "hasLocalSecret") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0;
        v30 = objc_msgSend(v29, "unlockDeviceWithPasscode:outError:", v8, &v54);
        v47 = v54;

        if (v30)
        {
          objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_INCORRECT_TITLE_OTHER_DEVICE"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addSecretType:", v26);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addDeviceClass:", v50);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "localizedString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_INCORRECT_MESSAGE_OTHER_DEVICE"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addSecretType:", v26);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addDeviceClass:", v50);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addSecretType:", v26);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addDeviceClass:", v49);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "localizedString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = (void *)v50;
LABEL_15:

          v8 = v48;
          goto LABEL_16;
        }
LABEL_14:
        objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_INCORRECT_TITLE"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addSecretType:", v26);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localizedString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_INCORRECT_MESSAGE"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)v50;
        objc_msgSend(v34, "addDeviceClass:", v50);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addSecretType:", v26);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localizedString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }

    }
    v47 = 0;
    goto LABEL_14;
  }
  CDPLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
  v41 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __109__CDPRemoteSecretEntryViewController_showIncorrectRemoteSecretAlertForPasscode_withRecoveryError_completion___block_invoke;
  v52[3] = &unk_24C854CB0;
  v52[4] = self;
  v53 = v9;
  v43 = v9;
  objc_msgSend(v41, "actionWithTitle:style:handler:", v42, 0, v52);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v15, v16, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addAction:", v44);
  -[CDPRemoteSecretEntryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v45, 1, 0);

}

uint64_t __109__CDPRemoteSecretEntryViewController_showIncorrectRemoteSecretAlertForPasscode_withRecoveryError_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setLastEntry:", 0);
}

- (void)disableUserInteractionAndStartSpinner
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteSecretEntryViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimatingInNavItem:forIdentifier:hideBackButton:", v4, CFSTR("remoteSecretValidator"), 1);

  -[CDPRemoteSecretEntryViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

}

- (void)enableUserInteractionAndStopSpinner
{
  void *v2;
  id v3;

  -[CDPRemoteSecretEntryViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimatingForIdentifier:", CFSTR("remoteSecretValidator"));

}

- (CDPRemoteDeviceSecretValidator)validator
{
  return self->_validator;
}

- (CDPRemoteValidationEscapeOffer)escapeOffer
{
  return self->_escapeOffer;
}

- (void)setEscapeOffer:(id)a3
{
  objc_storeStrong((id *)&self->_escapeOffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_escapeOffer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_remoteRecoveryDevice, 0);
  objc_storeStrong((id *)&self->_numericSecretLength, 0);
}

- (void)validatePIN:(char)a1 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_20DC8F000, a2, OS_LOG_TYPE_DEBUG, "\"validatePIN: Returning isValid=%i\", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)validatePIN:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_20DC8F000, a2, OS_LOG_TYPE_DEBUG, "\"Unexpected _validationState=%lu - Returning isValid=YES\", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)validatePIN:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"ValidationStateValid - Returning isValid=YES\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)validatePIN:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"ValidationStateInvalid - Returning isValid=NO\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)validatePIN:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"ValidationStateWaiting - Returning isValid=YES\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didEnterValidRemoteSecret:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"didEnterValidRemoteSecret: called, sending the delegate remoteSecretEntry:didAcceptValidRemoteSecretForDevice:\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_20DC8F000, a2, a3, "\"Validator indicated that we can't retry: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_32_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_20DC8F000, a2, a3, "\"Default error returned by validator: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_32_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_20DC8F000, v0, v1, "\"Delegate is nil when trying to performCustodianRecovery\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_32_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_20DC8F000, v0, v1, "\"Delegate is nil when trying to presentDeviceSelection\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_32_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_20DC8F000, v0, v1, "\"Delegate is nil when trying to performPiggybackingFromRemoteSecretEntry\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_32_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_20DC8F000, v0, v1, "\"Unexpected error returned by the daemon, dismissing and attempting to cancel validation\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
