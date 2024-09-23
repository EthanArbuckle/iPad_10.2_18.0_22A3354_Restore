@implementation DESPFLEncryptableBuffer

- (DESPFLEncryptableBuffer)initWithEncryptor:(id)a3 count:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DESPFLEncryptableBuffer;
  return -[DESPFLEncryptableBuffer init](&v5, sel_init, a3, a4);
}

- (float)mutableDataNumbers
{
  return 0;
}

- (id)encryptedDataWithPublicKey:(id)a3 error:(id *)a4
{
  DESLogAndSetSunsetError(a4);
  return 0;
}

- (unint64_t)count
{
  return self->_count;
}

@end
