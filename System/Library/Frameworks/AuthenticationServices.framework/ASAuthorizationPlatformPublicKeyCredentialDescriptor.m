@implementation ASAuthorizationPlatformPublicKeyCredentialDescriptor

- (ASAuthorizationPlatformPublicKeyCredentialDescriptor)initWithCredentialID:(NSData *)credentialID
{
  NSData *v4;
  ASAuthorizationPlatformPublicKeyCredentialDescriptor *v5;
  uint64_t v6;
  NSData *v7;
  ASAuthorizationPlatformPublicKeyCredentialDescriptor *v8;
  objc_super v10;

  v4 = credentialID;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationPlatformPublicKeyCredentialDescriptor;
  v5 = -[ASAuthorizationPlatformPublicKeyCredentialDescriptor init](&v10, sel_init);
  if (v5)
  {
    v6 = -[NSData copy](v4, "copy");
    v7 = v5->_credentialID;
    v5->_credentialID = (NSData *)v6;

    v5->_internalLock._os_unfair_lock_opaque = 0;
    v8 = v5;
  }

  return v5;
}

- (ASCPublicKeyCredentialDescriptor)coreDescriptor
{
  return (ASCPublicKeyCredentialDescriptor *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BE0B260]), "initWithCredentialID:transports:", self->_credentialID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[ASAuthorizationPlatformPublicKeyCredentialDescriptor credentialID](self, "credentialID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCredentialID:", v5);

  return v6;
}

- (ASAuthorizationPlatformPublicKeyCredentialDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASAuthorizationPlatformPublicKeyCredentialDescriptor *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ASAuthorizationPlatformPublicKeyCredentialDescriptor initWithCredentialID:](self, "initWithCredentialID:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASAuthorizationPlatformPublicKeyCredentialDescriptor credentialID](self, "credentialID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("credentialID"));

}

- (NSData)credentialID
{
  os_unfair_lock_s *p_internalLock;
  NSData *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_credentialID;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setCredentialID:(id)a3
{
  NSData *v4;
  NSData *credentialID;

  v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  credentialID = self->_credentialID;
  self->_credentialID = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialID, 0);
}

@end
