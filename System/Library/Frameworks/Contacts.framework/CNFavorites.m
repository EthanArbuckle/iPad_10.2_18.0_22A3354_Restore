@implementation CNFavorites

void __33__CNFavorites__entryDictionaries__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id location;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D13A10], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUnlockedSinceBoot");

  if ((v5 & 1) != 0)
  {
    +[CNFavorites favoritesPath](CNFavorites, "favoritesPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "XPCDataMapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v26 = 0;
      objc_msgSend(v7, "favoritesEntryDictionariesAtPath:error:", v6, &v26);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v26;
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v9;

      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(v13, "logger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14)
        objc_msgSend(v15, "finishedReadingRemoteFavorites");
      else
        objc_msgSend(v15, "failedToReadRemoteFavorites:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithContentsOfURL:error:", v16, &v25);
      v10 = v25;
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

      v22 = *(void **)(a1 + 32);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        objc_msgSend(v22, "logger");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "finishedReadingFavoritesFromPath:entriesCount:", v6, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"));
      }
      else
      {
        v24 = objc_msgSend(v22, "shouldSimulateCrashReportForError:", v10);
        objc_msgSend(*(id *)(a1 + 32), "logger");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "failedToReadFavoritesFromPath:error:simulateCrashReport:", v6, v10, v24);
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reportFavoritesAccessedBeforeFirstUnlock");

    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0D13A10], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __33__CNFavorites__entryDictionaries__block_invoke_2;
    v27[3] = &unk_1E29FCC38;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v18, "addUnlockHandlerWithIdentifier:block:", CFSTR("CNFavorites"), v27);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

}

- (id)XPCDataMapper
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  objc_opt_class();
  -[CNFavorites contactStore](self, "contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    objc_msgSend(v5, "XPCDataMapperStore");
  else
    -[CNFavorites contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_opt_class();
  objc_msgSend(v9, "mapper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

+ (id)favoritesPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)softLinkCPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Preferences"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((favoritesPath_sCheckedForDir & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "fileExistsAtPath:", v2) & 1) == 0)
    {
      objc_msgSend(v2, "stringByDeletingLastPathComponent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "fileExistsAtPath:", v4) & 1) == 0)
        mkdir((const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation"), 0x1C0u);
      mkdir((const char *)objc_msgSend(objc_retainAutorelease(v2), "fileSystemRepresentation"), 0x1C0u);

    }
    favoritesPath_sCheckedForDir = 1;

  }
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("com.apple.mobilephone.speeddial.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)shouldSimulateCrashReportForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CB28A8];
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]) && objc_msgSend(v4, "code") == 260)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v4, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v6) && objc_msgSend(v4, "code") == 257)
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(v4, "domain");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", v6))
          v7 = objc_msgSend(v4, "code") != 513;
        else
          v7 = 1;

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)entries
{
  CNFavorites *v3;
  NSArray *v4;

  -[CNFavorites loadEntriesIfNecessary](self, "loadEntriesIfNecessary");
  v3 = self;
  objc_sync_enter(v3);
  v4 = v3->_entries;
  objc_sync_exit(v3);

  return v4;
}

- (id)entriesForContact:(id)a3 propertyKey:(id)a4 labeledValueIdentifier:(id)a5 actionType:(id)a6 bundleIdentifier:(id)a7
{
  void *v7;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  void *v30;
  id v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;

  v13 = a3;
  v14 = a4;
  v37 = a5;
  v39 = a6;
  v34 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 50);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v36 = v13;
  -[CNFavorites entriesForContact:](self, "entriesForContact:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v16 = 0;
    if (v14)
      v17 = v37 == 0;
    else
      v17 = 1;
    v18 = !v17;
    v33 = v18;
    while (1)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v38 = a5;
        objc_msgSend(v36, "valueForKey:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNLabeledValue labeledValueWithIdentifier:inArray:](CNLabeledValue, "labeledValueWithIdentifier:inArray:", v37, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          a5 = v38;
          goto LABEL_31;
        }
        objc_msgSend(v36, "valueForKey:", v14);
        v22 = v7;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNLabeledValue labeledValueWithIdentifier:inArray:](CNLabeledValue, "labeledValueWithIdentifier:inArray:", v37, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "iOSLegacyIdentifier");

        v7 = v22;
        LODWORD(v24) = objc_msgSend(v19, "abIdentifier");

        v17 = v25 == (_DWORD)v24;
        v18 = v33;
        a5 = v38;
        if (!v17)
          goto LABEL_31;
      }
      if (v39)
      {
        objc_msgSend(v19, "actionType");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v39, "isEqualToString:"))
        {
LABEL_24:

          goto LABEL_31;
        }
      }
      if (!v14)
        break;
      objc_msgSend(v19, "contactProperty");
      a5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a5, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqual:", v7) & 1) != 0)
      {
        if (!v34)
        {
          v26 = v19;
          v27 = 1;
          goto LABEL_22;
        }
LABEL_21:
        v28 = v7;
        v29 = a5;
        v26 = v19;
        objc_msgSend(v19, "bundleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v34, "isEqualToString:", v30);

        a5 = v29;
        v7 = v28;
        if (v14)
        {
LABEL_22:

        }
        goto LABEL_26;
      }

      if (v39)
        goto LABEL_24;
LABEL_31:

      if (++v16 >= (unint64_t)objc_msgSend(v15, "count"))
        goto LABEL_32;
    }
    if (v34)
      goto LABEL_21;
    v26 = v19;
    v27 = 1;
LABEL_26:
    if (v39)
    {

      if ((v27 & 1) == 0)
        goto LABEL_30;
    }
    else if (!v27)
    {
LABEL_30:
      v19 = v26;
      goto LABEL_31;
    }
    v19 = v26;
    objc_msgSend(v32, "addObject:", v26);
    goto LABEL_31;
  }
LABEL_32:

  return v32;
}

- (id)entriesForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNFavorites uidToEntry](self, "uidToEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNFavorites uidToEntry](self, "uidToEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "iOSLegacyIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v8);
      else
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)_addEntryToMap:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((objc_msgSend(v13, "abUid") & 0x80000000) == 0)
  {
    -[CNFavorites uidToEntry](self, "uidToEntry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CNFavorites uidToEntry](self, "uidToEntry");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "abUid"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = (void *)objc_msgSend(v7, "mutableCopy");
          objc_msgSend(v8, "addObject:", v13);
          -[CNFavorites uidToEntry](self, "uidToEntry");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "abUid"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

        }
        else
        {
          v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v7, v13, 0);

          -[CNFavorites uidToEntry](self, "uidToEntry");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "abUid"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v12);

          v7 = (void *)v11;
        }
      }
      else
      {
        -[CNFavorites uidToEntry](self, "uidToEntry");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "abUid"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v8);
      }

    }
  }

}

- (NSMutableDictionary)uidToEntry
{
  -[CNFavorites loadEntriesIfNecessary](self, "loadEntriesIfNecessary");
  return self->_uidToEntry;
}

- (void)loadEntriesIfNecessary
{
  CNFavorites *v2;
  uint64_t v3;
  NSArray *entries;
  uint64_t v5;
  NSMutableDictionary *uidToEntry;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CNFavoritesEntry *v13;
  void *v14;
  CNFavoritesEntry *v15;
  uint64_t v16;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_entries)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 50);
    v3 = objc_claimAutoreleasedReturnValue();
    entries = v2->_entries;
    v2->_entries = (NSArray *)v3;

  }
  if (!v2->_uidToEntry)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 50);
    uidToEntry = v2->_uidToEntry;
    v2->_uidToEntry = (NSMutableDictionary *)v5;

  }
  if (-[CNFavorites needsReload](v2, "needsReload")
    && +[CNContactStore authorizationStatusForEntityType:](CNContactStore, "authorizationStatusForEntityType:", 0) == CNAuthorizationStatusAuthorized)
  {
    -[NSMutableDictionary removeAllObjects](v2->_uidToEntry, "removeAllObjects");
    -[CNFavorites setNeedsReload:](v2, "setNeedsReload:", 0);
    -[CNFavorites _entryDictionaries](v2, "_entryDictionaries");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      v7 = (void *)objc_opt_new();
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = v19;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v21;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v8);
            v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
            v13 = [CNFavoritesEntry alloc];
            -[CNFavorites contactStore](v2, "contactStore");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[CNFavoritesEntry initWithDictionaryRepresentation:store:](v13, "initWithDictionaryRepresentation:store:", v12, v14);

            objc_msgSend(v7, "addObject:", v15);
            -[CNFavorites _addEntryToMap:](v2, "_addEntryToMap:", v15);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v9);
      }

      v16 = objc_msgSend(v7, "copy");
      v17 = v2->_entries;
      v2->_entries = (NSArray *)v16;

    }
    else
    {
      v18 = v2->_entries;
      v2->_entries = (NSArray *)MEMORY[0x1E0C9AA60];

    }
  }
  objc_sync_exit(v2);

}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setNeedsReload:(BOOL)a3
{
  self->_needsReload = a3;
}

- (id)_entryDictionaries
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  -[CNFavorites logger](self, "logger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__CNFavorites__entryDictionaries__block_invoke;
  v6[3] = &unk_1E29FB2D8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "readingFavorites:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (CNFavoritesLogger)logger
{
  return self->_logger;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CNFavorites unregisterForDistributedNotifications](self, "unregisterForDistributedNotifications");
  objc_msgSend(MEMORY[0x1E0D13A10], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeUnlockHandlerWithIdentifier:", CFSTR("CNFavorites"));

  v4.receiver = self;
  v4.super_class = (Class)CNFavorites;
  -[CNFavorites dealloc](&v4, sel_dealloc);
}

- (void)unregisterForDistributedNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("CNFavoritesChangedExternallyNotification"), 0);
}

- (CNFavorites)initWithContactStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CNFavorites *v8;

  v4 = a3;
  +[CNContactsEnvironment currentEnvironment](CNContactsEnvironment, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "favoritesLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNFavorites initWithContactStore:logger:](self, "initWithContactStore:logger:", v4, v7);
  return v8;
}

- (CNFavorites)initWithContactStore:(id)a3 logger:(id)a4
{
  id v7;
  id v8;
  CNFavorites *v9;
  CNFavorites *v10;
  CNFavorites *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNFavorites;
  v9 = -[CNFavorites init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_logger, a4);
    v10->_needsReload = 1;
    -[CNFavorites registerForDistributedNotifications](v10, "registerForDistributedNotifications");
    v11 = v10;
  }

  return v10;
}

- (void)registerForDistributedNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleFavoritesChangedExternally, CFSTR("CNFavoritesChangedExternallyNotification"), 0, (CFNotificationSuspensionBehavior)1025);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_uidToEntry, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

- (BOOL)isFull
{
  void *v2;
  BOOL v3;

  -[CNFavorites entries](self, "entries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 0x31;

  return v3;
}

+ (id)sharedInstance
{
  if (sFavoritesOnceToken != -1)
    dispatch_once(&sFavoritesOnceToken, &__block_literal_global_11_4);
  return (id)sFavorites;
}

void __29__CNFavorites_sharedInstance__block_invoke()
{
  CNFavorites *v0;
  void *v1;
  CNContactStore *v2;

  v2 = objc_alloc_init(CNContactStore);
  v0 = -[CNFavorites initWithContactStore:]([CNFavorites alloc], "initWithContactStore:", v2);
  v1 = (void *)sFavorites;
  sFavorites = (uint64_t)v0;

}

+ (void)flushSingleton
{
  void *v2;

  v2 = (void *)sFavorites;
  sFavorites = 0;

  sFavoritesOnceToken = 0;
}

- (CNFavorites)init
{
  CNFavorites *v3;

  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v3 = (CNFavorites *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __33__CNFavorites__entryDictionaries__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_postChangeNotification");

}

- (BOOL)_isValueForEntry:(id)a3 equalToValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "contactProperty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v5, "contactProperty");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "key");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("phoneNumbers"));

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CF5D78];
      objc_msgSend(v5, "contactProperty");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "abNormalizedPhoneNumberFromString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CF5D78], "abNormalizedPhoneNumberFromString:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v17, "isEqualToString:", v18);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)entryWithIdentifier:(id)a3 forContact:(id)a4
{
  void *v4;
  void *v5;

  -[CNFavorites entriesForContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:](self, "entriesForContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:", a4, 0, a3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)entryWithType:(int64_t)a3 forContact:(id)a4 propertyKey:(id)a5 identifier:(id)a6
{
  void *v6;
  void *v7;

  -[CNFavorites entriesForContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:](self, "entriesForContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:", a4, a5, a6, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)containsEntryWithType:(int64_t)a3 forContact:(id)a4 propertyKey:(id)a5 identifier:(id)a6
{
  void *v6;
  BOOL v7;

  -[CNFavorites entriesForContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:](self, "entriesForContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:", a4, a5, a6, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

- (BOOL)addEntryForContact:(id)a3 propertyKey:(id)a4 withIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  CNFavoritesEntry *v12;
  void *v13;
  CNFavoritesEntry *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CNFavorites isFull](self, "isFull"))
  {
    v11 = 0;
  }
  else
  {
    v12 = [CNFavoritesEntry alloc];
    -[CNFavorites contactStore](self, "contactStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CNFavoritesEntry initWithContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:store:](v12, "initWithContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:store:", v8, v9, v10, CFSTR("AudioCallActionType"), CFSTR("com.apple.mobilephone"), v13);

    v11 = v14 != 0;
    if (v14)
      -[CNFavorites addEntry:](self, "addEntry:", v14);

  }
  return v11;
}

- (void)_removeEntryFromMap:(id)a3 withUid:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = *(_QWORD *)&a4;
  v15 = a3;
  -[CNFavorites uidToEntry](self, "uidToEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v4 & 0x80000000) == 0 && v6)
  {
    -[CNFavorites uidToEntry](self, "uidToEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_11;
      if (objc_msgSend(v9, "count"))
      {
        v10 = 0;
        while (1)
        {
          objc_msgSend(v9, "objectAtIndex:", v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11 == v15)
            break;
          if (++v10 >= (unint64_t)objc_msgSend(v9, "count"))
            goto LABEL_13;
        }
        if (objc_msgSend(v9, "count") != 1)
        {
          if (objc_msgSend(v9, "count") == 2)
          {
            objc_msgSend(v9, "objectAtIndex:", v10 == 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = (void *)objc_msgSend(v9, "mutableCopy");
            objc_msgSend(v12, "removeObjectAtIndex:", v10);
          }
          -[CNFavorites uidToEntry](self, "uidToEntry");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

          goto LABEL_12;
        }
LABEL_11:
        -[CNFavorites uidToEntry](self, "uidToEntry");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectForKey:", v13);
LABEL_12:

      }
    }
LABEL_13:

  }
}

- (void)addEntry:(id)a3
{
  CNFavorites *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  NSArray *entries;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[CNFavorites entries](v4, "entries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v9 && v6 <= 0x31)
  {
    -[NSArray arrayByAddingObject:](v4->_entries, "arrayByAddingObject:", v9);
    v7 = objc_claimAutoreleasedReturnValue();
    entries = v4->_entries;
    v4->_entries = (NSArray *)v7;

    -[CNFavorites _addEntryToMap:](v4, "_addEntryToMap:", v9);
    -[CNFavorites setDirty:](v4, "setDirty:", 1);
  }
  objc_sync_exit(v4);

}

- (void)removeEntryAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *entries;
  CNFavorites *obj;

  obj = self;
  objc_sync_enter(obj);
  -[CNFavorites entries](obj, "entries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNFavorites _removeEntryFromMap:withUid:](obj, "_removeEntryFromMap:withUid:", v5, objc_msgSend(v5, "abUid"));
  v6 = (void *)-[NSArray mutableCopy](obj->_entries, "mutableCopy");
  objc_msgSend(v6, "removeObjectAtIndex:", a3);
  v7 = objc_msgSend(v6, "copy");
  entries = obj->_entries;
  obj->_entries = (NSArray *)v7;

  -[CNFavorites setDirty:](obj, "setDirty:", 1);
  objc_sync_exit(obj);

}

- (void)moveEntryAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  NSArray *entries;
  uint64_t v9;
  NSArray *v10;
  CNFavorites *obj;

  obj = self;
  objc_sync_enter(obj);
  if (a4 > a3)
  {
    v6 = (void *)-[NSArray mutableCopy](obj->_entries, "mutableCopy");
    objc_msgSend(v6, "_cn_rotateRange:by:", a3, a4 - a3 + 1, -1);
    v7 = objc_msgSend(v6, "mutableCopy");
    entries = obj->_entries;
    obj->_entries = (NSArray *)v7;

    -[CNFavorites setDirty:](obj, "setDirty:", 1);
LABEL_5:

    goto LABEL_6;
  }
  if (a4 < a3)
  {
    v6 = (void *)-[NSArray mutableCopy](obj->_entries, "mutableCopy");
    objc_msgSend(v6, "_cn_rotateRange:by:", a4, a3 - a4 + 1, 1);
    v9 = objc_msgSend(v6, "mutableCopy");
    v10 = obj->_entries;
    obj->_entries = (NSArray *)v9;

    -[CNFavorites setDirty:](obj, "setDirty:", 1);
    goto LABEL_5;
  }
LABEL_6:
  objc_sync_exit(obj);

}

- (void)removeAllEntries
{
  NSArray *entries;
  CNFavorites *obj;

  obj = self;
  objc_sync_enter(obj);
  -[CNFavorites setUidToEntry:](obj, "setUidToEntry:", 0);
  entries = obj->_entries;
  obj->_entries = 0;

  -[CNFavorites setDirty:](obj, "setDirty:", 1);
  -[CNFavorites setNeedsReload:](obj, "setNeedsReload:", 0);
  objc_sync_exit(obj);

}

- (BOOL)writeFavoritesToFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[CNFavorites logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__CNFavorites_writeFavoritesToFile___block_invoke;
  v8[3] = &unk_1E29FE0A8;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "writingFavorites:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __36__CNFavorites_writeFavoritesToFile___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  uint64_t v32;
  id v33;

  objc_msgSend(MEMORY[0x1E0D13A10], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnlockedSinceBoot");

  if ((v3 & 1) != 0)
  {
    if (+[CNContactStore authorizationStatusForEntityType:](CNContactStore, "authorizationStatusForEntityType:", 0) == CNAuthorizationStatusAuthorized)
    {
      +[CNFavorites favoritesPath](CNFavorites, "favoritesPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 40);
      v33 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, &v33);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v33;
      if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13818] + 16))())
      {
        objc_msgSend(*(id *)(a1 + 32), "logger");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "failedToConvertFavoritesToPropertyList:", v7);
      }
      else
      {
        dispatch_get_global_queue(0, 0);
        v9 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __36__CNFavorites_writeFavoritesToFile___block_invoke_2;
        block[3] = &unk_1E29F84E0;
        v10 = v6;
        v30 = v10;
        v11 = *(id *)(a1 + 40);
        v12 = *(_QWORD *)(a1 + 32);
        v31 = v11;
        v32 = v12;
        dispatch_async(v9, block);

        objc_msgSend(*(id *)(a1 + 32), "XPCDataMapper");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v28 = 0;
          v15 = objc_msgSend(v13, "writeFavoritesPropertyListData:toPath:error:", v10, v4, &v28);
          v16 = v28;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v15;
          v17 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          objc_msgSend(*(id *)(a1 + 32), "logger");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v17)
            objc_msgSend(v18, "finishedWritingRemoteFavorites");
          else
            objc_msgSend(v18, "failedToWriteRemoteFavorites:", v16);

        }
        else
        {
          v27 = v7;
          v20 = objc_msgSend(v10, "writeToFile:options:error:", v4, 1073741825, &v27);
          v21 = v27;

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v20;
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "fileExistsAtPath:", v4);

            objc_msgSend(*(id *)(a1 + 32), "logger");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v24;
            if (v23)
              objc_msgSend(v24, "finishedWritingFavoritesToPath:entriesCount:", v4, objc_msgSend(*(id *)(a1 + 40), "count"));
            else
              objc_msgSend(v24, "failedToVerifyWrittenFavoritesExistsAtPath:", v4);
          }
          else
          {
            v25 = objc_msgSend(*(id *)(a1 + 32), "shouldSimulateCrashReportForError:", v21);
            objc_msgSend(*(id *)(a1 + 32), "logger");
            v16 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "failedToWriteFavoritesToPath:error:simulateCrashReport:", v4, v21, v25);
          }
          v7 = v21;
        }

        v8 = v30;
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "reportFavoritesAccessedBeforeFirstUnlock");

  }
}

void __36__CNFavorites_writeFavoritesToFile___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v2, 0, 0, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToArray:", v3) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "failedToVerifyFavorites:withPropertyListFavorites:error:", *(_QWORD *)(a1 + 40), v3, v4);

  }
}

- (void)save
{
  char v3;
  id v4;
  CNFavorites *v5;
  unint64_t i;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  BOOL v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v15;
  char v16;

  if (-[CNFavorites needsReload](self, "needsReload"))
  {
    v3 = 1;
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self;
    objc_sync_enter(v5);
    for (i = 0; ; ++i)
    {
      -[CNFavorites entries](v5, "entries");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (i >= v8)
        break;
      v16 = 0;
      -[CNFavorites entries](v5, "entries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(v10, "dictionaryRepresentation:isDirty:", &v15, &v16);
      v11 = v15;

      objc_msgSend(v4, "addObject:", v11);
      if (v16)
        -[CNFavorites setDirty:](v5, "setDirty:", 1);

    }
    objc_sync_exit(v5);

    v12 = -[CNFavorites dirty](v5, "dirty");
    if (v12)
      -[CNFavorites writeFavoritesToFile:](v5, "writeFavoritesToFile:", v4);

    v3 = !v12;
  }
  -[CNFavorites setDirty:](self, "setDirty:", 0);
  v13 = -[CNFavorites needsReload](self, "needsReload");
  if ((v3 & 1) == 0 && !v13)
  {
    -[CNFavorites setPostCount:](self, "setPostCount:", -[CNFavorites postCount](self, "postCount") + 1);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CNFavoritesChangedExternallyNotification"), 0, 0, 1u);
  }
}

- (void)rematchEntriesWithOptions:(unint64_t)a3
{
  void *v5;
  _QWORD v6[6];

  -[CNFavorites logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__CNFavorites_rematchEntriesWithOptions___block_invoke;
  v6[3] = &unk_1E29FE120;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "rematchingFavorites:", v6);

}

void __41__CNFavorites_rematchEntriesWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CNGeminiManager *v9;
  CNGeminiManager *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  CNGeminiManager *v16;
  uint64_t *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v3 = a2;
  if ((ABDeviceIsBeforeFirstUnlockWithDataProtected() & 1) == 0)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    objc_msgSend(*(id *)(a1 + 32), "setNeedsReload:", 1);
    v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    v5 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(*(id *)(a1 + 32), "entries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v4);
    if ((*(_BYTE *)(a1 + 40) & 1) != 0)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __41__CNFavorites_rematchEntriesWithOptions___block_invoke_2;
      v18[3] = &unk_1E29FE0D0;
      v18[4] = &v19;
      objc_msgSend(v7, "_cn_each:", v18);
      if (*((_BYTE *)v20 + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "_uniqueRematchedEntries:", v7);
        v8 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v8;
      }
    }
    if ((*(_BYTE *)(a1 + 40) & 2) != 0)
    {
      v9 = objc_alloc_init(CNGeminiManager);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __41__CNFavorites_rematchEntriesWithOptions___block_invoke_3;
      v15[3] = &unk_1E29FE0F8;
      v17 = &v19;
      v10 = v9;
      v16 = v10;
      objc_msgSend(v7, "_cn_each:", v15);

    }
    if (*((_BYTE *)v20 + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "removeAllEntries");
      v11 = *(id *)(a1 + 32);
      objc_sync_enter(v11);
      v12 = objc_msgSend(v7, "mutableCopy");
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 8);
      *(_QWORD *)(v13 + 8) = v12;

      objc_sync_exit(v11);
      objc_msgSend(*(id *)(a1 + 32), "save");
    }

    _Block_object_dispose(&v19, 8);
  }

}

uint64_t __41__CNFavorites_rematchEntriesWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "rematchWithContacts");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

uint64_t __41__CNFavorites_rematchEntriesWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "rematchWithGeminiManager:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= result;
  return result;
}

- (id)_uniqueRematchedEntries:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  unint64_t v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "oldAbUid");

      if ((v8 & 0x80000000) == 0)
      {
        v13[0] = v6;
        v13[1] = 3221225472;
        v13[2] = __39__CNFavorites__uniqueRematchedEntries___block_invoke;
        v13[3] = &unk_1E29FE148;
        v16 = v5;
        v14 = v3;
        v15 = v4;
        objc_msgSend(v15, "enumerateIndexesUsingBlock:", v13);

      }
      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }
  v9 = objc_msgSend(v4, "count");
  if (v9 == objc_msgSend(v3, "count"))
  {
    v10 = v3;
  }
  else
  {
    objc_msgSend(v3, "objectsAtIndexes:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

void __39__CNFavorites__uniqueRematchedEntries___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  int v8;

  if (*(_QWORD *)(a1 + 48) != a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "removeIndex:", *(_QWORD *)(a1 + 48));
      *a3 = 1;
    }
  }
}

- (void)_entriesChangedExternally
{
  CNFavorites *v3;
  NSArray *entries;

  if (-[CNFavorites postCount](self, "postCount"))
  {
    -[CNFavorites setPostCount:](self, "setPostCount:", -[CNFavorites postCount](self, "postCount") - 1);
  }
  else if (!-[CNFavorites needsReload](self, "needsReload") && !-[CNFavorites dirty](self, "dirty"))
  {
    v3 = self;
    objc_sync_enter(v3);
    entries = v3->_entries;
    v3->_entries = 0;

    -[CNFavorites setUidToEntry:](v3, "setUidToEntry:", 0);
    -[CNFavorites setNeedsReload:](v3, "setNeedsReload:", 1);
    objc_sync_exit(v3);

    -[CNFavorites _postChangeNotification](v3, "_postChangeNotification");
  }
}

- (void)_postChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("CNFavoritesChangedNotification"), self);

}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setUidToEntry:(id)a3
{
  objc_storeStrong((id *)&self->_uidToEntry, a3);
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (unint64_t)postCount
{
  return self->_postCount;
}

- (void)setPostCount:(unint64_t)a3
{
  self->_postCount = a3;
}

@end
