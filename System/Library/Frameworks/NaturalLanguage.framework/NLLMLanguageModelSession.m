@implementation NLLMLanguageModelSession

- (NLLMLanguageModelSession)initWithLanguageModel:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  void *v16;
  void *v17;
  NLLMLanguageModelSession *v18;
  NLTokenizer *v19;
  NLTokenizer *tokenizer;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99DC8]);
  objc_msgSend(v6, "localization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithLocaleIdentifier:", v9);

  v11 = objc_alloc(MEMORY[0x1E0C99E08]);
  v12 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v10, *MEMORY[0x1E0D434C8], 0);
  objc_msgSend(v7, "objectForKey:", CFSTR("AppContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = BOOLForKey(v7, (uint64_t)CFSTR("AdaptationEnabled"), 1);
  v15 = BOOLForKey(v7, (uint64_t)CFSTR("IsSiriModel"), 0);
  if (v13)
    objc_msgSend(v12, "setObject:forKey:", v13, *MEMORY[0x1E0D43460]);
  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v16, *MEMORY[0x1E0D43450]);

  }
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v17, *MEMORY[0x1E0D434C0]);

  }
  v22.receiver = self;
  v22.super_class = (Class)NLLMLanguageModelSession;
  v18 = -[NLLanguageModelSession initWithLanguageModel:options:](&v22, sel_initWithLanguageModel_options_, v6, v7);
  if (v18)
  {
    v18->_model = (void *)LMLanguageModelCreate();
    v19 = -[NLTokenizer initWithUnit:]([NLTokenizer alloc], "initWithUnit:", 0);
    tokenizer = v18->_tokenizer;
    v18->_tokenizer = v19;

  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_model)
    LMLanguageModelRelease();
  v3.receiver = self;
  v3.super_class = (Class)NLLMLanguageModelSession;
  -[NLLMLanguageModelSession dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9.receiver = self;
  v9.super_class = (Class)NLLMLanguageModelSession;
  -[NLLMLanguageModelSession description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLLanguageModelSession languageModel](self, "languageModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_model)
    objc_msgSend(v7, "appendFormat:", CFSTR(":%p"), self->_model);
  objc_msgSend(v7, "appendString:", CFSTR(")"));
  return v7;
}

- (id)conditionalProbabilityForToken:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _DWORD *v12;
  void *v13;
  BOOL v14;
  NLProbabilityInfo *v17;

  v6 = a4;
  v7 = a3;
  -[NLLanguageModelSession languageModel](self, "languageModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lexicon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "entryForString:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  entrySequenceForStringWithOptionalBOS(v6, v9, self->_tokenizer, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = tokensForEntrySequence(v11);
  v13 = v12;
  if (v11)
    v14 = self->_model == 0;
  else
    v14 = 1;
  if (!v14 && v10 != 0 && v12 != 0)
  {
    -[NLLMLanguageModelSession conditionalProbabilityForTokenID:contextTokenIDs:length:](self, "conditionalProbabilityForTokenID:contextTokenIDs:length:", objc_msgSend(v10, "tokenID"), v12, objc_msgSend(v11, "count"));
    v17 = (NLProbabilityInfo *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    free(v13);
    goto LABEL_14;
  }
  v17 = -[NLProbabilityInfo initWithInvalidProbability]([NLProbabilityInfo alloc], "initWithInvalidProbability");
  if (v13)
    goto LABEL_13;
LABEL_14:

  return v17;
}

- (id)conditionalProbabilityForString:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  unint64_t v14;
  void *v15;
  unsigned int *v16;
  unsigned int *v17;
  _BOOL4 v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  double v24;
  void *v25;
  double v26;
  NLProbabilityInfo *v27;
  NLProbabilityInfo *v29;
  id v30;
  void *v31;

  v6 = a3;
  v7 = a4;
  -[NLLanguageModelSession languageModel](self, "languageModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lexicon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  entrySequenceForStringWithOptionalBOS(v7, v9, self->_tokenizer, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  entrySequenceForStringWithOptionalBOS(v6, v9, self->_tokenizer, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  v14 = 0x1E4A39000uLL;
  if (v13 || !objc_msgSend(v11, "count"))
  {
    v15 = 0;
    v17 = 0;
    v18 = 0;
  }
  else
  {
    objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = tokensForEntrySequence(v15);
    v17 = v16;
    v18 = v16 != 0;
    if (self->_model)
      v19 = v16 == 0;
    else
      v19 = 1;
    if (!v19)
    {
      v31 = v15;
      v20 = objc_msgSend(v10, "count");
      v21 = objc_msgSend(v12, "count");
      v30 = v6;
      if (v21)
      {
        v22 = v21;
        v23 = 0;
        v24 = 0.0;
        while (1)
        {
          -[NLLMLanguageModelSession conditionalProbabilityForTokenID:contextTokenIDs:length:](self, "conditionalProbabilityForTokenID:contextTokenIDs:length:", v17[v20 + v23], v17, v20 + v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v25, "isValid"))
            break;
          objc_msgSend(v25, "log10Probability");
          v24 = v24 + v26;

          if (++v23 >= v22)
            goto LABEL_20;
        }

        v18 = 1;
        v6 = v30;
        v15 = v31;
        v14 = 0x1E4A39000;
      }
      else
      {
        v24 = 0.0;
LABEL_20:
        v14 = 0x1E4A39000uLL;
        v29 = -[NLProbabilityInfo initWithLog10Probability:flags:]([NLProbabilityInfo alloc], "initWithLog10Probability:flags:", 0, v24);
        v15 = v31;
        if (v29)
        {
          v27 = v29;
          v6 = v30;
          goto LABEL_17;
        }
        v18 = 1;
        v6 = v30;
      }
    }
  }
  v27 = (NLProbabilityInfo *)objc_msgSend(objc_alloc(*(Class *)(v14 + 1784)), "initWithInvalidProbability");
  if (v18)
LABEL_17:
    free(v17);

  return v27;
}

- (void)enumeratePredictionsForContext:(id)a3 maximumPredictions:(unint64_t)a4 maximumTokensPerPrediction:(unint64_t)a5 withBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  _DWORD *v14;
  id v15;

  v10 = a6;
  v11 = a3;
  -[NLLanguageModelSession languageModel](self, "languageModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lexicon");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  entrySequenceForStringWithOptionalBOS(v11, v15, self->_tokenizer, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = tokensForEntrySequence(v13);
  -[NLLMLanguageModelSession enumeratePredictionsForContextTokenIDs:length:maximumPredictions:maximumTokensPerPrediction:withBlock:](self, "enumeratePredictionsForContextTokenIDs:length:maximumPredictions:maximumTokensPerPrediction:withBlock:", v14, objc_msgSend(v13, "count"), a4, a5, v10);

  if (v14)
    free(v14);

}

- (int64_t)blocklistStatusForString:(id)a3 matchType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _DWORD *v10;
  int64_t v11;

  v6 = a3;
  -[NLLanguageModelSession languageModel](self, "languageModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lexicon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  entrySequenceForStringWithOptionalBOS(v6, v8, self->_tokenizer, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = tokensForEntrySequence(v9);
  v11 = -[NLLMLanguageModelSession blocklistStatusForTokenIDs:length:matchType:](self, "blocklistStatusForTokenIDs:length:matchType:", v10, objc_msgSend(v9, "count"), a4);
  if (v10)
    free(v10);

  return v11;
}

- (void)adaptToToken:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _DWORD *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[NLLanguageModelSession languageModel](self, "languageModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lexicon");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "entryForString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  entrySequenceForStringWithOptionalBOS(v6, v12, self->_tokenizer, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = tokensForEntrySequence(v10);
  if (v9)
    -[NLLMLanguageModelSession adaptToTokenID:contextTokenIDs:length:](self, "adaptToTokenID:contextTokenIDs:length:", objc_msgSend(v9, "tokenID"), v11, objc_msgSend(v10, "count"));
  if (v11)
    free(v11);

}

- (void)unadaptToToken:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _DWORD *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[NLLanguageModelSession languageModel](self, "languageModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lexicon");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "entryForString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  entrySequenceForStringWithOptionalBOS(v6, v12, self->_tokenizer, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = tokensForEntrySequence(v10);
  if (v9)
    -[NLLMLanguageModelSession unadaptToTokenID:contextTokenIDs:length:](self, "unadaptToTokenID:contextTokenIDs:length:", objc_msgSend(v9, "tokenID"), v11, objc_msgSend(v10, "count"));
  if (v11)
    free(v11);

}

- (id)conditionalProbabilityForTokenID:(unsigned int)a3 contextTokenIDs:(const unsigned int *)a4 length:(unint64_t)a5
{
  double v5;
  NLProbabilityInfo *v6;

  if (self->_model)
  {
    LMLanguageModelConditionalProbability();
    v6 = -[NLProbabilityInfo initWithLog10Probability:flags:]([NLProbabilityInfo alloc], "initWithLog10Probability:flags:", 0, v5);
  }
  else
  {
    v6 = -[NLProbabilityInfo initWithInvalidProbability]([NLProbabilityInfo alloc], "initWithInvalidProbability");
  }
  return v6;
}

- (void)enumeratePredictionsForContextTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4 maximumPredictions:(unint64_t)a5 maximumTokensPerPrediction:(unint64_t)a6 withBlock:(id)a7
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];

  v8 = a7;
  -[NLLanguageModelSession languageModel](self, "languageModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lexicon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v11 = v10;
  v12 = v8;
  LMLanguageModelEnumeratePredictionsWithBlock();

  _Block_object_dispose(v13, 8);
}

void __130__NLLMLanguageModelSession_enumeratePredictionsForContextTokenIDs_length_maximumPredictions_maximumTokensPerPrediction_withBlock___block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, _BYTE *a5, double a6)
{
  void *v11;
  unsigned int *v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;
  NLProbabilityInfo *v17;
  NLPredictionInfo *v18;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v12 = a2;
    v13 = a3;
    do
    {
      v14 = *v12++;
      objc_msgSend(*(id *)(a1 + 32), "entryForTokenID:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "string");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (objc_msgSend(v11, "length"))
          objc_msgSend(v11, "appendString:", CFSTR(" "));
        objc_msgSend(v11, "appendString:", v16);
      }

      --v13;
    }
    while (v13);
  }
  if (objc_msgSend(v11, "length"))
  {
    v17 = -[NLProbabilityInfo initWithLog10Probability:flags:]([NLProbabilityInfo alloc], "initWithLog10Probability:flags:", 0, a6);
    v18 = -[NLPredictionInfo initWithPrediction:tokenIDs:length:contextLength:probabilityInfo:]([NLPredictionInfo alloc], "initWithPrediction:tokenIDs:length:contextLength:probabilityInfo:", v11, a2, a3, a4, v17);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 56))
    *a5 = 1;

}

- (int64_t)blocklistStatusForTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4 matchType:(int64_t)a5
{
  int64_t result;

  result = (int64_t)self->_model;
  if (result)
    return LMLanguageModelTokenSequenceIsBlocklisted();
  return result;
}

- (void)adaptToTokenID:(unsigned int)a3 contextTokenIDs:(const unsigned int *)a4 length:(unint64_t)a5
{
  if (self->_model)
    LMLanguageModelIncrementUsageCount();
}

- (void)unadaptToTokenID:(unsigned int)a3 contextTokenIDs:(const unsigned int *)a4 length:(unint64_t)a5
{
  if (self->_model)
    LMLanguageModelDecrementUsageCount();
}

- (BOOL)addTokenForString:(id)a3 tokenID:(unsigned int *)a4
{
  void *model;

  model = self->_model;
  if (model)
    LOBYTE(model) = LMLanguageModelAddTokenForString();
  return (char)model;
}

- (BOOL)getFirstDynamicTokenID:(unsigned int *)a3 lastDynamicTokenID:(unsigned int *)a4
{
  void *model;

  model = self->_model;
  if (model)
    LOBYTE(model) = LMLanguageModelGetDynamicTokenIDRange();
  return (char)model;
}

- (void)recordWithDifferentialPrivacy:(id)a3
{
  if (self->_model)
    LMLanguageModelRecordTokenUsageWithDifferentialPrivacy();
}

- (void)reset
{
  if (self->_model)
    LMLanguageModelReset();
}

- (void)flushDynamicData
{
  if (self->_model)
    LMLanguageModelFlushDynamicData();
}

- (void)applyExponentialDecay
{
  if (self->_model)
    LMLanguageModelApplyExponentialDecay();
}

- (void)pruneToSize:(unint64_t)a3
{
  if (self->_model)
    LMLanguageModelPrune();
}

- (BOOL)shouldAdaptToTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4
{
  void *model;

  model = self->_model;
  if (model)
    LOBYTE(model) = LMLanguageModelShouldAdaptToTokenSequence();
  return (char)model;
}

- (float)usageCountForTokenID:(unsigned int)a3
{
  float result;

  result = 0.0;
  if (a3)
  {
    if (self->_model)
      LMLanguageModelGetUsageCount();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);
}

@end
