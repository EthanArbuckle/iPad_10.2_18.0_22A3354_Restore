@implementation NSString(ContactsFoundation)

- (BOOL)_cn_containsSubstring:()ContactsFoundation
{
  return objc_msgSend(a1, "rangeOfString:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)_cn_take:()ContactsFoundation
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a1, "_cn_rangeOfAnchoredCharacters:options:", a3, 0);
  return objc_msgSend(a1, "substringWithRange:", v4, v5);
}

- (uint64_t)_cn_rangeOfAnchoredCharacters:()ContactsFoundation options:
{
  uint64_t v7;
  uint64_t (**v8)(_QWORD);
  uint64_t (**v9)(void *, uint64_t, unint64_t);
  uint64_t location;
  unint64_t v11;
  unint64_t i;
  NSUInteger v13;
  NSRange v14;
  _QWORD v16[5];
  _QWORD aBlock[6];
  NSRange v18;
  NSRange v19;

  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__NSString_ContactsFoundation___cn_rangeOfAnchoredCharacters_options___block_invoke;
  aBlock[3] = &unk_1E29BC9C8;
  aBlock[4] = a1;
  aBlock[5] = a4;
  v8 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __70__NSString_ContactsFoundation___cn_rangeOfAnchoredCharacters_options___block_invoke_2;
  v16[3] = &__block_descriptor_40_e20_Q24__0__NSRange_QQ_8l;
  v16[4] = a4;
  v9 = (uint64_t (**)(void *, uint64_t, unint64_t))_Block_copy(v16);
  location = v8[2](v8);
  for (i = v11; a3; --a3)
  {
    if (i >= objc_msgSend(a1, "length"))
      break;
    v19.location = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", v9[2](v9, location, i));
    v19.length = v13;
    v18.location = location;
    v18.length = i;
    v14 = NSUnionRange(v18, v19);
    location = v14.location;
    i = v14.length;
  }

  return location;
}

- (id)_cn_trimmedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_cn_containsCharacterInSet:()ContactsFoundation
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_cn_resultWithAllCharacters:()ContactsFoundation
{
  void (**v4)(id, const UniChar *, unint64_t);
  uint64_t v5;
  unint64_t v6;
  const UniChar *CharactersPtr;
  uint64_t v8;
  char *v9;
  void *v10;
  UniChar *v11;
  UniChar *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[__CFString length](a1, "length");
  if (!a1)
    goto LABEL_9;
  v6 = v5;
  if (!-[__CFString length](a1, "length"))
    goto LABEL_9;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  if (CharactersPtr)
  {
    v4[2](v4, CharactersPtr, v6);
LABEL_10:
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v6 > 0xFE)
  {
    v11 = (UniChar *)malloc_type_malloc(2 * v6 + 2, 0x1000040BDFB0063uLL);
    if (v11)
    {
      v12 = v11;
      -[__CFString getCharacters:range:](a1, "getCharacters:range:", v11, 0, v6);
      v12[v6] = 0;
      v4[2](v4, v12, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      free(v12);
      goto LABEL_11;
    }
LABEL_9:
    v4[2](v4, 0, 0);
    goto LABEL_10;
  }
  MEMORY[0x1E0C80A78]();
  v9 = (char *)v14 - ((v8 + 17) & 0xFFFFFFFFFFFFFFF0);
  -[__CFString getCharacters:range:](a1, "getCharacters:range:", v9, 0, v6);
  *(_WORD *)&v9[2 * v6] = 0;
  v4[2](v4, (const UniChar *)v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v10;
}

+ (uint64_t)_cn_isBlank:()ContactsFoundation
{
  if (a3)
    return objc_msgSend(a3, "_cn_isBlank");
  else
    return 1;
}

- (uint64_t)_cn_isBlank
{
  return objc_msgSend(a1, "isEqualToString:", &stru_1E29BCC70);
}

- (BOOL)_cn_caseInsensitiveIsEqual:()ContactsFoundation
{
  return objc_msgSend(a1, "caseInsensitiveCompare:") == 0;
}

- (uint64_t)_cn_hasPrefix:()ContactsFoundation
{
  return objc_msgSend(a1, "_cn_hasPrefix:options:", a3, 385);
}

- (uint64_t)_cn_hasPrefix:()ContactsFoundation options:
{
  if (a3)
    return objc_msgSend(a1, "_cn_containsSubstring:options:", a3, a4 | 8);
  else
    return 0;
}

- (uint64_t)_cn_hasSuffix:()ContactsFoundation
{
  return objc_msgSend(a1, "_cn_hasSuffix:options:", a3, 385);
}

- (uint64_t)_cn_hasSuffix:()ContactsFoundation options:
{
  if (a3)
    return objc_msgSend(a1, "_cn_containsSubstring:options:", a3, a4 | 0xC);
  else
    return 0;
}

- (id)_cn_stringByDeletingCharactersInSet:()ContactsFoundation
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(a1, "_cn_containsCharacterInSet:", v4))
  {
    v5 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v5, "_cn_deleteCharactersInSet:", v4);
    v6 = (id)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = a1;
  }

  return v6;
}

- (BOOL)_cn_containsSubstring:()ContactsFoundation options:
{
  return objc_msgSend(a1, "rangeOfString:options:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)_cn_rangeOfCommonPrefixWithString:()ContactsFoundation
{
  return objc_msgSend(a1, "_cn_rangeOfCommonPrefixWithString:options:", a3, 0);
}

- (uint64_t)_cn_rangeOfCommonPrefixWithString:()ContactsFoundation options:
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v7 = objc_msgSend(a1, "length");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__NSString_ContactsFoundation___cn_rangeOfCommonPrefixWithString_options___block_invoke;
  v11[3] = &unk_1E29BC9A0;
  v8 = v6;
  v12 = v8;
  v13 = a1;
  v14 = &v16;
  v15 = a4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 2, v11);
  if (v17[3])
    v9 = 0;
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)_cn_stringByAddingPercentEscapesIfNecessary
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = a1;
  }
  else
  {
    objc_msgSend(a1, "stringByRemovingPercentEncoding");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
      v4 = a1;
    objc_msgSend(v4, "_cn_stringByAddingPercentEscapesToEntireURL");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_cn_stringByAddingPercentEscapesToEntireURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLWithDataRepresentation:relativeToURL:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_cn_stringByDeletingNumberOfPathComponents:()ContactsFoundation
{
  id v4;
  void *v5;
  void *v6;

  v4 = a1;
  v5 = v4;
  if (a3)
  {
    do
    {
      objc_msgSend(v5, "stringByDeletingLastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v6;
      --a3;
    }
    while (a3);
  }
  else
  {
    v6 = v4;
  }
  return v6;
}

- (id)_cn_stringByNormalizingCase
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "newStringFrom:usingUnicodeTransforms:", a1, 3);
}

- (id)_cn_tokens
{
  return +[CNStringTokenizer tokenizeString:](CNStringTokenizer, "tokenizeString:", a1);
}

- (id)_cn_nameComponentTokens
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cn_nameComponentTokensUsingLocale:inferredNameOrder:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_cn_nameComponentTokensUsingLocale:()ContactsFoundation inferredNameOrder:
{
  void *v5;
  uint64_t v6;
  uint64_t v8;

  v8 = 0;
  +[CNNameStringTokenizer tokenizeNameString:usingLocale:inferredNameOrder:](CNNameStringTokenizer, "tokenizeNameString:usingLocale:inferredNameOrder:", a1, a3, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    if (v8 == -1)
      v6 = -1;
    else
      v6 = v8 == 1;
    *a4 = v6;
  }
  return v5;
}

- (id)_cn_SHA256HashStringWithSalt:()ContactsFoundation
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_SHA256HashDataWithSalt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 1);
  return v7;
}

- (uint64_t)_cn_rangeFromIndex:()ContactsFoundation
{
  unint64_t v3;

  v3 = a3;
  if (objc_msgSend(a1, "length") < a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(a1, "length");
  return v3;
}

- (void)_cn_eachCharacter:()ContactsFoundation
{
  unint64_t v4;
  void (**v5)(id, uint64_t);

  v5 = a3;
  if (objc_msgSend(a1, "length"))
  {
    v4 = 0;
    do
      v5[2](v5, objc_msgSend(a1, "characterAtIndex:", v4++));
    while (v4 < objc_msgSend(a1, "length"));
  }

}

- (uint64_t)_cn_skip:()ContactsFoundation
{
  uint64_t v4;

  objc_msgSend(a1, "_cn_rangeOfAnchoredCharacters:options:", a3, 0);
  return objc_msgSend(a1, "substringFromIndex:", v4);
}

- (uint64_t)_cn_skipLast:()ContactsFoundation
{
  return objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "_cn_rangeOfAnchoredCharacters:options:", a3, 4));
}

- (uint64_t)_cn_takeLast:()ContactsFoundation
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a1, "_cn_rangeOfAnchoredCharacters:options:", a3, 4);
  return objc_msgSend(a1, "substringWithRange:", v4, v5);
}

- (__CFString)_cn_truncateAtLength:()ContactsFoundation addEllipsisIfTrunctated:
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;

  if (a3)
  {
    if (objc_msgSend(a1, "length") <= a3)
    {
      v11 = a1;
    }
    else
    {
      v7 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", a3 - 1);
      if (v7 + v8 <= a3)
        v9 = a3;
      else
        v9 = v7;
      objc_msgSend(a1, "substringToIndex:", v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (a4)
      {
        -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("…"));
        v12 = objc_claimAutoreleasedReturnValue();

        v11 = (__CFString *)v12;
      }
    }
  }
  else
  {
    v11 = &stru_1E29BCC70;
  }
  return v11;
}

- (id)_cn_flatMap:()ContactsFoundation
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v6 = objc_msgSend(a1, "length");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__NSString_ContactsFoundation___cn_flatMap___block_invoke;
  v12[3] = &unk_1E29BCA18;
  v7 = v5;
  v13 = v7;
  v14 = v4;
  v8 = v4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 2, v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

@end
