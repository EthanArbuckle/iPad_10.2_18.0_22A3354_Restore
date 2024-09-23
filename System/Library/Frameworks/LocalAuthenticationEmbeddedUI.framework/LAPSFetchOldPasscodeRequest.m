@implementation LAPSFetchOldPasscodeRequest

- (LAPSFetchOldPasscodeRequest)init
{
  LAPSFetchOldPasscodeRequest *v2;
  uint64_t v3;
  LAPSPasscodeType *passcodeType;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LAPSFetchOldPasscodeRequest;
  v2 = -[LAPSFetchOldPasscodeRequest init](&v6, sel_init);
  if (v2)
  {
    +[LAPSPasscodeType noneType](LAPSPasscodeType, "noneType");
    v3 = objc_claimAutoreleasedReturnValue();
    passcodeType = v2->_passcodeType;
    v2->_passcodeType = (LAPSPasscodeType *)v3;

  }
  return v2;
}

- (LAPSPasscodeType)passcodeType
{
  return self->_passcodeType;
}

- (void)setPasscodeType:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeType, a3);
}

- (int64_t)failedAttempts
{
  return self->_failedAttempts;
}

- (void)setFailedAttempts:(int64_t)a3
{
  self->_failedAttempts = a3;
}

- (int64_t)backoffTimeout
{
  return self->_backoffTimeout;
}

- (void)setBackoffTimeout:(int64_t)a3
{
  self->_backoffTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeType, 0);
}

@end
