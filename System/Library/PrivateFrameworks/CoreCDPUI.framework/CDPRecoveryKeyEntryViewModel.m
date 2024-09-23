@implementation CDPRecoveryKeyEntryViewModel

- (CDPRecoveryKeyEntryViewModel)initWithContext:(id)a3 validator:(id)a4 mode:(int)a5
{
  id v9;
  id v10;
  CDPRecoveryKeyEntryViewModel *v11;
  CDPRecoveryKeyEntryViewModel *v12;
  BOOL *p_isFooterForVerifyFlow;

  v9 = a3;
  v10 = a4;
  v11 = -[CDPRecoveryKeyEntryViewModel init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_context, a3);
    v12->_mode = a5;
    objc_storeStrong((id *)&v12->_validator, a4);
    if (-[CDPRecoveryKeyEntryViewModel supportsRKRecovery](v12, "supportsRKRecovery"))
    {
      v12->_shouldSuppressCancelButton = 0;
      p_isFooterForVerifyFlow = &v12->_isFooterForVerifyFlow;
    }
    else
    {
      p_isFooterForVerifyFlow = &v12->_shouldSuppressCancelButton;
    }
    *p_isFooterForVerifyFlow = 1;
  }

  return v12;
}

- (CDPRecoveryKeyEntryViewModel)initWithContext:(id)a3 validator:(id)a4
{
  id v7;
  id v8;
  CDPRecoveryKeyEntryViewModel *v9;
  CDPRecoveryKeyEntryViewModel *v10;
  char v11;
  uint64_t v12;

  v7 = a3;
  v8 = a4;
  v9 = -[CDPRecoveryKeyEntryViewModel init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    if (-[CDPContext type](v10->_context, "type") == 8)
    {
      v10->_shouldSuppressCancelButton = 0;
      v11 = 1;
    }
    else
    {
      if (-[CDPContext type](v10->_context, "type") == 9)
      {
        v10->_shouldSuppressCancelButton = 0;
        v11 = 1;
        v12 = 34;
LABEL_8:
        *((_BYTE *)&v10->super.isa + v12) = v11;
        objc_storeStrong((id *)&v10->_secretValidator, a4);
        v10->_mode = 2;
        goto LABEL_9;
      }
      v11 = 0;
      v10->_shouldSuppressCancelButton = 1;
    }
    v12 = 33;
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (id)footerButtonTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int mode;
  void *v13;
  id v14;
  void *v15;
  const __CFString *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[16];

  v3 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(MEMORY[0x24BEBD4B8], "_systemInteractionTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BEBB368];
  v6 = (void *)MEMORY[0x24BEBB520];
  v7 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredFontForTextStyle:compatibleWithTraitCollection:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, v5, v10, *MEMORY[0x24BEBB360], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  mode = self->_mode;
  if (mode == 2)
  {
    if (-[CDPContext type](self->_context, "type") == 8)
    {
      v14 = objc_alloc(MEMORY[0x24BDD1458]);
      v15 = (void *)MEMORY[0x24BE1A458];
      v16 = CFSTR("RECOVERY_KEY_FORGOT_BUTTON_TITLE");
    }
    else
    {
      if (-[CDPContext type](self->_context, "type") != 9)
      {
        if (!-[CDPRecoveryKeyEntryViewModel supportsRKRecovery](self, "supportsRKRecovery")
          && !-[CDPRecoveryKeyEntryViewModel isDataRecoveryFlow](self, "isDataRecoveryFlow"))
        {
          v13 = 0;
          goto LABEL_14;
        }
        _CDPLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20DC8F000, v17, OS_LOG_TYPE_DEFAULT, "\"CDPContext supports RK recovery. Adding Don't Have Recovery Key? button in the recovery flow\", buf, 2u);
        }

      }
      v14 = objc_alloc(MEMORY[0x24BDD1458]);
      v15 = (void *)MEMORY[0x24BE1A458];
      v16 = CFSTR("DONT_HAVE_RECOVERY_KEY");
    }
    goto LABEL_13;
  }
  v13 = 0;
  if (mode == 1)
  {
    v14 = objc_alloc(MEMORY[0x24BDD1458]);
    v15 = (void *)MEMORY[0x24BE1A458];
    v16 = CFSTR("RECOVERY_KEY_CONTINUE_BUTTON_TITLE");
LABEL_13:
    objc_msgSend(v15, "builderForKey:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v14, "initWithString:attributes:", v19, v11);

  }
LABEL_14:

  return v13;
}

- (id)footerLabelText
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  if (self->_mode != 1)
  {
    v6 = 0;
    return v6;
  }
  v2 = -[CDPContext type](self->_context, "type");
  v3 = (void *)MEMORY[0x24BE1A458];
  if (v2 == 4)
  {
    v4 = CFSTR("CDP_VERIFY_RECOVERY_KEY_FOOTER_LABEL");
    if ((objc_msgSend(CFSTR("CDP_VERIFY_RECOVERY_KEY_FOOTER_LABEL"), "containsString:", CFSTR("REBRAND")) & 1) != 0
      || !_os_feature_enabled_impl())
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(CFSTR("CDP_VERIFY_RECOVERY_KEY_FOOTER_LABEL"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v5 = 1;
    }
    objc_msgSend(v3, "builderForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v5 & 1) == 0)
      return v6;
LABEL_15:

    return v6;
  }
  v4 = CFSTR("RECOVERY_KEY_FOOTER_LABEL_ENABLE_FLOW");
  if ((objc_msgSend(CFSTR("RECOVERY_KEY_FOOTER_LABEL_ENABLE_FLOW"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("RECOVERY_KEY_FOOTER_LABEL_ENABLE_FLOW"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
  }
  objc_msgSend(v3, "builderForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_15;
  return v6;
}

- (id)headerTitle
{
  int v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  if (-[CDPContext type](self->_context, "type") == 5
    || -[CDPContext type](self->_context, "type") == 4
    || -[CDPContext type](self->_context, "type") == 8
    || -[CDPContext type](self->_context, "type") == 9)
  {
    v3 = -[CDPRecoveryKeyEntryViewModel mode](self, "mode");
    v4 = (void *)MEMORY[0x24BE1A458];
    if (v3 == 1)
      v5 = CFSTR("RECOVERY_KEY_TITLE");
    else
      v5 = CFSTR("RECOVERY_KEY_TITLE_VERIFY");
  }
  else
  {
    v4 = (void *)MEMORY[0x24BE1A458];
    v5 = CFSTR("RECOVERY_KEY_TITLE_VERIFY_SIGNIN");
  }
  objc_msgSend(v4, "builderForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)headerSubtitle
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = -[CDPRecoveryKeyEntryViewModel mode](self, "mode");
  v4 = -[CDPContext type](self->_context, "type");
  v5 = v4;
  if (v3 == 1)
  {
    v6 = (void *)MEMORY[0x24BE1A458];
    if (v5 == 4)
      v7 = CFSTR("CDP_VERIFY_RECOVERY_KEY_HEADER_SUBTITLE");
    else
      v7 = CFSTR("RECOVERY_KEY_SUBTITLE_ENABLE_FLOW");
  }
  else if (v4 == 4)
  {
    v6 = (void *)MEMORY[0x24BE1A458];
    v7 = CFSTR("RECOVERY_KEY_SUBTITLE_VERIFY_REGEN_FLOW");
  }
  else
  {
    v8 = -[CDPContext type](self->_context, "type");
    v6 = (void *)MEMORY[0x24BE1A458];
    if (v8 == 5)
      v7 = CFSTR("RECOVERY_KEY_SUBTITLE_VERIFY_ENABLE_FLOW");
    else
      v7 = CFSTR("RECOVERY_KEY_SUBTITLE_VERIFY_JOIN_FLOW");
  }
  objc_msgSend(v6, "builderForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)placeholderText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("RECOVERY_KEY_PLACEHOLDER"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)recoveryKey
{
  return (id)-[CDPRecoveryKeyValidator generateRecoveryKeyWithError:](self->_validator, "generateRecoveryKeyWithError:", 0);
}

- (void)processCollectedRecoveryKey:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  CDPRemoteDeviceSecretValidatorProtocol *secretValidator;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[5];
  id v16;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CDPRecoveryKeyEntryViewModel_processCollectedRecoveryKey_completion___block_invoke;
  aBlock[3] = &unk_24C8544F8;
  aBlock[4] = self;
  v8 = v6;
  v16 = v8;
  v9 = a3;
  v10 = _Block_copy(aBlock);
  v11 = v10;
  secretValidator = self->_secretValidator;
  if (secretValidator)
  {
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __71__CDPRecoveryKeyEntryViewModel_processCollectedRecoveryKey_completion___block_invoke_2;
    v13[3] = &unk_24C854C88;
    v14 = v10;
    -[CDPRemoteDeviceSecretValidatorProtocol validateRecoveryKey:withCompletion:](secretValidator, "validateRecoveryKey:withCompletion:", v9, v13);

    v9 = v14;
  }
  else
  {
    -[CDPRecoveryKeyValidator confirmRecoveryKey:completion:](self->_validator, "confirmRecoveryKey:completion:", v9, v10);
  }

}

uint64_t __71__CDPRecoveryKeyEntryViewModel_processCollectedRecoveryKey_completion___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  uint64_t (*v5)(void);

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "completionHandler");
      v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, 1, 0);

    }
    v5 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v5 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v5();
}

uint64_t __71__CDPRecoveryKeyEntryViewModel_processCollectedRecoveryKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleCancel
{
  NSObject *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  CDPRemoteDeviceSecretValidatorProtocol *secretValidator;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CDPRecoveryKeyEntryViewModel mode](self, "mode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_20DC8F000, v3, OS_LOG_TYPE_DEFAULT, "\"Cancelling the recovery key flow in mode: %@\", (uint8_t *)&v10, 0xCu);

  }
  -[CDPRecoveryKeyEntryViewModel completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CDPRecoveryKeyEntryViewModel completionHandler](self, "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    _CDPStateError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v7);

  }
  secretValidator = self->_secretValidator;
  if (secretValidator)
  {
    _CDPStateError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteDeviceSecretValidatorProtocol cancelValidationWithError:](secretValidator, "cancelValidationWithError:", v9);

  }
}

- (void)handleForgotRecoveryKeyWithCDPStateError:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CDPRecoveryKeyEntryViewModel mode](self, "mode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v6;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_20DC8F000, v5, OS_LOG_TYPE_DEFAULT, "\"Forgot Recovery key tapped in mode: %@, error: %ld\", (uint8_t *)&v10, 0x16u);

  }
  -[CDPRecoveryKeyEntryViewModel completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CDPRecoveryKeyEntryViewModel completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    _CDPStateError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v9);

  }
}

- (void)handleNoRecoveryKeyWithCDPStateError:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = -[CDPRecoveryKeyEntryViewModel mode](self, "mode");
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_20DC8F000, v5, OS_LOG_TYPE_DEFAULT, "\"Don't Have Recovery Key? was tapped in account recovery flow. Mode: %d, error: %ld\", (uint8_t *)v9, 0x12u);
  }

  -[CDPRecoveryKeyEntryViewModel completionHandler](self, "completionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CDPRecoveryKeyEntryViewModel completionHandler](self, "completionHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    _CDPStateError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);

  }
}

- (BOOL)supportsRKRecovery
{
  return -[CDPContext idmsMasterKeyRecovery](self->_context, "idmsMasterKeyRecovery");
}

- (BOOL)mandatesRecoveryKey
{
  return -[CDPContext mandatesRecoveryKey](self->_context, "mandatesRecoveryKey");
}

- (BOOL)isDataRecoveryFlow
{
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[CDPContext type](self->_context, "type");
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_20DC8F000, v3, OS_LOG_TYPE_DEFAULT, "\"cdpContextType = %ld\", (uint8_t *)&v6, 0xCu);
  }

  return (objc_msgSend(MEMORY[0x24BE1A3F8], "isSubsetOfContextTypeSignIn:", -[CDPContext type](self->_context, "type")) & 1) != 0
      || -[CDPContext type](self->_context, "type") == 2;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)mode
{
  return self->_mode;
}

- (BOOL)shouldSuppressCancelButton
{
  return self->_shouldSuppressCancelButton;
}

- (void)setShouldSuppressCancelButton:(BOOL)a3
{
  self->_shouldSuppressCancelButton = a3;
}

- (BOOL)isFooterForVerifyFlow
{
  return self->_isFooterForVerifyFlow;
}

- (void)setIsFooterForVerifyFlow:(BOOL)a3
{
  self->_isFooterForVerifyFlow = a3;
}

- (BOOL)isFooterForMismatchRepairFlow
{
  return self->_isFooterForMismatchRepairFlow;
}

- (void)setIsFooterForMismatchRepairFlow:(BOOL)a3
{
  self->_isFooterForMismatchRepairFlow = a3;
}

- (BOOL)isWalrusEnabled
{
  return self->_isWalrusEnabled;
}

- (void)setIsWalrusEnabled:(BOOL)a3
{
  self->_isWalrusEnabled = a3;
}

- (CDPEscapeOption)custodianRecoveryEscapeOption
{
  return self->_custodianRecoveryEscapeOption;
}

- (void)setCustodianRecoveryEscapeOption:(id)a3
{
  objc_storeStrong((id *)&self->_custodianRecoveryEscapeOption, a3);
}

- (CDPRemoteValidationEscapeOffer)deleteiCloudDataEscapeOffer
{
  return self->_deleteiCloudDataEscapeOffer;
}

- (void)setDeleteiCloudDataEscapeOffer:(id)a3
{
  objc_storeStrong((id *)&self->_deleteiCloudDataEscapeOffer, a3);
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
  objc_storeStrong((id *)&self->_deleteiCloudDataEscapeOffer, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryEscapeOption, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_secretValidator, 0);
  objc_storeStrong((id *)&self->_validator, 0);
}

@end
