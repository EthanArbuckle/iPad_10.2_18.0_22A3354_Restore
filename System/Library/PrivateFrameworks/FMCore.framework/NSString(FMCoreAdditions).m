@implementation NSString(FMCoreAdditions)

- (id)fm_encodeToPercentEscape
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "legacyAllowedCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)fm_isNumeric
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isSupersetOfSet:", v3);

  return v4;
}

- (id)fm_decodeHexString
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  char v9;
  char v10;
  void *v12;
  char v13;

  if ((objc_msgSend(a1, "length") & 1) != 0)
    return 0;
  v2 = objc_retainAutorelease(a1);
  v3 = objc_msgSend(v2, "cStringUsingEncoding:", 1);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (objc_msgSend(v2, "length") >= 1)
  {
    v5 = 0;
    v6 = MEMORY[0x1E0C80978];
    while (1)
    {
      v7 = __toupper(*(char *)(v3 + v5));
      v8 = __toupper(*(char *)(v3 + v5 + 1));
      if ((*(_DWORD *)(v6 + 4 * v7 + 60) & 0x10000) == 0 || (*(_DWORD *)(v6 + 4 * v8 + 60) & 0x10000) == 0)
        break;
      if (v8 <= 0x40u)
        v9 = -48;
      else
        v9 = -55;
      if (v7 <= 0x40u)
        v10 = 16 * v7;
      else
        v10 = 16 * v7 - 112;
      v13 = v10 + v8 + v9;
      objc_msgSend(v4, "appendBytes:length:", &v13, 1);
      v5 += 2;
      if (v5 >= objc_msgSend(v2, "length"))
        goto LABEL_16;
    }

    v4 = 0;
  }
LABEL_16:
  v12 = (void *)objc_msgSend(v4, "copy");

  return v12;
}

- (uint64_t)fm_stringByReplacingNonBreakingSpaces
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
}

- (__CFString)fm_wifiToWLAN
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;

  if (fm_wifiToWLAN___wapiCapabilityToken != -1)
    dispatch_once(&fm_wifiToWLAN___wapiCapabilityToken, &__block_literal_global_0);
  if (fm_wifiToWLAN___wapi)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.icloud.FMCore"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferredLocalizations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = CFSTR("WLAN");
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WLAN"), CFSTR("WLAN"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)fm_wifiToWLAN_stripWhitespaceWhitelist, "containsObject:", v4))
      v7 = CFSTR("(\\s?Wi\\-?Fi\\s?)");
    else
      v7 = CFSTR("(Wi\\-?Fi)");
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(a1, "length");
    if (v6)
    {
      objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, v9, v6);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (id)legacyAllowedCharacterSet
{
  if (legacyAllowedCharacterSet_once != -1)
    dispatch_once(&legacyAllowedCharacterSet_once, &__block_literal_global_20);
  return (id)legacyAllowedCharacterSet_allowedCharSet;
}

@end
