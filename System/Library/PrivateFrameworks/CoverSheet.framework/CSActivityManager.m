@implementation CSActivityManager

- (CSActivityManager)init
{
  CSActivityManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *activityIdentifiersToSupplemantaryItems;
  NSMutableDictionary *v5;
  NSMutableDictionary *activityItemsByBundleId;
  NSMutableArray *v7;
  NSMutableArray *hiddenItems;
  uint64_t v9;
  NSMutableDictionary *descriptorByActivityIdentifier;
  uint64_t v11;
  NSMutableDictionary *activityHostViewControllersByActivityIdentifier;
  uint64_t v13;
  ACActivityCenter *activityCenter;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CSActivityManager;
  v2 = -[CSActivityManager init](&v16, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activityIdentifiersToSupplemantaryItems = v2->_activityIdentifiersToSupplemantaryItems;
    v2->_activityIdentifiersToSupplemantaryItems = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activityItemsByBundleId = v2->_activityItemsByBundleId;
    v2->_activityItemsByBundleId = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    hiddenItems = v2->_hiddenItems;
    v2->_hiddenItems = v7;

    v9 = objc_opt_new();
    descriptorByActivityIdentifier = v2->_descriptorByActivityIdentifier;
    v2->_descriptorByActivityIdentifier = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    activityHostViewControllersByActivityIdentifier = v2->_activityHostViewControllersByActivityIdentifier;
    v2->_activityHostViewControllersByActivityIdentifier = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    activityCenter = v2->_activityCenter;
    v2->_activityCenter = (ACActivityCenter *)v13;

  }
  return v2;
}

- (void)dealloc
{
  NSMutableDictionary *descriptorByActivityIdentifier;
  NSMutableDictionary *activityHostViewControllersByActivityIdentifier;
  objc_super v5;

  -[NSMutableDictionary removeAllObjects](self->_descriptorByActivityIdentifier, "removeAllObjects");
  descriptorByActivityIdentifier = self->_descriptorByActivityIdentifier;
  self->_descriptorByActivityIdentifier = 0;

  -[NSMutableDictionary removeAllObjects](self->_activityHostViewControllersByActivityIdentifier, "removeAllObjects");
  activityHostViewControllersByActivityIdentifier = self->_activityHostViewControllersByActivityIdentifier;
  self->_activityHostViewControllersByActivityIdentifier = 0;

  v5.receiver = self;
  v5.super_class = (Class)CSActivityManager;
  -[CSActivityManager dealloc](&v5, sel_dealloc);
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_22);
  return (id)sharedInstance___instance;
}

void __35__CSActivityManager_sharedInstance__block_invoke()
{
  CSActivityManager *v0;
  void *v1;

  v0 = objc_alloc_init(CSActivityManager);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (void)addActivityWithContentUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCoverSheetActivities();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "Activity started: %@", (uint8_t *)&v7, 0xCu);

  }
  if (-[CSActivityManager _shouldHandleActivityWithContentUpdate:](self, "_shouldHandleActivityWithContentUpdate:", v4))
    -[CSActivityManager _addActivityWithContentUpdate:](self, "_addActivityWithContentUpdate:", v4);

}

- (void)updateActivityWithContentUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCoverSheetActivities();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "Activity updated: %@", (uint8_t *)&v7, 0xCu);

  }
  if (-[CSActivityManager _shouldHandleActivityWithContentUpdate:](self, "_shouldHandleActivityWithContentUpdate:", v4))
    -[CSActivityManager _updateActivityIfNeededWithContentUpdate:](self, "_updateActivityIfNeededWithContentUpdate:", v4);

}

- (void)removeActivityWithContentUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCoverSheetActivities();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "Activity dismissed: %@", (uint8_t *)&v7, 0xCu);

  }
  if (-[CSActivityManager _shouldHandleActivityWithContentUpdate:](self, "_shouldHandleActivityWithContentUpdate:", v4))
    -[CSActivityManager _removeActivityWithContentUpdate:](self, "_removeActivityWithContentUpdate:", v4);

}

- (void)setActivityHidden:(BOOL)a3 forIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_activityIdentifiersToSupplemantaryItems, "objectForKey:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CSActivityManager _setHidden:forItem:](self, "_setHidden:forItem:", v4, v6);

}

- (void)handleActivityExceedingReducedPushBudgetForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCoverSheetActivities();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "Activity exceeded reduced push budget: %@", (uint8_t *)&v6, 0xCu);
  }

  -[CSActivityManager _handleActivityExceedingReducedPushBudgetWithIdentifier:](self, "_handleActivityExceedingReducedPushBudgetWithIdentifier:", v4);
}

- (CSListItemSection)section
{
  return -[CSListItemSection initWithIdentifier:]([CSListItemSection alloc], "initWithIdentifier:", CFSTR("LiveActivities"));
}

- (unint64_t)itemCount
{
  return -[NSMutableDictionary count](self->_activityIdentifiersToSupplemantaryItems, "count");
}

- (void)handleRemovedItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_activityIdentifiersToSupplemantaryItems, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          -[ACActivityCenter endActivity:](self->_activityCenter, "endActivity:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)itemsGroupSortComparator
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__CSActivityManager_itemsGroupSortComparator__block_invoke;
  v4[3] = &unk_1E8E304F8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x1D17E1614](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

uint64_t __45__CSActivityManager_itemsGroupSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    v10 = objc_msgSend(&unk_1E8E8A018, "indexOfObject:", v5);
    v11 = objc_msgSend(&unk_1E8E8A018, "indexOfObject:", v6);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL || v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v11 == 0x7FFFFFFFFFFFFFFFLL || v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(WeakRetained, "_latestActivityCreationDateForGroupingIdentifier:", v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "_latestActivityCreationDateForGroupingIdentifier:", v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v12, "compare:", v13);

        }
        else
        {
          v8 = -1;
        }
      }
      else if (v11 < v10)
      {
        v8 = 1;
      }
      else
      {
        v8 = -1;
      }
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)itemsViewControllerSortComparator
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__CSActivityManager_itemsViewControllerSortComparator__block_invoke;
  v4[3] = &unk_1E8E30520;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x1D17E1614](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

uint64_t __54__CSActivityManager_itemsViewControllerSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_relevanceScoreForItemWithViewController:", v5);
    v10 = v9;
    objc_msgSend(v8, "_relevanceScoreForItemWithViewController:", v6);
    if (v10 >= v11)
    {
      if (v10 == v11)
      {
        objc_msgSend(v8, "_createdDateForItemWithViewController:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_createdDateForItemWithViewController:", v6);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        v12 = 0;
        if (v13 && v14)
          v12 = objc_msgSend(v13, "compare:", v14);

      }
      else
      {
        v12 = -1;
      }
    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)restrictsTouches:(BOOL)a3 onHostedSceneInViewController:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  char v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v4 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[NSMutableDictionary allValues](self->_activityItemsByBundleId, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(obj);
        v21 = v7;
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v7);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v23 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
              objc_msgSend(v14, "contentHost");
              v15 = (id)objc_claimAutoreleasedReturnValue();
              if (v15 == v6)
              {
                objc_msgSend(v14, "contentHost");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_opt_respondsToSelector();

                if ((v17 & 1) == 0)
                  continue;
                objc_msgSend(v14, "contentHost");
                v15 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "restrictsTouchesOnHostedScene:", v4);
              }

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v11);
        }

        v7 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v20);
  }

}

- (void)restrictsTouchesOnAllHostedScenes:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CSActivityManager activityIdentifiersToSupplemantaryItems](self, "activityIdentifiersToSupplemantaryItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "contentHost");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) != 0)
        {
          objc_msgSend(v10, "contentHost");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "restrictsTouchesOnHostedScene:", v3);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)activityHostViewController:(id)a3 requestsLaunchWithAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "activitySceneDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__CSActivityManager_activityHostViewController_requestsLaunchWithAction___block_invoke;
  v11[3] = &unk_1E8E30548;
  v12 = v9;
  v10 = v9;
  -[CSActivityManager _sendAnalyticsEventWithName:payloadBuilder:](self, "_sendAnalyticsEventWithName:payloadBuilder:", CFSTR("com.apple.activitykit.activity"), v11);
  -[CSActivityManager _unlockAndLaunchAppIfPossible:withAction:](self, "_unlockAndLaunchAppIfPossible:withAction:", v7, v6);

}

id __73__CSActivityManager_activityHostViewController_requestsLaunchWithAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("activityId");
  objc_msgSend(*(id *)(a1 + 32), "activityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = CFSTR("bundleId");
  objc_msgSend(*(id *)(a1 + 32), "platterTargetBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = CFSTR("eventType");
  v7[1] = v3;
  v7[2] = CFSTR("appLaunch-platter");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)activityHostViewControllerBackgroundTintColorDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;

  v4 = a3;
  objc_msgSend(v4, "activitySceneDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_activityIdentifiersToSupplemantaryItems, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v11 = v9;
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    objc_msgSend(v4, "backgroundTintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CSActivityManager _shouldSetDefaultBackgroundForViewController:](self, "_shouldSetDefaultBackgroundForViewController:", v4))
    {
      objc_msgSend(v4, "traitCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "userInterfaceStyle");

      -[CSActivityManager _backgroundTintColorForUserInterfaceStyle:](self, "_backgroundTintColorForUserInterfaceStyle:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      -[CSActivityManager _textColorForUserInterfaceStyle:](self, "_textColorForUserInterfaceStyle:", v17);
      v19 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v19;
      v14 = (void *)v18;
    }
    objc_msgSend(v13, "setTintColor:", v14);
    objc_msgSend(v13, "setTextColor:", v15);
    objc_msgSend(v8, "setConfiguration:", v13);
    SBLogCoverSheetActivities();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[CSActivityManager activityHostViewControllerBackgroundTintColorDidChange:].cold.1();

    -[CSListItemManaging updateItem:](self->_itemManager, "updateItem:", v8);
  }

}

- (void)activityHostViewControllerTextColorDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;

  v4 = a3;
  objc_msgSend(v4, "activitySceneDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_activityIdentifiersToSupplemantaryItems, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v11 = v9;
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    objc_msgSend(v4, "textColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      if (-[CSActivityManager _shouldSetDefaultBackgroundForViewController:](self, "_shouldSetDefaultBackgroundForViewController:", v4))
      {
        objc_msgSend(v4, "traitCollection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "userInterfaceStyle");

        -[CSActivityManager _textColorForUserInterfaceStyle:](self, "_textColorForUserInterfaceStyle:", v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
    }
    objc_msgSend(v13, "setTextColor:", v14);
    objc_msgSend(v8, "setConfiguration:", v13);
    SBLogCoverSheetActivities();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[CSActivityManager activityHostViewControllerTextColorDidChange:].cold.1();

    -[CSListItemManaging updateItem:](self->_itemManager, "updateItem:", v8);
  }

}

- (void)activityHostViewControllerHostShouldCancelTouches:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "activitySceneDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CSActivityManager _hostShouldCancelTouchesWithIdentifier:](self, "_hostShouldCancelTouchesWithIdentifier:", v5);
}

- (void)activityHostViewControllerSignificantUserInteractionBegan:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "activitySceneDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CSActivityManager _significantUserInteractionBeganForIdentifier:](self, "_significantUserInteractionBeganForIdentifier:", v5);
}

- (void)activityHostViewControllerSignificantUserInteractionEnded:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "activitySceneDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CSActivityManager _significantUserInteractionEndedForIdentifier:](self, "_significantUserInteractionEndedForIdentifier:", v5);
}

- (void)activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "activitySceneDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CSActivityManager activityIdentifiersToSupplemantaryItems](self, "activityIdentifiersToSupplemantaryItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v5);

        if (v14)
        {
          objc_msgSend(v12, "contentHost");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_self();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
            objc_msgSend(v15, "reevaluateAudioCategoriesDisablingVolumeHUD");

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

- (void)_hostShouldCancelTouchesWithIdentifier:(id)a3
{
  id v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_activityIdentifiersToSupplemantaryItems, "objectForKeyedSubscript:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSListItemManaging cancelTouchesForItem:](self->_itemManager, "cancelTouchesForItem:", v4);

}

- (void)_significantUserInteractionBeganForIdentifier:(id)a3
{
  id v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_activityIdentifiersToSupplemantaryItems, "objectForKeyedSubscript:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSListItemManaging significantUserInteractionBeganForItem:](self->_itemManager, "significantUserInteractionBeganForItem:", v4);

}

- (void)_significantUserInteractionEndedForIdentifier:(id)a3
{
  id v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_activityIdentifiersToSupplemantaryItems, "objectForKeyedSubscript:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSListItemManaging significantUserInteractionEndedForItem:](self->_itemManager, "significantUserInteractionEndedForItem:", v4);

}

- (void)_unlockAndLaunchAppIfPossible:(id)a3 withAction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  id v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "activityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activitySceneDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "activityDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "platterTargetBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0D22938];
    v26[0] = *MEMORY[0x1E0D22828];
    if (v5)
    {
      v25 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
    }
    v14 = *MEMORY[0x1E0D22838];
    v27[0] = v12;
    v27[1] = MEMORY[0x1E0C9AAB0];
    v15 = *MEMORY[0x1E0D22840];
    v26[1] = v14;
    v26[2] = v15;
    v27[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "optionsWithDictionary:", v16);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v5)
    SBLogCoverSheetActivities();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      v22 = v7;
      v23 = 2113;
      v24 = v5;
      _os_log_impl(&dword_1D0337000, v17, OS_LOG_TYPE_DEFAULT, "Activity[%{public}@] Sending open application request for %{private}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D22940], "serviceWithDefaultShellEndpoint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__CSActivityManager__unlockAndLaunchAppIfPossible_withAction___block_invoke;
    v19[3] = &unk_1E8E2ECD8;
    v20 = v7;
    objc_msgSend(v18, "openApplication:withOptions:completion:", v10, v13, v19);

  }
  else
  {
    SBLogCoverSheetActivities();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[CSActivityManager _unlockAndLaunchAppIfPossible:withAction:].cold.1((uint64_t)v7, v13);
  }

}

void __62__CSActivityManager__unlockAndLaunchAppIfPossible_withAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCoverSheetActivities();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __62__CSActivityManager__unlockAndLaunchAppIfPossible_withAction___block_invoke_cold_1(a1, (uint64_t)v4, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "Activity[%{public}@] Open application succeeded.", (uint8_t *)&v8, 0xCu);
  }

}

- (void)_removeActivityWithContentUpdate:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_activityHostViewControllersByActivityIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v4;
      _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "Activity[%{public}@] finished, removing from the list...", (uint8_t *)&v12, 0xCu);
    }
    SBLogCoverSheetActivities();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v4;
      _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] removes activity view controller from CoverSheet", (uint8_t *)&v12, 0xCu);
    }

    -[NSMutableDictionary objectForKey:](self->_activityIdentifiersToSupplemantaryItems, "objectForKey:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_activityIdentifiersToSupplemantaryItems, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CSListItemManaging removeItem:](self->_itemManager, "removeItem:", v8);
      -[NSMutableDictionary removeObjectForKey:](self->_activityIdentifiersToSupplemantaryItems, "removeObjectForKey:", v4);
      objc_msgSend(v5, "invalidate");
      if (-[CSActivityManager _itemIsNowPlaying:](self, "_itemIsNowPlaying:", v8))
        -[CSListItemManaging setNowPlayingItem:](self->_itemManager, "setNowPlayingItem:", 0);
      -[NSMutableDictionary objectForKey:](self->_descriptorByActivityIdentifier, "objectForKey:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "platterTargetBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSActivityManager _removeAppActivitiesRecordForBundleId:activityItem:](self, "_removeAppActivitiesRecordForBundleId:activityItem:", v11, v8);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_descriptorByActivityIdentifier, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_activityHostViewControllersByActivityIdentifier, "removeObjectForKey:", v4);
  }
  else
  {
    SBLogCoverSheetActivities();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v4;
      _os_log_impl(&dword_1D0337000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] found no activity view controller to remove in CoverSheet", (uint8_t *)&v12, 0xCu);
    }
  }

}

- (void)_updateActivityIfNeededWithContentUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_activityIdentifiersToSupplemantaryItems, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "relevanceScore");
  v9 = v8;

  objc_msgSend(v6, "relevanceScore");
  if (v10 != v9)
  {
    SBLogCoverSheetActivities();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543874;
      v13 = v5;
      v14 = 2114;
      v15 = v6;
      v16 = 2050;
      v17 = v9;
      _os_log_impl(&dword_1D0337000, v11, OS_LOG_TYPE_DEFAULT, "Activity[%{public}@] Relevance score did change: %{public}@ to %{public}f", (uint8_t *)&v12, 0x20u);
    }

    objc_msgSend(v6, "setRelevanceScore:", v9);
    -[CSListItemManaging updateItem:](self->_itemManager, "updateItem:", v6);
  }

}

- (void)_addActivityListItemForContentUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_activityHostViewControllersByActivityIdentifier, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCoverSheetActivities();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      v32 = v5;
      _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] has already a host view controller in CoverSheet, updating activity if needed", buf, 0xCu);
    }

    -[CSActivityManager _updateActivityIfNeededWithContentUpdate:](self, "_updateActivityIfNeededWithContentUpdate:", v4);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      v32 = v5;
      _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] creating activity view controller", buf, 0xCu);
    }

    objc_msgSend(v4, "descriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_descriptorByActivityIdentifier, "setObject:forKey:", v9, v5);
    objc_msgSend(v9, "platterTargetBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DAC5E8], "defaultMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF5468], "activityHostViewControllerWithDescriptor:sceneType:metricsRequest:", v9, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShouldShareTouchesWithHost:", 1);
    objc_msgSend(v11, "setDelegate:", self);
    objc_initWeak((id *)buf, self);
    v30 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __58__CSActivityManager__addActivityListItemForContentUpdate___block_invoke;
    v28[3] = &unk_1E8E30570;
    objc_copyWeak(&v29, (id *)buf);
    v14 = (id)objc_msgSend(v11, "registerForTraitChanges:withHandler:", v12, v28);

    v15 = MEMORY[0x1E0C80D38];
    v16 = MEMORY[0x1E0C80D38];
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __58__CSActivityManager__addActivityListItemForContentUpdate___block_invoke_2;
    v22[3] = &unk_1E8E30598;
    v22[4] = self;
    v17 = v5;
    v23 = v17;
    v18 = v21;
    v24 = v18;
    v19 = v11;
    v25 = v19;
    v26 = v4;
    v20 = v9;
    v27 = v20;
    objc_msgSend(v19, "ensureContent:queue:completion:", v15, v22, 1.79769313e308);

    -[NSMutableDictionary setObject:forKey:](self->_activityHostViewControllersByActivityIdentifier, "setObject:forKey:", v19, v17);
    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);

  }
}

void __58__CSActivityManager__addActivityListItemForContentUpdate___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "activityHostViewControllerBackgroundTintColorDidChange:", v3);

}

void __58__CSActivityManager__addActivityListItemForContentUpdate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CSActivityItemViewController *v17;
  void *v18;
  void *v19;
  CSListItem *v20;

  BSDispatchQueueAssertMain();
  if (!a2
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isActivityActive:", *(_QWORD *)(a1 + 40)))
  {
    v20 = -[CSListItem initWithIdentifier:groupingIdentifier:sectionIdentifier:]([CSListItem alloc], "initWithIdentifier:groupingIdentifier:sectionIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("LiveActivities"));
    objc_msgSend(*(id *)(a1 + 56), "activitySceneDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createdDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSListItem setContentCreatedDate:](v20, "setContentCreatedDate:", v6);

    objc_msgSend(*(id *)(a1 + 64), "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "relevanceScore");
    -[CSListItem setRelevanceScore:](v20, "setRelevanceScore:");

    objc_msgSend(*(id *)(a1 + 32), "_buildConfigurationFromViewController:", *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "activitySceneDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activityDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentationOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "authorizationOptionsType");

    if (v12 != 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_clearAuthorizationOptionsIfNecessaryForGroupingIdentifier:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "_authorizationActionsForOptionsType:item:configuration:", v12, v20, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAuxiliaryOptionActions:", v13);

      v14 = *(void **)(a1 + 32);
      objc_msgSend(v14, "_appNameForBundleIdentifier:", *(_QWORD *)(a1 + 48));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_summaryTextForAuthorizationOptionsType:appName:", v12, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAuxiliaryOptionsSummaryText:", v16);

    }
    -[CSListItem setConfiguration:](v20, "setConfiguration:", v8);
    v17 = -[CSActivityItemViewController initWithActivityHostViewController:]([CSActivityItemViewController alloc], "initWithActivityHostViewController:", *(_QWORD *)(a1 + 56));
    -[CSActivityItemViewController setSceneHostEnvironmentObserver:](v17, "setSceneHostEnvironmentObserver:", *(_QWORD *)(a1 + 32));
    -[CSListItem setContentHost:](v20, "setContentHost:", v17);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v20, *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addItem:", v20);
      if (objc_msgSend(*(id *)(a1 + 32), "_itemIsNowPlaying:", v20))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setNowPlayingItem:", v20);
    }
    objc_msgSend(*(id *)(a1 + 72), "platterTargetBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_addAppActivitiesRecordForBundleId:activityItem:", v19, v20);

  }
}

- (void)_handleActivityExceedingReducedPushBudgetWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[NSMutableDictionary objectForKey:](self->_activityIdentifiersToSupplemantaryItems, "objectForKey:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "groupingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  -[CSActivityManager _authorizationActionsForOptionsType:item:configuration:](self, "_authorizationActionsForOptionsType:item:configuration:", 2, v13, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAuxiliaryOptionActions:", v10);

  -[CSActivityManager _appNameForBundleIdentifier:](self, "_appNameForBundleIdentifier:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSActivityManager _summaryTextForAuthorizationOptionsType:appName:](self, "_summaryTextForAuthorizationOptionsType:appName:", 2, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAuxiliaryOptionsSummaryText:", v12);

  objc_msgSend(v13, "setConfiguration:", v9);
  -[CSListItemManaging updateItem:](self->_itemManager, "updateItem:", v13);

}

- (id)_appNameForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;

  v3 = a3;
  v9 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v9);
  v5 = v9;
  if (v4)
  {
    objc_msgSend(v4, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      -[CSActivityManager _appNameForBundleIdentifier:].cold.1((uint64_t)v3, v7, v5);
    v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldSetDefaultBackgroundForViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "activitySceneDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "contentType");

  objc_msgSend(v3, "backgroundTintColor");
  v7 = objc_claimAutoreleasedReturnValue();

  return (v7 | v6) == 0;
}

- (id)_buildConfigurationFromViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "activitySceneDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "platterTargetBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "backgroundTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CSActivityManager _shouldSetDefaultBackgroundForViewController:](self, "_shouldSetDefaultBackgroundForViewController:", v4))
  {
    objc_msgSend(v4, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceStyle");

    -[CSActivityManager _backgroundTintColorForUserInterfaceStyle:](self, "_backgroundTintColorForUserInterfaceStyle:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    -[CSActivityManager _textColorForUserInterfaceStyle:](self, "_textColorForUserInterfaceStyle:", v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
    v8 = (void *)v12;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0DC6168]);
  objc_msgSend(v4, "activitySceneDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activityDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "presentationOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isUserDismissalAllowedOnLockScreen");

  if ((v18 & 1) == 0)
    objc_msgSend(v14, "setPreventsUserDismissal:", 1);
  if (v8)
    v19 = 22;
  else
    v19 = 1;
  objc_msgSend(v14, "setGroupingIdentifier:", v7);
  objc_msgSend(v14, "setMaterialRecipe:", v19);
  objc_msgSend(v14, "setTintColor:", v8);
  objc_msgSend(v14, "setTextColor:", v9);
  -[CSActivityManager _appNameForBundleIdentifier:](self, "_appNameForBundleIdentifier:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setGroupName:", v20);

  objc_msgSend(v14, "setContainsUnmanagedContent:", 1);
  return v14;
}

- (id)_backgroundTintColorForUserInterfaceStyle:(int64_t)a3
{
  if (!a3 || a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    self = (CSActivityManager *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    self = (CSActivityManager *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_textColorForUserInterfaceStyle:(int64_t)a3
{
  if (!a3 || a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    self = (CSActivityManager *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    self = (CSActivityManager *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (void)_setActivitiesEnabled:(BOOL)a3 forBundleId:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  BOOL v14;

  v4 = a3;
  v6 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __55__CSActivityManager__setActivitiesEnabled_forBundleId___block_invoke;
  v12 = &unk_1E8E305C0;
  v13 = v6;
  v14 = v4;
  v7 = v6;
  -[CSActivityManager _sendAnalyticsEventWithName:payloadBuilder:](self, "_sendAnalyticsEventWithName:payloadBuilder:", CFSTR("com.apple.springboard.activityAuthorizationChange"), &v9);
  v8 = objc_alloc_init(MEMORY[0x1E0C90228]);
  objc_msgSend(v8, "setActivitiesEnabled:forBundleId:source:", v4, v7, 0, v9, v10, v11, v12);

}

id __55__CSActivityManager__setActivitiesEnabled_forBundleId___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v5[0] = *(_QWORD *)(a1 + 32);
  v4[0] = CFSTR("bundleId");
  v4[1] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2] = CFSTR("source");
  v5[1] = v1;
  v5[2] = CFSTR("platter chin");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_setFrequentUpdatesEnabled:(BOOL)a3 forBundleId:(id)a4
{
  _BOOL8 v4;
  objc_class *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (objc_class *)MEMORY[0x1E0C90228];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setFrequentPushesEnabled:forBundleId:", v4, v6);

}

- (id)_authorizationActionsForOptionsType:(int64_t)a3 item:(id)a4 configuration:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26[2];
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31[2];
  id v32;
  id from;
  id location;
  _QWORD v35[4];

  v35[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v21 = a5;
  objc_msgSend(v8, "groupingIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  objc_initWeak(&v32, v21);
  v10 = (void *)MEMORY[0x1E0CEA2A8];
  -[CSActivityManager _primaryActionTitleForAuthorizationOptionsType:](self, "_primaryActionTitleForAuthorizationOptionsType:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __76__CSActivityManager__authorizationActionsForOptionsType_item_configuration___block_invoke;
  v27[3] = &unk_1E8E305E8;
  objc_copyWeak(&v29, &location);
  objc_copyWeak(&v30, &from);
  objc_copyWeak(v31, &v32);
  v31[1] = (id)a3;
  v13 = v9;
  v28 = v13;
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v11, 0, 0, v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CEA2A8];
  -[CSActivityManager _secondaryActionTitleForAuthorizationOptionsType:](self, "_secondaryActionTitleForAuthorizationOptionsType:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __76__CSActivityManager__authorizationActionsForOptionsType_item_configuration___block_invoke_2;
  v22[3] = &unk_1E8E305E8;
  objc_copyWeak(&v24, &location);
  objc_copyWeak(&v25, &from);
  objc_copyWeak(v26, &v32);
  v26[1] = (id)a3;
  v17 = v13;
  v23 = v17;
  objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v16, 0, 0, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = v18;
  v35[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);

  objc_destroyWeak(v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v19;
}

void __76__CSActivityManager__authorizationActionsForOptionsType_item_configuration___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  unint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v2 && v3)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (v4 >= 2)
    {
      if (v4 == 2)
        objc_msgSend(WeakRetained, "_setFrequentUpdatesEnabled:forBundleId:", 1, *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_msgSend(WeakRetained, "_setActivitiesEnabled:forBundleId:", 1, *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v3, "setAuxiliaryOptionActions:", 0);
    objc_msgSend(v3, "setAuxiliaryOptionsSummaryText:", 0);
    objc_msgSend(v2, "setConfiguration:", v3);
    objc_msgSend(WeakRetained, "itemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateItem:", v2);

  }
}

void __76__CSActivityManager__authorizationActionsForOptionsType_item_configuration___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v2 && v3)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (v4 >= 2)
    {
      if (v4 != 2)
      {
LABEL_9:
        objc_msgSend(v3, "setAuxiliaryOptionActions:", 0);
        objc_msgSend(v3, "setAuxiliaryOptionsSummaryText:", 0);
        objc_msgSend(v2, "setConfiguration:", v3);
        objc_msgSend(WeakRetained, "itemManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "updateItem:", v2);

        goto LABEL_10;
      }
      v7 = *(_QWORD *)(a1 + 32);
      v5 = (_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "_setFrequentUpdatesEnabled:forBundleId:", 0, v7);
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 32);
      v5 = (_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "_setActivitiesEnabled:forBundleId:", 0, v6);
    }
    objc_msgSend(WeakRetained, "_endAllActivitiesForBundleId:", *v5);
    goto LABEL_9;
  }
LABEL_10:

}

- (id)_primaryActionTitleForAuthorizationOptionsType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ACTIVITY_LIST_ITEM_FREQUENT_UPDATES_PROMPT_ALLOW_ACTION_TITLE");
  }
  else if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ACTIVITY_LIST_ITEM_SECOND_PROMPT_ALLOW_ACTION_TITLE");
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      return v6;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ACTIVITY_LIST_ITEM_FIRST_PROMPT_ALLOW_ACTION_TITLE");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E8E30B28, CFSTR("CoverSheet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_secondaryActionTitleForAuthorizationOptionsType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if ((unint64_t)a3 < 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ACTIVITY_LIST_ITEM_DISABLE_ACTION_TITLE");
LABEL_6:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E8E30B28, CFSTR("CoverSheet"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ACTIVITY_LIST_ITEM_FREQUENT_UPDATES_PROMPT_DISABLE_ACTION_TITLE");
    goto LABEL_6;
  }
  v6 = 0;
  return v6;
}

- (id)_summaryTextForAuthorizationOptionsType:(int64_t)a3 appName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v5 = a4;
  if (a3 == 2)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("ACTIVITY_LIST_ITEM_FREQUENT_UPDATES_SUBTITLE");
  }
  else if (a3 == 1)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("ACTIVITY_LIST_ITEM_SECOND_PROMPT_SUBTITLE");
  }
  else
  {
    if (a3)
    {
      v11 = 0;
      goto LABEL_9;
    }
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("ACTIVITY_LIST_ITEM_FIRST_PROMPT_SUBTITLE");
  }
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E8E30B28, CFSTR("CoverSheet"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v11;
}

- (id)_latestActivityCreationDateForGroupingIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSMutableDictionary objectForKey:](self->_activityItemsByBundleId, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_77);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentCreatedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __70__CSActivityManager__latestActivityCreationDateForGroupingIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a2, "contentCreatedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentCreatedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 > v6;
}

- (double)_relevanceScoreForItemWithViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CSActivityManager activityIdentifiersToSupplemantaryItems](self, "activityIdentifiersToSupplemantaryItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v8 = 0.0;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "contentHost");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v4)
        {
          objc_msgSend(v12, "relevanceScore");
          v8 = v14;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)_createdDateForItemWithViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CSActivityManager activityIdentifiersToSupplemantaryItems](self, "activityIdentifiersToSupplemantaryItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "contentHost");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          objc_msgSend(v10, "contentCreatedDate");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_sendAnalyticsEventWithName:(id)a3 payloadBuilder:(id)a4
{
  AnalyticsSendEventLazy();
}

- (void)_clearAuthorizationOptionsIfNecessaryForGroupingIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKey:](self->_activityItemsByBundleId, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "configuration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_class();
        v12 = v10;
        if (v11)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;
        }
        else
        {
          v13 = 0;
        }
        v14 = v13;

        objc_msgSend(v14, "setAuxiliaryOptionActions:", 0);
        -[CSActivityManager itemManager](self, "itemManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "updateItem:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (void)_endAllActivitiesForBundleId:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  ACActivityCenter *activityCenter;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKey:](self->_activityItemsByBundleId, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        activityCenter = self->_activityCenter;
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACActivityCenter endActivity:](activityCenter, "endActivity:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_updateAllApplicationMonitoringPolicies
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  BSDispatchQueueAssertMain();
  -[CSActivityManager applicationPolicyMonitor](self, "applicationPolicyMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->_activityItemsByBundleId, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__CSActivityManager__updateAllApplicationMonitoringPolicies__block_invoke;
  v5[3] = &unk_1E8E30678;
  v5[4] = self;
  objc_msgSend(v3, "requestPoliciesForBundleIdentifiers:completionHandler:", v4, v5);

}

void __60__CSActivityManager__updateAllApplicationMonitoringPolicies__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id location;

  v5 = a2;
  v6 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v8, &location);
  v7 = v5;
  BSDispatchMain();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __60__CSActivityManager__updateAllApplicationMonitoringPolicies__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v5[1] = 3221225472;
    v5[2] = __60__CSActivityManager__updateAllApplicationMonitoringPolicies__block_invoke_3;
    v5[3] = &unk_1E8E30650;
    v5[4] = WeakRetained;
    v4 = WeakRetained;
    v5[0] = MEMORY[0x1E0C809B0];
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);
    WeakRetained = v4;
  }

}

uint64_t __60__CSActivityManager__updateAllApplicationMonitoringPolicies__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForScreenTimeLimitForBundleId:policy:", a2, a3);
}

- (void)_updateForScreenTimeLimitForBundleId:(id)a3 policy:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableDictionary *descriptorByActivityIdentifier;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_activityItemsByBundleId, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "integerValue");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        descriptorByActivityIdentifier = self->_descriptorByActivityIdentifier;
        objc_msgSend(v14, "identifier", (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](descriptorByActivityIdentifier, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "contentType") != 1)
          -[CSActivityManager _setHidden:forItem:](self, "_setHidden:forItem:", v8 != 0, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)_addAppActivitiesRecordForBundleId:(id)a3 activityItem:(id)a4
{
  NSMutableDictionary *activityItemsByBundleId;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  activityItemsByBundleId = self->_activityItemsByBundleId;
  v7 = a4;
  -[NSMutableDictionary allKeys](activityItemsByBundleId, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v12);

  if ((v9 & 1) != 0)
  {
    -[NSMutableDictionary objectForKey:](self->_activityItemsByBundleId, "objectForKey:", v12);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  v11 = v10;
  objc_msgSend(v10, "addObject:", v7);

  -[NSMutableDictionary setObject:forKey:](self->_activityItemsByBundleId, "setObject:forKey:", v11, v12);
}

- (void)_removeAppActivitiesRecordForBundleId:(id)a3 activityItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_activityItemsByBundleId, "objectForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKey:](self->_activityItemsByBundleId, "objectForKey:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsObject:", v6))
    {
      objc_msgSend(v8, "removeObject:", v6);
      -[NSMutableDictionary setObject:forKey:](self->_activityItemsByBundleId, "setObject:forKey:", v8, v9);
    }

  }
}

- (BOOL)_itemIsNowPlaying:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "groupingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MediaRemoteUI"));

  return v4;
}

- (void)_setHidden:(BOOL)a3 forItem:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__CSActivityManager__setHidden_forItem___block_invoke;
    v9[3] = &unk_1E8E30548;
    v8 = v6;
    v10 = v8;
    -[CSActivityManager _sendAnalyticsEventWithName:payloadBuilder:](self, "_sendAnalyticsEventWithName:payloadBuilder:", CFSTR("com.apple.activitykit.activity"), v9);
    -[CSListItemManaging removeItem:](self->_itemManager, "removeItem:", v8);
    if ((-[NSMutableArray containsObject:](self->_hiddenItems, "containsObject:", v8) & 1) == 0)
      -[NSMutableArray addObject:](self->_hiddenItems, "addObject:", v8);

  }
  else
  {
    -[CSListItemManaging addItem:](self->_itemManager, "addItem:", v6);
    -[NSMutableArray removeObject:](self->_hiddenItems, "removeObject:", v7);
  }

}

id __40__CSActivityManager__setHidden_forItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("activityId");
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = CFSTR("bundleId");
  objc_msgSend(*(id *)(a1 + 32), "groupingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = CFSTR("eventType");
  v7[1] = v3;
  v7[2] = CFSTR("hidden");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_shouldHandleActivityWithContentUpdate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "destinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", &__block_literal_global_83);

  return v6;
}

BOOL __60__CSActivityManager__shouldHandleActivityWithContentUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "destination") == 0;
}

- (void)didAddNewSceneHostEnvironment
{
  -[CSListItemManaging didAddNewSceneHostEnvironment](self->_itemManager, "didAddNewSceneHostEnvironment");
}

- (CSListItemManaging)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_itemManager, a3);
}

- (NSMutableDictionary)activityIdentifiersToSupplemantaryItems
{
  return self->_activityIdentifiersToSupplemantaryItems;
}

- (void)setActivityIdentifiersToSupplemantaryItems:(id)a3
{
  objc_storeStrong((id *)&self->_activityIdentifiersToSupplemantaryItems, a3);
}

- (NSMutableDictionary)bundleIdentifiersToItems
{
  return self->_bundleIdentifiersToItems;
}

- (void)setBundleIdentifiersToItems:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifiersToItems, a3);
}

- (NSMutableDictionary)activityItemsByBundleId
{
  return self->_activityItemsByBundleId;
}

- (void)setActivityItemsByBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_activityItemsByBundleId, a3);
}

- (NSMutableDictionary)descriptorByActivityIdentifier
{
  return self->_descriptorByActivityIdentifier;
}

- (void)setDescriptorByActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_descriptorByActivityIdentifier, a3);
}

- (NSMutableDictionary)activityHostViewControllersByActivityIdentifier
{
  return self->_activityHostViewControllersByActivityIdentifier;
}

- (void)setActivityHostViewControllersByActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_activityHostViewControllersByActivityIdentifier, a3);
}

- (NSMutableArray)hiddenItems
{
  return self->_hiddenItems;
}

- (void)setHiddenItems:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenItems, a3);
}

- (DMFApplicationPolicyMonitor)applicationPolicyMonitor
{
  return self->_applicationPolicyMonitor;
}

- (ACActivityCenter)activityCenter
{
  return self->_activityCenter;
}

- (void)setActivityCenter:(id)a3
{
  objc_storeStrong((id *)&self->_activityCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityCenter, 0);
  objc_storeStrong((id *)&self->_applicationPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_hiddenItems, 0);
  objc_storeStrong((id *)&self->_activityHostViewControllersByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptorByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_activityItemsByBundleId, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersToItems, 0);
  objc_storeStrong((id *)&self->_activityIdentifiersToSupplemantaryItems, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
}

- (void)activityHostViewControllerBackgroundTintColorDidChange:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1D0337000, v0, v1, "Activity[%{public}@] Background tint color did change: %{public}@");
  OUTLINED_FUNCTION_17();
}

- (void)activityHostViewControllerTextColorDidChange:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1D0337000, v0, v1, "Activity[%{public}@] Text color did change: %{public}@");
  OUTLINED_FUNCTION_17();
}

- (void)_unlockAndLaunchAppIfPossible:(uint64_t)a1 withAction:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1D0337000, a2, OS_LOG_TYPE_FAULT, "Activity[%{public}@] Unable to resolve container bundle identifier", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_17();
}

void __62__CSActivityManager__unlockAndLaunchAppIfPossible_withAction___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_1(&dword_1D0337000, a3, (uint64_t)a3, "Activity[%{public}@] Open application failed: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_17();
}

- (void)_appNameForBundleIdentifier:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = a1;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_1(&dword_1D0337000, v5, v7, "Encountered error obtaining application name for bundle identifier %{public}@: %{public}@", (uint8_t *)&v8);

}

@end
