@implementation CNQuickActionsUsageManager

- (CNQuickActionsUsageManager)init
{
  CNQuickActionsUsageManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNQuickActionsUsageManager;
  v2 = -[CNQuickActionsUsageManager init](&v4, sel_init);
  -[CNQuickActionsUsageManager setSortsWithDuet:](v2, "setSortsWithDuet:", objc_msgSend((id)objc_opt_class(), "sortUsingCoreDuetAvailable"));
  return v2;
}

- (NSCountedSet)actionsUsageSet
{
  NSCountedSet *actionsUsageSet;
  NSCountedSet *v4;
  NSCountedSet *v5;

  actionsUsageSet = self->_actionsUsageSet;
  if (!actionsUsageSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v4 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_actionsUsageSet;
    self->_actionsUsageSet = v4;

    actionsUsageSet = self->_actionsUsageSet;
  }
  return actionsUsageSet;
}

- (NSMutableSet)enabledActionIdentifiers
{
  NSMutableSet *enabledActionIdentifiers;
  NSMutableSet *v4;
  NSMutableSet *v5;

  enabledActionIdentifiers = self->_enabledActionIdentifiers;
  if (!enabledActionIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_enabledActionIdentifiers;
    self->_enabledActionIdentifiers = v4;

    enabledActionIdentifiers = self->_enabledActionIdentifiers;
  }
  return enabledActionIdentifiers;
}

- (void)actionPerformed:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNQuickActionsUsageManager actionsUsageSet](self, "actionsUsageSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "globalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v5);
  -[CNQuickActionsUsageManager setCachedInteractions:](self, "setCachedInteractions:", 0);

}

- (double)scoreForAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CNQuickActionsUsageManager sortsWithDuet](self, "sortsWithDuet"))
  {
    -[CNQuickActionsUsageManager cachedInteractions](self, "cachedInteractions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v4, "matchesDuetInteraction:", v11))
          {
            objc_msgSend(v11, "score");
            v9 = v9 + v12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 0.0;
    }
  }
  else
  {
    -[CNQuickActionsUsageManager actionsUsageSet](self, "actionsUsageSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "globalIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (double)(unint64_t)objc_msgSend(v5, "countForObject:", v13);

  }
  return v9;
}

- (void)cacheEnabledStateForAction:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "enabled");
  -[CNQuickActionsUsageManager enabledActionIdentifiers](self, "enabledActionIdentifiers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "globalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v7, "addObject:", v6);
  else
    objc_msgSend(v7, "removeObject:", v6);

}

- (void)updateCachedEnabledStateForAction:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setCached:", 1);
  -[CNQuickActionsUsageManager enabledActionIdentifiers](self, "enabledActionIdentifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "globalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", objc_msgSend(v6, "containsObject:", v5));

}

- (void)_updateDuetInteractionsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNQuickActionsUsageManager cachedInteractions](self, "cachedInteractions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (-[CNQuickActionsUsageManager cachedInteractionsDate](self, "cachedInteractionsDate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "timeIntervalSinceDate:", v5),
        v7 = v6,
        v5,
        v4,
        v7 >= 5.0))
  {
    if (_updateDuetInteractionsIfNeeded_cn_once_token_1 != -1)
      dispatch_once(&_updateDuetInteractionsIfNeeded_cn_once_token_1, &__block_literal_global_11);
    v8 = (id)_updateDuetInteractionsIfNeeded_cn_once_object_1;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v9 = (void *)get_CDInteractionAdvisorSettingsClass_softClass;
    v26 = get_CDInteractionAdvisorSettingsClass_softClass;
    if (!get_CDInteractionAdvisorSettingsClass_softClass)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __get_CDInteractionAdvisorSettingsClass_block_invoke;
      v22[3] = &unk_1E204EBC0;
      v22[4] = &v23;
      __get_CDInteractionAdvisorSettingsClass_block_invoke((uint64_t)v22);
      v9 = (void *)v24[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v23, 8);
    objc_msgSend(v10, "interactionAdvisorSettingsDefault");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E20D3910);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConstrainPersonIdType:", v12);

    v13 = (void *)MEMORY[0x1E0C99E60];
    -[CNQuickActionsUsageManager contact](self, "contact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v15;
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[CNQuickActionsUsageManager contact](self, "contact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v17, "iOSLegacyIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConstrainPersonIds:", v20);

    objc_msgSend(v8, "adviseInteractionsUsingSettings:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionsUsageManager setCachedInteractions:](self, "setCachedInteractions:", v21);
    -[CNQuickActionsUsageManager setCachedInteractionsDate:](self, "setCachedInteractionsDate:", v3);

  }
}

- (id)sortedActions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v11, "enabled", (_QWORD)v13) & 1) == 0)
          objc_msgSend(v5, "removeObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    if (-[CNQuickActionsUsageManager sortsWithDuet](self, "sortsWithDuet"))
      -[CNQuickActionsUsageManager _updateDuetInteractionsIfNeeded](self, "_updateDuetInteractionsIfNeeded");
    objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_20_53779, (_QWORD)v13);
  }

  return v5;
}

- (BOOL)sortsWithDuet
{
  return self->_sortsWithDuet;
}

- (void)setSortsWithDuet:(BOOL)a3
{
  self->_sortsWithDuet = a3;
}

- (void)setActionsUsageSet:(id)a3
{
  objc_storeStrong((id *)&self->_actionsUsageSet, a3);
}

- (void)setEnabledActionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_enabledActionIdentifiers, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSArray)cachedInteractions
{
  return self->_cachedInteractions;
}

- (void)setCachedInteractions:(id)a3
{
  objc_storeStrong((id *)&self->_cachedInteractions, a3);
}

- (NSDate)cachedInteractionsDate
{
  return self->_cachedInteractionsDate;
}

- (void)setCachedInteractionsDate:(id)a3
{
  objc_storeStrong((id *)&self->_cachedInteractionsDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedInteractionsDate, 0);
  objc_storeStrong((id *)&self->_cachedInteractions, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_enabledActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionsUsageSet, 0);
}

uint64_t __44__CNQuickActionsUsageManager_sortedActions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = objc_msgSend(v6, "score");
  if (v8 <= objc_msgSend(v7, "score"))
  {
    v10 = objc_msgSend(v6, "score");
    if (v10 >= objc_msgSend(v7, "score"))
    {
      objc_msgSend(v6, "titleForContext:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "titleForContext:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "compare:", v12);

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

void __61__CNQuickActionsUsageManager__updateDuetInteractionsIfNeeded__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)get_CDInteractionAdvisorClass_softClass;
  v8 = get_CDInteractionAdvisorClass_softClass;
  if (!get_CDInteractionAdvisorClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __get_CDInteractionAdvisorClass_block_invoke;
    v4[3] = &unk_1E204EBC0;
    v4[4] = &v5;
    __get_CDInteractionAdvisorClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  objc_msgSend(v1, "interactionAdvisor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_updateDuetInteractionsIfNeeded_cn_once_object_1;
  _updateDuetInteractionsIfNeeded_cn_once_object_1 = v2;

}

+ (id)managerForContact:(id)a3
{
  id v3;
  void *v4;
  CNQuickActionsUsageManager *v5;

  v3 = a3;
  if (managerForContact__onceToken != -1)
    dispatch_once(&managerForContact__onceToken, &__block_literal_global_53815);
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)managerForContact__mapTable, "objectForKey:", v4);
  v5 = (CNQuickActionsUsageManager *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(CNQuickActionsUsageManager);
    -[CNQuickActionsUsageManager setContact:](v5, "setContact:", v3);
    objc_msgSend((id)managerForContact__mapTable, "setObject:forKey:", v5, v4);
  }

  return v5;
}

+ (BOOL)sortUsingCoreDuetAvailable
{
  if (sortUsingCoreDuetAvailable_onceToken != -1)
    dispatch_once(&sortUsingCoreDuetAvailable_onceToken, &__block_literal_global_2_53808);
  return sortUsingCoreDuetAvailable_enabled;
}

void __56__CNQuickActionsUsageManager_sortUsingCoreDuetAvailable__block_invoke()
{
  int AppBooleanValue;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CNQuickActionsSortedWithCoreDuet"), (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v5 = AppBooleanValue == 0;
  else
    v5 = 0;
  v6 = !v5;
  sortUsingCoreDuetAvailable_enabled = v6;
  if (v5)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNQuickActionsUsageManager.m", 67, 4, CFSTR("Missing entitlement for CoreDuet. Please add com.apple.coreduetd.allow to the entitlements of the app."), v1, v2, v3, v4, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entitlementVerifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sortUsingCoreDuetAvailable_enabled = objc_msgSend(v8, "currentProcessHasBooleanEntitlement:error:", *MEMORY[0x1E0D137B0], 0);

  }
}

void __48__CNQuickActionsUsageManager_managerForContact___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)managerForContact__mapTable;
  managerForContact__mapTable = v0;

}

@end
