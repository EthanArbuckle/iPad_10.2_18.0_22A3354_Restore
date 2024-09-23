@implementation NSData(HealthKit)

+ (id)hk_dataWithSHA256Fingerprint:()HealthKit error:
{
  id v5;
  _BYTE *v6;
  _BYTE *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v16;
  uint64_t v17;
  char *__endptr;
  char __str[2];
  char v20;
  _OWORD v21[6];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 1) != 95)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = CFSTR("SHA256 fingerprint not of expected length.");
    v12 = a4;
    v13 = 3;
LABEL_10:
    objc_msgSend(v10, "hk_assignError:code:description:", v12, v13, v11);
    goto LABEL_11;
  }
  memset(v21, 0, sizeof(v21));
  if ((objc_msgSend(v5, "getCString:maxLength:encoding:", v21, 96, 1) & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = CFSTR("Unable to instantiate C string.");
LABEL_9:
    v12 = a4;
    v13 = 100;
    goto LABEL_10;
  }
  v6 = malloc_type_malloc(0x20uLL, 0x910A8C9AuLL);
  if (!v6)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = CFSTR("Unable to allocate space for SHA256 digest.");
    goto LABEL_9;
  }
  v7 = v6;
  v20 = 0;
  *(_WORD *)__str = v21[0];
  __endptr = 0;
  *v6 = strtoul(__str, &__endptr, 16);
  if (__endptr == &v20)
  {
    v16 = (char *)v21 + 4;
    v17 = 1;
    while (*(v16 - 2) == 58)
    {
      *(_WORD *)__str = *(_WORD *)(v16 - 1);
      __endptr = 0;
      v7[v17++] = strtoul(__str, &__endptr, 16);
      v16 += 3;
      if (__endptr != &v20)
        goto LABEL_5;
    }
    if (!*(v16 - 2))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v7, 32, 1);
      goto LABEL_12;
    }
  }
LABEL_5:
  free(v7);
  v8 = (void *)MEMORY[0x1E0CB35C8];
  HKSensitiveLogItem(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_assignError:code:format:", a4, 100, CFSTR("Invalid fingerprint: %@."), v9);

LABEL_11:
  v14 = 0;
LABEL_12:

  return v14;
}

+ (id)hk_nilDataMD5
{
  unsigned __int8 md[16];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  CC_MD5(0, 0, md);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hk_MD5
{
  id v1;
  unsigned __int8 md[16];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_MD5((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hk_SHA256
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

+ (id)hk_randomDataOfLength:()HealthKit
{
  void *v4;
  void *v5;
  void *v9;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSData+HealthKit.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("length >= 0"));

  }
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", CFSTR("/dev/random"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readDataOfLength:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_dataWithHexString:()HealthKit
{
  id v3;
  size_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t i;
  int v9;
  char v10;
  void *v11;

  v3 = a3;
  if ((objc_msgSend(v3, "length") & 1) != 0)
  {
LABEL_10:
    v11 = 0;
  }
  else
  {
    v4 = (unint64_t)objc_msgSend(v3, "length") >> 1;
    objc_msgSend(v3, "lowercaseString");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "UTF8String");

    v7 = malloc_type_calloc(v4, 1uLL, 0x100004077774924uLL);
    if (objc_msgSend(v3, "length"))
    {
      for (i = 0; i < objc_msgSend(v3, "length"); ++i)
      {
        v9 = *(unsigned __int8 *)(v6 + i);
        v10 = v9 - 48;
        if ((v9 - 48) >= 0xA)
        {
          if ((v9 - 97) > 5)
          {
            free(v7);
            goto LABEL_10;
          }
          v10 = v9 - 87;
        }
        *((_BYTE *)v7 + (i >> 1)) += v10 << (~(4 * i) & 4);
      }
    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v7, v4, 1);
  }

  return v11;
}

- (id)hk_hexString
{
  size_t v2;
  id v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  _BYTE *v7;

  v2 = 2 * objc_msgSend(a1, "length");
  v3 = objc_retainAutorelease(a1);
  v4 = objc_msgSend(v3, "bytes");
  v5 = (char *)malloc_type_calloc(v2, 1uLL, 0x100004077774924uLL);
  if (objc_msgSend(v3, "length"))
  {
    v6 = 0;
    v7 = v5 + 1;
    do
    {
      *(v7 - 1) = hk_hexString_hexCharacters[(unint64_t)*(unsigned __int8 *)(v4 + v6) >> 4];
      *v7 = hk_hexString_hexCharacters[*(_BYTE *)(v4 + v6) & 0xF];
      v7 += 2;
      ++v6;
    }
    while (v6 < objc_msgSend(v3, "length"));
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v5, v2, 4, 1);
}

+ (void)hk_randomDataOfLength:()HealthKit .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "Failed to create random data: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
