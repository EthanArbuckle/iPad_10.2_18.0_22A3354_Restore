@implementation NSString(MCUtilities)

- (uint64_t)MCHashedFilenameWithExtension:()MCUtilities
{
  return objc_msgSend(a1, "MCHashedFilenameWithPrefix:extension:", CFSTR("profile"), a3);
}

- (id)MCHashedFilenameWithPrefix:()MCUtilities extension:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "MCHashedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v6, v8);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v8, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    objc_msgSend(v9, "stringByAppendingPathExtension:", v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }

  return v10;
}

- (id)MCHashedIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "MCSHA256DigestWithSalt:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "MCHexString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)MCOldStyleSafeFilenameHash
{
  return objc_msgSend(a1, "MCOldStyleSafeFilenameHashWithExtension:", 0);
}

- (id)MCOldStyleSafeFilenameHashWithExtension:()MCUtilities
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("_"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@+%u"), v8, objc_msgSend(a1, "MCHash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v9, "stringByAppendingPathExtension:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v9;
  }
  v11 = v10;

  return v11;
}

- (uint64_t)MCSHA256DigestWithPasscodeSalt
{
  if (MCSHA256DigestWithPasscodeSalt_onceToken != -1)
    dispatch_once(&MCSHA256DigestWithPasscodeSalt_onceToken, &__block_literal_global_6);
  return objc_msgSend(a1, "MCSHA256DigestWithSalt:", MCSHA256DigestWithPasscodeSalt_salt);
}

- (id)MCSHA256DigestWithSalt:()MCUtilities
{
  id v4;
  const char *v5;
  CC_LONG v6;
  id v7;
  void *v8;
  CC_SHA256_CTX v10;
  unsigned __int8 md[32];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "cStringUsingEncoding:", 4);
  v6 = strlen(v5);
  memset(&v10, 0, sizeof(v10));
  CC_SHA256_Init(&v10);
  if (objc_msgSend(v4, "length"))
  {
    v7 = objc_retainAutorelease(v4);
    CC_SHA256_Update(&v10, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  }
  CC_SHA256_Update(&v10, v5, v6);
  CC_SHA256_Final(md, &v10);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)MCHash
{
  unint64_t v2;
  unsigned __int16 *v3;
  unsigned __int16 *v4;
  unsigned __int16 *v5;
  int v6;
  int v7;
  _WORD v9[32];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  v3 = v9;
  if (v2 >= 0x61)
  {
    objc_msgSend(a1, "getCharacters:range:", v9, 0, 32);
    objc_msgSend(a1, "getCharacters:range:", &v10, (v2 >> 1) - 16, 32);
    objc_msgSend(a1, "getCharacters:range:", &v11, v2 - 32, 32);
    v4 = (unsigned __int16 *)&v12;
    v5 = (unsigned __int16 *)&v12;
LABEL_5:
    v3 = v9;
    v6 = v2;
    do
    {
      v6 = 67503105 * v6 + 16974593 * *v3 + 66049 * v3[1] + 257 * v3[2] + v3[3];
      v3 += 4;
    }
    while (v3 < v5);
    goto LABEL_10;
  }
  objc_msgSend(a1, "getCharacters:range:", v9, 0, v2);
  v4 = &v9[v2];
  if ((v2 & 0xFFFFFFFFFFFFFFFCLL) != 0)
  {
    v5 = &v9[v2 & 0xFFFFFFFFFFFFFFFCLL];
    goto LABEL_5;
  }
  v6 = v2;
LABEL_10:
  while (v3 < v4)
  {
    v7 = *v3++;
    v6 = 257 * v6 + v7;
  }
  return ((v6 << v2) + v6);
}

+ (__CFString)MCMakeUUID
{
  const __CFAllocator *v0;
  const __CFUUID *v1;
  __CFString *v2;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v2 = (__CFString *)CFUUIDCreateString(v0, v1);
  CFRelease(v1);
  return v2;
}

@end
