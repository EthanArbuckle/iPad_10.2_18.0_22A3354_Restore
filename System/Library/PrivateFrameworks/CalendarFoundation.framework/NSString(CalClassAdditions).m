@implementation NSString(CalClassAdditions)

- (id)trimWhiteSpace
{
  __CFString *v1;
  void *v2;

  v1 = (__CFString *)objc_msgSend(a1, "mutableCopy");
  CFStringTrimWhitespace(v1);
  v2 = (void *)-[__CFString copy](v1, "copy");

  return v2;
}

- (id)quote
{
  id v2;

  if (objc_msgSend(a1, "rangeOfString:", CFSTR("\")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("'"), 2, 0, objc_msgSend(v2, "length"));
  }
  return v2;
}

- (id)unquote
{
  id v2;

  if (objc_msgSend(a1, "rangeOfString:", CFSTR("\\\")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\\"), CFSTR("\"), 2, 0, objc_msgSend(v2, "length"));
  }
  return v2;
}

- (uint64_t)hasMailto
{
  return objc_msgSend(a1, "hasPrefixCaseInsensitive:", CFSTR("mailto:"));
}

- (BOOL)hasPrefixCaseInsensitive:()CalClassAdditions
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 9) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)stringRemovingMailto
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "hasMailto"))
  {
    objc_msgSend(v1, "substringFromIndex:", 7);
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v2;
  }
  return v1;
}

- (uint64_t)isEqualAsURL:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a1, "appendSlashIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByURLUnquoting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appendSlashIfNeeded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByURLUnquoting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "isEqualToString:", v8);
  return v9;
}

- (id)appendSlashIfNeeded
{
  id v2;

  if (objc_msgSend(a1, "hasSuffix:", CFSTR("/")))
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(a1, "stringByAppendingString:", CFSTR("/"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (__CFString)stringByURLUnquoting
{
  __CFString *v2;

  v2 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, originalString, &stru_1E2A86598);
  if (!v2)
    v2 = originalString;
  return v2;
}

- (id)stringByTrimmingWhitespaceAndRemovingNewlines
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingCharactersInSet:withString:", v4, CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stringByReplacingCharactersInSet:()CalClassAdditions withString:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isMailURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES[c] 'message:.*'"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "evaluateWithObject:", a1)
    && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES[c] 'mailitem:[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}?.*'"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "evaluateWithObject:", a1))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v8 != 0;

    }
    else
    {
      v6 = 0;
    }
    v2 = v7;
  }

  return v6;
}

- (BOOL)isAddressBookURL
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES[c] 'addressbook://[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}:ABPerson'"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "evaluateWithObject:", a1)
    && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a1),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES[c] 'addressbook://[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}'"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "evaluateWithObject:", a1))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
    else
    {
      v4 = 0;
    }
    v2 = v5;
  }

  return v4;
}

- (BOOL)resemblesEmailAddress
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 result;

  result = 0;
  if (objc_msgSend(a1, "rangeOfString:", CFSTR("/")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = objc_msgSend(a1, "rangeOfString:", CFSTR("@"));
    if (v2 != 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("."), 0, v2 + v3, objc_msgSend(a1, "length") - (v2 + v3)) != 0x7FFFFFFFFFFFFFFFLL)
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)hasPrefixCaseAndDiacriticInsensitive:()CalClassAdditions
{
  return a3 && objc_msgSend(a1, "rangeOfString:options:", a3, 137) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)removeSlashIfNeeded
{
  id v2;

  if ((objc_msgSend(a1, "hasSuffix:", CFSTR("/")) & 1) != 0)
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (uint64_t)stringByEncodingSlashes
{
  if (stringByEncodingSlashes_onceToken != -1)
    dispatch_once(&stringByEncodingSlashes_onceToken, &__block_literal_global_45);
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", stringByEncodingSlashes_allowedCharacters);
}

- (id)radarLink
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES[c] '<rdar:\\/\\/problem\\/\\\\d{8}\\>.*'"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "evaluateWithObject:", a1))
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "rangeOfString:", CFSTR(">")) + 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)stringByURLQuoting
{
  if (stringByURLQuoting_onceToken != -1)
    dispatch_once(&stringByURLQuoting_onceToken, &__block_literal_global_1);
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", stringByURLQuoting_allowedCharacters);
}

- (id)stringByURLQuotingPaths
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)stringByURLEscapingAllReservedCharacters
{
  if (stringByURLEscapingAllReservedCharacters_onceToken != -1)
    dispatch_once(&stringByURLEscapingAllReservedCharacters_onceToken, &__block_literal_global_6);
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", stringByURLEscapingAllReservedCharacters_allowedCharacters);
}

- (id)stringByRemovingLastPathComponent
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stringByDeletingLastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingString:", CFSTR("/"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)hasSuffixCaseInsensitive:()CalClassAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  v6 = v5 - objc_msgSend(v4, "length");
  v7 = v6 >= 0 && objc_msgSend(a1, "compare:options:range:locale:", v4, 1, v6, objc_msgSend(v4, "length"), 0) == 0;

  return v7;
}

- (BOOL)containsCaseInsensitive:()CalClassAdditions
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 1) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)containsCaseAndDiacriticInsensitive:()CalClassAdditions
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 129) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isEqualToStringCaseInsensitive:()CalClassAdditions
{
  uint64_t v3;
  uint64_t v4;

  return a1 == a3 || objc_msgSend(a1, "caseInsensitiveCompare:", v3, v4) == 0;
}

- (id)userFromEmail
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "resemblesEmailAddress"))
  {
    objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("@"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)hostFromEmail
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "resemblesEmailAddress"))
  {
    objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("@"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)stringAddingMailto
{
  id v2;

  if ((objc_msgSend(a1, "hasMailto") & 1) != 0)
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(CFSTR("mailto:"), "stringByAppendingString:", a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (uint64_t)hasTel
{
  return objc_msgSend(a1, "hasPrefixCaseInsensitive:", CFSTR("tel:"));
}

- (id)stringAddingTel
{
  id v2;

  if ((objc_msgSend(a1, "hasTel") & 1) != 0)
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(CFSTR("tel:"), "stringByAppendingString:", a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)stringRemovingTel
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "hasTel"))
  {
    objc_msgSend(v1, "substringFromIndex:", 4);
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v2;
  }
  return v1;
}

- (uint64_t)isMessagesURL
{
  return objc_msgSend(a1, "hasPrefixCaseInsensitive:", CFSTR("sms:"));
}

- (uint64_t)cal_isWalletURL
{
  return objc_msgSend(a1, "hasPrefixCaseInsensitive:", CFSTR("shoebox://"));
}

- (uint64_t)cal_isPhoneNumber
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  if (v2)
  {
    _phoneNumberDetector();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "matchesInString:options:range:", a1, 0, 0, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v10, "resultType", (_QWORD)v15) == 32)
          {
            objc_msgSend(v10, "URL");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "scheme");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("tel"));

            if ((v13 & 1) != 0)
              goto LABEL_14;
          }
          else if (objc_msgSend(v10, "resultType") == 2048)
          {
LABEL_14:
            v2 = 1;
            goto LABEL_15;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
    v2 = 0;
LABEL_15:

  }
  return v2;
}

- (id)phoneURL
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v2 = objc_msgSend(a1, "length");
  if (v2)
  {
    v3 = v2;
    _phoneNumberDetector();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchesInString:options:range:", a1, 0, 0, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "phoneNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8
        && (objc_msgSend(v8, "scheme"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("tel")),
            v10,
            v11))
      {
        v12 = v9;
      }
      else if (objc_msgSend(v7, "length"))
      {
        v13 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("tel"), v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URLWithString:", v14);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v15);
          v16 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("tel"), v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "URLWithString:", v18);
          v12 = (id)objc_claimAutoreleasedReturnValue();

          v7 = (void *)v16;
        }
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)calDataDetectedURL
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v2 = objc_msgSend(a1, "length");
  if (v2)
  {
    v3 = v2;
    _phoneNumberDetector();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchesInString:options:range:", a1, 0, 0, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(v6, "phoneNumber");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = (void *)v8;
          v10 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("tel"), v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "URLWithString:", v11);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v7)
          {
            objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v12);
            v13 = objc_claimAutoreleasedReturnValue();

            v14 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("tel"), v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "URLWithString:", v15);
            v7 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = (void *)v13;
          }

        }
        else
        {
          v7 = 0;
        }
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)CalUncommentedAddress
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  id v21;
  char v23;
  char v24;

  objc_sync_enter(CFSTR("AddressParsing"));
  v2 = (void *)CalUncommentedAddress_uncommentedAddresses;
  if (!CalUncommentedAddress_uncommentedAddresses)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)CalUncommentedAddress_uncommentedAddresses;
    CalUncommentedAddress_uncommentedAddresses = (uint64_t)v3;

    v2 = (void *)CalUncommentedAddress_uncommentedAddresses;
  }
  objc_msgSend(v2, "objectForKey:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(CFSTR("AddressParsing"));
  if (!v5)
  {
    v6 = objc_msgSend(a1, "length");
    v7 = (char *)NSZoneMalloc(0, 2 * v6 + 2);
    v8 = v7;
    v9 = MEMORY[0x1E0C80978];
    v10 = v7;
    if (v6 >= 1)
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v23 = 0;
      v24 = 1;
      v10 = v7;
      do
      {
        v14 = objc_msgSend(a1, "characterAtIndex:", v11);
        v15 = v14;
        if (v14 == 92)
        {
          if (v11 + 1 >= v6)
          {
            if ((v13 & 1) == 0)
            {
              if (v12 < 1)
                goto LABEL_21;
LABEL_18:
              v13 = 0;
              v12 -= v14 == 41;
              goto LABEL_27;
            }
LABEL_13:
            *(_WORD *)v10 = v14;
            v10 += 2;
            v13 &= v14 != 34;
            goto LABEL_27;
          }
          *(_WORD *)v10 = 92;
          *((_WORD *)v10 + 1) = objc_msgSend(a1, "characterAtIndex:", v11 + 1);
          v10 += 4;
          ++v11;
        }
        else
        {
          if ((v13 & 1) != 0)
            goto LABEL_13;
          if (v14 == 40)
          {
            v13 = 0;
            ++v12;
          }
          else
          {
            if (v12 > 0)
              goto LABEL_18;
            if (v14 != 60)
            {
              if ((v23 & (v14 == 62)) != 0)
                break;
              if (v14 > 0x7F)
              {
                if (__maskrune(v14, 0x4000uLL))
                {
LABEL_22:
                  v13 = 0;
                  if ((v24 & 1) == 0)
                  {
                    *(_WORD *)v10 = 32;
                    v10 += 2;
                  }
                  v24 = 1;
                  goto LABEL_27;
                }
              }
              else
              {
LABEL_21:
                if ((*(_DWORD *)(v9 + 4 * v14 + 60) & 0x4000) != 0)
                  goto LABEL_22;
              }
              v24 = 0;
              *(_WORD *)v10 = v15;
              v10 += 2;
              v13 |= v15 == 34;
              goto LABEL_27;
            }
            v13 = 0;
            v23 = 1;
            v10 = v8;
          }
        }
LABEL_27:
        ++v11;
      }
      while (v11 < v6);
    }
    v16 = v10 - v8;
    do
    {
      v17 = v10;
      v18 = v16;
      if (v10 <= v8)
        break;
      v10 -= 2;
      v19 = *((unsigned __int16 *)v17 - 1);
      v20 = v19 > 0x7F ? __maskrune(v19, 0x4000uLL) : *(_DWORD *)(v9 + 4 * v19 + 60) & 0x4000;
      v16 = v18 - 2;
    }
    while (v20);
    *(_WORD *)v17 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v8, v18 >> 1);
    NSZoneFree(0, v8);
    objc_sync_enter(CFSTR("AddressParsing"));
    objc_msgSend((id)CalUncommentedAddress_uncommentedAddresses, "setObject:forKey:", v5, a1);
    objc_sync_exit(CFSTR("AddressParsing"));
  }
  v21 = v5;

  return v21;
}

- (id)CalAddressComment
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  unsigned __int16 *v8;
  unsigned __int16 *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int16 *v21;
  unsigned __int16 *v22;
  unsigned int v23;
  BOOL v24;
  int v26;
  unint64_t v27;
  int v28;
  int v29;
  int v30;
  unint64_t v31;
  void *v33;
  uint64_t v34;
  int v35;
  id v36;
  id v37;
  id v38;
  void *v40;

  objc_sync_enter(CFSTR("AddressParsing"));
  v2 = (void *)CalAddressComment_addressComments;
  if (!CalAddressComment_addressComments)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)CalAddressComment_addressComments;
    CalAddressComment_addressComments = (uint64_t)v3;

    v2 = (void *)CalAddressComment_addressComments;
  }
  objc_msgSend(v2, "objectForKey:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(CFSTR("AddressParsing"));
  if (v5)
    goto LABEL_88;
  v6 = objc_msgSend(a1, "length");
  v7 = 2 * v6 + 2;
  v8 = (unsigned __int16 *)NSZoneMalloc(0, v7);
  v9 = (unsigned __int16 *)NSZoneMalloc(0, v7);
  objc_msgSend(a1, "getCharacters:", v9);
  if (v6 < 1)
  {
    LOBYTE(v18) = 0;
    v19 = 0;
    goto LABEL_67;
  }
  v40 = a1;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 1;
  while (1)
  {
    v14 = v9[v12];
    if (v14 != 92)
      break;
LABEL_20:
    v13 = ++v12 < v6;
    if (v6 == v12)
      goto LABEL_21;
  }
  if (v14 == 34 && v11 == 0)
  {
    v11 = 0;
    v10 ^= 1u;
    goto LABEL_20;
  }
  if (!((v14 != 40) | v10 & 1))
  {
    v10 = 0;
    ++v11;
    goto LABEL_20;
  }
  if (!((v14 != 41) | v10 & 1))
  {
    v10 = 0;
    --v11;
    goto LABEL_20;
  }
  if (v14 != 60 || ((v10 ^ 1) & 1) == 0 || v11)
    goto LABEL_20;
LABEL_21:
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = v9;
  v22 = v8;
  do
  {
    v23 = *v21;
    if (v23 != 92)
    {
      v24 = v19 == 0;
      if (v23 == 34 && v19 == 0)
      {
        v19 = 0;
        v18 ^= 1u;
      }
      else
      {
        if ((v23 != 41) | v18 & 1)
          goto LABEL_30;
        v18 = 0;
        --v19;
      }
LABEL_38:
      if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * *v21 + 60) & 0x4000) == 0)
        goto LABEL_44;
      goto LABEL_39;
    }
    if (((v21[1] != 0) & ~v16) != 0)
    {
      v16 = 1;
      goto LABEL_56;
    }
    v24 = v19 == 0;
LABEL_30:
    v26 = (v23 == 60) & ~(_BYTE)v18 & v24;
    if (v26)
      v19 = 0;
    v17 |= v26;
    if (v23 <= 0x7F)
      goto LABEL_38;
    if (!__maskrune(v23, 0x4000uLL))
      goto LABEL_44;
LABEL_39:
    if (!v20)
      goto LABEL_51;
    v27 = *(v22 - 1);
    if (v27 > 0x7F)
    {
      if (__maskrune(v27, 0x4000uLL))
        goto LABEL_51;
    }
    else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v27 + 60) & 0x4000) != 0)
    {
      goto LABEL_51;
    }
LABEL_44:
    v28 = *v21;
    if (v28 != 34 || v19)
    {
      if (v13)
      {
        if ((v17 & 1) != 0)
        {
          v17 = 1;
          goto LABEL_51;
        }
      }
      else if (v19 < 1)
      {
        goto LABEL_51;
      }
      ++v20;
      *v22 = v28;
    }
LABEL_51:
    v29 = *v21;
    if ((v29 != 40) | v18 & 1)
    {
      v16 = 0;
      v30 = (v29 != 62) | v18 | (v19 != 0);
      if ((v30 & 1) == 0)
        v19 = 0;
      v17 &= v30;
    }
    else
    {
      v18 = 0;
      v16 = 0;
      ++v19;
    }
LABEL_56:
    v22 = &v8[v20];
    ++v21;
    --v6;
  }
  while (v6);
  a1 = v40;
  if (v20 >= 1)
  {
    v22 = &v8[v20];
    do
    {
      v31 = *(v22 - 1);
      if (v31 > 0x7F)
      {
        if (!__maskrune(v31, 0x4000uLL))
          goto LABEL_68;
      }
      else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v31 + 60) & 0x4000) == 0)
      {
        goto LABEL_68;
      }
      --v22;
    }
    while (v20-- > 1);
LABEL_67:
    v20 = 0;
    v22 = v8;
  }
LABEL_68:
  *v22 = 0;
  if (v19 || (v18 & 1) != 0)
  {
    v36 = a1;
LABEL_80:
    if (!v36)
      goto LABEL_81;
    goto LABEL_85;
  }
  v22 = &v8[v20];
  if (v20 < 2)
    goto LABEL_81;
  v33 = 0;
  v34 = v20 + 1;
  while (2)
  {
    v35 = *v8;
    if (v35 == 39)
    {
      if (*(v22 - 1) != 39)
        break;
      goto LABEL_77;
    }
    if (v35 == 34 && *(v22 - 1) == 34)
    {
LABEL_77:
      *--v22 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v8 + 1, v34 - 3);
      v36 = (id)objc_claimAutoreleasedReturnValue();

      --v34;
      v33 = v36;
      if (v34 <= 2)
        goto LABEL_80;
      continue;
    }
    break;
  }
  v36 = v33;
  if (v33)
    goto LABEL_85;
LABEL_81:
  if (v22 == v8)
  {
    v36 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v8, v22 - v8);
    v36 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_85:
  NSZoneFree(0, v8);
  NSZoneFree(0, v9);
  if (v22 == v8)
  {
    v37 = a1;

    v36 = v37;
  }
  objc_sync_enter(CFSTR("AddressParsing"));
  v5 = (void *)objc_msgSend(v36, "copy");

  objc_msgSend((id)CalAddressComment_addressComments, "setObject:forKey:", v5, a1);
  objc_sync_exit(CFSTR("AddressParsing"));
LABEL_88:
  v38 = v5;

  return v38;
}

- (uint64_t)directionalityIsolatedString
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("⁨%@⁩"), a1);
}

- (uint64_t)RTLString
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\u200F%@\u202C"), a1);
}

+ (id)ellipsisString
{
  __int16 v1;

  v1 = 8230;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)cal_enumerateCharactersUsingBlock:()CalClassAdditions
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t i;
  _WORD v10[32];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 32;
    do
    {
      if (v8 + v7 > v6)
        v8 = v6 - v7;
      objc_msgSend(a1, "getCharacters:range:", v10, v7, v8);
      if (v8)
      {
        for (i = 0; i < v8; ++i)
          v4[2](v4, (unsigned __int16)v10[i]);
      }
      v7 += 32;
    }
    while (v7 < v6);
  }

}

+ (id)stringWithContentsOfFile:()CalClassAdditions usingEncoding:
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:encoding:", v6, a4);
  }
  else
  {
    NSLog(CFSTR("unable to read data at path : %@"), v5);
    v7 = 0;
  }

  return v7;
}

- (uint64_t)isPathToAppleScript
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pathExtension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("scpt"));

  return v3;
}

- (uint64_t)isPathToVCalData
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("vcs")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("vcal"));

  }
  return v4;
}

- (uint64_t)isPathToICalData
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pathExtension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ics"));

  return v3;
}

- (uint64_t)isPathToBackupFile
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pathExtension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("icbu"));

  return v3;
}

- (uint64_t)isPathToICalBookmark
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pathExtension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("icaltodo"));
  return v3;
}

- (BOOL)CalContainsSubstring:()CalClassAdditions
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 2) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)trimFinalChar:()CalClassAdditions
{
  id v5;

  if (objc_msgSend(a1, "length")
    && objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1) == a3)
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (id)trimFirstChar:()CalClassAdditions
{
  id v5;

  if (objc_msgSend(a1, "length") && objc_msgSend(a1, "characterAtIndex:", 0) == a3)
  {
    objc_msgSend(a1, "substringFromIndex:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (id)trimChar:()CalClassAdditions
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "trimFirstChar:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trimFinalChar:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)trimFinalComma
{
  id v2;

  if (objc_msgSend(a1, "length")
    && objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1) == 44)
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)trimFirstComma
{
  id v2;

  if (objc_msgSend(a1, "length") && objc_msgSend(a1, "characterAtIndex:", 0) == 44)
  {
    objc_msgSend(a1, "substringFromIndex:", 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)trimCommas
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "trimFirstComma");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "trimFinalComma");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)searchAndReplaceString:()CalClassAdditions withString:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", a1);
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v8, "setCharactersToBeSkipped:", 0);
  if (objc_msgSend(v8, "scanString:intoString:", v6, 0))
    objc_msgSend(v9, "appendString:", v7);
  v16 = 0;
  v10 = objc_msgSend(v8, "scanUpToString:intoString:", v6, &v16);
  v11 = v16;
  v12 = v11;
  if (v10)
  {
    do
    {
      objc_msgSend(v9, "appendString:", v12);
      if (objc_msgSend(v8, "scanString:intoString:", v6, 0))
        objc_msgSend(v9, "appendString:", v7);
      v16 = v12;
      v13 = objc_msgSend(v8, "scanUpToString:intoString:", v6, &v16);
      v14 = v16;

      v12 = v14;
    }
    while ((v13 & 1) != 0);
  }
  else
  {
    v14 = v11;
  }

  return v9;
}

+ (id)stringWithFileSystemRepresentation:()CalClassAdditions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFileSystemRepresentation:length:", a3, strlen(a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (__CFString)CalSafeFilename
{
  __CFString *v2;
  __CFString *v3;

  if (CalSafeFilename_onceToken != -1)
    dispatch_once(&CalSafeFilename_onceToken, &__block_literal_global_70);
  objc_msgSend(a1, "stringByReplacingCharactersInSet:withString:", CalSafeFilename_disallowedCharacters, CFSTR("-"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString hasPrefix:](v2, "hasPrefix:", CFSTR(".")))
  {
    do
    {
      -[__CFString substringFromIndex:](v2, "substringFromIndex:", 1);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v2 = v3;
    }
    while ((-[__CFString hasPrefix:](v3, "hasPrefix:", CFSTR(".")) & 1) != 0);
  }
  else
  {
    v3 = v2;
  }
  if (!-[__CFString length](v3, "length"))
  {

    v3 = CFSTR("-");
  }
  return v3;
}

- (id)CalSafeHFSPathComponentName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)stringByRemovingCharactersInSet:()CalClassAdditions
{
  return objc_msgSend(a1, "stringByReplacingCharactersInSet:withString:", a3, &stru_1E2A86598);
}

- (id)stringByRemovingPrefixCaseInsensitive:()CalClassAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "copy");
  if (objc_msgSend(a1, "hasPrefixCaseInsensitive:", v4))
  {
    objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v4, "length"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

+ (id)CalAutoCommentPrefix
{
  if (CalAutoCommentPrefix_onceToken != -1)
    dispatch_once(&CalAutoCommentPrefix_onceToken, &__block_literal_global_79);
  return (id)CalAutoCommentPrefix_prefix;
}

- (uint64_t)CalHasAutoCommentPrefix
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("\n"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "CalAutoCommentPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1;
  objc_msgSend(v3, "substringFromIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsString:", v3) & 1) == 0)
    v4 = objc_msgSend(v2, "containsString:", v5);

  return v4;
}

- (__CFString)CalStringByRemovingAutoComment
{
  __CFString *v2;
  uint64_t v3;
  const __CFString *v4;

  v2 = (__CFString *)objc_msgSend(a1, "copy");
  if (objc_msgSend(a1, "CalHasAutoCommentPrefix"))
  {
    v3 = objc_msgSend(a1, "rangeOfString:", CFSTR("\n"));
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = &stru_1E2A86598;
    }
    else
    {
      objc_msgSend(a1, "substringFromIndex:", v3 + 1);
      v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }

    v2 = (__CFString *)v4;
  }
  return v2;
}

- (id)CalStringWithOnlyAutoComment
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "CalHasAutoCommentPrefix"))
  {
    v2 = objc_msgSend(a1, "rangeOfString:", CFSTR("\n"));
    if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v3 = (void *)objc_msgSend(a1, "copy");
      objc_msgSend(v3, "stringByAppendingString:", CFSTR("\n"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(a1, "substringToIndex:", v2 + 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)cal_stringWithNormalizedSpacesForUnitTesting
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("  "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByReplacingCharactersInSet:withString:", v2, CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
