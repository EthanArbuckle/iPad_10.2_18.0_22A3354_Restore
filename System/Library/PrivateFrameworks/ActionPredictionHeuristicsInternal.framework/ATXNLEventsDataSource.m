@implementation ATXNLEventsDataSource

- (ATXNLEventsDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXNLEventsDataSource *v6;
  ATXNLEventsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNLEventsDataSource;
  v6 = -[ATXNLEventsDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)nlEventsWithCallback:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D55A8) & 1) != 0)
  {
    -[ATXHeuristicDevice eventStore](self->_device, "eventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateForNaturalLanguageSuggestedEventsWithSearchString:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventsMatchingPredicate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_heuristic();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v25 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1C99DF000, v9, OS_LOG_TYPE_INFO, "Got %tu events from NL Events", buf, 0xCu);
    }

    if (objc_msgSend(v8, "count"))
    {
      v17 = v7;
      v18 = v6;
      v10 = (void *)objc_opt_new();
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            -[ATXHeuristicDevice dictForEvent:](self->_device, "dictForEvent:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15), v17, v18, (_QWORD)v19);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
              objc_msgSend(v10, "addObject:", v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v13);
      }

      v4[2](v4, v10, 0);
      v7 = v17;
      v6 = v18;
    }
    else
    {
      v4[2](v4, (void *)MEMORY[0x1E0C9AA60], 0);
    }

  }
  else
  {
    v4[2](v4, (void *)MEMORY[0x1E0C9AA60], 0);
  }

}

uint64_t __46__ATXNLEventsDataSource_nlEventsWithCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "localCustomObjectForKey:", CFSTR("EKEventNaturalLanguageSuggestedEventExpirationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localCustomObjectForKey:", CFSTR("EKEventNaturalLanguageSuggestedEventExpirationDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6 != 0;
    v9 = v7 != 0;
    if (v6 && v7)
    {
      v10 = objc_msgSend(v7, "compare:", v6);
      goto LABEL_20;
    }
  }
  else
  {

    v9 = 0;
    v7 = 0;
    v8 = v6 != 0;
  }
  if (v8)
    v10 = -1;
  else
    v10 = 1;
  if (!v8 && !v9)
  {
    objc_msgSend(v4, "creationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "creationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 && v12)
    {
      v10 = objc_msgSend(v12, "compare:", v11);
    }
    else if (v11)
    {
      v10 = -1;
    }
    else
    {
      v10 = v12 != 0;
    }

  }
LABEL_20:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
