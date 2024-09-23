@implementation DCPresentmentSessionOptions

- (DCPresentmentSessionOptions)init
{
  return -[DCPresentmentSessionOptions initWithSessionEncryptionMode:readerAuthenticationPolicy:](self, "initWithSessionEncryptionMode:readerAuthenticationPolicy:", 0, 0);
}

- (DCPresentmentSessionOptions)initWithSessionEncryptionMode:(unint64_t)a3
{
  return -[DCPresentmentSessionOptions initWithSessionEncryptionMode:readerAuthenticationPolicy:](self, "initWithSessionEncryptionMode:readerAuthenticationPolicy:", a3, 0);
}

- (DCPresentmentSessionOptions)initWithSessionEncryptionMode:(unint64_t)a3 readerAuthenticationPolicy:(unint64_t)a4
{
  DCPresentmentSessionOptions *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DCPresentmentSessionOptions;
  result = -[DCPresentmentSessionOptions init](&v7, sel_init);
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_sessionEncryptionMode = a3;
    result->_responseEncryptionMode = 0;
    result->_elementFallbackModes = 0;
    result->_messageEncodingFormat = 0;
    result->_readerAuthenticationPolicy = a4;
  }
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sessionEncryptionMode, 0x24C3079E8);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_readerAuthenticationPolicy, 0x24C307628);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_responseEncryptionMode, 0x24C307A08);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_elementFallbackModes, 0x24C307A28);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_messageEncodingFormat, 0x24C307A48);

  os_unfair_lock_unlock(p_lock);
}

- (DCPresentmentSessionOptions)initWithCoder:(id)a3
{
  id v4;
  DCPresentmentSessionOptions *v5;

  v4 = a3;
  v5 = -[DCPresentmentSessionOptions initWithSessionEncryptionMode:readerAuthenticationPolicy:](self, "initWithSessionEncryptionMode:readerAuthenticationPolicy:", objc_msgSend(v4, "decodeIntegerForKey:", 0x24C3079E8), objc_msgSend(v4, "decodeIntegerForKey:", 0x24C307628));
  if (v5)
  {
    v5->_responseEncryptionMode = objc_msgSend(v4, "decodeIntegerForKey:", 0x24C307A08);
    v5->_elementFallbackModes = objc_msgSend(v4, "decodeIntegerForKey:", 0x24C307A28);
    v5->_messageEncodingFormat = objc_msgSend(v4, "decodeIntegerForKey:", 0x24C307A48);
  }

  return v5;
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x24BDD17C8];
  DCPresentmentSessionEncryptionModeToString(self->_sessionEncryptionMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DCPresentmentSessionResponseEncryptionModeToString(self->_responseEncryptionMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DCCredentialReaderAuthenticationPolicyToString(self->_readerAuthenticationPolicy);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DCPresentmentElementFallbackModeToString(self->_elementFallbackModes);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DCPresentmentMessageEncodingFormatToString(self->_messageEncodingFormat);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Session encryption mode = %@, Response encryption mode = %@, Reader authentication policy = %@, Element fallback mode = %@, Message encoding format = %@"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (unint64_t)sessionEncryptionMode
{
  os_unfair_lock_s *p_lock;
  unint64_t sessionEncryptionMode;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sessionEncryptionMode = self->_sessionEncryptionMode;
  os_unfair_lock_unlock(p_lock);
  return sessionEncryptionMode;
}

- (void)setSessionEncryptionMode:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_sessionEncryptionMode = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)responseEncryptionMode
{
  os_unfair_lock_s *p_lock;
  unint64_t responseEncryptionMode;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  responseEncryptionMode = self->_responseEncryptionMode;
  os_unfair_lock_unlock(p_lock);
  return responseEncryptionMode;
}

- (void)setResponseEncryptionMode:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_responseEncryptionMode = a3;
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

- (unint64_t)elementFallbackModes
{
  os_unfair_lock_s *p_lock;
  unint64_t elementFallbackModes;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  elementFallbackModes = self->_elementFallbackModes;
  os_unfair_lock_unlock(p_lock);
  return elementFallbackModes;
}

- (void)setElementFallbackModes:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_elementFallbackModes = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)messageEncodingFormat
{
  os_unfair_lock_s *p_lock;
  unint64_t messageEncodingFormat;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  messageEncodingFormat = self->_messageEncodingFormat;
  os_unfair_lock_unlock(p_lock);
  return messageEncodingFormat;
}

- (void)setMessageEncodingFormat:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_messageEncodingFormat = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  DCPresentmentSessionOptions *v4;

  v4 = objc_alloc_init(DCPresentmentSessionOptions);
  os_unfair_lock_lock(&self->_lock);
  -[DCPresentmentSessionOptions setSessionEncryptionMode:](v4, "setSessionEncryptionMode:", self->_sessionEncryptionMode);
  -[DCPresentmentSessionOptions setResponseEncryptionMode:](v4, "setResponseEncryptionMode:", self->_responseEncryptionMode);
  -[DCPresentmentSessionOptions setReaderAuthenticationPolicy:](v4, "setReaderAuthenticationPolicy:", self->_readerAuthenticationPolicy);
  -[DCPresentmentSessionOptions setElementFallbackModes:](v4, "setElementFallbackModes:", self->_elementFallbackModes);
  -[DCPresentmentSessionOptions setMessageEncodingFormat:](v4, "setMessageEncodingFormat:", self->_messageEncodingFormat);
  os_unfair_lock_unlock(&self->_lock);
  return v4;
}

@end
