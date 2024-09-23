@implementation LAPSFetchOldPasscodeResult

- (LAPSFetchOldPasscodeResult)initWithPasscode:(id)a3
{
  id v5;
  LAPSFetchOldPasscodeResult *v6;
  LAPSFetchOldPasscodeResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSFetchOldPasscodeResult;
  v6 = -[LAPSFetchOldPasscodeResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_passcode, a3);

  return v7;
}

- (LAPSFetchOldPasscodeResult)initWithRawPasscode:(id)a3
{
  id v4;
  LAPSPasscode *v5;
  LAPSFetchOldPasscodeResult *v6;

  v4 = a3;
  v5 = -[LAPSPasscode initWithPasscode:]([LAPSPasscode alloc], "initWithPasscode:", v4);

  v6 = -[LAPSFetchOldPasscodeResult initWithPasscode:](self, "initWithPasscode:", v5);
  return v6;
}

- (LAPSPasscode)passcode
{
  return self->_passcode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end
