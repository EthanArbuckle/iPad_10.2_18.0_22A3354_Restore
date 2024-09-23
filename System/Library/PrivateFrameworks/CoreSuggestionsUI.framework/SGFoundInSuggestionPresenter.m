@implementation SGFoundInSuggestionPresenter

- (SGFoundInSuggestionPresenter)init
{
  SGFoundInSuggestionPresenter *v2;
  SGFoundInSuggestionPresenter *v3;
  void *v4;
  uint64_t v5;
  _PASLock *lock;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SGFoundInSuggestionPresenter;
  v2 = -[SGSuggestionPresenter init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_contentOptions = 0;
    v2->_loadScheduled = 0;
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v4);
    lock = v3->_lock;
    v3->_lock = (_PASLock *)v5;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__reloadSuggestionsForNotification_, CFSTR("com.apple.coresuggestions.SGDissectOrderSuggestion"), 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_contactStoreObserverToken)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_contactStoreObserverToken);

  }
  v4.receiver = self;
  v4.super_class = (Class)SGFoundInSuggestionPresenter;
  -[SGSuggestionPresenter dealloc](&v4, sel_dealloc);
}

- (void)setMailService:(id)a3 messageService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _PASLock *lock;
  void *v10;
  _PASLock *v11;
  NSObject *v12;
  uint8_t v13[16];
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    lock = self->_lock;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__SGFoundInSuggestionPresenter_setMailService_messageService___block_invoke;
    v16[3] = &unk_1E62D6D48;
    v17 = v6;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v16);
    v10 = v17;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    v11 = self->_lock;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__SGFoundInSuggestionPresenter_setMailService_messageService___block_invoke_2;
    v14[3] = &unk_1E62D6D48;
    v15 = v7;
    -[_PASLock runWithLockAcquired:](v11, "runWithLockAcquired:", v14);
    v10 = v15;
    goto LABEL_5;
  }
  sgLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v13 = 0;
    _os_log_debug_impl(&dword_1B1170000, v12, OS_LOG_TYPE_DEBUG, "SGFoundInSuggestionPresenter - No Mail/Message service specified. Will retrieve service", v13, 2u);
  }

LABEL_6:
}

- (void)setRealtimeSuggestions:(id)a3
{
  -[SGFoundInSuggestionPresenter setRealtimeSuggestions:fromHostApp:](self, "setRealtimeSuggestions:fromHostApp:", a3, 2);
}

- (void)setRealtimeSuggestions:(id)a3 fromHostApp:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__SGFoundInSuggestionPresenter_setRealtimeSuggestions_fromHostApp___block_invoke;
  v8[3] = &unk_1E62D6D98;
  v9 = v6;
  v10 = a4;
  v8[4] = self;
  v7 = v6;
  runOnMainThread(v8);

}

- (NSArray)realtimeSuggestions
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  SGFoundInSuggestionPresenter *v11;
  id v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __51__SGFoundInSuggestionPresenter_realtimeSuggestions__block_invoke;
  v10 = &unk_1E62D7080;
  v11 = self;
  v12 = v3;
  v4 = v3;
  runOnMainThreadSync(&v7);
  v5 = (void *)objc_msgSend(v4, "copy", v7, v8, v9, v10, v11);

  return (NSArray *)v5;
}

- (void)addSuggestionsFromSearchableItems:(id)a3 options:(unint64_t)a4 filter:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  if (objc_msgSend(v9, "count"))
    -[SGFoundInSuggestionPresenter addSuggestionsFromSearchableItems:existingSuggestions:mailService:messageService:options:filter:](self, "addSuggestionsFromSearchableItems:existingSuggestions:mailService:messageService:options:filter:", v9, 0, 0, 0, a4, v8);

}

- (void)addSuggestionsFromSearchableItems:(id)a3 existingSuggestions:(id)a4 options:(unint64_t)a5 filter:(id)a6
{
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v10 = a4;
  v11 = a6;
  if (objc_msgSend(v12, "count"))
    -[SGFoundInSuggestionPresenter addSuggestionsFromSearchableItems:existingSuggestions:mailService:messageService:options:filter:](self, "addSuggestionsFromSearchableItems:existingSuggestions:mailService:messageService:options:filter:", v12, v10, 0, 0, a5, v11);

}

- (void)addSuggestionsFromSearchableItems:(id)a3 existingSuggestions:(id)a4 mailService:(id)a5 messageService:(id)a6 options:(unint64_t)a7 filter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  unint64_t v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (objc_msgSend(v14, "count"))
  {
    -[SGFoundInSuggestionPresenter setMailService:messageService:](self, "setMailService:messageService:", v16, v17);
    serialQueue();
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __128__SGFoundInSuggestionPresenter_addSuggestionsFromSearchableItems_existingSuggestions_mailService_messageService_options_filter___block_invoke;
    block[3] = &unk_1E62D6DC0;
    block[4] = self;
    v21 = v14;
    v24 = a7;
    v23 = v18;
    v22 = v15;
    dispatch_async(v19, block);

  }
}

- (void)_reloadSuggestionsForNotification:(id)a3
{
  -[SGFoundInSuggestionPresenter _setNeedsToReloadSuggestionsAfter:](self, "_setNeedsToReloadSuggestionsAfter:", a3, 0.0);
}

- (void)reloadSuggestionsFromSearchableItems
{
  -[SGFoundInSuggestionPresenter _setNeedsToReloadSuggestionsAfter:](self, "_setNeedsToReloadSuggestionsAfter:", 0.0);
}

- (void)_setNeedsToReloadSuggestionsAfter:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  serialQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__SGFoundInSuggestionPresenter__setNeedsToReloadSuggestionsAfter___block_invoke;
  v6[3] = &unk_1E62D6DE8;
  *(double *)&v6[5] = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (void)_loadSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _PASLock *lock;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  _PASLock *v13;
  uint64_t v14;
  void *v15;
  NSArray *searchableItems;
  unint64_t v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  self->_loadScheduled = 0;
  -[NSArray firstObject](self->_searchableItems, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    lock = self->_lock;
    v8 = MEMORY[0x1E0C809B0];
    v27 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke;
    v21[3] = &unk_1E62D6E10;
    v21[4] = &v22;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v21);
    v9 = (void *)v23[5];
    v10 = self->_contentOptions | 3;
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke_2;
    v20[3] = &unk_1E62D6E38;
    v20[4] = self;
    objc_msgSend(v9, "suggestionsFromSearchableItem:options:processingType:withCompletion:", v3, v10, 0, v20);
  }
  else
  {
    objc_msgSend(v3, "bundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(CFSTR("com.apple.MobileSMS"), "caseInsensitiveCompare:", v11);

    if (v12)
    {
      -[SGFoundInSuggestionPresenter _loadedRealtimeSuggestions:fromHostApp:](self, "_loadedRealtimeSuggestions:fromHostApp:", 0, 2);
      goto LABEL_6;
    }
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    v13 = self->_lock;
    v14 = MEMORY[0x1E0C809B0];
    v27 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke_34;
    v19[3] = &unk_1E62D6E10;
    v19[4] = &v22;
    -[_PASLock runWithLockAcquired:](v13, "runWithLockAcquired:", v19);
    v15 = (void *)v23[5];
    searchableItems = self->_searchableItems;
    v17 = self->_contentOptions | 3;
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke_2_35;
    v18[3] = &unk_1E62D6E60;
    v18[4] = self;
    objc_msgSend(v15, "harvestedSuggestionsFromMessages:options:completionHandler:", searchableItems, v17, v18);
  }
  _Block_object_dispose(&v22, 8);

LABEL_6:
}

- (void)_loadedRealtimeSuggestions:(id)a3 fromHostApp:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SGFoundInSuggestionPresenter__loadedRealtimeSuggestions_fromHostApp___block_invoke;
  block[3] = &unk_1E62D6D98;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (id)formatMixedCategoriesTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1B5E17818]();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SuggestionsBannerMultipleSuggestionsTitleFormat"), &stru_1E62D74E0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_existingSuggestions, 0);
  objc_storeStrong((id *)&self->_contactStoreObserverToken, 0);
  objc_storeStrong((id *)&self->_searchableItems, 0);
  objc_storeStrong(&self->_filterBlock, 0);
}

void __71__SGFoundInSuggestionPresenter__loadedRealtimeSuggestions_fromHostApp___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[18];
  if (v3)
  {
    if (objc_msgSend(v3, "count"))
    {
      v4 = 0;
      do
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "objectAtIndex:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EEF15CB0))
          objc_msgSend(*(id *)(a1 + 32), "addSuggestion:", v5);

        ++v4;
      }
      while (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "count") > v4);
    }
  }
  else
  {
    v6 = v2[13];
    if (v6)
    {
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setRealtimeSuggestions:fromHostApp:", v7, *(_QWORD *)(a1 + 48));

    }
    else
    {
      objc_msgSend(v2, "setRealtimeSuggestions:fromHostApp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    if (*(_QWORD *)(a1 + 40))
    {
      location = 0;
      objc_initWeak(&location, *(id *)(a1 + 32));
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *MEMORY[0x1E0C96870];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __71__SGFoundInSuggestionPresenter__loadedRealtimeSuggestions_fromHostApp___block_invoke_2;
        v13[3] = &unk_1E62D6E88;
        objc_copyWeak(&v14, &location);
        objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v9, 0, 0, v13);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(v11 + 128);
        *(_QWORD *)(v11 + 128) = v10;

        objc_destroyWeak(&v14);
      }
      objc_destroyWeak(&location);
    }
  }
}

void __71__SGFoundInSuggestionPresenter__loadedRealtimeSuggestions_fromHostApp___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setNeedsToReloadSuggestionsAfter:", 1.0);

}

void __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;

  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6[1]);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0D19970], "serviceForMail");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_storeStrong(v6 + 1, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }

}

void __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134349056;
    v6 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1B1170000, v4, OS_LOG_TYPE_DEFAULT, "SGFoundInSuggestionPresenter - Found %{public}lu suggestion(s)", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_loadedRealtimeSuggestions:fromHostApp:", v3, 0);
}

void __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke_34(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;

  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6[2]);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0D19970], "serviceForMessages");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_storeStrong(v6 + 2, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }

}

void __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke_2_35(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  sgLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134349568;
    v14 = objc_msgSend(v9, "count");
    v15 = 2050;
    v16 = objc_msgSend(v8, "count");
    v17 = 2050;
    v18 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1B1170000, v12, OS_LOG_TYPE_DEFAULT, "SGFoundInSuggestionPresenter - Post Harvest, found %{public}lu events, %{public}lu contacts and %{public}lu reminders", (uint8_t *)&v13, 0x20u);
  }

  if (objc_msgSend(v8, "count"))
    objc_msgSend(v11, "addObjectsFromArray:", v8);
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v11, "addObjectsFromArray:", v9);
  if (objc_msgSend(v10, "count"))
    objc_msgSend(v11, "addObjectsFromArray:", v10);
  objc_msgSend(*(id *)(a1 + 32), "_loadedRealtimeSuggestions:fromHostApp:", v11, 1);

}

void __66__SGFoundInSuggestionPresenter__setNeedsToReloadSuggestionsAfter___block_invoke(uint64_t a1)
{
  double v2;
  _BYTE *v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];

  v2 = *(double *)(a1 + 40);
  v3 = *(_BYTE **)(a1 + 32);
  if (v2 == 0.0)
  {
    objc_msgSend(v3, "_loadSuggestions");
  }
  else if (!v3[136])
  {
    v3[136] = 1;
    v4 = dispatch_time(0, (uint64_t)(v2 * 1000000000.0));
    serialQueue();
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__SGFoundInSuggestionPresenter__setNeedsToReloadSuggestionsAfter___block_invoke_2;
    block[3] = &unk_1E62D70D0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v4, v5, block);

  }
}

_BYTE *__66__SGFoundInSuggestionPresenter__setNeedsToReloadSuggestionsAfter___block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[136])
    return (_BYTE *)objc_msgSend(result, "_loadSuggestions");
  return result;
}

uint64_t __128__SGFoundInSuggestionPresenter_addSuggestionsFromSearchableItems_existingSuggestions_mailService_messageService_options_filter___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 112);
  *(_QWORD *)(v3 + 112) = v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = *(_QWORD *)(a1 + 64);
  v5 = _Block_copy(*(const void **)(a1 + 56));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v5;

  v8 = *(void **)(a1 + 48);
  if (v8)
  {
    v9 = objc_msgSend(v8, "copy");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 144);
    *(_QWORD *)(v10 + 144) = v9;
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v12 + 144);
    *(_QWORD *)(v12 + 144) = 0;
  }

  return objc_msgSend(*(id *)(a1 + 32), "_loadSuggestions");
}

void __51__SGFoundInSuggestionPresenter_realtimeSuggestions__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "suggestions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        getRealtimeSuggestion(*(void **)(*((_QWORD *)&v8 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __67__SGFoundInSuggestionPresenter_setRealtimeSuggestions_fromHostApp___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[16];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "suggestionStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHostApp:", *(_QWORD *)(a1 + 48));

  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(a1 + 32), "realtimeSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  v32 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v6, "containsObject:", v12))
          objc_msgSend(v6, "removeObject:", v12);
        else
          objc_msgSend(v3, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v9);
  }

  v13 = objc_msgSend(v3, "count");
  v14 = objc_msgSend(v6, "count") + v13;
  if (v14 >= 2)
  {
    sgLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1B1170000, v15, OS_LOG_TYPE_DEBUG, "SGFoundInSuggestionPresenter - Lock notifications for batch update.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "suggestionStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lockNotifications");

  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "suggestions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          getRealtimeSuggestion(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23 && objc_msgSend(v6, "containsObject:", v23))
            objc_msgSend(*(id *)(a1 + 32), "removeSuggestion:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v19);
    }

  }
  if (objc_msgSend(v3, "count"))
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __67__SGFoundInSuggestionPresenter_setRealtimeSuggestions_fromHostApp___block_invoke_16;
    v26[3] = &unk_1E62D6D70;
    v26[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v26);
  }
  if (v14 >= 2)
  {
    sgLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1B1170000, v24, OS_LOG_TYPE_DEBUG, "SGFoundInSuggestionPresenter - Unlock notifications for batch update.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "suggestionStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "unlockNotifications");

  }
}

void __67__SGFoundInSuggestionPresenter_setRealtimeSuggestions_fromHostApp___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  _TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  SGRadarSuggestion *v9;
  SGEventSuggestion *v10;
  SGRadarSuggestion *v11;
  NSObject *v12;
  void *v13;
  _TtC17CoreSuggestionsUI19SGContactSuggestion *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (_TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *)v3;
    sgEventsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SGWalletOrderSuggestion event](v4, "event");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "loggingIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v7;
      _os_log_impl(&dword_1B1170000, v5, OS_LOG_TYPE_DEFAULT, "SGFoundInSuggestionPresenter - Adding RealtimeEvent %{public}@ to UI", (uint8_t *)&v24, 0xCu);

    }
    if (-[SGWalletOrderSuggestion state](v4, "state") == 6
      && os_variant_has_internal_diagnostics())
    {
      v8 = *(void **)(a1 + 32);
      v9 = [SGRadarSuggestion alloc];
      -[SGWalletOrderSuggestion sourceMessageId](v4, "sourceMessageId");
      v10 = (SGEventSuggestion *)objc_claimAutoreleasedReturnValue();
      v11 = -[SGRadarSuggestionBase initWithSourceMessageId:](v9, "initWithSourceMessageId:", v10);
      objc_msgSend(v8, "addSuggestion:", v11);

    }
    else
    {
      v15 = *(void **)(a1 + 32);
      v10 = -[SGEventSuggestionBase initWithRealtimeEvent:]([SGEventSuggestion alloc], "initWithRealtimeEvent:", v4);
      objc_msgSend(v15, "addSuggestion:", v10);
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1B1170000, v12, OS_LOG_TYPE_DEFAULT, "SGFoundInSuggestionPresenter - Adding RealtimeContact to UI", (uint8_t *)&v24, 2u);
    }

    v13 = *(void **)(a1 + 32);
    v14 = -[SGContactSuggestion initWithSgContact:]([_TtC17CoreSuggestionsUI19SGContactSuggestion alloc], "initWithSgContact:", v3);
LABEL_11:
    v4 = (_TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *)v14;
LABEL_12:
    objc_msgSend(v13, "addSuggestion:", v4);
LABEL_19:

    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (_TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *)v3;
    sgRemindersLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[SGWalletOrderSuggestion reminder](v4, "reminder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "loggingIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v18;
      _os_log_impl(&dword_1B1170000, v16, OS_LOG_TYPE_DEFAULT, "SGFoundInSuggestionPresenter - Adding RealtimeReminder %{public}@ to UI", (uint8_t *)&v24, 0xCu);

    }
    v19 = *(void **)(a1 + 32);
    v20 = -[SGReminderSuggestion initWithRealtimeReminder:]([_TtC17CoreSuggestionsUI20SGReminderSuggestion alloc], "initWithRealtimeReminder:", v4);
    objc_msgSend(v19, "addSuggestion:", v20);

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v3;
    sgLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1B1170000, v22, OS_LOG_TYPE_DEFAULT, "SGFoundInSuggestionPresenter - Adding RealtimeWalletOrder to UI", (uint8_t *)&v24, 2u);
    }

    v13 = *(void **)(a1 + 32);
    v4 = -[SGWalletOrderSuggestion initWithRealtimeWalletOrder:]([_TtC17CoreSuggestionsUI23SGWalletOrderSuggestion alloc], "initWithRealtimeWalletOrder:", v21);

    goto LABEL_12;
  }
  if (+[SGBannerUtility supportsWalletPassFeature](SGBannerUtility, "supportsWalletPassFeature"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      sgLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v24) = 0;
        _os_log_debug_impl(&dword_1B1170000, v23, OS_LOG_TYPE_DEBUG, "SGFoundInSuggestionPresenter - Adding RealtimeWalletPass to UI", (uint8_t *)&v24, 2u);
      }

      v13 = *(void **)(a1 + 32);
      v14 = -[SGWalletPassSuggestion initWithRealtimeWalletPass:]([_TtC17CoreSuggestionsUI22SGWalletPassSuggestion alloc], "initWithRealtimeWalletPass:", v3);
      goto LABEL_11;
    }
  }
LABEL_20:

}

void __62__SGFoundInSuggestionPresenter_setMailService_messageService___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 8), *(id *)(a1 + 32));
}

void __62__SGFoundInSuggestionPresenter_setMailService_messageService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 16), *(id *)(a1 + 32));
}

@end
