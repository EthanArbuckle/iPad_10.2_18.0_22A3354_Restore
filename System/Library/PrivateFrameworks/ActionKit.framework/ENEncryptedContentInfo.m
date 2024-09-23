@implementation ENEncryptedContentInfo

- (ENEncryptedContentInfo)init
{
  ENEncryptedContentInfo *v2;
  ENEncryptedContentInfo *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ENEncryptedContentInfo;
  v2 = -[ENEncryptedContentInfo init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ENEncryptedContentInfo setCipher:](v2, "setCipher:", CFSTR("RC2"));
    -[ENEncryptedContentInfo setKeyLength:](v3, "setKeyLength:", 64);
  }
  return v3;
}

- (NSString)hint
{
  return self->_hint;
}

- (void)setHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)cipher
{
  return self->_cipher;
}

- (void)setCipher:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)keyLength
{
  return self->_keyLength;
}

- (void)setKeyLength:(int64_t)a3
{
  self->_keyLength = a3;
}

- (NSMutableString)cipherText
{
  return self->_cipherText;
}

- (void)setCipherText:(id)a3
{
  objc_storeStrong((id *)&self->_cipherText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cipherText, 0);
  objc_storeStrong((id *)&self->_cipher, 0);
  objc_storeStrong((id *)&self->_hint, 0);
}

@end
