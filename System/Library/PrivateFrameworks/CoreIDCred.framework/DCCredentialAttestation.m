@implementation DCCredentialAttestation

- (DCCredentialAttestation)initWithData:(id)a3 type:(unint64_t)a4
{
  id v6;
  DCCredentialAttestation *v7;
  DCCredentialAttestation *v8;
  uint64_t v9;
  NSData *attestationData;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DCCredentialAttestation;
  v7 = -[DCCredentialAttestation init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    v9 = objc_msgSend(v6, "copy");
    attestationData = v8->_attestationData;
    v8->_attestationData = (NSData *)v9;

    v8->_attestationType = a4;
  }

  return v8;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_attestationData, 0x24C3077E8);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_attestationType, 0x24C307808);

  os_unfair_lock_unlock(p_lock);
}

- (DCCredentialAttestation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  DCCredentialAttestation *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3077E8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", 0x24C307808);

  v7 = -[DCCredentialAttestation initWithData:type:](self, "initWithData:type:", v5, v6);
  return v7;
}

- (NSData)attestationData
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_attestationData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAttestationData:(id)a3
{
  NSData *v4;
  NSData *attestationData;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_attestationData != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    attestationData = self->_attestationData;
    self->_attestationData = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (unint64_t)attestationType
{
  os_unfair_lock_s *p_lock;
  unint64_t attestationType;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  attestationType = self->_attestationType;
  os_unfair_lock_unlock(p_lock);
  return attestationType;
}

- (void)setAttestationType:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_attestationType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attestationData, 0);
}

@end
