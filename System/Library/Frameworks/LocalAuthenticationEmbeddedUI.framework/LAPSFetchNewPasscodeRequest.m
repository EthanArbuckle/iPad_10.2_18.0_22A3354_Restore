@implementation LAPSFetchNewPasscodeRequest

- (LAPSFetchNewPasscodeRequest)init
{
  LAPSFetchNewPasscodeRequest *v2;
  id v3;
  uint64_t v4;
  NSOrderedSet *allowedPasscodeTypes;
  uint64_t v6;
  LAPSPasscodeType *passcodeType;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LAPSFetchNewPasscodeRequest;
  v2 = -[LAPSFetchNewPasscodeRequest init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCF00]);
    v4 = objc_msgSend(v3, "initWithArray:", MEMORY[0x24BDBD1A8]);
    allowedPasscodeTypes = v2->_allowedPasscodeTypes;
    v2->_allowedPasscodeTypes = (NSOrderedSet *)v4;

    +[LAPSPasscodeType noneType](LAPSPasscodeType, "noneType");
    v6 = objc_claimAutoreleasedReturnValue();
    passcodeType = v2->_passcodeType;
    v2->_passcodeType = (LAPSPasscodeType *)v6;

    v2->_isPasscodeRecoveryEnabled = 0;
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

- (NSOrderedSet)allowedPasscodeTypes
{
  return self->_allowedPasscodeTypes;
}

- (void)setAllowedPasscodeTypes:(id)a3
{
  objc_storeStrong((id *)&self->_allowedPasscodeTypes, a3);
}

- (BOOL)isPasscodeRecoverySupported
{
  return self->_isPasscodeRecoverySupported;
}

- (void)setIsPasscodeRecoverySupported:(BOOL)a3
{
  self->_isPasscodeRecoverySupported = a3;
}

- (BOOL)isPasscodeRecoveryEnabled
{
  return self->_isPasscodeRecoveryEnabled;
}

- (void)setIsPasscodeRecoveryEnabled:(BOOL)a3
{
  self->_isPasscodeRecoveryEnabled = a3;
}

- (BOOL)isPasscodeRecoveryRestricted
{
  return self->_isPasscodeRecoveryRestricted;
}

- (void)setIsPasscodeRecoveryRestricted:(BOOL)a3
{
  self->_isPasscodeRecoveryRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedPasscodeTypes, 0);
  objc_storeStrong((id *)&self->_passcodeType, 0);
}

@end
