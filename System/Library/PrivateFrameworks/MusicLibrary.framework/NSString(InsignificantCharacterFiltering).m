@implementation NSString(InsignificantCharacterFiltering)

- (CFIndex)_rangeWithoutInsignificantPrefix:()InsignificantCharacterFiltering andCharacters:
{
  CFIndex Length;
  unint64_t v8;
  const __CFArray *v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  __CFString *v13;
  unint64_t v14;
  CFIndex v15;
  CFIndex v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFCharacterSet *v21;
  UniChar CharacterAtIndex;
  uint64_t v23;
  uint64_t v24;
  CFRange v26;
  CFRange v27;

  Length = CFStringGetLength(a1);
  v8 = Length;
  if (!a3)
  {
    v15 = 0;
    v16 = Length;
    if (!a4)
      return v15;
    goto LABEL_15;
  }
  if (IgnorableArticles_onceToken != -1)
    dispatch_once(&IgnorableArticles_onceToken, &__block_literal_global_118);
  v9 = (const __CFArray *)(id)IgnorableArticles_articles;
  Count = CFArrayGetCount(v9);
  if (Count < 1)
  {
LABEL_10:
    v15 = 0;
    v16 = v8;
  }
  else
  {
    v11 = Count;
    v12 = 0;
    while (1)
    {
      CFArrayGetValueAtIndex(v9, v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = CFStringGetLength(v13);
      if (v8 >= v14)
      {
        v27.length = v14;
        v26.location = 0;
        v26.length = 0;
        v27.location = 0;
        if (CFStringFindWithOptions(a1, v13, v27, 9uLL, &v26))
        {
          if (!v26.location)
            break;
        }
      }

      if (v11 == ++v12)
        goto LABEL_10;
    }
    v15 = v26.length;
    v16 = v8 - v26.length;

  }
  if (a4)
  {
LABEL_15:
    v17 = (void *)ValidFirstCharacterSet_chars;
    if (!ValidFirstCharacterSet_chars)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "mutableCopy");
      v20 = (void *)ValidFirstCharacterSet_chars;
      ValidFirstCharacterSet_chars = v19;

      objc_msgSend((id)ValidFirstCharacterSet_chars, "removeCharactersInString:", CFSTR(" "));
      v17 = (void *)ValidFirstCharacterSet_chars;
    }
    v21 = v17;
    if (v16)
    {
      CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v15);
      if (CFCharacterSetIsCharacterMember(v21, CharacterAtIndex))
      {
        v23 = 1;
        v24 = v15;
      }
      else
      {
        v24 = -[__CFString rangeOfCharacterFromSet:options:range:](a1, "rangeOfCharacterFromSet:options:range:", v21, 0, v15, v16);
      }
      if (v24 != 0x7FFFFFFFFFFFFFFFLL && v23 != 0)
        v15 = v24;
    }

  }
  return v15;
}

- (CFStringRef)_copyWithoutInsignificantPrefix:()InsignificantCharacterFiltering andCharacters:
{
  uint64_t v1;
  CFIndex v2;
  CFIndex v3;
  CFIndex v4;
  CFStringRef result;
  CFRange v7;

  v1 = -[__CFString _rangeWithoutInsignificantPrefix:andCharacters:](a1, "_rangeWithoutInsignificantPrefix:andCharacters:");
  if (!v2)
    return a1;
  v3 = v1;
  v4 = v2;
  if (!v1 && v2 == CFStringGetLength(a1))
    return a1;
  v7.location = v3;
  v7.length = v4;
  result = CFStringCreateWithSubstring(0, a1, v7);
  if (!result)
    return a1;
  return result;
}

- (uint64_t)copyWithoutInsignificantPrefixAndCharacters
{
  return objc_msgSend(a1, "_copyWithoutInsignificantPrefix:andCharacters:", 1, 1);
}

- (uint64_t)copyWithoutInsignificantCharacters
{
  return objc_msgSend(a1, "_copyWithoutInsignificantPrefix:andCharacters:", 0, 1);
}

- (id)MLSortString
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend(a1, "copyWithoutInsignificantPrefixAndCharacters");
  if ((objc_msgSend(v2, "isEqualToString:", a1) & 1) != 0)
    v3 = 0;
  else
    v3 = v2;

  return v3;
}

- (id)MLSortStringWithPrefix
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend(a1, "copyWithoutInsignificantCharacters");
  if ((objc_msgSend(v2, "isEqualToString:", a1) & 1) != 0)
    v3 = 0;
  else
    v3 = v2;

  return v3;
}

@end
