@implementation _SFBrowserSavedState

+ (void)setShouldMergeAllWindowsIfNeeded:(BOOL)a3
{
  shouldMergeAllWindowsIfNeeded = a3;
}

+ (_SFBrowserSavedState)sharedBrowserSavedState
{
  void *v2;
  _QWORD block[5];

  v2 = (void *)sharedBrowserSavedStateInstance;
  if (!sharedBrowserSavedStateInstance)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47___SFBrowserSavedState_sharedBrowserSavedState__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (+[_SFBrowserSavedState sharedBrowserSavedState]::onceToken != -1)
      dispatch_once(&+[_SFBrowserSavedState sharedBrowserSavedState]::onceToken, block);
    v2 = (void *)sharedBrowserSavedStateInstance;
  }
  return (_SFBrowserSavedState *)v2;
}

- (id)recentlyClosedTabsForProfileWithIdentifier:(id)a3
{
  id v4;
  NSMutableArray *recentlyClosedTabs;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[_SFBrowserSavedState _readRecentlyClosedTabsStateIfNecessary](self, "_readRecentlyClosedTabsStateIfNecessary");
  recentlyClosedTabs = self->_recentlyClosedTabs;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67___SFBrowserSavedState_recentlyClosedTabsForProfileWithIdentifier___block_invoke;
  v9[3] = &unk_1E21E7210;
  v6 = v4;
  v10 = v6;
  -[NSMutableArray safari_filterObjectsUsingBlock:](recentlyClosedTabs, "safari_filterObjectsUsingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_readRecentlyClosedTabsStateIfNecessary
{
  NSMutableArray *v3;
  NSMutableArray *recentlyClosedTabs;
  NSCountedSet *v5;
  NSCountedSet *tabCountByWindowUUID;
  uint64_t v7;
  uint64_t i;
  SFBrowserStateSQLiteStore *browserStateSQLiteStore;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  SFTabStateData *v16;
  NSCountedSet *v17;
  void *v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!self->_haveLoadedRecentlyClosedTabs)
  {
    self->_haveLoadedRecentlyClosedTabs = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    recentlyClosedTabs = self->_recentlyClosedTabs;
    self->_recentlyClosedTabs = v3;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v5 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
    tabCountByWindowUUID = self->_tabCountByWindowUUID;
    self->_tabCountByWindowUUID = v5;

    -[SFBrowserStateSQLiteStore recentlyClosedWindows](self->_browserStateSQLiteStore, "recentlyClosedWindows");
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v7)
    {
      v20 = *(_QWORD *)v29;
      do
      {
        v21 = v7;
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(obj);
          browserStateSQLiteStore = self->_browserStateSQLiteStore;
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "UUIDString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFBrowserStateSQLiteStore tabStatesWithBrowserWindowUUID:](browserStateSQLiteStore, "tabStatesWithBrowserWindowUUID:", v10);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("SafariStateDocuments"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v22 = v11;
          objc_msgSend(v11, "reverseObjectEnumerator");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v25 != v14)
                  objc_enumerationMutation(v12);
                v16 = -[SFTabStateData initWithDictionaryRepresentation:]([SFTabStateData alloc], "initWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
                -[NSMutableArray addObject:](self->_recentlyClosedTabs, "addObject:", v16);
                v17 = self->_tabCountByWindowUUID;
                -[SFTabStateData owningBrowserWindowUUIDString](v16, "owningBrowserWindowUUIDString");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSCountedSet addObject:](v17, "addObject:", v18);

              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v13);
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v7);
    }

  }
}

+ (id)defaultBrowserStateDatabase
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  if (!safariTabStateDatabaseURL(void)::browserStateDatabaseURL)
  {
    databaseURLForFileName(CFSTR("BrowserState.db"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)safariTabStateDatabaseURL(void)::browserStateDatabaseURL;
    safariTabStateDatabaseURL(void)::browserStateDatabaseURL = v3;

  }
  return (id)objc_msgSend(v2, "initWithDatabaseURL:");
}

- (_SFBrowserSavedState)initWithDatabaseURL:(id)a3
{
  id v4;
  _SFBrowserSavedState *v5;
  SFBrowserStateSQLiteStore *v6;
  SFBrowserStateSQLiteStore *browserStateSQLiteStore;
  void *v8;
  _SFBrowserSavedState *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFBrowserSavedState;
  v5 = -[_SFBrowserSavedState init](&v11, sel_init);
  if (v5)
  {
    v6 = -[SFBrowserStateSQLiteStore initWithDatabaseURL:]([SFBrowserStateSQLiteStore alloc], "initWithDatabaseURL:", v4);
    browserStateSQLiteStore = v5->_browserStateSQLiteStore;
    v5->_browserStateSQLiteStore = v6;

    -[_SFBrowserSavedState _readBrowserControllersSavedState](v5, "_readBrowserControllersSavedState");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__historyItemsWereRemoved_, *MEMORY[0x1E0D8A400], 0);

    v9 = v5;
  }

  return v5;
}

- (void)_readBrowserControllersSavedState
{
  NSArray *v3;
  NSArray *browserWindows;

  if (objc_msgSend((id)objc_opt_class(), "shouldMergeAllWindowsIfNeeded"))
    -[SFBrowserStateSQLiteStore mergeAllWindows](self->_browserStateSQLiteStore, "mergeAllWindows");
  -[SFBrowserStateSQLiteStore browserWindows](self->_browserStateSQLiteStore, "browserWindows");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  browserWindows = self->_browserWindows;
  self->_browserWindows = v3;

}

+ (BOOL)shouldMergeAllWindowsIfNeeded
{
  return shouldMergeAllWindowsIfNeeded;
}

+ (void)setSharedBrowserSavedState:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "launchedToTest");
  if (sharedBrowserSavedStateInstance)
    v6 = v5;
  else
    v6 = 1;

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E21FE780);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/MobileSafariFramework/_SFBrowserSavedState.mm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "length");
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v8);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = &stru_1E21FE780;
    }
    objc_msgSend(v9, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "[[UIApplication sharedApplication] launchedToTest] || !sharedBrowserSavedStateInstance", "+[_SFBrowserSavedState setSharedBrowserSavedState:]", v11, 88, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v12)

    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@\n%@"), v14, v15);

    abort();
  }
  v7 = (void *)sharedBrowserSavedStateInstance;
  sharedBrowserSavedStateInstance = (uint64_t)v3;

}

+ (id)ephemeralSavedState
{
  return +[_SFBrowserSavedState inMemoryDatabase](_SFBrowserSavedState, "inMemoryDatabase");
}

+ (id)inMemoryDatabase
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseURL:", 0);
}

+ (id)defaultPPTBrowserStateDatabase
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  if (!safariPPTTabStateDatabaseURL(void)::browserStatePPTDatabaseURL)
  {
    databaseURLForFileName(CFSTR("BrowserStatePPT.db"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)safariPPTTabStateDatabaseURL(void)::browserStatePPTDatabaseURL;
    safariPPTTabStateDatabaseURL(void)::browserStatePPTDatabaseURL = v3;

  }
  return (id)objc_msgSend(v2, "initWithDatabaseURL:");
}

- (void)dealloc
{
  objc_super v3;

  -[SFBrowserStateSQLiteStore closeDatabase](self->_browserStateSQLiteStore, "closeDatabase");
  v3.receiver = self;
  v3.super_class = (Class)_SFBrowserSavedState;
  -[_SFBrowserSavedState dealloc](&v3, sel_dealloc);
}

- (void)setBrowserWindows:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *browserWindows;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SFBrowserStateSQLiteStore *browserStateSQLiteStore;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_browserWindows, "isEqualToArray:", v4))
  {
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    browserWindows = self->_browserWindows;
    self->_browserWindows = v5;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          browserStateSQLiteStore = self->_browserStateSQLiteStore;
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "dictionaryRepresentation", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFBrowserStateSQLiteStore updateBrowserWindowStateWithDictionary:completion:](browserStateSQLiteStore, "updateBrowserWindowStateWithDictionary:completion:", v12, 0);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (id)savedTabsStateForBrowserControllerWithUUID:(id)a3
{
  SFBrowserStateSQLiteStore *browserStateSQLiteStore;
  void *v4;
  void *v5;

  browserStateSQLiteStore = self->_browserStateSQLiteStore;
  objc_msgSend(a3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBrowserStateSQLiteStore tabStatesWithBrowserWindowUUID:](browserStateSQLiteStore, "tabStatesWithBrowserWindowUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)saveTabsState:(id)a3 forBrowserControllerWithUUID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a5;
  -[SFBrowserStateSQLiteStore updateBrowserWindowStateWithDictionary:completion:](self->_browserStateSQLiteStore, "updateBrowserWindowStateWithDictionary:completion:", v8, v7);
  -[_SFBrowserSavedState _checkPointWriteAheadLogIfNeeded](self, "_checkPointWriteAheadLogIfNeeded");

}

- (void)_checkPointWriteAheadLogIfNeeded
{
  if (self->_checkPointWriteAheadLogOnNextUpdate)
  {
    -[SFBrowserStateSQLiteStore checkPointWriteAheadLog](self->_browserStateSQLiteStore, "checkPointWriteAheadLog");
    self->_checkPointWriteAheadLogOnNextUpdate = 0;
  }
}

- (void)setSecureDeleteEnabled:(BOOL)a3
{
  if (self->_secureDeleteEnabled != a3)
  {
    self->_secureDeleteEnabled = a3;
    -[SFBrowserStateSQLiteStore setSecureDeleteEnabled:](self->_browserStateSQLiteStore, "setSecureDeleteEnabled:");
  }
}

- (void)removeTabsStateForBrowserControllerWithUUID:(id)a3 andRemoveWindow:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SFBrowserStateSQLiteStore *browserStateSQLiteStore;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  browserStateSQLiteStore = self->_browserStateSQLiteStore;
  v10 = v6;
  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBrowserStateSQLiteStore deleteTabStateWithBrowserWindowUUID:andRemoveWindow:](browserStateSQLiteStore, "deleteTabStateWithBrowserWindowUUID:andRemoveWindow:", v8, v4);

  if (v4)
  {
    +[_SFBrowserWindowSettings settings](_SFBrowserWindowSettings, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeWindowWithUUID:", v10);

  }
  -[_SFBrowserSavedState _checkPointWriteAheadLogIfNeeded](self, "_checkPointWriteAheadLogIfNeeded");

}

- (void)setActiveDocumentIsValid:(BOOL)a3 forBrowserControllerWithUUID:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = a4;
  +[_SFBrowserWindowSettings settings](_SFBrowserWindowSettings, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveDocumentIsValid:forWindowWithUUID:", v4, v6);

}

- (BOOL)activeDocumentIsValidForBrowserControllerWithUUID:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[_SFBrowserWindowSettings settings](_SFBrowserWindowSettings, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "activeDocumentIsValidForWindowWithUUID:", v3);

  return v5;
}

- (void)saveTabStateData:(id)a3
{
  -[SFBrowserStateSQLiteStore updateTabWithTabStateData:](self->_browserStateSQLiteStore, "updateTabWithTabStateData:", a3);
}

- (id)tabStateDataForUUID:(id)a3
{
  -[SFBrowserStateSQLiteStore tabStateDataForUUID:](self->_browserStateSQLiteStore, "tabStateDataForUUID:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)clearSavedStatesForProfileWithIdentifier:(id)a3 closingDatabase:(BOOL)a4
{
  _BOOL4 v4;
  SFBrowserStateSQLiteStore *browserStateSQLiteStore;
  id v7;

  v4 = a4;
  v7 = a3;
  -[SFBrowserStateSQLiteStore deleteSavedStatesForProfileWithIdentifier:](self->_browserStateSQLiteStore, "deleteSavedStatesForProfileWithIdentifier:");
  if (v4)
  {
    -[SFBrowserStateSQLiteStore closeDatabase](self->_browserStateSQLiteStore, "closeDatabase");
    browserStateSQLiteStore = self->_browserStateSQLiteStore;
    self->_browserStateSQLiteStore = 0;

  }
}

- (void)updateSceneID:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
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

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SFBrowserStateSQLiteStore updateSceneID:](self->_browserStateSQLiteStore, "updateSceneID:", v4))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_browserWindows;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v9, "UUID", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "UUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

          if ((v12 & 1) != 0)
          {
            objc_msgSend(v4, "sceneID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setSceneID:", v13);

            goto LABEL_12;
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)updateBrowserWindowState:(id)a3 tabs:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[SFBrowserStateSQLiteStore updateBrowserWindowWithData:tabs:](self->_browserStateSQLiteStore, "updateBrowserWindowWithData:tabs:", v7, v6);
  -[_SFBrowserSavedState _checkPointWriteAheadLogIfNeeded](self, "_checkPointWriteAheadLogIfNeeded");

}

- (id)readSavedSessionStateDataForTabWithUUID:(id)a3
{
  SFBrowserStateSQLiteStore *browserStateSQLiteStore;
  void *v4;
  void *v5;

  browserStateSQLiteStore = self->_browserStateSQLiteStore;
  objc_msgSend(a3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBrowserStateSQLiteStore readSavedSessionStateDataForTabWithUUIDString:](browserStateSQLiteStore, "readSavedSessionStateDataForTabWithUUIDString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removeTabStateWithTabData:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "privateBrowsing"))
    self->_checkPointWriteAheadLogOnNextUpdate = 1;
  -[SFBrowserStateSQLiteStore removeTabWithTabData:](self->_browserStateSQLiteStore, "removeTabWithTabData:", v4);

}

- (void)addRecentlyClosedTabs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *recentlyClosedTabs;
  NSCountedSet *v9;
  NSCountedSet *tabCountByWindowUUID;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  _SFBrowserWindowStateData *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFBrowserSavedState _readRecentlyClosedTabsStateIfNecessary](self, "_readRecentlyClosedTabsStateIfNecessary");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_recentlyClosedTabs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    recentlyClosedTabs = self->_recentlyClosedTabs;
    self->_recentlyClosedTabs = v7;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v9 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
    tabCountByWindowUUID = self->_tabCountByWindowUUID;
    self->_tabCountByWindowUUID = v9;

  }
  if ((unint64_t)objc_msgSend(v4, "count") < 0xC9)
  {
    v11 = v4;
  }
  else
  {
    objc_msgSend(v4, "subarrayWithRange:", objc_msgSend(v4, "count") - 200, 200);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableArray insertObject:atIndex:](self->_recentlyClosedTabs, "insertObject:atIndex:", v16, 0, (_QWORD)v20);
        objc_msgSend(v16, "setOwningBrowserWindowUUIDString:", v6);
        -[NSCountedSet addObject:](self->_tabCountByWindowUUID, "addObject:", v6);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v17 = -[_SFBrowserWindowStateData initWithUUIDString:sceneID:]([_SFBrowserWindowStateData alloc], "initWithUUIDString:sceneID:", v6, 0);
  -[_SFBrowserWindowStateData setDatabaseID:](v17, "setDatabaseID:", 0x7FFFFFFFFFFFFFFFLL);
  -[_SFBrowserWindowStateData setType:](v17, "setType:", 2);
  -[_SFBrowserWindowStateData setNeedsQuickUpdate:](v17, "setNeedsQuickUpdate:", 1);
  -[_SFBrowserSavedState updateBrowserWindowState:tabs:](self, "updateBrowserWindowState:tabs:", v17, v12);
  while ((unint64_t)-[NSMutableArray count](self->_recentlyClosedTabs, "count", (_QWORD)v20) >= 0xC9)
  {
    -[NSMutableArray lastObject](self->_recentlyClosedTabs, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBrowserSavedState _removeRecentlyClosedTabStateData:](self, "_removeRecentlyClosedTabStateData:", v18);

    -[NSMutableArray removeLastObject](self->_recentlyClosedTabs, "removeLastObject");
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "postNotificationName:object:", CFSTR("SFRecentlyClosedTabsWereAdded"), self);

}

- (void)loadSessionStateDataAndRemoveRecentlyClosedTab:(id)a3
{
  id v4;
  NSMutableArray *recentlyClosedTabs;
  id v6;
  SFBrowserStateSQLiteStore *browserStateSQLiteStore;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  recentlyClosedTabs = self->_recentlyClosedTabs;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71___SFBrowserSavedState_loadSessionStateDataAndRemoveRecentlyClosedTab___block_invoke;
  v11[3] = &unk_1E21E71E8;
  v6 = v4;
  v12 = v6;
  -[NSMutableArray safari_removeObjectsPassingTest:](recentlyClosedTabs, "safari_removeObjectsPassingTest:", v11);
  browserStateSQLiteStore = self->_browserStateSQLiteStore;
  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBrowserStateSQLiteStore readSavedSessionStateDataForTabWithUUIDString:](browserStateSQLiteStore, "readSavedSessionStateDataForTabWithUUIDString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSessionStateData:", v9);

  -[_SFBrowserSavedState _removeRecentlyClosedTabStateData:](self, "_removeRecentlyClosedTabStateData:", v6);
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserSavedState _notifyThatRecentlyClosedTabsWereRemoved:](self, "_notifyThatRecentlyClosedTabsWereRemoved:", v10);

}

- (void)clearRecentlyClosedTabsForProfileWithIdentifier:(id)a3
{
  NSMutableArray *recentlyClosedTabs;
  id v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSCountedSet *tabCountByWindowUUID;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  -[_SFBrowserSavedState _readRecentlyClosedTabsStateIfNecessary](self, "_readRecentlyClosedTabsStateIfNecessary");
  recentlyClosedTabs = self->_recentlyClosedTabs;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72___SFBrowserSavedState_clearRecentlyClosedTabsForProfileWithIdentifier___block_invoke;
  v19[3] = &unk_1E21E7210;
  v5 = v14;
  v20 = v5;
  -[NSMutableArray safari_filterObjectsUsingBlock:](recentlyClosedTabs, "safari_filterObjectsUsingBlock:", v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInArray:](self->_recentlyClosedTabs, "removeObjectsInArray:", v6);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_browserWindows;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        tabCountByWindowUUID = self->_tabCountByWindowUUID;
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCountedSet removeObject:](tabCountByWindowUUID, "removeObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v8);
  }

  -[SFBrowserStateSQLiteStore deleteRecentlyClosedWindowsWithProfileIdentifier:](self->_browserStateSQLiteStore, "deleteRecentlyClosedWindowsWithProfileIdentifier:", v5);
  -[_SFBrowserSavedState _notifyThatRecentlyClosedTabsWereRemoved:](self, "_notifyThatRecentlyClosedTabsWereRemoved:", v6);

}

- (void)_notifyThatRecentlyClosedTabsWereRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v7 = CFSTR("SFRemovedTabStateDataKey");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("SFRecentlyClosedTabsWereRemoved"), self, v5);

  }
}

- (void)_historyItemsWereRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *recentlyClosedTabs;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24[3];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MEMORY[0x18D77F264](v24, CFSTR("com.apple.SafariServices._SFBrowserSavedState.HistoryItemsWereRemoved"));
  -[_SFBrowserSavedState _readRecentlyClosedTabsStateIfNecessary](self, "_readRecentlyClosedTabsStateIfNecessary");
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D8A3E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_setByApplyingBlock:", &__block_literal_global_61);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    recentlyClosedTabs = self->_recentlyClosedTabs;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __49___SFBrowserSavedState__historyItemsWereRemoved___block_invoke_2;
    v21[3] = &unk_1E21E7278;
    v10 = v8;
    v22 = v10;
    v23 = v7;
    -[NSMutableArray safari_filterObjectsUsingBlock:](recentlyClosedTabs, "safari_filterObjectsUsingBlock:", v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserStateSQLiteStore removeSavedSessionStateDataForTabsWithUUIDStrings:](self->_browserStateSQLiteStore, "removeSavedSessionStateDataForTabsWithUUIDStrings:", v10);
    if (objc_msgSend(v11, "count"))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v12);
            v16 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
            -[_SFBrowserSavedState _removeRecentlyClosedTabStateData:](self, "_removeRecentlyClosedTabStateData:", v16, (_QWORD)v17);
            -[NSMutableArray removeObject:](self->_recentlyClosedTabs, "removeObject:", v16);
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        }
        while (v13);
      }

      -[_SFBrowserSavedState _notifyThatRecentlyClosedTabsWereRemoved:](self, "_notifyThatRecentlyClosedTabsWereRemoved:", v12);
    }

  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v24);

}

- (void)_removeRecentlyClosedTabStateData:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "owningBrowserWindowUUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet removeObject:](self->_tabCountByWindowUUID, "removeObject:", v4);
  if ((-[NSCountedSet containsObject:](self->_tabCountByWindowUUID, "containsObject:", v4) & 1) != 0)
  {
    -[_SFBrowserSavedState removeTabStateWithTabData:](self, "removeTabStateWithTabData:", v6);
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
    -[_SFBrowserSavedState removeTabsStateForBrowserControllerWithUUID:andRemoveWindow:](self, "removeTabsStateForBrowserControllerWithUUID:andRemoveWindow:", v5, 1);

  }
}

- (void)removeRecentlyClosedTabWithStateData:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableArray count](self->_recentlyClosedTabs, "count");
  -[_SFBrowserSavedState _removeRecentlyClosedTabStateData:](self, "_removeRecentlyClosedTabStateData:", v4);
  -[NSMutableArray removeObject:](self->_recentlyClosedTabs, "removeObject:", v4);
  if (-[NSMutableArray count](self->_recentlyClosedTabs, "count") < v5)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBrowserSavedState _notifyThatRecentlyClosedTabsWereRemoved:](self, "_notifyThatRecentlyClosedTabsWereRemoved:", v6);

  }
}

- (void)regenerateTabUUIDsForDeviceRestoration
{
  -[SFBrowserStateSQLiteStore regenerateTabUUIDsForDeviceRestoration](self->_browserStateSQLiteStore, "regenerateTabUUIDsForDeviceRestoration");
}

- (NSArray)browserWindows
{
  return self->_browserWindows;
}

- (BOOL)secureDeleteEnabled
{
  return self->_secureDeleteEnabled;
}

- (BOOL)shouldBeUsedDuringTest
{
  return self->_shouldBeUsedDuringTest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserWindows, 0);
  objc_storeStrong((id *)&self->_tabCountByWindowUUID, 0);
  objc_storeStrong((id *)&self->_recentlyClosedTabs, 0);
  objc_storeStrong((id *)&self->_browserStateSQLiteStore, 0);
}

@end
