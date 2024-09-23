@implementation CNAutocompleteInputStringTokenizer

+ (id)tokensFromString:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "tokensFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNAutocompleteInputStringTokenizer)init
{
  void *v3;
  CNAutocompleteInputStringTokenizer *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNAutocompleteInputStringTokenizer initWithLocale:](self, "initWithLocale:", v3);

  return v4;
}

- (CNAutocompleteInputStringTokenizer)initWithLocale:(id)a3
{
  id v3;
  CNAutocompleteInputStringTokenizer *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNAutocompleteInputStringTokenizer;
  v3 = a3;
  v4 = -[CNAutocompleteInputStringTokenizer init](&v7, sel_init);
  objc_msgSend((id)objc_opt_class(), "lazyNameStringTokenizerWithLocale:", v3, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteInputStringTokenizer setNameStringTokenizer:](v4, "setNameStringTokenizer:", v5);
  return v4;
}

+ (id)lazyNameStringTokenizerWithLocale:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D13A68];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__CNAutocompleteInputStringTokenizer_lazyNameStringTokenizerWithLocale___block_invoke;
  v8[3] = &unk_1E70DF3E0;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "lazyFutureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addFailureBlock:", &__block_literal_global_11);

  return v6;
}

id __72__CNAutocompleteInputStringTokenizer_lazyNameStringTokenizerWithLocale___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D13AE0]), "initWithLocale:", *(_QWORD *)(a1 + 32));
}

void __72__CNAutocompleteInputStringTokenizer_lazyNameStringTokenizerWithLocale___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Could not create name tokenizer: %@"), a2);
}

- (id)tokensFromString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_filter:", &__block_literal_global_8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteInputStringTokenizer expandCJKNames](self, "expandCJKNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_flatMap:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)expandCJKNames
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__CNAutocompleteInputStringTokenizer_expandCJKNames__block_invoke;
  aBlock[3] = &unk_1E70DF1E8;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

id __52__CNAutocompleteInputStringTokenizer_expandCJKNames__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (CNStringContainsChineseJapaneseKoreanCharacters())
  {
    objc_msgSend(*(id *)(a1 + 32), "nameStringTokenizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "result:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "tokenizeNameString:inferredNameOrder:", v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
}

- (CNFuture)nameStringTokenizer
{
  return (CNFuture *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNameStringTokenizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameStringTokenizer, 0);
}

@end
