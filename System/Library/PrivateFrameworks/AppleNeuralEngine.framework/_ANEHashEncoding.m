@implementation _ANEHashEncoding

+ (void)copySHA256For:(id)a3 toBuffer:(char *)a4
{
  id v5;
  const void *v6;
  __int128 v7;
  unsigned __int8 md[16];
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(a3);
  v6 = (const void *)objc_msgSend(v5, "UTF8String");
  if (v6)
  {
    CC_SHA256(v6, objc_msgSend(v5, "length"), md);
    v7 = v9;
    *(_OWORD *)a4 = *(_OWORD *)md;
    *((_OWORD *)a4 + 1) = v7;
  }

}

+ (id)convertToHexString:(char *)a3 length:(unint64_t)a4
{
  void *v6;
  void *i;
  unsigned int v8;

  v6 = (void *)MEMORY[0x1D824DB90](a1, a2);
  for (i = (void *)objc_msgSend(&stru_1E9516758, "mutableCopy"); a4; --a4)
  {
    v8 = *a3++;
    objc_msgSend(i, "appendFormat:", CFSTR("%02X"), v8);
  }
  objc_autoreleasePoolPop(v6);
  return i;
}

+ (id)hexStringForBytes:(char *)a3 length:(unint64_t)a4
{
  unsigned __int8 md[32];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CC_SHA256(a3, a4, md);
  objc_msgSend(a1, "convertToHexString:length:", md, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hexStringForString:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "UTF8String");
  v6 = objc_msgSend(v4, "length");

  return (id)objc_msgSend(a1, "hexStringForBytes:length:", v5, v6);
}

+ (id)hexStringForData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  return (id)objc_msgSend(a1, "hexStringForBytes:length:", v5, v6);
}

+ (id)hexStringForDataArray:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CC_SHA256_CTX c;
  int data;
  unsigned __int8 md[32];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  data = 0;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, &data, 4u);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        CC_SHA256_Update(&c, (const void *)objc_msgSend(v10, "bytes", (_QWORD)v13), objc_msgSend(v10, "length"));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    }
    while (v7);
  }

  CC_SHA256_Final(md, &c);
  objc_msgSend(a1, "convertToHexString:length:", md, 32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (unsigned)hashForString:(id)a3 seed:(unsigned int)a4
{
  uint64_t v5;
  const char *v6;
  CC_LONG v7;
  CC_SHA256_CTX v9;
  unsigned int data;
  unsigned __int8 md[32];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (v5)
  {
    v6 = (const char *)v5;
    data = bswap32(a4);
    memset(&v9, 0, sizeof(v9));
    CC_SHA256_Init(&v9);
    CC_SHA256_Update(&v9, &data, 4u);
    v7 = strlen(v6);
    CC_SHA256_Update(&v9, v6, v7);
    CC_SHA256_Final(md, &v9);
    LODWORD(v5) = *(_DWORD *)md;
  }
  return v5;
}

@end
