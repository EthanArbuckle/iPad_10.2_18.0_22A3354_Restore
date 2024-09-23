@implementation LAPSPasscodeChangeSystemVerificationAdapter

- (LAPSPasscodeChangeSystemVerificationAdapter)initWithPersistence:(id)a3
{
  id v4;
  LAPSPasscodeChangeSystemVerificationAdapter *v5;
  LAPSCurrentPasscodeService *v6;
  LAPSCurrentPasscodeService *currentPasscodeService;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSPasscodeChangeSystemVerificationAdapter;
  v5 = -[LAPSPasscodeChangeSystemVerificationAdapter init](&v9, sel_init);
  if (v5)
  {
    v6 = -[LAPSCurrentPasscodeService initWithPersistence:]([LAPSCurrentPasscodeService alloc], "initWithPersistence:", v4);
    currentPasscodeService = v5->_currentPasscodeService;
    v5->_currentPasscodeService = v6;

  }
  return v5;
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
  return objc_alloc_init(LAPSFetchNewPasscodeRequest);
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
  return 1;
}

- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)verifyNewPasscode:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPasscodeService, 0);
}

@end
