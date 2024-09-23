@implementation IPMessageUnit

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (IPMessageUnit)initWithText:(id)a3 originalMessage:(id)a4 index:(int64_t)a5
{
  id v9;
  id v10;
  IPMessageUnit *v11;
  IPMessageUnit *v12;
  NSArray *dataFeatures;
  NSArray *sentenceFeatures;
  NSArray *keywordFeatures;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)IPMessageUnit;
  v11 = -[IPMessageUnit init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_text, a3);
    v12->_indexInOriginalMessage = a5;
    objc_storeWeak((id *)&v12->_originalMessage, v10);
    v12->_interactedDateRange = (_NSRange)xmmword_2195A9E60;
    dataFeatures = v12->_dataFeatures;
    v12->_dataFeatures = 0;

    sentenceFeatures = v12->_sentenceFeatures;
    v12->_sentenceFeatures = 0;

    keywordFeatures = v12->_keywordFeatures;
    v12->_keywordFeatures = 0;

  }
  return v12;
}

- (void)addFollowup:(id)a3
{
  id v4;
  NSMutableArray *followups;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    followups = self->_followups;
    v8 = v4;
    if (followups)
    {
      -[NSMutableArray addObject:](followups, "addObject:", v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v4);
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_followups;
      self->_followups = v6;

    }
    v4 = v8;
  }

}

- (NSArray)followups
{
  return (NSArray *)self->_followups;
}

- (void)setFeatures:(id)a3
{
  id v4;
  IPMessageUnit *v5;
  uint64_t v6;
  NSArray *features;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_msgSend(v4, "copy");
  features = v5->_features;
  v5->_features = (NSArray *)v6;

  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v5->_features;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "addObject:", v14);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "addObject:", v14);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            objc_msgSend(v15, "addObject:", v14);
          }
        }

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  -[IPMessageUnit setDataFeatures:](v5, "setDataFeatures:", v8);
  -[IPMessageUnit setKeywordFeatures:](v5, "setKeywordFeatures:", v15);
  -[IPMessageUnit setSentenceFeatures:](v5, "setSentenceFeatures:", v9);

  objc_sync_exit(v5);
}

- (void)setSentenceFeatures:(id)a3
{
  IPMessageUnit *v4;
  uint64_t v5;
  NSArray *sentenceFeatures;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  sentenceFeatures = v4->_sentenceFeatures;
  v4->_sentenceFeatures = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (void)setDataFeatures:(id)a3
{
  IPMessageUnit *v4;
  uint64_t v5;
  NSArray *dataFeatures;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  dataFeatures = v4->_dataFeatures;
  v4->_dataFeatures = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (void)setKeywordFeatures:(id)a3
{
  IPMessageUnit *v4;
  uint64_t v5;
  NSArray *keywordFeatures;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  keywordFeatures = v4->_keywordFeatures;
  v4->_keywordFeatures = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (NSString)lowercaseTextTruncated
{
  IPMessageUnit *v2;
  void *WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_lowercaseTextTruncated);
  if (!WeakRetained)
  {
    -[IPMessageUnit text](v2, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "length") >= 0x2711)
    {
      v5 = (void *)MEMORY[0x219A2F708]();
      objc_msgSend(v4, "substringToIndex:", 10000);
      v6 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v5);
      v4 = (void *)v6;
    }
    v7 = (void *)MEMORY[0x219A2F708]();
    objc_msgSend(v4, "lowercaseString");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v7);
    objc_storeWeak((id *)&v2->_lowercaseTextTruncated, WeakRetained);

  }
  objc_sync_exit(v2);

  return (NSString *)WeakRetained;
}

- (NSArray)features
{
  IPMessageUnit *v2;
  NSString *text;
  uint64_t v4;
  NSArray *features;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSArray *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_features)
  {
    text = v2->_text;
    if (text)
    {
      +[IPFeatureManager featuresForTextString:inMessageUnit:](IPFeatureManager, "featuresForTextString:inMessageUnit:", text, v2);
      v4 = objc_claimAutoreleasedReturnValue();
      features = v2->_features;
      v2->_features = (NSArray *)v4;

    }
  }
  if (v2->_text && (!v2->_dataFeatures || !v2->_keywordFeatures || !v2->_sentenceFeatures))
  {
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    v15 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v2->_features;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (!v9)
      goto LABEL_22;
    v10 = *(_QWORD *)v17;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "addObject:", v12);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            objc_msgSend(v15, "addObject:", v12);
          }
        }

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (!v9)
      {
LABEL_22:

        -[IPMessageUnit setDataFeatures:](v2, "setDataFeatures:", v6);
        -[IPMessageUnit setKeywordFeatures:](v2, "setKeywordFeatures:", v15);
        -[IPMessageUnit setSentenceFeatures:](v2, "setSentenceFeatures:", v7);

        break;
      }
    }
  }
  v13 = v2->_features;
  objc_sync_exit(v2);

  return v13;
}

- (id)rejectionRanges
{
  IPMessageUnit *v2;
  NSIndexSet *rejectionRanges;
  NSIndexSet *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSIndexSet *v20;
  IPMessageUnit *v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  rejectionRanges = v2->_rejectionRanges;
  if (!rejectionRanges)
  {
    rejectionRanges = (NSIndexSet *)v2->_text;
    if (rejectionRanges)
    {
      v21 = v2;
      v6 = (void *)objc_opt_new();
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[IPMessageUnit sentenceFeatures](v2, "sentenceFeatures");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v8)
      {
        obj = v7;
        v23 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v29 != v23)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            v11 = objc_msgSend(v10, "matchRange");
            v26 = 0u;
            v27 = 0u;
            v24 = 0u;
            v25 = 0u;
            objc_msgSend(v10, "fragments");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v25;
              do
              {
                for (j = 0; j != v13; ++j)
                {
                  if (*(_QWORD *)v25 != v14)
                    objc_enumerationMutation(v12);
                  v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
                  if (objc_msgSend(v16, "mainPolarity") == 4)
                  {
                    v17 = objc_msgSend(v16, "range");
                    objc_msgSend(v16, "range");
                    objc_msgSend(v6, "addIndexesInRange:", v17 + v11, v18);
                  }
                }
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              }
              while (v13);
            }

          }
          v7 = obj;
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v8);
      }

      v19 = objc_msgSend(v6, "copy");
      v20 = v21->_rejectionRanges;
      v21->_rejectionRanges = (NSIndexSet *)v19;

      rejectionRanges = v21->_rejectionRanges;
      v2 = v21;
    }
  }
  v4 = rejectionRanges;
  objc_sync_exit(v2);

  return v4;
}

- (id)neutralRanges
{
  IPMessageUnit *v2;
  NSIndexSet *neutralRanges;
  NSIndexSet *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSIndexSet *v20;
  IPMessageUnit *v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  neutralRanges = v2->_neutralRanges;
  if (!neutralRanges)
  {
    neutralRanges = (NSIndexSet *)v2->_text;
    if (neutralRanges)
    {
      v21 = v2;
      v6 = (void *)objc_opt_new();
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[IPMessageUnit sentenceFeatures](v2, "sentenceFeatures");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v8)
      {
        obj = v7;
        v23 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v29 != v23)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            v11 = objc_msgSend(v10, "matchRange");
            v26 = 0u;
            v27 = 0u;
            v24 = 0u;
            v25 = 0u;
            objc_msgSend(v10, "fragments");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v25;
              do
              {
                for (j = 0; j != v13; ++j)
                {
                  if (*(_QWORD *)v25 != v14)
                    objc_enumerationMutation(v12);
                  v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
                  if ((unint64_t)(objc_msgSend(v16, "mainPolarity") - 5) <= 0xFFFFFFFFFFFFFFFCLL)
                  {
                    v17 = objc_msgSend(v16, "range");
                    objc_msgSend(v16, "range");
                    objc_msgSend(v6, "addIndexesInRange:", v17 + v11, v18);
                  }
                }
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              }
              while (v13);
            }

          }
          v7 = obj;
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v8);
      }

      v19 = objc_msgSend(v6, "copy");
      v20 = v21->_neutralRanges;
      v21->_neutralRanges = (NSIndexSet *)v19;

      neutralRanges = v21->_neutralRanges;
      v2 = v21;
    }
  }
  v4 = neutralRanges;
  objc_sync_exit(v2);

  return v4;
}

- (id)proposalAndAcceptationRanges
{
  IPMessageUnit *v2;
  NSIndexSet *proposalAndAcceptationRanges;
  NSIndexSet *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSIndexSet *v20;
  IPMessageUnit *v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  proposalAndAcceptationRanges = v2->_proposalAndAcceptationRanges;
  if (!proposalAndAcceptationRanges)
  {
    proposalAndAcceptationRanges = (NSIndexSet *)v2->_text;
    if (proposalAndAcceptationRanges)
    {
      v21 = v2;
      v6 = (void *)objc_opt_new();
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[IPMessageUnit sentenceFeatures](v2, "sentenceFeatures");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v8)
      {
        obj = v7;
        v23 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v29 != v23)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            v11 = objc_msgSend(v10, "matchRange");
            v26 = 0u;
            v27 = 0u;
            v24 = 0u;
            v25 = 0u;
            objc_msgSend(v10, "fragments");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v25;
              do
              {
                for (j = 0; j != v13; ++j)
                {
                  if (*(_QWORD *)v25 != v14)
                    objc_enumerationMutation(v12);
                  v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
                  if ((objc_msgSend(v16, "mainPolarity") & 0xFFFFFFFFFFFFFFFELL) == 2)
                  {
                    v17 = objc_msgSend(v16, "range");
                    objc_msgSend(v16, "range");
                    objc_msgSend(v6, "addIndexesInRange:", v17 + v11, v18);
                  }
                }
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              }
              while (v13);
            }

          }
          v7 = obj;
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v8);
      }

      v19 = objc_msgSend(v6, "copy");
      v20 = v21->_proposalAndAcceptationRanges;
      v21->_proposalAndAcceptationRanges = (NSIndexSet *)v19;

      proposalAndAcceptationRanges = v21->_proposalAndAcceptationRanges;
      v2 = v21;
    }
  }
  v4 = proposalAndAcceptationRanges;
  objc_sync_exit(v2);

  return v4;
}

- (id)bestLanguageID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  NSString *bestLanguage;
  void *context;

  if (!self->_bestLanguage && -[NSString length](self->_text, "length"))
  {
    -[IPMessageUnit originalMessage](self, "originalMessage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v4, "length"))
    {
      -[IPMessageUnit text](self, "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
LABEL_16:
      +[IPFeatureSentence bestLanguageIDFromText:linesElided:](IPFeatureSentence, "bestLanguageIDFromText:linesElided:", v5, v11);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      bestLanguage = self->_bestLanguage;
      self->_bestLanguage = v16;

      return self->_bestLanguage;
    }
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "appendString:", CFSTR("\n"));
    -[IPMessageUnit text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "length") <= 0x1FF && objc_msgSend(v6, "length"))
    {
      v7 = 512 - objc_msgSend(v5, "length");
      if (v7 < objc_msgSend(v6, "length"))
      {
        context = (void *)MEMORY[0x219A2F708]();
        v8 = objc_msgSend(v6, "lineRangeForRange:", 0, 512 - objc_msgSend(v5, "length"));
        v10 = v9;
        v11 = 0;
        v12 = v9 + v8 + 1;
        do
        {
          if (v12 >= objc_msgSend(v6, "length"))
            break;
          v13 = objc_msgSend(v6, "rangeOfString:options:range:", CFSTR("\n"), 2, v12, objc_msgSend(v6, "length") - v12);
          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
            break;
          v12 = v13 + v14;
          ++v11;
        }
        while (v11 != 5);
        objc_msgSend(v6, "substringWithRange:", v8, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v15);

        objc_autoreleasePoolPop(context);
        goto LABEL_15;
      }
      objc_msgSend(v5, "appendString:", v6);
    }
    v11 = 0;
LABEL_15:

    goto LABEL_16;
  }
  return self->_bestLanguage;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x219A2F708](self, a2);
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[IPMessageUnit text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<IPMessageUnit: %@>"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v6;
}

- (IPMessageUnit)previous
{
  return (IPMessageUnit *)objc_loadWeakRetained((id *)&self->_previous);
}

- (NSArray)sentenceFeatures
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)dataFeatures
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)keywordFeatures
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (IPMessage)originalMessage
{
  return (IPMessage *)objc_loadWeakRetained((id *)&self->_originalMessage);
}

- (int64_t)indexInOriginalMessage
{
  return self->_indexInOriginalMessage;
}

- (_NSRange)interactedDateRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_interactedDateRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setInteractedDateRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_interactedDateRange, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_originalMessage);
  objc_destroyWeak((id *)&self->_previous);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_lowercaseTextTruncated);
  objc_storeStrong((id *)&self->_bestLanguage, 0);
  objc_storeStrong((id *)&self->_neutralRanges, 0);
  objc_storeStrong((id *)&self->_proposalAndAcceptationRanges, 0);
  objc_storeStrong((id *)&self->_rejectionRanges, 0);
  objc_storeStrong((id *)&self->_keywordFeatures, 0);
  objc_storeStrong((id *)&self->_dataFeatures, 0);
  objc_storeStrong((id *)&self->_sentenceFeatures, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_flatMessageThread, 0);
  objc_storeStrong((id *)&self->_followups, 0);
}

@end
