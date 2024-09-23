@implementation FCSubscriptionList

uint64_t __59__FCSubscriptionList_assignOrderToTagSubscriptionsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asReorderableTagSubscription");
}

- (void)_regenerateSortedSubscriptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  SEL v21;
  SEL v22;
  SEL v23;
  SEL v24;
  SEL v25;
  id v26;
  id *self;
  id newValue;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)objc_opt_new();
    v3 = (void *)objc_opt_new();
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_opt_new();
    newValue = (id)objc_opt_new();
    self = a1;
    v6 = a1[19];
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v6;
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          switch(objc_msgSend(v12, "subscriptionType"))
          {
            case 0:
              objc_msgSend(v12, "tagID");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v2;
              goto LABEL_15;
            case 1:
              if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                continue;
              v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("pending subscriptions are deprecated and should be filtered when loading from the cache"));
              *(_DWORD *)buf = 136315906;
              v36 = "-[FCSubscriptionList _regenerateSortedSubscriptions]";
              v37 = 2080;
              v38 = "FCSubscriptionList.m";
              v39 = 1024;
              v40 = 1270;
              v41 = 2114;
              v42 = v13;
              _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
              goto LABEL_16;
            case 2:
              objc_msgSend(v12, "tagID");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v3;
              goto LABEL_15;
            case 3:
              objc_msgSend(v12, "tagID");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v4;
              goto LABEL_15;
            case 4:
              objc_msgSend(v12, "tagID");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v5;
              goto LABEL_15;
            case 5:
              objc_msgSend(v12, "tagID");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = newValue;
LABEL_15:
              objc_msgSend(v14, "addObject:", v13);
LABEL_16:

              break;
            default:
              continue;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v9);
    }

    v15 = FCSubscriptionListLog;
    if (os_log_type_enabled((os_log_t)FCSubscriptionListLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v36 = (const char *)v2;
      v37 = 2112;
      v38 = (char *)v3;
      _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "subscribedTagIDs: %@ mutedTagIDs: %@", buf, 0x16u);
    }
    objc_setProperty_nonatomic_copy(self, v16, v2, 112);
    objc_msgSend(v2, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __52__FCSubscriptionList__regenerateSortedSubscriptions__block_invoke;
    v29[3] = &unk_1E46432A8;
    v30 = v26;
    v18 = v26;
    objc_msgSend(v17, "sortedArrayUsingComparator:", v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(self, v21, v20, 104);

    objc_setProperty_nonatomic_copy(self, v22, v3, 120);
    objc_setProperty_nonatomic_copy(self, v23, v4, 128);
    objc_setProperty_nonatomic_copy(self, v24, v5, 136);
    objc_setProperty_nonatomic_copy(self, v25, newValue, 144);

  }
}

uint64_t __46__FCSubscriptionList__reconcileSubscriptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagID");
}

void __48__FCSubscriptionList_subscriptionForTagID_type___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[19];
  v3 = a1[5];
  v7 = v2;
  objc_msgSend(v7, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __33__FCSubscriptionList_mutedTagIDs__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 120);
  else
    v2 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __51__FCSubscriptionList_subscriptionsBySubscriptionID__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[19];
  v6 = v2;
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __38__FCSubscriptionList_subscribedTagIDs__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 112);
  else
    v2 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __40__FCSubscriptionList_autoFavoriteTagIDs__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 128);
  else
    v2 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __35__FCSubscriptionList_ignoredTagIDs__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 144);
  else
    v2 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __45__FCSubscriptionList_orderedSubscribedTagIDs__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 104);
  else
    v2 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __46__FCSubscriptionList_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  -[FCSubscriptionList setMutableSubscriptionsBySubscriptionID:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  -[FCSubscriptionList _regenerateSortedSubscriptions](*(id **)(a1 + 32));
}

- (void)setMutableSubscriptionsBySubscriptionID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 152), a2);
}

void __37__FCSubscriptionList_groupableTagIDs__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 136);
  else
    v2 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 1;
}

+ (unint64_t)localStoreVersion
{
  return 8;
}

+ (id)localStoreFilename
{
  return CFSTR("subscriptions");
}

+ (void)configureKeyValueStoreForJSONHandling:(id)a3
{
  objc_msgSend(a3, "setJSONEncodingHandlersWithObjectHandler:arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:", 0, 0, 0, &__block_literal_global_84);
}

+ (id)commandStoreFileName
{
  return CFSTR("subscriptions-commands");
}

+ (int64_t)commandQueueUrgency
{
  return 1;
}

- (NSSet)subscribedTagIDs
{
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__40;
  v12 = __Block_byref_object_dispose__40;
  v13 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v4 = itemsLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__FCSubscriptionList_subscribedTagIDs__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[FCMTWriterLock performReadSync:](v4, "performReadSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (id)subscriptionForTagID:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__40;
  v20 = __Block_byref_object_dispose__40;
  v21 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v9 = itemsLock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__FCSubscriptionList_subscriptionForTagID_type___block_invoke;
  v13[3] = &unk_1E463AD58;
  v15 = &v16;
  v13[4] = self;
  v10 = v7;
  v14 = v10;
  -[FCMTWriterLock performReadSync:](v9, "performReadSync:", v13);

  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

+ (id)subscriptionIDForTagID:(id)a3 type:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  __CFString **v8;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  switch(a4)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), CFSTR("tag"), v5, CFSTR("subscription"));
      goto LABEL_11;
    case 2uLL:
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = FCCKSubscriptionTypeMutedTag;
      goto LABEL_10;
    case 3uLL:
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = FCCKSubscriptionTypeAutoFavoriteTag;
      goto LABEL_10;
    case 4uLL:
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = FCCKSubscriptionTypeGroupableTag;
      goto LABEL_10;
    case 5uLL:
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = FCCKSubscriptionTypeIgnoredTag;
LABEL_10:
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), *v8, v5, v11);
LABEL_11:
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unsupported Tag Type"));
        *(_DWORD *)buf = 136315906;
        v13 = "+[FCSubscriptionList subscriptionIDForTagID:type:]";
        v14 = 2080;
        v15 = "FCSubscriptionList.m";
        v16 = 1024;
        v17 = 391;
        v18 = 2114;
        v19 = v10;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      v6 = 0;
      break;
  }

  return v6;
}

- (BOOL)hasMutedSubscriptionForTagID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[FCSubscriptionList mutedTagIDs](self, "mutedTagIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSSet)mutedTagIDs
{
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__40;
  v12 = __Block_byref_object_dispose__40;
  v13 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v4 = itemsLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__FCSubscriptionList_mutedTagIDs__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[FCMTWriterLock performReadSync:](v4, "performReadSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (void)loadLocalCachesFromStore
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  FCMTWriterLock *itemsLock;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPrivateDataController localStore](self, "localStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_opt_class(), "isLocalStoreKeyInternal:", v9) & 1) == 0)
        {
          v10 = v9;
          objc_opt_class();
          objc_msgSend(v3, "objectForKey:", v10);
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

          if (v13
            && (objc_msgSend(v13, "allKeys"),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v15 = objc_msgSend(v14, "count"),
                v14,
                v15))
          {
            +[FCSubscription subscriptionWithSubscriptionID:dictionaryRepresentation:](FCSubscription, "subscriptionWithSubscriptionID:dictionaryRepresentation:", v10, v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16 && v10 && (objc_msgSend(v16, "isDeprecated") & 1) == 0)
              objc_msgSend(v26, "setObject:forKey:", v17, v10);

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
              *(_DWORD *)buf = 138543618;
              v34 = v21;
              v35 = 2114;
              v36 = v10;
              _os_log_error_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_ERROR, "ERROR: %{public}@ is not a valid dictionary for key %{public}@", buf, 0x16u);

            }
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v6);
  }

  objc_msgSend(v26, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCSubscriptionList _reconcileSubscriptions:]((uint64_t)self, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __46__FCSubscriptionList_loadLocalCachesFromStore__block_invoke;
  v27[3] = &unk_1E463AD10;
  v27[4] = self;
  v28 = v23;
  v25 = v23;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v27);

}

- (id)_reconcileSubscriptions:(uint64_t)a1
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  if (!a1)
    return 0;
  objc_msgSend(a2, "fc_dictionaryOfSortedObjectsWithKeyBlock:", &__block_literal_global_79_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__FCSubscriptionList__reconcileSubscriptions___block_invoke_2;
  v6[3] = &unk_1E4643580;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v6);

  return v4;
}

- (void)addObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCSubscriptionList;
  -[FCPrivateDataController addObserver:](&v3, sel_addObserver_, a3);
}

- (NSOrderedSet)orderedSubscribedTagIDs
{
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__40;
  v12 = __Block_byref_object_dispose__40;
  v13 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v4 = itemsLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__FCSubscriptionList_orderedSubscribedTagIDs__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[FCMTWriterLock performReadSync:](v4, "performReadSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSOrderedSet *)v5;
}

void __46__FCSubscriptionList__reconcileSubscriptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "sortedArrayUsingSelector:", sel_comparePriority_);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "subscriptionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

}

- (void)setSubscribedTagRanker:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedTagRanker, a3);
}

- (FCSubscriptionList)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  FCSubscriptionList *v5;
  FCMTWriterLock *v6;
  FCMTWriterLock *itemsLock;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FCSubscriptionList;
  v5 = -[FCPrivateDataController initWithContext:pushNotificationCenter:storeDirectory:](&v9, sel_initWithContext_pushNotificationCenter_storeDirectory_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(FCMTWriterLock);
    itemsLock = v5->_itemsLock;
    v5->_itemsLock = v6;

  }
  return v5;
}

- (void)assignOrderToTagSubscriptionsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  FCSubscriptionList *v19;
  _BYTE buf[24];
  __int128 v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[FCSubscriptionList subscriptionsBySubscriptionID](self, "subscriptionsBySubscriptionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_95);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCSubscriptionList subscribedTagRanker](self, "subscribedTagRanker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = MEMORY[0x1E0C809B0];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __59__FCSubscriptionList_assignOrderToTagSubscriptionsIfNeeded__block_invoke_2;
    v18 = &unk_1E4640710;
    v19 = self;
    v8 = v5;
    v9 = &v15;
    if (self)
    {
      if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v12 = objc_alloc(MEMORY[0x1E0CB3940]);
        v13 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagSubscriptions", v15, v16, v17, v18, v19);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[FCSubscriptionList _assignOrderToTagSubscriptions:withCompletion:]";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "FCSubscriptionList.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v21) = 930;
        WORD2(v21) = 2114;
        *(_QWORD *)((char *)&v21 + 6) = v13;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      -[FCSubscriptionList subscribedTagRanker](self, "subscribedTagRanker");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "tagRanker");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[FCSubscriptionList _assignOrderToTagSubscriptions:withCompletion:]";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "FCSubscriptionList.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v21) = 934;
        WORD2(v21) = 2114;
        *(_QWORD *)((char *)&v21 + 6) = v14;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      *(_QWORD *)buf = v7;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __68__FCSubscriptionList__assignOrderToTagSubscriptions_withCompletion___block_invoke;
      *(_QWORD *)&v21 = &unk_1E463CCB8;
      *((_QWORD *)&v21 + 1) = v10;
      v22 = v8;
      v23 = v9;
      v11 = v10;
      +[FCTaskScheduler scheduleLowPriorityBlock:](FCTaskScheduler, "scheduleLowPriorityBlock:", buf);

    }
  }

}

- (FCTagRanking)subscribedTagRanker
{
  return self->_subscribedTagRanker;
}

- (NSDictionary)subscriptionsBySubscriptionID
{
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__40;
  v12 = __Block_byref_object_dispose__40;
  v13 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v4 = itemsLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__FCSubscriptionList_subscriptionsBySubscriptionID__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[FCMTWriterLock performReadSync:](v4, "performReadSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v5;
}

- (NSSet)ignoredTagIDs
{
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__40;
  v12 = __Block_byref_object_dispose__40;
  v13 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v4 = itemsLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__FCSubscriptionList_ignoredTagIDs__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[FCMTWriterLock performReadSync:](v4, "performReadSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (id)subscriptionsForType:(unint64_t)a3
{
  void *v3;
  id result;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0uLL:
      -[FCSubscriptionList subscribedTagIDs](self, "subscribedTagIDs");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2uLL:
      -[FCSubscriptionList mutedTagIDs](self, "mutedTagIDs");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3uLL:
      -[FCSubscriptionList autoFavoriteTagIDs](self, "autoFavoriteTagIDs");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4uLL:
      -[FCSubscriptionList groupableTagIDs](self, "groupableTagIDs");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5uLL:
      -[FCSubscriptionList ignoredTagIDs](self, "ignoredTagIDs");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      result = v3;
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unsupported Tag Type"));
        v6 = 136315906;
        v7 = "-[FCSubscriptionList subscriptionsForType:]";
        v8 = 2080;
        v9 = "FCSubscriptionList.m";
        v10 = 1024;
        v11 = 660;
        v12 = 2114;
        v13 = v5;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

      }
      result = 0;
      break;
  }
  return result;
}

- (NSSet)autoFavoriteTagIDs
{
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__40;
  v12 = __Block_byref_object_dispose__40;
  v13 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v4 = itemsLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__FCSubscriptionList_autoFavoriteTagIDs__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[FCMTWriterLock performReadSync:](v4, "performReadSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (NSSet)groupableTagIDs
{
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__40;
  v12 = __Block_byref_object_dispose__40;
  v13 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v4 = itemsLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__FCSubscriptionList_groupableTagIDs__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[FCMTWriterLock performReadSync:](v4, "performReadSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

void __68__FCSubscriptionList__assignOrderToTagSubscriptions_withCompletion___block_invoke_2(void **a1)
{
  id *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = -[FCTagSubscriptionSorter initWithTagRanker:]((id *)[FCTagSubscriptionSorter alloc], a1[4]);
  -[FCTagSubscriptionSorter sortTagSubscriptions:]((uint64_t)v2, a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FCTagSubscriptionOrderAssigner initWithInitialOrder:orderSpacing:]([FCTagSubscriptionOrderAssigner alloc], 0, 1000000000000000);
  -[FCTagSubscriptionOrderAssigner assignOrderToTagSubscriptions:](v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__FCSubscriptionList__assignOrderToTagSubscriptions_withCompletion___block_invoke_3;
  v8[3] = &unk_1E463B2D0;
  v6 = a1[6];
  v9 = v5;
  v10 = v6;
  v7 = v5;
  FCPerformBlockOnMainThread(v8);

}

void __68__FCSubscriptionList__assignOrderToTagSubscriptions_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__FCSubscriptionList__assignOrderToTagSubscriptions_withCompletion___block_invoke_2;
  v3[3] = &unk_1E463CCB8;
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "prepareForUseWithCompletionHandler:", v3);

}

void __59__FCSubscriptionList_assignOrderToTagSubscriptionsIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;

  v3 = *(id **)(a1 + 32);
  v4 = a2;
  -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:](v3, 0, v4, 0);
  -[FCSubscriptionList _modifyRemoteSubscriptions:](*(void **)(a1 + 32), v4);

}

- (void)_localAddSubscriptions:(void *)a3 changeSubscriptions:(void *)a4 removeSubscriptions:
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  unsigned int (**v23)(void *, _QWORD);
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id *v66;
  void *v67;
  id obj;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[5];
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD aBlock[5];
  id v92;
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  _QWORD v99[4];
  id v100;
  id v101;
  _BYTE v102[128];
  uint8_t v103[128];
  uint8_t buf[4];
  const char *v105;
  __int16 v106;
  char *v107;
  __int16 v108;
  int v109;
  __int16 v110;
  void *v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    v72 = (void *)objc_opt_new();
    v71 = (void *)objc_opt_new();
    v69 = (void *)objc_opt_new();
    if (v9)
      v10 = v9;
    else
      v10 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v10);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "localStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(a1[19], "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v7);
    objc_msgSend(v13, "addObjectsFromArray:", v8);
    objc_msgSend(v13, "fc_setByTransformingWithBlock:", &__block_literal_global_66);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = MEMORY[0x1E0C809B0];
    v99[1] = 3221225472;
    v99[2] = __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_2;
    v99[3] = &unk_1E46450C8;
    v15 = v14;
    v100 = v15;
    v16 = v13;
    v101 = v16;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v99);
    v62 = v16;
    -[FCSubscriptionList _reconcileSubscriptions:]((uint64_t)a1, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v9;
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "fc_setByTransformingWithBlock:", &__block_literal_global_68);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = MEMORY[0x1E0C809B0];
    v95[0] = MEMORY[0x1E0C809B0];
    v95[1] = 3221225472;
    v95[2] = __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_4;
    v95[3] = &unk_1E46450F0;
    v61 = v15;
    v96 = v61;
    v21 = v17;
    v97 = v21;
    v59 = v19;
    v98 = v59;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v95);
    aBlock[0] = v20;
    aBlock[1] = 3221225472;
    aBlock[2] = __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_5;
    aBlock[3] = &unk_1E4645118;
    aBlock[4] = a1;
    v60 = v21;
    v92 = v60;
    v70 = v11;
    v93 = v70;
    v22 = v12;
    v94 = v22;
    v23 = (unsigned int (**)(void *, _QWORD))_Block_copy(aBlock);
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v65 = v7;
    v24 = v7;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v87, v113, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v88 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i);
          if (v23[2](v23, v29))
            objc_msgSend(v72, "addObject:", v29);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v87, v113, 16);
      }
      while (v26);
    }
    v66 = a1;

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v64 = v8;
    obj = v8;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v112, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v84 != v32)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
          objc_msgSend(v34, "subscriptionID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "existingSubscription");
            *(_DWORD *)buf = 136315906;
            v105 = "-[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]";
            v106 = 2080;
            v107 = "FCSubscriptionList.m";
            v108 = 1024;
            v109 = 1187;
            v110 = 2114;
            v111 = v41;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          v37 = (void *)MEMORY[0x1E0DE7910];
          objc_msgSend(v36, "order");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "order");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v37, "nf_object:isEqualToObject:", v38, v39);

          if (((unsigned int (**)(void *, void *))v23)[2](v23, v34))
          {
            objc_msgSend(v71, "addObject:", v34);
            if ((v40 & 1) == 0)
              objc_msgSend(v69, "addObject:", v34);
          }

        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v112, 16);
      }
      while (v31);
    }

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v42 = v59;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v79, v103, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v80;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v80 != v45)
            objc_enumerationMutation(v42);
          v47 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * k);
          objc_msgSend(v22, "objectForKeyedSubscript:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48)
            objc_msgSend(v67, "addObject:", v48);
          objc_msgSend(v70, "removeObjectForKey:", v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v79, v103, 16);
      }
      while (v44);
    }

    if (objc_msgSend(v42, "count"))
    {
      objc_msgSend(v42, "allObjects");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeObjectsForKeys:", v49);

    }
    v50 = v66[20];
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_71;
    v77[3] = &unk_1E463AD10;
    v77[4] = v66;
    v51 = v22;
    v78 = v51;
    objc_msgSend(v50, "performWriteSync:", v77);
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    objc_msgSend(v66, "observers");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v52, "copy");

    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v73, v102, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v74;
      do
      {
        for (m = 0; m != v55; ++m)
        {
          if (*(_QWORD *)v74 != v56)
            objc_enumerationMutation(v53);
          v58 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * m);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v58, "subscriptionList:didAddSubscriptions:changeSubscriptions:moveSubscriptions:removeSubscriptions:", v66, v72, v71, v69, v67);
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v73, v102, 16);
      }
      while (v55);
    }

    v8 = v64;
    v7 = v65;
    v9 = v63;
  }

}

- (void)_modifyRemoteSubscriptions:(void *)a1
{
  FCModifySubscriptionsCommand *v3;
  id v4;

  v4 = a2;
  if (a1 && objc_msgSend(v4, "count"))
  {
    v3 = -[FCModifySubscriptionsCommand initWithSubscriptions:merge:]([FCModifySubscriptionsCommand alloc], "initWithSubscriptions:merge:", v4, 0);
    objc_msgSend(a1, "addCommandToCommandQueue:", v3);

  }
}

- (void)removeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCSubscriptionList;
  -[FCPrivateDataController removeObserver:](&v3, sel_removeObserver_, a3);
}

+ (id)desiredKeys
{
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("subscriptionType");
  v3[1] = CFSTR("subscriptionOrder");
  v3[2] = CFSTR("subscriptionOrigin");
  v3[3] = CFSTR("dateAdded");
  v3[4] = CFSTR("tagID");
  v3[5] = CFSTR("groupID");
  v3[6] = CFSTR("url");
  v3[7] = CFSTR("title");
  v3[8] = CFSTR("pollingURL");
  v3[9] = CFSTR("notificationsEnabled");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSMutableDictionary *mutableSubscriptionsBySubscriptionID;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t j;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id obj;
  void *v89;
  FCSubscriptionList *v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  uint8_t v115[128];
  uint8_t buf[4];
  const char *v117;
  __int16 v118;
  char *v119;
  __int16 v120;
  int v121;
  __int16 v122;
  void *v123;
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v83 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  -[FCPrivateDataController observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v108, v115, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v109;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v109 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "subscriptionListWillStartSyncingRemoteChanges:", self);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v108, v115, 16);
    }
    while (v10);
  }

  v87 = (void *)objc_opt_new();
  v86 = (void *)objc_opt_new();
  v89 = (void *)objc_opt_new();
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  obj = v6;
  v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
  if (v92)
  {
    v91 = *(_QWORD *)v105;
    v90 = self;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v105 != v91)
          objc_enumerationMutation(obj);
        v15 = *(id *)(*((_QWORD *)&v104 + 1) + 8 * v14);
        v16 = v15;
        if (!self)
        {
          v40 = 0;
LABEL_59:

          goto LABEL_61;
        }
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("subscriptionType"));
        v17 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("subscriptionOrder"));
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("subscriptionOrigin"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = FCSubscriptionOriginFromFCCKSubscriptionOrigin(objc_msgSend(v19, "unsignedIntegerValue"));
        objc_msgSend(v16, "recordID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "recordName");
        v22 = objc_claimAutoreleasedReturnValue();

        if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("missing subscription type from record: %@"), v16);
          *(_DWORD *)buf = 136315906;
          v117 = "-[FCSubscriptionList _subscriptionFromRecord:]";
          v118 = 2080;
          v119 = "FCSubscriptionList.m";
          v120 = 1024;
          v121 = 985;
          v122 = 2114;
          v123 = v56;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("dateAdded"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v94 = v19;
        v95 = (void *)v18;
        v25 = (void *)v22;
        if (v23)
        {
          v26 = v23;
        }
        else
        {
          objc_msgSend(v16, "creationDate");
          v26 = (id)objc_claimAutoreleasedReturnValue();
        }
        v93 = v26;

        objc_msgSend(v16, "recordID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "zoneID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "zoneName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("SensitiveSubscriptions"));

        if (objc_msgSend(v17, "isEqualToString:", CFSTR("tag")))
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("tagID"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "length");

          if (v32)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("tagID"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("notificationsEnabled"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = v30;
            LOBYTE(v79) = objc_msgSend(v34, "BOOLValue");
            v35 = v93;
            v36 = v25;
            v37 = v95;
            +[FCSubscription subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:](FCSubscription, "subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:", v25, v33, 0, v95, v20, 0, v93, v79, v80);
LABEL_28:
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_39;
          }
        }
        else if (objc_msgSend(v17, "isEqualToString:", CFSTR("mutedTag")))
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("tagID"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "length");

          if (v39)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("tagID"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("groupID"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = v30;
            LOBYTE(v79) = 0;
            v35 = v93;
            v36 = v25;
            v37 = v95;
            +[FCSubscription subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:](FCSubscription, "subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:", v25, v33, 2, v95, v20, v34, v93, v79, v81);
            goto LABEL_28;
          }
        }
        else if (objc_msgSend(v17, "isEqualToString:", CFSTR("autoFavoriteTag")))
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("tagID"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "length");

          if (v42)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("tagID"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = v30;
            LOBYTE(v79) = 0;
            v35 = v93;
            v78 = v93;
            v36 = v25;
            v43 = v25;
            v44 = v33;
            v45 = 3;
            goto LABEL_38;
          }
        }
        else if (objc_msgSend(v17, "isEqualToString:", CFSTR("groupableTag")))
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("tagID"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "length");

          if (v47)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("tagID"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = v30;
            LOBYTE(v79) = 0;
            v35 = v93;
            v78 = v93;
            v36 = v25;
            v43 = v25;
            v44 = v33;
            v45 = 4;
            goto LABEL_38;
          }
        }
        else if (objc_msgSend(v17, "isEqualToString:", CFSTR("ignoredTag")))
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("tagID"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "length");

          if (v49)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("tagID"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = v30;
            LOBYTE(v79) = 0;
            v35 = v93;
            v78 = v93;
            v36 = v25;
            v43 = v25;
            v44 = v33;
            v45 = 5;
LABEL_38:
            v37 = v95;
            +[FCSubscription subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:](FCSubscription, "subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:", v43, v44, v45, v95, v20, 0, v78, v79, v82);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:

LABEL_40:
            v50 = v94;
            goto LABEL_53;
          }
        }
        else
        {
          if (!objc_msgSend(v17, "isEqualToString:", CFSTR("pending")))
          {
            v57 = FCSubscriptionListLog;
            v36 = v25;
            if (os_log_type_enabled((os_log_t)FCSubscriptionListLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v117 = v17;
              v118 = 2112;
              v119 = (char *)v16;
              _os_log_impl(&dword_1A1B90000, v57, OS_LOG_TYPE_DEFAULT, "ignoring unrecognized subscription type '%{public}@' from record: %@", buf, 0x16u);
            }
            v40 = 0;
            v50 = v94;
            v37 = v95;
            goto LABEL_52;
          }
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("pollingURL"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("url"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v51, "length") && objc_msgSend(v52, "length"))
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v51);
            v85 = v51;
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v52);
            v84 = v52;
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("title"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v25;
            v35 = v93;
            +[FCSubscription pendingSubscriptionWithSubscriptionID:url:title:pollingURL:dateAdded:](FCSubscription, "pendingSubscriptionWithSubscriptionID:url:title:pollingURL:dateAdded:", v25, v54, v55, v53, v93);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            v37 = v95;
            goto LABEL_40;
          }

        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("subscription record is missing metadata: %@"), v16);
          *(_DWORD *)buf = 136315906;
          v117 = "-[FCSubscriptionList _subscriptionFromRecord:]";
          v118 = 2080;
          v119 = "FCSubscriptionList.m";
          v120 = 1024;
          v121 = 1096;
          v122 = 2114;
          v123 = v61;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        v40 = 0;
        v50 = v94;
        v37 = v95;
        v36 = v25;
LABEL_52:
        v35 = v93;
LABEL_53:

        if (v40)
        {
          self = v90;
          if ((objc_msgSend(v40, "isDeprecated") & 1) != 0)
            goto LABEL_61;
          objc_msgSend(v16, "recordID");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "recordName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKey:](v90->_mutableSubscriptionsBySubscriptionID, "objectForKey:", v16);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (v59)
            v60 = v86;
          else
            v60 = v87;
          objc_msgSend(v60, "addObject:", v40);

          goto LABEL_59;
        }
        self = v90;
LABEL_61:

        ++v14;
      }
      while (v92 != v14);
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
      v92 = v62;
    }
    while (v62);
  }

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v63 = v83;
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v101;
    do
    {
      v67 = 0;
      do
      {
        if (*(_QWORD *)v101 != v66)
          objc_enumerationMutation(v63);
        if (self)
          mutableSubscriptionsBySubscriptionID = self->_mutableSubscriptionsBySubscriptionID;
        else
          mutableSubscriptionsBySubscriptionID = 0;
        -[NSMutableDictionary objectForKey:](mutableSubscriptionsBySubscriptionID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * v67));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (v69)
          objc_msgSend(v89, "addObject:", v69);

        ++v67;
      }
      while (v65 != v67);
      v70 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
      v65 = v70;
    }
    while (v70);
  }

  -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, v87, v86, v89);
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[FCPrivateDataController observers](self, "observers");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v71, "copy");

  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v97;
    do
    {
      for (j = 0; j != v74; ++j)
      {
        if (*(_QWORD *)v97 != v75)
          objc_enumerationMutation(v72);
        v77 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v77, "subscriptionListDidStopSyncingRemoteChanges:", self);
      }
      v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
    }
    while (v74);
  }

}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  NSMutableDictionary *mutableSubscriptionsBySubscriptionID;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  objc_msgSend(v5, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Subscriptions"));
  if (self)
    mutableSubscriptionsBySubscriptionID = self->_mutableSubscriptionsBySubscriptionID;
  else
    mutableSubscriptionsBySubscriptionID = 0;
  -[NSMutableDictionary allValues](mutableSubscriptionsBySubscriptionID, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__FCSubscriptionList_allKnownRecordNamesWithinRecordZoneWithID___block_invoke;
  v12[3] = &__block_descriptor_40_e34___NSString_16__0__FCSubscription_8l;
  v12[4] = v7 ^ 1u;
  objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __64__FCSubscriptionList_allKnownRecordNamesWithinRecordZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(v3, "zone") == *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "subscriptionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)handleSyncDidResetLocalDataForRecordZoneWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Subscriptions")) & 1) == 0)
  {
LABEL_12:

    goto LABEL_13;
  }
  -[FCSubscriptionList allKnownRecordNamesWithinRecordZoneWithID:](self, "allKnownRecordNamesWithinRecordZoneWithID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[FCPrivateDataController observers](self, "observers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v8, "copy");

    v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v5);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "subscriptionListDidResetToEmpty:", self);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
    goto LABEL_12;
  }
LABEL_13:

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
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C95098]);
  v3 = *MEMORY[0x1E0C94730];
  v4 = (void *)objc_msgSend(v2, "initWithZoneName:ownerName:", CFSTR("Subscriptions"), *MEMORY[0x1E0C94730]);
  v8[0] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", CFSTR("SensitiveSubscriptions"), v3);
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  FCModifySubscriptionsCommand *v22;
  void *v23;
  __int128 v25;
  NSObject *log;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  FCModifySubscriptionsCommand *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v29;
    *(_QWORD *)&v8 = 138543618;
    v25 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v11);
        if ((objc_msgSend(a1, "isLocalStoreKeyInternal:", v12, v25) & 1) == 0)
        {
          objc_opt_class();
          objc_msgSend(v5, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v14 = v13;
            else
              v14 = 0;
          }
          else
          {
            v14 = 0;
          }
          v15 = v14;

          if (v15)
          {
            +[FCSubscription subscriptionWithSubscriptionID:dictionaryRepresentation:](FCSubscription, "subscriptionWithSubscriptionID:dictionaryRepresentation:", v12, v15);
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16 && (-[NSObject isDeprecated](v16, "isDeprecated") & 1) == 0)
              objc_msgSend(v27, "addObject:", v17);
LABEL_16:

          }
          else
          {
            v18 = (void *)FCDefaultLog;
            if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
            {
              log = v18;
              v19 = (objc_class *)objc_opt_class();
              NSStringFromClass(v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v25;
              v34 = v20;
              v35 = 2114;
              v36 = v12;
              v17 = log;
              _os_log_error_impl(&dword_1A1B90000, log, OS_LOG_TYPE_ERROR, "ERROR: %{public}@ is not a dictionary for key %{public}@", buf, 0x16u);

              goto LABEL_16;
            }
          }

        }
        ++v11;
      }
      while (v9 != v11);
      v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      v9 = v21;
    }
    while (v21);
  }

  v22 = -[FCModifySubscriptionsCommand initWithSubscriptions:merge:]([FCModifySubscriptionsCommand alloc], "initWithSubscriptions:merge:", v27, 1);
  v32 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Subscriptions")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SensitiveSubscriptions"));

  return v4;
}

- (id)recordsForRestoringZoneName:(id)a3
{
  id v4;
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v6;
  FCMTWriterLock *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__40;
  v16 = __Block_byref_object_dispose__40;
  v17 = 0;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Subscriptions")))
  {
    if (self)
      itemsLock = self->_itemsLock;
    else
      itemsLock = 0;
    v6 = itemsLock;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__FCSubscriptionList_recordsForRestoringZoneName___block_invoke;
    v11[3] = &unk_1E463AD80;
    v11[4] = self;
    v11[5] = &v12;
    -[FCMTWriterLock performReadSync:](v6, "performReadSync:", v11);
LABEL_9:

    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SensitiveSubscriptions")))
  {
    if (self)
      v7 = self->_itemsLock;
    else
      v7 = 0;
    v6 = v7;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__FCSubscriptionList_recordsForRestoringZoneName___block_invoke_3;
    v10[3] = &unk_1E463AD80;
    v10[4] = self;
    v10[5] = &v12;
    -[FCMTWriterLock performReadSync:](v6, "performReadSync:", v10);
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend((id)v13[5], "fc_arrayByTransformingWithBlock:", &__block_literal_global_29_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __50__FCSubscriptionList_recordsForRestoringZoneName___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[19];
  v3 = v2;
  objc_msgSend(v3, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_26_1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

BOOL __50__FCSubscriptionList_recordsForRestoringZoneName___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zone") == 0;
}

void __50__FCSubscriptionList_recordsForRestoringZoneName___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[19];
  v3 = v2;
  objc_msgSend(v3, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_27_2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

BOOL __50__FCSubscriptionList_recordsForRestoringZoneName___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zone") == 1;
}

uint64_t __50__FCSubscriptionList_recordsForRestoringZoneName___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

void __116__FCSubscriptionList_addSubscriptionsForTagIDs_typeProvider_originProvider_groupID_notificationsEnabled_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", v17, (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 152);
  else
    v5 = 0;
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v17);
  }
  else
  {
    v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v8 = -[FCSubscriptionList _newSubscriptionOrder](*(void **)(a1 + 32));
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v14 = (unint64_t)(v7 - 3) < 3 && *(_QWORD *)(a1 + 32) != 0;
    LOBYTE(v16) = *(_BYTE *)(a1 + 80);
    +[FCSubscription subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:](FCSubscription, "subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:", v3, v17, v7, v8, v9, v10, v11, v16, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);
  }

}

- (void)_newSubscriptionOrder
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if (result)
  {
    v1 = result;
    v2 = -1000000000000000;
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(result, "orderedSubscribedTagIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", v5, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        objc_msgSend(v1, "subscriptionsBySubscriptionID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "order");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "longLongValue");

        v2 = v11 - 1000000000000000;
      }
    }

    objc_msgSend(v3, "numberWithLongLong:", v2);
    return (void *)objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (BOOL)addSubscriptionForTagID:(id)a3 type:(unint64_t)a4 origin:(unint64_t)a5 groupID:(id)a6 notificationsEnabled:(BOOL)a7
{
  id v12;
  id v13;
  void *v14;
  NSMutableDictionary *mutableSubscriptionsBySubscriptionID;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  BOOL v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
    *(_DWORD *)buf = 136315906;
    v32 = "-[FCSubscriptionList addSubscriptionForTagID:type:origin:groupID:notificationsEnabled:]";
    v33 = 2080;
    v34 = "FCSubscriptionList.m";
    v35 = 1024;
    v36 = 450;
    v37 = 2114;
    v38 = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", v12, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    mutableSubscriptionsBySubscriptionID = self->_mutableSubscriptionsBySubscriptionID;
  else
    mutableSubscriptionsBySubscriptionID = 0;
  -[NSMutableDictionary objectForKey:](mutableSubscriptionsBySubscriptionID, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = -[FCSubscriptionList _newSubscriptionOrder](self);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = a5;
    v20 = (void *)v18;
    if (self)
      v21 = a4 - 3 >= 3;
    else
      v21 = 1;
    v22 = !v21;
    LOBYTE(v28) = a7;
    +[FCSubscription subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:](FCSubscription, "subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:", v14, v12, a4, v17, v19, v13, v18, v28, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, v24, 0, 0);

    v29 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCSubscriptionList _modifyRemoteSubscriptions:](self, v25);

  }
  return v16 == 0;
}

- (BOOL)addSubscriptionForTagID:(id)a3 type:(unint64_t)a4 origin:(unint64_t)a5 groupID:(id)a6
{
  return -[FCSubscriptionList addSubscriptionForTagID:type:origin:groupID:notificationsEnabled:](self, "addSubscriptionForTagID:type:origin:groupID:notificationsEnabled:", a3, a4, a5, 0, 0);
}

- (void)addSubscriptionsForTagIDs:(id)a3 typeProvider:(id)a4 originProvider:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id);
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _BYTE buf[24];
  __int128 v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, id))a6;
  if (self)
  {
    v13 = a3;
    v14 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagIDs != nil");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCSubscriptionList addSubscriptionsForTagIDs:typeProvider:originProvider:groupID:notificati"
                           "onsEnabled:completion:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCSubscriptionList.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v20) = 406;
      WORD2(v20) = 2114;
      *(_QWORD *)((char *)&v20 + 6) = v18;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v15 = (void *)objc_opt_new();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __116__FCSubscriptionList_addSubscriptionsForTagIDs_typeProvider_originProvider_groupID_notificationsEnabled_completion___block_invoke;
    *(_QWORD *)&v20 = &unk_1E4644FD8;
    v24 = v10;
    *((_QWORD *)&v20 + 1) = self;
    v25 = v11;
    v21 = 0;
    v26 = 0;
    v16 = v15;
    v22 = v16;
    v17 = v14;
    v23 = v17;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", buf);

    -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, v16, 0, 0);
    -[FCSubscriptionList _modifyRemoteSubscriptions:](self, v16);
    if (v12)
      v12[2](v12, v17);

  }
}

- (BOOL)addSubscriptionForTagID:(id)a3 type:(unint64_t)a4 origin:(unint64_t)a5
{
  return -[FCSubscriptionList addSubscriptionForTagID:type:origin:groupID:](self, "addSubscriptionForTagID:type:origin:groupID:", a3, a4, a5, 0);
}

- (BOOL)addSubscriptionForTagID:(id)a3 type:(unint64_t)a4
{
  return -[FCSubscriptionList addSubscriptionForTagID:type:origin:](self, "addSubscriptionForTagID:type:origin:", a3, a4, 0);
}

- (BOOL)appendSubscriptionForTagID:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *mutableSubscriptionsBySubscriptionID;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
    *(_DWORD *)buf = 136315906;
    v34 = "-[FCSubscriptionList appendSubscriptionForTagID:type:]";
    v35 = 2080;
    v36 = "FCSubscriptionList.m";
    v37 = 1024;
    v38 = 513;
    v39 = 2114;
    v40 = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    mutableSubscriptionsBySubscriptionID = self->_mutableSubscriptionsBySubscriptionID;
  else
    mutableSubscriptionsBySubscriptionID = 0;
  -[NSMutableDictionary objectForKey:](mutableSubscriptionsBySubscriptionID, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (self)
    {
      v10 = 1000000000000000;
      v30 = (void *)MEMORY[0x1E0CB37E8];
      -[FCSubscriptionList orderedSubscribedTagIDs](self, "orderedSubscribedTagIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", v12, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          -[FCSubscriptionList subscriptionsBySubscriptionID](self, "subscriptionsBySubscriptionID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "order");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v16, "longLongValue");

          v10 = v28 + 1000000000000000;
        }
      }

      objc_msgSend(v30, "numberWithLongLong:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (self)
      v20 = a4 - 3 >= 3;
    else
      v20 = 1;
    v21 = !v20;
    LOBYTE(v27) = 0;
    +[FCSubscription subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:](FCSubscription, "subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:", v7, v6, a4, v17, 0, 0, v18, v27, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, v23, 0, 0);

    v31 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCSubscriptionList _modifyRemoteSubscriptions:](self, v24);

  }
  return v9 == 0;
}

- (void)removeSubscriptionsForTagIDs:(id)a3 typeProvider:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id);
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  FCRemoveSubscriptionsCommand *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, id))a5;
  v10 = (void *)MEMORY[0x1E0CB3978];
  v11 = a3;
  objc_msgSend(v10, "isMainThread");
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagIDs != nil");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCSubscriptionList removeSubscriptionsForTagIDs:typeProvider:completion:]";
    v25 = 2080;
    v26 = "FCSubscriptionList.m";
    v27 = 1024;
    v28 = 541;
    v29 = 2114;
    v30 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v12 = (void *)objc_opt_new();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __75__FCSubscriptionList_removeSubscriptionsForTagIDs_typeProvider_completion___block_invoke;
  v20[3] = &unk_1E4645000;
  v22 = v8;
  v20[4] = self;
  v13 = v12;
  v21 = v13;
  v14 = v8;
  objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, 0, 0, v15);
    v16 = v15;
    v17 = v16;
    if (self && objc_msgSend(v16, "count"))
    {
      v18 = -[FCRemoveSubscriptionsCommand initWithSubscriptions:]([FCRemoveSubscriptionsCommand alloc], "initWithSubscriptions:", v17);
      -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v18);

    }
  }
  if (v9)
    v9[2](v9, v13);

}

id __75__FCSubscriptionList_removeSubscriptionsForTagIDs_typeProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", v3, (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(void **)(v5 + 152);
    else
      v6 = 0;
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v7 = 0;
  }

  return v7;
}

- (void)removeSubscriptionForTagID:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *mutableSubscriptionsBySubscriptionID;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  id v12;
  FCRemoveSubscriptionsCommand *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v6)
  {
    +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      mutableSubscriptionsBySubscriptionID = self->_mutableSubscriptionsBySubscriptionID;
    else
      mutableSubscriptionsBySubscriptionID = 0;
    v9 = mutableSubscriptionsBySubscriptionID;
    -[NSMutableDictionary objectForKey:](v9, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v15 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, 0, 0, v11);

      if (self)
      {
        v12 = v10;
        v13 = -[FCRemoveSubscriptionsCommand initWithSubscription:]([FCRemoveSubscriptionsCommand alloc], "initWithSubscription:", v12);

        -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v13);
      }
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCSubscriptionList removeSubscriptionForTagID:type:]";
    v18 = 2080;
    v19 = "FCSubscriptionList.m";
    v20 = 1024;
    v21 = 575;
    v22 = 2114;
    v23 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (BOOL)canAddSubscription
{
  void *v2;
  BOOL v3;

  -[FCSubscriptionList subscribedTagIDs](self, "subscribedTagIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") < 0xFA;

  return v3;
}

- (BOOL)hasSubscriptionForTagID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCSubscriptionList hasSubscriptionForTagID:]";
    v11 = 2080;
    v12 = "FCSubscriptionList.m";
    v13 = 1024;
    v14 = 674;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCSubscriptionList subscribedTagIDs](self, "subscribedTagIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)subscriptionForTagIDOfAnyType:(id)a3
{
  id v4;
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  FCSubscriptionList *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__40;
  v18 = __Block_byref_object_dispose__40;
  v19 = 0;
  if (v4)
  {
    if (self)
      itemsLock = self->_itemsLock;
    else
      itemsLock = 0;
    v6 = itemsLock;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__FCSubscriptionList_subscriptionForTagIDOfAnyType___block_invoke;
    v10[3] = &unk_1E4645050;
    v12 = self;
    v13 = &v14;
    v11 = v4;
    -[FCMTWriterLock performReadSync:](v6, "performReadSync:", v10);

    v7 = (void *)v15[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __52__FCSubscriptionList_subscriptionForTagIDOfAnyType___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  __int128 v5;

  FCSubscriptionTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__FCSubscriptionList_subscriptionForTagIDOfAnyType___block_invoke_2;
  v3[3] = &unk_1E4645028;
  v4 = *(id *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __52__FCSubscriptionList_subscriptionForTagIDOfAnyType___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, BOOL *a4)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", a1[4], objc_msgSend(a2, "unsignedIntegerValue"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)a1[5];
  if (v6)
    v6 = (_QWORD *)v6[19];
  v7 = v6;
  objc_msgSend(v7, "objectForKeyedSubscript:", v11);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  *a4 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
}

- (id)subscriptionForTagID:(id)a3
{
  return -[FCSubscriptionList subscriptionForTagID:type:](self, "subscriptionForTagID:type:", a3, 0);
}

- (NSSet)allSubscribedTagIDs
{
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__40;
  v12 = __Block_byref_object_dispose__40;
  v13 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v4 = itemsLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__FCSubscriptionList_allSubscribedTagIDs__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[FCMTWriterLock performReadSync:](v4, "performReadSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

void __41__FCSubscriptionList_allSubscribedTagIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__FCSubscriptionList_allSubscribedTagIDs__block_invoke_2;
  v5[3] = &unk_1E463AE18;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "fc_set:", v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __41__FCSubscriptionList_allSubscribedTagIDs__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = *(id *)(v3 + 112);
    if (v4)
      objc_msgSend(v8, "unionSet:", v4);
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      v6 = *(id *)(v5 + 128);
      if (v6)
      {
        v7 = v6;
        objc_msgSend(v8, "unionSet:", v6);

      }
    }
  }
  else
  {
    v4 = 0;
  }

}

- (BOOL)hasNotificationsEnabledForTagID:(id)a3
{
  void *v3;
  char v4;

  -[FCSubscriptionList subscriptionForTagID:](self, "subscriptionForTagID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "notificationsEnabled");

  return v4;
}

- (BOOL)setNotificationsEnabled:(BOOL)a3 forTagID:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *mutableSubscriptionsBySubscriptionID;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v6)
  {
    +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      mutableSubscriptionsBySubscriptionID = self->_mutableSubscriptionsBySubscriptionID;
    else
      mutableSubscriptionsBySubscriptionID = 0;
    -[NSMutableDictionary objectForKey:](mutableSubscriptionsBySubscriptionID, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v9 != 0;
    if (v9)
    {
      objc_msgSend(v9, "subscriptionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tagID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "order");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v7;
      v15 = objc_msgSend(v10, "subscriptionOrigin");
      objc_msgSend(v10, "dateAdded");
      v23 = v11;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v22) = a3;
      +[FCSubscription subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:](FCSubscription, "subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:", v12, v13, 0, v14, v15, 0, v16, v22, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, 0, v18, 0);

      v25 = v17;
      v11 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCSubscriptionList _modifyRemoteSubscriptions:](self, v19);

      v7 = v24;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
      *(_DWORD *)buf = 136315906;
      v28 = "-[FCSubscriptionList setNotificationsEnabled:forTagID:]";
      v29 = 2080;
      v30 = "FCSubscriptionList.m";
      v31 = 1024;
      v32 = 749;
      v33 = 2114;
      v34 = v21;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)hasIgnoredSubscriptionForTagID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[FCSubscriptionList ignoredTagIDs](self, "ignoredTagIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)hasAutoFavoriteSubscriptionForTagID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[FCSubscriptionList autoFavoriteTagIDs](self, "autoFavoriteTagIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)moveSubscriptionForTagID:(id)a3 toIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  FCSubscriptionList *v22;
  unint64_t v23;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCSubscriptionList subscribedTagIDs](self, "subscribedTagIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6)
    v9 = v8 > a4;
  else
    v9 = 0;
  v10 = v9;
  if (v10)
  {
    -[FCSubscriptionList orderedSubscribedTagIDs](self, "orderedSubscribedTagIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    v13 = (void *)MEMORY[0x1E0C99D20];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __55__FCSubscriptionList_moveSubscriptionForTagID_toIndex___block_invoke;
    v19[3] = &unk_1E4645078;
    v20 = v12;
    v22 = self;
    v23 = a4;
    v21 = v6;
    v14 = v12;
    objc_msgSend(v13, "fc_array:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FCTagSubscriptionOrderAssigner initWithInitialOrder:orderSpacing:]([FCTagSubscriptionOrderAssigner alloc], 0, 1000000000000000);
    -[FCTagSubscriptionOrderAssigner assignOrderToTagSubscriptions:](v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, 0, v17, 0);
    -[FCSubscriptionList _modifyRemoteSubscriptions:](self, v17);

  }
  return v10;
}

void __55__FCSubscriptionList_moveSubscriptionForTagID_toIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v3 - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "subscriptionForTagID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v5);

  }
  objc_msgSend(*(id *)(a1 + 48), "subscriptionForTagID:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithOrder:", 0);
  objc_msgSend(v11, "addObject:", v7);
  v8 = *(_QWORD *)(a1 + 56) + 1;
  if (v8 != objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(a1 + 56) + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "subscriptionForTagID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);

  }
}

- (void)reorderSubscriptionOrderForOrderedIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v15[1] = 3221225472;
  v15[2] = __68__FCSubscriptionList_reorderSubscriptionOrderForOrderedIdentifiers___block_invoke;
  v15[3] = &unk_1E46450A0;
  v15[4] = self;
  v15[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    v8 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "order");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToNumber:", v11);

      if ((v12 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v9, "copyWithOrder:", v13);

        objc_msgSend(v6, "addObject:", v14);
      }

      ++v8;
      v7 += 1000000000000000;
    }
    while (v8 < objc_msgSend(v5, "count"));
  }
  if (objc_msgSend(v6, "count"))
  {
    -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, 0, v6, 0);
    -[FCSubscriptionList _modifyRemoteSubscriptions:](self, v6);
  }

}

uint64_t __68__FCSubscriptionList_reorderSubscriptionOrderForOrderedIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "subscriptionForTagID:", a2);
}

uint64_t __68__FCSubscriptionList__assignOrderToTagSubscriptions_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagID");
}

void __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v7 = v4;
  objc_msgSend(v4, "tagID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

uint64_t __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "subscriptionID");
}

void __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "tagID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "containsObject:", v7))
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = *(void **)(a1 + 48);
    objc_msgSend(v5, "subscriptionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v7);
LABEL_4:

  }
}

uint64_t __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "subscriptionType") == 1)
    goto LABEL_5;
  v6 = (void *)objc_opt_class();
  objc_msgSend(v3, "tagID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscriptionIDForTagID:type:", v7, objc_msgSend(v3, "subscriptionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToString:", v8);

  if (!v9)
    goto LABEL_5;
  v10 = *(void **)(a1 + 40);
  objc_msgSend(v3, "subscriptionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v4, v5);
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v3, v5);
    v13 = 1;
  }
  else
  {
LABEL_5:
    v13 = 0;
  }

  return v13;
}

void __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_71(uint64_t a1)
{
  -[FCSubscriptionList setMutableSubscriptionsBySubscriptionID:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  -[FCSubscriptionList _regenerateSortedSubscriptions](*(id **)(a1 + 32));
}

uint64_t __52__FCSubscriptionList__regenerateSortedSubscriptions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", a2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "order");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "order");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12)
    v15 = v13 == 0;
  else
    v15 = 1;
  if (v15)
  {
    if (v12)
      v16 = -1;
    else
      v16 = 1;
  }
  else
  {
    v17 = objc_msgSend(v12, "compare:", v13);
    v16 = v17;
    if (!v17)
    {
      objc_msgSend(v8, "tagID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tagID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v18, "compare:", v19);

    }
  }

  return v16;
}

- (id)t_reconcileSubscriptions:(id)a3
{
  return -[FCSubscriptionList _reconcileSubscriptions:]((uint64_t)self, a3);
}

id __60__FCSubscriptionList_configureKeyValueStoreForJSONHandling___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  void *v13;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("subscriptionOrigin"));

  if (v8)
  {
    NSStringFromFCSubscriptionOrigin(objc_msgSend(v5, "unsignedIntegerValue"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v4;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("subscriptionType"));

    if (v12)
    {
      NSStringFromFCSubscriptionType(objc_msgSend(v5, "unsignedIntegerValue"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v5;
    }
  }
  v13 = v9;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_mutableSubscriptionsBySubscriptionID, 0);
  objc_storeStrong((id *)&self->_ignoredTagIDsInternal, 0);
  objc_storeStrong((id *)&self->_groupableTagIDsInternal, 0);
  objc_storeStrong((id *)&self->_autoFavoriteTagIDsInternal, 0);
  objc_storeStrong((id *)&self->_mutedTagIDsInternal, 0);
  objc_storeStrong((id *)&self->_subscribedTagIDsInternal, 0);
  objc_storeStrong((id *)&self->_orderedSubscribedTagIDsInternal, 0);
  objc_storeStrong((id *)&self->_subscribedTagRanker, 0);
}

@end
