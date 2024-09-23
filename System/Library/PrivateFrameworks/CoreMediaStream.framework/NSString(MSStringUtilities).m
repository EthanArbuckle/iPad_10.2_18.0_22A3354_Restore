@implementation NSString(MSStringUtilities)

- (id)MSHexData
{
  _BYTE *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE *v6;
  __darwin_ct_rune_t v7;
  void *v8;
  char v9;
  __darwin_ct_rune_t v10;
  void *v11;
  void *v12;

  v2 = malloc_type_malloc((unint64_t)objc_msgSend(a1, "length") >> 1, 0x82065DF1uLL);
  v3 = objc_retainAutorelease(a1);
  v4 = objc_msgSend(v3, "cStringUsingEncoding:", 1);
  if (objc_msgSend(v3, "length") == 1)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, (unint64_t)objc_msgSend(v3, "length") >> 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
    v6 = v2;
    while (1)
    {
      v7 = __tolower(*(char *)(v4 + v5));
      v8 = memchr("0123456789abcdef", v7, 0x11uLL);
      if (!v8)
        break;
      v9 = (char)v8;
      v10 = __tolower(*(char *)(v4 + v5 + 1));
      v11 = memchr("0123456789abcdef", v10, 0x11uLL);
      if (!v11)
        break;
      *v6++ = ((_BYTE)v11 - "0123456789abcdef") | (16 * (v9 - "0123456789abcdef"));
      v5 += 2;
      if (v5 >= objc_msgSend(v3, "length") - 1)
        goto LABEL_6;
    }
    v12 = 0;
  }
  free(v2);
  return v12;
}

- (unint64_t)MSUniqueID
{
  const char *v2;
  size_t v3;
  uint64_t v4;
  unint64_t result;
  CC_MD5_CTX v6;
  unsigned __int8 md[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(&v6, 0, sizeof(v6));
  CC_MD5_Init(&v6);
  v2 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "cStringUsingEncoding:", 4);
  v3 = strlen(v2);
  if (HIDWORD(v3))
    __assert_rtn("-[NSString(MSStringUtilities) MSUniqueID]", "MSStringUtilities.m", 85, "len <= UINT32_MAX");
  CC_MD5_Update(&v6, v2, v3);
  CC_MD5_Final(md, &v6);
  v4 = 0;
  result = 0;
  do
    result = md[v4++] | (result << 8);
  while (v4 != 8);
  return result;
}

+ (__CFString)MSMakeUUID
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

+ (uint64_t)MSTempFileOutFileName:()MSStringUtilities
{
  char *v4;
  char *v5;
  uint64_t v6;

  if (MSTempFileOutFileName__onceToken != -1)
    dispatch_once(&MSTempFileOutFileName__onceToken, &__block_literal_global_775);
  v4 = (char *)malloc_type_malloc(objc_msgSend((id)MSTempFileOutFileName__formatString, "length") + 1, 0xB58BFDF0uLL);
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MSTempFilePathCannotAllocateTemplate"), CFSTR("Cannot allocate temporary file path"));
  v5 = strcpy(v4, (const char *)objc_msgSend((id)MSTempFileOutFileName__formatString, "cStringUsingEncoding:", 4));
  v6 = mkstemp(v5);
  if ((_DWORD)v6 == -1)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MSTempFilePathCannotCreatePath"), CFSTR("Cannot create temporary file path"));
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v4, 1);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  free(v4);
  return v6;
}

+ (__CFString)MSStringWithBool:()MSStringUtilities
{
  if (a3)
    return CFSTR("Yes");
  else
    return CFSTR("No");
}

@end
