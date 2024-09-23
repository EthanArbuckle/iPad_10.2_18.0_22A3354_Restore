@implementation NLLanguageModel

- (NLLanguageModel)initWithLocalization:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NLLanguageModel *v8;
  uint64_t v9;
  NSString *localization;
  NLLexicon *v11;
  NLLexicon *lexicon;
  objc_super v14;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v4);
  v6 = objc_alloc(MEMORY[0x1E0C99E08]);
  v7 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", v5, *MEMORY[0x1E0D434C8], 0);
  v14.receiver = self;
  v14.super_class = (Class)NLLanguageModel;
  v8 = -[NLLanguageModel init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v4, "copy");
    localization = v8->_localization;
    v8->_localization = (NSString *)v9;

    v8->_model = (void *)LMLanguageModelCreate();
    v11 = -[NLLexicon initWithLocalization:]([NLLexicon alloc], "initWithLocalization:", v4);
    lexicon = v8->_lexicon;
    v8->_lexicon = v11;

  }
  return v8;
}

+ (id)languageModelWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  __objc2_class *v10;
  NLLMLanguageModel *v11;
  NLLMLanguageModel *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  localizationForOptions(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = granularityForOptions(v5);
  stringForKey(v5, (uint64_t)CFSTR("Architecture"), CFSTR("LSTM"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = BOOLForKey(v5, (uint64_t)CFSTR("UseLMS"), 0);
  if (v7 != 1)
  {
    if (v9)
    {
      v10 = NLLMSLanguageModel;
      goto LABEL_5;
    }
    if (!v8 || !objc_msgSend(v8, "isEqual:", CFSTR("Transformer")))
    {
      v11 = -[NLLanguageModel initWithLocalization:]([NLLMLanguageModel alloc], "initWithLocalization:", v6);
      goto LABEL_6;
    }
  }
  v10 = NLNLPLanguageModel;
LABEL_5:
  v11 = (NLLMLanguageModel *)objc_msgSend([v10 alloc], "initWithLocalization:options:", v6, v5);
LABEL_6:
  v12 = v11;
  if (a4 && !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load language model for %@"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 11, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_model)
    LMLanguageModelRelease();
  v3.receiver = self;
  v3.super_class = (Class)NLLanguageModel;
  -[NLLanguageModel dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)NLLanguageModel;
  -[NLLanguageModel description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@"), v4, self->_localization);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_model)
    objc_msgSend(v5, "appendFormat:", CFSTR(":%p"), self->_model);
  objc_msgSend(v5, "appendString:", CFSTR(")"));
  return v5;
}

- (NSString)localization
{
  return self->_localization;
}

- (id)language
{
  return CFSTR("und");
}

- (id)languages
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("und");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)locale
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99DC8]);
  -[NLLanguageModel localization](self, "localization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithLocaleIdentifier:", v4);

  return v5;
}

- (int64_t)granularity
{
  return 2;
}

- (BOOL)generatesPredictions
{
  return 0;
}

- (NLLexicon)lexicon
{
  return self->_lexicon;
}

- (id)sessionWithOptions:(id)a3
{
  return 0;
}

- (id)tokenIDConverter
{
  return 0;
}

- (BOOL)getConditionalProbabilityForTokenID:(unsigned int)a3 context:(const unsigned int *)a4 length:(unint64_t)a5 probability:(double *)a6
{
  unint64_t v7;
  NLLexicon *lexicon;
  unint64_t v10;

  v10 = 0xC03E000000000000;
  if (self->_model)
  {
    LMLanguageModelConditionalProbability();
    v10 = v7;
    LODWORD(lexicon) = 1;
    if (!a6)
      return (char)lexicon;
  }
  else
  {
    lexicon = self->_lexicon;
    if (!lexicon)
      return (char)lexicon;
    LODWORD(lexicon) = -[NLLexicon getProbabilityForTokenID:probability:](lexicon, "getProbabilityForTokenID:probability:", *(_QWORD *)&a3, &v10, a5);
    if (!a6)
      return (char)lexicon;
  }
  if ((_DWORD)lexicon)
  {
    *(_QWORD *)a6 = v10;
    LOBYTE(lexicon) = 1;
  }
  return (char)lexicon;
}

- (double)conditionalProbabilityForEntry:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  double v12;

  v12 = -30.0;
  v6 = a4;
  v7 = a3;
  v8 = tokensForEntrySequence(v6);
  v9 = objc_msgSend(v7, "tokenID");

  v10 = objc_msgSend(v6, "count");
  -[NLLanguageModel getConditionalProbabilityForTokenID:context:length:probability:](self, "getConditionalProbabilityForTokenID:context:length:probability:", v9, v8, v10, &v12);
  if (v8)
    free(v8);
  return v12;
}

- (double)conditionalProbabilityForWord:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  NLTokenizer *tokenizer;
  NLTokenizer *v9;
  NLTokenizer *v10;
  void *v11;
  double v12;
  double v13;

  v6 = a4;
  -[NLLexicon entryForString:](self->_lexicon, "entryForString:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  tokenizer = self->_tokenizer;
  if (!tokenizer)
  {
    v9 = -[NLTokenizer initWithUnit:]([NLTokenizer alloc], "initWithUnit:", 0);
    v10 = self->_tokenizer;
    self->_tokenizer = v9;

    tokenizer = self->_tokenizer;
  }
  entrySequenceForStringWithOptionalBOS(v6, self->_lexicon, tokenizer, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NLLanguageModel conditionalProbabilityForEntry:context:](self, "conditionalProbabilityForEntry:context:", v7, v11);
    v13 = v12;
  }
  else
  {
    v13 = -30.0;
  }

  return v13;
}

- (void)enumeratePredictionsForContext:(id)a3 maxEntriesPerPrediction:(unint64_t)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  _DWORD *v9;
  id v10;

  v7 = a3;
  v8 = a5;
  if (self->_model && self->_lexicon)
  {
    v9 = tokensForEntrySequence(v7);
    objc_msgSend(v7, "count");
    v10 = v8;
    LMLanguageModelEnumeratePredictionsWithBlock();
    if (v9)
      free(v9);

  }
}

void __85__NLLanguageModel_enumeratePredictionsForContext_maxEntriesPerPrediction_usingBlock___block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3, double a4)
{
  void *i;
  unsigned int v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
  {
    v9 = *a2++;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "entryForTokenID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v10);

  }
  (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(a4);

}

- (void)enumeratePredictionsForContext:(id)a3 maxWordsPerPrediction:(unint64_t)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  NLLexicon *lexicon;
  NLTokenizer *tokenizer;
  NLTokenizer *v11;
  NLTokenizer *v12;
  void *v13;
  _DWORD *v14;
  id v15;

  v7 = a3;
  v8 = a5;
  if (self->_model)
  {
    lexicon = self->_lexicon;
    if (lexicon)
    {
      tokenizer = self->_tokenizer;
      if (!tokenizer)
      {
        v11 = -[NLTokenizer initWithUnit:]([NLTokenizer alloc], "initWithUnit:", 0);
        v12 = self->_tokenizer;
        self->_tokenizer = v11;

        lexicon = self->_lexicon;
        tokenizer = self->_tokenizer;
      }
      entrySequenceForStringWithOptionalBOS(v7, lexicon, tokenizer, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = tokensForEntrySequence(v13);
      objc_msgSend(v13, "count");
      v15 = v8;
      LMLanguageModelEnumeratePredictionsWithBlock();
      if (v14)
        free(v14);

    }
  }

}

void __83__NLLanguageModel_enumeratePredictionsForContext_maxWordsPerPrediction_usingBlock___block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3, double a4)
{
  void *i;
  unsigned int v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
  {
    v9 = *a2++;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "entryForTokenID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (objc_msgSend(i, "length"))
        objc_msgSend(i, "appendString:", CFSTR(" "));
      objc_msgSend(i, "appendString:", v11);
    }

  }
  if (objc_msgSend(i, "length"))
    (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(a4);

}

- (unsigned)tokenIDForString:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  unsigned int TokenIDForUTF8String;

  v4 = a3;
  v5 = v4;
  if (self->_model && (v6 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String")) != 0)
  {
    strlen(v6);
    TokenIDForUTF8String = LMLanguageModelGetTokenIDForUTF8String();
  }
  else
  {
    TokenIDForUTF8String = 0;
  }

  return TokenIDForUTF8String;
}

- (id)stringForTokenID:(unsigned int)a3
{
  void *model;

  model = self->_model;
  if (model)
  {
    model = (void *)LMLanguageModelCreateStringForTokenID();
    if (!model)
      model = 0;
  }
  return model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_lexicon, 0);
  objc_storeStrong((id *)&self->_localization, 0);
}

@end
