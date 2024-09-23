@implementation NSData(MobileActivation)

- (id)hexString
{
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v5;
  _BYTE *v6;
  id v7;
  unsigned int v8;
  char v9;
  unsigned int v10;
  char v11;
  void *v12;

  v2 = objc_msgSend(a1, "length");
  v3 = (char *)malloc_type_malloc(2 * v2, 0x193D21A2uLL);
  if (v3)
  {
    v4 = v3;
    if (v2)
    {
      v5 = 0;
      v6 = v3 + 1;
      do
      {
        v7 = objc_retainAutorelease(a1);
        v8 = *(unsigned __int8 *)(objc_msgSend(v7, "bytes") + v5);
        if (v8 <= 0x9F)
          v9 = 48;
        else
          v9 = 55;
        *(v6 - 1) = v9 + (v8 >> 4);
        v10 = *(_BYTE *)(objc_msgSend(objc_retainAutorelease(v7), "bytes") + v5) & 0xF;
        if (v10 <= 9)
          v11 = 48;
        else
          v11 = 55;
        *v6 = v11 + v10;
        v6 += 2;
        ++v5;
      }
      while (v2 != v5);
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v4, 2 * v2, 1);
    free(v4);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

@end
