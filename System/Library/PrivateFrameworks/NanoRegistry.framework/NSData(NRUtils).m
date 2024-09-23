@implementation NSData(NRUtils)

+ (id)dataWithRandomBytesOfSize:()NRUtils
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  unint64_t v10;
  _BYTE *v11;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "bytes");
  v6 = v5;
  v7 = a3 >> 2;
  if (a3 >= 4)
  {
    if (v7 <= 1)
      v8 = 1;
    else
      v8 = a3 >> 2;
    v9 = (_DWORD *)v5;
    do
    {
      *v9++ = random();
      --v8;
    }
    while (v8);
  }
  v10 = a3 & 3;
  if (v10)
  {
    v11 = (_BYTE *)(v6 + 4 * v7);
    do
    {
      *v11++ = random();
      --v10;
    }
    while (v10);
  }
  return v4;
}

+ (id)fromUUID:()NRUtils
{
  void *v3;
  _BYTE v5[16];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "getUUIDBytes:", v5);
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", v5, 16);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)toUUID
{
  void *v2;

  if (objc_msgSend(a1, "length") == 16)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(a1), "bytes"));
  else
    v2 = 0;
  return v2;
}

- (unsigned)NRSHA256:()NRUtils
{
  unsigned __int8 *v4;

  if (a3)
  {
    v4 = objc_retainAutorelease(result);
    return CC_SHA256((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), a3);
  }
  return result;
}

- (id)NRSHA256
{
  _BYTE v2[32];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "NRSHA256:", v2);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
