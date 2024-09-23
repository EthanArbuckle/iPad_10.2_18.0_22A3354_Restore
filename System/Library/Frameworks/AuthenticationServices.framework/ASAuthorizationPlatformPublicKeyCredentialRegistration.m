@implementation ASAuthorizationPlatformPublicKeyCredentialRegistration

- (ASAuthorizationPlatformPublicKeyCredentialRegistration)initWithCoreCredential:(id)a3
{
  id v5;
  ASAuthorizationPlatformPublicKeyCredentialRegistration *v6;
  ASAuthorizationPlatformPublicKeyCredentialRegistration *v7;
  ASAuthorizationPlatformPublicKeyCredentialRegistration *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationPlatformPublicKeyCredentialRegistration;
  v6 = -[ASAuthorizationPlatformPublicKeyCredentialRegistration init](&v10, sel_init);
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
  return -[ASAuthorizationPlatformPublicKeyCredentialRegistration initWithCoreCredential:]([ASAuthorizationPlatformPublicKeyCredentialRegistration alloc], "initWithCoreCredential:", self->_coreCredential);
}

- (ASAuthorizationPlatformPublicKeyCredentialRegistration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASAuthorizationPlatformPublicKeyCredentialRegistration *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coreCredential"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ASAuthorizationPlatformPublicKeyCredentialRegistration initWithCoreCredential:](self, "initWithCoreCredential:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_coreCredential, CFSTR("coreCredential"));
}

- (NSData)rawClientDataJSON
{
  return (NSData *)-[ASCPlatformPublicKeyCredentialRegistration rawClientDataJSON](self->_coreCredential, "rawClientDataJSON");
}

- (NSData)credentialID
{
  return (NSData *)-[ASCPlatformPublicKeyCredentialRegistration credentialID](self->_coreCredential, "credentialID");
}

- (NSData)rawAttestationObject
{
  return (NSData *)-[ASCPlatformPublicKeyCredentialRegistration attestationObject](self->_coreCredential, "attestationObject");
}

- (ASAuthorizationPublicKeyCredentialAttachment)attachment
{
  void *v2;
  ASAuthorizationPublicKeyCredentialAttachment v3;

  -[ASCPlatformPublicKeyCredentialRegistration attachment](self->_coreCredential, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[ASAuthorizationPublicKeyCredentialConstants publicAttachmentFromInternal:](ASAuthorizationPublicKeyCredentialConstants, "publicAttachmentFromInternal:", v2);

  return v3;
}

- (ASCPlatformPublicKeyCredentialRegistration)coreCredential
{
  return self->_coreCredential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreCredential, 0);
}

- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput)__largeBlobSwift
{
  ASAuthorizationPlatformPublicKeyCredentialRegistration *v2;
  id v3;

  v2 = self;
  v3 = ASAuthorizationPlatformPublicKeyCredentialRegistration.__largeBlobSwift.getter();

  return (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput *)v3;
}

- (ASAuthorizationPublicKeyCredentialPRFRegistrationOutput)__prfSwift
{
  ASAuthorizationPlatformPublicKeyCredentialRegistration *v2;
  id v3;

  v2 = self;
  v3 = ASAuthorizationPlatformPublicKeyCredentialRegistration.__prfSwift.getter();

  return (ASAuthorizationPublicKeyCredentialPRFRegistrationOutput *)v3;
}

@end
