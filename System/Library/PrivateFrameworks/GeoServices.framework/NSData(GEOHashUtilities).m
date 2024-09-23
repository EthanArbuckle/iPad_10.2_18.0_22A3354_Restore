@implementation NSData(GEOHashUtilities)

- (id)_geo_MD5Hash
{
  void *v1;
  id v2;
  unsigned __int8 md[16];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C99D50];
  v2 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "dataWithBytes:length:", CC_MD5((const void *)objc_msgSend(v2, "bytes"), objc_msgSend(v2, "length"), md), 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_geo_SHA1Hash
{
  id v1;
  unsigned __int8 md[20];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_SHA1((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_geo_SHA256Hash
{
  id v1;
  unsigned __int8 md[32];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_SHA256((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_geo_dataForHexString:()GEOHashUtilities
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  char v12;
  int v13;
  char v14;
  unsigned int v15;
  char v16;
  int v17;
  char v18;
  char v20;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_retainAutorelease(v3);
    v6 = objc_msgSend(v5, "cStringUsingEncoding:", 1);
    v7 = objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 1);
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v7 >> 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = 0;
      v10 = MEMORY[0x1E0C80978];
      do
      {
        v20 = 0;
        v11 = *(char *)(v6 + v9);
        v12 = v11 - 48;
        if (v11 - 48 > 9)
        {
          if ((v11 & 0x80000000) != 0)
            v13 = __maskrune(*(char *)(v6 + v9), 0x8000uLL);
          else
            v13 = *(_DWORD *)(v10 + 4 * v11 + 60) & 0x8000;
          if (v13)
            v14 = -55;
          else
            v14 = -87;
          v12 = v14 + v11;
        }
        v15 = *(char *)(v6 + v9 + 1);
        v16 = v15 - 48;
        if (v15 - 48 > 9)
        {
          if ((v15 & 0x80000000) != 0)
            v17 = __maskrune(*(char *)(v6 + v9 + 1), 0x8000uLL);
          else
            v17 = *(_DWORD *)(v10 + 4 * v15 + 60) & 0x8000;
          if (v17)
            v18 = -55;
          else
            v18 = -87;
          v16 = v18 + v15;
        }
        v20 = v16 + 16 * v12;
        objc_msgSend(v8, "appendBytes:length:", &v20, 1);
        v9 += 2;
      }
      while (v9 < v7);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_geo_hexString
{
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(a1);
  v4 = objc_msgSend(v3, "bytes");
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    do
      objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v4 + v5++));
    while (v5 < objc_msgSend(v3, "length"));
  }
  return v2;
}

@end
