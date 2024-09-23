@implementation ATXProactiveSuggestionFeedbackResultRouter

- (void)_initializeFeedbackListenersDictWith:(id)a3
{
  id v3;
  NSDictionary *v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  void *v13;
  NSDictionary *feedbackListeners;
  ATXProactiveSuggestionFeedbackResultRouter *v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v15 = self;
  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (NSDictionary *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v6, "clientModelIds", v15);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v20 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
              -[NSDictionary objectForKey:](v4, "objectForKey:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v13)
              {
                v13 = (void *)objc_opt_new();
                -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v13, v12);
              }
              objc_msgSend(v13, "addObject:", v6);

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v9);
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v18);
  }

  feedbackListeners = v15->_feedbackListeners;
  v15->_feedbackListeners = v4;

}

- (ATXProactiveSuggestionFeedbackResultRouter)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXProactiveSuggestionFeedbackResultRouter *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  +[ATXActionFeedback sharedInstance](ATXActionFeedback, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  +[ATXFallbackActionsFeedback sharedInstance](ATXFallbackActionsFeedback, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v5 = (void *)objc_opt_new();
  v10[2] = v5;
  v6 = (void *)objc_opt_new();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXProactiveSuggestionFeedbackResultRouter initWithFeedbackListeners:](self, "initWithFeedbackListeners:", v7);

  return v8;
}

- (ATXProactiveSuggestionFeedbackResultRouter)initWithFeedbackListeners:(id)a3
{
  id v4;
  ATXProactiveSuggestionFeedbackResultRouter *v5;
  ATXProactiveSuggestionFeedbackResultRouter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATXProactiveSuggestionFeedbackResultRouter;
  v5 = -[ATXProactiveSuggestionFeedbackResultRouter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ATXProactiveSuggestionFeedbackResultRouter _initializeFeedbackListenersDictWith:](v5, "_initializeFeedbackListenersDictWith:", v4);

  return v6;
}

- (id)clientModelIdsWithFeedbackListeners
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[NSDictionary allKeys](self->_feedbackListeners, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackListeners, 0);
}

- (void)handleNewFeedbackResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "clientCacheUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientModelId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKey:](self->_feedbackListeners, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "receiveUIFeedbackResult:", v4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

@end
