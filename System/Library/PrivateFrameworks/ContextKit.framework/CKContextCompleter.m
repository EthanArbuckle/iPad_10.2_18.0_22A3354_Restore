@implementation CKContextCompleter

- (CKContextCompleter)initWithResponse:(id)a3
{
  id v5;
  CKContextCompleter *v6;
  NSString *ignorePrefix;
  uint64_t v8;
  NSDate *hideCompletionsAfterDate;
  NSDate *v10;
  double v11;
  BOOL v12;
  CKContextCompleter *v13;
  uint64_t v14;
  NSLocale *searchLocale;
  uint64_t v16;
  NSArray *couldHaveShown;
  uint64_t v18;
  NSMutableArray *zkwResults;
  objc_super v21;

  v5 = a3;
  if (v5)
  {
    v21.receiver = self;
    v21.super_class = (Class)CKContextCompleter;
    v6 = -[CKContextCompleter init](&v21, sel_init);
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[CKContextCompleter initWithResponse:].cold.1((uint64_t)v5);
      objc_storeStrong((id *)&v6->_response, a3);
      ignorePrefix = v6->_ignorePrefix;
      v6->_ignorePrefix = 0;

      v6->_creationTime = mach_continuous_approximate_time();
      v6->_likelyUnsolicited = +[CKContextClient isLikelyUnsolicitedUserInteraction](CKContextClient, "isLikelyUnsolicitedUserInteraction");
      objc_msgSend(v5, "hideCompletionsAfterDate");
      v8 = objc_claimAutoreleasedReturnValue();
      hideCompletionsAfterDate = v6->_hideCompletionsAfterDate;
      v6->_hideCompletionsAfterDate = (NSDate *)v8;

      v10 = v6->_hideCompletionsAfterDate;
      v12 = 0;
      if (v10)
      {
        -[NSDate timeIntervalSinceNow](v10, "timeIntervalSinceNow");
        if (v11 < 0.0)
          v12 = 1;
      }
      v6->_hideCompletions = v12;
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v14 = objc_claimAutoreleasedReturnValue();
      searchLocale = v6->_searchLocale;
      v6->_searchLocale = (NSLocale *)v14;

      objc_msgSend(v5, "results");
      v16 = objc_claimAutoreleasedReturnValue();
      couldHaveShown = v6->_couldHaveShown;
      v6->_couldHaveShown = (NSArray *)v16;

      -[CKContextCompleter _resultsMatching:](v6, "_resultsMatching:", 0);
      v18 = objc_claimAutoreleasedReturnValue();
      zkwResults = v6->_zkwResults;
      v6->_zkwResults = (NSMutableArray *)v18;

      v6->_mustPrefixMatchLength = objc_msgSend(v5, "mustPrefixMatchLength");
    }
    self = v6;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)resultsMatching:(id)a3
{
  id v4;
  unint64_t *p_inputKeystrokes;
  unint64_t v6;
  NSArray *couldHaveShown;
  _BOOL4 v8;
  NSMutableArray *zkwResults;
  NSMutableArray *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  unint64_t *v31;
  unint64_t v32;
  NSString *v33;
  NSString *ignorePrefix;
  NSString *v36;
  NSString *v37;
  NSString *v38;
  NSString *input;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    p_inputKeystrokes = &self->_inputKeystrokes;
    do
      v6 = __ldaxr(p_inputKeystrokes);
    while (__stlxr(v6 + 1, p_inputKeystrokes));
    couldHaveShown = self->_couldHaveShown;
    if (couldHaveShown)
      v8 = -[NSArray count](couldHaveShown, "count") != 0;
    else
      v8 = 0;
    -[CKContextCompleter _resultsMatching:](self, "_resultsMatching:", v4);
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (!self->_mustPrefixMatchLength
      || objc_msgSend(v4, "length") < self->_mustPrefixMatchLength
      || (v11 = atomic_load(&self->_inputKeystrokes), v11 < self->_mustPrefixMatchLength))
    {
      if (v10)
        goto LABEL_13;
      if (self->_hideCompletions)
      {
        v10 = 0;
        goto LABEL_41;
      }
      ignorePrefix = self->_ignorePrefix;
      self->_ignorePrefix = 0;

      v36 = self->_input;
      v37 = v36;
      if (!v8
        || !-[NSString length](v36, "length")
        || objc_msgSend(v4, "rangeOfString:", v37)
        || (-[CKContextCompleter _resultsMatching:](self, "_resultsMatching:", v37),
            (v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v10 = self->_zkwResults;
      }
      v38 = (NSString *)objc_msgSend(v4, "copy");
      input = self->_input;
      self->_input = v38;

      if (v10)
      {
LABEL_13:
        if (v10 != self->_zkwResults)
        {
          v40 = v4;
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSMutableArray count](v10, "count"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v10 = v10;
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v46;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v46 != v15)
                  objc_enumerationMutation(v10);
                v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                objc_msgSend(v17, "title");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "length");

                if (v19)
                {
                  objc_msgSend(v17, "title");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "addObject:", v20);

                }
              }
              v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
            }
            while (v14);
          }

          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v21 = self->_zkwResults;
          v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v42;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v42 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                objc_msgSend(v26, "title");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "length");

                if (v28)
                {
                  objc_msgSend(v26, "title");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v12, "containsObject:", v29);

                  if ((v30 & 1) == 0)
                    -[NSMutableArray addObject:](v10, "addObject:", v26);
                }
              }
              v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            }
            while (v23);
          }

          v4 = v40;
        }
      }
    }
  }
  else
  {
    if (self->_hideZKW)
      zkwResults = 0;
    else
      zkwResults = self->_zkwResults;
    v10 = zkwResults;
    if (-[NSString length](self->_input, "length"))
    {
      v31 = &self->_inputKeystrokes;
      do
        v32 = __ldaxr(v31);
      while (__stlxr(v32 + 1, v31));
    }
    v33 = self->_input;
    self->_input = (NSString *)&stru_1E462FA08;

  }
LABEL_41:
  objc_storeStrong((id *)&self->_couldHaveShown, v10);

  return v10;
}

- (id)_resultsMatching:(id)a3
{
  id v4;
  NSString *input;
  CKContextResponse *v6;
  id v7;
  __CFString *v8;
  NSString *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  NSDate *hideCompletionsAfterDate;
  double v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  NSString *v33;
  NSString *ignorePrefix;
  CKContextResponse *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  input = self->_input;
  self->_input = 0;

  v6 = self->_response;
  if (v6 && (unint64_t)objc_msgSend(v4, "length") <= 0xFF)
  {
    if (v4)
      v8 = (__CFString *)objc_msgSend(v4, "copy");
    else
      v8 = &stru_1E462FA08;
    v9 = self->_input;
    self->_input = &v8->isa;

    -[CKContextResponse results](v6, "results");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      normalizeForSearch(v4);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "length"))
      {
        if (self->_ignorePrefix && (objc_msgSend(v4, "hasPrefix:") & 1) != 0 || self->_hideCompletions)
        {
          v7 = 0;
        }
        else
        {
          hideCompletionsAfterDate = self->_hideCompletionsAfterDate;
          if (hideCompletionsAfterDate
            && (-[NSDate timeIntervalSinceNow](hideCompletionsAfterDate, "timeIntervalSinceNow"), v18 < 0.0))
          {
            v7 = 0;
            self->_hideCompletions = 1;
          }
          else
          {
            v37 = v4;
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count", v6));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = 0u;
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            v10 = v10;
            v40 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
            if (v40)
            {
              v39 = *(_QWORD *)v43;
              do
              {
                for (i = 0; i != v40; ++i)
                {
                  if (*(_QWORD *)v43 != v39)
                    objc_enumerationMutation(v10);
                  v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
                  objc_msgSend(v20, "title");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  normalizeForSearch(v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v22, "length"))
                  {
                    v23 = objc_msgSend(v22, "length");
                    if (v23)
                    {
                      v24 = v23;
                      v25 = 0;
                      v26 = 0;
                      v27 = v23;
                      do
                      {
                        v28 = objc_msgSend(v22, "rangeOfString:options:range:locale:", v41, 129, v25, v27, self->_searchLocale);
                        if (!v29)
                          break;
                        v30 = v28;
                        if (!v28)
                          goto LABEL_47;
                        v31 = objc_msgSend(v22, "characterAtIndex:", v28 - 1);
                        v26 |= v31 == 32;
                        if (v31 == 32)
                        {
                          v32 = 1;
                        }
                        else
                        {
                          v25 = v30 + 1;
                          v27 = v24 - (v30 + 1);
                          v32 = v30 + 1 >= v24;
                        }
                      }
                      while (!v32);
                      if ((v26 & 1) == 0)
                        goto LABEL_48;
LABEL_47:
                      objc_msgSend(v38, "addObject:", v20);
                    }
                  }
LABEL_48:

                }
                v40 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
              }
              while (v40);
            }

            if (objc_msgSend(v38, "count"))
            {
              v7 = v38;
              v4 = v37;
            }
            else
            {
              v4 = v37;
              v33 = (NSString *)objc_msgSend(v37, "copy");
              ignorePrefix = self->_ignorePrefix;
              self->_ignorePrefix = v33;

              v7 = 0;
            }
            v6 = v36;

          }
        }
      }
      else if (-[CKContextResponse resultsNeedFiltering](self->_response, "resultsNeedFiltering"))
      {
        v7 = (id)objc_opt_new();
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v10 = v10;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v47 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
              if (!objc_msgSend(v15, "minPrefix"))
                objc_msgSend(v7, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          }
          while (v12);
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v10);
          v16 = objc_claimAutoreleasedReturnValue();

          v10 = (id)v16;
        }
        v10 = v10;
        v7 = v10;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)resultsMatchingTags:(id)a3
{
  id v4;
  CKContextResponse *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  CKContextResponse *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_response;
  if (v5 && objc_msgSend(v4, "count"))
  {
    v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[CKContextResponse results](v5, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = v5;
    -[CKContextResponse results](v5, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v14, "tags");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            objc_msgSend(v14, "tags");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "intersectsSet:", v4);

            if (v18)
              objc_msgSend(v8, "addObject:", v14);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    v5 = v20;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)queriesMatching:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CKContextCompleter resultsMatching:](self, "resultsMatching:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
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
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "query", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length"))
            objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)logResultsShown:(unint64_t)a3 serverOverride:(BOOL)a4
{
  -[CKContextCompleter logResultsShown:serverOverride:forInput:](self, "logResultsShown:serverOverride:forInput:", a3, a4, self->_input);
}

- (void)logResultsShown:(unint64_t)a3 serverOverride:(BOOL)a4 forInput:(id)a5
{
  _BOOL8 v5;
  CKContextResponse *response;
  unint64_t v9;
  unint64_t v10;
  unint64_t v12;
  unint64_t v13;

  v5 = a4;
  response = self->_response;
  v9 = atomic_load(&self->_inputKeystrokes);
  v10 = objc_msgSend(a5, "length");
  if (v10 > 1 && v9 == 1)
    v12 = 0;
  else
    v12 = v9;
  if (v9 >= v10)
    v13 = v10;
  else
    v13 = v12;
  -[CKContextResponse markResultsShown:serverOverride:forInputLength:results:](response, "markResultsShown:serverOverride:forInputLength:results:", a3, v5, v13, self->_couldHaveShown);
}

- (void)logEngagement:(id)a3 forInput:(id)a4
{
  -[CKContextCompleter logEngagement:forInput:completion:](self, "logEngagement:forInput:completion:", a3, self->_input, a4);
}

- (void)logEngagement:(id)a3 forInput:(id)a4 completion:(id)a5
{
  CKContextResponse *response;
  unint64_t v9;
  id v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  id v15;

  atomic_store(1u, (unsigned __int8 *)&self->_engaged);
  response = self->_response;
  v9 = atomic_load(&self->_inputKeystrokes);
  v10 = a5;
  v15 = a3;
  v11 = objc_msgSend(a4, "length");
  if (v11 > 1 && v9 == 1)
    v13 = 0;
  else
    v13 = v9;
  if (v9 >= v11)
    v14 = v11;
  else
    v14 = v13;
  -[CKContextResponse logEngagement:forInputLength:completion:likelyUnsolicited:](response, "logEngagement:forInputLength:completion:likelyUnsolicited:", v15, v14, v10, self->_likelyUnsolicited);

}

- (void)logTransactionSuccessfulForInput:(id)a3
{
  -[CKContextCompleter logTransactionSuccessfulForInput:completion:](self, "logTransactionSuccessfulForInput:completion:", self->_input, a3);
}

- (void)logTransactionSuccessfulForInput:(id)a3 completion:(id)a4
{
  CKContextResponse *response;
  unint64_t v7;
  unint64_t v8;
  unint64_t v10;
  unint64_t v11;
  id v12;

  response = self->_response;
  v7 = atomic_load(&self->_inputKeystrokes);
  v12 = a4;
  v8 = objc_msgSend(a3, "length");
  if (v8 > 1 && v7 == 1)
    v10 = 0;
  else
    v10 = v7;
  if (v7 >= v8)
    v11 = v8;
  else
    v11 = v10;
  -[CKContextResponse logTransactionSuccessfulForInputLength:completion:likelyUnsolicited:](response, "logTransactionSuccessfulForInputLength:completion:likelyUnsolicited:", v11, v12, self->_likelyUnsolicited);

}

- (void)discard
{
  NSString *input;
  BOOL *p_discarded;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unint64_t v7;
  unint64_t v8;

  input = self->_input;
  self->_input = 0;

  p_discarded = &self->_discarded;
  do
    v5 = __ldaxr((unsigned __int8 *)p_discarded);
  while (__stlxr(1u, (unsigned __int8 *)p_discarded));
  if ((v5 & 1) == 0)
  {
    v6 = atomic_load((unsigned __int8 *)&self->_engaged);
    if ((v6 & 1) != 0
      || (v7 = atomic_load(&self->_inputKeystrokes)) != 0
      && (-[NSString length](self->_input, "length") || (v8 = atomic_load(&self->_inputKeystrokes), v8 != 1)))
    {
      -[CKContextResponse discardAndLogCompleter:likelyUnsolicited:](self->_response, "discardAndLogCompleter:likelyUnsolicited:", self, self->_likelyUnsolicited);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[CKContextCompleter discard](self, "discard");
  v3.receiver = self;
  v3.super_class = (Class)CKContextCompleter;
  -[CKContextCompleter dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zkwResults, 0);
  objc_storeStrong((id *)&self->_hideCompletionsAfterDate, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_couldHaveShown, 0);
  objc_storeStrong((id *)&self->_searchLocale, 0);
  objc_storeStrong((id *)&self->_ignorePrefix, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

- (void)initWithResponse:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = a1;
  _os_log_debug_impl(&dword_1A1AA2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "New CKContextCompleter for response %p", (uint8_t *)&v1, 0xCu);
}

@end
