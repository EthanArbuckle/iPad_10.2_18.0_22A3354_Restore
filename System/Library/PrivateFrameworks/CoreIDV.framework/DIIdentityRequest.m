@implementation DIIdentityRequest

- (DIIdentityRequest)init
{
  DIIdentityRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIIdentityRequest;
  result = -[DIIdentityRequest init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (NSString)context
{
  return 0;
}

- (NSString)merchantNameOverride
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_merchantNameOverride;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMerchantNameOverride:(id)a3
{
  NSString *v4;
  NSString *merchantNameOverride;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_merchantNameOverride != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    merchantNameOverride = self->_merchantNameOverride;
    self->_merchantNameOverride = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (DIIdentityDocumentDescriptor)descriptor
{
  os_unfair_lock_s *p_lock;
  DIIdentityDocumentDescriptor *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_descriptor;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDescriptor:(id)a3
{
  DIIdentityDocumentDescriptor *v4;
  DIIdentityDocumentDescriptor *descriptor;

  v4 = (DIIdentityDocumentDescriptor *)a3;
  os_unfair_lock_lock(&self->_lock);
  descriptor = self->_descriptor;
  self->_descriptor = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)merchantIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_merchantIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMerchantIdentifier:(id)a3
{
  NSString *v4;
  NSString *merchantIdentifier;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_merchantIdentifier != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    merchantIdentifier = self->_merchantIdentifier;
    self->_merchantIdentifier = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSData)nonce
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_nonce;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setNonce:(id)a3
{
  NSData *v4;
  NSData *nonce;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_nonce != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    nonce = self->_nonce;
    self->_nonce = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSURL)merchantPrivacyPolicyOverride
{
  os_unfair_lock_s *p_lock;
  NSURL *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_merchantPrivacyPolicyOverride;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMerchantPrivacyPolicyOverride:(id)a3
{
  NSURL *v4;
  NSURL *merchantPrivacyPolicyOverride;
  NSURL *v6;

  v6 = (NSURL *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_merchantPrivacyPolicyOverride != v6)
  {
    v4 = (NSURL *)-[NSURL copyWithZone:](v6, "copyWithZone:", 0);
    merchantPrivacyPolicyOverride = self->_merchantPrivacyPolicyOverride;
    self->_merchantPrivacyPolicyOverride = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (id)description
{
  void *v3;
  os_unfair_lock_s *p_lock;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v3, "appendFormat:", CFSTR("descriptor: %@, "), self->_descriptor);
  objc_msgSend(v3, "appendFormat:", CFSTR("nonce: %@, "), self->_nonce);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantIdentifier: %@, "), self->_merchantIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantNameOverride: %@, "), self->_merchantNameOverride);
  -[NSURL absoluteString](self->_merchantPrivacyPolicyOverride, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantPrivacyPolicyOverride: %@, "), v5);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantPrivacyPolicyOverride, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_merchantNameOverride, 0);
}

@end
