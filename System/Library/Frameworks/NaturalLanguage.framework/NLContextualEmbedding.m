@implementation NLContextualEmbedding

+ (id)contextualEmbeddingCatalog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NLContextualEmbedding_contextualEmbeddingCatalog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (contextualEmbeddingCatalog_onceToken != -1)
    dispatch_once(&contextualEmbeddingCatalog_onceToken, block);
  return (id)contextualEmbeddingCatalog_contextualEmbeddingCatalog;
}

void __51__NLContextualEmbedding_contextualEmbeddingCatalog__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("ContextualEmbeddingCatalog"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1
    && (objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v1), (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)v2;
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v2, 0, 0, &v22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v22;
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v16 = v5;
      v17 = v3;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_msgSend(v7, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v6, "setObject:forKey:", v13, v12);
            }

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v9);
      }

      v14 = objc_msgSend(v6, "copy");
      v15 = (void *)contextualEmbeddingCatalog_contextualEmbeddingCatalog;
      contextualEmbeddingCatalog_contextualEmbeddingCatalog = v14;

      v3 = v17;
      v5 = v16;
    }
    else if (v5)
    {
      NSLog(CFSTR("NLContextualEmbedding failed to read catalog, %@"), v5);
    }
    else
    {
      NSLog(CFSTR("NLContextualEmbedding failed to read catalog"));
    }

  }
  else
  {
    NSLog(CFSTR("NLContextualEmbedding failed to read catalog"));
  }

}

+ (id)contextualEmbeddingConfigurationCatalog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__NLContextualEmbedding_contextualEmbeddingConfigurationCatalog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (contextualEmbeddingConfigurationCatalog_onceToken != -1)
    dispatch_once(&contextualEmbeddingConfigurationCatalog_onceToken, block);
  return (id)contextualEmbeddingConfigurationCatalog_contextualEmbeddingConfigurationCatalog;
}

void __64__NLContextualEmbedding_contextualEmbeddingConfigurationCatalog__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("ContextualEmbeddingConfigurationCatalog"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1
    && (objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v1), (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)v2;
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v2, 0, 0, &v22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v22;
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v16 = v5;
      v17 = v3;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_msgSend(v7, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v6, "setObject:forKey:", v13, v12);
            }

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v9);
      }

      v14 = objc_msgSend(v6, "copy");
      v15 = (void *)contextualEmbeddingConfigurationCatalog_contextualEmbeddingConfigurationCatalog;
      contextualEmbeddingConfigurationCatalog_contextualEmbeddingConfigurationCatalog = v14;

      v3 = v17;
      v5 = v16;
    }
    else if (v5)
    {
      NSLog(CFSTR("NLContextualEmbedding failed to read configuration catalog, %@"), v5);
    }
    else
    {
      NSLog(CFSTR("NLContextualEmbedding failed to read configuration catalog"));
    }

  }
  else
  {
    NSLog(CFSTR("NLContextualEmbedding failed to read configuration catalog"));
  }

}

- (NLContextualEmbedding)initWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NLContextualEmbedding *v8;
  void *v9;
  void *v10;
  BOOL *p_isE5Enabled;
  NLContextualEmbedding *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *modelIdentifier;
  NSString *adapterIdentifier;
  NLTagger *v20;
  void *v21;
  uint64_t v22;
  NLTagger *tagger;
  uint64_t v24;
  NSDictionary *catalogEntry;
  NLE5Embedding *embeddingE5;
  NLSentenceEmbeddingHead *sentenceEmbeddingHead;
  objc_super v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ModelIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "contextualEmbeddingCatalog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v29.receiver = self;
    v29.super_class = (Class)NLContextualEmbedding;
    v8 = -[NLContextualEmbedding init](&v29, sel_init);
    if (v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EnableE5"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EnableE5"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8->_isE5Enabled = objc_msgSend(v10, "BOOLValue");
        p_isE5Enabled = &v8->_isE5Enabled;

      }
      else
      {
        v8->_isE5Enabled = 1;
        p_isE5Enabled = &v8->_isE5Enabled;
      }

      if (*p_isE5Enabled)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UseANE"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UseANE"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v8->_useANE = objc_msgSend(v14, "BOOLValue");

        }
        else
        {
          v8->_useANE = 0;
        }

      }
      else
      {
        v8->_useANE = 0;
      }
      v15 = objc_msgSend(v5, "copy");
      identifier = v8->_identifier;
      v8->_identifier = (NSString *)v15;

      v17 = objc_msgSend(v5, "copy");
      modelIdentifier = v8->_modelIdentifier;
      v8->_modelIdentifier = (NSString *)v17;

      adapterIdentifier = v8->_adapterIdentifier;
      v8->_adapterIdentifier = 0;

      v20 = [NLTagger alloc];
      v30[0] = CFSTR("TokenType");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[NLTagger initWithTagSchemes:](v20, "initWithTagSchemes:", v21);
      tagger = v8->_tagger;
      v8->_tagger = (NLTagger *)v22;

      v24 = objc_msgSend(v7, "copy");
      catalogEntry = v8->_catalogEntry;
      v8->_catalogEntry = (NSDictionary *)v24;

      embeddingE5 = v8->_embeddingE5;
      v8->_embeddingE5 = 0;

      sentenceEmbeddingHead = v8->_sentenceEmbeddingHead;
      v8->_embedding = 0;
      v8->_sentenceEmbeddingHead = 0;

    }
    self = v8;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (NLContextualEmbedding)contextualEmbeddingWithModelIdentifier:(NSString *)modelIdentifier
{
  NSString *v3;
  NLContextualEmbedding *v4;
  void *v5;
  NLContextualEmbedding *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = modelIdentifier;
  v4 = [NLContextualEmbedding alloc];
  v8 = CFSTR("ModelIdentifier");
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NLContextualEmbedding initWithOptions:](v4, "initWithOptions:", v5);
  return v6;
}

- (NLContextualEmbedding)initWithIdentifier:(id)a3 andOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NLContextualEmbedding *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSString *adapterIdentifier;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "contextualEmbeddingConfigurationCatalog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("ModelIdentifier"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("AdapterIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v6;
    v11 = 0;
  }
  v12 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("ModelIdentifier"));
  v13 = -[NLContextualEmbedding initWithOptions:](self, "initWithOptions:", v12);
  if (v13)
  {
    v14 = objc_msgSend(v6, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    adapterIdentifier = v13->_adapterIdentifier;
    v13->_adapterIdentifier = (NSString *)v16;

  }
  return v13;
}

+ (NLContextualEmbedding)contextualEmbeddingWithIdentifier:(id)a3
{
  id v3;
  NLContextualEmbedding *v4;
  NLContextualEmbedding *v5;

  v3 = a3;
  v4 = [NLContextualEmbedding alloc];
  v5 = -[NLContextualEmbedding initWithIdentifier:andOptions:](v4, "initWithIdentifier:andOptions:", v3, MEMORY[0x1E0C9AA70]);

  return v5;
}

+ (NLContextualEmbedding)contextualEmbeddingWithIdentifier:(id)a3 andOptions:(id)a4
{
  id v5;
  id v6;
  NLContextualEmbedding *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NLContextualEmbedding initWithIdentifier:andOptions:]([NLContextualEmbedding alloc], "initWithIdentifier:andOptions:", v6, v5);

  return v7;
}

+ (NSArray)contextualEmbeddingsForValues:(NSDictionary *)valuesDictionary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSDictionary *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  BOOL v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  void *v57;
  NSDictionary *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v58 = valuesDictionary;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "contextualEmbeddingCatalog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v60;
    v52 = *(_QWORD *)v60;
    v53 = v3;
    do
    {
      v7 = 0;
      v54 = v5;
      do
      {
        if (*(_QWORD *)v60 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "objectForKey:", v8);
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = (void *)v9;
          if (!v58 || !v9)
            goto LABEL_52;
          v11 = v58;
          objc_msgSend(v10, "objectForKey:", CFSTR("Languages"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", CFSTR("Scripts"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKey:](v11, "objectForKey:", CFSTR("Languages"));
          v55 = objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKey:](v11, "objectForKey:", CFSTR("Scripts"));
          v14 = objc_claimAutoreleasedReturnValue();
          v57 = v10;
          objc_msgSend(v10, "objectForKey:", CFSTR("Revision"));
          v15 = objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKey:](v11, "objectForKey:", CFSTR("Revision"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = v12;
          if (v12)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v17 = 0;
            }
          }
          v18 = v13;
          v19 = (void *)v15;
          v20 = (void *)v14;
          if (v13)
          {
            objc_opt_class();
            v21 = (void *)v55;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v18 = 0;
            }
            if (!v55)
            {
LABEL_20:
              if (v20)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  v20 = 0;
                }
              }
              if (v19)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  v19 = 0;
                }
              }
              if (v16)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  v16 = 0;
                }
              }
              if (!objc_msgSend(v21, "count", v50) && !objc_msgSend(v20, "count"))
                goto LABEL_50;
              if (v21 && objc_msgSend(v21, "count"))
              {
                v22 = v21;
                v23 = v20;
                v24 = v16;
                v25 = v19;
                objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v22);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = objc_msgSend(v26, "isSubsetOfSet:", v27);

                v19 = v25;
                v16 = v24;
                v20 = v23;
                v21 = v22;

                if (!v20)
                {
LABEL_39:
                  v35 = 1;
                  if (v16)
                    goto LABEL_40;
LABEL_38:
                  v36 = 1;
                  goto LABEL_45;
                }
              }
              else
              {
                v56 = 1;
                if (!v20)
                  goto LABEL_39;
              }
              if (!objc_msgSend(v20, "count"))
                goto LABEL_39;
              v51 = v17;
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v20);
              v28 = v21;
              v29 = v20;
              v30 = v16;
              v31 = v19;
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v18);
              v33 = v18;
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v32, "isSubsetOfSet:", v34);

              v18 = v33;
              v17 = v51;

              v19 = v31;
              v16 = v30;
              v20 = v29;
              v21 = v28;
              if (!v16)
                goto LABEL_38;
LABEL_40:
              if (v19)
              {
                v37 = v21;
                v38 = v20;
                v39 = v16;
                v40 = v19;
                v41 = objc_msgSend(v19, "unsignedIntegerValue");
                v42 = v41 == objc_msgSend(v39, "unsignedIntegerValue");
                v19 = v40;
                v16 = v39;
                v20 = v38;
                v21 = v37;
                v36 = v42;
              }
              else
              {
                v36 = 0;
              }
LABEL_45:
              if (v56)
              {
                v43 = v16;
                v44 = v19;
                v45 = v35 & v36;

                v42 = v45 == 1;
                v3 = v53;
                v5 = v54;
                v6 = v52;
                v10 = v57;
                if (!v42)
                  goto LABEL_52;
                +[NLContextualEmbedding contextualEmbeddingWithModelIdentifier:](NLContextualEmbedding, "contextualEmbeddingWithModelIdentifier:", v8);
                v46 = objc_claimAutoreleasedReturnValue();
                if (v46)
                {
                  v47 = (void *)v46;
                  objc_msgSend(v50, "addObject:");
                }
                else
                {
                  v47 = 0;
                }
              }
              else
              {
LABEL_50:
                v47 = v17;

                v3 = v53;
                v5 = v54;
                v6 = v52;
                v10 = v57;
              }

LABEL_52:
              goto LABEL_53;
            }
          }
          else
          {
            v21 = (void *)v55;
            if (!v55)
              goto LABEL_20;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v21 = 0;
          }
          goto LABEL_20;
        }
LABEL_53:
        ++v7;
      }
      while (v5 != v7);
      v48 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      v5 = v48;
    }
    while (v48);
  }

  return (NSArray *)v50;
}

+ (NLContextualEmbedding)contextualEmbeddingWithLanguage:(NLLanguage)language
{
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NLLanguage v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v11 = language;
  v12 = CFSTR("Languages");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = language;
  objc_msgSend(v4, "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "contextualEmbeddingsWithValues:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  mostRecentEmbedding(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NLContextualEmbedding *)v9;
}

+ (id)contextualEmbeddingForLanguage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = CFSTR("Languages");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "contextualEmbeddingsWithValues:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  mostRecentEmbedding(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (NLContextualEmbedding)contextualEmbeddingWithScript:(NLScript)script
{
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NLScript v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v11 = script;
  v12 = CFSTR("Scripts");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = script;
  objc_msgSend(v4, "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "contextualEmbeddingsWithValues:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  mostRecentEmbedding(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NLContextualEmbedding *)v9;
}

+ (id)contextualEmbeddingForScript:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = CFSTR("Scripts");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "contextualEmbeddingsWithValues:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  mostRecentEmbedding(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unint64_t)systemVersionForLanguage:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  if (!v4
    || (objc_msgSend(a1, "contextualEmbeddingWithLanguage:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "modelSystemVersion"),
        v5,
        !v6))
  {
    v6 = 4;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NLContextualEmbedding;
  -[NLContextualEmbedding description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLContextualEmbedding identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NLContextualEmbedding unload](self, "unload");
  v3.receiver = self;
  v3.super_class = (Class)NLContextualEmbedding;
  -[NLContextualEmbedding dealloc](&v3, sel_dealloc);
}

- (id)bundlePath
{
  void *v3;
  id v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  -[NLContextualEmbedding assetLocale](self, "assetLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLContextualEmbedding bundleName](self, "bundleName");
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  LDEnumerateAssetDataItems();
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __35__NLContextualEmbedding_bundlePath__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  if (objc_msgSend(CFSTR("Embedding"), "isEqualToString:", a5))
  {
    objc_msgSend(a2, "path");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v10)
    {
      v11 = objc_msgSend(v14, "copy");
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    *a6 = 1;

  }
}

- (BOOL)loadWithOptions:(id)a3 error:(id *)a4
{
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 useANE;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NLE5Embedding *v40;
  NLE5Embedding *embeddingE5;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x1E0C80C00];
  if (-[NLContextualEmbedding isLoaded](self, "isLoaded", a3))
    return 1;
  if (self->_isE5Enabled && !self->_embeddingE5)
  {
    -[NLContextualEmbedding bundlePath](self, "bundlePath");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      if (a4)
      {
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v60 = *MEMORY[0x1E0CB2D50];
        v61[0] = CFSTR("Failed to locate embedding model");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v34);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      +[NLTelemetry sharedInstance](NLTelemetry, "sharedInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NLContextualEmbedding identifier](self, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NLContextualEmbedding assetLocaleIdentifier](self, "assetLocaleIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "reportEmbeddingLoadedWithIdentifier:localeIdentifier:useANE:status:", v36, v37, self->_useANE, 3);

      return 0;
    }
    v28 = (void *)v27;
    -[NSDictionary objectForKey:](self->_catalogEntry, "objectForKey:", CFSTR("Adapters"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (self->_adapterIdentifier && (objc_msgSend(v29, "containsObject:") & 1) == 0)
    {
      if (a4)
      {
        v47 = (void *)MEMORY[0x1E0CB35C8];
        v58 = *MEMORY[0x1E0CB2D50];
        v59 = CFSTR("Backbone model doesn't contain requested adapter");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v48);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      +[NLTelemetry sharedInstance](NLTelemetry, "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[NLContextualEmbedding identifier](self, "identifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[NLContextualEmbedding assetLocaleIdentifier](self, "assetLocaleIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "reportEmbeddingLoadedWithIdentifier:localeIdentifier:useANE:status:", v45, v46, self->_useANE, 2);
      v6 = 0;
      goto LABEL_39;
    }
    if (-[NLContextualEmbedding requiresCompilation](self, "requiresCompilation"))
    {
      NSLog(CFSTR("NLContextualEmbedding requires compilation, falling back to EIR"));
      self->_isE5Enabled = 0;
    }
    else
    {
      v38 = (void *)objc_opt_class();
      objc_msgSend(v28, "stringByAppendingPathComponent:", CFSTR("embeddings.mil"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "embeddingModelWithModelPath:useANE:adapters:", v39, self->_useANE, v30);
      v40 = (NLE5Embedding *)objc_claimAutoreleasedReturnValue();
      embeddingE5 = self->_embeddingE5;
      self->_embeddingE5 = v40;

      if (a4)
      {
        if (self->_embeddingE5)
        {
LABEL_35:
          +[NLTelemetry sharedInstance](NLTelemetry, "sharedInstance");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[NLContextualEmbedding identifier](self, "identifier");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NLContextualEmbedding assetLocaleIdentifier](self, "assetLocaleIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "reportEmbeddingLoadedWithIdentifier:localeIdentifier:useANE:status:", v45, v46, self->_useANE, 0);
          v6 = 1;
LABEL_39:

          return v6;
        }
        v42 = (void *)MEMORY[0x1E0CB35C8];
        v56 = *MEMORY[0x1E0CB2D50];
        v57 = CFSTR("Failed to load embedding model in MIL representation");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v43);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    if (!self->_embeddingE5)
    {
      NSLog(CFSTR("NLContextualEmbedding failed to load MIL model, falling back to EIR"));
      self->_isE5Enabled = 0;

      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_5:
  if (self->_embedding)
  {
    if (a4)
      goto LABEL_7;
    goto LABEL_9;
  }
  -[NLContextualEmbedding bundlePath](self, "bundlePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)*MEMORY[0x1E0D174A0];
  v15 = *MEMORY[0x1E0D17480];
  v16 = *MEMORY[0x1E0D17448];
  v54[0] = *MEMORY[0x1E0D17470];
  v54[1] = v16;
  v55[0] = v15;
  v55[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (!v13)
  {
    if (a4)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v52 = *MEMORY[0x1E0CB2D50];
      v53 = CFSTR("Failed to load embedding model");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v32);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    +[NLTelemetry sharedInstance](NLTelemetry, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLContextualEmbedding identifier](self, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLContextualEmbedding assetLocaleIdentifier](self, "assetLocaleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    useANE = self->_useANE;
    v23 = v19;
    v24 = v20;
    v25 = v21;
    v26 = 3;
    goto LABEL_24;
  }
  if (self->_adapterIdentifier)
  {
    NSLog(CFSTR("NLContextualEmbedding adapters are not supported in EIR"));
    +[NLTelemetry sharedInstance](NLTelemetry, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLContextualEmbedding identifier](self, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLContextualEmbedding assetLocaleIdentifier](self, "assetLocaleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    useANE = self->_useANE;
    v23 = v19;
    v24 = v20;
    v25 = v21;
    v26 = 2;
LABEL_24:
    objc_msgSend(v23, "reportEmbeddingLoadedWithIdentifier:localeIdentifier:useANE:status:", v24, v25, useANE, v26);

    return 0;
  }
  objc_msgSend(v18, "setObject:forKey:", v13, *MEMORY[0x1E0D17468]);
  self->_embedding = (void *)NLStringEmbeddingCreateWithOptions();

  if (a4)
  {
LABEL_7:
    if (!self->_embedding)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v50 = *MEMORY[0x1E0CB2D50];
      v51 = CFSTR("Failed to load embedding model");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_9:
  +[NLTelemetry sharedInstance](NLTelemetry, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLContextualEmbedding identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLContextualEmbedding assetLocaleIdentifier](self, "assetLocaleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_embedding)
    v12 = 1;
  else
    v12 = 2;
  objc_msgSend(v9, "reportEmbeddingLoadedWithIdentifier:localeIdentifier:useANE:status:", v10, v11, self->_useANE, v12);

  return self->_embedding != 0;
}

- (BOOL)loadWithError:(NSError *)error
{
  return -[NLContextualEmbedding loadWithOptions:error:](self, "loadWithOptions:error:", MEMORY[0x1E0C9AA70], error);
}

- (BOOL)load
{
  return -[NLContextualEmbedding loadWithOptions:error:](self, "loadWithOptions:error:", MEMORY[0x1E0C9AA70], 0);
}

- (BOOL)isLoaded
{
  return self->_isE5Enabled && self->_embeddingE5 || self->_embedding != 0;
}

- (void)unload
{
  NLE5Embedding *embeddingE5;
  void *embedding;

  embeddingE5 = self->_embeddingE5;
  self->_embeddingE5 = 0;

  embedding = self->_embedding;
  if (embedding)
    CFRelease(embedding);
  self->_embedding = 0;
  -[NLContextualEmbedding unloadSentenceEmbedding](self, "unloadSentenceEmbedding");
}

- (BOOL)loadSentenceEmbeddingWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NLSentenceEmbeddingHead *sentenceEmbeddingHead;
  uint64_t v8;
  void *v9;
  NLSentenceEmbeddingHead *v10;
  void *v11;
  void *v12;
  void *v13;
  NLSentenceEmbeddingHead *v14;
  NLSentenceEmbeddingHead *v15;
  void *v16;
  void *v17;
  const __CFString **v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_isE5Enabled)
  {
    if (!a4)
      goto LABEL_18;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    v32[0] = CFSTR("Failed to load sentence embedding model");
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = (const __CFString **)v32;
    v19 = &v31;
    goto LABEL_16;
  }
  -[NLContextualEmbedding load](self, "load");
  if (!-[NLE5Embedding isAdapterLoaded:](self->_embeddingE5, "isAdapterLoaded:", 0x1E4A3C270)
    && !-[NLE5Embedding loadAdapter:](self->_embeddingE5, "loadAdapter:", 0x1E4A3C270))
  {
    if (!a4)
      goto LABEL_18;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v30 = CFSTR("Failed to load adapter for sentence embedding");
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v30;
    v19 = &v29;
    goto LABEL_16;
  }
  sentenceEmbeddingHead = self->_sentenceEmbeddingHead;
  if (!sentenceEmbeddingHead)
  {
    -[NLContextualEmbedding bundlePath](self, "bundlePath");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if (!a4)
        goto LABEL_18;
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      v28 = CFSTR("Failed to locate assets for embedding model");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v24;
      v22 = 8;
      goto LABEL_17;
    }
    v9 = (void *)v8;
    v10 = [NLSentenceEmbeddingHead alloc];
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("sentence-embedding-head.mlmodelc"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NLSentenceEmbeddingHead initWithModelURL:](v10, "initWithModelURL:", v13);
    v15 = self->_sentenceEmbeddingHead;
    self->_sentenceEmbeddingHead = v14;

    sentenceEmbeddingHead = self->_sentenceEmbeddingHead;
  }
  if (!-[NLSentenceEmbeddingHead isLoaded](sentenceEmbeddingHead, "isLoaded")
    && !-[NLSentenceEmbeddingHead load](self->_sentenceEmbeddingHead, "load"))
  {
    if (!a4)
      goto LABEL_18;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("Failed to load head for sentence embedding");
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v26;
    v19 = &v25;
LABEL_16:
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v16;
    v22 = 7;
LABEL_17:
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), v22, v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
    goto LABEL_18;
  }
  LOBYTE(a4) = 1;
LABEL_18:

  return (char)a4;
}

- (BOOL)loadSentenceEmbeddingWithError:(id *)a3
{
  return -[NLContextualEmbedding loadSentenceEmbeddingWithOptions:error:](self, "loadSentenceEmbeddingWithOptions:error:", MEMORY[0x1E0C9AA70], a3);
}

- (BOOL)loadSentenceEmbedding
{
  return -[NLContextualEmbedding loadSentenceEmbeddingWithOptions:error:](self, "loadSentenceEmbeddingWithOptions:error:", MEMORY[0x1E0C9AA70], 0);
}

- (id)_taggerForString:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  NLTagger *v8;

  v6 = a3;
  v7 = a4;
  -[NLTagger setString:](self->_tagger, "setString:", v6);
  if (v7)
    -[NLTagger setLanguage:range:](self->_tagger, "setLanguage:range:", v7, 0, objc_msgSend(v6, "length"));
  v8 = self->_tagger;

  return v8;
}

- (id)_tokenRangesForString:(id)a3 language:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLContextualEmbedding _taggerForString:language:](self, "_taggerForString:language:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "length");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__NLContextualEmbedding__tokenRangesForString_language___block_invoke;
  v14[3] = &unk_1E4A3B3B0;
  v12 = v9;
  v15 = v12;
  objc_msgSend(v10, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v11, 0, CFSTR("TokenType"), 36, v14);

  return v12;
}

void __56__NLContextualEmbedding__tokenRangesForString_language___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

- (id)_tokensForString:(id)a3 tokenRanges:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "rangeValue", (_QWORD)v17);
        objc_msgSend(v5, "substringWithRange:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_concatenatedEmbeddingDataForInputEmbeddingData:(id)a3 tokenizedSentences:(id)a4 batchComponentsCountArray:(id)a5 batchComponentRangesArray:(id)a6 maxTokens:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t Dimension;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
  char *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  _DWORD *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int *v36;
  _DWORD *v37;
  _DWORD *v38;
  int *v39;
  uint64_t i;
  int v41;
  id v43;
  id v44;
  unint64_t v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  _DWORD *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (self->_isE5Enabled)
    Dimension = -[NLE5Embedding dimension](self->_embeddingE5, "dimension");
  else
    Dimension = NLStringEmbeddingGetDimension();
  v17 = Dimension;
  v18 = objc_msgSend(v13, "count");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 12 * v17 * a7 * v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_retainAutorelease(v12);
  v52 = objc_msgSend(v44, "bytes");
  v43 = objc_retainAutorelease(v19);
  v20 = (char *)objc_msgSend(v43, "mutableBytes");
  v21 = v20;
  if (3 * v17 * a7 * v18)
    bzero(v20, 12 * v18 * v17 * a7);
  if (objc_msgSend(v13, "count"))
  {
    v22 = 0;
    v53 = 0;
    v23 = 4 * v17;
    v24 = 12 * a7;
    v45 = 12 * a7 * v17;
    v46 = v15;
    v47 = v14;
    v48 = v13;
    do
    {
      if (v22 >= objc_msgSend(v14, "count") || v22 >= objc_msgSend(v15, "count"))
        break;
      v51 = v21;
      objc_msgSend(v14, "objectAtIndex:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v25, "unsignedIntegerValue");

      objc_msgSend(v13, "objectAtIndex:", v22);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v22;
      objc_msgSend(v15, "objectAtIndex:", v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (a7)
      {
        v27 = 0;
        v28 = v51;
        do
        {
          if (v27 >= objc_msgSend(v54, "count") || v27 >= objc_msgSend(v26, "count"))
            break;
          objc_msgSend(v26, "objectAtIndex:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "rangeValue");
          v31 = a7;
          v33 = v32;

          v34 = 3;
          if (v33 < 3)
            v34 = v33;
          a7 = v31;
          if (v34)
          {
            v35 = 0;
            v36 = (int *)(v52 + v23 * (v53 + v30));
            v37 = v28;
            do
            {
              v38 = v37;
              v39 = v36;
              for (i = v17; i; --i)
              {
                v41 = *v39++;
                *v38 = v41;
                v38 = (_DWORD *)((char *)v38 + v24);
              }
              ++v35;
              v36 = (int *)((char *)v36 + v23);
              ++v37;
            }
            while (v35 != v34);
          }
          ++v27;
          v28 += 3;
        }
        while (v27 != v31);
      }
      v53 += v49;

      v22 = v50 + 1;
      v13 = v48;
      v15 = v46;
      v21 = (char *)v51 + v45;
      v14 = v47;
    }
    while (v50 + 1 < objc_msgSend(v48, "count"));
  }

  return v43;
}

- (id)subRangesWithinToken:(id)a3 componentRange:(_NSRange)a4 offset:(unint64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t i;
  void *v13;
  void *v14;
  NLE5Embedding *embeddingE5;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v28;
  NSUInteger length;
  void *v30;
  _QWORD v31[2];

  length = a4.length;
  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isE5Enabled)
  {
    -[NLE5Embedding tokenIDsForText:](self->_embeddingE5, "tokenIDsForText:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = NLStringEmbeddingCopyTokenIDsForText();
  }
  v10 = (void *)v9;
  v28 = a5;
  if (subRangesWithinToken_componentRange_offset__onceToken != -1)
    dispatch_once(&subRangesWithinToken_componentRange_offset__onceToken, &__block_literal_global_5);
  v11 = 0;
  if (objc_msgSend(v10, "count"))
  {
    for (i = 0; i < objc_msgSend(v10, "count"); ++i)
    {
      objc_msgSend(v10, "objectAtIndex:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (i || (objc_msgSend(v13, "isEqual:", &unk_1E4A47C48) & 1) == 0)
      {
        if (objc_msgSend(v8, "count") >= length)
        {

          break;
        }
        if (self->_isE5Enabled)
        {
          embeddingE5 = self->_embeddingE5;
          v31[0] = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NLE5Embedding textForTokenIDs:](embeddingE5, "textForTokenIDs:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByTrimmingCharactersInSet:", subRangesWithinToken_componentRange_offset__whitespaceAndNewlineCharacterSet);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v30 = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
          v16 = (void *)NLStringEmbeddingCopyTextForTokenIDs();
          objc_msgSend(v16, "stringByTrimmingCharactersInSet:", subRangesWithinToken_componentRange_offset__whitespaceAndNewlineCharacterSet);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v19 = objc_msgSend(v18, "length");
        v20 = v19 + v11;
        if (v19 + v11 > (unint64_t)objc_msgSend(v7, "length"))
        {
          v20 = objc_msgSend(v7, "length");
          v19 = v20 - v11;
        }
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v11 + v28, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v21);

        v11 = v20;
      }

    }
  }
  v22 = objc_msgSend(v8, "count");
  v23 = length - v22;
  if (length > v22)
  {
    do
    {
      v24 = v11 + 1;
      if (v11 + 1 <= (unint64_t)objc_msgSend(v7, "length"))
      {
        v25 = 1;
      }
      else
      {
        v24 = objc_msgSend(v7, "length");
        v25 = v24 - v11;
      }
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v11 + v28, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v26);

      v11 = v24;
      --v23;
    }
    while (v23);
  }

  return v8;
}

void __68__NLContextualEmbedding_subRangesWithinToken_componentRange_offset___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)subRangesWithinToken_componentRange_offset__whitespaceAndNewlineCharacterSet;
  subRangesWithinToken_componentRange_offset__whitespaceAndNewlineCharacterSet = v0;

}

- (id)tokenDictionariesForString:(id)a3 tokens:(id)a4 tokenRanges:(id)a5 componentRanges:(id)a6 componentsCount:(unint64_t)a7
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  v34 = a4;
  v9 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[NLContextualEmbedding subRangesWithinToken:componentRange:offset:](self, "subRangesWithinToken:componentRange:offset:", &stru_1E4A3BA10, 0, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v37[0] = CFSTR("TokenRange");
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v12;
      v37[1] = CFSTR("ComponentRange");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = CFSTR("SubtokenRanges");
      v38[1] = v13;
      v38[2] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v14);

    }
  }
  if (objc_msgSend(v34, "count", self))
  {
    v15 = 0;
    do
    {
      if (v15 >= objc_msgSend(v9, "count"))
        break;
      if (v15 >= objc_msgSend(v10, "count"))
        break;
      objc_msgSend(v34, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "rangeValue");
      v20 = v19;

      objc_msgSend(v10, "objectAtIndex:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v9;
      v23 = objc_msgSend(v21, "rangeValue");
      v25 = v24;

      objc_msgSend(v32, "subRangesWithinToken:componentRange:offset:", v16, v23, v25, v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = CFSTR("TokenRange");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v18, v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v27;
      v35[1] = CFSTR("ComponentRange");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v23, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = CFSTR("SubtokenRanges");
      v36[1] = v28;
      v36[2] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v29);

      v9 = v22;
      ++v15;
    }
    while (v15 < objc_msgSend(v34, "count"));
  }

  return v33;
}

- (NLContextualEmbeddingResult)embeddingResultForString:(NSString *)string language:(NLLanguage)language error:(NSError *)error
{
  NSString *v8;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NLContextualEmbeddingResult *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t Dimension;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSError **v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  const __CFString *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v8 = string;
  v9 = language;
  if (-[NLContextualEmbedding isLoaded](self, "isLoaded"))
  {
    v10 = 0;
    if (v9)
      goto LABEL_6;
  }
  else
  {
    v39 = 0;
    -[NLContextualEmbedding loadWithError:](self, "loadWithError:", &v39);
    v10 = v39;
    if (v9)
      goto LABEL_6;
  }
  v9 = CFSTR("und");
LABEL_6:
  if (!-[NLContextualEmbedding isLoaded](self, "isLoaded"))
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2D50];
    v41 = CFSTR("Failed to load contextual embedding");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v12 = v10;
    goto LABEL_29;
  }
  -[NLContextualEmbedding _tokenRangesForString:language:](self, "_tokenRangesForString:language:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLContextualEmbedding _tokensForString:tokenRanges:](self, "_tokensForString:tokenRanges:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_isE5Enabled)
    goto LABEL_17;
  if (self->_adapterIdentifier)
  {
    if (!-[NLE5Embedding isAdapterLoaded:](self->_embeddingE5, "isAdapterLoaded:"))
    {
      -[NLE5Embedding loadAdapter:](self->_embeddingE5, "loadAdapter:", self->_adapterIdentifier);
      goto LABEL_15;
    }
    if (self->_adapterIdentifier)
      goto LABEL_15;
  }
  if (!-[NLE5Embedding isBackboneLoaded](self->_embeddingE5, "isBackboneLoaded"))
    -[NLE5Embedding loadBackbone](self->_embeddingE5, "loadBackbone");
LABEL_15:
  if (!self->_isE5Enabled)
  {
LABEL_17:
    v18 = NLStringEmbeddingCopyDataForTokenizedBatch();
    goto LABEL_18;
  }
  -[NLE5Embedding embeddingDataForTokenizedBatch:withOutputProperties:](self->_embeddingE5, "embeddingDataForTokenizedBatch:withOutputProperties:", v13, v14);
  v18 = objc_claimAutoreleasedReturnValue();
LABEL_18:
  v38 = (void *)v18;
  if (v18)
  {
    v36 = error;
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D174C0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v14;
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D174B8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v19;
    objc_msgSend(v19, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v20;
    objc_msgSend(v20, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_isE5Enabled)
      Dimension = -[NLE5Embedding dimension](self->_embeddingE5, "dimension");
    else
      Dimension = NLStringEmbeddingGetDimension();
    v24 = Dimension;
    v35 = v13;
    if (v21 && v22)
    {
      -[NLContextualEmbedding tokenDictionariesForString:tokens:tokenRanges:componentRanges:componentsCount:](self, "tokenDictionariesForString:tokens:tokenRanges:componentRanges:componentsCount:", v8, v12, v11, v22, objc_msgSend(v21, "unsignedIntegerValue"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NLContextualEmbeddingResult initWithString:tokenDictionaries:data:language:tokenVectorDimension:]([NLContextualEmbeddingResult alloc], "initWithString:tokenDictionaries:data:language:tokenVectorDimension:", v8, v25, v38, v9, v24);
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2D50];
      v45 = CFSTR("Failed to compute embedding result");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v25);
      v27 = objc_claimAutoreleasedReturnValue();

      v17 = 0;
      v10 = (id)v27;
    }
    v16 = v10;

    v10 = v33;
    v32 = v34;
    v13 = v35;
    error = v36;
  }
  else
  {
    v37 = v14;
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2D50];
    v43 = CFSTR("Failed to compute embedding result");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v29;
    v32 = (void *)v30;
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
  }

LABEL_29:
  if (error)
    *error = (NSError *)objc_retainAutorelease(v16);

  return v17;
}

- (id)_paddedEmbeddingDataForInputEmbeddingData:(id)a3 tokenizedSentences:(id)a4 batchComponentsCountArray:(id)a5 batchComponentRangesArray:(id)a6 maxTokens:(unint64_t)a7
{
  id v12;
  id v13;
  uint64_t Dimension;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  char *v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  int *v28;
  _DWORD *v29;
  _DWORD *v30;
  int *v31;
  uint64_t i;
  int v33;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;

  v12 = a3;
  v39 = a4;
  v13 = a5;
  v38 = a6;
  if (self->_isE5Enabled)
    Dimension = -[NLE5Embedding dimension](self->_embeddingE5, "dimension");
  else
    Dimension = NLStringEmbeddingGetDimension();
  v15 = Dimension;
  v16 = objc_msgSend(v39, "count");
  v17 = v15 * a7 * v16;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_retainAutorelease(v12);
  v37 = objc_msgSend(v36, "bytes");
  v35 = objc_retainAutorelease(v18);
  v19 = (char *)objc_msgSend(v35, "mutableBytes");
  v20 = v19;
  if (v17)
    bzero(v19, 4 * v16 * v15 * a7);
  if (objc_msgSend(v39, "count"))
  {
    v21 = 0;
    v22 = 0;
    v23 = 4 * v15;
    do
    {
      if (v21 >= objc_msgSend(v13, "count") || v21 >= objc_msgSend(v38, "count"))
        break;
      objc_msgSend(v13, "objectAtIndex:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "unsignedIntegerValue");

      if (a7 >= v25)
        v26 = v25;
      else
        v26 = a7;
      if (v26)
      {
        v27 = 0;
        v28 = (int *)(v37 + v23 * v22);
        v29 = v20;
        do
        {
          v30 = v29;
          v31 = v28;
          for (i = v15; i; --i)
          {
            v33 = *v31++;
            *v30 = v33;
            v30 += a7;
          }
          ++v27;
          v28 = (int *)((char *)v28 + v23);
          ++v29;
        }
        while (v27 != v26);
      }
      v22 += v25;
      ++v21;
      v20 += 4 * v15 * a7;
    }
    while (v21 < objc_msgSend(v39, "count"));
  }

  return v35;
}

- (id)vectorsForTokenizedSentences:(id)a3 untokenizedSentences:(id)a4 maxTokens:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v7 = a3;
  if (!-[NLContextualEmbedding isLoaded](self, "isLoaded"))
    -[NLContextualEmbedding load](self, "load");
  if (!-[NLContextualEmbedding isLoaded](self, "isLoaded"))
  {
    v9 = 0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_isE5Enabled)
    goto LABEL_14;
  if (self->_adapterIdentifier)
  {
    if (!-[NLE5Embedding isAdapterLoaded:](self->_embeddingE5, "isAdapterLoaded:"))
    {
      -[NLE5Embedding loadAdapter:](self->_embeddingE5, "loadAdapter:", self->_adapterIdentifier);
      goto LABEL_12;
    }
    if (self->_adapterIdentifier)
      goto LABEL_12;
  }
  if (!-[NLE5Embedding isBackboneLoaded](self->_embeddingE5, "isBackboneLoaded"))
    -[NLE5Embedding loadBackbone](self->_embeddingE5, "loadBackbone");
LABEL_12:
  if (!self->_isE5Enabled)
  {
LABEL_14:
    v10 = NLStringEmbeddingCopyDataForTokenizedBatch();
    goto LABEL_15;
  }
  -[NLE5Embedding embeddingDataForTokenizedBatch:withOutputProperties:](self->_embeddingE5, "embeddingDataForTokenizedBatch:withOutputProperties:", v7, v8);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v11 = (void *)v10;
  if (v10)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D174C0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D174B8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      && ((v14 = objc_msgSend(v12, "count"), v14 == objc_msgSend(v7, "count")) ? (v15 = v13 == 0) : (v15 = 1),
          !v15 && (v16 = objc_msgSend(v13, "count"), v16 == objc_msgSend(v7, "count"))))
    {
      -[NLContextualEmbedding _paddedEmbeddingDataForInputEmbeddingData:tokenizedSentences:batchComponentsCountArray:batchComponentRangesArray:maxTokens:](self, "_paddedEmbeddingDataForInputEmbeddingData:tokenizedSentences:batchComponentsCountArray:batchComponentRangesArray:maxTokens:", v11, v7, v12, v13, a5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

LABEL_27:
  return v9;
}

- (void)requestEmbeddingResultForString:(id)a3 language:(id)a4 completionHandler:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  __CFString *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  __CFString *v18;
  NLContextualEmbedding *v19;
  id v20;

  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  if (!v9)
    v9 = CFSTR("und");
  +[NLXPCEmbeddingServerClient sharedClient](NLXPCEmbeddingServerClient, "sharedClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLContextualEmbedding identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__NLContextualEmbedding_requestEmbeddingResultForString_language_completionHandler___block_invoke;
  v16[3] = &unk_1E4A3B3D8;
  v17 = v8;
  v18 = v9;
  v19 = self;
  v20 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v11, "dataFromTokenVectorEmbeddingForString:language:identifier:completionHandler:", v15, v14, v12, v16);

}

void __84__NLContextualEmbedding_requestEmbeddingResultForString_language_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NLContextualEmbeddingResult *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7 && v8)
  {
    v11 = -[NLContextualEmbeddingResult initWithString:tokenDictionaries:data:language:tokenVectorDimension:]([NLContextualEmbeddingResult alloc], "initWithString:tokenDictionaries:data:language:tokenVectorDimension:", *(_QWORD *)(a1 + 32), v8, v7, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "dimension"));
  }
  else
  {
    if (!v9)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2D50];
      v15[0] = CFSTR("Failed to obtain result from embedding model");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (unint64_t)maximumBatchSize
{
  return 64;
}

- (void)requestBatchEmbeddingResultsForStrings:(id)a3 language:(id)a4 completionHandler:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  __CFString *v19;
  NLContextualEmbedding *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "count");
  if (v11 <= -[NLContextualEmbedding maximumBatchSize](self, "maximumBatchSize"))
  {
    if (!v9)
      v9 = CFSTR("und");
    +[NLXPCEmbeddingServerClient sharedClient](NLXPCEmbeddingServerClient, "sharedClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLContextualEmbedding identifier](self, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __91__NLContextualEmbedding_requestBatchEmbeddingResultsForStrings_language_completionHandler___block_invoke;
    v17[3] = &unk_1E4A3B400;
    v18 = v8;
    v9 = v9;
    v19 = v9;
    v20 = self;
    v21 = v10;
    objc_msgSend(v15, "batchDataFromTokenVectorEmbeddingForStrings:language:identifier:completionHandler:", v18, v9, v16, v17);

    v14 = v18;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = CFSTR("Maximum batch size exceeded");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);
  }

}

void __91__NLContextualEmbedding_requestBatchEmbeddingResultsForStrings_language_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  NLContextualEmbeddingResult *v14;
  void *v15;
  void *v16;
  void *v17;
  NLContextualEmbeddingResult *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7
    && v8
    && (v10 = objc_msgSend(*(id *)(a1 + 32), "count"), v10 == objc_msgSend(v7, "count"))
    && (v11 = objc_msgSend(v7, "count"), v11 == objc_msgSend(v8, "count")))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v21 = v9;
      v13 = 0;
      do
      {
        v14 = [NLContextualEmbeddingResult alloc];
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[NLContextualEmbeddingResult initWithString:tokenDictionaries:data:language:tokenVectorDimension:](v14, "initWithString:tokenDictionaries:data:language:tokenVectorDimension:", v15, v16, v17, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "dimension"));

        objc_msgSend(v12, "addObject:", v18);
        ++v13;
      }
      while (v13 < objc_msgSend(v7, "count"));
      v9 = v21;
    }
  }
  else
  {
    if (!v9)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      v23[0] = CFSTR("Failed to obtain result from embedding model");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v20);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)requestBackgroundEmbeddingResultForString:(id)a3 language:(id)a4 error:(id *)a5
{
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  __CFString *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  __CFString *v19;
  NLContextualEmbedding *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = (__CFString *)a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  v28 = 0;
  if (!v9)
    v9 = CFSTR("und");
  +[NLXPCEmbeddingServerClient sharedClient](NLXPCEmbeddingServerClient, "sharedClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLContextualEmbedding identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__NLContextualEmbedding_requestBackgroundEmbeddingResultForString_language_error___block_invoke;
  v17[3] = &unk_1E4A3B428;
  v21 = &v29;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v20 = self;
  v22 = &v23;
  objc_msgSend(v10, "synchronousDataFromTokenVectorEmbeddingForString:language:identifier:completionHandler:", v12, v13, v11, v17);

  v14 = (void *)v30[5];
  if (a5 && !v14)
  {
    *a5 = objc_retainAutorelease((id)v24[5]);
    v14 = (void *)v30[5];
  }
  v15 = v14;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

void __82__NLContextualEmbedding_requestBackgroundEmbeddingResultForString_language_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NLContextualEmbeddingResult *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7 && v8)
  {
    v11 = -[NLContextualEmbeddingResult initWithString:tokenDictionaries:data:language:tokenVectorDimension:]([NLContextualEmbeddingResult alloc], "initWithString:tokenDictionaries:data:language:tokenVectorDimension:", *(_QWORD *)(a1 + 32), v8, v7, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "dimension"));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  else if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a4);
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("Failed to obtain result from embedding model");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
}

- (id)requestBackgroundBatchEmbeddingResultsForStrings:(id)a3 language:(id)a4 error:(id *)a5
{
  id v8;
  __CFString *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  __CFString *v20;
  NLContextualEmbedding *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v10 = objc_msgSend(v8, "count");
  if (v10 <= -[NLContextualEmbedding maximumBatchSize](self, "maximumBatchSize"))
  {
    if (!v9)
      v9 = CFSTR("und");
    +[NLXPCEmbeddingServerClient sharedClient](NLXPCEmbeddingServerClient, "sharedClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLContextualEmbedding identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __89__NLContextualEmbedding_requestBackgroundBatchEmbeddingResultsForStrings_language_error___block_invoke;
    v18[3] = &unk_1E4A3B450;
    v19 = v8;
    v22 = &v30;
    v9 = v9;
    v20 = v9;
    v21 = self;
    v23 = &v24;
    objc_msgSend(v14, "synchronousBatchDataFromTokenVectorEmbeddingForStrings:language:identifier:completionHandler:", v19, v9, v15, v18);

    v16 = (void *)v31[5];
    if (a5 && !v16)
    {
      *a5 = objc_retainAutorelease((id)v25[5]);
      v16 = (void *)v31[5];
    }
    v13 = v16;

    v12 = v19;
  }
  else
  {
    if (!a5)
    {
      v13 = 0;
      goto LABEL_11;
    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    v37[0] = CFSTR("Maximum batch size exceeded");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 4, v12);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v13;
}

void __89__NLContextualEmbedding_requestBackgroundBatchEmbeddingResultsForStrings_language_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  NLContextualEmbeddingResult *v16;
  void *v17;
  void *v18;
  void *v19;
  NLContextualEmbeddingResult *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7
    && v8
    && (v10 = objc_msgSend(*(id *)(a1 + 32), "count"), v10 == objc_msgSend(v7, "count"))
    && (v11 = objc_msgSend(v7, "count"), v11 == objc_msgSend(v8, "count")))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    if (objc_msgSend(v7, "count"))
    {
      v15 = 0;
      do
      {
        v16 = [NLContextualEmbeddingResult alloc];
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[NLContextualEmbeddingResult initWithString:tokenDictionaries:data:language:tokenVectorDimension:](v16, "initWithString:tokenDictionaries:data:language:tokenVectorDimension:", v17, v18, v19, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "dimension"));

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v20);
        ++v15;
      }
      while (v15 < objc_msgSend(v7, "count"));
    }
  }
  else if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a4);
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("Failed to obtain result from embedding model");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

  }
}

- (BOOL)requestBackgroundModelLoadingWithWithError:(id *)a3
{
  return -[NLContextualEmbedding requestBackgroundModelLoadingWithTimeout:error:](self, "requestBackgroundModelLoadingWithTimeout:error:", a3, 0.0);
}

- (BOOL)requestBackgroundModelLoadingWithTimeout:(double)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  +[NLXPCEmbeddingServerClient sharedClient](NLXPCEmbeddingServerClient, "sharedClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLContextualEmbedding identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__NLContextualEmbedding_requestBackgroundModelLoadingWithTimeout_error___block_invoke;
  v17[3] = &unk_1E4A3B478;
  v17[4] = &v24;
  v17[5] = &v18;
  objc_msgSend(v7, "synchronousLoadModelWithIdentifier:timeout:completionHandler:", v8, v17, a3);

  v9 = *((unsigned __int8 *)v25 + 24);
  if (a4 && !*((_BYTE *)v25 + 24))
  {
    v10 = (void *)v19[5];
    if (!v10)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Failed to load embedding model");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v19[5];
      v19[5] = v13;

      v10 = (void *)v19[5];
    }
    *a4 = objc_retainAutorelease(v10);
    v9 = *((unsigned __int8 *)v25 + 24);
  }
  v15 = v9 != 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __72__NLContextualEmbedding_requestBackgroundModelLoadingWithTimeout_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)requestModelLoadingWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  +[NLXPCEmbeddingServerClient sharedClient](NLXPCEmbeddingServerClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLContextualEmbedding identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__NLContextualEmbedding_requestModelLoadingWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4A3A748;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "loadModelWithIdentifier:completionHandler:", v6, v8);

}

void __66__NLContextualEmbedding_requestModelLoadingWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = CFSTR("Failed to load embedding model");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_getSentenceEmbeddingForString:(id)a3 error:(id *)a4
{
  void *v6;
  unint64_t v7;
  id v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  NLContextualEmbedding *v26;
  id *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v30 = 0;
  -[NLE5Embedding embeddingDataForString:sequenceSize:error:](self->_embeddingE5, "embeddingDataForString:sequenceSize:error:", a3, &v30, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[NLE5Embedding dimension](self->_embeddingE5, "dimension");
    v8 = objc_alloc(MEMORY[0x1E0C9E970]);
    v32[0] = &unk_1E4A47C48;
    v32[1] = &unk_1E4A47C48;
    v9 = 0x1E0CB3000uLL;
    v29 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v10;
    v11 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v8, "initWithShape:dataType:error:", v12, 65568, a4);

    if (v13)
    {
      v26 = self;
      v27 = a4;
      v28 = v6;
      v14 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
      if (v7)
      {
        v16 = v14;
        v17 = 0;
        v18 = 4 * v7;
        do
        {
          LODWORD(v15) = *(_DWORD *)(v16 + v18 * (v30 - 1) + 4 * v17);
          objc_msgSend(*(id *)(v9 + 2024), "numberWithFloat:", v15, v26, v27);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = &unk_1E4A47C60;
          v31[1] = &unk_1E4A47C60;
          objc_msgSend(*(id *)(v9 + 2024), "numberWithUnsignedInteger:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v31[2] = v20;
          objc_msgSend(*(id *)(v11 + 3360), "arrayWithObjects:count:", v31, 3);
          v21 = v9;
          v22 = v11;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v23);

          v11 = v22;
          v9 = v21;

          ++v17;
        }
        while (v29 != v17);
      }
      -[NLSentenceEmbeddingHead getSentenceEmbeddingFromPooledTokenEmbeddings:error:](v26->_sentenceEmbeddingHead, "getSentenceEmbeddingFromPooledTokenEmbeddings:error:", v13, v27, v26, v27);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v28;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)sentenceEmbeddingVectorForString:(id)a3 language:(id)a4 error:(id *)a5
{
  id v7;
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v20 = 0;
  v8 = -[NLContextualEmbedding loadSentenceEmbeddingWithError:](self, "loadSentenceEmbeddingWithError:", &v20);
  v9 = v20;
  v10 = v9;
  if (v8)
  {
    v19 = v9;
    -[NLContextualEmbedding _getSentenceEmbeddingForString:error:](self, "_getSentenceEmbeddingForString:error:", v7, &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NLSentenceEmbeddingHead outputDimension](self->_sentenceEmbeddingHead, "outputDimension"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NLSentenceEmbeddingHead outputDimension](self->_sentenceEmbeddingHead, "outputDimension"))
    {
      v13 = 0;
      do
      {
        v21[0] = &unk_1E4A47C60;
        v21[1] = &unk_1E4A47C60;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13, v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21[2] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v16);

        ++v13;
      }
      while (v13 < -[NLSentenceEmbeddingHead outputDimension](self->_sentenceEmbeddingHead, "outputDimension"));
    }

    v10 = v18;
  }
  else if (a5)
  {
    v10 = objc_retainAutorelease(v9);
    v12 = 0;
    *a5 = v10;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)sentenceEmbeddingVectorDataForString:(id)a3 language:(id)a4 error:(id *)a5
{
  id v7;
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  id v20;
  int v21;
  id v22;
  id v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v23 = 0;
  v8 = -[NLContextualEmbedding loadSentenceEmbeddingWithError:](self, "loadSentenceEmbeddingWithError:", &v23);
  v9 = v23;
  v10 = v9;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v10;
    -[NLContextualEmbedding _getSentenceEmbeddingForString:error:](self, "_getSentenceEmbeddingForString:error:", v7, &v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;

    if (-[NLSentenceEmbeddingHead outputDimension](self->_sentenceEmbeddingHead, "outputDimension"))
    {
      v13 = 0;
      do
      {
        v21 = 0;
        v24[0] = &unk_1E4A47C60;
        v24[1] = &unk_1E4A47C60;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v18 = v17;

        v21 = v18;
        objc_msgSend(v11, "appendBytes:length:", &v21, 4);
        ++v13;
      }
      while (v13 < -[NLSentenceEmbeddingHead outputDimension](self->_sentenceEmbeddingHead, "outputDimension"));
    }

    v10 = v20;
  }
  else if (a5)
  {
    v10 = objc_retainAutorelease(v9);
    v11 = 0;
    *a5 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)requestSentenceEmbeddingVectorForString:(id)a3 language:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[NLXPCEmbeddingServerClient sharedClient](NLXPCEmbeddingServerClient, "sharedClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLContextualEmbedding identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92__NLContextualEmbedding_requestSentenceEmbeddingVectorForString_language_completionHandler___block_invoke;
  v14[3] = &unk_1E4A3A720;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v11, "dataFromSentenceVectorEmbeddingForString:language:identifier:completionHandler:", v10, v9, v12, v14);

}

void __92__NLContextualEmbedding_requestSentenceEmbeddingVectorForString_language_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  double v11;
  int *v12;
  unint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "length");
    v10 = objc_msgSend(objc_retainAutorelease(v5), "bytes");
    if (v9 >= 4)
    {
      v12 = (int *)v10;
      v13 = v9 >> 2;
      do
      {
        v14 = *v12++;
        LODWORD(v11) = v14;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v15);

        --v13;
      }
      while (v13);
    }
  }
  else
  {
    if (!v6)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      v19[0] = CFSTR("Failed to obtain result from embedding model");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)subRangesWithinToken:(id)a3 offset:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NLE5Embedding *embeddingE5;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isE5Enabled)
  {
    -[NLE5Embedding tokenIDsForText:](self->_embeddingE5, "tokenIDsForText:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = NLStringEmbeddingCopyTokenIDsForText();
  }
  v8 = (void *)v7;
  if (subRangesWithinToken_offset__onceToken != -1)
    dispatch_once(&subRangesWithinToken_offset__onceToken, &__block_literal_global_157);
  if (objc_msgSend(v8, "count"))
  {
    v9 = 0;
    v10 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v9 || (objc_msgSend(v11, "isEqual:", &unk_1E4A47C48) & 1) == 0)
      {
        if (self->_isE5Enabled)
        {
          embeddingE5 = self->_embeddingE5;
          v23[0] = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NLE5Embedding textForTokenIDs:](embeddingE5, "textForTokenIDs:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByTrimmingCharactersInSet:", subRangesWithinToken_offset__whitespaceAndNewlineCharacterSet);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v22 = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
          v14 = (void *)NLStringEmbeddingCopyTextForTokenIDs();
          objc_msgSend(v14, "stringByTrimmingCharactersInSet:", subRangesWithinToken_offset__whitespaceAndNewlineCharacterSet);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v17 = objc_msgSend(v16, "length");
        v18 = v17 + v10;
        if (v17 + v10 > (unint64_t)objc_msgSend(v5, "length"))
        {
          v18 = objc_msgSend(v5, "length");
          v17 = v18 - v10;
        }
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v10 + a4, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v19);

        v10 = v18;
      }

      ++v9;
    }
    while (v9 < objc_msgSend(v8, "count"));
  }

  return v6;
}

void __53__NLContextualEmbedding_subRangesWithinToken_offset___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)subRangesWithinToken_offset__whitespaceAndNewlineCharacterSet;
  subRangesWithinToken_offset__whitespaceAndNewlineCharacterSet = v0;

}

- (id)tokenDictionariesForString:(id)a3 tokens:(id)a4 tokenRanges:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v26[0] = CFSTR("TokenRange");
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = CFSTR("SubtokenRanges");
      v27[0] = v12;
      v27[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v13);

    }
  }
  if (objc_msgSend(v7, "count"))
  {
    v14 = 0;
    do
    {
      if (v14 >= objc_msgSend(v8, "count"))
        break;
      objc_msgSend(v7, "objectAtIndex:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "rangeValue");
      v19 = v18;

      -[NLContextualEmbedding subRangesWithinToken:offset:](self, "subRangesWithinToken:offset:", v15, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v17, v19, CFSTR("TokenRange"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = CFSTR("SubtokenRanges");
      v25[0] = v21;
      v25[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v22);

      ++v14;
    }
    while (v14 < objc_msgSend(v7, "count"));
  }

  return v9;
}

- (BOOL)enumerateTokensForString:(id)a3 language:(id)a4 inRange:(_NSRange)a5 error:(id *)a6 usingBlock:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  BOOL isE5Enabled;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  void *v34;
  void *v35;
  id v36;
  __CFString *v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (**v42)(id, unint64_t, uint64_t, _BYTE *);
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  unsigned __int8 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  length = a5.length;
  location = a5.location;
  v54 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v37 = (__CFString *)a4;
  v42 = (void (**)(id, unint64_t, uint64_t, _BYTE *))a7;
  isE5Enabled = self->_isE5Enabled;
  if (!isE5Enabled)
    goto LABEL_5;
  if (!self->_embeddingE5)
  {
    if (!-[NLContextualEmbedding loadWithError:](self, "loadWithError:", a6))
      goto LABEL_30;
    isE5Enabled = self->_isE5Enabled;
LABEL_5:
    if (isE5Enabled || self->_embedding || -[NLContextualEmbedding loadWithError:](self, "loadWithError:", a6))
      goto LABEL_8;
LABEL_30:
    v32 = 0;
    goto LABEL_31;
  }
LABEL_8:
  v14 = v37;
  if (!v37)
    v14 = CFSTR("und");
  v37 = v14;
  -[NLContextualEmbedding _tokenRangesForString:language:](self, "_tokenRangesForString:language:", v36, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  -[NLContextualEmbedding _tokensForString:tokenRanges:](self, "_tokensForString:tokenRanges:", v36, v15);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v15;
  -[NLContextualEmbedding tokenDictionariesForString:tokens:tokenRanges:](self, "tokenDictionariesForString:tokens:tokenRanges:", v36);
  v51 = 0;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v48;
LABEL_12:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v39)
        objc_enumerationMutation(obj);
      v41 = v16;
      v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v16);
      objc_msgSend(v17, "objectForKey:", CFSTR("TokenRange"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "rangeValue");
      v21 = v20;

      objc_msgSend(v17, "objectForKey:", CFSTR("SubtokenRanges"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v44;
LABEL_17:
        v27 = 0;
        while (1)
        {
          if (*(_QWORD *)v44 != v26)
            objc_enumerationMutation(v23);
          v28 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v27), "rangeValue");
          v30 = v29;
          if (rangesMatch(location, length, v19, v21)
            && rangesMatch(location, length, v28, v30))
          {
            v42[2](v42, v28, v30, &v51);
          }
          if (v51)
            break;
          if (v25 == ++v27)
          {
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
            if (v25)
              goto LABEL_17;
            break;
          }
        }
      }

      v31 = v51;
      if (v31)
        break;
      v16 = v41 + 1;
      if (v41 + 1 == v40)
      {
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        if (v40)
          goto LABEL_12;
        break;
      }
    }
  }

  v32 = 1;
LABEL_31:

  return v32;
}

- (id)identifier
{
  return self->_identifier;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (id)adapterIdentifier
{
  return self->_adapterIdentifier;
}

- (NSUInteger)dimension
{
  void *v2;
  NSUInteger v3;

  -[NSDictionary objectForKey:](self->_catalogEntry, "objectForKey:", CFSTR("Dimension"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v3 = 0;

  return v3;
}

- (NSUInteger)maximumSequenceLength
{
  void *v2;
  NSUInteger v3;

  -[NSDictionary objectForKey:](self->_catalogEntry, "objectForKey:", CFSTR("MaximumSequenceLength"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v3 = 0;

  return v3;
}

- (unint64_t)sentenceVectorDimension
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKey:](self->_catalogEntry, "objectForKey:", CFSTR("SentenceEmbeddingDimension"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v3 = 0;

  return v3;
}

- (unint64_t)tokenVectorDimension
{
  if (!-[NLContextualEmbedding isLoaded](self, "isLoaded"))
    -[NLContextualEmbedding load](self, "load");
  if (!-[NLContextualEmbedding isLoaded](self, "isLoaded"))
    return 0;
  if (self->_isE5Enabled)
    return -[NLE5Embedding dimension](self->_embeddingE5, "dimension");
  return NLStringEmbeddingGetDimension();
}

- (NSArray)languages
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[NSDictionary objectForKey:](self->_catalogEntry, "objectForKey:", CFSTR("Languages"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C9AA60];
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (NSArray)scripts
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[NSDictionary objectForKey:](self->_catalogEntry, "objectForKey:", CFSTR("Scripts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C9AA60];
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (id)adapters
{
  void *v2;
  void *v3;
  id v4;

  -[NSDictionary objectForKey:](self->_catalogEntry, "objectForKey:", CFSTR("Adapters"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C9AA60];
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (NSUInteger)revision
{
  void *v2;
  NSUInteger v3;

  -[NSDictionary objectForKey:](self->_catalogEntry, "objectForKey:", CFSTR("Revision"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v3 = 0;

  return v3;
}

- (unint64_t)modelSystemVersion
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKey:](self->_catalogEntry, "objectForKey:", CFSTR("NLModelSystemVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v3 = 0;

  return v3;
}

- (id)assetLocaleIdentifier
{
  void *v2;
  void *v3;
  id v4;

  -[NSDictionary objectForKey:](self->_catalogEntry, "objectForKey:", CFSTR("AssetLocale"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (id)assetLocale
{
  void *v2;
  void *v3;

  -[NLContextualEmbedding assetLocaleIdentifier](self, "assetLocaleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)bundleName
{
  void *v2;
  void *v3;
  id v4;

  -[NSDictionary objectForKey:](self->_catalogEntry, "objectForKey:", CFSTR("BundleName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (BOOL)hasAvailableAssets
{
  void *v3;

  -[NLContextualEmbedding bundlePath](self, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return !-[NLContextualEmbedding requiresCompilation](self, "requiresCompilation");
  else
    return 0;
}

- (BOOL)isE5Enabled
{
  return self->_isE5Enabled;
}

- (BOOL)useANE
{
  return self->_useANE;
}

- (BOOL)compileWithError:(id *)a3
{
  char v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (self->_isE5Enabled && !self->_embeddingE5)
  {
    -[NLContextualEmbedding bundlePath](self, "bundlePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSDictionary objectForKey:](self->_catalogEntry, "objectForKey:", CFSTR("Adapters"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_opt_class();
      objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("embeddings.mil"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v8, "compileEmbeddingModelWithModelPath:useANE:adapters:", v9, self->_useANE, v7);

      if (a3 && (v4 & 1) == 0)
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v14 = *MEMORY[0x1E0CB2D50];
        v15 = CFSTR("E5 model compilation failed");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v11);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (!a3)
      {
        v4 = 0;
        goto LABEL_11;
      }
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      v17[0] = CFSTR("Failed to locate embedding model");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v7);
      v4 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_11:
    return v4;
  }
  return 1;
}

- (int64_t)getCompilationState
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 useANE;
  int v9;
  uint64_t v10;
  uint64_t v11;

  if (!self->_isE5Enabled || self->_embeddingE5)
    return 1;
  -[NLContextualEmbedding bundlePath](self, "bundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  -[NSDictionary objectForKey:](self->_catalogEntry, "objectForKey:", CFSTR("Adapters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("embeddings.mil"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  useANE = self->_useANE;
  v11 = 0;
  v9 = objc_msgSend(v6, "isCompiledEmbeddingModelWithModelPath:useANE:adapters:error:", v7, useANE, v5, &v11);
  v10 = v11;

  if (v10)
  {
LABEL_7:

    return 2;
  }

  return v9 != 0;
}

- (BOOL)requiresCompilation
{
  void *v3;
  void *v4;
  char v5;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.naturallanguaged"));

  if ((v5 & 1) != 0 || -[NLContextualEmbedding getCompilationState](self, "getCompilationState") == 1)
    return 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__NLContextualEmbedding_requiresCompilation__block_invoke;
  v7[3] = &unk_1E4A3B4C0;
  v7[4] = self;
  -[NLContextualEmbedding requestModelCompilationWithCompletionHandler:](self, "requestModelCompilationWithCompletionHandler:", v7);
  return 1;
}

void __44__NLContextualEmbedding_requiresCompilation__block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(*(id *)(a1 + 32), "assetLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a2)
    NSLog(CFSTR("Compilation of '%@' model with '%@' identifier succeeded. Caller bundle id: '%@'"), v5, v6, v8);
  else
    NSLog(CFSTR("Compilation of '%@' model with '%@' identifier failed:%@\nCaller bundle id: '%@'"), v5, v6, v10, v8);

}

- (void)requestModelCompilationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  +[NLXPCEmbeddingServerClient sharedClient](NLXPCEmbeddingServerClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLContextualEmbedding identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__NLContextualEmbedding_requestModelCompilationWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4A3A748;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "compileModelWithIdentifier:completionHandler:", v6, v8);

}

void __70__NLContextualEmbedding_requestModelCompilationWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = CFSTR("Failed to compile embedding model");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)requestAssetsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NLContextualEmbedding assetLocaleIdentifier](self, "assetLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__NLContextualEmbedding_requestAssetsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4A3B4E8;
  v8 = v4;
  v6 = v4;
  +[NLTagger requestAssetsForLanguage:tagScheme:completionHandler:](NLTagger, "requestAssetsForLanguage:tagScheme:completionHandler:", v5, CFSTR("ContextualEmbedding"), v7);

}

uint64_t __60__NLContextualEmbedding_requestAssetsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestEmbeddingAssetsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  -[NLContextualEmbedding assetLocaleIdentifier](self, "assetLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__NLContextualEmbedding_requestEmbeddingAssetsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4A3B4E8;
  v8 = v4;
  v6 = v4;
  +[NLTagger requestAssetsForLanguage:tagScheme:completionHandler:](NLTagger, "requestAssetsForLanguage:tagScheme:completionHandler:", v5, CFSTR("ContextualEmbedding"), v7);

}

uint64_t __69__NLContextualEmbedding_requestEmbeddingAssetsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentenceEmbeddingHead, 0);
  objc_storeStrong((id *)&self->_embeddingE5, 0);
  objc_storeStrong((id *)&self->_tagger, 0);
  objc_storeStrong((id *)&self->_catalogEntry, 0);
  objc_storeStrong((id *)&self->_adapterIdentifier, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
