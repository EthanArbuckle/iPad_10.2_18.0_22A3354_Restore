@implementation ASAuthorizationPlatformPublicKeyCredentialAssertion

- (ASAuthorizationPlatformPublicKeyCredentialAssertion)initWithCoreCredential:(id)a3
{
  id v5;
  ASAuthorizationPlatformPublicKeyCredentialAssertion *v6;
  ASAuthorizationPlatformPublicKeyCredentialAssertion *v7;
  ASAuthorizationPlatformPublicKeyCredentialAssertion *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationPlatformPublicKeyCredentialAssertion;
  v6 = -[ASAuthorizationPlatformPublicKeyCredentialAssertion init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreCredential, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ASAuthorizationPlatformPublicKeyCredentialAssertion initWithCoreCredential:]([ASAuthorizationPlatformPublicKeyCredentialAssertion alloc], "initWithCoreCredential:", self->_coreCredential);
}

- (ASAuthorizationPlatformPublicKeyCredentialAssertion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASAuthorizationPlatformPublicKeyCredentialAssertion *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coreCredential"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ASAuthorizationPlatformPublicKeyCredentialAssertion initWithCoreCredential:](self, "initWithCoreCredential:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_coreCredential, CFSTR("coreCredential"));
}

- (NSData)rawClientDataJSON
{
  return (NSData *)-[ASCPlatformPublicKeyCredentialAssertion rawClientDataJSON](self->_coreCredential, "rawClientDataJSON");
}

- (NSData)credentialID
{
  return (NSData *)-[ASCPlatformPublicKeyCredentialAssertion credentialID](self->_coreCredential, "credentialID");
}

- (NSData)rawAuthenticatorData
{
  return (NSData *)-[ASCPlatformPublicKeyCredentialAssertion authenticatorData](self->_coreCredential, "authenticatorData");
}

- (NSData)userID
{
  return (NSData *)-[ASCPlatformPublicKeyCredentialAssertion userHandle](self->_coreCredential, "userHandle");
}

- (NSData)signature
{
  return (NSData *)-[ASCPlatformPublicKeyCredentialAssertion signature](self->_coreCredential, "signature");
}

- (ASAuthorizationPublicKeyCredentialAttachment)attachment
{
  void *v2;
  ASAuthorizationPublicKeyCredentialAttachment v3;

  -[ASCPlatformPublicKeyCredentialAssertion attachment](self->_coreCredential, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[ASAuthorizationPublicKeyCredentialConstants publicAttachmentFromInternal:](ASAuthorizationPublicKeyCredentialConstants, "publicAttachmentFromInternal:", v2);

  return v3;
}

- (ASCPlatformPublicKeyCredentialAssertion)coreCredential
{
  return self->_coreCredential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreCredential, 0);
}

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput)__largeBlobSwift
{
  ASAuthorizationPlatformPublicKeyCredentialAssertion *v2;
  id v3;

  v2 = self;
  v3 = ASAuthorizationPlatformPublicKeyCredentialAssertion.__largeBlobSwift.getter();

  return (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput *)v3;
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionOutput)__prfSwift
{
  ASAuthorizationPlatformPublicKeyCredentialAssertion *v2;
  id v3;

  v2 = self;
  v3 = ASAuthorizationPlatformPublicKeyCredentialAssertion.__prfSwift.getter();

  return (ASAuthorizationPublicKeyCredentialPRFAssertionOutput *)v3;
}

@end
