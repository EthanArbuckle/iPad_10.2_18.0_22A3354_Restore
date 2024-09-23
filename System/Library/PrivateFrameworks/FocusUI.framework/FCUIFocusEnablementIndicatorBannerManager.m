@implementation FCUIFocusEnablementIndicatorBannerManager

+ (id)managerWithBannerPoster:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithBannerPoster:", v4);

  return v5;
}

- (id)_initWithBannerPoster:(id)a3
{
  id v5;
  FCUIFocusEnablementIndicatorBannerManager *v6;
  FCUIFocusEnablementIndicatorBannerManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCUIFocusEnablementIndicatorBannerManager;
  v6 = -[FCUIFocusEnablementIndicatorManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bannerPoster, a3);

  return v7;
}

- (BOOL)shouldKeepPresentingAfterActiveActivityDidChange:(id)a3 lastActivity:(id)a4
{
  return 1;
}

- (void)revokeWithReason:(id)a3
{
  BNPosting *bannerPoster;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  bannerPoster = self->_bannerPoster;
  v5 = (void *)MEMORY[0x24BE0BA30];
  objc_msgSend((id)objc_opt_class(), "_flankingBannerRequesterIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identificationWithRequesterIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)-[BNPosting revokePresentablesWithIdentification:reason:options:userInfo:error:](bannerPoster, "revokePresentablesWithIdentification:reason:options:userInfo:error:", v7, v9, 0, 0, 0);

}

- (void)postActivity:(id)a3 enabled:(BOOL)a4
{
  -[FCUIFocusEnablementIndicatorBannerManager _postActivity:enabled:forPreviewing:withOptions:](self, "_postActivity:enabled:forPreviewing:withOptions:", a3, a4, 0, 1);
}

- (id)postPersistentActivity:(id)a3 enabled:(BOOL)a4 systemApertureElementProvider:(id)a5 pickerPresentation:(BOOL)a6
{
  -[FCUIFocusEnablementIndicatorBannerManager _postActivity:enabled:forPreviewing:withOptions:](self, "_postActivity:enabled:forPreviewing:withOptions:", a3, a4, 1, 1);
  return 0;
}

- (void)_postActivity:(id)a3 enabled:(BOOL)a4 forPreviewing:(BOOL)a5 withOptions:(unint64_t)a6
{
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  FCUIFocusEnablementIndicatorBannerPresentable *v18;
  void *v19;
  void *v20;
  void *v21;
  FCUIFocusEnablementIndicatorBannerManager *v22;
  unsigned int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v25 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v22 = self;
  v8 = self->_activeFlankingPresentables;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v13, "activityDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "activityUniqueIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "activityUniqueIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if (v17)
        {
          if (objc_msgSend(v13, "isActivityEnabled") == v25)
            goto LABEL_14;
          a5 = objc_msgSend(v13, "isForPreviewing");
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }

  v18 = [FCUIFocusEnablementIndicatorBannerPresentable alloc];
  objc_msgSend((id)objc_opt_class(), "_flankingBannerRequesterIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCUIFocusEnablementIndicatorBannerPresentable initWithActivityDescription:requesterIdentifier:enabled:forPreviewing:](v18, "initWithActivityDescription:requesterIdentifier:enabled:forPreviewing:", v7, v19, v25, a5);

  -[FCUIFocusEnablementIndicatorBannerManager _addActivePresentable:](v22, "_addActivePresentable:", v8);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BEB1020]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (a5)
    objc_msgSend(v20, "setObject:forKey:", &unk_24D218F50, *MEMORY[0x24BEB1018]);
  -[BNPosting postPresentable:withOptions:userInfo:error:](v22->_bannerPoster, "postPresentable:withOptions:userInfo:error:", v8, a6, v21, 0);

LABEL_14:
}

+ (id)_flankingBannerRequesterIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__FCUIFocusEnablementIndicatorBannerManager__flankingBannerRequesterIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_flankingBannerRequesterIdentifier_onceToken != -1)
    dispatch_once(&_flankingBannerRequesterIdentifier_onceToken, block);
  return (id)_flankingBannerRequesterIdentifier___flankingBannerRequesterIdentifier;
}

void __79__FCUIFocusEnablementIndicatorBannerManager__flankingBannerRequesterIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_flankingBannerRequesterIdentifier___flankingBannerRequesterIdentifier;
  _flankingBannerRequesterIdentifier___flankingBannerRequesterIdentifier = v4;

}

- (void)_addActivePresentable:(id)a3
{
  FCUIFocusEnablementIndicatorBannerManager *v4;
  NSMutableArray *activeFlankingPresentables;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    v4 = self;
    objc_sync_enter(v4);
    activeFlankingPresentables = v4->_activeFlankingPresentables;
    if (!activeFlankingPresentables)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = v4->_activeFlankingPresentables;
      v4->_activeFlankingPresentables = v6;

      activeFlankingPresentables = v4->_activeFlankingPresentables;
    }
    -[NSMutableArray addObject:](activeFlankingPresentables, "addObject:", v8);
    objc_msgSend(v8, "addPresentableObserver:", v4);
    objc_sync_exit(v4);

  }
}

- (void)_removeFlankingPresentable:(id)a3
{
  id v4;
  FCUIFocusEnablementIndicatorBannerManager *v5;
  NSMutableArray *activeFlankingPresentables;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    objc_msgSend(v7, "removePresentableObserver:", v5);
    -[FCUIFocusEnablementIndicatorBannerManager _invalidateDismissTimerForPresentable:](v5, "_invalidateDismissTimerForPresentable:", v7);
    -[NSMutableArray removeObject:](v5->_activeFlankingPresentables, "removeObject:", v7);
    if (!-[NSMutableArray count](v5->_activeFlankingPresentables, "count"))
    {
      activeFlankingPresentables = v5->_activeFlankingPresentables;
      v5->_activeFlankingPresentables = 0;

    }
    objc_sync_exit(v5);

    v4 = v7;
  }

}

- (void)_scheduleDismissTimerForPresentable:(id)a3
{
  id v4;
  FCUIFocusEnablementIndicatorBannerManager *v5;
  void *v6;
  void *v7;
  id v8;
  NSMapTable *flankingBannersToDismissTimers;
  uint64_t v10;
  NSMapTable *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMapTable objectForKey:](v5->_flankingBannersToDismissTimers, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_initWeak(&location, v5);
      v7 = (void *)MEMORY[0x24BDBCF40];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __81__FCUIFocusEnablementIndicatorBannerManager__scheduleDismissTimerForPresentable___block_invoke;
      v12[3] = &unk_24D20AC38;
      objc_copyWeak(&v14, &location);
      v8 = v4;
      v13 = v8;
      objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v12, 6.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      flankingBannersToDismissTimers = v5->_flankingBannersToDismissTimers;
      if (!flankingBannersToDismissTimers)
      {
        objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v5->_flankingBannersToDismissTimers;
        v5->_flankingBannersToDismissTimers = (NSMapTable *)v10;

        flankingBannersToDismissTimers = v5->_flankingBannersToDismissTimers;
      }
      -[NSMapTable setObject:forKey:](flankingBannersToDismissTimers, "setObject:forKey:", v6, v8);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }

    objc_sync_exit(v5);
  }

}

void __81__FCUIFocusEnablementIndicatorBannerManager__scheduleDismissTimerForPresentable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_invalidateDismissTimerForPresentable:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "_bannerPoster");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0BA30], "uniqueIdentificationForPresentable:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "revokePresentablesWithIdentification:reason:options:userInfo:error:", v3, CFSTR("Revoking for dismiss timer"), 0, 0, 0);

}

- (void)_invalidateDismissTimerForPresentable:(id)a3
{
  id v4;
  FCUIFocusEnablementIndicatorBannerManager *v5;
  void *v6;
  NSMapTable *flankingBannersToDismissTimers;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMapTable objectForKey:](v5->_flankingBannersToDismissTimers, "objectForKey:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");
    -[NSMapTable removeObjectForKey:](v5->_flankingBannersToDismissTimers, "removeObjectForKey:", v8);
    if (!-[NSMapTable count](v5->_flankingBannersToDismissTimers, "count"))
    {
      flankingBannersToDismissTimers = v5->_flankingBannersToDismissTimers;
      v5->_flankingBannersToDismissTimers = 0;

    }
    objc_sync_exit(v5);

    v4 = v8;
  }

}

- (BNPosting)_bannerPoster
{
  return self->_bannerPoster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerPoster, 0);
  objc_storeStrong((id *)&self->_flankingBannersToDismissTimers, 0);
  objc_storeStrong((id *)&self->_activeFlankingPresentables, 0);
}

@end
