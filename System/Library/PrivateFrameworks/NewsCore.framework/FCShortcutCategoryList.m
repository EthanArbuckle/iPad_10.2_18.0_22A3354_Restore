@implementation FCShortcutCategoryList

- (FCShortcutCategoryList)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  FCShortcutCategoryList *v5;
  FCMTWriterLock *v6;
  FCMTWriterLock *itemsLock;
  uint64_t v8;
  NSMutableDictionary *shortcutCategoriesByID;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FCShortcutCategoryList;
  v5 = -[FCPrivateDataController initWithContext:pushNotificationCenter:storeDirectory:](&v11, sel_initWithContext_pushNotificationCenter_storeDirectory_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(FCMTWriterLock);
    itemsLock = v5->_itemsLock;
    v5->_itemsLock = v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    shortcutCategoriesByID = v5->_shortcutCategoriesByID;
    v5->_shortcutCategoriesByID = (NSMutableDictionary *)v8;

  }
  return v5;
}

- (NSArray)blockedShortcutCategories
{
  id v3;
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v14 = (id)objc_msgSend(v3, "initWithArray:", MEMORY[0x1E0C9AA60]);
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v5 = itemsLock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__FCShortcutCategoryList_blockedShortcutCategories__block_invoke;
  v8[3] = &unk_1E463DF90;
  v8[4] = self;
  v8[5] = &v9;
  -[FCMTWriterLock performReadSync:](v5, "performReadSync:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

uint64_t __51__FCShortcutCategoryList_blockedShortcutCategories__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  _QWORD v3[5];

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[12];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__FCShortcutCategoryList_blockedShortcutCategories__block_invoke_2;
  v3[3] = &unk_1E463DF68;
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __51__FCShortcutCategoryList_blockedShortcutCategories__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(v4, "status"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

}

- (void)addShortcutCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FCMTWriterLock *itemsLock;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  FCModifyShortcutCategoryListCommand *v17;
  void *v18;
  FCModifyShortcutCategoryListCommand *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[4];
  __int128 buf;
  void *v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    v23[0] = CFSTR("type");
    NSStringFromShortcutCategoryType((__CFString *)objc_msgSend(v4, "type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v5;
    v23[1] = CFSTR("categoryID");
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&buf + 1) = v6;
    v23[2] = CFSTR("dateAdded");
    objc_msgSend(v4, "dateAdded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v7;
    v23[3] = CFSTR("status");
    NSStringFromShortcutCategoryStatus((__CFString *)objc_msgSend(v4, "status"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, v23, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (self)
    {
LABEL_3:
      itemsLock = self->_itemsLock;
      goto LABEL_4;
    }
  }
  else
  {
    v9 = 0;
    if (self)
      goto LABEL_3;
  }
  itemsLock = 0;
LABEL_4:
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __46__FCShortcutCategoryList_addShortcutCategory___block_invoke;
  v20[3] = &unk_1E463AD10;
  v20[4] = self;
  v11 = v4;
  v21 = v11;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v20);
  -[FCPrivateDataController localStore](self, "localStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v9, v13);

  v14 = (void *)FCShortcutCategoryListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v11, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "Adding shortcut category, identifier=<%{public}@>", (uint8_t *)&buf, 0xCu);

  }
  v17 = [FCModifyShortcutCategoryListCommand alloc];
  v22 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[FCModifyShortcutCategoryListCommand initWithShortcutCategories:merge:](v17, "initWithShortcutCategories:merge:", v18, 0);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v19);
}

void __46__FCShortcutCategoryList_addShortcutCategory___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  _QWORD *v3;
  id v4;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[12];
  v2 = *(void **)(a1 + 40);
  v3 = v1;
  objc_msgSend(v2, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, v4);

}

- (void)removeShortcutCategoryWithIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *shortcutCategoriesByID;
  NSMutableDictionary *v6;
  void *v7;
  FCMTWriterLock *itemsLock;
  id v9;
  void *v10;
  NSObject *v11;
  FCRemoveFromShortcutCategoryListCommand *v12;
  void *v13;
  FCRemoveFromShortcutCategoryListCommand *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    if (self)
      shortcutCategoriesByID = self->_shortcutCategoriesByID;
    else
      shortcutCategoriesByID = 0;
    v6 = shortcutCategoriesByID;
    -[NSMutableDictionary objectForKey:](v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (self)
        itemsLock = self->_itemsLock;
      else
        itemsLock = 0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __63__FCShortcutCategoryList_removeShortcutCategoryWithIdentifier___block_invoke;
      v16[3] = &unk_1E463AD10;
      v16[4] = self;
      v9 = v4;
      v17 = v9;
      -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v16);
      -[FCPrivateDataController localStore](self, "localStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectForKey:", v9);

      v11 = FCShortcutCategoryListLog;
      if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = (const char *)v9;
        _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "Removing shortcut category <%{public}@>", buf, 0xCu);
      }
      v12 = [FCRemoveFromShortcutCategoryListCommand alloc];
      v18 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[FCRemoveFromShortcutCategoryListCommand initWithShortcutCategories:](v12, "initWithShortcutCategories:", v13);

      -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v14);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "shortcutCategory");
      *(_DWORD *)buf = 136315906;
      v20 = "-[FCShortcutCategoryList removeShortcutCategoryWithIdentifier:]";
      v21 = 2080;
      v22 = "FCShortcutCategoryList.m";
      v23 = 1024;
      v24 = 106;
      v25 = 2114;
      v26 = v15;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "identifier");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCShortcutCategoryList removeShortcutCategoryWithIdentifier:]";
    v21 = 2080;
    v22 = "FCShortcutCategoryList.m";
    v23 = 1024;
    v24 = 102;
    v25 = 2114;
    v26 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_14:

  }
}

uint64_t __63__FCShortcutCategoryList_removeShortcutCategoryWithIdentifier___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[12];
  return objc_msgSend(v1, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllShortcutCategories
{
  id v3;
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  FCRemoveFromShortcutCategoryListCommand *v10;
  FCRemoveFromShortcutCategoryListCommand *v11;
  _QWORD v12[5];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v19 = (id)objc_msgSend(v3, "initWithArray:", MEMORY[0x1E0C9AA60]);
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v5 = itemsLock;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__FCShortcutCategoryList_removeAllShortcutCategories__block_invoke;
  v13[3] = &unk_1E463DF90;
  v13[4] = self;
  v13[5] = &v14;
  -[FCMTWriterLock performWriteSync:](v5, "performWriteSync:", v13);

  v7 = (void *)v15[5];
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __53__FCShortcutCategoryList_removeAllShortcutCategories__block_invoke_3;
  v12[3] = &unk_1E463D0B8;
  v12[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);
  v8 = FCShortcutCategoryListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v15[5];
    *(_DWORD *)buf = 138543362;
    v21 = v9;
    _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "Removing shortcut categories <%{public}@>", buf, 0xCu);
  }
  v10 = [FCRemoveFromShortcutCategoryListCommand alloc];
  v11 = -[FCRemoveFromShortcutCategoryListCommand initWithShortcutCategories:](v10, "initWithShortcutCategories:", v15[5]);
  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v11);

  _Block_object_dispose(&v14, 8);
}

uint64_t __53__FCShortcutCategoryList_removeAllShortcutCategories__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[6];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 96);
  else
    v2 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__FCShortcutCategoryList_removeAllShortcutCategories__block_invoke_2;
  v5[3] = &unk_1E463DFB8;
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = v1;
  v5[5] = v3;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);
}

void __53__FCShortcutCategoryList_removeAllShortcutCategories__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  id v8;

  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[12];
  v6 = v5;
  v8 = a3;
  objc_msgSend(v8, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
}

void __53__FCShortcutCategoryList_removeAllShortcutCategories__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "localStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v3);

}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 1;
}

+ (id)backingRecordZoneIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)localStoreFilename
{
  return CFSTR("shortcut-category-list");
}

+ (unint64_t)localStoreVersion
{
  return 1;
}

+ (id)commandStoreFileName
{
  return CFSTR("shortcut-category-list-commands");
}

+ (int64_t)commandQueueUrgency
{
  return 2;
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  FCModifyShortcutCategoryListCommand *v16;
  void *v17;
  uint8_t v19[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  FCModifyShortcutCategoryListCommand *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(a1, "isLocalStoreKeyInternal:", v12) & 1) == 0)
        {
          objc_msgSend(v5, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[FCShortcutCategory initWithIdentifier:dictionaryRepresentation:]([FCShortcutCategory alloc], v12, v13);
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v9);
  }

  v15 = FCShortcutCategoryListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "Merging shortcut category list data to icloud", v19, 2u);
  }
  v16 = -[FCModifyShortcutCategoryListCommand initWithShortcutCategories:merge:]([FCModifyShortcutCategoryListCommand alloc], "initWithShortcutCategories:merge:", v6, 1);
  v24 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  FCMTWriterLock *itemsLock;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  FCShortcutCategoryList *v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCPrivateDataController localStore](self, "localStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v10 = v9;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__FCShortcutCategoryList_handleSyncWithChangedRecords_deletedRecordNames___block_invoke;
  v16[3] = &unk_1E463C840;
  v17 = v6;
  v18 = self;
  v19 = v9;
  v20 = v8;
  v21 = v7;
  v12 = v7;
  v13 = v8;
  v14 = v10;
  v15 = v6;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v16);

}

void __74__FCShortcutCategoryList_handleSyncWithChangedRecords_deletedRecordNames___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  __int128 v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t v62[4];
  void *v63;
  _QWORD v64[4];
  _BYTE buf[24];
  _QWORD v66[5];

  v66[2] = *MEMORY[0x1E0C80C00];
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = *(id *)(a1 + 32);
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v1)
  {
    v3 = v1;
    v45 = *(_QWORD *)v57;
    *(_QWORD *)&v2 = 136315906;
    v43 = v2;
    do
    {
      v4 = 0;
      v46 = v3;
      do
      {
        if (*(_QWORD *)v57 != v45)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v4);
        v6 = *(_QWORD *)(a1 + 40);
        v7 = *(void **)(a1 + 56);
        v50 = *(id *)(a1 + 48);
        v8 = v7;
        if (v6)
        {
          v48 = v6;
          v9 = v5;
          objc_msgSend(v9, "recordID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "recordName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dateAdded"));
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("type"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("categoryID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = v8;
          if (v12)
          {
            v47 = v12;
            v17 = (void *)objc_msgSend(v12, "mutableCopy");
            objc_msgSend(v17, "fc_safelySetObjectAllowingNil:forKey:", v13, CFSTR("dateAdded"));
            objc_msgSend(v17, "fc_safelySetObjectAllowingNil:forKey:", v14, CFSTR("type"));
            objc_msgSend(v17, "fc_safelySetObjectAllowingNil:forKey:", v15, CFSTR("categoryID"));
            objc_msgSend(v17, "fc_safelySetObjectAllowingNil:forKey:", v16, CFSTR("status"));
            objc_msgSend(v8, "setObject:forKey:", v17, v11);
            if (v11)
            {
              v18 = -[FCShortcutCategory initWithIdentifier:dictionaryRepresentation:]([FCShortcutCategory alloc], v11, v17);
              objc_msgSend(*(id *)(v48 + 96), "setObject:forKey:", v18, v11);
              objc_msgSend(v50, "addObject:", v18);
              v19 = FCShortcutCategoryListLog;
              if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v11;
                _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "Modifying shortcut category when handling sync <%{public}@>", buf, 0xCu);
              }

            }
            v3 = v46;
            v20 = (void *)v13;
            v21 = v47;
LABEL_13:

            v8 = v49;
            goto LABEL_14;
          }
          if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a shortcut category without an item ID"));
            *(_DWORD *)buf = v43;
            *(_QWORD *)&buf[4] = "-[FCShortcutCategoryList _syncShortcutCategories:localStore:record:]";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "FCShortcutCategoryList.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v66[0]) = 317;
            WORD2(v66[0]) = 2114;
            *(_QWORD *)((char *)v66 + 6) = v26;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          v3 = v46;
          v20 = (void *)v13;
          if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a shortcut category without a date added"));
            *(_DWORD *)buf = v43;
            *(_QWORD *)&buf[4] = "-[FCShortcutCategoryList _syncShortcutCategories:localStore:record:]";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "FCShortcutCategoryList.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v66[0]) = 318;
            WORD2(v66[0]) = 2114;
            *(_QWORD *)((char *)v66 + 6) = v27;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          v21 = 0;
          if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a shortcut category without a category type value"));
            *(_DWORD *)buf = v43;
            *(_QWORD *)&buf[4] = "-[FCShortcutCategoryList _syncShortcutCategories:localStore:record:]";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "FCShortcutCategoryList.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v66[0]) = 319;
            WORD2(v66[0]) = 2114;
            *(_QWORD *)((char *)v66 + 6) = v28;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

            if (!v15)
              goto LABEL_25;
          }
          else if (!v15)
          {
LABEL_25:
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a shortcut category without a category id value"));
              *(_DWORD *)buf = v43;
              *(_QWORD *)&buf[4] = "-[FCShortcutCategoryList _syncShortcutCategories:localStore:record:]";
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "FCShortcutCategoryList.m";
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v66[0]) = 320;
              WORD2(v66[0]) = 2114;
              *(_QWORD *)((char *)v66 + 6) = v29;
              _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

            }
          }
          if (v16)
          {
            if (v11 && v20 && v14 && v15)
            {
              v64[0] = CFSTR("dateAdded");
              v64[1] = CFSTR("type");
              *(_QWORD *)buf = v20;
              *(_QWORD *)&buf[8] = v14;
              v64[2] = CFSTR("categoryID");
              v64[3] = CFSTR("status");
              *(_QWORD *)&buf[16] = v15;
              v66[0] = v16;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v64, 4);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = -[FCShortcutCategory initWithIdentifier:dictionaryRepresentation:]([FCShortcutCategory alloc], v11, v22);
              objc_msgSend(*(id *)(v48 + 96), "setObject:forKey:", v23, v11);
              objc_msgSend(v49, "setObject:forKey:", v22, v11);
              objc_msgSend(v50, "addObject:", v23);
              v24 = FCShortcutCategoryListLog;
              if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v62 = 138543362;
                v63 = v11;
                _os_log_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_DEFAULT, "Adding shortcut category when handling sync <%{public}@>", v62, 0xCu);
              }

              v3 = v46;
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a shortcut category without a category status value"));
            *(_DWORD *)buf = v43;
            *(_QWORD *)&buf[4] = "-[FCShortcutCategoryList _syncShortcutCategories:localStore:record:]";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "FCShortcutCategoryList.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v66[0]) = 321;
            WORD2(v66[0]) = 2114;
            *(_QWORD *)((char *)v66 + 6) = v25;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          goto LABEL_13;
        }
LABEL_14:

        ++v4;
      }
      while (v3 != v4);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      v3 = v30;
    }
    while (v30);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v31 = *(id *)(a1 + 64);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v53;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v53 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v35);
        objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v36, v43);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v38 = -[FCShortcutCategory initWithIdentifier:dictionaryRepresentation:]([FCShortcutCategory alloc], v36, v37);
          v39 = *(_QWORD *)(a1 + 40);
          if (v39)
            v40 = *(void **)(v39 + 96);
          else
            v40 = 0;
          objc_msgSend(v40, "removeObjectForKey:", v36);
          objc_msgSend(*(id *)(a1 + 56), "removeObjectForKey:", v36);
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v38);
          v41 = FCShortcutCategoryListLog;
          if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v36;
            _os_log_impl(&dword_1A1B90000, v41, OS_LOG_TYPE_DEFAULT, "Removing shortcut category when handling sync <%{public}@>", buf, 0xCu);
          }

        }
        ++v35;
      }
      while (v33 != v35);
      v42 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      v33 = v42;
    }
    while (v42);
  }

}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  NSMutableDictionary *shortcutCategoriesByID;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3);
  if (self)
    shortcutCategoriesByID = self->_shortcutCategoriesByID;
  else
    shortcutCategoriesByID = 0;
  -[NSMutableDictionary allValues](shortcutCategoriesByID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __68__FCShortcutCategoryList_allKnownRecordNamesWithinRecordZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)loadLocalCachesFromStore
{
  FCMTWriterLock *itemsLock;
  _QWORD v3[5];

  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__FCShortcutCategoryList_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = self;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v3);
}

void __50__FCShortcutCategoryList_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    objc_storeStrong((id *)(v3 + 96), v2);

  objc_msgSend(*(id *)(a1 + 32), "localStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_opt_class(), "isLocalStoreKeyInternal:", v10) & 1) == 0)
        {
          objc_opt_class();
          objc_msgSend(v4, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
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

          if (v13)
          {
            v14 = -[FCShortcutCategory initWithIdentifier:dictionaryRepresentation:]([FCShortcutCategory alloc], v10, v13);
            if (v14)
            {
              v15 = *(_QWORD **)(a1 + 32);
              if (v15)
                v15 = (_QWORD *)v15[12];
              v16 = v15;
              objc_msgSend(v14, "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKey:", v14, v17);

            }
          }
          else
          {
            v18 = (void *)FCDefaultLog;
            if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
            {
              v19 = v18;
              v20 = (objc_class *)objc_opt_class();
              NSStringFromClass(v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v27 = v21;
              v28 = 2114;
              v29 = v10;
              _os_log_error_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_ERROR, "ERROR: Object of type %@ is not dictionary for key %{public}@", buf, 0x16u);

            }
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v7);
  }

}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("ShortcutCategories"));
}

- (id)recordsForRestoringZoneName:(id)a3
{
  FCShortcutCategoryList *v3;
  FCMTWriterLock *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = self;
  if (self)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__16;
    v12 = __Block_byref_object_dispose__16;
    v13 = 0;
    v4 = self->_itemsLock;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__FCShortcutCategoryList__allShortcutCategories__block_invoke;
    v7[3] = &unk_1E463AD80;
    v7[4] = v3;
    v7[5] = &v8;
    -[FCMTWriterLock performReadSync:](v4, "performReadSync:", v7);

    v3 = (FCShortcutCategoryList *)(id)v9[5];
    _Block_object_dispose(&v8, 8);

  }
  -[FCShortcutCategoryList fc_arrayByTransformingWithBlock:](v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __54__FCShortcutCategoryList_recordsForRestoringZoneName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

void __48__FCShortcutCategoryList__allShortcutCategories__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[12];
  v3 = v2;
  objc_msgSend(v3, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_shortcutCategoriesByID, 0);
}

@end
