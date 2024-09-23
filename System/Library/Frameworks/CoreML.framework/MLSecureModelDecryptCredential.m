@implementation MLSecureModelDecryptCredential

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLSecureModelDecryptCredential cryptoKey](self, "cryptoKey"), CFSTR("cryptoKey"));

}

- (MLSecureModelDecryptCredential)initWithCoder:(id)a3
{
  id v4;
  MLSecureModelDecryptCredential *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MLSecureModelDecryptCredential;
  v5 = -[MLSecureModelDecryptCredential init](&v7, sel_init);
  if (v5)
    v5->_cryptoKey = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cryptoKey"));

  return v5;
}

- (int64_t)cryptoKey
{
  return self->_cryptoKey;
}

- (void)setCryptoKey:(int64_t)a3
{
  self->_cryptoKey = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
