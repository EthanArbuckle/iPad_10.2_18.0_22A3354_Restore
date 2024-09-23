@implementation AXElementFetcher

+ (id)systemWideElement
{
  return +[AXElement systemWideElement](AXElement, "systemWideElement");
}

+ (id)springBoardElement
{
  void *v2;
  void *v3;

  +[AXElementFetcher systemWideElement](AXElementFetcher, "systemWideElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementForAttribute:", 1000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AXElementFetcher)initWithDelegate:(id)a3 fetchEvents:(unint64_t)a4 enableEventManagement:(BOOL)a5 enableGrouping:(BOOL)a6 shouldIncludeNonScannerElements:(BOOL)a7 beginEnabled:(BOOL)a8
{
  _BOOL4 v11;
  id v14;
  AXElementFetcher *v15;
  AXElementFetcher *v16;
  uint64_t v17;
  NSMapTable *fetchObservers;
  NSMutableDictionary *v19;
  NSMutableDictionary *postFetchFilters;
  dispatch_queue_t v21;
  OS_dispatch_queue *elementFetchQueue;
  dispatch_queue_t v23;
  OS_dispatch_queue *elementAccessQueue;
  dispatch_queue_t v25;
  OS_dispatch_queue *filterAccessQueue;
  AXElementFetcher *v27;
  objc_super v29;

  v11 = a5;
  v14 = a3;
  v29.receiver = self;
  v29.super_class = (Class)AXElementFetcher;
  v15 = -[AXElementFetcher init](&v29, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_9;
  objc_storeWeak((id *)&v15->_delegate, v14);
  v16->_enabled = a8;
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v17 = objc_claimAutoreleasedReturnValue();
  fetchObservers = v16->_fetchObservers;
  v16->_fetchObservers = (NSMapTable *)v17;

  v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  postFetchFilters = v16->_postFetchFilters;
  v16->_postFetchFilters = v19;

  -[AXElementFetcher addFetchEvents:](v16, "addFetchEvents:", a4);
  v16->_groupingEnabled = a6;
  v16->_shouldIncludeNonScannerElements = a7;
  v21 = dispatch_queue_create("ax-element-fetch", 0);
  elementFetchQueue = v16->_elementFetchQueue;
  v16->_elementFetchQueue = (OS_dispatch_queue *)v21;

  v23 = dispatch_queue_create("ax-element-access", 0);
  elementAccessQueue = v16->_elementAccessQueue;
  v16->_elementAccessQueue = (OS_dispatch_queue *)v23;

  v25 = dispatch_queue_create("ax-filter-access", 0);
  filterAccessQueue = v16->_filterAccessQueue;
  v16->_filterAccessQueue = (OS_dispatch_queue *)v25;

  if (!v16->_elementFetchQueue || !v16->_elementAccessQueue || !v16->_filterAccessQueue)
  {
    NSLog((NSString *)CFSTR("Error: AXElementFetcher was not able to create its queues"));
LABEL_9:
    v27 = 0;
    goto LABEL_10;
  }
  if (v11)
    -[AXElementFetcher enableEventManagement](v16, "enableEventManagement");
  v27 = v16;
LABEL_10:

  return v27;
}

- (void)dealloc
{
  objc_super v3;

  -[AXElementFetcher _tearDownEventCoalesceTimer](self, "_tearDownEventCoalesceTimer");
  -[AXElementFetcher disableEventManagement](self, "disableEventManagement");
  -[AXElementFetcher unregisterAllFetchObservers](self, "unregisterAllFetchObservers");
  v3.receiver = self;
  v3.super_class = (Class)AXElementFetcher;
  -[AXElementFetcher dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXElementFetcher _debugStringForFetchEvents:](self, "_debugStringForFetchEvents:", -[AXElementFetcher activeFetchEvents](self, "activeFetchEvents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXElementFetcher isFetchingElements](self, "isFetchingElements"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElementFetcher currentApps](self, "currentApps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXElementFetcher isGroupingEnabled](self, "isGroupingEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXElementFetcher<%p>. FetchEvents:%@. IsFetching:%@ CurrentApp:%@ UsingGroups:%@"), self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_setCurrentApplications:(id)a3
{
  objc_storeStrong((id *)&self->_customCurrentApps, a3);
}

- (AXElement)nativeFocusElement
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  +[AXElement primaryApp](AXElement, "primaryApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeFocusPreferredElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v3);

  if (v5)
  {
    objc_msgSend(v3, "nativeFocusPreferredElement");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return (AXElement *)v3;
}

- (id)inCallServiceApplication
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementForAttribute:shouldFetchAttributes:", 1007, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uiElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectWithAXAttribute:", 3003);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.InCallService")))
    v6 = v3;
  else
    v6 = 0;

  return v6;
}

- (NSArray)currentApps
{
  NSArray *currentApps;

  currentApps = self->_currentApps;
  if (!currentApps)
  {
    -[AXElementFetcher _updateCurrentApps](self, "_updateCurrentApps");
    currentApps = self->_currentApps;
  }
  return currentApps;
}

- (BOOL)_updateCurrentApps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSArray *customCurrentApps;
  uint64_t v13;
  int v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "uiElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithAXAttribute:", 1111);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __38__AXElementFetcher__updateCurrentApps__block_invoke;
    v19 = &unk_1E6919E98;
    v20 = v8;
    v9 = v6;
    v21 = v9;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v16);
    if (!objc_msgSend(v9, "count", v16, v17, v18, v19))
    {
      objc_msgSend((id)objc_opt_class(), "springBoardElement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend((id)objc_opt_class(), "springBoardElement");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v11);

      }
    }

  }
  customCurrentApps = self->_customCurrentApps;
  if (customCurrentApps)
  {
    v13 = -[NSArray mutableCopy](customCurrentApps, "mutableCopy");

    v6 = (void *)v13;
  }
  v14 = -[NSArray isEqual:](self->_currentApps, "isEqual:", v6) ^ 1;
  -[AXElementFetcher setCurrentApps:](self, "setCurrentApps:", v6);

  return v14;
}

void __38__AXElementFetcher__updateCurrentApps__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v6);

}

- (BOOL)willFetchElements
{
  return self->_scheduledFetchEvent != 0;
}

- (NSArray)availableElements
{
  NSObject *elementAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  elementAccessQueue = self->_elementAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AXElementFetcher_availableElements__block_invoke;
  v5[3] = &unk_1E6919BB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(elementAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __37__AXElementFetcher_availableElements__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "elementCache");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (AXElementGroup)rootGroup
{
  NSObject *elementAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  elementAccessQueue = self->_elementAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__AXElementFetcher_rootGroup__block_invoke;
  v5[3] = &unk_1E6919BB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(elementAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AXElementGroup *)v3;
}

void __29__AXElementFetcher_rootGroup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "rootGroupCache");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (AXElementGroup)keyboardGroup
{
  NSObject *elementAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  elementAccessQueue = self->_elementAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AXElementFetcher_keyboardGroup__block_invoke;
  v5[3] = &unk_1E6919BB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(elementAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AXElementGroup *)v3;
}

void __33__AXElementFetcher_keyboardGroup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "keyboardGroupCache");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (AXElementGroup)firstKeyboardRow
{
  void *v2;
  void *v3;

  -[AXElementFetcher keyboardGroup](self, "keyboardGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstChildPassingTest:", &__block_literal_global_12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AXElementGroup *)v3;
}

uint64_t __36__AXElementFetcher_firstKeyboardRow__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isGroup"))
    v3 = objc_msgSend(v2, "isKeyboardRow");
  else
    v3 = 0;

  return v3;
}

- (AXElementGroup)lastKeyboardRow
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[AXElementFetcher keyboardGroup](self, "keyboardGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descendantsPassingTest:", &__block_literal_global_194);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v3, "reverseObjectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "isKeyboardRow") & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return (AXElementGroup *)v5;
}

uint64_t __35__AXElementFetcher_lastKeyboardRow__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isGroup"))
    v3 = objc_msgSend(v2, "isKeyboardRow");
  else
    v3 = 0;

  return v3;
}

- (AXElementGroup)elementCommunityGroup
{
  NSObject *elementAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  elementAccessQueue = self->_elementAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AXElementFetcher_elementCommunityGroup__block_invoke;
  v5[3] = &unk_1E6919BB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(elementAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AXElementGroup *)v3;
}

void __41__AXElementFetcher_elementCommunityGroup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "elementCommunityGroupCache");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)registerFetchObserver:(id)a3 targetQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  if (!v9)
  {
    v9 = (id)MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C80D38];
  }
  v7 = a3;
  -[AXElementFetcher fetchObservers](self, "fetchObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)unregisterFetchObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXElementFetcher fetchObservers](self, "fetchObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)unregisterAllFetchObservers
{
  id v2;

  -[AXElementFetcher fetchObservers](self, "fetchObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)_notifyObserversWillFetchElementsForEvent:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[6];
  id v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[AXElementFetcher currentApps](self, "currentApps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[AXElementFetcher fetchObservers](self, "fetchObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[AXElementFetcher fetchObservers](self, "fetchObservers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v11);
          v13 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __62__AXElementFetcher__notifyObserversWillFetchElementsForEvent___block_invoke;
          block[3] = &unk_1E6919F00;
          block[4] = v11;
          block[5] = self;
          v17 = a3;
          v16 = v4;
          dispatch_sync(v13, block);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

uint64_t __62__AXElementFetcher__notifyObserversWillFetchElementsForEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetcher:willFetchElementsForEvent:fromApplications:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_notifyObserversNativeFocusElementDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[6];
  id v15;
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
  -[AXElementFetcher fetchObservers](self, "fetchObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[AXElementFetcher fetchObservers](self, "fetchObservers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v11);
          v13 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __64__AXElementFetcher__notifyObserversNativeFocusElementDidChange___block_invoke;
          block[3] = &unk_1E6919C20;
          block[4] = v11;
          block[5] = self;
          v15 = v4;
          dispatch_sync(v13, block);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

uint64_t __64__AXElementFetcher__notifyObserversNativeFocusElementDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetcher:nativeFocusElementDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_notifyObserversUpdateElementVisuals:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[6];
  id v15;
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
  -[AXElementFetcher fetchObservers](self, "fetchObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[AXElementFetcher fetchObservers](self, "fetchObservers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v11);
          v13 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __57__AXElementFetcher__notifyObserversUpdateElementVisuals___block_invoke;
          block[3] = &unk_1E6919C20;
          block[4] = v11;
          block[5] = self;
          v15 = v4;
          dispatch_sync(v13, block);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

uint64_t __57__AXElementFetcher__notifyObserversUpdateElementVisuals___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetcher:updateElementVisuals:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_notifyObserversApplicationWasActivated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[6];
  id v15;
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
  -[AXElementFetcher fetchObservers](self, "fetchObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[AXElementFetcher fetchObservers](self, "fetchObservers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v11);
          v13 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __60__AXElementFetcher__notifyObserversApplicationWasActivated___block_invoke;
          block[3] = &unk_1E6919C20;
          block[4] = v11;
          block[5] = self;
          v15 = v4;
          dispatch_sync(v13, block);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

uint64_t __60__AXElementFetcher__notifyObserversApplicationWasActivated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetcher:applicationWasActivated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_notifyObserversScreenWillChange:(__CFData *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[7];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AXElementFetcher fetchObservers](self, "fetchObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[AXElementFetcher fetchObservers](self, "fetchObservers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v11);
          v13 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __53__AXElementFetcher__notifyObserversScreenWillChange___block_invoke;
          block[3] = &unk_1E6919F28;
          block[4] = v11;
          block[5] = self;
          block[6] = a3;
          dispatch_sync(v13, block);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

uint64_t __53__AXElementFetcher__notifyObserversScreenWillChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetcher:screenWillChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_notifyObserversMediaDidBegin:(__CFData *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[7];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AXElementFetcher fetchObservers](self, "fetchObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[AXElementFetcher fetchObservers](self, "fetchObservers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v11);
          v13 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __50__AXElementFetcher__notifyObserversMediaDidBegin___block_invoke;
          block[3] = &unk_1E6919F28;
          block[4] = v11;
          block[5] = self;
          block[6] = a3;
          dispatch_sync(v13, block);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

uint64_t __50__AXElementFetcher__notifyObserversMediaDidBegin___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetcher:mediaDidBegin:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_notifyObserversDidFetchElementsForEvent:(unint64_t)a3 foundNewElements:(BOOL)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD block[7];
  BOOL v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[AXElementFetcher fetchObservers](self, "fetchObservers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[AXElementFetcher fetchObservers](self, "fetchObservers");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v12);
          v14 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __78__AXElementFetcher__notifyObserversDidFetchElementsForEvent_foundNewElements___block_invoke;
          block[3] = &unk_1E6919F50;
          block[4] = v12;
          block[5] = self;
          block[6] = a3;
          v17 = a4;
          dispatch_sync(v14, block);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

uint64_t __78__AXElementFetcher__notifyObserversDidFetchElementsForEvent_foundNewElements___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetcher:didFetchElementsForEvent:foundNewElements:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (void)_notifyObserversDidScheduleFetchEvent:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[7];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AXElementFetcher fetchObservers](self, "fetchObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[AXElementFetcher fetchObservers](self, "fetchObservers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v11);
          v13 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __58__AXElementFetcher__notifyObserversDidScheduleFetchEvent___block_invoke;
          block[3] = &unk_1E6919F28;
          block[4] = v11;
          block[5] = self;
          block[6] = a3;
          dispatch_async(v13, block);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

uint64_t __58__AXElementFetcher__notifyObserversDidScheduleFetchEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetcher:didScheduleFetchEvent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)addFetchEvents:(unint64_t)a3
{
  -[AXElementFetcher setActiveFetchEvents:](self, "setActiveFetchEvents:", -[AXElementFetcher activeFetchEvents](self, "activeFetchEvents") | a3 | 1);
}

- (void)removeFetchEvents:(unint64_t)a3
{
  -[AXElementFetcher setActiveFetchEvents:](self, "setActiveFetchEvents:", -[AXElementFetcher activeFetchEvents](self, "activeFetchEvents") & ~a3 | 1);
}

- (void)refresh
{
  -[AXElementFetcher _fetchEventOccurred:](self, "_fetchEventOccurred:", 1);
}

- (void)fetchEventOccurred:(unint64_t)a3
{
  if (!-[AXElementFetcher isEventManagementEnabled](self, "isEventManagementEnabled")
    || !-[AXElementFetcher _fetchEventCanBeManaged:](self, "_fetchEventCanBeManaged:", a3))
  {
    -[AXElementFetcher _fetchEventOccurred:](self, "_fetchEventOccurred:", a3);
  }
}

- (void)_fetchEventOccurred:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  int64_t v8;
  int64_t v9;

  if (self->_enabled)
  {
    -[AXElementFetcher delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AXElementFetcher delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isSystemSleeping:", self);

      if ((v7 & 1) != 0)
        return;
    }
    else
    {

    }
    v8 = -[AXElementFetcher _priorityForFetchEvent:](self, "_priorityForFetchEvent:", a3);
    if ((v8 & 0x8000000000000000) == 0)
    {
      v9 = v8;
      if ((-[AXElementFetcher activeFetchEvents](self, "activeFetchEvents") & a3) != 0
        && v9 >= -[AXElementFetcher _priorityForFetchEvent:](self, "_priorityForFetchEvent:", self->_scheduledFetchEvent))
      {
        -[AXElementFetcher _scheduleFetchEvent:](self, "_scheduleFetchEvent:", a3);
      }
    }
  }
}

- (void)_handleNativeFocusItemDidChange:(__CFData *)a3
{
  NSObject *elementFetchQueue;
  _QWORD block[5];

  elementFetchQueue = self->_elementFetchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AXElementFetcher__handleNativeFocusItemDidChange___block_invoke;
  block[3] = &unk_1E6919A38;
  block[4] = self;
  dispatch_async(elementFetchQueue, block);
}

void __52__AXElementFetcher__handleNativeFocusItemDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "nativeFocusElement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_notifyObserversNativeFocusElementDidChange:", v2);

}

- (void)_handleUpdateElementVisuals:(__CFData *)a3
{
  NSObject *elementFetchQueue;
  _QWORD v4[6];

  elementFetchQueue = self->_elementFetchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__AXElementFetcher__handleUpdateElementVisuals___block_invoke;
  v4[3] = &unk_1E6919F78;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(elementFetchQueue, v4);
}

uint64_t __48__AXElementFetcher__handleUpdateElementVisuals___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversUpdateElementVisuals:", *(_QWORD *)(a1 + 40));
}

- (void)_handleApplicationWasActivated:(id)a3
{
  id v4;
  NSObject *elementFetchQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    elementFetchQueue = self->_elementFetchQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__AXElementFetcher__handleApplicationWasActivated___block_invoke;
    v6[3] = &unk_1E6919510;
    v6[4] = self;
    v7 = v4;
    dispatch_async(elementFetchQueue, v6);

  }
}

uint64_t __51__AXElementFetcher__handleApplicationWasActivated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversApplicationWasActivated:", *(_QWORD *)(a1 + 40));
}

- (void)_handleScreenWillChange:(__CFData *)a3
{
  NSObject *elementFetchQueue;
  _QWORD v4[6];

  elementFetchQueue = self->_elementFetchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__AXElementFetcher__handleScreenWillChange___block_invoke;
  v4[3] = &unk_1E6919F78;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(elementFetchQueue, v4);
}

uint64_t __44__AXElementFetcher__handleScreenWillChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversScreenWillChange:", *(_QWORD *)(a1 + 40));
}

- (void)_handleMediaDidBegin:(__CFData *)a3
{
  NSObject *elementFetchQueue;
  _QWORD v4[6];

  elementFetchQueue = self->_elementFetchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__AXElementFetcher__handleMediaDidBegin___block_invoke;
  v4[3] = &unk_1E6919F78;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(elementFetchQueue, v4);
}

uint64_t __41__AXElementFetcher__handleMediaDidBegin___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversMediaDidBegin:", *(_QWORD *)(a1 + 40));
}

- (void)_tearDownEventCoalesceTimer
{
  NSObject *eventCoalesceTimer;
  OS_dispatch_source *v4;

  eventCoalesceTimer = self->_eventCoalesceTimer;
  if (eventCoalesceTimer)
  {
    dispatch_source_cancel(eventCoalesceTimer);
    v4 = self->_eventCoalesceTimer;
    self->_eventCoalesceTimer = 0;

  }
}

- (void)_scheduleFetchEvent:(unint64_t)a3
{
  double v5;
  double v6;
  NSObject *eventCoalesceTimer;
  dispatch_time_t v8;
  NSObject *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v14;
  _QWORD handler[5];

  -[AXElementFetcher _notifyObserversDidScheduleFetchEvent:](self, "_notifyObserversDidScheduleFetchEvent:", self->_scheduledFetchEvent);
  -[AXElementFetcher _delayForFetchEvent:](self, "_delayForFetchEvent:", a3);
  v6 = v5;
  self->_scheduledFetchEvent = a3;
  eventCoalesceTimer = self->_eventCoalesceTimer;
  if (eventCoalesceTimer)
  {
    v8 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    dispatch_source_set_timer(eventCoalesceTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v9);
    v11 = self->_eventCoalesceTimer;
    self->_eventCoalesceTimer = v10;

    v12 = self->_eventCoalesceTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __40__AXElementFetcher__scheduleFetchEvent___block_invoke;
    handler[3] = &unk_1E6919A38;
    handler[4] = self;
    dispatch_source_set_event_handler(v12, handler);
    v13 = self->_eventCoalesceTimer;
    v14 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_eventCoalesceTimer);
  }
}

uint64_t __40__AXElementFetcher__scheduleFetchEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v7[6];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__AXElementFetcher__scheduleFetchEvent___block_invoke_2;
  v7[3] = &unk_1E6919F78;
  v7[4] = v4;
  v7[5] = v3;
  dispatch_async(v5, v7);
  return objc_msgSend(*(id *)(a1 + 32), "_tearDownEventCoalesceTimer");
}

uint64_t __40__AXElementFetcher__scheduleFetchEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  v2 = objc_msgSend(*(id *)(a1 + 32), "_updateCurrentApps");
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversWillFetchElementsForEvent:", *(_QWORD *)(a1 + 40));
  v3 = objc_msgSend(*(id *)(a1 + 32), "isGroupingEnabled");
  v4 = *(void **)(a1 + 32);
  if (v3)
    v5 = objc_msgSend(v4, "_fetchGroups:", v2);
  else
    v5 = objc_msgSend(v4, "_fetchElements:", v2);
  v6 = v5;
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
  result = objc_msgSend(*(id *)(a1 + 32), "_notifyObserversDidFetchElementsForEvent:foundNewElements:", *(_QWORD *)(a1 + 40), v6);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = 0;
  return result;
}

- (double)_delayForFetchEvent:(unint64_t)a3
{
  double result;
  double v4;
  BOOL v5;

  result = 0.0;
  if ((uint64_t)a3 <= 15)
  {
    v4 = 1.0;
    if (a3 == 8)
      result = 1.0;
    if (a3 == 4)
      result = 1.0;
    v5 = a3 == 2;
    goto LABEL_11;
  }
  if ((uint64_t)a3 <= 127)
  {
    v4 = 1.0;
    if (a3 == 64)
      result = 1.0;
    v5 = a3 == 16;
LABEL_11:
    if (v5)
      return v4;
    return result;
  }
  if (a3 == 128)
    return 0.300000012;
  if (a3 == 256)
    return 0.0500000007;
  return result;
}

- (int64_t)_priorityForFetchEvent:(unint64_t)a3
{
  int64_t result;

  result = -1;
  if ((uint64_t)a3 <= 15)
  {
    switch(a3)
    {
      case 0uLL:
        return result;
      case 1uLL:
        result = 1;
        break;
      case 2uLL:
        result = 7;
        break;
      case 4uLL:
        result = 3;
        break;
      case 8uLL:
        result = 6;
        break;
      default:
        return 0;
    }
    return result;
  }
  if ((uint64_t)a3 > 63)
  {
    switch(a3)
    {
      case 0x40uLL:
        return 4;
      case 0x80uLL:
        return 2;
      case 0x100uLL:
        return 8;
    }
    return 0;
  }
  if (a3 == 16)
    return 5;
  if (a3 != 32)
    return 0;
  return result;
}

- (BOOL)_fetchEventCanBeManaged:(unint64_t)a3
{
  return a3 - 4 <= 0x3C && ((1 << (a3 - 4)) & 0x1000000010001011) != 0 || a3 == 256 || a3 == 128;
}

- (id)_axNotificationsForManagedEvents
{
  return &unk_1E6926B48;
}

- (void)enableEventManagement
{
  void *v3;
  const __AXUIElement *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v17;
  __CFRunLoop *Current;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  pid_t pid;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!-[AXElementFetcher isEventManagementEnabled](self, "isEventManagementEnabled"))
  {
    +[AXElementFetcher systemWideElement](AXElementFetcher, "systemWideElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (const __AXUIElement *)objc_msgSend(v3, "elementRef");

    pid = 0;
    v5 = AXUIElementGetPid(v4, &pid);
    if ((_DWORD)v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog((NSString *)CFSTR("AXError: Not able to get pid for systemElement. error:%@. systemElementRef:%@"), v6, v4);
LABEL_6:

      return;
    }
    v7 = AXObserverCreate(pid, (AXObserverCallback)_accessibilityEventsHandler_0, &self->_axRuntimeNotificationObserver);
    if ((_DWORD)v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog((NSString *)CFSTR("AXError: Not able to create ax observer. error:%@"), v6);
      goto LABEL_6;
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[AXElementFetcher _axNotificationsForManagedEvents](self, "_axNotificationsForManagedEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v14 = AXObserverAddNotification(self->_axRuntimeNotificationObserver, v4, (CFStringRef)objc_msgSend(v13, "intValue"), self);
          if ((_DWORD)v14)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog((NSString *)CFSTR("Not able to register for axNotification:%@. error:%@"), v13, v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

    RunLoopSource = AXObserverGetRunLoopSource(self->_axRuntimeNotificationObserver);
    if (RunLoopSource)
    {
      v17 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v17, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
      -[AXElementFetcher setEventManagementEnabled:](self, "setEventManagementEnabled:", 1);
    }
  }
}

- (void)disableEventManagement
{
  void *v3;
  const __AXUIElement *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  __AXObserver *axRuntimeNotificationObserver;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[AXElementFetcher isEventManagementEnabled](self, "isEventManagementEnabled"))
  {
    if (self->_axRuntimeNotificationObserver)
    {
      +[AXElementFetcher systemWideElement](AXElementFetcher, "systemWideElement");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (const __AXUIElement *)objc_msgSend(v3, "elementRef");

      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      -[AXElementFetcher _axNotificationsForManagedEvents](self, "_axNotificationsForManagedEvents");
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
            v11 = AXObserverRemoveNotification(self->_axRuntimeNotificationObserver, v4, (CFStringRef)objc_msgSend(v10, "intValue"));
            if ((_DWORD)v11)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              NSLog((NSString *)CFSTR("Not able to unregister for axNotification:%@. error:%@"), v10, v12);

            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v7);
      }

      axRuntimeNotificationObserver = self->_axRuntimeNotificationObserver;
      if (axRuntimeNotificationObserver)
        CFRelease(axRuntimeNotificationObserver);
      self->_axRuntimeNotificationObserver = 0;
    }
    -[AXElementFetcher setEventManagementEnabled:](self, "setEventManagementEnabled:", 0);
  }
}

- (BOOL)_shouldConsiderCacheAsInvalid
{
  return 0;
}

- (void)_sendFakeScreenChangeIfNecessaryForGroups:(id)a3 orElements:(id)a4 appsDidChange:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD block[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!-[AXElementFetcher didSendFakeScreenChangeOnLastFetch](self, "didSendFakeScreenChangeOnLastFetch"))
  {
    if (a5)
      goto LABEL_21;
    -[AXElementFetcher currentApps](self, "currentApps");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == 1)
    {
      -[AXElementFetcher currentApps](self, "currentApps");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isSpringBoard");

      if (!v13)
        goto LABEL_21;
      if (v8)
      {
        objc_msgSend(v8, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstDescendantPassingTest:", &__block_literal_global_231);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          goto LABEL_21;
        goto LABEL_20;
      }
      if (!objc_msgSend(v9, "count"))
      {
LABEL_20:
        -[AXElementFetcher setDidSendFakeScreenChangeOnLastFetch:](self, "setDidSendFakeScreenChangeOnLastFetch:", 1);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __87__AXElementFetcher__sendFakeScreenChangeIfNecessaryForGroups_orElements_appsDidChange___block_invoke_2;
        block[3] = &unk_1E6919A38;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
        goto LABEL_21;
      }
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = v9;
      v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v22;
        while (2)
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v10);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v19), "traits") & 0x800000) != 0)
            {

              goto LABEL_20;
            }
            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v17)
            continue;
          break;
        }
      }
    }

    goto LABEL_21;
  }
  -[AXElementFetcher setDidSendFakeScreenChangeOnLastFetch:](self, "setDidSendFakeScreenChangeOnLastFetch:", 0);
LABEL_21:

}

BOOL __87__AXElementFetcher__sendFakeScreenChangeIfNecessaryForGroups_orElements_appsDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_msgSend(v2, "isGroup") & 1) == 0 && (objc_msgSend(v2, "traits") & 0x800000) != 0;

  return v3;
}

uint64_t __87__AXElementFetcher__sendFakeScreenChangeIfNecessaryForGroups_orElements_appsDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchEventOccurred:", 8);
}

- (BOOL)_fetchElements:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  NSObject *filterAccessQueue;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *elementAccessQueue;
  id v17;
  id v18;
  BOOL v19;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD block[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  _BYTE v40[128];
  uint64_t v41;

  v3 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[AXElementFetcher _fetchUnprocessedElements:](self, "_fetchUnprocessedElements:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXElementGroup groupWithElements:](AXElementGroup, "groupWithElements:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElementFetcher _sendFakeScreenChangeIfNecessaryForGroups:orElements:appsDidChange:](self, "_sendFakeScreenChangeIfNecessaryForGroups:orElements:appsDidChange:", 0, v6, v3);
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  v35 = 0;
  filterAccessQueue = self->_filterAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AXElementFetcher__fetchElements___block_invoke;
  block[3] = &unk_1E6919BB0;
  block[4] = self;
  block[5] = &v30;
  dispatch_sync(filterAccessQueue, block);
  v9 = v6;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = (id)v31[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
  v12 = v9;
  if (v11)
  {
    v13 = *(_QWORD *)v26;
    v12 = v9;
    do
    {
      v14 = 0;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        -[AXElementFetcher _filterElements:withFilter:](self, "_filterElements:withFilter:", v15, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
    }
    while (v11);
  }

  elementAccessQueue = self->_elementAccessQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __35__AXElementFetcher__fetchElements___block_invoke_2;
  v21[3] = &unk_1E6919FC0;
  v21[4] = self;
  v22 = v12;
  v23 = v7;
  v24 = &v36;
  v17 = v7;
  v18 = v12;
  dispatch_sync(elementAccessQueue, v21);
  v19 = *((_BYTE *)v37 + 24) != 0;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v19;
}

void __35__AXElementFetcher__fetchElements___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "postFetchFilters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __35__AXElementFetcher__fetchElements___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "elementCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "isEqualToArray:", *(_QWORD *)(a1 + 40)) ^ 1;

  objc_msgSend(*(id *)(a1 + 32), "setElementCache:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setElementCommunityGroupCache:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setRootGroupCache:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setKeyboardGroupCache:", 0);
}

- (id)_fetchUnprocessedElements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  AXElementFetcher *v43;
  id v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _BYTE v54[128];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXElementFetcher shouldIncludeNonScannerElements](self, "shouldIncludeNonScannerElements"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = self;
  v44 = (id)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[AXElementFetcher currentApps](self, "currentApps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v11, "uiElement");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uiElementsWithAttribute:parameter:", 94500, v45);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[AXElement elementsWithUIElements:](AXElement, "elementsWithUIElements:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(v44, "addObjectsFromArray:", v14);
          objc_msgSend(v14, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[AXElementGroup groupWithElements:](AXElementGroup, "groupWithElements:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "setElementCommunity:", v11);
          objc_msgSend(v4, "addObject:", v17);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v8);
  }

  -[AXElementFetcher inCallServiceApplication](v43, "inCallServiceApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 && !objc_msgSend(v44, "count"))
  {
    objc_msgSend(v18, "uiElement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uiElementsWithAttribute:parameter:", 94500, v45);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXElement elementsWithUIElements:](AXElement, "elementsWithUIElements:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(v44, "addObjectsFromArray:", v21);
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[AXElementGroup groupWithElements:](AXElementGroup, "groupWithElements:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "setElementCommunity:", v18);
      objc_msgSend(v4, "addObject:", v24);

    }
  }
  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "accessibilityUIServerApplication");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "uiElement");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "uiElementsWithAttribute:parameter:", 94500, v45);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXElement elementsWithUIElements:](AXElement, "elementsWithUIElements:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v29, "count"))
  {
    objc_msgSend(v44, "addObjectsFromArray:", v29);
    objc_msgSend(v29, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXElementGroup groupWithElements:](AXElementGroup, "groupWithElements:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "setElementCommunity:", v26);
    objc_msgSend(v4, "addObject:", v32);

  }
  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "systemApplication");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "elementForAttribute:", 1513);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "uiElement");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "uiElementsWithAttribute:parameter:", 94500, v45);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXElement elementsWithUIElements:](AXElement, "elementsWithUIElements:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v38, "count"))
  {
    objc_msgSend(v44, "addObjectsFromArray:", v38);
    objc_msgSend(v38, "firstObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXElementGroup groupWithElements:](AXElementGroup, "groupWithElements:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "setElementCommunity:", v35);
    objc_msgSend(v4, "addObject:", v41);

  }
  return v44;
}

- (void)addPostFetchFilter:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *filterAccessQueue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    filterAccessQueue = self->_filterAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__AXElementFetcher_addPostFetchFilter_withIdentifier___block_invoke;
    block[3] = &unk_1E6919FE8;
    block[4] = self;
    v12 = v6;
    v11 = v8;
    dispatch_async(filterAccessQueue, block);

  }
}

void __54__AXElementFetcher_addPostFetchFilter_withIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "postFetchFilters");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));

}

- (void)removePostFetchFilterWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *filterAccessQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    filterAccessQueue = self->_filterAccessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__AXElementFetcher_removePostFetchFilterWithIdentifier___block_invoke;
    v7[3] = &unk_1E6919510;
    v7[4] = self;
    v8 = v4;
    dispatch_async(filterAccessQueue, v7);

  }
}

void __56__AXElementFetcher_removePostFetchFilterWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "postFetchFilters");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)removeAllPostFetchFilters
{
  NSObject *filterAccessQueue;
  _QWORD block[5];

  filterAccessQueue = self->_filterAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AXElementFetcher_removeAllPostFetchFilters__block_invoke;
  block[3] = &unk_1E6919A38;
  block[4] = self;
  dispatch_async(filterAccessQueue, block);
}

void __45__AXElementFetcher_removeAllPostFetchFilters__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "postFetchFilters");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (id)_filterElements:(id)a3 withFilter:(id)a4
{
  id v5;
  id v6;
  unsigned int (**v7)(_QWORD, _QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (unsigned int (**)(_QWORD, _QWORD))v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (v7[2](v7, v14))
            objc_msgSend(v8, "addObject:", v14, (_QWORD)v16);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  return v8;
}

- (id)findElementMatchingElement:(id)a3
{
  id v4;
  id v5;
  NSObject *elementAccessQueue;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4 && !-[AXElementFetcher _shouldConsiderCacheAsInvalid](self, "_shouldConsiderCacheAsInvalid"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    v16 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__AXElementFetcher_findElementMatchingElement___block_invoke;
    block[3] = &unk_1E691A010;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(elementAccessQueue, block);
    v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __47__AXElementFetcher_findElementMatchingElement___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
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
  objc_msgSend(*(id *)(a1 + 32), "elementCache", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 40)))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)findElementMatchingBlock:(id)a3
{
  id v4;
  id v5;
  NSObject *elementAccessQueue;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4 && !-[AXElementFetcher _shouldConsiderCacheAsInvalid](self, "_shouldConsiderCacheAsInvalid"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    v16 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__AXElementFetcher_findElementMatchingBlock___block_invoke;
    block[3] = &unk_1E691A038;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(elementAccessQueue, block);
    v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __45__AXElementFetcher_findElementMatchingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
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
  objc_msgSend(*(id *)(a1 + 32), "elementCache", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)findElementsMatchingBlock:(id)a3
{
  return -[AXElementFetcher _findElementsMatchingBlock:internalRequest:](self, "_findElementsMatchingBlock:internalRequest:", a3, 0);
}

- (id)_findElementsMatchingBlock:(id)a3 internalRequest:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *elementAccessQueue;
  void *v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a4;
  v6 = a3;
  if (v6 && (!-[AXElementFetcher _shouldConsiderCacheAsInvalid](self, "_shouldConsiderCacheAsInvalid") || v4))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__2;
    v18 = __Block_byref_object_dispose__2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    elementAccessQueue = self->_elementAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__AXElementFetcher__findElementsMatchingBlock_internalRequest___block_invoke;
    block[3] = &unk_1E691A038;
    block[4] = self;
    v12 = v6;
    v13 = &v14;
    dispatch_sync(elementAccessQueue, block);
    if (!objc_msgSend((id)v15[5], "count"))
    {
      v9 = (void *)v15[5];
      v15[5] = 0;

    }
    v7 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __63__AXElementFetcher__findElementsMatchingBlock_internalRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "elementCache", 0);
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
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)closestElementToElement:(id)a3
{
  id v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  CGRect v12;
  CGRect v13;

  v4 = a3;
  if (v4 && !-[AXElementFetcher _shouldConsiderCacheAsInvalid](self, "_shouldConsiderCacheAsInvalid"))
  {
    -[AXElementFetcher findElementMatchingElement:](self, "findElementMatchingElement:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v4, "visibleFrame");
      x = v12.origin.x;
      y = v12.origin.y;
      width = v12.size.width;
      height = v12.size.height;
      MidX = CGRectGetMidX(v12);
      v13.origin.x = x;
      v13.origin.y = y;
      v13.size.width = width;
      v13.size.height = height;
      -[AXElementFetcher closestElementToPoint:](self, "closestElementToPoint:", MidX, CGRectGetMidY(v13));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)closestElementToPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id v6;
  NSObject *elementAccessQueue;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  y = a3.y;
  x = a3.x;
  if (-[AXElementFetcher _shouldConsiderCacheAsInvalid](self, "_shouldConsiderCacheAsInvalid"))
  {
    v6 = 0;
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__2;
    v14 = __Block_byref_object_dispose__2;
    v15 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__AXElementFetcher_closestElementToPoint___block_invoke;
    v9[3] = &unk_1E69198C0;
    *(CGFloat *)&v9[6] = x;
    *(CGFloat *)&v9[7] = y;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(elementAccessQueue, v9);
    v6 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

  }
  return v6;
}

void __42__AXElementFetcher_closestElementToPoint___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "elementCache", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = 1.79769313e308;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "distanceToPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
        if (v9 < v6)
        {
          v10 = v9;
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
          v6 = v10;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (id)firstElement
{
  NSObject *elementAccessQueue;
  id v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (-[AXElementFetcher _shouldConsiderCacheAsInvalid](self, "_shouldConsiderCacheAsInvalid"))
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  elementAccessQueue = self->_elementAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__AXElementFetcher_firstElement__block_invoke;
  v6[3] = &unk_1E6919418;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(elementAccessQueue, v6);
  v5 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v5;
}

void __32__AXElementFetcher_firstElement__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "elementCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "elementCache");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (id)lastElement
{
  NSObject *elementAccessQueue;
  id v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (-[AXElementFetcher _shouldConsiderCacheAsInvalid](self, "_shouldConsiderCacheAsInvalid"))
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  elementAccessQueue = self->_elementAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__AXElementFetcher_lastElement__block_invoke;
  v6[3] = &unk_1E6919418;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(elementAccessQueue, v6);
  v5 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v5;
}

void __31__AXElementFetcher_lastElement__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "elementCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "elementCache");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (id)nextSiblingOfElement:(id)a3 didWrap:(BOOL *)a4
{
  id v6;
  id v7;
  NSObject *elementAccessQueue;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  BOOL *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  if (v6 && !-[AXElementFetcher _shouldConsiderCacheAsInvalid](self, "_shouldConsiderCacheAsInvalid"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__2;
    v18 = __Block_byref_object_dispose__2;
    v19 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__AXElementFetcher_nextSiblingOfElement_didWrap___block_invoke;
    v10[3] = &unk_1E691A060;
    v10[4] = self;
    v12 = &v14;
    v13 = a4;
    v11 = v6;
    dispatch_sync(elementAccessQueue, v10);
    v7 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __49__AXElementFetcher_nextSiblingOfElement_didWrap___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _BYTE *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  objc_msgSend(*(id *)(a1 + 32), "elementCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", *(_QWORD *)(a1 + 40));

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "elementCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 == 1)
    {
      v6 = *(_BYTE **)(a1 + 56);
      if (v6)
        *v6 = 1;
      v7 = *(void **)(a1 + 40);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = v7;
      v10 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v9;

    }
    else
    {
      v11 = v3 + 1;
      v12 = *(_BYTE **)(a1 + 56);
      if (v11 == v5)
      {
        if (v12)
          *v12 = 1;
        objc_msgSend(*(id *)(a1 + 32), "elementCache");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v12)
          *v12 = 0;
        objc_msgSend(*(id *)(a1 + 32), "elementCache");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndex:", v11);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
}

- (id)previousSiblingOfElement:(id)a3 didWrap:(BOOL *)a4
{
  id v6;
  id v7;
  NSObject *elementAccessQueue;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  BOOL *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  if (v6 && !-[AXElementFetcher _shouldConsiderCacheAsInvalid](self, "_shouldConsiderCacheAsInvalid"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__2;
    v18 = __Block_byref_object_dispose__2;
    v19 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__AXElementFetcher_previousSiblingOfElement_didWrap___block_invoke;
    v10[3] = &unk_1E691A060;
    v10[4] = self;
    v12 = &v14;
    v13 = a4;
    v11 = v6;
    dispatch_sync(elementAccessQueue, v10);
    v7 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __53__AXElementFetcher_previousSiblingOfElement_didWrap___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _BYTE *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  objc_msgSend(*(id *)(a1 + 32), "elementCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", *(_QWORD *)(a1 + 40));

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "elementCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 == 1)
    {
      v6 = *(_BYTE **)(a1 + 56);
      if (v6)
        *v6 = 1;
      v7 = *(void **)(a1 + 40);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = v7;
      v10 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v9;

    }
    else
    {
      v11 = *(_BYTE **)(a1 + 56);
      if (v3)
      {
        if (v11)
          *v11 = 0;
        objc_msgSend(*(id *)(a1 + 32), "elementCache");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", v3 - 1);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v11)
          *v11 = 1;
        objc_msgSend(*(id *)(a1 + 32), "elementCache");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastObject");
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
  }
}

- (id)_siblingOfGroupable:(id)a3 forDirection:(BOOL)a4 didWrap:(BOOL *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v8 = a3;
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "parentGroup");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
    }
    else
    {
      -[AXElementFetcher findGroupableMatchingGroupable:](self, "findGroupableMatchingGroupable:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "parentGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
    }
    if (v6)
      objc_msgSend(v11, "nextSiblingOfChild:didWrap:", v9, a5);
    else
      objc_msgSend(v11, "previousSiblingOfChild:didWrap:", v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)nextSiblingOfGroupable:(id)a3 didWrap:(BOOL *)a4
{
  return -[AXElementFetcher _siblingOfGroupable:forDirection:didWrap:](self, "_siblingOfGroupable:forDirection:didWrap:", a3, 1, a4);
}

- (id)previousSiblingOfGroupable:(id)a3 didWrap:(BOOL *)a4
{
  return -[AXElementFetcher _siblingOfGroupable:forDirection:didWrap:](self, "_siblingOfGroupable:forDirection:didWrap:", a3, 0, a4);
}

- (id)_findGroupableMatchingGroupable:(id)a3 inElementGroup:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEqual:", v6, (_QWORD)v16))
        {
          v13 = v12;
LABEL_13:
          v14 = v13;
          goto LABEL_14;
        }
        if (objc_msgSend(v12, "isGroup"))
        {
          -[AXElementFetcher _findGroupableMatchingGroupable:inElementGroup:](self, "_findGroupableMatchingGroupable:inElementGroup:", v6, v12);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (v13)
            goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)findGroupableMatchingGroupable:(id)a3
{
  id v4;
  id v5;
  NSObject *elementAccessQueue;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4 && !-[AXElementFetcher _shouldConsiderCacheAsInvalid](self, "_shouldConsiderCacheAsInvalid"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    v16 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__AXElementFetcher_findGroupableMatchingGroupable___block_invoke;
    block[3] = &unk_1E691A088;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(elementAccessQueue, block);
    v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __51__AXElementFetcher_findGroupableMatchingGroupable___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  objc_msgSend(v2, "rootGroupCache");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_findGroupableMatchingGroupable:inElementGroup:", v3, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_findGroupableMatchingBlock:(id)a3 inElementGroup:(id)a4
{
  unsigned int (**v6)(id, void *);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (unsigned int (**)(id, void *))a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v6[2](v6, v12))
        {
          v13 = v12;
LABEL_13:
          v14 = v13;
          goto LABEL_14;
        }
        if (objc_msgSend(v12, "isGroup", (_QWORD)v16))
        {
          -[AXElementFetcher _findGroupableMatchingBlock:inElementGroup:](self, "_findGroupableMatchingBlock:inElementGroup:", v6, v12);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (v13)
            goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)findGroupableMatchingBlock:(id)a3
{
  id v4;
  id v5;
  NSObject *elementAccessQueue;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4 && !-[AXElementFetcher _shouldConsiderCacheAsInvalid](self, "_shouldConsiderCacheAsInvalid"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    v16 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__AXElementFetcher_findGroupableMatchingBlock___block_invoke;
    block[3] = &unk_1E691A0B0;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(elementAccessQueue, block);
    v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __47__AXElementFetcher_findGroupableMatchingBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  objc_msgSend(v2, "rootGroupCache");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_findGroupableMatchingBlock:inElementGroup:", v3, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_groupWithDictionary:(id)a3 currentPid:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GroupElements"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GroupTraits"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (int)objc_msgSend(v8, "intValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GroupScanBehaviorTraits"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (int)objc_msgSend(v10, "intValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GroupLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GroupIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXElementFetcher _groupWithItems:groupTraits:scanningBehaviorTraits:label:identifier:currentPid:](self, "_groupWithItems:groupTraits:scanningBehaviorTraits:label:identifier:currentPid:", v7, v9, v11, v12, v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_groupWithItems:(id)a3 groupTraits:(unint64_t)a4 scanningBehaviorTraits:(unint64_t)a5 label:(id)a6 identifier:(id)a7 currentPid:(int)a8
{
  uint64_t v8;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  const void *v17;
  char isKindOfClass;
  id v19;
  CFTypeID v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v35;
  id v36;
  unsigned int v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[2];
  _BYTE v45[128];
  uint64_t v46;

  v8 = *(_QWORD *)&a8;
  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v36 = a6;
  v35 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v14 = v12;
  v38 = v14;
  v39 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (!v39)
    goto LABEL_20;
  v15 = *(_QWORD *)v41;
  v37 = v8;
  do
  {
    for (i = 0; i != v39; ++i)
    {
      if (*(_QWORD *)v41 != v15)
        objc_enumerationMutation(v14);
      v17 = *(const void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[AXElementFetcher _groupWithDictionary:currentPid:](self, "_groupWithDictionary:currentPid:", v17, v8);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (v19)
          goto LABEL_17;
      }
      else
      {
        v20 = CFGetTypeID(v17);
        if ((v20 == AXUIElementGetTypeID()) | isKindOfClass & 1)
        {
          if ((isKindOfClass & 1) != 0)
            +[AXElement elementWithUIElement:](AXElement, "elementWithUIElement:", v17);
          else
            +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uiElement");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "pid");

          if ((_DWORD)v23 == (_DWORD)v8)
          {
            v19 = v21;
          }
          else
          {
            objc_msgSend(v21, "uiElement");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v44[0] = MEMORY[0x1E0C9AAB0];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXElementFetcher shouldIncludeNonScannerElements](self, "shouldIncludeNonScannerElements"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v44[1] = v25;
            objc_msgSend(v24, "objectWithAXAttribute:parameter:", 94500, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2));
            v26 = v13;
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = v38;
            -[AXElementFetcher _groupWithItems:groupTraits:scanningBehaviorTraits:label:identifier:currentPid:](self, "_groupWithItems:groupTraits:scanningBehaviorTraits:label:identifier:currentPid:", v27, 0, 0, 0, 0, v23);
            v19 = (id)objc_claimAutoreleasedReturnValue();

            v13 = v26;
            v8 = v37;
          }

          if (v19)
          {
LABEL_17:
            objc_msgSend(v13, "addObject:", v19);

            continue;
          }
        }
      }
    }
    v39 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  }
  while (v39);
LABEL_20:

  if (objc_msgSend(v13, "count"))
  {
    v28 = v36;
    +[AXElementGroup groupWithElements:label:](AXElementGroup, "groupWithElements:label:", v13, v36);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setGroupTraits:", a4);
    objc_msgSend(v29, "setUserDefinedScanningBehaviorTraits:", a5);
    v30 = v13;
    v31 = v35;
    objc_msgSend(v29, "setIdentifier:", v35);
  }
  else
  {
    v29 = 0;
    v30 = v13;
    v31 = v35;
    v28 = v36;
  }

  return v29;
}

- (id)_filterGroup:(id)a3 withFilter:(id)a4
{
  id v6;
  unsigned int (**v7)(id, void *);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (unsigned int (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v14, "isGroup", (_QWORD)v20))
        {
          -[AXElementFetcher _filterGroup:withFilter:](self, "_filterGroup:withFilter:", v14, v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v8, "addObject:", v15);

        }
        else if (v7[2](v7, v14))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXElementGroup groupWithElements:label:](AXElementGroup, "groupWithElements:label:", v8, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setGroupTraits:", objc_msgSend(v9, "groupTraits"));
    objc_msgSend(v17, "setUserDefinedScanningBehaviorTraits:", objc_msgSend(v9, "userDefinedScanningBehaviorTraits"));
    objc_msgSend(v9, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIdentifier:", v18);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (AXElementGroupPruner)elementGroupPruner
{
  AXElementGroupPruner *elementGroupPruner;
  AXElementGroupPruner *v4;
  AXElementGroupPruner *v5;

  elementGroupPruner = self->_elementGroupPruner;
  if (!elementGroupPruner)
  {
    v4 = objc_alloc_init(AXElementGroupPruner);
    v5 = self->_elementGroupPruner;
    self->_elementGroupPruner = v4;

    elementGroupPruner = self->_elementGroupPruner;
  }
  return elementGroupPruner;
}

- (id)_processAppGroup:(id)a3 keyboardGroup:(id *)a4
{
  id v6;
  NSObject *filterAccessQueue;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  AXVisualElementGrouper *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD block[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  v34 = 0;
  filterAccessQueue = self->_filterAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AXElementFetcher__processAppGroup_keyboardGroup___block_invoke;
  block[3] = &unk_1E6919BB0;
  block[4] = self;
  block[5] = &v29;
  dispatch_sync(filterAccessQueue, block);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = (id)v30[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
  v10 = v6;
  if (v9)
  {
    v11 = *(_QWORD *)v25;
    v10 = v6;
    do
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        -[AXElementFetcher _filterGroup:withFilter:](self, "_filterGroup:withFilter:", v13, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12), (_QWORD)v24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    }
    while (v9);
  }

  -[AXElementFetcher visualElementGrouper](self, "visualElementGrouper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
  {
    v16 = -[AXVisualElementGrouper initWithHeuristics:]([AXVisualElementGrouper alloc], "initWithHeuristics:", -[AXElementFetcher elementGroupingHeuristics](self, "elementGroupingHeuristics"));
    -[AXElementFetcher setVisualElementGrouper:](self, "setVisualElementGrouper:", v16);

  }
  -[AXElementFetcher visualElementGrouper](self, "visualElementGrouper", (_QWORD)v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "groupElementsInRootGroup:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXElementFetcher elementGroupPruner](self, "elementGroupPruner");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pruneRootGroup:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    objc_msgSend(v20, "firstChildPassingTest:", &__block_literal_global_248);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "elementCommunity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setElementCommunity:", v21);

  v22 = v20;
  _Block_object_dispose(&v29, 8);

  return v22;
}

void __51__AXElementFetcher__processAppGroup_keyboardGroup___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "postFetchFilters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __51__AXElementFetcher__processAppGroup_keyboardGroup___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isGroup"))
    v3 = objc_msgSend(v2, "isKeyboardContainer");
  else
    v3 = 0;

  return v3;
}

- (id)_fetchUnprocessedAppGroups
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id obj;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElementFetcher currentApps](self, "currentApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityUIServerApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "uiElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateCache:", 14000);

    objc_msgSend(v6, "elementsForAttribute:", 14000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v8);

    objc_msgSend(v6, "uiElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateCache:", 2076);

    objc_msgSend(v6, "elementsForAttribute:", 2076);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v10);

  }
  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "systemApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "elementForAttribute:", 1513);
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48 && (objc_msgSend(v12, "isControlCenterVisible") & 1) == 0)
    objc_msgSend(v4, "addObject:", v48);
  -[AXElementFetcher inCallServiceApplication](self, "inCallServiceApplication");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v4, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isSpringBoard");

    if (v15)
      objc_msgSend(v4, "addObject:", v13);
  }
  v44 = v12;
  v45 = (unint64_t)v6;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v4;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  v43 = (void *)v13;
  if (!v16)
  {
    v50 = 0;
    v46 = 0;
    goto LABEL_28;
  }
  v17 = v16;
  v50 = 0;
  v46 = 0;
  v18 = *(_QWORD *)v52;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v52 != v18)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
      objc_msgSend(v20, "uiElement", v43, v44);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXElementFetcher shouldIncludeNonScannerElements](self, "shouldIncludeNonScannerElements"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v55[1] = v22;
      objc_msgSend(v21, "objectWithAXAttribute:parameter:", 94500, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v23, "count"))
      {
        objc_msgSend(v20, "uiElement");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXElementFetcher _groupWithItems:groupTraits:scanningBehaviorTraits:label:identifier:currentPid:](self, "_groupWithItems:groupTraits:scanningBehaviorTraits:label:identifier:currentPid:", v23, 0, 0, 0, 0, objc_msgSend(v24, "pid"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v25, "setElementCommunity:", v20);
          objc_msgSend(v20, "label");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setLabel:", v26);

          if (v20 == (void *)v48)
            objc_msgSend(v25, "setGroupTraits:", 256);
          if ((objc_msgSend(v20, "isSpringBoard") & 1) != 0)
          {
            v27 = v46;
            v28 = v50;
            v46 = v25;
            goto LABEL_21;
          }
          v29 = objc_msgSend(v20, "applicationIsModal");
          v27 = v50;
          v28 = v25;
          if (v29)
          {
LABEL_21:
            v30 = v25;

            v50 = v28;
          }
          objc_msgSend(v47, "addObject:", v25);
        }

      }
    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  }
  while (v17);
LABEL_28:

  v31 = v43;
  if (v45 | v48)
  {
    -[AXElementFetcher currentApps](self, "currentApps");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33 != 1)
    {
      +[AXElement systemWideElement](AXElement, "systemWideElement");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "springBoardApplication");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "applicationIsModal");

      if (v37)
      {
        objc_msgSend(v47, "removeAllObjects");
        if (!v46)
          goto LABEL_38;
        v38 = v47;
        v39 = v46;
      }
      else
      {
        if (!v50)
          goto LABEL_38;
        objc_msgSend(v47, "removeAllObjects");
        v38 = v47;
        v39 = v50;
      }
      objc_msgSend(v38, "addObject:", v39, v43);
      goto LABEL_38;
    }
    if (objc_msgSend(v47, "count"))
    {
      +[AXElementGroup groupWithElements:](AXElementGroup, "groupWithElements:", v47);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "removeAllObjects");
      objc_msgSend(v47, "addObject:", v34);

    }
  }
LABEL_38:
  if (_AXSClarityBoardEnabled() && (unint64_t)objc_msgSend(v47, "count") >= 2)
  {
    +[AXElementGroup groupWithElements:](AXElementGroup, "groupWithElements:", v47);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "removeAllObjects");
    objc_msgSend(v47, "addObject:", v40);

  }
  v41 = v47;

  return v41;
}

- (BOOL)_fetchGroups:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *elementAccessQueue;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  void *v33;
  _QWORD block[5];
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _BYTE v48[128];
  uint64_t v49;

  v3 = a3;
  v49 = *MEMORY[0x1E0C80C00];
  -[AXElementFetcher _fetchUnprocessedAppGroups](self, "_fetchUnprocessedAppGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElementFetcher _sendFakeScreenChangeIfNecessaryForGroups:orElements:appsDidChange:](self, "_sendFakeScreenChangeIfNecessaryForGroups:orElements:appsDidChange:", v5, 0, v3);
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = v5;
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        v39 = 0;
        -[AXElementFetcher _processAppGroup:keyboardGroup:](self, "_processAppGroup:keyboardGroup:", v11, &v39);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v39;
        v14 = v13;
        if (v13)
        {
          v15 = v13;

          v7 = v15;
        }
        if ((unint64_t)objc_msgSend(v6, "count") >= 2
          && objc_msgSend(v12, "count") == 1
          && (objc_msgSend(v12, "elementCommunity"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v16, "isSystemApplication"),
              v16,
              v17))
        {
          objc_msgSend(v12, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v18);

        }
        else if (v12)
        {
          objc_msgSend(v33, "addObject:", v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v8);
  }

  if ((unint64_t)objc_msgSend(v33, "count") < 2)
  {
    if (objc_msgSend(v33, "count") == 1)
    {
      objc_msgSend(v33, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
    }
    else
    {
      v25 = 0;
      v26 = 0;
    }
  }
  else
  {
    if (v7)
    {
      objc_msgSend(v7, "parentGroup");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v33, "indexOfObject:", v19);
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v19, "groupByRemovingGroupable:", v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXElementFetcher elementGroupPruner](self, "elementGroupPruner");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pruneRootGroup:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "replaceObjectAtIndex:withObject:", v20, v23);
        objc_msgSend(v23, "elementCommunity");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setElementCommunity:", v24);

        objc_msgSend(v33, "addObject:", v7);
      }

    }
    +[AXElementGroup groupWithElements:](AXElementGroup, "groupWithElements:", v33);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v25;
  }
  elementAccessQueue = self->_elementAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AXElementFetcher__fetchGroups___block_invoke;
  block[3] = &unk_1E691A0F8;
  v37 = v25;
  v38 = &v44;
  block[4] = self;
  v35 = v26;
  v36 = v7;
  v28 = v25;
  v29 = v7;
  v30 = v26;
  dispatch_sync(elementAccessQueue, block);
  v31 = *((_BYTE *)v45 + 24) != 0;

  _Block_object_dispose(&v44, 8);
  return v31;
}

uint64_t __33__AXElementFetcher__fetchGroups___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "rootGroupCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v3 != v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "rootGroupCache");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v1, "isEqualToArray:", *(_QWORD *)(a1 + 40)))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "keyboardGroupCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == *(void **)(a1 + 48))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "keyboardGroupCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v6, "isEqualToArray:", *(_QWORD *)(a1 + 48)) ^ 1;

  }
  if (v3 != v4)
    goto LABEL_8;
LABEL_9:

  objc_msgSend(*(id *)(a1 + 40), "setRootGroup:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setRootGroupCache:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setElementCommunityGroupCache:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setKeyboardGroupCache:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setElementCache:", 0);
}

- (void)clearCache
{
  -[AXElementFetcher setElementCache:](self, "setElementCache:", 0);
  -[AXElementFetcher setRootGroupCache:](self, "setRootGroupCache:", 0);
  -[AXElementFetcher setKeyboardGroupCache:](self, "setKeyboardGroupCache:", 0);
  -[AXElementFetcher setElementCommunityGroupCache:](self, "setElementCommunityGroupCache:", 0);
}

- (id)_debugStringForFetchEvents:(unint64_t)a3
{
  __CFString *v3;
  __int16 v4;
  __CFString *v5;

  if (AXFetchEventAllEvents != a3)
  {
    v4 = a3;
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("UserRequested"));
      if ((v4 & 8) == 0)
      {
LABEL_5:
        if ((v4 & 4) == 0)
          goto LABEL_6;
        goto LABEL_15;
      }
    }
    else if ((v4 & 8) == 0)
    {
      goto LABEL_5;
    }
    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" | ScreenChange"));
    if ((v4 & 4) == 0)
    {
LABEL_6:
      if ((v4 & 0x100) == 0)
        goto LABEL_7;
      goto LABEL_16;
    }
LABEL_15:
    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" | LayoutChange"));
    if ((v4 & 0x100) == 0)
    {
LABEL_7:
      if ((v4 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
LABEL_16:
    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" | LayoutChange - Immediate"));
    if ((v4 & 0x10) == 0)
    {
LABEL_8:
      if ((v4 & 0x40) == 0)
        goto LABEL_9;
      goto LABEL_18;
    }
LABEL_17:
    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" | OrientationChange"));
    if ((v4 & 0x40) == 0)
    {
LABEL_9:
      if ((v4 & 2) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
LABEL_18:
    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" | AlertAppeared"));
    if ((v4 & 2) == 0)
    {
LABEL_10:
      if ((v4 & 0x80) == 0)
        return v3;
LABEL_11:
      -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" | ScrolledByPage"));
      return v3;
    }
LABEL_19:
    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" | AppTransition"));
    if ((v4 & 0x80) == 0)
      return v3;
    goto LABEL_11;
  }
  v3 = CFSTR("AllEvents");
  return v3;
}

- (void)_debugLogElementCache
{
  NSObject *elementAccessQueue;
  _QWORD block[5];

  elementAccessQueue = self->_elementAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__AXElementFetcher__debugLogElementCache__block_invoke;
  block[3] = &unk_1E6919A38;
  block[4] = self;
  dispatch_async(elementAccessQueue, block);
}

void __41__AXElementFetcher__debugLogElementCache__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
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
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Element Cache:\n"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "elementCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        objc_msgSend(v2, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  NSLog((NSString *)CFSTR("%@"), v2);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isFetchingElements
{
  return self->_fetchingElements;
}

- (void)setFetchingElements:(BOOL)a3
{
  self->_fetchingElements = a3;
}

- (BOOL)isEventManagementEnabled
{
  return self->_eventManagementEnabled;
}

- (void)setEventManagementEnabled:(BOOL)a3
{
  self->_eventManagementEnabled = a3;
}

- (BOOL)shouldIncludeNonScannerElements
{
  return self->_shouldIncludeNonScannerElements;
}

- (void)setShouldIncludeNonScannerElements:(BOOL)a3
{
  self->_shouldIncludeNonScannerElements = a3;
}

- (BOOL)isGroupingEnabled
{
  return self->_groupingEnabled;
}

- (void)setGroupingEnabled:(BOOL)a3
{
  self->_groupingEnabled = a3;
}

- (int64_t)elementGroupingHeuristics
{
  return self->_elementGroupingHeuristics;
}

- (void)setElementGroupingHeuristics:(int64_t)a3
{
  self->_elementGroupingHeuristics = a3;
}

- (AXElementFetcherDelegate)delegate
{
  return (AXElementFetcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMapTable)fetchObservers
{
  return self->_fetchObservers;
}

- (void)setFetchObservers:(id)a3
{
  objc_storeStrong((id *)&self->_fetchObservers, a3);
}

- (unint64_t)activeFetchEvents
{
  return self->_activeFetchEvents;
}

- (void)setActiveFetchEvents:(unint64_t)a3
{
  self->_activeFetchEvents = a3;
}

- (void)setCurrentApps:(id)a3
{
  objc_storeStrong((id *)&self->_currentApps, a3);
}

- (NSArray)elementCache
{
  return self->_elementCache;
}

- (void)setElementCache:(id)a3
{
  objc_storeStrong((id *)&self->_elementCache, a3);
}

- (AXElementGroup)elementCommunityGroupCache
{
  return self->_elementCommunityGroupCache;
}

- (void)setElementCommunityGroupCache:(id)a3
{
  objc_storeStrong((id *)&self->_elementCommunityGroupCache, a3);
}

- (AXElementGroup)rootGroupCache
{
  return self->_rootGroupCache;
}

- (void)setRootGroupCache:(id)a3
{
  objc_storeStrong((id *)&self->_rootGroupCache, a3);
}

- (AXElementGroup)keyboardGroupCache
{
  return self->_keyboardGroupCache;
}

- (void)setKeyboardGroupCache:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardGroupCache, a3);
}

- (NSMutableDictionary)postFetchFilters
{
  return self->_postFetchFilters;
}

- (void)setPostFetchFilters:(id)a3
{
  objc_storeStrong((id *)&self->_postFetchFilters, a3);
}

- (AXVisualElementGrouper)visualElementGrouper
{
  return self->_visualElementGrouper;
}

- (void)setVisualElementGrouper:(id)a3
{
  objc_storeStrong((id *)&self->_visualElementGrouper, a3);
}

- (BOOL)didSendFakeScreenChangeOnLastFetch
{
  return self->_didSendFakeScreenChangeOnLastFetch;
}

- (void)setDidSendFakeScreenChangeOnLastFetch:(BOOL)a3
{
  self->_didSendFakeScreenChangeOnLastFetch = a3;
}

- (NSArray)customCurrentApps
{
  return self->_customCurrentApps;
}

- (void)setCustomCurrentApps:(id)a3
{
  objc_storeStrong((id *)&self->_customCurrentApps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customCurrentApps, 0);
  objc_storeStrong((id *)&self->_visualElementGrouper, 0);
  objc_storeStrong((id *)&self->_postFetchFilters, 0);
  objc_storeStrong((id *)&self->_keyboardGroupCache, 0);
  objc_storeStrong((id *)&self->_rootGroupCache, 0);
  objc_storeStrong((id *)&self->_elementCommunityGroupCache, 0);
  objc_storeStrong((id *)&self->_elementCache, 0);
  objc_storeStrong((id *)&self->_currentApps, 0);
  objc_storeStrong((id *)&self->_fetchObservers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_elementGroupPruner, 0);
  objc_storeStrong((id *)&self->_eventCoalesceTimer, 0);
  objc_storeStrong((id *)&self->_filterAccessQueue, 0);
  objc_storeStrong((id *)&self->_elementAccessQueue, 0);
  objc_storeStrong((id *)&self->_elementFetchQueue, 0);
}

@end
