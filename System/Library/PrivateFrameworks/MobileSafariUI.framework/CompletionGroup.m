@implementation CompletionGroup

- (CompletionGroup)initWithTitle:(id)a3 completions:(id)a4 maximumNumberOfCompletions:(unint64_t)a5
{
  return -[CompletionGroup initWithTitle:completions:query:maximumNumberOfCompletions:](self, "initWithTitle:completions:query:maximumNumberOfCompletions:", a3, a4, 0, a5);
}

- (CompletionGroup)initWithTitle:(id)a3 completions:(id)a4 query:(id)a5 maximumNumberOfCompletions:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  CompletionGroup *v13;
  CompletionGroup *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *headerViewReuseIdentifier;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  CompletionGroup *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CompletionGroup;
  v13 = -[SFResultSection init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    -[SFResultSection setTitle:](v13, "setTitle:", v10);
    -[SFResultSection setMaxInitiallyVisibleResults:](v14, "setMaxInitiallyVisibleResults:", a6);
    -[CompletionGroup setCompletions:](v14, "setCompletions:", v11);
    -[NSArray firstObject](v14->_completions, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v15, "needsSectionHeader")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v15, "completionTableHeaderViewReuseIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      headerViewReuseIdentifier = v14->_headerViewReuseIdentifier;
      v14->_headerViewReuseIdentifier = (NSString *)v17;

    }
    objc_msgSend(v11, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sfSearchResultValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sectionBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v22 = WBS_LOG_CHANNEL_PREFIXParsec();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[CompletionGroup initWithTitle:completions:query:maximumNumberOfCompletions:].cold.1(v22);
    }
    -[SFResultSection setBundleIdentifier:](v14, "setBundleIdentifier:", v21);
    -[CompletionGroup setQuery:](v14, "setQuery:", v12);
    v23 = v14;

  }
  return v14;
}

- (id)headerView
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_completions, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "completionTableHeaderView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)configureHeaderView:(id)a3 forCompletionList:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[NSArray firstObject](self->_completions, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "configureCompletionTableHeaderView:forCompletionListGroup:", v6, self);

}

- (NSString)defaultHeaderTitle
{
  void *v3;
  void *v4;

  -[NSArray firstObject](self->_completions, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v3, "usesDefaultHeaderView"))
  {
    v4 = 0;
  }
  else
  {
    -[SFResultSection title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v4;
}

- (void)setCompletions:(id)a3
{
  NSArray *v4;
  unint64_t v5;
  NSArray *v6;
  NSArray *completions;
  void *v8;
  NSArray *v9;

  v4 = (NSArray *)a3;
  if (self->_completions != v4)
  {
    v9 = v4;
    v5 = -[SFResultSection maxInitiallyVisibleResults](self, "maxInitiallyVisibleResults");
    if (v5 && v5 < -[NSArray count](v9, "count"))
    {
      -[NSArray subarrayWithRange:](v9, "subarrayWithRange:", 0, -[SFResultSection maxInitiallyVisibleResults](self, "maxInitiallyVisibleResults"));
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (NSArray *)-[NSArray copy](v9, "copy");
    }
    completions = self->_completions;
    self->_completions = v6;

    -[NSArray safari_mapObjectsUsingBlock:](self->_completions, "safari_mapObjectsUsingBlock:", &__block_literal_global_15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResultSection setResults:](self, "setResults:", v8);

    v4 = v9;
  }

}

uint64_t __34__CompletionGroup_setCompletions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sfSearchResultValue");
}

- (void)setQuery:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_query, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[CompletionGroup completions](self, "completions", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "setQuery:", v5);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (WBSCompletionQuery)query
{
  return self->_query;
}

- (NSString)headerViewReuseIdentifier
{
  return self->_headerViewReuseIdentifier;
}

- (NSArray)completions
{
  return self->_completions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_headerViewReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (void)initWithTitle:(os_log_t)log completions:query:maximumNumberOfCompletions:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_ERROR, "Result had no bundle identifier", v1, 2u);
}

@end
