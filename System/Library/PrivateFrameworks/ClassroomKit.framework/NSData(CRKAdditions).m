@implementation NSData(CRKAdditions)

- (id)crk_sha1Hash
{
  id v1;
  void *v2;
  uint64_t i;
  unsigned __int8 md[20];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  CC_SHA1((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 40);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), md[i]);
  return v2;
}

- (id)crk_hexString
{
  id v1;
  uint64_t v2;
  void *v3;
  unint64_t v4;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "bytes");
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 2 * objc_msgSend(v1, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
  {
    v4 = 0;
    do
      objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v2 + v4++));
    while (objc_msgSend(v1, "length") > v4);
  }
  return v3;
}

@end
