@implementation NSData(MD5)

- (id)blt_sha256
{
  id v1;
  void *v2;
  unsigned __int8 md[32];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  v2 = CC_SHA256((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 32);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)blt_sha256String
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "blt_sha256");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "base64EncodedStringWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (unsigned)MD5:()MD5
{
  id v4;

  if (!a3)
    -[NSData(MD5) MD5:].cold.1();
  v4 = objc_retainAutorelease(a1);
  return CC_MD5((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), a3);
}

- (void)MD5:()MD5 .cold.1()
{
  __assert_rtn("-[NSData(MD5) MD5:]", "NSData+MD5.m", 35, "md5Out");
}

@end
