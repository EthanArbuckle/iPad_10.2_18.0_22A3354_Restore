@implementation NSString(IntentsFoundation)

- (__CFString)if_stringByLowercasingFirstCharacter
{
  unsigned int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  if (objc_msgSend(a1, "length"))
  {
    v2 = objc_msgSend(a1, "characterAtIndex:", 0);
    if (v2 < 0x41 || v2 - 91 <= 0x24)
    {
      v8 = (__CFString *)objc_msgSend(a1, "copy");
    }
    else
    {
      v3 = (void *)MEMORY[0x1D8259358]();
      v4 = (void *)objc_msgSend(a1, "mutableCopy");
      objc_msgSend(a1, "substringToIndex:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lowercaseString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "replaceCharactersInRange:withString:", 0, 1, v6);

      if (objc_msgSend(a1, "isEqual:", v4))
        v7 = a1;
      else
        v7 = v4;
      v8 = (__CFString *)objc_msgSend(v7, "copy");

      objc_autoreleasePoolPop(v3);
    }
  }
  else
  {
    v8 = &stru_1E9778A78;
  }
  return v8;
}

- (id)if_ASCIIStringByUppercasingFirstCharacter
{
  void *v2;
  void *v3;
  char v5;

  if (!objc_msgSend(a1, "length"))
    return a1;
  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  v5 = __toupper((char)objc_msgSend(v2, "characterAtIndex:", 0));
  objc_msgSend(v2, "replaceCharactersInRange:withCString:length:", 0, 1, &v5, 1);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (__CFString)if_stringByUppercasingFirstCharacter
{
  unsigned int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  if (objc_msgSend(a1, "length"))
  {
    v2 = objc_msgSend(a1, "characterAtIndex:", 0);
    if (v2 < 0x61 || v2 - 123 <= 4)
    {
      v8 = (__CFString *)objc_msgSend(a1, "copy");
    }
    else
    {
      v3 = (void *)MEMORY[0x1D8259358]();
      v4 = (void *)objc_msgSend(a1, "mutableCopy");
      objc_msgSend(a1, "substringToIndex:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uppercaseString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "replaceCharactersInRange:withString:", 0, 1, v6);

      if (objc_msgSend(a1, "isEqual:", v4))
        v7 = a1;
      else
        v7 = v4;
      v8 = (__CFString *)objc_msgSend(v7, "copy");

      objc_autoreleasePoolPop(v3);
    }
  }
  else
  {
    v8 = &stru_1E9778A78;
  }
  return v8;
}

- (id)if_ASCIIStringByLowercasingFirstCharacter
{
  void *v2;
  void *v3;
  char v5;

  if (!objc_msgSend(a1, "length"))
    return a1;
  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  v5 = __tolower((char)objc_msgSend(v2, "characterAtIndex:", 0));
  objc_msgSend(v2, "replaceCharactersInRange:withCString:length:", 0, 1, &v5, 1);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (id)if_hexStringFromBytes:()IntentsFoundation length:
{
  uint64_t v4;
  _BYTE *v7;
  _BYTE *v8;
  _BYTE *v9;
  char v10;
  char v11;
  unsigned int v12;
  char v13;

  v4 = a4;
  v7 = malloc_type_malloc(2 * a4, 0x9FEF5B4AuLL);
  v8 = v7;
  if (v4)
  {
    v9 = v7;
    do
    {
      if (*a3 <= 0x9Fu)
        v10 = 48;
      else
        v10 = 87;
      *v9 = v10 + (*a3 >> 4);
      v11 = *a3++;
      v12 = v11 & 0xF;
      if (v12 <= 9)
        v13 = 48;
      else
        v13 = 87;
      v8 = v9 + 2;
      v9[1] = v13 + v12;
      v9 += 2;
      --v4;
    }
    while (v4);
  }
  return (id)objc_msgSend([a1 alloc], "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, v8 - v7, 1, 1);
}

+ (id)if_hexStringFromData:()IntentsFoundation
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  objc_msgSend(a1, "if_hexStringFromBytes:length:", v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)if_stringWithData:()IntentsFoundation
{
  id v4;

  if (!a3)
    return 0;
  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringEncodingForData:encodingOptions:convertedString:usedLossyConversion:", a3, 0, &v4, 0);
  return v4;
}

@end
