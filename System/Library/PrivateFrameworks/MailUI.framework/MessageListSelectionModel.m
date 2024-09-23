@implementation MessageListSelectionModel

void ___ef_log_MessageListSelectionModel_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MessageListSelectionModel");
  v1 = (void *)_ef_log_MessageListSelectionModel_log;
  _ef_log_MessageListSelectionModel_log = (uint64_t)v0;

}

- (MessageListSelectionModel)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  MessageListSelectionModel *v8;
  MessageListSelectionModel *v9;
  TrackedMessageListItems *v10;
  TrackedMessageListItems *trackedItems;
  NSMutableSet *v12;
  NSMutableSet *itemIDsPendingConfiguration;
  NSMutableSet *v14;
  NSMutableSet *itemIDsMissingMessageListItem;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MessageListSelectionModel;
  v8 = -[MessageListSelectionModel init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v10 = objc_alloc_init(TrackedMessageListItems);
    trackedItems = v9->_trackedItems;
    v9->_trackedItems = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    itemIDsPendingConfiguration = v9->_itemIDsPendingConfiguration;
    v9->_itemIDsPendingConfiguration = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    itemIDsMissingMessageListItem = v9->_itemIDsMissingMessageListItem;
    v9->_itemIDsMissingMessageListItem = v14;

    v9->_type = 0;
  }

  return v9;
}

- (int64_t)count
{
  if (-[MessageListSelectionModel type](self, "type"))
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return -[MessageListSelectionModel trackedItemsCount](self, "trackedItemsCount");
}

- (id)itemIDs
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  MessageListSelectionModel *v12;

  v3 = -[MessageListSelectionModel isSelectAll](self, "isSelectAll");
  -[MessageListSelectionModel trackedItems](self, "trackedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MessageListSelectionModel dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__MessageListSelectionModel_itemIDs__block_invoke;
    v10[3] = &unk_1E99E1E80;
    v11 = v6;
    v12 = self;
    v7 = v6;
    objc_msgSend(v5, "ef_filter:", v10);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

uint64_t __36__MessageListSelectionModel_itemIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "selectionModel:isItemIDExpandedThread:", *(_QWORD *)(a1 + 40), a2) ^ 1;
}

- (BOOL)isSelectAll
{
  return -[MessageListSelectionModel type](self, "type") == 1;
}

- (BOOL)isSelectionValid
{
  BOOL v3;
  void *v4;

  if (-[MessageListSelectionModel isSelectAll](self, "isSelectAll"))
    return 1;
  -[MessageListSelectionModel itemIDs](self, "itemIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (id)currentMessageListItemSelection
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  MessageListSelectionModel *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MessageListSelectionModel trackedItems](self, "trackedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageListItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5 != objc_msgSend(v3, "count"))
  {
    _ef_log_MessageListSelectionModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v3, "count");
      v13 = 138543874;
      v14 = v11;
      v15 = 2048;
      v16 = self;
      v17 = 2048;
      v18 = v12 - objc_msgSend(v4, "count");
      _os_log_error_impl(&dword_1D5522000, v6, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Message list selection is missing %lu items", (uint8_t *)&v13, 0x20u);

    }
  }
  -[MessageListSelectionModel trackedMailboxes](self, "trackedMailboxes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListSelectionModel selectionWithMessageListItems:mailboxes:](self, "selectionWithMessageListItems:mailboxes:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)selectionWithMessageListItems:(id)a3 mailboxes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  if (-[MessageListSelectionModel isSelectionValid](self, "isSelectionValid")
    && (objc_msgSend(v6, "count") || -[MessageListSelectionModel isSelectAll](self, "isSelectAll"))
    && (objc_msgSend(v7, "count") || !-[MessageListSelectionModel isSelectAll](self, "isSelectAll")))
  {
    v9 = -[MessageListSelectionModel isSelectAll](self, "isSelectAll");
    v10 = objc_alloc(MEMORY[0x1E0D46DB8]);
    if (v9)
      v11 = objc_msgSend(v10, "initWithMailboxes:excludedMessageListItems:", v7, v6);
    else
      v11 = objc_msgSend(v10, "initWithMessageListItems:", v6);
    v8 = (void *)v11;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)deleteSelectionState
{
  unint64_t result;
  int64_t v4;
  _BOOL8 v5;
  int64_t v6;
  _BOOL8 v7;
  int64_t v8;

  result = -[MessageListSelectionModel count](self, "count");
  if (result)
  {
    v4 = -[MessageListSelectionModel count](self, "count");
    v5 = v4 == -[MessageListSelectionModel trackedItemsWillMoveToTrash](self, "trackedItemsWillMoveToTrash");
    v6 = -[MessageListSelectionModel count](self, "count");
    v7 = v6 == -[MessageListSelectionModel trackedItemsSupportArchiving](self, "trackedItemsSupportArchiving");
    v8 = -[MessageListSelectionModel count](self, "count");
    return (v5 || 4 * v7) | (2
                           * (v8 == -[MessageListSelectionModel trackedItemsArchiveByDefault](self, "trackedItemsArchiveByDefault")));
  }
  return result;
}

- (id)cascadedItemIDsForItemID:(id)a3 isSelecting:(BOOL)a4
{
  int v4;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[MessageListSelectionModel dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "selectionModel:isThreadedItemID:", self, v7))
  {
    v9 = objc_msgSend(v8, "selectionModel:isItemIDExpandedThread:", self, v7);
    _ef_log_MessageListSelectionModel();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138544386;
      v22 = v11;
      v23 = 2114;
      v24 = v7;
      v25 = 1024;
      v26 = v4;
      v27 = 1024;
      v28 = 1;
      v29 = 1024;
      LODWORD(v30) = v9;
      _os_log_impl(&dword_1D5522000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - itemID: %{public}@, isSelecting: %{BOOL}d, isThread: %{BOOL}d, isExpanded: %{BOOL}d", (uint8_t *)&v21, 0x28u);

    }
    if (v9)
    {
      objc_msgSend(v8, "selectionModel:itemIDsInExpandedThread:", self, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    objc_msgSend(v8, "selectionModel:threadItemIDForItemInExpandedThread:", self, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v8, "selectionModel:itemIDsInExpandedThread:", self, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = -[MessageListSelectionModel _allChildrenSelected:](self, "_allChildrenSelected:", v16);
      _ef_log_MessageListSelectionModel();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138544642;
        v22 = v19;
        v23 = 2114;
        v24 = v7;
        v25 = 1024;
        v26 = v4;
        v27 = 1024;
        v28 = v17;
        v29 = 2114;
        v30 = v13;
        v31 = 2114;
        v32 = v16;
        _os_log_impl(&dword_1D5522000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - itemID: %{public}@, isSelecting: %{BOOL}d, allChildrenSelected: %{BOOL}d, parent: %{public}@, children: %{public}@", (uint8_t *)&v21, 0x36u);

      }
      if (v17 == v4)
      {
        objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v12;
}

- (id)itemIDsToUnselectForItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MessageListSelectionModel dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "selectionModel:isThreadedItemID:", self, v4)
    && objc_msgSend(v5, "selectionModel:isItemIDExpandedThread:", self, v4))
  {
    objc_msgSend(v5, "selectionModel:itemIDsInExpandedThread:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (BOOL)_allChildrenSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[MessageListSelectionModel trackedItems](self, "trackedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIDsSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MessageListSelectionModel isSelectAll](self, "isSelectAll"))
  {
    if (objc_msgSend(v6, "count"))
      v7 = objc_msgSend(v6, "intersectsSet:", v4) ^ 1;
    else
      LOBYTE(v7) = 1;
  }
  else
  {
    LOBYTE(v7) = objc_msgSend(v4, "isSubsetOfSet:", v6);
  }

  return v7;
}

- (void)_fetchMissingMessageListItems
{
  void *v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "itemIDsMissingMessageListItem");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "count"))
    {
      _ef_log_MessageListSelectionModel();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v31 = v6;
        v32 = 2048;
        v33 = a1;
        v34 = 2048;
        v35 = objc_msgSend(v3, "count");
        v36 = 2114;
        v37 = v3;
        _os_log_impl(&dword_1D5522000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Fetch message list items for item ids (%lu): %{public}@", buf, 0x2Au);

      }
      objc_msgSend(a1, "itemIDsMissingMessageListItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeAllObjects");

      objc_msgSend(a1, "trackedItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "dataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = a1;
      v20 = v3;
      objc_msgSend(v9, "selectionModel:messageListItemsForItemIDs:", a1, v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      obj = v11;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v26;
        v15 = MEMORY[0x1E0C809B0];
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
            objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v23[0] = v15;
            v23[1] = 3221225472;
            v23[2] = __58__MessageListSelectionModel__fetchMissingMessageListItems__block_invoke;
            v23[3] = &unk_1E99E1EA8;
            v24 = v8;
            objc_msgSend(v17, "onScheduler:addSuccessBlock:", v18, v23);

            objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v22[0] = v15;
            v22[1] = 3221225472;
            v22[2] = __58__MessageListSelectionModel__fetchMissingMessageListItems__block_invoke_2;
            v22[3] = &unk_1E99E1ED0;
            v22[4] = v10;
            objc_msgSend(v17, "onScheduler:addFailureBlock:", v19, v22);

            ++v16;
          }
          while (v13 != v16);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v13);
      }

      v3 = v20;
    }

  }
}

uint64_t __58__MessageListSelectionModel__fetchMissingMessageListItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateMessageListItem:", a2);
}

void __58__MessageListSelectionModel__fetchMissingMessageListItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _ef_log_MessageListSelectionModel();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__MessageListSelectionModel__fetchMissingMessageListItems__block_invoke_2_cold_1(a1, v3, v4);

}

- (BOOL)_trackItemIDs:(id)a3 updateCount:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  MessageListSelectionModel *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v4 = a4;
  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[MessageListSelectionModel trackedItems](self, "trackedItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemIDsSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "minusSet:", v8);
    if (objc_msgSend(v9, "count"))
    {
      v42 = v9;
      objc_msgSend(v9, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MessageListSelectionModel dataSource](self, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v11;
      v41 = v10;
      if (-[MessageListSelectionModel isPerformingDataSourceUpdates](self, "isPerformingDataSourceUpdates"))
      {
        _ef_log_MessageListSelectionModel();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v54 = v14;
          v55 = 2048;
          v56 = self;
          v57 = 2048;
          v58 = objc_msgSend(v10, "count");
          v59 = 2114;
          v60 = v10;
          _os_log_impl(&dword_1D5522000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Data source is performing updates, load message list items (%lu) once completed: %{public}@", buf, 0x2Au);

        }
        -[MessageListSelectionModel itemIDsMissingMessageListItem](self, "itemIDsMissingMessageListItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObjectsFromArray:", v10);

        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v16 = v10;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v48 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(v7, "trackMessageListItemWithItemID:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
          }
          while (v18);
        }
      }
      else
      {
        v37 = v8;
        v38 = v6;
        v39 = v4;
        objc_msgSend(v11, "selectionModel:messageListItemsForItemIDs:", self, v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "ef_map:", &__block_literal_global_44);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v16 = v22;
        v23 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v44;
          v26 = *MEMORY[0x1E0D1ED88];
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v44 != v25)
                objc_enumerationMutation(v16);
              v28 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
              if ((*(unsigned int (**)(uint64_t, uint64_t))(v26 + 16))(v26, v28))
              {
                objc_msgSend(v7, "trackmessageListItem:", v28);
              }
              else
              {
                _ef_log_MessageListSelectionModel();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  v30 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v30);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v54 = v31;
                  v55 = 2048;
                  v56 = self;
                  _os_log_error_impl(&dword_1D5522000, v29, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Skip tracking message -- message is null", buf, 0x16u);

                }
              }
            }
            v24 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          }
          while (v24);
        }

        v4 = v39;
        v8 = v37;
        v6 = v38;
      }
      v9 = v42;

      if (v4)
      {
        objc_msgSend(v42, "allObjects");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[MessageListSelectionModel setTrackedItemsCount:](self, "setTrackedItemsCount:", -[MessageListSelectionModel trackedItemsCount](self, "trackedItemsCount")+ objc_msgSend(v40, "selectionModel:countForItemIDs:", self, v32));

        objc_msgSend(v42, "allObjects");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[MessageListSelectionModel setTrackedItemsWillMoveToTrash:](self, "setTrackedItemsWillMoveToTrash:", -[MessageListSelectionModel trackedItemsWillMoveToTrash](self, "trackedItemsWillMoveToTrash")+ objc_msgSend(v40, "selectionModel:countDeleteMovesToTrashForItemIDs:", self, v33));

        objc_msgSend(v42, "allObjects");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[MessageListSelectionModel setTrackedItemsSupportArchiving:](self, "setTrackedItemsSupportArchiving:", -[MessageListSelectionModel trackedItemsSupportArchiving](self, "trackedItemsSupportArchiving")+ objc_msgSend(v40, "selectionModel:countSupportsArchivingForItemIDs:", self, v34));

        objc_msgSend(v42, "allObjects");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[MessageListSelectionModel setTrackedItemsArchiveByDefault:](self, "setTrackedItemsArchiveByDefault:", -[MessageListSelectionModel trackedItemsArchiveByDefault](self, "trackedItemsArchiveByDefault")+ objc_msgSend(v40, "selectionModel:countShouldArchiveByDefaultForItemIDs:", self, v35));

      }
      -[MessageListSelectionModel _scheduleMailboxPredictionUpdate](self, "_scheduleMailboxPredictionUpdate");

    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

uint64_t __55__MessageListSelectionModel__trackItemIDs_updateCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "result");
}

- (BOOL)_untrackItemIDs:(id)a3 updateCount:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageListSelectionModel trackedItems](self, "trackedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemIDsSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intersectSet:", v9);
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "untrackMessageListItemsWithItemIDs:", v10);

      if (v4)
      {
        -[MessageListSelectionModel dataSource](self, "dataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MessageListSelectionModel setTrackedItemsCount:](self, "setTrackedItemsCount:", -[MessageListSelectionModel trackedItemsCount](self, "trackedItemsCount")- objc_msgSend(v11, "selectionModel:countForItemIDs:", self, v12));

        objc_msgSend(v7, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MessageListSelectionModel setTrackedItemsWillMoveToTrash:](self, "setTrackedItemsWillMoveToTrash:", -[MessageListSelectionModel trackedItemsWillMoveToTrash](self, "trackedItemsWillMoveToTrash")- objc_msgSend(v11, "selectionModel:countDeleteMovesToTrashForItemIDs:", self, v13));

        objc_msgSend(v7, "allObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MessageListSelectionModel setTrackedItemsSupportArchiving:](self, "setTrackedItemsSupportArchiving:", -[MessageListSelectionModel trackedItemsSupportArchiving](self, "trackedItemsSupportArchiving")- objc_msgSend(v11, "selectionModel:countSupportsArchivingForItemIDs:", self, v14));

        objc_msgSend(v7, "allObjects");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MessageListSelectionModel setTrackedItemsArchiveByDefault:](self, "setTrackedItemsArchiveByDefault:", -[MessageListSelectionModel trackedItemsArchiveByDefault](self, "trackedItemsArchiveByDefault")- objc_msgSend(v11, "selectionModel:countShouldArchiveByDefaultForItemIDs:", self, v15));

      }
      -[MessageListSelectionModel _scheduleMailboxPredictionUpdate](self, "_scheduleMailboxPredictionUpdate");
    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_untrackAllItemIDs
{
  void *v3;

  -[MessageListSelectionModel trackedItems](self, "trackedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "untrackAllMessageListItems");

  -[MessageListSelectionModel setTrackedItemsCount:](self, "setTrackedItemsCount:", 0);
  -[MessageListSelectionModel setTrackedItemsWillMoveToTrash:](self, "setTrackedItemsWillMoveToTrash:", 0);
  -[MessageListSelectionModel setTrackedItemsSupportArchiving:](self, "setTrackedItemsSupportArchiving:", 0);
  -[MessageListSelectionModel setTrackedItemsArchiveByDefault:](self, "setTrackedItemsArchiveByDefault:", 0);
  -[MessageListSelectionModel _scheduleMailboxPredictionUpdate](self, "_scheduleMailboxPredictionUpdate");
}

- (id)selectItemWithItemID:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[MessageListSelectionModel isSelectAll](self, "isSelectAll");
    -[MessageListSelectionModel itemIDsToUnselectForItemID:](self, "itemIDsToUnselectForItemID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[MessageListSelectionModel _trackItemIDs:updateCount:](self, "_trackItemIDs:updateCount:", v6, 1);
      v14[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[MessageListSelectionModel _untrackItemIDs:updateCount:](self, "_untrackItemIDs:updateCount:", v7, 1);

      -[MessageListSelectionModel cascadedItemIDsForItemID:isSelecting:](self, "cascadedItemIDsForItemID:isSelecting:", v4, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MessageListSelectionModel _untrackItemIDs:updateCount:](self, "_untrackItemIDs:updateCount:", v9, !v8);
    }
    else
    {
      -[MessageListSelectionModel _untrackItemIDs:updateCount:](self, "_untrackItemIDs:updateCount:", v6, 1);
      v13 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[MessageListSelectionModel _trackItemIDs:updateCount:](self, "_trackItemIDs:updateCount:", v10, 1);

      -[MessageListSelectionModel cascadedItemIDsForItemID:isSelecting:](self, "cascadedItemIDsForItemID:isSelecting:", v4, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MessageListSelectionModel _trackItemIDs:updateCount:](self, "_trackItemIDs:updateCount:", v9, !v11);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)deselectItemWithItemID:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (-[MessageListSelectionModel isSelectAll](self, "isSelectAll"))
    {
      v12[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[MessageListSelectionModel _trackItemIDs:updateCount:](self, "_trackItemIDs:updateCount:", v5, 1);

      -[MessageListSelectionModel cascadedItemIDsForItemID:isSelecting:](self, "cascadedItemIDsForItemID:isSelecting:", v4, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MessageListSelectionModel _trackItemIDs:updateCount:](self, "_trackItemIDs:updateCount:", v7, !v6);
    }
    else
    {
      v11 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[MessageListSelectionModel _untrackItemIDs:updateCount:](self, "_untrackItemIDs:updateCount:", v8, 1);

      -[MessageListSelectionModel cascadedItemIDsForItemID:isSelecting:](self, "cascadedItemIDsForItemID:isSelecting:", v4, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MessageListSelectionModel _untrackItemIDs:updateCount:](self, "_untrackItemIDs:updateCount:", v7, !v9);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)willCollapseThreadItemID:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MessageListSelectionModel cascadedItemIDsForItemID:isSelecting:](self, "cascadedItemIDsForItemID:isSelecting:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);
  if (!-[MessageListSelectionModel _allChildrenSelected:](self, "_allChildrenSelected:", v5))
  {
    v6 = -[MessageListSelectionModel deselectItemWithItemID:](self, "deselectItemWithItemID:", v8);
    -[MessageListSelectionModel delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectionModel:deselectItemID:", self, v8);

  }
  -[MessageListSelectionModel _untrackItemIDs:updateCount:](self, "_untrackItemIDs:updateCount:", v4, 0);

}

- (void)didExpandThreadItemID:(id)a3 addedItemIDs:(id)a4
{
  id v6;

  v6 = a4;
  if (-[MessageListSelectionModel isSelectedItemID:](self, "isSelectedItemID:", a3))
  {
    if (-[MessageListSelectionModel isSelectAll](self, "isSelectAll"))
      -[MessageListSelectionModel _untrackItemIDs:updateCount:](self, "_untrackItemIDs:updateCount:", v6, 0);
    else
      -[MessageListSelectionModel _trackItemIDs:updateCount:](self, "_trackItemIDs:updateCount:", v6, 0);
  }

}

- (BOOL)isSelectedItemID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MessageListSelectionModel trackedItems](self, "trackedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasMessageListItemForItemID:", v4);

  return v6 ^ -[MessageListSelectionModel isSelectAll](self, "isSelectAll");
}

- (void)configureSelectionForItemID:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[MessageListSelectionModel isPerformingDataSourceUpdates](self, "isPerformingDataSourceUpdates"))
  {
    -[MessageListSelectionModel itemIDsPendingConfiguration](self, "itemIDsPendingConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);
  }
  else
  {
    -[MessageListSelectionModel delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MessageListSelectionModel isSelectedItemID:](self, "isSelectedItemID:", v6))
      objc_msgSend(v4, "selectionModel:selectItemID:", self, v6);
    else
      objc_msgSend(v4, "selectionModel:deselectItemID:", self, v6);
    -[MessageListSelectionModel itemIDsPendingConfiguration](self, "itemIDsPendingConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v6);

  }
}

- (void)setPerformingDataSourceUpdates:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_performingDataSourceUpdates != a3)
  {
    self->_performingDataSourceUpdates = a3;
    if (!a3)
    {
      -[MessageListSelectionModel itemIDsPendingConfiguration](self, "itemIDsPendingConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (v5)
      {
        -[MessageListSelectionModel itemIDsPendingConfiguration](self, "itemIDsPendingConfiguration");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v6, "mutableCopy");

        -[MessageListSelectionModel trackedItems](self, "trackedItems");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "itemIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v9);

        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v10 = v7;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              -[MessageListSelectionModel configureSelectionForItemID:](self, "configureSelectionForItemID:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v12);
        }

      }
      -[MessageListSelectionModel _fetchMissingMessageListItems](self);
    }
  }
}

- (void)setMultipleSelectionActive:(BOOL)a3
{
  NSMutableSet *v4;
  NSMutableSet *itemsToDeselectAfterMultipleSelection;
  NSMutableSet *v6;

  if (self->_multipleSelectionActive != a3)
  {
    self->_multipleSelectionActive = a3;
    if (a3)
    {
      v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      itemsToDeselectAfterMultipleSelection = self->_itemsToDeselectAfterMultipleSelection;
      self->_itemsToDeselectAfterMultipleSelection = v4;

    }
    else
    {
      v6 = self->_itemsToDeselectAfterMultipleSelection;
      self->_itemsToDeselectAfterMultipleSelection = 0;

    }
  }
}

- (EMMailbox)predictedMoveMailbox
{
  void *v3;
  void *v4;

  if (-[MessageListSelectionModel type](self, "type"))
  {
    v3 = 0;
  }
  else
  {
    -[MessageListSelectionModel mailboxPredictionFuture](self, "mailboxPredictionFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultIfAvailable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (EMMailbox *)v3;
}

- (void)_scheduleMailboxPredictionUpdate
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  if (-[MessageListSelectionModel isSelectAll](self, "isSelectAll")
    || (-[MessageListSelectionModel trackedItems](self, "trackedItems"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        !v4))
  {
    -[MessageListSelectionModel setMailboxPredictionFuture:](self, "setMailboxPredictionFuture:", 0);
  }
  else
  {
    -[MessageListSelectionModel predictionDebouncer](self, "predictionDebouncer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v6 = objc_alloc(MEMORY[0x1E0D1EEA0]);
      objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __61__MessageListSelectionModel__scheduleMailboxPredictionUpdate__block_invoke;
      v15 = &unk_1E99E1F18;
      objc_copyWeak(&v16, &location);
      v8 = (void *)objc_msgSend(v6, "initWithTimeInterval:scheduler:startAfter:block:", v7, 0, &v12, 0.25);
      -[MessageListSelectionModel setPredictionDebouncer:](self, "setPredictionDebouncer:", v8, v12, v13, v14, v15);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    -[MessageListSelectionModel trackedItems](self, "trackedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MessageListSelectionModel predictionDebouncer](self, "predictionDebouncer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "debounceResult:", v10);

  }
}

void __61__MessageListSelectionModel__scheduleMailboxPredictionUpdate__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "__updatePredictionWithSelection:", v3);

}

- (void)__updatePredictionWithSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MessageListSelectionModel dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionModel:objectIDsForItemIDs:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "ef_UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _ef_log_MessageListSelectionModel();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v21 = objc_msgSend(v4, "count");
    v22 = 2114;
    v23 = v7;
    _os_log_impl(&dword_1D5522000, v8, OS_LOG_TYPE_INFO, "Requesting predicted mailbox for %lu messages. predictionID=%{public}@", buf, 0x16u);
  }

  objc_msgSend(v5, "selectionModel:predictMailboxForMovingMessagesWithIDs:", self, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__MessageListSelectionModel___updatePredictionWithSelection___block_invoke;
  v18[3] = &unk_1E99E1F40;
  v11 = v7;
  v19 = v11;
  objc_msgSend(v9, "addSuccessBlock:", v18);
  v13 = v10;
  v14 = 3221225472;
  v15 = __61__MessageListSelectionModel___updatePredictionWithSelection___block_invoke_50;
  v16 = &unk_1E99E1ED0;
  v17 = v11;
  v12 = v11;
  objc_msgSend(v9, "addFailureBlock:", &v13);
  -[MessageListSelectionModel setMailboxPredictionFuture:](self, "setMailboxPredictionFuture:", v9, v13, v14, v15, v16);

}

void __61__MessageListSelectionModel___updatePredictionWithSelection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ef_log_MessageListSelectionModel();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "ef_publicDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D5522000, v4, OS_LOG_TYPE_INFO, "Mailbox prediction finished with mailbox=%{public}@ predictionID=%{public}@", (uint8_t *)&v7, 0x16u);

  }
}

void __61__MessageListSelectionModel___updatePredictionWithSelection___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "ef_isCancelledError"))
  {
    _ef_log_MessageListSelectionModel();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v12 = 138543362;
      v13 = v5;
      v6 = "Mailbox prediction cancelled. predictionID=%{public}@";
LABEL_7:
      _os_log_impl(&dword_1D5522000, v4, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    v7 = objc_msgSend(v3, "em_isItemNotFoundError");
    _ef_log_MessageListSelectionModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v8)
      {
        v9 = *(_QWORD *)(a1 + 32);
        v12 = 138543362;
        v13 = v9;
        v6 = "Mailbox prediction finished with no mailbox found. predictionID=%{public}@";
        goto LABEL_7;
      }
    }
    else if (v8)
    {
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "ef_publicDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_1D5522000, v4, OS_LOG_TYPE_INFO, "Mailbox prediction produced an unexpected error. predictionID=%{public}@ error=%{public}@", (uint8_t *)&v12, 0x16u);

    }
  }

}

- (void)setMailboxPredictionFuture:(id)a3
{
  EFFuture *v4;
  EFFuture *mailboxPredictionFuture;

  v4 = (EFFuture *)a3;
  -[EFFuture cancel](self->_mailboxPredictionFuture, "cancel");
  mailboxPredictionFuture = self->_mailboxPredictionFuture;
  self->_mailboxPredictionFuture = v4;

}

- (void)preserveSelection
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  -[MessageListSelectionModel restoreSelectionCancelable](self, "restoreSelectionCancelable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "cancel");
  -[MessageListSelectionModel setShouldRestoreSelection:](self, "setShouldRestoreSelection:", 1);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)-[MessageListSelectionModel preserveSelectionTimeout](self, "preserveSelectionTimeout");
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __46__MessageListSelectionModel_preserveSelection__block_invoke;
  v11 = &unk_1E99E1328;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "afterDelay:performBlock:", &v8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListSelectionModel setRestoreSelectionCancelable:](self, "setRestoreSelectionCancelable:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __46__MessageListSelectionModel_preserveSelection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShouldRestoreSelection:", 0);

}

- (int64_t)preserveSelectionTimeout
{
  return 30;
}

- (void)enableSelectAllWithMailboxes:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MessageListSelectionModel clearAll](self, "clearAll");
  v5 = (void *)objc_msgSend(v4, "copy");

  -[MessageListSelectionModel setTrackedMailboxes:](self, "setTrackedMailboxes:", v5);
  -[MessageListSelectionModel setType:](self, "setType:", 1);
}

- (void)disableSelectAll
{
  -[MessageListSelectionModel clearAll](self, "clearAll");
  -[MessageListSelectionModel setTrackedMailboxes:](self, "setTrackedMailboxes:", 0);
  -[MessageListSelectionModel setType:](self, "setType:", 0);
}

- (NSString)ef_publicDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListSelectionModel trackedItems](self, "trackedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[MessageListSelectionModel trackedItems](self, "trackedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[MessageListSelectionModel trackedMailboxes](self, "trackedMailboxes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> itemIDs:%ld, messageListItems:%ld, mailboxes:%ld, isSelectAll:%{BOOL}d"), v5, self, v7, v9, objc_msgSend(v10, "count"), -[MessageListSelectionModel isSelectAll](self, "isSelectAll"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)shouldRestoreSelection
{
  return self->_shouldRestoreSelection;
}

- (void)setShouldRestoreSelection:(BOOL)a3
{
  self->_shouldRestoreSelection = a3;
}

- (BOOL)isMultipleSelectionActive
{
  return self->_multipleSelectionActive;
}

- (NSMutableSet)itemsToDeselectAfterMultipleSelection
{
  return self->_itemsToDeselectAfterMultipleSelection;
}

- (BOOL)isPerformingDataSourceUpdates
{
  return self->_performingDataSourceUpdates;
}

- (MessageListSelectionModelDataSource)dataSource
{
  return (MessageListSelectionModelDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (MessageListSelectionModelDelegate)delegate
{
  return (MessageListSelectionModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TrackedMessageListItems)trackedItems
{
  return self->_trackedItems;
}

- (void)setTrackedItems:(id)a3
{
  objc_storeStrong((id *)&self->_trackedItems, a3);
}

- (NSMutableSet)itemIDsPendingConfiguration
{
  return self->_itemIDsPendingConfiguration;
}

- (void)setItemIDsPendingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_itemIDsPendingConfiguration, a3);
}

- (NSMutableSet)itemIDsMissingMessageListItem
{
  return self->_itemIDsMissingMessageListItem;
}

- (void)setItemIDsMissingMessageListItem:(id)a3
{
  objc_storeStrong((id *)&self->_itemIDsMissingMessageListItem, a3);
}

- (NSArray)trackedMailboxes
{
  return self->_trackedMailboxes;
}

- (void)setTrackedMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_trackedMailboxes, a3);
}

- (int64_t)trackedItemsCount
{
  return self->_trackedItemsCount;
}

- (void)setTrackedItemsCount:(int64_t)a3
{
  self->_trackedItemsCount = a3;
}

- (int64_t)trackedItemsWillMoveToTrash
{
  return self->_trackedItemsWillMoveToTrash;
}

- (void)setTrackedItemsWillMoveToTrash:(int64_t)a3
{
  self->_trackedItemsWillMoveToTrash = a3;
}

- (int64_t)trackedItemsArchiveByDefault
{
  return self->_trackedItemsArchiveByDefault;
}

- (void)setTrackedItemsArchiveByDefault:(int64_t)a3
{
  self->_trackedItemsArchiveByDefault = a3;
}

- (int64_t)trackedItemsSupportArchiving
{
  return self->_trackedItemsSupportArchiving;
}

- (void)setTrackedItemsSupportArchiving:(int64_t)a3
{
  self->_trackedItemsSupportArchiving = a3;
}

- (EFDebouncer)predictionDebouncer
{
  return self->_predictionDebouncer;
}

- (void)setPredictionDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_predictionDebouncer, a3);
}

- (EFFuture)mailboxPredictionFuture
{
  return self->_mailboxPredictionFuture;
}

- (EFCancelable)restoreSelectionCancelable
{
  return self->_restoreSelectionCancelable;
}

- (void)setRestoreSelectionCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_restoreSelectionCancelable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreSelectionCancelable, 0);
  objc_storeStrong((id *)&self->_mailboxPredictionFuture, 0);
  objc_storeStrong((id *)&self->_predictionDebouncer, 0);
  objc_storeStrong((id *)&self->_trackedMailboxes, 0);
  objc_storeStrong((id *)&self->_itemIDsMissingMessageListItem, 0);
  objc_storeStrong((id *)&self->_itemIDsPendingConfiguration, 0);
  objc_storeStrong((id *)&self->_trackedItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_itemsToDeselectAfterMultipleSelection, 0);
}

void __58__MessageListSelectionModel__fetchMissingMessageListItems__block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "ef_publicDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138543874;
  v11 = v7;
  v12 = 2048;
  v13 = v8;
  v14 = 2114;
  v15 = v9;
  _os_log_error_impl(&dword_1D5522000, a3, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Failed to get message list item: %{public}@", (uint8_t *)&v10, 0x20u);

}

@end
