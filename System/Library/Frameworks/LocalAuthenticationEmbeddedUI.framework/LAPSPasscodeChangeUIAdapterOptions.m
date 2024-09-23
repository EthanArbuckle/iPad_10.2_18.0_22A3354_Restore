@implementation LAPSPasscodeChangeUIAdapterOptions

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)oldPasscodePrompt
{
  return self->_oldPasscodePrompt;
}

- (void)setOldPasscodePrompt:(id)a3
{
  objc_storeStrong((id *)&self->_oldPasscodePrompt, a3);
}

- (NSString)passcodePrompt
{
  return self->_passcodePrompt;
}

- (void)setPasscodePrompt:(id)a3
{
  objc_storeStrong((id *)&self->_passcodePrompt, a3);
}

- (BOOL)isPasscodeRecoveryOptionVisible
{
  return self->_isPasscodeRecoveryOptionVisible;
}

- (void)setIsPasscodeRecoveryOptionVisible:(BOOL)a3
{
  self->_isPasscodeRecoveryOptionVisible = a3;
}

- (BOOL)isPasscodeRecoveryMessageHidden
{
  return self->_isPasscodeRecoveryMessageHidden;
}

- (void)setIsPasscodeRecoveryMessageHidden:(BOOL)a3
{
  self->_isPasscodeRecoveryMessageHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodePrompt, 0);
  objc_storeStrong((id *)&self->_oldPasscodePrompt, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
