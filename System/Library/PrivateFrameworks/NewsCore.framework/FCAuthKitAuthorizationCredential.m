@implementation FCAuthKitAuthorizationCredential

- (FCAuthKitAuthorizationCredential)initWithAuthorizationCode:(id)a3 identityToken:(id)a4 userIdentifier:(id)a5 email:(id)a6 familyName:(id)a7 givenName:(id)a8
{
  id v15;
  id v16;
  id v17;
  FCAuthKitAuthorizationCredential *v18;
  FCAuthKitAuthorizationCredential *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)FCAuthKitAuthorizationCredential;
  v18 = -[FCAuthKitAuthorizationCredential init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_authorizationCode, a3);
    objc_storeStrong((id *)&v19->_identityToken, a4);
    objc_storeStrong((id *)&v19->_userIdentifier, a5);
    objc_storeStrong((id *)&v19->_email, a6);
    objc_storeStrong((id *)&v19->_familyName, a7);
    objc_storeStrong((id *)&v19->_givenName, a8);
  }

  return v19;
}

- (NSString)authorizationCode
{
  return self->_authorizationCode;
}

- (NSString)identityToken
{
  return self->_identityToken;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_authorizationCode, 0);
}

@end
