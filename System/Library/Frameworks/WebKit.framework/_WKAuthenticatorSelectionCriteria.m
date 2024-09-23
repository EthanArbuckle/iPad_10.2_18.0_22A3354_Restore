@implementation _WKAuthenticatorSelectionCriteria

- (_WKAuthenticatorSelectionCriteria)init
{
  _WKAuthenticatorSelectionCriteria *v2;
  _WKAuthenticatorSelectionCriteria *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WKAuthenticatorSelectionCriteria;
  v2 = -[_WKAuthenticatorSelectionCriteria init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_WKAuthenticatorSelectionCriteria setAuthenticatorAttachment:](v2, "setAuthenticatorAttachment:", 0);
    -[_WKAuthenticatorSelectionCriteria setResidentKey:](v3, "setResidentKey:", 0);
    -[_WKAuthenticatorSelectionCriteria setRequireResidentKey:](v3, "setRequireResidentKey:", 0);
    -[_WKAuthenticatorSelectionCriteria setUserVerification:](v3, "setUserVerification:", 1);
  }
  return v3;
}

- (int64_t)authenticatorAttachment
{
  return self->_authenticatorAttachment;
}

- (void)setAuthenticatorAttachment:(int64_t)a3
{
  self->_authenticatorAttachment = a3;
}

- (int64_t)residentKey
{
  return self->_residentKey;
}

- (void)setResidentKey:(int64_t)a3
{
  self->_residentKey = a3;
}

- (BOOL)requireResidentKey
{
  return self->_requireResidentKey;
}

- (void)setRequireResidentKey:(BOOL)a3
{
  self->_requireResidentKey = a3;
}

- (int64_t)userVerification
{
  return self->_userVerification;
}

- (void)setUserVerification:(int64_t)a3
{
  self->_userVerification = a3;
}

@end
