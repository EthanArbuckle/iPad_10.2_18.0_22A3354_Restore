@implementation LAPSRecoveryPasscodeService

- (LAPSRecoveryPasscodeService)initWithPersistence:(id)a3
{
  id v5;
  LAPSRecoveryPasscodeService *v6;
  LAPSRecoveryPasscodeService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSRecoveryPasscodeService;
  v6 = -[LAPSRecoveryPasscodeService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_persistence, a3);

  return v7;
}

- (BOOL)isPasscodeRecoverySupported
{
  void *v2;
  char v3;

  -[LAPSRecoveryPasscodeService persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeRecoverySupported");

  return v3;
}

- (BOOL)isPasscodeRecoveryRestricted
{
  void *v2;
  char v3;

  -[LAPSRecoveryPasscodeService persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeRecoveryRestricted");

  return v3;
}

- (BOOL)isPasscodeRecoveryEnabled
{
  void *v2;
  char v3;

  -[LAPSRecoveryPasscodeService persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeRecoveryEnabled");

  return v3;
}

- (BOOL)isPasscodeRecoveryAvailableWithError:(id *)a3
{
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  BOOL result;
  const __CFString *v12;
  void *v13;
  id v14;
  void *v15;

  -[LAPSRecoveryPasscodeService persistence](self, "persistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPasscode");

  if ((v6 & 1) == 0)
  {
    if (!a3)
      return 0;
    v12 = CFSTR("Passcode is not set");
LABEL_13:
    +[LAPSErrorBuilder genericErrorWithDebugDescription:](LAPSErrorBuilder, "genericErrorWithDebugDescription:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v14 = v13;
    result = 0;
    *a3 = v14;
    return result;
  }
  -[LAPSRecoveryPasscodeService persistence](self, "persistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPasscodeLockedOut");

  if ((v8 & 1) == 0)
  {
    if (!a3)
      return 0;
    v12 = CFSTR("Key bag is not ready for recovery");
    goto LABEL_13;
  }
  -[LAPSRecoveryPasscodeService persistence](self, "persistence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isPasscodeRecoveryAvailable");

  if ((v10 & 1) == 0)
  {
    if (!a3)
      return 0;
    v12 = CFSTR("Passcode recovery is not available");
    goto LABEL_13;
  }
  if (-[LAPSRecoveryPasscodeService _hasPasscodeRecoveryAttemptsLeft](self, "_hasPasscodeRecoveryAttemptsLeft"))
  {
    if (-[LAPSRecoveryPasscodeService _hasAttemptedPasscodeEnoughTimes](self, "_hasAttemptedPasscodeEnoughTimes"))
      return 1;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Passcode reset is only available after %d failures"), -[LAPSRecoveryPasscodeService _minRequiredPasscodeFailures](self, "_minRequiredPasscodeFailures"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      +[LAPSErrorBuilder genericErrorWithDebugDescription:](LAPSErrorBuilder, "genericErrorWithDebugDescription:", v15);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0;
  }
  if (a3)
  {
    +[LAPSErrorBuilder tooManyAttemptsError](LAPSErrorBuilder, "tooManyAttemptsError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  return 0;
}

- (id)passcodeType
{
  void *v2;
  void *v3;

  -[LAPSRecoveryPasscodeService persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recoveryPasscodeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(id, uint64_t);

  v11 = (void (**)(id, uint64_t))a4;
  v6 = a3;
  -[LAPSRecoveryPasscodeService persistence](self, "persistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "verifyRecoveryPasscode:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (-[LAPSRecoveryPasscodeService _hasPasscodeRecoveryAttemptsLeft](self, "_hasPasscodeRecoveryAttemptsLeft"))
    {
      if (+[LAPSErrorBuilder checkError:hasCode:](LAPSErrorBuilder, "checkError:hasCode:", v8, 4))
        +[LAPSErrorBuilder invalidPasscodeErrorWithFailedAttemptsCount:](LAPSErrorBuilder, "invalidPasscodeErrorWithFailedAttemptsCount:", -[LAPSRecoveryPasscodeService failedPasscodeAttempts](self, "failedPasscodeAttempts"));
      else
        +[LAPSErrorBuilder genericErrorWithUnderlyingError:](LAPSErrorBuilder, "genericErrorWithUnderlyingError:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[LAPSRecoveryPasscodeService _clearRecoveryPasscode](self, "_clearRecoveryPasscode");
      +[LAPSErrorBuilder tooManyAttemptsError](LAPSErrorBuilder, "tooManyAttemptsError");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    v11[2](v11, v9);

  }
  else
  {
    v11[2](v11, 0);
  }

}

- (void)changePasscode:(id)a3 to:(id)a4 enableRecovery:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  void (**v11)(id, _QWORD);
  id v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v7 = a5;
  v22[3] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = (void (**)(id, _QWORD))a6;
  v12 = a3;
  -[LAPSRecoveryPasscodeService persistence](self, "persistence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v14 = objc_msgSend(v13, "performRecovery:newPasscode:enableRecovery:error:", v12, v10, v7, &v20);

  v15 = v20;
  if ((v14 & 1) != 0)
  {
    -[LAPSRecoveryPasscodeService _reportPasscodeChangedTo:](self, "_reportPasscodeChangedTo:", v10);
    -[LAPSRecoveryPasscodeService _setPasscodeRecoveryEnabled:](self, "_setPasscodeRecoveryEnabled:", v7);
    v11[2](v11, 0);
  }
  else
  {
    v21[0] = *MEMORY[0x24BDD0FC8];
    +[LALocalizedString passcodeRecoveryFailedTitle](LALocalizedString, "passcodeRecoveryFailedTitle");
    v16 = objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v21[1] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Passcode recovery failed (error: %@)"), v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = CFSTR("LAPSInteractiveErrorKey");
    v22[1] = v17;
    v22[2] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[LAPSErrorBuilder errorWithCode:userInfo:](LAPSErrorBuilder, "errorWithCode:userInfo:", 9, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v11)[2](v11, v19);

    v11 = (void (**)(id, _QWORD))v16;
  }

}

- (BOOL)_hasAttemptedPasscodeEnoughTimes
{
  int64_t v3;

  v3 = -[LAPSRecoveryPasscodeService _failedPasscodeAttempts](self, "_failedPasscodeAttempts");
  return v3 >= -[LAPSRecoveryPasscodeService _minRequiredPasscodeFailures](self, "_minRequiredPasscodeFailures");
}

- (int64_t)_failedPasscodeAttempts
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[LAPSRecoveryPasscodeService persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failedPasscodeAttempts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_24FDDD988;
  v5 = objc_msgSend(v3, "integerValue");

  return v5;
}

- (int64_t)_minRequiredPasscodeFailures
{
  return 4;
}

- (BOOL)_hasPasscodeRecoveryAttemptsLeft
{
  int64_t v3;

  v3 = -[LAPSRecoveryPasscodeService _maxPasscodeRecoveryAttempts](self, "_maxPasscodeRecoveryAttempts");
  return v3 > -[LAPSRecoveryPasscodeService _failedPasscodeRecoveryAttempts](self, "_failedPasscodeRecoveryAttempts");
}

- (int64_t)_maxPasscodeRecoveryAttempts
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[LAPSRecoveryPasscodeService persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxPasscodeRecoveryAttempts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_24FDDD988;
  v5 = objc_msgSend(v3, "integerValue");

  return v5;
}

- (int64_t)_failedPasscodeRecoveryAttempts
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[LAPSRecoveryPasscodeService persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failedPasscodeRecoveryAttempts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_24FDDD9A0;
  v5 = objc_msgSend(v3, "integerValue");

  return v5;
}

- (void)_clearRecoveryPasscode
{
  OUTLINED_FUNCTION_0(&dword_22FE91000, a2, a3, "Could not clear recovery blob (error: %@)", a5, a6, a7, a8, 2u);
}

- (void)_reportPasscodeChangedTo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  LACLogPasscodeService();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_22FE91000, v5, OS_LOG_TYPE_DEFAULT, "CDP update will start", v7, 2u);
  }

  -[LAPSRecoveryPasscodeService persistence](self, "persistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportPasscodeDidChangeTo:completion:", v4, &__block_literal_global_3);

}

void __56__LAPSRecoveryPasscodeService__reportPasscodeChangedTo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  LACLogPasscodeService();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_22FE91000, v3, OS_LOG_TYPE_DEFAULT, "CDP update did finish (error: %@)", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_setPasscodeRecoveryEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  -[LAPSRecoveryPasscodeService persistence](self, "persistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPasscodeRecoveryEnabled:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    LACLogPasscodeService();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[LAPSRecoveryPasscodeService _setPasscodeRecoveryEnabled:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (LAPSPasscodePersistence)persistence
{
  return self->_persistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
}

- (void)_setPasscodeRecoveryEnabled:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FE91000, a2, a3, "Passcode recovery intent storage failed (error: %@)", a5, a6, a7, a8, 2u);
}

@end
