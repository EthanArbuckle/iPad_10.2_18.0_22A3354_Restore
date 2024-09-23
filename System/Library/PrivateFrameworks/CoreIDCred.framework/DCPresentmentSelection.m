@implementation DCPresentmentSelection

- (DCPresentmentSelection)initWithCredentialIdentifier:(id)a3 elementsToPresent:(id)a4 authData:(id)a5 seAccessEndpoint:(id)a6
{
  return -[DCPresentmentSelection initWithCredentialIdentifier:elementsToPresent:authData:seAccessEndpoint:deviceNamespaces:](self, "initWithCredentialIdentifier:elementsToPresent:authData:seAccessEndpoint:deviceNamespaces:", a3, a4, a5, a6, 0);
}

- (DCPresentmentSelection)initWithCredentialIdentifier:(id)a3 elementsToPresent:(id)a4 authData:(id)a5 seAccessEndpoint:(id)a6 deviceNamespaces:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  DCPresentmentSelection *v17;
  uint64_t v18;
  NSString *credentialIdentifier;
  uint64_t v20;
  NSDictionary *elementsToPresent;
  uint64_t v22;
  NSData *authData;
  uint64_t v24;
  NSDictionary *deviceNamespaces;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[DCPresentmentSelection init](self, "init");
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    credentialIdentifier = v17->_credentialIdentifier;
    v17->_credentialIdentifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    elementsToPresent = v17->_elementsToPresent;
    v17->_elementsToPresent = (NSDictionary *)v20;

    v22 = objc_msgSend(v14, "copy");
    authData = v17->_authData;
    v17->_authData = (NSData *)v22;

    objc_storeStrong((id *)&v17->_seAccessEndpoint, a6);
    v24 = objc_msgSend(v16, "copy");
    deviceNamespaces = v17->_deviceNamespaces;
    v17->_deviceNamespaces = (NSDictionary *)v24;

  }
  return v17;
}

- (DCPresentmentSelection)init
{
  DCPresentmentSelection *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DCPresentmentSelection;
  result = -[DCPresentmentSelection init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialIdentifier, 0x24C307168);
  objc_msgSend(v5, "encodeObject:forKey:", self->_elementsToPresent, 0x24C307968);
  objc_msgSend(v5, "encodeObject:forKey:", self->_authData, 0x24C307988);
  objc_msgSend(v5, "encodeObject:forKey:", self->_seAccessEndpoint, 0x24C3079A8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceNamespaces, 0x24C3079C8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionTranscript, 0x24C307848);
  objc_msgSend(v5, "encodeObject:forKey:", self->_responseEncryptionCertificateChain, 0x24C307AA8);

  os_unfair_lock_unlock(p_lock);
}

- (DCPresentmentSelection)initWithCoder:(id)a3
{
  id v4;
  DCPresentmentSelection *v5;
  uint64_t v6;
  NSString *credentialIdentifier;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *elementsToPresent;
  uint64_t v14;
  NSData *authData;
  uint64_t v16;
  NSXPCListenerEndpoint *seAccessEndpoint;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSDictionary *deviceNamespaces;
  uint64_t v25;
  NSData *sessionTranscript;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *responseEncryptionCertificateChain;

  v4 = a3;
  v5 = -[DCPresentmentSelection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307168);
    v6 = objc_claimAutoreleasedReturnValue();
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, 0x24C307968);
    v12 = objc_claimAutoreleasedReturnValue();
    elementsToPresent = v5->_elementsToPresent;
    v5->_elementsToPresent = (NSDictionary *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307988);
    v14 = objc_claimAutoreleasedReturnValue();
    authData = v5->_authData;
    v5->_authData = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3079A8);
    v16 = objc_claimAutoreleasedReturnValue();
    seAccessEndpoint = v5->_seAccessEndpoint;
    v5->_seAccessEndpoint = (NSXPCListenerEndpoint *)v16;

    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, 0x24C3079C8);
    v23 = objc_claimAutoreleasedReturnValue();
    deviceNamespaces = v5->_deviceNamespaces;
    v5->_deviceNamespaces = (NSDictionary *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307848);
    v25 = objc_claimAutoreleasedReturnValue();
    sessionTranscript = v5->_sessionTranscript;
    v5->_sessionTranscript = (NSData *)v25;

    v27 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, 0x24C307AA8);
    v30 = objc_claimAutoreleasedReturnValue();
    responseEncryptionCertificateChain = v5->_responseEncryptionCertificateChain;
    v5->_responseEncryptionCertificateChain = (NSArray *)v30;

  }
  return v5;
}

- (id)copyWithElementsToPresent:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  DCPresentmentSelection *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = -[DCPresentmentSelection initWithCredentialIdentifier:elementsToPresent:authData:seAccessEndpoint:deviceNamespaces:]([DCPresentmentSelection alloc], "initWithCredentialIdentifier:elementsToPresent:authData:seAccessEndpoint:deviceNamespaces:", self->_credentialIdentifier, v5, self->_authData, self->_seAccessEndpoint, self->_deviceNamespaces);

  v7 = (void *)-[NSData copy](self->_sessionTranscript, "copy");
  -[DCPresentmentSelection setSessionTranscript:](v6, "setSessionTranscript:", v7);

  v8 = (void *)-[NSArray copy](self->_responseEncryptionCertificateChain, "copy");
  -[DCPresentmentSelection setResponseEncryptionCertificateChain:](v6, "setResponseEncryptionCertificateChain:", v8);

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (NSString)credentialIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_credentialIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCredentialIdentifier:(id)a3
{
  NSString *v4;
  NSString *credentialIdentifier;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_credentialIdentifier != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    credentialIdentifier = self->_credentialIdentifier;
    self->_credentialIdentifier = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSDictionary)elementsToPresent
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_elementsToPresent;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setElementsToPresent:(id)a3
{
  NSDictionary *v4;
  NSDictionary *elementsToPresent;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_elementsToPresent != v6)
  {
    v4 = (NSDictionary *)-[NSDictionary copyWithZone:](v6, "copyWithZone:", 0);
    elementsToPresent = self->_elementsToPresent;
    self->_elementsToPresent = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSData)authData
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_authData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAuthData:(id)a3
{
  NSData *v4;
  NSData *authData;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_authData != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    authData = self->_authData;
    self->_authData = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSXPCListenerEndpoint)seAccessEndpoint
{
  os_unfair_lock_s *p_lock;
  NSXPCListenerEndpoint *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_seAccessEndpoint;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSeAccessEndpoint:(id)a3
{
  NSXPCListenerEndpoint *v4;
  NSXPCListenerEndpoint *seAccessEndpoint;

  v4 = (NSXPCListenerEndpoint *)a3;
  os_unfair_lock_lock(&self->_lock);
  seAccessEndpoint = self->_seAccessEndpoint;
  self->_seAccessEndpoint = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)deviceNamespaces
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_deviceNamespaces;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDeviceNamespaces:(id)a3
{
  NSDictionary *v4;
  NSDictionary *deviceNamespaces;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_deviceNamespaces != v6)
  {
    v4 = (NSDictionary *)-[NSDictionary copyWithZone:](v6, "copyWithZone:", 0);
    deviceNamespaces = self->_deviceNamespaces;
    self->_deviceNamespaces = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSData)sessionTranscript
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_sessionTranscript;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSessionTranscript:(id)a3
{
  NSData *v4;
  NSData *sessionTranscript;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_sessionTranscript != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    sessionTranscript = self->_sessionTranscript;
    self->_sessionTranscript = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSArray)responseEncryptionCertificateChain
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_responseEncryptionCertificateChain;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setResponseEncryptionCertificateChain:(id)a3
{
  NSArray *v4;
  NSArray *responseEncryptionCertificateChain;
  NSArray *v6;

  v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_responseEncryptionCertificateChain != v6)
  {
    v4 = (NSArray *)-[NSArray copyWithZone:](v6, "copyWithZone:", 0);
    responseEncryptionCertificateChain = self->_responseEncryptionCertificateChain;
    self->_responseEncryptionCertificateChain = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseEncryptionCertificateChain, 0);
  objc_storeStrong((id *)&self->_sessionTranscript, 0);
  objc_storeStrong((id *)&self->_deviceNamespaces, 0);
  objc_storeStrong((id *)&self->_seAccessEndpoint, 0);
  objc_storeStrong((id *)&self->_authData, 0);
  objc_storeStrong((id *)&self->_elementsToPresent, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end
