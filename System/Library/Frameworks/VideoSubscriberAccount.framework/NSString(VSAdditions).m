@implementation NSString(VSAdditions)

- (unint64_t)vs_unsignedLongLongValue
{
  return strtoull((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), 0, 0);
}

- (BOOL)vs_composedCharacterIsWhitespace
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (!objc_msgSend(a1, "length"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

- (BOOL)vs_composedCharacterIsLetter
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (!objc_msgSend(a1, "length"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

- (uint64_t)vs_composedCharacterIsUppercase
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "vs_composedCharacterIsLetter");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "uppercaseString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(a1, "isEqualToString:", v3);

    return v4;
  }
  return result;
}

- (uint64_t)vs_composedCharacterIsLowercase
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "vs_composedCharacterIsLetter");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "lowercaseString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(a1, "isEqualToString:", v3);

    return v4;
  }
  return result;
}

+ (id)vs_localizedStringFromBool:()VSAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("STRING_REPRESENTATION_OF_YES"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("STRING_REPRESENTATION_OF_NO"), 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    v8 = v5;
  else
    v8 = v7;
  v9 = v8;

  return v9;
}

+ (__CFString)vs_yesNoStringValueFromBool:()VSAdditions
{
  if (a3)
    return CFSTR("YES");
  else
    return CFSTR("NO");
}

+ (__CFString)vs_trueFalseStringValueFromBool:()VSAdditions
{
  if (a3)
    return CFSTR("true");
  else
    return CFSTR("false");
}

@end
