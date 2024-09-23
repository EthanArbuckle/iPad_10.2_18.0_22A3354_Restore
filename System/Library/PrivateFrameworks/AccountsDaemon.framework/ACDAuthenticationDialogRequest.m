@implementation ACDAuthenticationDialogRequest

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)confirmationRequired
{
  return self->_confirmationRequired;
}

- (void)setConfirmationRequired:(BOOL)a3
{
  self->_confirmationRequired = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)authDelegateClassName
{
  return self->_authDelegateClassName;
}

- (void)setAuthDelegateClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)authDelegateClassBundlePath
{
  return self->_authDelegateClassBundlePath;
}

- (void)setAuthDelegateClassBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_authDelegateClassBundlePath, 0);
  objc_storeStrong((id *)&self->_authDelegateClassName, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
