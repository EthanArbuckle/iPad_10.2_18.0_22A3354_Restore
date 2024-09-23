@implementation LAPSFetchNewPasscodeViewControllerOutput

- (LAPSPasscode)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_storeStrong((id *)&self->_passcode, a3);
}

- (BOOL)isPasscodeRecoveryEnabled
{
  return self->_isPasscodeRecoveryEnabled;
}

- (void)setIsPasscodeRecoveryEnabled:(BOOL)a3
{
  self->_isPasscodeRecoveryEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end
