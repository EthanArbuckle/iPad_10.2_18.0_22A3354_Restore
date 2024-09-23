@implementation NSData(SHA256Hash)

- (id)hmmtr_sha256hash
{
  id v1;
  void *v2;
  uint64_t i;
  void *v4;
  unsigned __int8 md[32];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  CC_SHA256((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 64);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), md[i]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
