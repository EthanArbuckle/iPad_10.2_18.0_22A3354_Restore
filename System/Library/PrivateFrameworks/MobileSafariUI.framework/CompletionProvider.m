@implementation CompletionProvider

- (CompletionProvider)init
{
  CompletionProvider *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *completionsByString;
  NSMutableArray *v5;
  NSMutableArray *completedStringsInPruneOrder;
  CompletionProvider *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CompletionProvider;
  v2 = -[CompletionProvider init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    completionsByString = v2->_completionsByString;
    v2->_completionsByString = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completedStringsInPruneOrder = v2->_completedStringsInPruneOrder;
    v2->_completedStringsInPruneOrder = v5;

    v7 = v2;
  }

  return v2;
}

- (id)completionsForQuery:(id)a3
{
  return -[CompletionProvider completionsForQuery:isCFSearch:](self, "completionsForQuery:isCFSearch:", a3, 0);
}

- (id)completionsForQuery:(id)a3 isCFSearch:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v4 = a4;
  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "length"))
    {
      -[CompletionProvider findCompletionsForKey:isCFSearch:](self, "findCompletionsForKey:isCFSearch:", v8, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        self->_inCompletionsForString = 1;
        v16[0] = CFSTR("time");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[1] = CFSTR("query");
        v17[0] = v13;
        v17[1] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[Application postTestNotificationName:object:userInfo:](Application, "postTestNotificationName:object:userInfo:", CFSTR("completionProviderDidStart"), self, v14);

        -[CompletionProvider setQueryToComplete:](self, "setQueryToComplete:", v6);
        self->_inCompletionsForString = 0;
        -[CompletionProvider findCompletionsForKey:isCFSearch:](self, "findCompletionsForKey:isCFSearch:", v8, v4);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)findCompletionsForKey:(id)a3 isCFSearch:(BOOL)a4
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_completionsByString, "objectForKeyedSubscript:", a3, a4);
}

- (void)_pruneCachedCompletions
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t i;
  void *v8;

  v3 = -[CompletionProvider maximumCachedCompletionCount](self, "maximumCachedCompletionCount");
  v4 = -[NSMutableDictionary count](self->_completionsByString, "count");
  v5 = v4 >= v3;
  v6 = v4 - v3;
  if (v5)
  {
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        -[NSMutableArray objectAtIndex:](self->_completedStringsInPruneOrder, "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](self->_completionsByString, "removeObjectForKey:", v8);

      }
    }
    -[NSMutableArray removeObjectsInRange:](self->_completedStringsInPruneOrder, "removeObjectsInRange:", 0, v6);
  }
}

- (void)clearCachedCompletions
{
  -[NSMutableDictionary removeAllObjects](self->_completionsByString, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_completedStringsInPruneOrder, "removeAllObjects");
}

- (void)setCompletions:(id)a3 forString:(id)a4
{
  -[CompletionProvider setCompletions:forString:isCFSearch:](self, "setCompletions:forString:isCFSearch:", a3, a4, 0);
}

- (void)setCompletions:(id)a3 forString:(id)a4 isCFSearch:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  _QWORD v16[2];
  _QWORD v17[3];

  v5 = a5;
  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(v9, "copy");
  if (!v5)
  {
    v16[0] = CFSTR("time");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = CFSTR("query");
    v17[0] = v11;
    v17[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[Application postTestNotificationName:object:userInfo:](Application, "postTestNotificationName:object:userInfo:", CFSTR("completionProviderDidFinish"), self, v12);

  }
  -[CompletionProvider getKeyForQueryString:isCFSearch:](self, "getKeyForQueryString:isCFSearch:", v10, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_completionsByString, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    -[NSMutableArray removeObject:](self->_completedStringsInPruneOrder, "removeObject:", v13);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_completionsByString, "setObject:forKeyedSubscript:", v8, v13);
  -[NSMutableArray addObject:](self->_completedStringsInPruneOrder, "addObject:", v13);
  -[CompletionProvider _pruneCachedCompletions](self, "_pruneCachedCompletions");
  if (!v5)
  {
    self->_failing = 0;
    if (!self->_inCompletionsForString)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "completionProvider:didFinishCompletingString:", self, v9);

    }
  }

}

- (void)fail
{
  id WeakRetained;

  if (!self->_failing)
  {
    self->_failing = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "completionProviderDidFail:", self);

  }
}

- (unint64_t)maximumCachedCompletionCount
{
  return 1;
}

- (id)getKeyForQueryString:(id)a3 isCFSearch:(BOOL)a4
{
  return a3;
}

- (CompletionProviderDelegate)delegate
{
  return (CompletionProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isFailing
{
  return self->_failing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_completedStringsInPruneOrder, 0);
  objc_storeStrong((id *)&self->_completionsByString, 0);
}

@end
