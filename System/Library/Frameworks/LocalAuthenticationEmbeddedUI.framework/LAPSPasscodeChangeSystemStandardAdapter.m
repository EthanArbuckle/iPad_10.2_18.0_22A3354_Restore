@implementation LAPSPasscodeChangeSystemStandardAdapter

- (LAPSPasscodeChangeSystemStandardAdapter)initWithPersistence:(id)a3
{
  id v4;
  LAPSPasscodeChangeSystemOptions *v5;
  LAPSPasscodeChangeSystemStandardAdapter *v6;

  v4 = a3;
  v5 = objc_alloc_init(LAPSPasscodeChangeSystemOptions);
  v6 = -[LAPSPasscodeChangeSystemStandardAdapter initWithPersistence:options:](self, "initWithPersistence:options:", v4, v5);

  return v6;
}

- (LAPSPasscodeChangeSystemStandardAdapter)initWithPersistence:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  LAPSPasscodeChangeSystemStandardAdapter *v8;
  LAPSPasscodeChangeSystemStandardAdapter *v9;
  LAPSCurrentPasscodeService *v10;
  void *v11;
  uint64_t v12;
  LAPSCurrentPasscodeService *currentPasscodeService;
  LAPSNewPasscodeService *v14;
  LAPSNewPasscodeService *newPasscodeService;
  LAPSRecoveryPasscodeService *v16;
  LAPSRecoveryPasscodeService *recoveryPasscodeService;
  _QWORD v19[4];
  id v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)LAPSPasscodeChangeSystemStandardAdapter;
  v8 = -[LAPSPasscodeChangeSystemStandardAdapter init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_options, a4);
    v10 = [LAPSCurrentPasscodeService alloc];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __71__LAPSPasscodeChangeSystemStandardAdapter_initWithPersistence_options___block_invoke;
    v19[3] = &unk_24FDCD618;
    v20 = v7;
    __71__LAPSPasscodeChangeSystemStandardAdapter_initWithPersistence_options___block_invoke((uint64_t)v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[LAPSCurrentPasscodeService initWithPersistence:options:](v10, "initWithPersistence:options:", v6, v11);
    currentPasscodeService = v9->_currentPasscodeService;
    v9->_currentPasscodeService = (LAPSCurrentPasscodeService *)v12;

    v14 = -[LAPSNewPasscodeService initWithPersistence:]([LAPSNewPasscodeService alloc], "initWithPersistence:", v6);
    newPasscodeService = v9->_newPasscodeService;
    v9->_newPasscodeService = v14;

    v16 = -[LAPSRecoveryPasscodeService initWithPersistence:]([LAPSRecoveryPasscodeService alloc], "initWithPersistence:", v6);
    recoveryPasscodeService = v9->_recoveryPasscodeService;
    v9->_recoveryPasscodeService = v16;

  }
  return v9;
}

LAPSCurrentPasscodeServiceOptions *__71__LAPSPasscodeChangeSystemStandardAdapter_initWithPersistence_options___block_invoke(uint64_t a1)
{
  LAPSCurrentPasscodeServiceOptions *v2;

  v2 = objc_alloc_init(LAPSCurrentPasscodeServiceOptions);
  -[LAPSCurrentPasscodeServiceOptions setSkipSuccessNotification:](v2, "setSkipSuccessNotification:", objc_msgSend(*(id *)(a1 + 32), "skipSuccessNotification"));
  return v2;
}

- (id)oldPasscodeRequest
{
  LAPSFetchOldPasscodeRequest *v3;
  void *v4;

  v3 = objc_alloc_init(LAPSFetchOldPasscodeRequest);
  -[LAPSFetchOldPasscodeRequest setFailedAttempts:](v3, "setFailedAttempts:", -[LAPSCurrentPasscodeService failedPasscodeAttempts](self->_currentPasscodeService, "failedPasscodeAttempts"));
  -[LAPSCurrentPasscodeService passcodeType](self->_currentPasscodeService, "passcodeType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchOldPasscodeRequest setPasscodeType:](v3, "setPasscodeType:", v4);

  -[LAPSFetchOldPasscodeRequest setBackoffTimeout:](v3, "setBackoffTimeout:", -[LAPSCurrentPasscodeService backoffTimeout](self->_currentPasscodeService, "backoffTimeout"));
  return v3;
}

- (id)newPasscodeRequest
{
  LAPSFetchNewPasscodeRequest *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = objc_alloc_init(LAPSFetchNewPasscodeRequest);
  -[LAPSNewPasscodeService allowedPasscodeTypes](self->_newPasscodeService, "allowedPasscodeTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeRequest setAllowedPasscodeTypes:](v3, "setAllowedPasscodeTypes:", v4);

  -[LAPSNewPasscodeService passcodeType](self->_newPasscodeService, "passcodeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeRequest setPasscodeType:](v3, "setPasscodeType:", v5);

  if (-[LAPSRecoveryPasscodeService isPasscodeRecoverySupported](self->_recoveryPasscodeService, "isPasscodeRecoverySupported"))
  {
    v6 = -[LAPSPasscodeChangeSystemStandardAdapter hasPasscode](self, "hasPasscode");
  }
  else
  {
    v6 = 0;
  }
  -[LAPSFetchNewPasscodeRequest setIsPasscodeRecoverySupported:](v3, "setIsPasscodeRecoverySupported:", v6);
  -[LAPSFetchNewPasscodeRequest setIsPasscodeRecoveryRestricted:](v3, "setIsPasscodeRecoveryRestricted:", -[LAPSRecoveryPasscodeService isPasscodeRecoveryRestricted](self->_recoveryPasscodeService, "isPasscodeRecoveryRestricted"));
  -[LAPSFetchNewPasscodeRequest setIsPasscodeRecoveryEnabled:](v3, "setIsPasscodeRecoveryEnabled:", -[LAPSRecoveryPasscodeService isPasscodeRecoveryEnabled](self->_recoveryPasscodeService, "isPasscodeRecoveryEnabled"));
  return v3;
}

- (id)lastPasscodeChange
{
  return -[LAPSCurrentPasscodeService passcodeCreationDate](self->_currentPasscodeService, "passcodeCreationDate");
}

- (BOOL)hasPasscode
{
  return -[LAPSCurrentPasscodeService hasPasscode](self->_currentPasscodeService, "hasPasscode");
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
  -[LAPSCurrentPasscodeService verifyPasscode:completion:](self->_currentPasscodeService, "verifyPasscode:completion:", a3, a4);
}

- (BOOL)canChangePasscodeWithError:(id *)a3
{
  return -[LAPSCurrentPasscodeService canChangePasscodeWithError:](self->_currentPasscodeService, "canChangePasscodeWithError:", a3);
}

- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5
{
  LAPSCurrentPasscodeService *currentPasscodeService;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  currentPasscodeService = self->_currentPasscodeService;
  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "passcode");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "passcode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isPasscodeRecoveryEnabled");

  -[LAPSCurrentPasscodeService changePasscode:to:enableRecovery:completion:](currentPasscodeService, "changePasscode:to:enableRecovery:completion:", v12, v10, v11, v8);
}

- (void)verifyNewPasscode:(id)a3 completion:(id)a4
{
  -[LAPSNewPasscodeService verifyPasscode:completion:](self->_newPasscodeService, "verifyPasscode:completion:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryPasscodeService, 0);
  objc_storeStrong((id *)&self->_newPasscodeService, 0);
  objc_storeStrong((id *)&self->_currentPasscodeService, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
