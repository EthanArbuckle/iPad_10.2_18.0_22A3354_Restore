@implementation _WKPublicKeyCredentialRequestOptions

- (_WKPublicKeyCredentialRequestOptions)init
{
  _WKPublicKeyCredentialRequestOptions *v2;
  _WKPublicKeyCredentialRequestOptions *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WKPublicKeyCredentialRequestOptions;
  v2 = -[_WKPublicKeyCredentialRequestOptions init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_WKPublicKeyCredentialRequestOptions setUserVerification:](v2, "setUserVerification:", 1);
    -[_WKPublicKeyCredentialRequestOptions setAuthenticatorAttachment:](v3, "setAuthenticatorAttachment:", 0);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKPublicKeyCredentialRequestOptions;
  -[_WKPublicKeyCredentialRequestOptions dealloc](&v3, sel_dealloc);
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)allowCredentials
{
  return self->_allowCredentials;
}

- (void)setAllowCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)userVerification
{
  return self->_userVerification;
}

- (void)setUserVerification:(int64_t)a3
{
  self->_userVerification = a3;
}

- (int64_t)authenticatorAttachment
{
  return self->_authenticatorAttachment;
}

- (void)setAuthenticatorAttachment:(int64_t)a3
{
  self->_authenticatorAttachment = a3;
}

- (_WKAuthenticationExtensionsClientInputs)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSData)extensionsCBOR
{
  return self->_extensionsCBOR;
}

- (void)setExtensionsCBOR:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
