@implementation CDPUIWalrusStatusChangeModel

- (CDPUIWalrusStatusChangeModel)initWithTargetStatus:(unint64_t)a3 statusProvider:(id)a4 statusUpdater:(id)a5
{
  id v9;
  id v10;
  CDPUIWalrusStatusChangeModel *v11;
  CDPUIWalrusStatusChangeModel *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CDPUIWalrusStatusChangeModel;
  v11 = -[CDPUIWalrusStatusChangeModel init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_targetStatus = a3;
    objc_storeStrong((id *)&v11->_walrusStatusProvider, a4);
    objc_storeStrong((id *)&v12->_walrusStatusUpdater, a5);
  }

  return v12;
}

- (CDPUIWalrusStatusChangeModel)initWithTargetStatus:(unint64_t)a3 statusProvider:(id)a4 statusUpdater:(id)a5 context:(id)a6
{
  id v11;
  id v12;
  id v13;
  CDPUIWalrusStatusChangeModel *v14;
  CDPUIWalrusStatusChangeModel *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CDPUIWalrusStatusChangeModel;
  v14 = -[CDPUIWalrusStatusChangeModel init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_targetStatus = a3;
    objc_storeStrong((id *)&v14->_walrusStatusProvider, a4);
    objc_storeStrong((id *)&v15->_walrusStatusUpdater, a5);
    objc_storeStrong((id *)&v15->_context, a6);
  }

  return v15;
}

- (void)_checkCurrentStatus:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  CDPWalrusStatusProvider *walrusStatusProvider;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_targetStatus)
  {
    walrusStatusProvider = self->_walrusStatusProvider;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __52__CDPUIWalrusStatusChangeModel__checkCurrentStatus___block_invoke;
    v10[3] = &unk_24C855050;
    v10[4] = self;
    v11 = v4;
    -[CDPWalrusStatusProvider combinedWalrusStatusWithCompletion:](walrusStatusProvider, "combinedWalrusStatusWithCompletion:", v10);

  }
  else
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl(&dword_20DC8F000, v7, OS_LOG_TYPE_DEFAULT, "\"%@: Skipping user prompt because the target status is CDPWalrusStatusUnknown.\", buf, 0xCu);

    }
    v5[2](v5, 0);
  }

}

void __52__CDPUIWalrusStatusChangeModel__checkCurrentStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CDPUIWalrusStatusChangeModel__checkCurrentStatus___block_invoke_2;
  block[3] = &unk_24C8542A0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

_QWORD *__52__CDPUIWalrusStatusChangeModel__checkCurrentStatus___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  int v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void);
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) == objc_msgSend(*(id *)(a1 + 32), "octagonWalrusStatus"))
    v2 = objc_msgSend(*(id *)(a1 + 32), "mismatchDetected");
  else
    v2 = 1;
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
    v7 = objc_msgSend(*(id *)(a1 + 32), "mismatchDetected");
    v12 = 138413058;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    v16 = 1024;
    v17 = v2;
    v18 = 1024;
    v19 = v7;
    _os_log_impl(&dword_20DC8F000, v3, OS_LOG_TYPE_DEFAULT, "\"%@: target state %ld, needs change: %{BOOL}d, mismatchDetected: %{BOOL}d\", (uint8_t *)&v12, 0x22u);

  }
  if (!v2)
  {
    v11 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    return (_QWORD *)v11();
  }
  result = *(_QWORD **)(a1 + 40);
  v9 = result[4];
  switch(v9)
  {
    case 0:
      v11 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      return (_QWORD *)v11();
    case 1:
      v11 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      return (_QWORD *)v11();
    case 2:
      if (objc_msgSend(result, "_hasLocalSecret"))
        v10 = 3;
      else
        v10 = 2;
      return (_QWORD *)(*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v10);
  }
  return result;
}

- (NSString)titleText
{
  unint64_t targetStatus;
  _BOOL4 v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  targetStatus = self->_targetStatus;
  if (targetStatus == 1)
  {
    v4 = (void *)MEMORY[0x24BE1A458];
    v5 = CFSTR("ADVANCED_DATA_PROTECTION_ENABLE");
    goto LABEL_6;
  }
  if (targetStatus == 2)
  {
    v3 = -[CDPUIWalrusStatusChangeModel _hasLocalSecret](self, "_hasLocalSecret");
    v4 = (void *)MEMORY[0x24BE1A458];
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("ADVANCED_DATA_PROTECTION_DISABLE_NO_PASSCODE_ALERT_TITLE"), CFSTR("Localizable-Walrus"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v5 = CFSTR("ADVANCED_DATA_PROTECTION_DISABLE");
LABEL_6:
    objc_msgSend(v4, "builderForKey:inTable:", v5, CFSTR("Localizable-Walrus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSecretType:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDeviceClass:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    return (NSString *)v11;
  }
  v11 = 0;
  return (NSString *)v11;
}

- (NSString)messageText
{
  void *v2;
  void *v3;

  if (self->_targetStatus == 2 && !-[CDPUIWalrusStatusChangeModel _hasLocalSecret](self, "_hasLocalSecret"))
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("ADVANCED_DATA_PROTECTION_DISABLE_NO_PASSCODE_ALERT_MESSAGE"), CFSTR("Localizable-Walrus"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)primaryButtonText
{
  void *v2;
  void *v3;

  if (self->_targetStatus == 2 && !-[CDPUIWalrusStatusChangeModel _hasLocalSecret](self, "_hasLocalSecret"))
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("ADVANCED_DATA_PROTECTION_DISABLE_NO_PASSCODE_ALERT_PRIMARY_BUTTON"), CFSTR("Localizable-Walrus"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)cancelButtonText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_CANCEL_BUTTON"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_updateUnderlyingValue:(id)a3
{
  -[CDPWalrusStatusUpdater updateWalrusStatus:completion:](self->_walrusStatusUpdater, "updateWalrusStatus:completion:", self->_targetStatus, a3);
}

- (BOOL)_hasLocalSecret
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasLocalSecret");

  return v3;
}

- (void)_reportUserChoice:(unint64_t)a3 error:(id)a4
{
  void *v5;
  CDPContext *context;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = (void *)MEMORY[0x24BDFC2A0];
  context = self->_context;
  v7 = *MEMORY[0x24BE1A810];
  v8 = *MEMORY[0x24BE1A860];
  v9 = a4;
  objc_msgSend(v5, "analyticsEventWithContext:eventName:category:", context, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (a3 - 1 >= 2)
    v11 = MEMORY[0x24BDBD1C0];
  else
    v11 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDFC328]);
  objc_msgSend(v13, "populateUnderlyingErrorsStartingWithRootError:", v9);

  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendEvent:", v13);

}

- (unint64_t)targetStatus
{
  return self->_targetStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_walrusStatusUpdater, 0);
  objc_storeStrong((id *)&self->_walrusStatusProvider, 0);
}

@end
