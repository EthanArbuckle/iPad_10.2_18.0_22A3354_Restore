@implementation NSData(CLSNSDataCryptoExtensions)

- (id)cls_sha1Hash
{
  id v2;
  CC_SHA1_CTX v4;
  unsigned __int8 md[20];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(&v4, 0, sizeof(v4));
  CC_SHA1_Init(&v4);
  v2 = objc_retainAutorelease(a1);
  CC_SHA1_Update(&v4, (const void *)objc_msgSend(v2, "bytes"), objc_msgSend(v2, "length"));
  CC_SHA1_Final(md, &v4);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cls_hexString
{
  unint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  void *v10;

  v2 = objc_msgSend(a1, "length");
  v3 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  v4 = (char *)malloc_type_calloc(1uLL, (2 * v2) | 1, 0xF94682EFuLL);
  if (v4)
  {
    v5 = v4;
    if (v2)
    {
      v6 = 0;
      v7 = 0;
      v8 = 1;
      do
      {
        sprintf(&v5[v6], "%02x", *(unsigned __int8 *)(v3 + v7));
        v7 = v8;
        v9 = v2 > v8++;
        v6 += 2;
      }
      while (v9);
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v5, 2 * v2, 4);
    free(v5);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

@end
