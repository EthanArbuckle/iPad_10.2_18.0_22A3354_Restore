@implementation NLTokenIDBasedLanguageModelState

- (id)contextTokenIDArrayForContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLLanguageModelState session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tokenIDConverter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v5, "length");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__NLTokenIDBasedLanguageModelState_contextTokenIDArrayForContext___block_invoke;
  v13[3] = &unk_1E4A3B040;
  v11 = v6;
  v14 = v11;
  objc_msgSend(v9, "enumerateTokenIDsForString:range:withBlock:", v5, 0, v10, v13);

  return v11;
}

void __66__NLTokenIDBasedLanguageModelState_contextTokenIDArrayForContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (NLTokenIDBasedLanguageModelState)initWithSession:(id)a3 options:(id)a4 context:(id)a5 contextTokenIDArray:(id)a6
{
  id v10;
  NLTokenIDBasedLanguageModelState *v11;
  uint64_t v12;
  NSMutableArray *contextTokenIDArray;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)NLTokenIDBasedLanguageModelState;
  v11 = -[NLLanguageModelState initWithSession:options:context:](&v15, sel_initWithSession_options_context_, a3, a4, a5);
  if (v11)
  {
    v12 = objc_msgSend(v10, "mutableCopy");
    contextTokenIDArray = v11->_contextTokenIDArray;
    v11->_contextTokenIDArray = (NSMutableArray *)v12;

  }
  return v11;
}

- (NLTokenIDBasedLanguageModelState)initWithSession:(id)a3 options:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NLTokenIDBasedLanguageModelState *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NLTokenIDBasedLanguageModelState contextTokenIDArrayForContext:](self, "contextTokenIDArrayForContext:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NLTokenIDBasedLanguageModelState initWithSession:options:context:contextTokenIDArray:](self, "initWithSession:options:context:contextTokenIDArray:", v10, v9, v8, v11);

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[NLLanguageModelState session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLLanguageModelState options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLLanguageModelState context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithSession:options:context:contextTokenIDArray:", v5, v6, v7, self->_contextTokenIDArray);

  return v8;
}

- (void)addContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[NLTokenIDBasedLanguageModelState contextTokenIDArrayForContext:](self, "contextTokenIDArrayForContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)NLTokenIDBasedLanguageModelState;
  -[NLLanguageModelState addContext:](&v6, sel_addContext_, v4);

  -[NSMutableArray addObjectsFromArray:](self->_contextTokenIDArray, "addObjectsFromArray:", v5);
}

- (void)resetContext
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NLTokenIDBasedLanguageModelState;
  -[NLLanguageModelState resetContext](&v3, sel_resetContext);
  -[NSMutableArray removeAllObjects](self->_contextTokenIDArray, "removeAllObjects");
}

- (void)addContextTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *contextTokenIDArray;
  unsigned int v16;
  void *v17;
  objc_super v18;
  objc_super v19;

  -[NLLanguageModelState session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tokenIDConverter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringForTokenIDs:length:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLLanguageModelState context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rangeOfCharacterFromSet:", v12);
    v14 = v13;

    if (v14)
    {
      v19.receiver = self;
      v19.super_class = (Class)NLTokenIDBasedLanguageModelState;
      -[NLLanguageModelState addContext:](&v19, sel_addContext_, CFSTR(" "));
    }
  }
  else
  {

  }
  v18.receiver = self;
  v18.super_class = (Class)NLTokenIDBasedLanguageModelState;
  -[NLLanguageModelState addContext:](&v18, sel_addContext_, v10);
  for (; a4; --a4)
  {
    contextTokenIDArray = self->_contextTokenIDArray;
    v16 = *a3++;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](contextTokenIDArray, "addObject:", v17);

  }
}

- (id)conditionalProbabilityForToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[NLLanguageModelState session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tokenIDConverter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "tokenIDForString:", v4);
  -[NLTokenIDBasedLanguageModelState conditionalProbabilityForTokenID:](self, "conditionalProbabilityForTokenID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)contextLength
{
  return -[NSMutableArray count](self->_contextTokenIDArray, "count") + 1;
}

- (unsigned)contextTokenIDs
{
  unint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  v3 = -[NLTokenIDBasedLanguageModelState contextLength](self, "contextLength");
  v4 = (unsigned int *)malloc_type_malloc(4 * v3, 0x100004052888210uLL);
  *v4 = 1;
  if (v3 >= 2)
  {
    v5 = 0;
    v6 = v3 - 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_contextTokenIDArray, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4[v5 + 1] = objc_msgSend(v7, "unsignedIntegerValue");

      ++v5;
    }
    while (v6 != v5);
  }
  return v4;
}

- (id)conditionalProbabilityForTokenID:(unsigned int)a3
{
  uint64_t v3;
  unsigned int *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  v5 = -[NLTokenIDBasedLanguageModelState contextTokenIDs](self, "contextTokenIDs");
  -[NLLanguageModelState session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conditionalProbabilityForTokenID:contextTokenIDs:length:", v3, v5, -[NLTokenIDBasedLanguageModelState contextLength](self, "contextLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    free(v5);
  return v7;
}

- (id)conditionalProbabilitiesForTokenIDs:(const unsigned int *)a3 count:(unint64_t)a4
{
  unsigned int *v7;
  void *v8;
  void *v9;

  v7 = -[NLTokenIDBasedLanguageModelState contextTokenIDs](self, "contextTokenIDs");
  -[NLLanguageModelState session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "conditionalProbabilitiesForTokenIDs:count:contextTokenIDs:length:", a3, a4, v7, -[NLTokenIDBasedLanguageModelState contextLength](self, "contextLength"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    free(v7);
  return v9;
}

- (void)enumeratePredictions:(unint64_t)a3 maximumTokensPerPrediction:(unint64_t)a4 withBlock:(id)a5
{
  id v8;
  unsigned int *v9;
  void *v10;

  v8 = a5;
  v9 = -[NLTokenIDBasedLanguageModelState contextTokenIDs](self, "contextTokenIDs");
  -[NLLanguageModelState session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enumeratePredictionsForContextTokenIDs:length:maximumPredictions:maximumTokensPerPrediction:withBlock:", v9, -[NLTokenIDBasedLanguageModelState contextLength](self, "contextLength"), a3, a4, v8);

  if (v9)
    free(v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextTokenIDArray, 0);
}

@end
