@implementation DCCredentialOptions

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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_deleteInactiveKeysAfterDays, 0x24C3075E8);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_deleteIncompleteCredentialAfterDays, 0x24C307608);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_readerAuthenticationPolicy, 0x24C307628);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_presentmentAuthPolicy, 0x24C307648);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_payloadProtectionPolicy, 0x24C307668);

  os_unfair_lock_unlock(p_lock);
}

- (DCCredentialOptions)initWithCoder:(id)a3
{
  id v4;
  DCCredentialOptions *v5;

  v4 = a3;
  v5 = -[DCCredentialOptions init](self, "init");
  if (v5)
  {
    v5->_deleteInactiveKeysAfterDays = objc_msgSend(v4, "decodeIntegerForKey:", 0x24C3075E8);
    v5->_deleteIncompleteCredentialAfterDays = objc_msgSend(v4, "decodeIntegerForKey:", 0x24C307608);
    v5->_readerAuthenticationPolicy = objc_msgSend(v4, "decodeIntegerForKey:", 0x24C307628);
    v5->_presentmentAuthPolicy = objc_msgSend(v4, "decodeIntegerForKey:", 0x24C307648);
    v5->_payloadProtectionPolicy = objc_msgSend(v4, "decodeIntegerForKey:", 0x24C307668);
  }

  return v5;
}

- (DCCredentialOptions)init
{
  DCCredentialOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DCCredentialOptions;
  result = -[DCCredentialOptions init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DCCredentialOptions deleteInactiveKeysAfterDays=%ld deleteIncompleteCredentialAfterDays=%ld readerAuthenticationPolicy=%ld presentmentAuthPolicy=%ld payloadProtectionPolicy=%ld"), self->_deleteInactiveKeysAfterDays, self->_deleteIncompleteCredentialAfterDays, self->_readerAuthenticationPolicy, self->_presentmentAuthPolicy, self->_payloadProtectionPolicy);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)deleteInactiveKeysAfterDays
{
  os_unfair_lock_s *p_lock;
  int64_t deleteInactiveKeysAfterDays;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  deleteInactiveKeysAfterDays = self->_deleteInactiveKeysAfterDays;
  os_unfair_lock_unlock(p_lock);
  return deleteInactiveKeysAfterDays;
}

- (void)setDeleteInactiveKeysAfterDays:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_deleteInactiveKeysAfterDays = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)deleteIncompleteCredentialAfterDays
{
  os_unfair_lock_s *p_lock;
  int64_t deleteIncompleteCredentialAfterDays;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  deleteIncompleteCredentialAfterDays = self->_deleteIncompleteCredentialAfterDays;
  os_unfair_lock_unlock(p_lock);
  return deleteIncompleteCredentialAfterDays;
}

- (void)setDeleteIncompleteCredentialAfterDays:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_deleteIncompleteCredentialAfterDays = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)readerAuthenticationPolicy
{
  os_unfair_lock_s *p_lock;
  unint64_t readerAuthenticationPolicy;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  readerAuthenticationPolicy = self->_readerAuthenticationPolicy;
  os_unfair_lock_unlock(p_lock);
  return readerAuthenticationPolicy;
}

- (void)setReaderAuthenticationPolicy:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_readerAuthenticationPolicy = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)presentmentAuthPolicy
{
  os_unfair_lock_s *p_lock;
  unint64_t presentmentAuthPolicy;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  presentmentAuthPolicy = self->_presentmentAuthPolicy;
  os_unfair_lock_unlock(p_lock);
  return presentmentAuthPolicy;
}

- (void)setPresentmentAuthPolicy:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_presentmentAuthPolicy = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)payloadProtectionPolicy
{
  os_unfair_lock_s *p_lock;
  unint64_t payloadProtectionPolicy;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  payloadProtectionPolicy = self->_payloadProtectionPolicy;
  os_unfair_lock_unlock(p_lock);
  return payloadProtectionPolicy;
}

- (void)setPayloadProtectionPolicy:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_payloadProtectionPolicy = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v4, "setDeleteInactiveKeysAfterDays:", self->_deleteInactiveKeysAfterDays);
  objc_msgSend(v4, "setDeleteIncompleteCredentialAfterDays:", self->_deleteIncompleteCredentialAfterDays);
  objc_msgSend(v4, "setReaderAuthenticationPolicy:", self->_readerAuthenticationPolicy);
  objc_msgSend(v4, "setPresentmentAuthPolicy:", self->_presentmentAuthPolicy);
  objc_msgSend(v4, "setPayloadProtectionPolicy:", self->_payloadProtectionPolicy);
  os_unfair_lock_unlock(&self->_lock);
  return v4;
}

@end
