@implementation NSData(ConfigurationEngineModel)

- (id)CEMHexString
{
  uint64_t v2;
  unsigned __int8 *v3;
  _BYTE *v4;
  char *v5;
  unsigned int v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "length");
  v3 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  v4 = (char *)v8 - ((2 * v2 + 16) & 0xFFFFFFFFFFFFFFF0);
  if (v2)
  {
    v5 = (char *)v8 - ((2 * v2 + 16) & 0xFFFFFFFFFFFFFFF0);
    do
    {
      v6 = *v3++;
      *v5 = CEMHexString_digits[(unint64_t)v6 >> 4];
      v4 = v5 + 2;
      v5[1] = CEMHexString_digits[v6 & 0xF];
      v5 += 2;
      --v2;
    }
    while (v2);
  }
  *v4 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)CEMSHA1Hash
{
  id v2;
  CC_SHA1_CTX v4;
  unsigned __int8 md[20];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  memset(&v4, 0, sizeof(v4));
  CC_SHA1_Init(&v4);
  v2 = objc_retainAutorelease(a1);
  CC_SHA1_Update(&v4, (const void *)objc_msgSend(v2, "bytes"), objc_msgSend(v2, "length"));
  CC_SHA1_Final(md, &v4);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)CEMSHA1HexString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "CEMSHA1Hash");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "CEMHexString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
