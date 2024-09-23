@implementation LAPSPasscodeChangeControllerProviderOptions

- (LAPSPasscodeChangeControllerProviderOptions)initWithParentVC:(id)a3
{
  id v5;
  LAPSPasscodeChangeControllerProviderOptions *v6;
  LAPSPasscodeChangeControllerProviderOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSPasscodeChangeControllerProviderOptions;
  v6 = -[LAPSPasscodeChangeControllerProviderOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parentVC, a3);
    v7->_skipSuccessNotification = 1;
  }

  return v7;
}

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

- (LAExtractablePassword)oldPasscode
{
  return self->_oldPasscode;
}

- (void)setOldPasscode:(id)a3
{
  objc_storeStrong((id *)&self->_oldPasscode, a3);
}

- (LAExtractablePassword)newPasscode
{
  return self->_newPasscode;
}

- (void)setNewPasscode:(id)a3
{
  objc_storeStrong((id *)&self->_newPasscode, a3);
}

- (NSURL)calloutURL
{
  return self->_calloutURL;
}

- (void)setCalloutURL:(id)a3
{
  objc_storeStrong((id *)&self->_calloutURL, a3);
}

- (NSString)calloutReason
{
  return self->_calloutReason;
}

- (void)setCalloutReason:(id)a3
{
  objc_storeStrong((id *)&self->_calloutReason, a3);
}

- (BOOL)dismissUIAfterCompletion
{
  return self->_dismissUIAfterCompletion;
}

- (void)setDismissUIAfterCompletion:(BOOL)a3
{
  self->_dismissUIAfterCompletion = a3;
}

- (BOOL)skipSuccessNotification
{
  return self->_skipSuccessNotification;
}

- (void)setSkipSuccessNotification:(BOOL)a3
{
  self->_skipSuccessNotification = a3;
}

- (BOOL)isPasscodeRecoveryMessageHidden
{
  return self->_isPasscodeRecoveryMessageHidden;
}

- (void)setIsPasscodeRecoveryMessageHidden:(BOOL)a3
{
  self->_isPasscodeRecoveryMessageHidden = a3;
}

- (UIViewController)parentVC
{
  return self->_parentVC;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentVC, 0);
  objc_storeStrong((id *)&self->_calloutReason, 0);
  objc_storeStrong((id *)&self->_calloutURL, 0);
  objc_storeStrong((id *)&self->_newPasscode, 0);
  objc_storeStrong((id *)&self->_oldPasscode, 0);
  objc_storeStrong((id *)&self->_passcodePrompt, 0);
  objc_storeStrong((id *)&self->_oldPasscodePrompt, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
