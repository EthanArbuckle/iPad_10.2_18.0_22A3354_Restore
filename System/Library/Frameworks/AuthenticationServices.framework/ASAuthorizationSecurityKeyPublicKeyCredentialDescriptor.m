@implementation ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor

- (ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor)initWithCredentialID:(NSData *)credentialID transports:(NSArray *)allowedTransports
{
  NSData *v6;
  NSArray *v7;
  ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor *v8;
  uint64_t v9;
  NSData *v10;
  uint64_t v11;
  NSArray *transports;
  ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor *v13;
  objc_super v15;

  v6 = credentialID;
  v7 = allowedTransports;
  v15.receiver = self;
  v15.super_class = (Class)ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor;
  v8 = -[ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor init](&v15, sel_init);
  if (v8)
  {
    v9 = -[NSData copy](v6, "copy");
    v10 = v8->_credentialID;
    v8->_credentialID = (NSData *)v9;

    v11 = -[NSArray copy](v7, "copy");
    transports = v8->_transports;
    v8->_transports = (NSArray *)v11;

    v8->_internalLock._os_unfair_lock_opaque = 0;
    v13 = v8;
  }

  return v8;
}

- (ASCPublicKeyCredentialDescriptor)coreDescriptor
{
  return (ASCPublicKeyCredentialDescriptor *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BE0B260]), "initWithCredentialID:transports:", self->_credentialID, self->_transports);
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
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor credentialID](self, "credentialID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor transports](self, "transports");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithCredentialID:transports:", v5, v6);

  return v7;
}

- (ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("transports"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor initWithCredentialID:transports:](self, "initWithCredentialID:transports:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor credentialID](self, "credentialID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("credentialID"));

  -[ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor transports](self, "transports");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("transports"));

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

- (NSArray)transports
{
  os_unfair_lock_s *p_internalLock;
  NSArray *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_transports;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setTransports:(NSArray *)transports
{
  NSArray *v4;
  NSArray *v5;

  v4 = transports;
  os_unfair_lock_lock(&self->_internalLock);
  v5 = self->_transports;
  self->_transports = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialID, 0);
  objc_storeStrong((id *)&self->_transports, 0);
}

@end
