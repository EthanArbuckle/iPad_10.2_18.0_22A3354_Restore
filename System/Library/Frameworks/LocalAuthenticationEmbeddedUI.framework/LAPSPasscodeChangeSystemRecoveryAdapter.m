@implementation LAPSPasscodeChangeSystemRecoveryAdapter

- (LAPSPasscodeChangeSystemRecoveryAdapter)initWithPersistence:(id)a3
{
  id v4;
  LAPSPasscodeChangeSystemRecoveryAdapter *v5;
  LAPSRecoveryPasscodeService *v6;
  LAPSRecoveryPasscodeService *passcodeRecoveryService;
  LAPSNewPasscodeService *v8;
  LAPSNewPasscodeService *newPasscodeService;
  LAPSCurrentPasscodeService *v10;
  LAPSCurrentPasscodeService *currentPasscodeService;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LAPSPasscodeChangeSystemRecoveryAdapter;
  v5 = -[LAPSPasscodeChangeSystemRecoveryAdapter init](&v13, sel_init);
  if (v5)
  {
    v6 = -[LAPSRecoveryPasscodeService initWithPersistence:]([LAPSRecoveryPasscodeService alloc], "initWithPersistence:", v4);
    passcodeRecoveryService = v5->_passcodeRecoveryService;
    v5->_passcodeRecoveryService = v6;

    v8 = -[LAPSNewPasscodeService initWithPersistence:]([LAPSNewPasscodeService alloc], "initWithPersistence:", v4);
    newPasscodeService = v5->_newPasscodeService;
    v5->_newPasscodeService = v8;

    v10 = -[LAPSCurrentPasscodeService initWithPersistence:]([LAPSCurrentPasscodeService alloc], "initWithPersistence:", v4);
    currentPasscodeService = v5->_currentPasscodeService;
    v5->_currentPasscodeService = v10;

  }
  return v5;
}

- (id)oldPasscodeRequest
{
  LAPSFetchOldPasscodeRequest *v3;
  void *v4;

  v3 = objc_alloc_init(LAPSFetchOldPasscodeRequest);
  -[LAPSFetchOldPasscodeRequest setFailedAttempts:](v3, "setFailedAttempts:", -[LAPSRecoveryPasscodeService failedPasscodeAttempts](self->_passcodeRecoveryService, "failedPasscodeAttempts"));
  -[LAPSRecoveryPasscodeService passcodeType](self->_passcodeRecoveryService, "passcodeType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchOldPasscodeRequest setPasscodeType:](v3, "setPasscodeType:", v4);

  -[LAPSFetchOldPasscodeRequest setBackoffTimeout:](v3, "setBackoffTimeout:", 0);
  return v3;
}

- (id)newPasscodeRequest
{
  LAPSFetchNewPasscodeRequest *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(LAPSFetchNewPasscodeRequest);
  -[LAPSNewPasscodeService allowedPasscodeTypes](self->_newPasscodeService, "allowedPasscodeTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeRequest setAllowedPasscodeTypes:](v3, "setAllowedPasscodeTypes:", v4);

  -[LAPSNewPasscodeService passcodeType](self->_newPasscodeService, "passcodeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeRequest setPasscodeType:](v3, "setPasscodeType:", v5);

  -[LAPSFetchNewPasscodeRequest setIsPasscodeRecoverySupported:](v3, "setIsPasscodeRecoverySupported:", -[LAPSRecoveryPasscodeService isPasscodeRecoverySupported](self->_passcodeRecoveryService, "isPasscodeRecoverySupported"));
  -[LAPSFetchNewPasscodeRequest setIsPasscodeRecoveryRestricted:](v3, "setIsPasscodeRecoveryRestricted:", -[LAPSRecoveryPasscodeService isPasscodeRecoveryRestricted](self->_passcodeRecoveryService, "isPasscodeRecoveryRestricted"));
  -[LAPSFetchNewPasscodeRequest setIsPasscodeRecoveryEnabled:](v3, "setIsPasscodeRecoveryEnabled:", -[LAPSRecoveryPasscodeService isPasscodeRecoveryEnabled](self->_passcodeRecoveryService, "isPasscodeRecoveryEnabled"));
  return v3;
}

- (BOOL)hasPasscode
{
  return -[LAPSCurrentPasscodeService hasPasscode](self->_currentPasscodeService, "hasPasscode");
}

- (id)lastPasscodeChange
{
  return -[LAPSCurrentPasscodeService passcodeCreationDate](self->_currentPasscodeService, "passcodeCreationDate");
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
  -[LAPSRecoveryPasscodeService verifyPasscode:completion:](self->_passcodeRecoveryService, "verifyPasscode:completion:", a3, a4);
}

- (BOOL)canChangePasscodeWithError:(id *)a3
{
  return -[LAPSRecoveryPasscodeService isPasscodeRecoveryAvailableWithError:](self->_passcodeRecoveryService, "isPasscodeRecoveryAvailableWithError:", a3);
}

- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5
{
  LAPSRecoveryPasscodeService *passcodeRecoveryService;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  passcodeRecoveryService = self->_passcodeRecoveryService;
  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "passcode");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "passcode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isPasscodeRecoveryEnabled");

  -[LAPSRecoveryPasscodeService changePasscode:to:enableRecovery:completion:](passcodeRecoveryService, "changePasscode:to:enableRecovery:completion:", v12, v10, v11, v8);
}

- (void)verifyNewPasscode:(id)a3 completion:(id)a4
{
  -[LAPSNewPasscodeService verifyPasscode:completion:](self->_newPasscodeService, "verifyPasscode:completion:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newPasscodeService, 0);
  objc_storeStrong((id *)&self->_passcodeRecoveryService, 0);
  objc_storeStrong((id *)&self->_currentPasscodeService, 0);
}

@end
