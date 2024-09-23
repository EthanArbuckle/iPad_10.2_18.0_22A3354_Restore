@implementation CDPDRecoveryKeyValidator

- (void)_validateRecoveryKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CDPDSecureBackupContext *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(CDPDSecureBackupContext);
  -[CDPDSecureBackupContext setRecoveryKey:](v8, "setRecoveryKey:", v7);

  -[CDPDDeviceSecretValidator delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CDPDDeviceSecretValidator delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __60__CDPDRecoveryKeyValidator__validateRecoveryKey_completion___block_invoke;
    v13[3] = &unk_24C81C120;
    v14 = v6;
    objc_msgSend(v10, "secretValidator:validateRecoveryKeyWithContext:completion:", self, v8, v13);

    v11 = v14;
LABEL_7:

    goto LABEL_8;
  }
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CDPDRecoveryKeyValidator _validateRecoveryKey:completion:].cold.1(v12);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v11);
    goto LABEL_7;
  }
LABEL_8:

}

void __60__CDPDRecoveryKeyValidator__validateRecoveryKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_6:
      v7();
    }
  }
  else if (v6)
  {
    v7 = *(void (**)(void))(v6 + 16);
    goto LABEL_6;
  }

}

- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__CDPDRecoveryKeyValidator_validateRecoveryKey_withCompletion___block_invoke;
  v8[3] = &unk_24C81C120;
  v9 = v6;
  v7 = v6;
  -[CDPDRecoveryKeyValidator _validateRecoveryKey:completion:](self, "_validateRecoveryKey:completion:", a3, v8);

}

void __63__CDPDRecoveryKeyValidator_validateRecoveryKey_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_6:
      v7();
    }
  }
  else if (v6)
  {
    v7 = *(void (**)(void))(v6 + 16);
    goto LABEL_6;
  }

}

- (void)_validateRecoveryKey:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20DB2C000, log, OS_LOG_TYPE_DEBUG, "\"delegate is nil, calling completion with error\", v1, 2u);
}

@end
