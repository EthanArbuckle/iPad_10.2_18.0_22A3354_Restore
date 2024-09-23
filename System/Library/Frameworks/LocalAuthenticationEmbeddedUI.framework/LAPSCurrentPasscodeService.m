@implementation LAPSCurrentPasscodeService

- (LAPSCurrentPasscodeService)initWithPersistence:(id)a3
{
  id v4;
  LAPSCurrentPasscodeServiceOptions *v5;
  LAPSCurrentPasscodeService *v6;

  v4 = a3;
  v5 = objc_alloc_init(LAPSCurrentPasscodeServiceOptions);
  v6 = -[LAPSCurrentPasscodeService initWithPersistence:options:](self, "initWithPersistence:options:", v4, v5);

  return v6;
}

- (LAPSCurrentPasscodeService)initWithPersistence:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  LAPSCurrentPasscodeService *v9;
  LAPSCurrentPasscodeService *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LAPSCurrentPasscodeService;
  v9 = -[LAPSCurrentPasscodeService init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistence, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (BOOL)hasPasscode
{
  void *v2;
  char v3;

  -[LAPSCurrentPasscodeService persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPasscode");

  return v3;
}

- (id)passcodeCreationDate
{
  return (id)-[LAPSPasscodePersistence passcodeCreationDate](self->_persistence, "passcodeCreationDate");
}

- (int64_t)backoffTimeout
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[LAPSCurrentPasscodeService persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backoffTimeout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_24FDDD970;
  v5 = objc_msgSend(v3, "integerValue");

  return v5;
}

- (id)passcodeType
{
  void *v2;
  void *v3;

  -[LAPSCurrentPasscodeService persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passcodeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)failedPasscodeAttempts
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[LAPSCurrentPasscodeService persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failedPasscodeAttempts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_24FDDD970;
  v5 = objc_msgSend(v3, "integerValue");

  return v5;
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
  -[LAPSCurrentPasscodeService persistence](self, "persistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "verifyPasscode:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (-[LAPSCurrentPasscodeService backoffTimeout](self, "backoffTimeout") < 1)
    {
      if (+[LAPSErrorBuilder checkError:hasCode:](LAPSErrorBuilder, "checkError:hasCode:", v8, 4))
        +[LAPSErrorBuilder invalidPasscodeErrorWithFailedAttemptsCount:](LAPSErrorBuilder, "invalidPasscodeErrorWithFailedAttemptsCount:", -[LAPSCurrentPasscodeService failedPasscodeAttempts](self, "failedPasscodeAttempts"));
      else
        +[LAPSErrorBuilder genericErrorWithUnderlyingError:](LAPSErrorBuilder, "genericErrorWithUnderlyingError:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[LAPSErrorBuilder invalidPasscodeErrorWithFailedAttemptsCount:backoffTimeout:](LAPSErrorBuilder, "invalidPasscodeErrorWithFailedAttemptsCount:backoffTimeout:", -[LAPSCurrentPasscodeService failedPasscodeAttempts](self, "failedPasscodeAttempts"), -[LAPSCurrentPasscodeService backoffTimeout](self, "backoffTimeout"));
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

- (BOOL)canChangePasscodeWithError:(id *)a3
{
  char v4;
  BOOL v5;

  v4 = -[LAPSPasscodePersistence canChangePasscode](self->_persistence, "canChangePasscode");
  v5 = v4;
  if (a3 && (v4 & 1) == 0)
  {
    +[LAPSErrorBuilder genericErrorWithDebugDescription:](LAPSErrorBuilder, "genericErrorWithDebugDescription:", CFSTR("Passcode change is not allowed"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)canRemovePasscodeWithError:(id *)a3
{
  return -[LAPSPasscodePersistence canRemovePasscode:](self->_persistence, "canRemovePasscode:", a3);
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
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[16];
  id v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v7 = a5;
  v28[3] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = (void (**)(id, _QWORD))a6;
  v12 = a3;
  -[LAPSCurrentPasscodeService persistence](self, "persistence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v14 = objc_msgSend(v13, "changePasscode:to:enableRecovery:error:", v12, v10, v7, &v26);

  v15 = v26;
  if ((v14 & 1) != 0)
  {
    -[LAPSCurrentPasscodeService persistence](self, "persistence");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPasscodeRecoveryEnabled:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Passcode recovery intent storage failed (error: %@)"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LACLogPasscodeService();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[LAPSCurrentPasscodeService changePasscode:to:enableRecovery:completion:].cold.1((uint64_t)v18, v19);

    }
    if (-[LAPSCurrentPasscodeServiceOptions skipSuccessNotification](self->_options, "skipSuccessNotification"))
    {
      LACLogPasscodeService();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22FE91000, v20, OS_LOG_TYPE_DEFAULT, "Skipping success notification as requested", buf, 2u);
      }

    }
    else
    {
      -[LAPSCurrentPasscodeService _reportPasscodeChangedTo:](self, "_reportPasscodeChangedTo:", v10);
    }
    v11[2](v11, 0);
  }
  else
  {
    v27[0] = *MEMORY[0x24BDD0FC8];
    +[LALocalizedString passcodeChangeFailedTitle](LALocalizedString, "passcodeChangeFailedTitle");
    v21 = objc_claimAutoreleasedReturnValue();
    v28[0] = v21;
    v27[1] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Passcode change failed (error: %@)"), v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = CFSTR("LAPSInteractiveErrorKey");
    v28[1] = v22;
    v28[2] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[LAPSErrorBuilder errorWithCode:userInfo:](LAPSErrorBuilder, "errorWithCode:userInfo:", 9, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v11)[2](v11, v24);

    v11 = (void (**)(id, _QWORD))v21;
    v17 = v15;
  }

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

  -[LAPSCurrentPasscodeService persistence](self, "persistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportPasscodeDidChangeTo:completion:", v4, &__block_literal_global_2);

}

void __55__LAPSCurrentPasscodeService__reportPasscodeChangedTo___block_invoke(uint64_t a1, void *a2)
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

- (LAPSPasscodePersistence)persistence
{
  return self->_persistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (void)changePasscode:(uint64_t)a1 to:(NSObject *)a2 enableRecovery:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22FE91000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end
