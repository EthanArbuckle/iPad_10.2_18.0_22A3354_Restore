@implementation LAPSFetchNewPasscodeResult

- (LAPSFetchNewPasscodeResult)initWithPasscode:(id)a3 isPasscodeRecoveryEnabled:(BOOL)a4
{
  id v7;
  LAPSFetchNewPasscodeResult *v8;
  LAPSFetchNewPasscodeResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LAPSFetchNewPasscodeResult;
  v8 = -[LAPSFetchNewPasscodeResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_passcode, a3);
    v9->_isPasscodeRecoveryEnabled = a4;
  }

  return v9;
}

- (LAPSFetchNewPasscodeResult)initWithRawPasscode:(id)a3 isPasscodeRecoveryEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  LAPSPasscode *v7;
  LAPSFetchNewPasscodeResult *v8;

  v4 = a4;
  v6 = a3;
  v7 = -[LAPSPasscode initWithPasscode:]([LAPSPasscode alloc], "initWithPasscode:", v6);

  v8 = -[LAPSFetchNewPasscodeResult initWithPasscode:isPasscodeRecoveryEnabled:](self, "initWithPasscode:isPasscodeRecoveryEnabled:", v7, v4);
  return v8;
}

- (LAPSFetchNewPasscodeResult)initWithRawPasscode:(id)a3
{
  id v4;
  LAPSPasscode *v5;
  LAPSFetchNewPasscodeResult *v6;

  v4 = a3;
  v5 = -[LAPSPasscode initWithPasscode:]([LAPSPasscode alloc], "initWithPasscode:", v4);

  v6 = -[LAPSFetchNewPasscodeResult initWithPasscode:isPasscodeRecoveryEnabled:](self, "initWithPasscode:isPasscodeRecoveryEnabled:", v5, 0);
  return v6;
}

- (LAPSPasscode)passcode
{
  return self->_passcode;
}

- (BOOL)isPasscodeRecoveryEnabled
{
  return self->_isPasscodeRecoveryEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end
