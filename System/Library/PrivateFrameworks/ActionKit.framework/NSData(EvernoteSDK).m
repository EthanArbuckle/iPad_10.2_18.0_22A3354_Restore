@implementation NSData(EvernoteSDK)

- (id)enmd5
{
  id v1;
  unsigned __int8 md[16];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  CC_MD5((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", md, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)enlowercaseHexDigits
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
      objc_msgSend(v3, "appendFormat:", CFSTR("%.2x"), *(unsigned __int8 *)(v2 + v4++));
    while (v4 < objc_msgSend(v1, "length"));
  }
  return v3;
}

+ (id)endataWithHexDigits:()EvernoteSDK
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;

  v3 = a3;
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "length") & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", (unint64_t)objc_msgSend(v4, "length") >> 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_retainAutorelease(v4);
    v7 = (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 1);
    v8 = objc_retainAutorelease(v5);
    v9 = objc_msgSend(v8, "mutableBytes");
    if ((unint64_t)objc_msgSend(v6, "length") >= 2)
    {
      v10 = 0;
      do
      {
        sscanf(v7, "%2hhx", v9 + v10);
        v7 += 2;
        ++v10;
      }
      while (v10 < (unint64_t)objc_msgSend(v6, "length") >> 1);
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

@end
