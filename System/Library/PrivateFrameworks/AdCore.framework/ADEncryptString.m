@implementation ADEncryptString

size_t __ADEncryptString_block_invoke()
{
  size_t result;

  ADEncryptString_adServerKeyRef = SecKeyCreateRSAPublicKey();
  result = SecKeyGetBlockSize((SecKeyRef)ADEncryptString_adServerKeyRef);
  ADEncryptString_cipherBufferSize = result;
  return result;
}

@end
