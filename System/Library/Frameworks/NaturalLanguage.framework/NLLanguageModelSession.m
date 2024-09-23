@implementation NLLanguageModelSession

- (NLLanguageModelSession)initWithLanguageModel:(id)a3 options:(id)a4
{
  id v6;
  NLLanguageModelSession *v7;
  NLLanguageModelSession *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLLanguageModelSession;
  v7 = -[NLLanguageModelSession init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_languageModel, a3);

  return v8;
}

- (id)conditionalProbabilityForToken:(id)a3 context:(id)a4
{
  return -[NLProbabilityInfo initWithInvalidProbability]([NLProbabilityInfo alloc], "initWithInvalidProbability");
}

- (id)conditionalProbabilitiesForTokens:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[NLLanguageModelSession conditionalProbabilityForToken:context:](self, "conditionalProbabilityForToken:context:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)conditionalProbabilityForString:(id)a3 context:(id)a4
{
  return -[NLProbabilityInfo initWithInvalidProbability]([NLProbabilityInfo alloc], "initWithInvalidProbability");
}

- (id)conditionalProbabilitiesForStrings:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[NLLanguageModelSession conditionalProbabilityForString:context:](self, "conditionalProbabilityForString:context:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (int64_t)blocklistStatusForString:(id)a3 matchType:(int64_t)a4
{
  return 0;
}

- (id)stateWithOptions:(id)a3
{
  id v4;
  NLLanguageModelState *v5;

  v4 = a3;
  v5 = -[NLLanguageModelState initWithSession:options:context:]([NLLanguageModelState alloc], "initWithSession:options:context:", self, v4, &stru_1E4A3BA10);

  return v5;
}

+ (void)setLogLevel:(int64_t)a3
{
  LMLanguageModelSetLogLevel();
}

- (NLLanguageModel)languageModel
{
  return self->_languageModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageModel, 0);
}

@end
