@implementation NSString(ABVCardAdditions)

- (uint64_t)copyABVCardDataRepresentation
{
  if (objc_msgSend(a1, "canBeConvertedToEncoding:", 4))
    return objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", objc_msgSend(a1, "UTF8String"), objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4));
  else
    return 0;
}

- (const)abEscapeStringForUnichar:()ABVCardAdditions and:advance:
{
  const __CFString *result;

  *a5 = 1;
  if (a3 > 57)
  {
    if (a3 == 58)
      return CFSTR("\\:");
    if (a3 != 59)
    {
      if (a3 == 92)
        return CFSTR("\\\\");
      goto LABEL_11;
    }
    return CFSTR("\\;");
  }
  else
  {
    if (a3 == 10)
      return CFSTR("\\n");
    if (a3 != 13)
    {
      if (a3 == 44)
        return CFSTR("\\,");
LABEL_11:
      result = 0;
      *a5 = 0;
      return result;
    }
    if (a4 != 10)
    {
      return CFSTR("\\n");
    }
    else
    {
      *a5 = 2;
      return CFSTR("\\n\\n");
    }
  }
}

- (__CFString)abStringByRemovingCharactersFromSet:()ABVCardAdditions
{
  __CFString *v4;
  CFIndex v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  CFRange v10;

  v4 = a1;
  v5 = -[__CFString length](a1, "length");
  if (v5)
  {
    v10.length = v5;
    v10.location = 0;
    if (CFStringFindCharacterFromSet(v4, (CFCharacterSetRef)a3, v10, 0, 0))
    {
      v4 = (__CFString *)-[__CFString mutableCopy](v4, "mutableCopy");
      v6 = -[__CFString length](v4, "length");
      if (v6 - 1 >= 0)
      {
        v7 = v6;
        do
        {
          if (objc_msgSend(a3, "characterIsMember:", -[__CFString characterAtIndex:](v4, "characterAtIndex:", --v7)))-[__CFString deleteCharactersInRange:](v4, "deleteCharactersInRange:", v7, 1);
        }
        while (v7 > 0);
      }
      v8 = v4;
    }
  }
  return v4;
}

- (const)abStringByStrippingControlCharacters
{
  void *v2;

  if (abStringByStrippingControlCharacters_onceToken != -1)
    dispatch_once(&abStringByStrippingControlCharacters_onceToken, &__block_literal_global_6);
  v2 = (void *)objc_msgSend(a1, "abStringByRemovingCharactersFromSet:", abStringByStrippingControlCharacters___invalidChars);
  if (objc_msgSend(v2, "length"))
    return (const __CFString *)v2;
  else
    return &stru_1E3CA4E68;
}

- (void)abVCardKoshify
{
  void *v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12[8];
  uint64_t v13;
  uint64_t v14;

  v13 = 0;
  v14 = 0;
  strcpy(v12, "\r\n;,\\");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", a1);
  objc_msgSend(v2, "setCharactersToBeSkipped:", 0);
  v3 = objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12));
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = objc_msgSend(a1, "length");
  if ((objc_msgSend(v2, "isAtEnd") & 1) == 0)
  {
    do
    {
      v14 = 1;
      v6 = objc_msgSend(v2, "scanUpToCharactersFromSet:intoString:", v3, &v13);
      v7 = objc_msgSend(v2, "scanLocation");
      if (v6)
        objc_msgSend(v4, "appendString:", v13);
      while (v7 < v5)
      {
        v8 = objc_msgSend(a1, "characterAtIndex:", v7);
        v9 = v7 + 1 >= v5 ? 0 : objc_msgSend(a1, "characterAtIndex:");
        v10 = objc_msgSend(a1, "abEscapeStringForUnichar:and:advance:", v8, v9, &v14);
        if (!v10)
          break;
        objc_msgSend(v4, "appendString:", v10);
        v7 += v14;
      }
      objc_msgSend(v2, "setScanLocation:", v7);
    }
    while (!objc_msgSend(v2, "isAtEnd"));
  }

  return v4;
}

@end
