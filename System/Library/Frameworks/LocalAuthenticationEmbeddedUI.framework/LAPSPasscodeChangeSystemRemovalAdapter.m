@implementation LAPSPasscodeChangeSystemRemovalAdapter

- (LAPSPasscodeChangeSystemRemovalAdapter)initWithPersistence:(id)a3
{
  id v4;
  LAPSPasscodeChangeSystemRemovalAdapter *v5;
  LAPSCurrentPasscodeService *v6;
  LAPSCurrentPasscodeService *currentPasscodeService;
  uint64_t v8;
  LAPSPasscodeChangeSystem *changeSystem;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LAPSPasscodeChangeSystemRemovalAdapter;
  v5 = -[LAPSPasscodeChangeSystemRemovalAdapter init](&v11, sel_init);
  if (v5)
  {
    v6 = -[LAPSCurrentPasscodeService initWithPersistence:]([LAPSCurrentPasscodeService alloc], "initWithPersistence:", v4);
    currentPasscodeService = v5->_currentPasscodeService;
    v5->_currentPasscodeService = v6;

    +[LAPSPasscodeChangeSystemBuilder passcodeChangeSystem](LAPSPasscodeChangeSystemBuilder, "passcodeChangeSystem");
    v8 = objc_claimAutoreleasedReturnValue();
    changeSystem = v5->_changeSystem;
    v5->_changeSystem = (LAPSPasscodeChangeSystem *)v8;

  }
  return v5;
}

- (id)oldPasscodeRequest
{
  return (id)-[LAPSPasscodeChangeSystem oldPasscodeRequest](self->_changeSystem, "oldPasscodeRequest");
}

- (id)newPasscodeRequest
{
  return objc_alloc_init(LAPSFetchNewPasscodeRequest);
}

- (id)lastPasscodeChange
{
  return (id)-[LAPSPasscodeChangeSystem lastPasscodeChange](self->_changeSystem, "lastPasscodeChange");
}

- (BOOL)hasPasscode
{
  return -[LAPSPasscodeChangeSystem hasPasscode](self->_changeSystem, "hasPasscode");
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
  -[LAPSPasscodeChangeSystem verifyPasscode:completion:](self->_changeSystem, "verifyPasscode:completion:", a3, a4);
}

- (BOOL)canChangePasscodeWithError:(id *)a3
{
  return -[LAPSCurrentPasscodeService canRemovePasscodeWithError:](self->_currentPasscodeService, "canRemovePasscodeWithError:", a3);
}

- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5
{
  -[LAPSPasscodeChangeSystem changePasscode:to:completion:](self->_changeSystem, "changePasscode:to:completion:", a3, a4, a5);
}

- (void)verifyNewPasscode:(id)a3 completion:(id)a4
{
  -[LAPSPasscodeChangeSystem verifyNewPasscode:completion:](self->_changeSystem, "verifyNewPasscode:completion:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeSystem, 0);
  objc_storeStrong((id *)&self->_currentPasscodeService, 0);
}

@end
