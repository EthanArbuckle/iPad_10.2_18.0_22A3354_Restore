@implementation LAPSPasscodeOptionsViewControllerConfiguration

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)passcodeRecoveryTitle
{
  return self->_passcodeRecoveryTitle;
}

- (void)setPasscodeRecoveryTitle:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeRecoveryTitle, a3);
}

- (NSString)passcodeRecoveryEnabledTitle
{
  return self->_passcodeRecoveryEnabledTitle;
}

- (void)setPasscodeRecoveryEnabledTitle:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeRecoveryEnabledTitle, a3);
}

- (NSString)passcodeRecoveryDisabledTitle
{
  return self->_passcodeRecoveryDisabledTitle;
}

- (void)setPasscodeRecoveryDisabledTitle:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeRecoveryDisabledTitle, a3);
}

- (NSString)cancelTitle
{
  return self->_cancelTitle;
}

- (void)setCancelTitle:(id)a3
{
  objc_storeStrong((id *)&self->_cancelTitle, a3);
}

- (NSOrderedSet)allowedPasscodeTypes
{
  return self->_allowedPasscodeTypes;
}

- (void)setAllowedPasscodeTypes:(id)a3
{
  objc_storeStrong((id *)&self->_allowedPasscodeTypes, a3);
}

- (LAPSPasscodeType)selectedPasscodeType
{
  return self->_selectedPasscodeType;
}

- (void)setSelectedPasscodeType:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPasscodeType, a3);
}

- (BOOL)isPasscodeRecoveryOptionVisible
{
  return self->_isPasscodeRecoveryOptionVisible;
}

- (void)setIsPasscodeRecoveryOptionVisible:(BOOL)a3
{
  self->_isPasscodeRecoveryOptionVisible = a3;
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
  objc_storeStrong((id *)&self->_selectedPasscodeType, 0);
  objc_storeStrong((id *)&self->_allowedPasscodeTypes, 0);
  objc_storeStrong((id *)&self->_cancelTitle, 0);
  objc_storeStrong((id *)&self->_passcodeRecoveryDisabledTitle, 0);
  objc_storeStrong((id *)&self->_passcodeRecoveryEnabledTitle, 0);
  objc_storeStrong((id *)&self->_passcodeRecoveryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
