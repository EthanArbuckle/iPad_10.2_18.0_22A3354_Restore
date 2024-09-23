@implementation QuickWebsiteSearchCompletionProvider

- (void)setQueryToComplete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  QuickWebsiteSearchQuery *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  QuickWebsiteSearchCompletionProvider *v15;
  QuickWebsiteSearchQuery *v16;
  id v17;
  id v18;
  id location;

  v4 = a3;
  objc_msgSend(v4, "queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("DisableWebsiteSpecificSearch"));

  if (v7)
  {
    -[CompletionProvider setCompletions:forString:](self, "setCompletions:forString:", MEMORY[0x1E0C9AA60], v5);
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = -[QuickWebsiteSearchQuery initWithUserEnteredQuery:]([QuickWebsiteSearchQuery alloc], "initWithUserEnteredQuery:", v4);
    objc_msgSend(MEMORY[0x1E0D8AB58], "sharedController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[QuickWebsiteSearchQuery searchTerms](v8, "searchTerms");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      dispatch_get_global_queue(0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__QuickWebsiteSearchCompletionProvider_setQueryToComplete___block_invoke;
      block[3] = &unk_1E9CF6D20;
      v13 = v9;
      v14 = v5;
      v15 = self;
      v16 = v8;
      v17 = v4;
      objc_copyWeak(&v18, &location);
      dispatch_async(v11, block);

      objc_destroyWeak(&v18);
    }
    else
    {
      -[CompletionProvider setCompletions:forString:](self, "setCompletions:forString:", MEMORY[0x1E0C9AA60], v5);
    }

    objc_destroyWeak(&location);
  }

}

void __59__QuickWebsiteSearchCompletionProvider_setQueryToComplete___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentSearchEngineHostSuffixes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providersMatchingQueryString:excludingSearchEngineHostSuffixes:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__QuickWebsiteSearchCompletionProvider_setQueryToComplete___block_invoke_2;
  v14[3] = &unk_1E9CF6CF8;
  v15 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 64);
  objc_msgSend(v6, "safari_mapObjectsUsingBlock:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __59__QuickWebsiteSearchCompletionProvider_setQueryToComplete___block_invoke_3;
  block[3] = &unk_1E9CF4A90;
  objc_copyWeak(&v13, (id *)(a1 + 72));
  v11 = v8;
  v12 = *(id *)(a1 + 40);
  v9 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v13);
}

QuickWebsiteSearchCompletionItem *__59__QuickWebsiteSearchCompletionProvider_setQueryToComplete___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  QuickWebsiteSearchCompletionItem *v4;

  v3 = a2;
  v4 = -[QuickWebsiteSearchCompletionItem initWithProvider:query:forQueryID:]([QuickWebsiteSearchCompletionItem alloc], "initWithProvider:query:forQueryID:", v3, *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "queryID"));

  return v4;
}

void __59__QuickWebsiteSearchCompletionProvider_setQueryToComplete___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setCompletions:forString:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

@end
