@implementation NSData(CRXUExtensions)

+ (id)crxu_dataWithHexString:()CRXUExtensions
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  unint64_t v14;
  char __str[3];

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "UTF8String");
  v6 = objc_msgSend(v4, "length");
  if ((v6 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v6 >> 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __str[2] = 0;
    v14 = 0;
    if (v6)
    {
      v8 = 0;
      v9 = MEMORY[0x24BDAC740];
      while (1)
      {
        v10 = *(char *)(v5 + v8);
        if (v10 < 0)
          break;
        v11 = 0;
        if ((*(_DWORD *)(v9 + 4 * *(unsigned __int8 *)(v5 + v8) + 60) & 0x10000) == 0)
          goto LABEL_12;
        v12 = *(unsigned __int8 *)(v5 + v8 + 1);
        if ((char)v12 < 0)
          goto LABEL_12;
        if ((*(_DWORD *)(v9 + 4 * v12 + 60) & 0x10000) == 0)
          break;
        v8 += 2;
        __str[0] = v10;
        __str[1] = v12;
        v14 = strtoul(__str, 0, 16);
        objc_msgSend(v7, "appendBytes:length:", &v14, 1);
        if (v8 >= v6)
          goto LABEL_9;
      }
      v11 = 0;
    }
    else
    {
LABEL_9:
      objc_msgSend(a1, "dataWithData:", v7, v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_12:

  }
  return v11;
}

+ (uint64_t)crxu_randomDataWithLength:()CRXUExtensions
{
  void *v4;

  v4 = malloc_type_malloc(size, 0x100004077774924uLL);
  arc4random_buf(v4, size);
  return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v4, size, 1);
}

- (id)crxu_asHexString
{
  void *v2;
  id v3;
  unsigned __int8 *v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned int v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(a1);
  v4 = (unsigned __int8 *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  if (v5 >= 1)
  {
    v6 = &v4[v5];
    do
    {
      v7 = *v4++;
      objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), v7);
    }
    while (v4 < v6);
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)crxu_SHA256Hash
{
  id v1;
  void *v2;
  void *v3;
  unsigned __int8 md[32];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  CC_SHA256((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", md, 32, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "crxu_asHexString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
