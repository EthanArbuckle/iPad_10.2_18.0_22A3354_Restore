@implementation SGSuggestionPresenter

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SGSuggestionPresenter;
  -[SGSuggestionPresenter dealloc](&v4, sel_dealloc);
}

- (SGSuggestionPresenter)init
{
  SGSuggestionPresenter *v2;
  uint64_t v3;
  SGSuggestionStore *suggestionStore;
  uint64_t v5;
  NSMutableArray *filteredSuggestions;
  uint64_t v7;
  SGSuggestionCategoryList *suggestionCategoryList;
  EKICSPreviewController *icsPreviewController;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SGSuggestionPresenter;
  v2 = -[SGSuggestionPresenter init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    suggestionStore = v2->_suggestionStore;
    v2->_suggestionStore = (SGSuggestionStore *)v3;

    -[SGSuggestionStore setSuggestionDelegate:](v2->_suggestionStore, "setSuggestionDelegate:", v2);
    v5 = objc_opt_new();
    filteredSuggestions = v2->_filteredSuggestions;
    v2->_filteredSuggestions = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    suggestionCategoryList = v2->_suggestionCategoryList;
    v2->_suggestionCategoryList = (SGSuggestionCategoryList *)v7;

    v2->_currentSuggestionsCount = 0;
    v2->_forceUpdate = 0;
    icsPreviewController = v2->_icsPreviewController;
    v2->_icsPreviewController = 0;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__listDidChangeNotification_, CFSTR("com.apple.coresuggestionsui.SGListDidChangeNotification"), 0);

  }
  return v2;
}

- (id)suggestionStore
{
  return self->_suggestionStore;
}

- (void)_listDidChangeNotification:(id)a3
{
  SGSuggestionStore *v4;
  SGSuggestionStore *v5;
  SGSuggestionStore *suggestionStore;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SGBannerProtocol *banner;
  void *v15;
  void *v16;
  SGBannerProtocol *v17;
  void *v18;
  uint64_t v19;
  unint64_t currentSuggestionsCount;
  void *v21;
  SGBannerProtocol *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  objc_msgSend(v26, "object");
  v4 = (SGSuggestionStore *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  suggestionStore = self->_suggestionStore;
  if (v4 == suggestionStore)
  {

    v9 = v26;
  }
  else
  {
    objc_msgSend(v26, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SGList indexOfItem:](suggestionStore, "indexOfItem:", v7);

    v9 = v26;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_21;
  }
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SGListNotificationKeyItemUpdated"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[SGSuggestionPresenter reloadSuggestionsFromSearchableItems](self, "reloadSuggestionsFromSearchableItems");
  objc_msgSend(v26, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SGListNotificationKeyItemAdded"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (-[SGList count](self->_suggestionStore, "count") == 1)
    {
      banner = self->_banner;
      if (banner)
        -[SGBannerProtocol invalidateBannerView](banner, "invalidateBannerView");
    }
    -[SGSuggestionPresenter _filterSuggestions](self, "_filterSuggestions");
  }
  objc_msgSend(v26, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SGListNotificationKeyItemRemoved"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SGSuggestionPresenter _restoreSuggestions](self, "_restoreSuggestions");
    if (-[SGList count](self->_suggestionStore, "count"))
    {
      -[SGSuggestionPresenter reloadSuggestionsFromSearchableItems](self, "reloadSuggestionsFromSearchableItems");
      if (-[SGList count](self->_suggestionStore, "count") == 1)
      {
        v17 = self->_banner;
        if (v17)
          -[SGBannerProtocol invalidateBannerView](v17, "invalidateBannerView");
      }
    }
  }
  -[SGSuggestionStore suggestions](self->_suggestionStore, "suggestions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  currentSuggestionsCount = self->_currentSuggestionsCount;

  if (v19 != currentSuggestionsCount)
  {
    -[SGSuggestionStore suggestions](self->_suggestionStore, "suggestions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    self->_currentSuggestionsCount = objc_msgSend(v21, "count");

    self->_forceUpdate = 1;
    v22 = self->_banner;
    if (v22)
      -[SGBannerProtocol invalidateBannerView](v22, "invalidateBannerView");
  }
  -[SGSuggestionPresenter _updateBanner](self, "_updateBanner");
  v9 = v26;
LABEL_21:
  objc_msgSend(v9, "object");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {

  }
  else
  {
    objc_msgSend(v26, "userInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("SGListNotificationKeyChangedReorientation"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25 && -[SGList count](self->_suggestionStore, "count"))
    {
      self->_forceUpdate = 1;
      -[SGSuggestionPresenter _updateBanner](self, "_updateBanner");
    }
  }

}

- (NSArray)suggestions
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__933;
  v9 = __Block_byref_object_dispose__934;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__SGSuggestionPresenter_suggestions__block_invoke;
  v4[3] = &unk_1E62D7058;
  v4[4] = self;
  v4[5] = &v5;
  runOnMainThreadSync(v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (void)setSuggestions:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__SGSuggestionPresenter_setSuggestions___block_invoke;
    v5[3] = &unk_1E62D7080;
    v5[4] = self;
    v6 = v4;
    runOnMainThread(v5);

  }
  else
  {
    -[SGList removeAllItems](self->_suggestionStore, "removeAllItems");
  }

}

- (void)addSuggestion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__SGSuggestionPresenter_addSuggestion___block_invoke;
  v6[3] = &unk_1E62D7080;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  runOnMainThread(v6);

}

- (void)removeSuggestion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__SGSuggestionPresenter_removeSuggestion___block_invoke;
  v6[3] = &unk_1E62D7080;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  runOnMainThread(v6);

}

- (SGBannerProtocol)banner
{
  SGBannerProtocol *banner;
  SGBannerProtocol *v4;
  SGBannerProtocol *v5;

  banner = self->_banner;
  if (!banner)
  {
    v4 = (SGBannerProtocol *)objc_opt_new();
    v5 = self->_banner;
    self->_banner = v4;

    banner = self->_banner;
  }
  return banner;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    v6 = objc_storeWeak((id *)&self->_delegate, v4);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "suggestionCategoryComparatorForManager:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __37__SGSuggestionPresenter_setDelegate___block_invoke;
      aBlock[3] = &unk_1E62D70A8;
      v13 = v9;
      v10 = v9;
      v11 = _Block_copy(aBlock);

    }
    else
    {
      v11 = 0;
    }
    -[SGList setComparator:](self->_suggestionStore, "setComparator:", v11);

  }
}

- (void)setWantsToShowBanner:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  id WeakRetained;
  char v8;
  id v9;
  dispatch_time_t v10;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("No");
    if (v3)
      v6 = CFSTR("Yes");
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_1B1170000, v5, OS_LOG_TYPE_DEFAULT, "SGSuggestionPresenter - Show banner: (%{public}@)", buf, 0xCu);
  }

  if (self->_wantsToShowBanner != v3 || self->_forceUpdate)
  {
    self->_wantsToShowBanner = v3;
    if (v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        v9 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v9, "suggestionPresenterWantsToShowBanner:", self);

      }
    }
    else
    {
      v10 = dispatch_time(0, 200000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__SGSuggestionPresenter_setWantsToShowBanner___block_invoke;
      block[3] = &unk_1E62D70D0;
      block[4] = self;
      dispatch_after(v10, MEMORY[0x1E0C80D38], block);
    }
    self->_forceUpdate = 0;
  }
}

- (void)_bannerPrimaryAction
{
  SGSuggestionAction *bannerPrimaryAction;

  bannerPrimaryAction = self->_bannerPrimaryAction;
  if (bannerPrimaryAction)
    -[SGSuggestionAction execute](bannerPrimaryAction, "execute");
}

- (void)suggestionBatchDismissal
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[SGSuggestionPresenter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SGSuggestionPresenter suggestions](self, "suggestions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1B1170000, v6, OS_LOG_TYPE_DEFAULT, "SGSuggestionPresenter: Delegate method called to dismiss all suggestions (Suggestions to dismiss: %lu)", (uint8_t *)&v8, 0xCu);
    }

    -[SGSuggestionPresenter delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suggestionPresenterDismissAllSuggestions:", v5);

  }
}

- (void)dismissAllSuggestions
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__SGSuggestionPresenter_dismissAllSuggestions__block_invoke;
  v2[3] = &unk_1E62D70D0;
  v2[4] = self;
  runOnMainThread(v2);
}

- (id)tableViewController
{
  _TtC17CoreSuggestionsUI27SGSuggestionTableController *v3;
  SGSuggestionStore *suggestionStore;
  void *v5;
  _TtC17CoreSuggestionsUI27SGSuggestionTableController *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = [_TtC17CoreSuggestionsUI27SGSuggestionTableController alloc];
  suggestionStore = self->_suggestionStore;
  -[SGSuggestionPresenter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGSuggestionTableController initWithStore:delegate:suggestionPresenter:suggestionList:](v3, "initWithStore:delegate:suggestionPresenter:suggestionList:", suggestionStore, v5, self, self->_suggestionCategoryList);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  objc_msgSend(v7, "setModalPresentationStyle:", 7);
  objc_storeStrong((id *)&self->_presentedViewController, v7);

  return v7;
}

- (void)_bannerDismiss
{
  -[SGSuggestionAction execute](self->_bannerDismissAction, "execute");
}

- (void)reloadSuggestionsFromSearchableItems
{
  void *v3;
  char v4;
  id v5;

  -[SGSuggestionPresenter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SGSuggestionPresenter delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadSuggestionsFromSearchableItems");

  }
}

- (void)_removeBanner
{
  SGSuggestionPresenterDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "suggestionPresenterWantsToHideBanner:", self);

  }
}

- (void)_filterSuggestions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!-[SGSuggestionStore hostApp](self->_suggestionStore, "hostApp"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[SGList items](self->_suggestionStore, "items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (!v4)
    {
LABEL_23:

      return;
    }
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "count"))
          ++v6;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);

    if (v6 >= 2)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[SGSuggestionStore suggestions](self->_suggestionStore, "suggestions", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          for (j = 0; j != v10; ++j)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v3);
            v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
            objc_msgSend(v13, "suggestionCategory");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "suggestionCategoryId");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SuggestionsCategorySubscriptions"), &stru_1E62D74E0, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17 && (objc_msgSend(v15, "isEqualToString:", v17) & 1) != 0
              || objc_msgSend(v15, "isEqualToString:", CFSTR("Subscriptions")))
            {
              -[SGSuggestionPresenter _removeBanner](self, "_removeBanner");
              -[SGSuggestionPresenter setWantsToShowBanner:](self, "setWantsToShowBanner:", 0);
              -[SGSuggestionPresenter removeSuggestion:](self, "removeSuggestion:", v13);
            }

          }
          v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v10);
      }
      goto LABEL_23;
    }
  }
}

- (void)_restoreSuggestions
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!-[SGSuggestionStore hostApp](self->_suggestionStore, "hostApp")
    && !-[SGList count](self->_suggestionStore, "count")
    && -[NSMutableArray count](self->_filteredSuggestions, "count"))
  {
    -[SGSuggestionPresenter _removeBanner](self, "_removeBanner");
    -[SGSuggestionPresenter setWantsToShowBanner:](self, "setWantsToShowBanner:", 0);
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = self->_filteredSuggestions;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          -[SGSuggestionPresenter addSuggestion:](self, "addSuggestion:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    -[NSMutableArray removeAllObjects](self->_filteredSuggestions, "removeAllObjects");
  }
}

- (id)_sortSuggestionByCategoryUsing:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  for (i = 0; i != 5; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);

    }
  }

  return v4;
}

- (int64_t)_bannerAccessoryType
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SGSuggestionStore suggestions](self->_suggestionStore, "suggestions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "suggestionCategory");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "suggestionCategoryId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.suggestions.SGEventSuggestion")))
        {
          getRealtimeSuggestion(v7);
          v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_16;
          v10 = v10;
          if (objc_msgSend(v10, "state") != 4 && objc_msgSend(v10, "state") != 5)
          {

LABEL_16:
LABEL_17:

            v11 = 1;
            goto LABEL_18;
          }

        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CKCollaborationNoticeSuggestion")) & 1) != 0)
        {
          goto LABEL_17;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (void)_updateBanner
{
  void *v3;
  uint64_t v4;
  SGSuggestionAction *bannerPrimaryAction;
  SGSuggestionAction *bannerDismissAction;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  uint64_t v81;
  SGSuggestionAction *v82;
  uint64_t v83;
  SGSuggestionAction *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  SGSuggestionCategoryList *suggestionCategoryList;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  char v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  uint64_t v127;
  void *v128;
  SGSuggestionPresenter *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _QWORD v138[2];
  _QWORD v139[2];
  uint64_t v140;
  _BYTE v141[128];
  _QWORD v142[2];
  _QWORD v143[2];
  _BYTE v144[128];
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint8_t buf[4];
  uint64_t v149;
  __int16 v150;
  _BOOL4 v151;
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  bannerPrimaryAction = self->_bannerPrimaryAction;
  self->_bannerPrimaryAction = 0;

  bannerDismissAction = self->_bannerDismissAction;
  self->_bannerDismissAction = 0;

  if (-[SGList count](self->_suggestionStore, "count"))
  {
    v7 = 0;
    v8 = 0;
    do
    {
      -[SGList objectAtIndexedSubscript:](self->_suggestionStore, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10)
        ++v8;
      ++v7;
    }
    while (v7 < -[SGList count](self->_suggestionStore, "count"));
  }
  else
  {
    v8 = 0;
  }
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    v149 = v8;
    v150 = 1024;
    v151 = v4 == 6;
    _os_log_impl(&dword_1B1170000, v11, OS_LOG_TYPE_DEFAULT, "SGSuggestionPresenter - Banner update initiated with %{public}lu item(s) Banner For Vision: %{BOOL}d", buf, 0x12u);
  }

  -[SGSuggestionPresenter banner](self, "banner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSuggestionStore:", self->_suggestionStore);
  if (!v8)
    goto LABEL_169;
  v121 = v12;
  v129 = self;
  if (v8 != 1)
  {
    v19 = (void *)objc_opt_new();
    v20 = objc_opt_new();
    v21 = objc_opt_new();
    if (-[SGList count](self->_suggestionStore, "count"))
    {
      v119 = (void *)v21;
      v122 = (void *)v20;
      v124 = 0;
      v22 = 0;
      v125 = 0;
      v127 = 0;
      v23 = 5;
      do
      {
        -[SGList objectAtIndexedSubscript:](self->_suggestionStore, "objectAtIndexedSubscript:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "items");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[SGList objectAtIndexedSubscript:](self->_suggestionStore, "objectAtIndexedSubscript:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "category");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "suggestionCategoryTitle");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v19;
        objc_msgSend(v19, "addObject:", v28);

        objc_msgSend(v27, "suggestionCategoryId");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = &unk_1E62DD760;
        if ((objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.suggestions.SGContactSuggestion")) & 1) == 0)
        {
          v31 = &unk_1E62DD778;
          if ((objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.suggestions.SGEventSuggestion")) & 1) == 0)
          {
            v31 = &unk_1E62DD790;
            if ((objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.suggestions.SGReminderSuggestion")) & 1) == 0)
            {
              v31 = &unk_1E62DD7A8;
              if ((objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.suggestions.SGRadarSuggestion")) & 1) == 0)
              {
                sgLogHandle();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_debug_impl(&dword_1B1170000, v32, OS_LOG_TYPE_DEBUG, "SGSuggestionPresenter: Encountered unknown suggestion type while determining banner subtitle", buf, 2u);
                }

                v31 = &unk_1E62DD748;
              }
            }
          }
        }
        if ((objc_msgSend(v31, "isEqual:", &unk_1E62DD748) & 1) == 0)
        {
          objc_msgSend(v27, "suggestionCategoryLocalizedCountOfItems:", v25);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "setObject:forKeyedSubscript:", v33, v31);

          objc_msgSend(v27, "suggestionCategoryImage");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
            objc_msgSend(v119, "setObject:forKeyedSubscript:", v34, v31);
          if ((objc_opt_respondsToSelector() & 1) != 0 && !v127)
          {
            objc_msgSend(v27, "suggestionCategoryBackgroundVisualEffectView");
            v127 = objc_claimAutoreleasedReturnValue();
          }
          v35 = 0;
          if ((objc_opt_respondsToSelector() & 1) != 0 && v23 == 5)
            v35 = objc_msgSend(v27, "suggestionCategoryActionButtonType");
          if ((objc_opt_respondsToSelector() & 1) != 0 && !v125)
          {
            objc_msgSend(v27, "suggestionCategoryBackgroundColor");
            v125 = objc_claimAutoreleasedReturnValue();
          }
          if ((objc_opt_respondsToSelector() & 1) != 0 && !v124)
          {
            objc_msgSend(v27, "suggestionCategoryDivider");
            v124 = objc_claimAutoreleasedReturnValue();
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v36 = objc_msgSend(v27, "suggestionCategorySupportsBatchDismissal");
          else
            v36 = 0;
          objc_msgSend(v12, "setSuggestionCategorySupportsBatchDismissal:", v36);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && (objc_msgSend(v27, "suggestionCategoryIconSFSymbol"), (v37 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v38 = (void *)v37;
            v138[0] = v37;
            v138[1] = v37;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 2);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "setIconSFSymbols:", v39);

            v12 = v121;
          }
          else
          {
            objc_msgSend(v12, "setIconSFSymbols:", 0);
          }

          v23 = v35;
        }

        ++v22;
        self = v129;
        v19 = v29;
      }
      while (v22 < -[SGList count](v129->_suggestionStore, "count"));
      if (v125)
        objc_msgSend(v12, "setBackgroundColor:", v125);
      if (v124)
        objc_msgSend(v12, "setBannerDivider:", v124);
      v20 = (uint64_t)v122;
      if (v127)
        objc_msgSend(v12, "setBackgroundVisualEffectView:", v127);
      else
        v127 = 0;
      v21 = (uint64_t)v119;
    }
    else
    {
      v125 = 0;
      v127 = 0;
      v124 = 0;
      v23 = 5;
    }
    -[SGSuggestionPresenter _sortSuggestionByCategoryUsing:](v129, "_sortSuggestionByCategoryUsing:", v21);
    v45 = (void *)v21;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImages:", v46);

    -[SGSuggestionPresenter formatMixedCategoriesTitle:](v129, "formatMixedCategoriesTitle:", v19);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v47);

    objc_msgSend(v12, "setAttributedSubtitle:", 0);
    -[SGSuggestionPresenter _sortSuggestionByCategoryUsing:](v129, "_sortSuggestionByCategoryUsing:", v20);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSuggestionPresenter formatMixedCategoriesSubtitle:](v129, "formatMixedCategoriesSubtitle:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSubtitle:", v49);

    objc_msgSend(v12, "setActionButtonType:", v23);
    objc_msgSend(v12, "setAccessoryType:", 1);
    -[SGList objectAtIndexedSubscript:](v129->_suggestionStore, "objectAtIndexedSubscript:", 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "items");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "firstObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "suggestionDelegate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "setDelegate:", v53);

    v12 = v121;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("SuggestionsBannerButtonReview"), &stru_1E62D74E0, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "setActionTitle:", v55);

    v56 = (void *)v20;
    v57 = v45;
    objc_msgSend(v121, "setSuggestion:", 0);
    v58 = (id)v124;
    v13 = (void *)v125;
    v59 = (void *)v127;
    goto LABEL_168;
  }
  -[SGList objectAtIndexedSubscript:](self->_suggestionStore, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    if (objc_msgSend(v13, "count") == 1)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v14, "suggestionBackgroundVisualEffectView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v12, "setBackgroundVisualEffectView:", v15);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v14, "suggestionBackgroundColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setBackgroundColor:", v16);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v14, "suggestionDivider");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v12, "setBannerDivider:", v17);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v12, "setActionButtonType:", objc_msgSend(v14, "suggestionActionButtonType"));
        v18 = objc_msgSend(v12, "actionButtonType");
        if (v4 != 6)
        {
LABEL_98:
          if (v18)
          {
LABEL_99:
            objc_msgSend(v12, "setImages:", 0);
            goto LABEL_102;
          }
LABEL_80:
          suggestionImage(v14);
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = (void *)v60;
          if (v60)
          {
            v147 = v60;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v147, 1);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setImages:", v62);

          }
          else
          {
            objc_msgSend(v12, "setImages:", 0);
          }

LABEL_102:
          suggestionImageSGView(v14);
          v76 = objc_claimAutoreleasedReturnValue();
          v59 = (void *)v76;
          if (v76)
          {
            v146 = v76;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v146, 1);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setImageSGViews:", v77);

          }
          else
          {
            objc_msgSend(v12, "setImageSGViews:", 0);
          }
          objc_msgSend(v14, "suggestionTitle");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setTitle:", v78);

          v58 = v14;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v58, "suggestionAttributedSubtitle");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              objc_msgSend(v12, "setAttributedSubtitle:", v19);
LABEL_113:
              objc_msgSend(v58, "suggestionPrimaryAction");
              v81 = objc_claimAutoreleasedReturnValue();
              v82 = v129->_bannerPrimaryAction;
              v129->_bannerPrimaryAction = (SGSuggestionAction *)v81;

              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v58, "suggestionDismissAction");
                v83 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v83 = 0;
              }
              v84 = v129->_bannerDismissAction;
              v129->_bannerDismissAction = (SGSuggestionAction *)v83;

              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v12, "setProminentActionButton:", objc_msgSend(v58, "suggestionProminentActionButton"));
              if ((objc_opt_respondsToSelector() & 1) != 0
                && (objc_msgSend(v58, "suggestionIconSFSymbol"), (v85 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v56 = (void *)v85;
                v145 = v85;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v145, 1);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setIconSFSymbols:", v86);

              }
              else
              {
                objc_msgSend(v12, "setIconSFSymbols:", 0);
                v56 = 0;
              }
              -[SGSuggestionAction title](v129->_bannerPrimaryAction, "title");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setActionTitle:", v87);

              objc_msgSend(v12, "setAccessoryType:", v129->_bannerDismissAction != 0);
              objc_msgSend(v12, "setSuggestion:", v58);
              objc_msgSend(v58, "suggestionDelegate");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setDelegate:", v57);
LABEL_168:

              self = v129;
LABEL_169:
              objc_msgSend(v12, "reload");
              -[SGSuggestionPresenter setWantsToShowBanner:](self, "setWantsToShowBanner:", v8 != 0);
              goto LABEL_170;
            }
          }
          else
          {

          }
          v79 = v58;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v79, "suggestionSubtitle");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v80 = 0;
          }

          objc_msgSend(v12, "setSubtitle:", v80);
          v19 = 0;
          goto LABEL_113;
        }
      }
      else
      {
        if (v4 != 6)
        {
          objc_msgSend(v12, "setActionButtonType:", 1);
          v18 = objc_msgSend(v12, "actionButtonType");
          goto LABEL_98;
        }
        objc_msgSend(v12, "setActionButtonType:", 2);
        objc_msgSend(v12, "actionButtonType");
      }
      if (objc_msgSend(v12, "actionButtonType")
        && objc_msgSend(v12, "actionButtonType") != 3
        && objc_msgSend(v12, "actionButtonType") != 4)
      {
        goto LABEL_99;
      }
      goto LABEL_80;
    }
    objc_msgSend(v13, "items");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "category");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_opt_new();
    v123 = objc_opt_new();
    v128 = v41;
    v43 = (void *)v42;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v126 = objc_msgSend(v41, "suggestionCategoryCoalesceImages");
      if (v126)
        v44 = 1;
      else
        v44 = 2;
    }
    else
    {
      LOBYTE(v126) = 0;
      v44 = 2;
    }
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    v63 = v40;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v134, v144, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v135;
LABEL_85:
      v67 = 0;
      while (1)
      {
        if (*(_QWORD *)v135 != v66)
          objc_enumerationMutation(v63);
        v68 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v67);
        if (objc_msgSend(v43, "count") == v44)
          break;
        suggestionImage(v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (v69)
          objc_msgSend(v43, "addObject:", v69);

        if (v65 == ++v67)
        {
          v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v134, v144, 16);
          if (v65)
            goto LABEL_85;
          break;
        }
      }
    }

    v19 = v43;
    if (objc_msgSend(v43, "count") >= v44)
    {
      v75 = v121;
      objc_msgSend(v121, "setImages:", v43);
      v70 = v128;
      v73 = (void *)v123;
    }
    else
    {
      v70 = v128;
      objc_msgSend(v128, "suggestionCategoryImage");
      v71 = objc_claimAutoreleasedReturnValue();
      v72 = (void *)v71;
      v73 = (void *)v123;
      if (v71)
      {
        v143[0] = v71;
        v143[1] = v71;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 2);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "setImages:", v74);

        v75 = v121;
        v70 = v128;
      }
      else
      {
        v75 = v121;
        objc_msgSend(v121, "setImages:", 0);
      }

    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v70, "suggestionCategoryIconSFSymbol"), (v88 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v142[0] = v88;
      v142[1] = v88;
      v120 = (void *)v88;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 2);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setIconSFSymbols:", v89);

    }
    else
    {
      objc_msgSend(v75, "setIconSFSymbols:", 0);
      v120 = 0;
    }
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    v90 = v63;
    v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v130, v141, 16);
    if (v91)
    {
      v92 = v91;
      v93 = *(_QWORD *)v131;
LABEL_131:
      v94 = 0;
      while (1)
      {
        if (*(_QWORD *)v131 != v93)
          objc_enumerationMutation(v90);
        v95 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * v94);
        if (objc_msgSend(v73, "count") == v44)
          break;
        suggestionImageSGView(v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        if (v96)
          objc_msgSend(v73, "addObject:", v96);

        if (v92 == ++v94)
        {
          v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v130, v141, 16);
          if (v92)
            goto LABEL_131;
          break;
        }
      }
    }
    v58 = v90;

    if (objc_msgSend(v73, "count") >= v44)
    {
      v12 = v121;
      objc_msgSend(v121, "setImageSGViews:", v73);
      v97 = v128;
      goto LABEL_149;
    }
    v97 = v128;
    v12 = v121;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v128, "suggestionCategoryImageSGView");
      v98 = objc_claimAutoreleasedReturnValue();
      v99 = (void *)v98;
      if ((v126 & 1) != 0)
      {
        if (v98)
        {
          v140 = v98;
          v100 = (void *)MEMORY[0x1E0C99D20];
          v101 = &v140;
          v102 = 1;
LABEL_148:
          objc_msgSend(v100, "arrayWithObjects:count:", v101, v102);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "setImageSGViews:", v103);

LABEL_149:
          objc_msgSend(v13, "list");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          if (v104 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            suggestionCategoryList = v129->_suggestionCategoryList;
            objc_msgSend(v104, "suggestionListTitle");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGSuggestionCategoryList setListTitle:](suggestionCategoryList, "setListTitle:", v106);

          }
          objc_msgSend(v97, "suggestionCategoryTitleForItems:", v58);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setTitle:", v107);

          objc_msgSend(v12, "setAttributedSubtitle:", 0);
          objc_msgSend(v97, "suggestionCategorySubtitleForItems:", v58);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setSubtitle:", v108);

          objc_msgSend(v12, "setAccessoryType:", -[SGSuggestionPresenter _bannerAccessoryType](v129, "_bannerAccessoryType"));
          objc_msgSend(v58, "firstObject");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "suggestionDelegate");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setDelegate:", v110);

          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "localizedStringForKey:value:table:", CFSTR("SuggestionsBannerButtonReview"), &stru_1E62D74E0, 0);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setActionTitle:", v112);

          v59 = v97;
          objc_msgSend(v12, "setSuggestion:", 0);
          v113 = objc_opt_respondsToSelector();
          v114 = 0;
          if ((v113 & 1) != 0)
            v114 = objc_msgSend(v97, "suggestionCategoryActionButtonType", 0);
          objc_msgSend(v12, "setActionButtonType:", v114);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v97, "suggestionCategoryBackgroundVisualEffectView");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            if (v115)
              objc_msgSend(v12, "setBackgroundVisualEffectView:", v115);

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v97, "suggestionCategoryBackgroundColor");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setBackgroundColor:", v116);

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v97, "suggestionCategoryDivider");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            if (v117)
              objc_msgSend(v12, "setBannerDivider:", v117);

          }
          v56 = (void *)v123;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v118 = objc_msgSend(v97, "suggestionCategorySupportsBatchDismissal");
          else
            v118 = 0;
          objc_msgSend(v12, "setSuggestionCategorySupportsBatchDismissal:", v118);

          v57 = v120;
          goto LABEL_168;
        }
      }
      else if (v98)
      {
        v139[0] = v98;
        v139[1] = v98;
        v100 = (void *)MEMORY[0x1E0C99D20];
        v101 = v139;
        v102 = 2;
        goto LABEL_148;
      }
    }
    objc_msgSend(v121, "setImageSGViews:", 0);
    goto LABEL_149;
  }

LABEL_170:
}

- (id)formatMixedCategoriesTitle:(id)a3
{
  return +[SGSuggestionPresenter formatList:](SGSuggestionPresenter, "formatList:", a3);
}

- (id)formatMixedCategoriesSubtitle:(id)a3
{
  return +[SGSuggestionPresenter formatList:](SGSuggestionPresenter, "formatList:", a3);
}

- (void)presentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_suggestionViewControllerPresenter)
  {
    objc_msgSend((id)_suggestionViewControllerPresenter, "presentViewController:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SGSuggestionPresenter _presentedControllerCancelButtonItem](self, "_presentedControllerCancelButtonItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLeftBarButtonItems:", v6);

    }
    -[SGSuggestionPresenter _presentModalViewControllerFromButton:](self, "_presentModalViewControllerFromButton:", v4);
  }

}

- (id)icsPreviewControllerForData:(id)a3 andEventStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  EKICSPreviewController *v10;
  EKICSPreviewController *icsPreviewController;
  EKICSPreviewController *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v8 = (void *)getEKICSPreviewControllerClass_softClass;
  v18 = getEKICSPreviewControllerClass_softClass;
  if (!getEKICSPreviewControllerClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getEKICSPreviewControllerClass_block_invoke;
    v14[3] = &unk_1E62D7128;
    v14[4] = &v15;
    __getEKICSPreviewControllerClass_block_invoke((uint64_t)v14);
    v8 = (void *)v16[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v15, 8);
  v10 = (EKICSPreviewController *)objc_msgSend([v9 alloc], "initWithData:eventStore:", v6, v7);
  icsPreviewController = self->_icsPreviewController;
  self->_icsPreviewController = v10;

  v12 = self->_icsPreviewController;
  return v12;
}

- (void)dismissICSPreviewController:(id)a3
{
  EKICSPreviewController *icsPreviewController;
  id v5;

  icsPreviewController = self->_icsPreviewController;
  if (icsPreviewController)
  {
    -[EKICSPreviewController viewController](icsPreviewController, "viewController", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SGSuggestionPresenter dismissViewController:](self, "dismissViewController:", v5);

  }
}

- (void)dismissViewController:(id)a3
{
  if (_suggestionViewControllerPresenter)
    objc_msgSend((id)_suggestionViewControllerPresenter, "dismissViewController:", a3);
  else
    -[SGSuggestionPresenter _dismissViewControllerAnimated:](self, "_dismissViewControllerAnimated:", 1);
}

- (void)suggestion:(id)a3 actionFinished:(BOOL)a4
{
  if (a4)
    -[SGSuggestionPresenter removeSuggestion:](self, "removeSuggestion:", a3);
}

- (void)suggestionWasUpdated:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__SGSuggestionPresenter_suggestionWasUpdated___block_invoke;
  v6[3] = &unk_1E62D7080;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  runOnMainThread(v6);

}

- (int64_t)suggestionsUIContext
{
  return _currentContext;
}

- (id)_viewControllerForPresentingFromBanner
{
  void *v3;
  void *v4;

  -[SGSuggestionPresenter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForPresentingFromBannerByPresenter:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_presentingViewController
{
  void *v3;
  void *v4;

  -[SGSuggestionPresenter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForPresentingFromBannerByPresenter:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_presentModalViewControllerFromButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SGSuggestionPresenter banner](self, "banner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SGSuggestionPresenter _presentModalViewController:fromSourceView:](self, "_presentModalViewController:fromSourceView:", v4, v5);

}

- (void)_presentModalViewController:(id)a3 fromSourceView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  Class v11;
  Class v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v9);

      v11 = NSClassFromString(CFSTR("REMReminderCreationViewController"));
      v12 = NSClassFromString(CFSTR("PKAddPassesViewController"));
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 && (objc_opt_isKindOfClass() & 1) != 0
        || v12 && (objc_opt_isKindOfClass() & 1) != 0
        || objc_msgSend(v14, "containsString:", CFSTR("SwiftUI"))
        && objc_msgSend(v14, "containsString:", CFSTR("FinanceKitUI"))
        && objc_msgSend(v14, "containsString:", CFSTR("OrderImportPreview")))
      {
        objc_msgSend(v8, "setNavigationBarHidden:", 1);
      }

      v6 = v8;
    }
    objc_msgSend(v8, "setModalPresentationStyle:", 7);
  }
  objc_storeStrong((id *)&self->_presentedViewController, v6);
  objc_msgSend(v6, "popoverPresentationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);
  if (!v7)
  {
    -[SGSuggestionPresenter banner](self, "banner");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "setSourceView:", v7);
  -[SGSuggestionPresenter banner](self, "banner");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "popoverSourceRect");
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(v7, "actionButtonLeadingEdgeOffset");
  objc_msgSend(v15, "setSourceRect:", v20 - v23, v18, v20, v22);
  -[SGSuggestionPresenter delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    -[SGSuggestionPresenter delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "suggestionPresenter:willPresentViewController:", self, v6);

  }
  -[SGSuggestionPresenter _presentingViewController](self, "_presentingViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __68__SGSuggestionPresenter__presentModalViewController_fromSourceView___block_invoke;
  v29[3] = &unk_1E62D7080;
  v29[4] = self;
  v30 = v6;
  v28 = v6;
  objc_msgSend(v27, "presentViewController:animated:completion:", v28, 1, v29);

}

- (void)_dismissViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v9[5];

  v3 = a3;
  -[UIViewController presentingViewController](self->_presentedViewController, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SGSuggestionPresenter delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[SGSuggestionPresenter delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "suggestionPresenter:willDismissViewController:", self, self->_presentedViewController);

    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__SGSuggestionPresenter__dismissViewControllerAnimated___block_invoke;
    v9[3] = &unk_1E62D70D0;
    v9[4] = self;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v3, v9);
  }

}

- (id)_presentedControllerDoneButtonItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__dismissPresentedViewController_);
}

- (id)_presentedControllerCancelButtonItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__dismissPresentedViewController_);
}

- (void)_dismissPresentedViewController:(id)a3
{
  -[SGSuggestionPresenter _dismissViewControllerAnimated:](self, "_dismissViewControllerAnimated:", 1);
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "presentedViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "topViewController");
    v7 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a4 == -1 || a4 == 7)
    {
      objc_msgSend(v10, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRightBarButtonItem:", 0);
    }
    else
    {
      -[SGSuggestionPresenter _presentedControllerDoneButtonItem](self, "_presentedControllerDoneButtonItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRightBarButtonItem:", v8);

    }
  }

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SGSuggestionPresenter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SGSuggestionPresenter delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suggestionPresenter:willDismissViewController:", self, v8);

  }
  return 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SGSuggestionPresenter delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SGSuggestionPresenter delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "suggestionPresenter:didDismissViewController:", self, v7);

  }
}

- (SGSuggestionPresenterDelegate)delegate
{
  return (SGSuggestionPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)wantsToShowBanner
{
  return self->_wantsToShowBanner;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_icsPreviewController, 0);
  objc_storeStrong((id *)&self->_suggestionCategoryList, 0);
  objc_storeStrong((id *)&self->_filteredSuggestions, 0);
  objc_storeStrong((id *)&self->_suggestionStore, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_bannerDismissAction, 0);
  objc_storeStrong((id *)&self->_bannerPrimaryAction, 0);
  objc_storeStrong((id *)&self->_banner, 0);
}

void __56__SGSuggestionPresenter__dismissViewControllerAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionPresenter:didDismissViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

  }
}

void __68__SGSuggestionPresenter__presentModalViewController_fromSourceView___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionPresenter:didPresentViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __46__SGSuggestionPresenter_suggestionWasUpdated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "updateSuggestion:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__SGSuggestionPresenter_dismissAllSuggestions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "dismissAllSuggestions");
}

uint64_t __46__SGSuggestionPresenter_setWantsToShowBanner___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  id WeakRetained;
  char v4;
  id v5;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 88))
  {
    v2 = result;
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 96));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(v2 + 32) + 96));
      objc_msgSend(v5, "suggestionPresenterWantsToHideBanner:", *(_QWORD *)(v2 + 32));

    }
    return objc_msgSend(*(id *)(v2 + 32), "_dismissViewControllerAnimated:", 1);
  }
  return result;
}

uint64_t __37__SGSuggestionPresenter_setDelegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
  return v8;
}

uint64_t __42__SGSuggestionPresenter_removeSuggestion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeSuggestion:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__SGSuggestionPresenter_addSuggestion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addSuggestion:", *(_QWORD *)(a1 + 40));
}

void __40__SGSuggestionPresenter_setSuggestions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setSuggestions:", *(_QWORD *)(a1 + 40));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(v4, "viewControllers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "updateWithSuggestionStore:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

  }
}

void __36__SGSuggestionPresenter_suggestions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "suggestions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)formatList:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", a3);
}

@end
