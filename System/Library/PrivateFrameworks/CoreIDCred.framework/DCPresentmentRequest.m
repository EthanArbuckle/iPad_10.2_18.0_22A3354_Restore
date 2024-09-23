@implementation DCPresentmentRequest

- (DCPresentmentRequest)init
{
  DCPresentmentRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DCPresentmentRequest;
  result = -[DCPresentmentRequest init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (DCPresentmentRequest)initWithSessionEstablishment:(id)a3 sessionTranscript:(id)a4
{
  return -[DCPresentmentRequest initWithSessionEstablishment:sessionTranscript:seAccessEndpoint:](self, "initWithSessionEstablishment:sessionTranscript:seAccessEndpoint:", a3, a4, 0);
}

- (DCPresentmentRequest)initWithSessionEstablishment:(id)a3 sessionTranscript:(id)a4 seAccessEndpoint:(id)a5
{
  id v8;
  id v9;
  id v10;
  DCPresentmentRequest *v11;
  uint64_t v12;
  NSData *sessionEstablishment;
  uint64_t v14;
  NSData *sessionTranscript;
  uint64_t v16;
  NSXPCListenerEndpoint *seAccessEndpoint;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[DCPresentmentRequest init](self, "init");
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    sessionEstablishment = v11->_sessionEstablishment;
    v11->_sessionEstablishment = (NSData *)v12;

    v14 = objc_msgSend(v9, "copy");
    sessionTranscript = v11->_sessionTranscript;
    v11->_sessionTranscript = (NSData *)v14;

    v16 = objc_msgSend(v10, "copy");
    seAccessEndpoint = v11->_seAccessEndpoint;
    v11->_seAccessEndpoint = (NSXPCListenerEndpoint *)v16;

  }
  return v11;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionEstablishment, 0x24C307828);
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionTranscript, 0x24C307848);
  objc_msgSend(v5, "encodeObject:forKey:", self->_seAccessEndpoint, 0x24C3079A8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_requiredPublicKeyIdentifier, 0x24C307A68);
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionEncryptionIntermediateKeyMaterial, 0x24C307A88);
  objc_msgSend(v5, "encodeObject:forKey:", self->_relyingPartyIdentifier, 0x24C307868);
  objc_msgSend(v5, "encodeObject:forKey:", self->_regionCode, 0x24C307C48);

  os_unfair_lock_unlock(p_lock);
}

- (DCPresentmentRequest)initWithCoder:(id)a3
{
  id v4;
  DCPresentmentRequest *v5;
  uint64_t v6;
  NSData *sessionEstablishment;
  uint64_t v8;
  NSData *sessionTranscript;
  uint64_t v10;
  NSXPCListenerEndpoint *seAccessEndpoint;
  uint64_t v12;
  NSData *requiredPublicKeyIdentifier;
  uint64_t v14;
  NSData *sessionEncryptionIntermediateKeyMaterial;
  uint64_t v16;
  NSString *relyingPartyIdentifier;
  uint64_t v18;
  NSString *regionCode;

  v4 = a3;
  v5 = -[DCPresentmentRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307828);
    v6 = objc_claimAutoreleasedReturnValue();
    sessionEstablishment = v5->_sessionEstablishment;
    v5->_sessionEstablishment = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307848);
    v8 = objc_claimAutoreleasedReturnValue();
    sessionTranscript = v5->_sessionTranscript;
    v5->_sessionTranscript = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3079A8);
    v10 = objc_claimAutoreleasedReturnValue();
    seAccessEndpoint = v5->_seAccessEndpoint;
    v5->_seAccessEndpoint = (NSXPCListenerEndpoint *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307A68);
    v12 = objc_claimAutoreleasedReturnValue();
    requiredPublicKeyIdentifier = v5->_requiredPublicKeyIdentifier;
    v5->_requiredPublicKeyIdentifier = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307A88);
    v14 = objc_claimAutoreleasedReturnValue();
    sessionEncryptionIntermediateKeyMaterial = v5->_sessionEncryptionIntermediateKeyMaterial;
    v5->_sessionEncryptionIntermediateKeyMaterial = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307868);
    v16 = objc_claimAutoreleasedReturnValue();
    relyingPartyIdentifier = v5->_relyingPartyIdentifier;
    v5->_relyingPartyIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307C48);
    v18 = objc_claimAutoreleasedReturnValue();
    regionCode = v5->_regionCode;
    v5->_regionCode = (NSString *)v18;

  }
  return v5;
}

- (NSData)sessionEstablishment
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_sessionEstablishment;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSessionEstablishment:(id)a3
{
  NSData *v4;
  NSData *sessionEstablishment;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_sessionEstablishment != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    sessionEstablishment = self->_sessionEstablishment;
    self->_sessionEstablishment = v4;

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

- (NSData)sessionEncryptionIntermediateKeyMaterial
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_sessionEncryptionIntermediateKeyMaterial;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSessionEncryptionIntermediateKeyMaterial:(id)a3
{
  NSData *v4;
  NSData *sessionEncryptionIntermediateKeyMaterial;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_sessionEncryptionIntermediateKeyMaterial != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    sessionEncryptionIntermediateKeyMaterial = self->_sessionEncryptionIntermediateKeyMaterial;
    self->_sessionEncryptionIntermediateKeyMaterial = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSData)requiredPublicKeyIdentifier
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_requiredPublicKeyIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRequiredPublicKeyIdentifier:(id)a3
{
  NSData *v4;
  NSData *requiredPublicKeyIdentifier;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_requiredPublicKeyIdentifier != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    requiredPublicKeyIdentifier = self->_requiredPublicKeyIdentifier;
    self->_requiredPublicKeyIdentifier = v4;

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

- (NSString)relyingPartyIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_relyingPartyIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
  NSString *v4;
  NSString *relyingPartyIdentifier;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_relyingPartyIdentifier != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    relyingPartyIdentifier = self->_relyingPartyIdentifier;
    self->_relyingPartyIdentifier = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSString)regionCode
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_regionCode;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRegionCode:(id)a3
{
  NSString *v4;
  NSString *regionCode;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_regionCode != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    regionCode = self->_regionCode;
    self->_regionCode = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_seAccessEndpoint, 0);
  objc_storeStrong((id *)&self->_requiredPublicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionEncryptionIntermediateKeyMaterial, 0);
  objc_storeStrong((id *)&self->_sessionTranscript, 0);
  objc_storeStrong((id *)&self->_sessionEstablishment, 0);
}

@end
