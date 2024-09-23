@implementation CNAutocompleteResultTokenMatcher

- (CNAutocompleteResultTokenMatcher)init
{
  return -[CNAutocompleteResultTokenMatcher initWithSearchString:](self, "initWithSearchString:", 0);
}

- (CNAutocompleteResultTokenMatcher)initWithSearchString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  CNAutocompleteResultTokenMatcher *v8;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNAutocompleteResultTokenMatcher initWithSearchString:countryCode:](self, "initWithSearchString:countryCode:", v5, v7);
  return v8;
}

- (CNAutocompleteResultTokenMatcher)initWithSearchString:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  CNAutocompleteResultTokenMatcher *v8;
  uint64_t v9;
  NSArray *tokens;
  uint64_t v11;
  NSString *countryCode;
  CNAutocompleteResultTokenMatcher *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNAutocompleteResultTokenMatcher;
  v8 = -[CNAutocompleteResultTokenMatcher init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "searchTokensFromString:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    tokens = v8->_tokens;
    v8->_tokens = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    countryCode = v8->_countryCode;
    v8->_countryCode = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

+ (id)searchTokensFromString:(id)a3
{
  void *v3;
  void *v4;

  +[CNAutocompleteInputStringTokenizer tokensFromString:](CNAutocompleteInputStringTokenizer, "tokensFromString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_map:", &__block_literal_global_24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)filterAdapter
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__CNAutocompleteResultTokenMatcher_filterAdapter__block_invoke;
  v3[3] = &unk_1E70DFA30;
  v3[4] = self;
  return (id)objc_msgSend(v3, "copy");
}

uint64_t __49__CNAutocompleteResultTokenMatcher_filterAdapter__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateResult:", a2);
}

- (BOOL)evaluateResult:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (v4)
    v5 = -[CNAutocompleteResultTokenMatcher evaluateSingleResult:](self, "evaluateSingleResult:", v4)
      || -[CNAutocompleteResultTokenMatcher evaluateTopLevelGroupResult:](self, "evaluateTopLevelGroupResult:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)evaluateSingleResult:(id)a3
{
  CNAutocompleteResultTokenMatcher *v3;
  void *v4;

  v3 = self;
  -[CNAutocompleteResultTokenMatcher nameTokensForResult:](self, "nameTokensForResult:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = +[CNAutocompleteTokenMatcher doSearchTokens:matchNameTokens:](CNAutocompleteTokenMatcher, "doSearchTokens:matchNameTokens:", v3->_tokens, v4);

  return (char)v3;
}

- (BOOL)evaluateTopLevelGroupResult:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  NSObject *v8;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "resultType") == 1)
  {
    v11 = 0;
    objc_msgSend(v4, "members:", &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (v5)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __64__CNAutocompleteResultTokenMatcher_evaluateTopLevelGroupResult___block_invoke;
      v10[3] = &unk_1E70DFA30;
      v10[4] = self;
      v7 = objc_msgSend(v5, "_cn_any:", v10);
    }
    else
    {
      CNALoggingContextDebug();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v6;
        v14 = 2112;
        v15 = v4;
        _os_log_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEFAULT, "Error: %@ a result %@ has no members", buf, 0x16u);
      }

      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __64__CNAutocompleteResultTokenMatcher_evaluateTopLevelGroupResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateSingleResult:", a2);
}

- (id)nameTokensForResult:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultTokenMatcher tokensForResultName:](self, "tokensForResultName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteResultTokenMatcher tokensForResultValue:](self, "tokensForResultValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  objc_msgSend(v6, "_cn_flatten");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_map:", &__block_literal_global_24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)tokensForResultName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nameComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_addNonNilObject:", v7);

  objc_msgSend(v4, "nameComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_addNonNilObject:", v9);

  objc_msgSend(v4, "nameComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nickname");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_addNonNilObject:", v11);

  objc_msgSend(v4, "nameComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nameSuffix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_addNonNilObject:", v13);

  objc_msgSend(v4, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_cn_addNonNilObject:", v14);
  objc_msgSend(v5, "_cn_flatMap:", &__block_literal_global_8_2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __56__CNAutocompleteResultTokenMatcher_tokensForResultName___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNAutocompleteTokenMatcher tokensForNameString:](CNAutocompleteTokenMatcher, "tokensForNameString:", a2);
}

- (id)tokensForResultValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "addressType");
    objc_msgSend(v4, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == 2)
    {
      -[CNAutocompleteResultTokenMatcher representationsOfPhoneNumber:](self, "representationsOfPhoneNumber:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v8);

    }
    else
    {
      objc_msgSend(v5, "_cn_addNonNilObject:", v7);
    }

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)representationsOfPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v4);
    objc_msgSend((id)objc_opt_class(), "normalizePhoneNumber:countryCode:", v4, self->_countryCode);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_addNonNilObject:", v7);
    objc_msgSend((id)objc_opt_class(), "indexTokensFromPhoneNumber:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

    objc_msgSend((id)objc_opt_class(), "indexTokensFromPhoneNumber:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v9);

    objc_msgSend(v6, "_cn_distinctObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)indexTokensFromPhoneNumber:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "tokenizePhoneNumber:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    v6 = (void *)MEMORY[0x1E0C9AA60];
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        objc_msgSend(v9, "arrayByAddingObject:", &stru_1E70E0E70);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __63__CNAutocompleteResultTokenMatcher_indexTokensFromPhoneNumber___block_invoke;
        v14[3] = &unk_1E70DFDF0;
        v14[4] = v10;
        objc_msgSend(v11, "_cn_map:", v14);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v6;
      }
      while (v4 != v8);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

uint64_t __63__CNAutocompleteResultTokenMatcher_indexTokensFromPhoneNumber___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringByAppendingString:", *(_QWORD *)(a1 + 32));
}

+ (id)tokenizePhoneNumber:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v3 = tokenizePhoneNumber__cn_once_token_1;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&tokenizePhoneNumber__cn_once_token_1, &__block_literal_global_10_1);
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", tokenizePhoneNumber__cn_once_object_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_cn_filter:", &__block_literal_global_14_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __56__CNAutocompleteResultTokenMatcher_tokenizePhoneNumber___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("+()- "));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tokenizePhoneNumber__cn_once_object_1;
  tokenizePhoneNumber__cn_once_object_1 = v0;

}

BOOL __56__CNAutocompleteResultTokenMatcher_tokenizePhoneNumber___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length") != 0;
}

+ (id)normalizePhoneNumber:(id)a3 countryCode:(id)a4
{
  id v4;
  const char *v5;
  CFStringRef v6;
  const void *v7;
  void *String;

  v4 = a4;
  v5 = (const char *)PNCopyBestGuessNormalizedNumberForCountry();
  v6 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  v7 = (const void *)CFPhoneNumberCreate();

  String = (void *)CFPhoneNumberCreateString();
  if (String)
  {
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  String = (void *)CFPhoneNumberCreateString();
  if (v7)
LABEL_3:
    CFRelease(v7);
LABEL_4:
  if (v6)
    CFRelease(v6);
  return String;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
