@implementation NLLanguageModelState

- (NLLanguageModelState)initWithSession:(id)a3 options:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  NLLanguageModelState *v12;
  NLLanguageModelState *v13;
  uint64_t v14;
  NSMutableString *context;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NLLanguageModelState;
  v12 = -[NLLanguageModelState init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_session, a3);
    objc_storeStrong((id *)&v13->_options, a4);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v11);
    context = v13->_context;
    v13->_context = (NSMutableString *)v14;

  }
  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)NLLanguageModelState;
  -[NLLanguageModelState description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLLanguageModelState session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLLanguageModelState context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)<%@>"), v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  v8 = (void *)objc_msgSend(v4, "initWithSession:options:context:", v5, v6, v7);

  return v8;
}

- (void)addContext:(id)a3
{
  -[NSMutableString appendString:](self->_context, "appendString:", a3);
}

- (void)resetContext
{
  -[NSMutableString deleteCharactersInRange:](self->_context, "deleteCharactersInRange:", 0, -[NSMutableString length](self->_context, "length"));
}

- (id)options
{
  return self->_options;
}

- (NSString)context
{
  return (NSString *)self->_context;
}

- (id)conditionalProbabilityForToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NLLanguageModelState session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLLanguageModelState context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conditionalProbabilityForToken:context:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)conditionalProbabilitiesForTokens:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[NLLanguageModelState conditionalProbabilityForToken:](self, "conditionalProbabilityForToken:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)conditionalProbabilityForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NLLanguageModelState session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLLanguageModelState context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conditionalProbabilityForString:context:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)conditionalProbabilitiesForStrings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[NLLanguageModelState conditionalProbabilityForString:](self, "conditionalProbabilityForString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)enumeratePredictions:(unint64_t)a3 maximumTokensPerPrediction:(unint64_t)a4 withBlock:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  -[NLLanguageModelState session](self, "session");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NLLanguageModelState context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enumeratePredictionsForContext:maximumPredictions:maximumTokensPerPrediction:withBlock:", v9, a3, a4, v8);

}

- (NLLanguageModelSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
