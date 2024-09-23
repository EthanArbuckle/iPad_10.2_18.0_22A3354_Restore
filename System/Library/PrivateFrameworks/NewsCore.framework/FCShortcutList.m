@implementation FCShortcutList

void __31__FCShortcutList__allShortcuts__block_invoke(uint64_t a1)
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

void __42__FCShortcutList_loadLocalCachesFromStore__block_invoke(uint64_t a1)
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
            v14 = -[FCShortcut initWithIdentifier:dictionaryRepresentation:]([FCShortcut alloc], v10, v13);
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

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

+ (unint64_t)localStoreVersion
{
  return 1;
}

+ (id)localStoreFilename
{
  return CFSTR("shortcut-list");
}

+ (id)commandStoreFileName
{
  return CFSTR("shortcut-list-commands");
}

+ (int64_t)commandQueueUrgency
{
  return 1;
}

- (NSOrderedSet)orderedShortcuts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (self)
  {
    v2 = (void *)MEMORY[0x1E0C99E40];
    -[FCShortcutList _allShortcuts]((id *)&self->super.super.isa);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_46_1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "orderedSetWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSOrderedSet *)v5;
}

- (id)_allShortcuts
{
  id *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__4;
    v9 = __Block_byref_object_dispose__4;
    v10 = 0;
    v2 = a1[13];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __31__FCShortcutList__allShortcuts__block_invoke;
    v4[3] = &unk_1E463AD80;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadSync:", v4);

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);

  }
  return v1;
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
  v3[2] = __42__FCShortcutList_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = self;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v3);
}

- (void)addObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCShortcutList;
  -[FCPrivateDataController addObserver:](&v3, sel_addObserver_, a3);
}

- (FCShortcutList)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  FCShortcutList *v5;
  FCMTWriterLock *v6;
  FCMTWriterLock *itemsLock;
  uint64_t v8;
  NSMutableDictionary *shortcutsByID;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FCShortcutList;
  v5 = -[FCPrivateDataController initWithContext:pushNotificationCenter:storeDirectory:](&v11, sel_initWithContext_pushNotificationCenter_storeDirectory_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(FCMTWriterLock);
    itemsLock = v5->_itemsLock;
    v5->_itemsLock = v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    shortcutsByID = v5->_shortcutsByID;
    v5->_shortcutsByID = (NSMutableDictionary *)v8;

  }
  return v5;
}

- (void)addShortcut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  FCMTWriterLock *itemsLock;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  FCModifyShortcutsCommand *v17;
  void *v18;
  FCModifyShortcutsCommand *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[3];
  __int128 buf;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    v24[0] = CFSTR("dateAdded");
    objc_msgSend(v4, "dateAdded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v5;
    v24[1] = CFSTR("order");
    objc_msgSend(v4, "order");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&buf + 1) = v6;
    v24[2] = CFSTR("type");
    NSStringFromShortcutType((__CFString *)objc_msgSend(v4, "shortcutType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, v24, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (self)
    {
LABEL_3:
      itemsLock = self->_itemsLock;
      goto LABEL_4;
    }
  }
  else
  {
    v8 = 0;
    if (self)
      goto LABEL_3;
  }
  itemsLock = 0;
LABEL_4:
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __30__FCShortcutList_addShortcut___block_invoke;
  v20[3] = &unk_1E463AD10;
  v20[4] = self;
  v10 = v4;
  v21 = v10;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v20);
  -[FCPrivateDataController localStore](self, "localStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v8, v12);

  v23 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:](self, v13, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);

  v14 = (void *)FCShortcutListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v10, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "Adding favorites <%{public}@>", (uint8_t *)&buf, 0xCu);

  }
  v17 = [FCModifyShortcutsCommand alloc];
  v22 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[FCModifyShortcutsCommand initWithShortcuts:merge:](v17, "initWithShortcuts:merge:", v18, 0);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v19);
}

void __30__FCShortcutList_addShortcut___block_invoke(uint64_t a1)
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

- (void)_addedShortcuts:(void *)a3 changedShortcuts:(void *)a4 removedShortcuts:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "shortcutsAdded");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:]";
    v26 = 2080;
    v27 = "FCShortcutList.m";
    v28 = 1024;
    v29 = 467;
    v30 = 2114;
    v31 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v8)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "shortcutsChanged");
        *(_DWORD *)buf = 136315906;
        v25 = "-[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:]";
        v26 = 2080;
        v27 = "FCShortcutList.m";
        v28 = 1024;
        v29 = 468;
        v30 = 2114;
        v31 = v17;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v8)
  {
    goto LABEL_5;
  }
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "shortcutsRemoved");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:]";
    v26 = 2080;
    v27 = "FCShortcutList.m";
    v28 = 1024;
    v29 = 469;
    v30 = 2114;
    v31 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "observers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15++), "shortcutList:didAddShortcuts:changedShortcuts:removedShortcuts:", a1, v7, v8, v9);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

LABEL_18:
}

- (void)removeShortcutWithIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *shortcutsByID;
  NSMutableDictionary *v6;
  void *v7;
  FCMTWriterLock *itemsLock;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  FCRemoveShortcutCommand *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    if (self)
      shortcutsByID = self->_shortcutsByID;
    else
      shortcutsByID = 0;
    v6 = shortcutsByID;
    -[NSMutableDictionary objectForKey:](v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (self)
        itemsLock = self->_itemsLock;
      else
        itemsLock = 0;
      v9 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __47__FCShortcutList_removeShortcutWithIdentifier___block_invoke;
      v18[3] = &unk_1E463AD10;
      v18[4] = self;
      v10 = v4;
      v19 = v10;
      -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v18);
      -[FCPrivateDataController localStore](self, "localStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", v10);

      -[FCShortcutList orderedShortcuts](self, "orderedShortcuts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __47__FCShortcutList_removeShortcutWithIdentifier___block_invoke_2;
      v17[3] = &unk_1E463B948;
      v17[4] = self;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);

      v20 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:](self, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v13);

      v14 = FCShortcutListLog;
      if (os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = (const char *)v10;
        _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "Removing favorite <%{public}@>", buf, 0xCu);
      }
      v15 = -[FCRemoveShortcutCommand initWithShortcutID:]([FCRemoveShortcutCommand alloc], "initWithShortcutID:", v10);
      -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v15);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "shortcut");
      *(_DWORD *)buf = 136315906;
      v22 = "-[FCShortcutList removeShortcutWithIdentifier:]";
      v23 = 2080;
      v24 = "FCShortcutList.m";
      v25 = 1024;
      v26 = 94;
      v27 = 2114;
      v28 = v16;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identifier != nil");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCShortcutList removeShortcutWithIdentifier:]";
    v23 = 2080;
    v24 = "FCShortcutList.m";
    v25 = 1024;
    v26 = 90;
    v27 = 2114;
    v28 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_14:

  }
}

uint64_t __47__FCShortcutList_removeShortcutWithIdentifier___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[12];
  return objc_msgSend(v1, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __47__FCShortcutList_removeShortcutWithIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  -[FCShortcutList _moveShortcut:toIndex:](*(_QWORD **)(a1 + 32), a2, a3);
}

- (void)_moveShortcut:(uint64_t)a3 toIndex:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  FCShortcut *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  FCModifyShortcutsCommand *v20;
  void *v21;
  FCModifyShortcutsCommand *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_QWORD *);
  void *v27;
  _QWORD *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "order");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
    {
      objc_msgSend(a1, "localStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      objc_msgSend(v5, "dateAdded");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fc_safelySetObjectAllowingNil:forKey:", v12, CFSTR("dateAdded"));

      objc_msgSend(v11, "fc_safelySetObjectAllowingNil:forKey:", v6, CFSTR("order"));
      NSStringFromShortcutType((__CFString *)objc_msgSend(v5, "shortcutType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fc_safelySetObjectAllowingNil:forKey:", v13, CFSTR("type"));

      objc_msgSend(v5, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v11, v14);

      v15 = [FCShortcut alloc];
      objc_msgSend(v5, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[FCShortcut initWithIdentifier:dictionaryRepresentation:](v15, v16, v11);

      v18 = (void *)a1[13];
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __40__FCShortcutList__moveShortcut_toIndex___block_invoke;
      v27 = &unk_1E463B228;
      v28 = a1;
      v29 = v17;
      v30 = v5;
      v19 = v17;
      objc_msgSend(v18, "performWriteSync:", &v24);
      v20 = [FCModifyShortcutsCommand alloc];
      v32[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1, v24, v25, v26, v27, v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[FCModifyShortcutsCommand initWithShortcuts:merge:](v20, "initWithShortcuts:merge:", v21, 0);

      objc_msgSend(a1, "addCommandToCommandQueue:", v22);
      v31 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:](a1, MEMORY[0x1E0C9AA60], v23, MEMORY[0x1E0C9AA60]);

    }
  }

}

- (BOOL)moveShortcutWithIdentifier:(id)a3 toIndex:(unint64_t)a4
{
  void *v6;
  id v7;
  NSMutableDictionary *shortcutsByID;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[5];

  v6 = (void *)MEMORY[0x1E0CB3978];
  v7 = a3;
  objc_msgSend(v6, "isMainThread");
  if (self)
    shortcutsByID = self->_shortcutsByID;
  else
    shortcutsByID = 0;
  -[NSMutableDictionary objectForKey:](shortcutsByID, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCShortcutList _allShortcuts]((id *)&self->super.super.isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") <= a4 || !v9)
  {

    goto LABEL_8;
  }
  objc_msgSend(v9, "order");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  if (v13 == (float)a4)
  {
LABEL_8:
    v16 = 0;
    goto LABEL_9;
  }
  -[FCShortcutList orderedShortcuts](self, "orderedShortcuts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "removeObject:", v9);
  objc_msgSend(v15, "insertObject:atIndex:", v9, a4);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__FCShortcutList_moveShortcutWithIdentifier_toIndex___block_invoke;
  v18[3] = &unk_1E463B948;
  v18[4] = self;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v18);

  v16 = 1;
LABEL_9:

  return v16;
}

void __53__FCShortcutList_moveShortcutWithIdentifier_toIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  -[FCShortcutList _moveShortcut:toIndex:](*(_QWORD **)(a1 + 32), a2, a3);
}

- (void)updateShortcutOrderForOrderedIdentifiers:(id)a3
{
  id v4;
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v6;
  unint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  FCShortcut *v20;
  void *v21;
  id v22;
  FCMTWriterLock *v23;
  FCMTWriterLock *v24;
  id v25;
  FCModifyShortcutsCommand *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  FCShortcutList *v31;
  _QWORD v32[4];
  id v33;
  FCShortcutList *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__4;
  v40 = __Block_byref_object_dispose__4;
  v41 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v6 = itemsLock;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __59__FCShortcutList_updateShortcutOrderForOrderedIdentifiers___block_invoke;
  v32[3] = &unk_1E463AD58;
  v35 = &v36;
  v27 = v4;
  v33 = v27;
  v34 = self;
  -[FCMTWriterLock performReadSync:](v6, "performReadSync:", v32);

  for (i = 0; i < objc_msgSend((id)v37[5], "count"); ++i)
  {
    objc_msgSend((id)v37[5], "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "order");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    if (i != v10)
    {
      -[FCPrivateDataController localStore](self, "localStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_msgSend(v8, "dateAdded");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fc_safelySetObjectAllowingNil:forKey:", v15, CFSTR("dateAdded"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fc_safelySetObjectAllowingNil:forKey:", v16, CFSTR("order"));

      NSStringFromShortcutType((__CFString *)objc_msgSend(v8, "shortcutType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fc_safelySetObjectAllowingNil:forKey:", v17, CFSTR("type"));

      -[FCPrivateDataController localStore](self, "localStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v14, v19);

      v20 = [FCShortcut alloc];
      objc_msgSend(v8, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[FCShortcut initWithIdentifier:dictionaryRepresentation:](v20, v21, v14);

      objc_msgSend(v28, "addObject:", v22);
    }

  }
  if (objc_msgSend(v28, "count"))
  {
    if (self)
      v23 = self->_itemsLock;
    else
      v23 = 0;
    v24 = v23;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __59__FCShortcutList_updateShortcutOrderForOrderedIdentifiers___block_invoke_3;
    v29[3] = &unk_1E463AD10;
    v25 = v28;
    v30 = v25;
    v31 = self;
    -[FCMTWriterLock performWriteSync:](v24, "performWriteSync:", v29);

    v26 = -[FCModifyShortcutsCommand initWithShortcuts:merge:]([FCModifyShortcutsCommand alloc], "initWithShortcuts:merge:", v25, 0);
    -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v26);
    -[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:](self, MEMORY[0x1E0C9AA60], v25, MEMORY[0x1E0C9AA60]);

  }
  _Block_object_dispose(&v36, 8);

}

void __59__FCShortcutList_updateShortcutOrderForOrderedIdentifiers___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__FCShortcutList_updateShortcutOrderForOrderedIdentifiers___block_invoke_2;
  v6[3] = &unk_1E463B970;
  v2 = (void *)a1[4];
  v6[4] = a1[5];
  objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __59__FCShortcutList_updateShortcutOrderForOrderedIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 96);
  else
    v3 = 0;
  return objc_msgSend(v3, "objectForKey:", a2);
}

void __59__FCShortcutList_updateShortcutOrderForOrderedIdentifiers___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        v8 = *(_QWORD **)(a1 + 40);
        if (v8)
          v8 = (_QWORD *)v8[12];
        v9 = v8;
        objc_msgSend(v7, "identifier", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v7, v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (BOOL)containsShortcut:(id)a3
{
  void *v3;
  BOOL v4;

  if (self)
    self = (FCShortcutList *)self->_shortcutsByID;
  -[FCShortcutList objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)validateShortcuts
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  -[FCPrivateDataController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shortcutsMaxCount");

  -[NSMutableDictionary allValues](self->_shortcutsByID, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = MEMORY[0x1E0C809B0];
  if (v8 > v6)
  {
    -[FCShortcutList _allShortcuts]((id *)&self->super.super.isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "subarrayWithRange:", v6, objc_msgSend(v11, "count") - v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __35__FCShortcutList_validateShortcuts__block_invoke_2;
    v15[3] = &unk_1E463B948;
    v15[4] = self;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

  }
  v13 = (void *)-[NSMutableDictionary mutableCopy](self->_shortcutsByID, "mutableCopy");
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __35__FCShortcutList_validateShortcuts__block_invoke_3;
  v14[3] = &unk_1E463B9B8;
  v14[4] = self;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v14);

}

BOOL __35__FCShortcutList_validateShortcuts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v4 = a3;
  objc_msgSend(a2, "dateAdded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateAdded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6) == -1;
  return v7;
}

void __35__FCShortcutList_validateShortcuts__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeShortcutWithIdentifier:", v3);

}

void __35__FCShortcutList_validateShortcuts__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isDeprecated"))
  {
    v5 = (void *)FCShortcutListLog;
    if (!os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v4, "identifier", *(_OWORD *)v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeShortcutWithIdentifier:", v10);
      goto LABEL_6;
    }
    v6 = v5;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v14 = 138543362;
    *(_QWORD *)&v14[4] = v7;
    v8 = "Removing deprecated favorite: <%{public}@>";
LABEL_4:
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, v8, v14, 0xCu);

    goto LABEL_5;
  }
  if (objc_msgSend(v4, "shortcutType"))
    goto LABEL_8;
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "fc_isValidTagID"))
  {
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fc_isValidPuzzleTypeID");

    if ((v12 & 1) != 0)
      goto LABEL_8;
    v13 = (void *)FCShortcutListLog;
    if (!os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    v6 = v13;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v14 = 138543362;
    *(_QWORD *)&v14[4] = v7;
    v8 = "Removing favorite of type FCShortcutTypeTag with invalid tagID: <%{public}@>";
    goto LABEL_4;
  }
LABEL_6:

LABEL_8:
}

- (void)removeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCShortcutList;
  -[FCPrivateDataController removeObserver:](&v3, sel_removeObserver_, a3);
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("Shortcuts"));
}

- (id)recordsForRestoringZoneName:(id)a3
{
  void *v3;
  void *v4;

  -[FCShortcutList _allShortcuts]((id *)&self->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_29_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __46__FCShortcutList_recordsForRestoringZoneName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (id)backingRecordZoneIDs
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C95098]);
  v3 = (void *)objc_msgSend(v2, "initWithZoneName:ownerName:", CFSTR("Shortcuts"), *MEMORY[0x1E0C94730]);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E0C9AA60];
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
  FCModifyShortcutsCommand *v16;
  void *v17;
  uint8_t v19[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  FCModifyShortcutsCommand *v24;
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
          v14 = -[FCShortcut initWithIdentifier:dictionaryRepresentation:]([FCShortcut alloc], v12, v13);
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v9);
  }

  v15 = FCShortcutListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "Merging favorite data to icloud", v19, 2u);
  }
  v16 = -[FCModifyShortcutsCommand initWithShortcuts:merge:]([FCModifyShortcutsCommand alloc], "initWithShortcuts:merge:", v6, 1);
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
  void *v11;
  FCMTWriterLock *itemsLock;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  FCShortcutList *v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCPrivateDataController localStore](self, "localStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__FCShortcutList_handleSyncWithChangedRecords_deletedRecordNames___block_invoke;
  v19[3] = &unk_1E463BA00;
  v20 = v6;
  v21 = v8;
  v22 = self;
  v23 = v9;
  v24 = v10;
  v25 = v7;
  v26 = v11;
  v13 = v11;
  v14 = v7;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  v18 = v6;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v19);
  -[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:](self, v16, v15, v13);
  -[FCShortcutList validateShortcuts](self, "validateShortcuts");

}

void __66__FCShortcutList_handleSyncWithChangedRecords_deletedRecordNames___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  __int128 v53;
  id obj;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _QWORD v68[3];
  _QWORD v69[3];
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  char *v73;
  __int16 v74;
  int v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v1 = a1;
  v79 = *MEMORY[0x1E0C80C00];
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
  if (v2)
  {
    v4 = v2;
    v5 = CFSTR("dateAdded");
    v55 = *(_QWORD *)v64;
    *(_QWORD *)&v3 = 136315906;
    v53 = v3;
    v58 = v1;
    do
    {
      v6 = 0;
      v57 = v4;
      do
      {
        if (*(_QWORD *)v64 != v55)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v6);
        objc_msgSend(v7, "recordID", v53);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "recordName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v1 + 40), "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("order"));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v7;
        v14 = v10;
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("type"));
        v15 = v5;
        v16 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v17 = (void *)objc_msgSend(v10, "mutableCopy");
          v18 = v11;
          v19 = v17;
          v56 = v18;
          objc_msgSend(v17, "fc_safelySetObjectAllowingNil:forKey:");
          objc_msgSend(v19, "fc_safelySetObjectAllowingNil:forKey:", v12, CFSTR("order"));
          objc_msgSend(v19, "fc_safelySetObjectAllowingNil:forKey:", v16, CFSTR("type"));
          objc_msgSend(*(id *)(v1 + 40), "setObject:forKey:", v19, v9);
          v20 = (void *)v16;
          v21 = v57;
          v5 = v15;
          if (v9)
          {
            v22 = -[FCShortcut initWithIdentifier:dictionaryRepresentation:]([FCShortcut alloc], v9, v19);
            v23 = *(_QWORD *)(v58 + 48);
            if (v23)
              v24 = *(void **)(v23 + 96);
            else
              v24 = 0;
            objc_msgSend(v24, "setObject:forKey:", v22, v9);
            objc_msgSend(*(id *)(v58 + 64), "addObject:", v22);
            v25 = FCShortcutListLog;
            if (os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v71 = (const char *)v9;
              _os_log_impl(&dword_1A1B90000, v25, OS_LOG_TYPE_DEFAULT, "Modifying favorite when handling sync <%{public}@>", buf, 0xCu);
            }

            v21 = v57;
            v5 = CFSTR("dateAdded");
          }

          v26 = (void *)v12;
          v11 = v56;
          goto LABEL_14;
        }
        if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v33 = v11;
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a shortcut list shortcut without an item ID"));
          *(_DWORD *)buf = v53;
          v71 = "-[FCShortcutList handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
          v72 = 2080;
          v73 = "FCShortcutList.m";
          v74 = 1024;
          v75 = 354;
          v76 = 2114;
          v77 = v34;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          v11 = v33;
        }
        v20 = (void *)v16;
        v21 = v57;
        v5 = v15;
        if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a shortcut list shortcut without a date added"));
          *(_DWORD *)buf = v53;
          v71 = "-[FCShortcutList handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
          v72 = 2080;
          v73 = "FCShortcutList.m";
          v74 = 1024;
          v75 = 355;
          v76 = 2114;
          v77 = v35;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          v11 = 0;
        }
        v26 = (void *)v12;
        if (!v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v36 = v11;
          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a shortcut list shortcut without an order value"));
          *(_DWORD *)buf = v53;
          v71 = "-[FCShortcutList handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
          v72 = 2080;
          v73 = "FCShortcutList.m";
          v74 = 1024;
          v75 = 356;
          v76 = 2114;
          v77 = v37;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          v11 = v36;
          if (v20)
          {
LABEL_25:
            if (v9 && v11 && v12)
            {
              v68[0] = v5;
              v68[1] = CFSTR("order");
              v27 = v11;
              v69[0] = v11;
              v69[1] = v12;
              v68[2] = CFSTR("type");
              v69[2] = v20;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 3);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = -[FCShortcut initWithIdentifier:dictionaryRepresentation:]([FCShortcut alloc], v9, v28);
              v30 = *(_QWORD *)(v58 + 48);
              if (v30)
                v31 = *(void **)(v30 + 96);
              else
                v31 = 0;
              objc_msgSend(v31, "setObject:forKey:", v29, v9);
              objc_msgSend(*(id *)(v58 + 40), "setObject:forKey:", v28, v9);
              objc_msgSend(*(id *)(v58 + 56), "addObject:", v29);
              v32 = FCShortcutListLog;
              if (os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v71 = (const char *)v9;
                _os_log_impl(&dword_1A1B90000, v32, OS_LOG_TYPE_DEFAULT, "Adding favorite when handling sync <%{public}@>", buf, 0xCu);
              }

              v21 = v57;
              v5 = CFSTR("dateAdded");
              v11 = v27;
              v14 = 0;
            }
            goto LABEL_14;
          }
        }
        else if (v20)
        {
          goto LABEL_25;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v38 = v11;
          v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a shortcut list shortcut without a type"));
          *(_DWORD *)buf = v53;
          v71 = "-[FCShortcutList handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
          v72 = 2080;
          v73 = "FCShortcutList.m";
          v74 = 1024;
          v75 = 357;
          v76 = 2114;
          v77 = v39;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          v11 = v38;
        }
LABEL_14:

        ++v6;
        v1 = v58;
      }
      while (v21 != v6);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
      v4 = v40;
    }
    while (v40);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v41 = *(id *)(v1 + 72);
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v60;
    do
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v60 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v45);
        objc_msgSend(*(id *)(v1 + 40), "objectForKey:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47)
        {
          v48 = -[FCShortcut initWithIdentifier:dictionaryRepresentation:]([FCShortcut alloc], v46, v47);
          v49 = *(_QWORD *)(v1 + 48);
          if (v49)
            v50 = *(void **)(v49 + 96);
          else
            v50 = 0;
          objc_msgSend(v50, "removeObjectForKey:", v46);
          objc_msgSend(*(id *)(v1 + 40), "removeObjectForKey:", v46);
          objc_msgSend(*(id *)(v1 + 80), "addObject:", v48);
          v51 = FCShortcutListLog;
          if (os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v71 = (const char *)v46;
            _os_log_impl(&dword_1A1B90000, v51, OS_LOG_TYPE_DEFAULT, "Removing favorite when handling sync <%{public}@>", buf, 0xCu);
          }

        }
        ++v45;
      }
      while (v43 != v45);
      v52 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      v43 = v52;
    }
    while (v52);
  }

}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  NSMutableDictionary *shortcutsByID;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3);
  if (self)
    shortcutsByID = self->_shortcutsByID;
  else
    shortcutsByID = 0;
  -[NSMutableDictionary allValues](shortcutsByID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_41);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __60__FCShortcutList_allKnownRecordNamesWithinRecordZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __40__FCShortcutList__moveShortcut_toIndex___block_invoke(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  id v5;

  v1 = (_QWORD *)a1[4];
  if (v1)
    v1 = (_QWORD *)v1[12];
  v2 = a1[5];
  v3 = (void *)a1[6];
  v4 = v1;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v2, v5);

}

uint64_t __35__FCShortcutList__orderedShortcuts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "order");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "order");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_shortcutsByID, 0);
}

@end
