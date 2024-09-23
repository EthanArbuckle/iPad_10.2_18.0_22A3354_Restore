@implementation SUUICompletionList

- (SUUICompletionList)initWithCompletionListDictionary:(id)a3
{
  id v4;
  SUUICompletionList *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SUUICompletion *v15;
  NSArray *completions;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SUUICompletionList;
  v5 = -[SUUICompletionList init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_title, v6);
    objc_msgSend(v4, "objectForKey:", CFSTR("hints"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v18 = v7;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[SUUICompletion initWithCompletionDictionary:]([SUUICompletion alloc], "initWithCompletionDictionary:", v14);
              -[NSArray addObject:](v8, "addObject:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v11);
      }

      completions = v5->_completions;
      v5->_completions = v8;

      v7 = v18;
    }

  }
  return v5;
}

- (SUUICompletionList)initWithCacheRepresentation:(id)a3
{
  id v4;
  SUUICompletionList *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  objc_class *v10;
  uint64_t v11;
  NSArray *completions;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)SUUICompletionList;
    v5 = -[SUUICompletionList init](&v14, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("title"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(v6, "copy");
        title = v5->_title;
        v5->_title = (NSString *)v7;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("completions"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (objc_class *)objc_opt_class();
        SUUICacheCodingDecodeArray(v9, v10);
        v11 = objc_claimAutoreleasedReturnValue();
        completions = v5->_completions;
        v5->_completions = (NSArray *)v11;

      }
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  void *v3;
  NSArray *completions;
  void *v5;
  NSString *title;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  completions = self->_completions;
  if (completions)
  {
    SUUICacheCodingEncodeArray(completions);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("completions"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  return (NSMutableDictionary *)v3;
}

- (NSArray)completions
{
  return self->_completions;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

@end
