@implementation CNNameComponentsStringTokenizer

+ (id)componentsFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:", v4);

  objc_msgSend(v5, "parseComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNNameComponentsStringTokenizer)initWithString:(id)a3
{
  id v4;
  void *v5;
  CNNameComponentsStringTokenizer *v6;
  uint64_t v7;
  NSString *string;
  NSPersonNameComponents *v9;
  NSPersonNameComponents *components;
  CNNameComponentsStringTokenizer *v11;
  objc_super v13;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (CNGuardOSLog_cn_once_token_0_6 != -1)
        dispatch_once(&CNGuardOSLog_cn_once_token_0_6, &__block_literal_global_84_1);
      v5 = (void *)CNGuardOSLog_cn_once_object_0_6;
      if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_6, OS_LOG_TYPE_FAULT))
        -[CNNameComponentsStringTokenizer initWithString:].cold.1(v5);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CNNameComponentsStringTokenizer;
  v6 = -[CNNameComponentsStringTokenizer init](&v13, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    string = v6->_string;
    v6->_string = (NSString *)v7;

    v9 = (NSPersonNameComponents *)objc_alloc_init(MEMORY[0x1E0CB3850]);
    components = v6->_components;
    v6->_components = v9;

    v11 = v6;
  }

  return v6;
}

- (id)parseComponents
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  -[CNNameComponentsStringTokenizer removeParentheticalContent](self, "removeParentheticalContent");
  -[CNNameComponentsStringTokenizer extractNicknameFromQuotedContent](self, "extractNicknameFromQuotedContent");
  v7 = 0;
  v3 = (void *)objc_opt_class();
  -[CNNameComponentsStringTokenizer string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokensFromString:nameOrder:", v4, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNNameComponentsStringTokenizer setTokens:](self, "setTokens:", v5);

  -[CNNameComponentsStringTokenizer extractNameSuffixFromEnd](self, "extractNameSuffixFromEnd");
  -[CNNameComponentsStringTokenizer extractNamePrefixFromBeginning](self, "extractNamePrefixFromBeginning");
  -[CNNameComponentsStringTokenizer adjustTokensForNobiliaryParticles](self, "adjustTokensForNobiliaryParticles");
  -[CNNameComponentsStringTokenizer extractGivenMiddleFamilyNamesFromWhatsLeftUsingOrder:](self, "extractGivenMiddleFamilyNamesFromWhatsLeftUsingOrder:", v7);
  -[CNNameComponentsStringTokenizer components](self, "components");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)removeParentheticalContent
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD v10[4];
  _QWORD v11[4];

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  -[CNNameComponentsStringTokenizer string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__CNNameComponentsStringTokenizer_removeParentheticalContent__block_invoke;
  v6[3] = &unk_1E29BBFE0;
  v8 = v11;
  v9 = v10;
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "_cn_eachCharacter:", v6);

  -[CNNameComponentsStringTokenizer setString:](self, "setString:", v5);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);

}

uint64_t __61__CNNameComponentsStringTokenizer_removeParentheticalContent__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((int)a2 <= 90)
  {
    if ((_DWORD)a2 != 40)
    {
      if ((_DWORD)a2 == 41)
      {
        v2 = *(_QWORD *)(result + 40);
LABEL_8:
        v3 = *(_QWORD *)(v2 + 8);
        v4 = *(_QWORD *)(v3 + 24);
        if (!v4)
          return result;
        v5 = v4 - 1;
        goto LABEL_13;
      }
      goto LABEL_15;
    }
    v6 = *(_QWORD *)(result + 40);
LABEL_12:
    v3 = *(_QWORD *)(v6 + 8);
    v5 = *(_QWORD *)(v3 + 24) + 1;
LABEL_13:
    *(_QWORD *)(v3 + 24) = v5;
    return result;
  }
  if ((_DWORD)a2 == 91)
  {
    v6 = *(_QWORD *)(result + 48);
    goto LABEL_12;
  }
  if ((_DWORD)a2 == 93)
  {
    v2 = *(_QWORD *)(result + 48);
    goto LABEL_8;
  }
LABEL_15:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24)
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    return objc_msgSend(*(id *)(result + 32), "appendFormat:", CFSTR("%C"), a2);
  }
  return result;
}

- (void)extractNicknameFromQuotedContent
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\"'“”‘’«»"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[CNNameComponentsStringTokenizer string](self, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v25);
  v5 = v4;
  v7 = v6;
  if (!v4
    || v4 != 0x7FFFFFFFFFFFFFFFLL
    && (objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v5 - 1)),
        v8,
        v9))
  {
    v10 = v5 + v7;
    v11 = objc_msgSend(v3, "_cn_rangeFromIndex:", v10);
    v13 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v25, 0, v11, v12);
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = v13;
      v16 = v13 + v14;
      if (v13 + v14 == objc_msgSend(v3, "length")
        || (objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v17, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v16)),
            v17,
            v18))
      {
        v19 = objc_msgSend(v3, "_cn_rangeFromIndex:", v16);
        if (objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v25, 0, v19, v20) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v21 = v15 - v10;
          objc_msgSend(v3, "substringWithRange:", v10, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v3, "mutableCopy");
          objc_msgSend(v23, "deleteCharactersInRange:", v10 - 1, v21 + 2);
          -[CNNameComponentsStringTokenizer components](self, "components");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setNickname:", v22);

          -[CNNameComponentsStringTokenizer setString:](self, "setString:", v23);
        }
      }
    }
  }

}

+ (id)tokensFromString:(id)a3 nameOrder:(int64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  v6 = a3;
  if (!CNStringContainsChineseJapaneseKoreanCharacters(v6))
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(","));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(a1, "whitespaceTokens:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "whitespaceTokens:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_cn_all:", &__block_literal_global_25);

    if (v12)
    {
      objc_msgSend(v8, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "whitespaceTokens:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v14);

      objc_msgSend(v8, "_cn_skipLast:", 1);
      v15 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v15;
    }
    if (objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(v8, "firstObject");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v8, "count") != 2)
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __62__CNNameComponentsStringTokenizer_tokensFromString_nameOrder___block_invoke;
        v22[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
        v22[4] = a1;
        objc_msgSend(v8, "_cn_flatMap:", v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v18, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "insertObjects:atIndexes:", v18, v19);
        goto LABEL_13;
      }
      objc_msgSend(v8, "objectAtIndex:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertObject:atIndex:", v17, 0);

      objc_msgSend(v8, "objectAtIndex:", 1);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v16;
    objc_msgSend(a1, "whitespaceTokens:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertObject:atIndex:", v19, 0);
LABEL_13:

    objc_msgSend(v9, "_cn_flatten");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_cn_map:", &__block_literal_global_70);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  objc_msgSend(v6, "_cn_nameComponentTokensUsingLocale:inferredNameOrder:", 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v7;
}

uint64_t __62__CNNameComponentsStringTokenizer_tokensFromString_nameOrder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "whitespaceTokens:", a2);
}

uint64_t __62__CNNameComponentsStringTokenizer_tokensFromString_nameOrder___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_trimmedString");
}

- (void)extractNameSuffixFromEnd
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[CNNameComponentsStringTokenizer tokens](self, "tokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 3)
  {
    v5 = (void *)objc_opt_class();
    -[CNNameComponentsStringTokenizer tokens](self, "tokens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "isNameSuffix:", v7);

    if ((_DWORD)v5)
    {
      -[CNNameComponentsStringTokenizer tokens](self, "tokens");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNNameComponentsStringTokenizer components](self, "components");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNameSuffix:", v9);

      -[CNNameComponentsStringTokenizer tokens](self, "tokens");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_cn_skipLast:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNNameComponentsStringTokenizer setTokens:](self, "setTokens:", v11);

    }
  }
}

- (void)extractNamePrefixFromBeginning
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[CNNameComponentsStringTokenizer tokens](self, "tokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 3)
  {
    v5 = (void *)objc_opt_class();
    -[CNNameComponentsStringTokenizer tokens](self, "tokens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "isNamePrefix:", v7);

    if ((_DWORD)v5)
    {
      -[CNNameComponentsStringTokenizer tokens](self, "tokens");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNNameComponentsStringTokenizer components](self, "components");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNamePrefix:", v9);

      -[CNNameComponentsStringTokenizer tokens](self, "tokens");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_cn_skip:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNNameComponentsStringTokenizer setTokens:](self, "setTokens:", v11);

    }
  }
}

- (void)adjustTokensForNobiliaryParticles
{
  void *v3;
  unint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  -[CNNameComponentsStringTokenizer tokens](self, "tokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 3)
  {
    -[CNNameComponentsStringTokenizer tokens](self, "tokens");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_cn_any:", &__block_literal_global_27_0);

    if (v6)
    {
      v7 = (void *)objc_opt_class();
      -[CNNameComponentsStringTokenizer tokens](self, "tokens");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tokensByAdjustingForNobiliaryParticles:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNNameComponentsStringTokenizer setTokens:](self, "setTokens:", v8);

    }
  }
}

+ (id)tokensByAdjustingForNobiliaryParticles:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__CNNameComponentsStringTokenizer_tokensByAdjustingForNobiliaryParticles___block_invoke;
  v9[3] = &unk_1E29BC028;
  v11 = a1;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "_cn_each_reverse:", v9);

  return v7;
}

void __74__CNNameComponentsStringTokenizer_tokensByAdjustingForNobiliaryParticles___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 40), "isNobiliaryParticle:") && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v6, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "replaceObjectAtIndex:withObject:", 0, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v6, 0);
  }

}

+ (id)whitespaceTokens:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_cn_filter:", &__block_literal_global_31_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)extractGivenMiddleFamilyNamesFromWhatsLeftUsingOrder:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  -[CNNameComponentsStringTokenizer tokens](self, "tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  switch(v6)
  {
    case 3:
      -[CNNameComponentsStringTokenizer tokens](self, "tokens");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNNameComponentsStringTokenizer components](self, "components");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (a3 == -1)
      {
        objc_msgSend(v10, "setFamilyName:", v9);

        -[CNNameComponentsStringTokenizer tokens](self, "tokens");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndex:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNNameComponentsStringTokenizer components](self, "components");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setGivenName:", v23);

        -[CNNameComponentsStringTokenizer tokens](self, "tokens");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndex:", 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNNameComponentsStringTokenizer components](self, "components");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setMiddleName:", v7);
        goto LABEL_13;
      }
      objc_msgSend(v10, "setGivenName:", v9);

      -[CNNameComponentsStringTokenizer tokens](self, "tokens");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNNameComponentsStringTokenizer components](self, "components");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMiddleName:", v13);

      -[CNNameComponentsStringTokenizer tokens](self, "tokens");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v15;
      v16 = 2;
LABEL_9:
      objc_msgSend(v15, "objectAtIndex:", v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNNameComponentsStringTokenizer components](self, "components");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFamilyName:", v7);
LABEL_13:

      goto LABEL_14;
    case 2:
      -[CNNameComponentsStringTokenizer tokens](self, "tokens");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndex:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNNameComponentsStringTokenizer components](self, "components");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (a3 == -1)
      {
        objc_msgSend(v19, "setFamilyName:", v18);

        -[CNNameComponentsStringTokenizer tokens](self, "tokens");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndex:", 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNNameComponentsStringTokenizer components](self, "components");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setGivenName:", v7);
        goto LABEL_13;
      }
      objc_msgSend(v19, "setGivenName:", v18);

      -[CNNameComponentsStringTokenizer tokens](self, "tokens");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v15;
      v16 = 1;
      goto LABEL_9;
    case 1:
      -[CNNameComponentsStringTokenizer string](self, "string");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[CNNameComponentsStringTokenizer components](self, "components");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGivenName:", v25);
LABEL_14:

      break;
  }
}

+ (BOOL)isNamePrefix:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  char v7;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CNNameComponentsStringTokenizer_isNamePrefix___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = isNamePrefix__cn_once_token_2;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isNamePrefix__cn_once_token_2, block);
  v5 = (id)isNamePrefix__cn_once_object_2;
  sNormalizeElements_block_invoke_3((uint64_t)v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

void __48__CNNameComponentsStringTokenizer_isNamePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "namePrefixElements");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)isNamePrefix__cn_once_object_2;
  isNamePrefix__cn_once_object_2 = v3;

}

+ (id)namePrefixElements
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "nameComponentElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("prefixes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_map:", &__block_literal_global_29_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isNameSuffix:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  char v7;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CNNameComponentsStringTokenizer_isNameSuffix___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = isNameSuffix__cn_once_token_3;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isNameSuffix__cn_once_token_3, block);
  v5 = (id)isNameSuffix__cn_once_object_3;
  sNormalizeElements_block_invoke_3((uint64_t)v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

void __48__CNNameComponentsStringTokenizer_isNameSuffix___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "nameSuffixElements");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)isNameSuffix__cn_once_object_3;
  isNameSuffix__cn_once_object_3 = v3;

}

+ (id)nameSuffixElements
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "nameComponentElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("suffixes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_map:", &__block_literal_global_29_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isNobiliaryParticle:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  char v7;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CNNameComponentsStringTokenizer_isNobiliaryParticle___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = isNobiliaryParticle__cn_once_token_4;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isNobiliaryParticle__cn_once_token_4, block);
  v5 = (id)isNobiliaryParticle__cn_once_object_4;
  sNormalizeElements_block_invoke_3((uint64_t)v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

void __55__CNNameComponentsStringTokenizer_isNobiliaryParticle___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "nobiliaryParticleElements");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)isNobiliaryParticle__cn_once_object_4;
  isNobiliaryParticle__cn_once_object_4 = v3;

}

+ (id)nobiliaryParticleElements
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "nameComponentElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nobiliary particles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_map:", &__block_literal_global_29_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)nameComponentElements
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CNNameComponentsStringTokenizer_nameComponentElements__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (nameComponentElements_cn_once_token_5 != -1)
    dispatch_once(&nameComponentElements_cn_once_token_5, block);
  return (id)nameComponentElements_cn_once_object_5;
}

void __56__CNNameComponentsStringTokenizer_nameComponentElements__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "uncachedNameComponentElements");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)nameComponentElements_cn_once_object_5;
  nameComponentElements_cn_once_object_5 = v1;

}

+ (id)uncachedNameComponentElements
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("NameComponentElements"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSPersonNameComponents)components
{
  return (NSPersonNameComponents *)objc_getProperty(self, a2, 16, 1);
}

- (void)setComponents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)tokens
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTokens:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

- (void)initWithString:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v3 = 138543362;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_fault_impl(&dword_18F80C000, v1, OS_LOG_TYPE_FAULT, "parameter ‘string’ must be of type %{public}@", (uint8_t *)&v3, 0xCu);

}

@end
