@implementation _WKPublicKeyCredentialCreationOptions

- (_WKPublicKeyCredentialCreationOptions)initWithRelyingParty:(id)a3 user:(id)a4 publicKeyCredentialParamaters:(id)a5
{
  _WKPublicKeyCredentialCreationOptions *v8;
  _WKPublicKeyCredentialCreationOptions *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_WKPublicKeyCredentialCreationOptions;
  v8 = -[_WKPublicKeyCredentialCreationOptions init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_WKPublicKeyCredentialCreationOptions setRelyingParty:](v8, "setRelyingParty:", a3);
    -[_WKPublicKeyCredentialCreationOptions setUser:](v9, "setUser:", a4);
    -[_WKPublicKeyCredentialCreationOptions setPublicKeyCredentialParamaters:](v9, "setPublicKeyCredentialParamaters:", a5);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKPublicKeyCredentialCreationOptions;
  -[_WKPublicKeyCredentialCreationOptions dealloc](&v3, sel_dealloc);
}

- (_WKPublicKeyCredentialRelyingPartyEntity)relyingParty
{
  return self->_relyingParty;
}

- (void)setRelyingParty:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (_WKPublicKeyCredentialUserEntity)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSArray)publicKeyCredentialParamaters
{
  return self->_publicKeyCredentialParamaters;
}

- (void)setPublicKeyCredentialParamaters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)excludeCredentials
{
  return self->_excludeCredentials;
}

- (void)setExcludeCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_WKAuthenticatorSelectionCriteria)authenticatorSelection
{
  return self->_authenticatorSelection;
}

- (void)setAuthenticatorSelection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (int64_t)attestation
{
  return self->_attestation;
}

- (void)setAttestation:(int64_t)a3
{
  self->_attestation = a3;
}

- (_WKAuthenticationExtensionsClientInputs)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSData)extensionsCBOR
{
  return self->_extensionsCBOR;
}

- (void)setExtensionsCBOR:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
