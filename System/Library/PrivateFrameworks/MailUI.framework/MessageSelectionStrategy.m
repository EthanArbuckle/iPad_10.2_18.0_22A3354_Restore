@implementation MessageSelectionStrategy

- (MessageSelectionStrategy)initWithDataSource:(id)a3
{
  id v4;
  void *v5;
  MessageSelectionStrategy *v6;
  MessageSelectionStrategy *v7;
  MessageSelectionStrategy *v8;
  objc_super v10;

  v4 = a3;
  if (!v4)
    -[MessageSelectionStrategy initWithDataSource:].cold.1();
  v5 = v4;
  v10.receiver = self;
  v10.super_class = (Class)MessageSelectionStrategy;
  v6 = -[MessageSelectionStrategy init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_dataSource, v5);
    v8 = v7;
  }

  return v7;
}

void ___ef_log_MessageSelectionStrategy_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MessageSelectionStrategy");
  v1 = (void *)_ef_log_MessageSelectionStrategy_log;
  _ef_log_MessageSelectionStrategy_log = (uint64_t)v0;

}

- (BOOL)shouldChangeSelectionAfterDeletedMessageItemIDs:(id)a3 selectedItemIDs:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  char v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  MessageSelectionStrategy *v15;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "count");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__MessageSelectionStrategy_shouldChangeSelectionAfterDeletedMessageItemIDs_selectedItemIDs___block_invoke;
  v13[3] = &unk_1E99E1E80;
  v14 = v6;
  v15 = self;
  v9 = v6;
  v10 = objc_msgSend(v7, "ef_any:", v13);

  if (v8)
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

uint64_t __92__MessageSelectionStrategy_shouldChangeSelectionAfterDeletedMessageItemIDs_selectedItemIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  id v7;
  void *v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  v6 = objc_msgSend(WeakRetained, "messageSelectionStrategy:isExpandedThreadWithItemID:", *(_QWORD *)(a1 + 40), v3);

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(v7, "messageSelectionStrategy:indexPathOfItemID:", *(_QWORD *)(a1 + 40), v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      for (i = objc_msgSend(v8, "item") + 1; ; ++i)
      {
        v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
        v11 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, objc_msgSend(v8, "section"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "messageSelectionStrategy:itemIDForIndexPath:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
        LODWORD(v12) = objc_msgSend(v14, "messageSelectionStrategy:anyExpandedThreadContainsItemID:", *(_QWORD *)(a1 + 40), v13);

        if (!(_DWORD)v12)
          break;
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v13) & 1) != 0)
        {
          v4 = 1;
          break;
        }

      }
    }

  }
  return v4;
}

- (id)itemIDToSelectAfterDeletedMessageItemIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t (**v24)(void *, uint64_t);
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  int v41;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  const char *aSelector;
  id obj;
  void *v51;
  void *v53;
  _QWORD aBlock[5];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ef_log_MessageSelectionStrategy();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v60 = v6;
    v61 = 2114;
    v62 = (uint64_t)v4;
    _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);

  }
  objc_msgSend(v4, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  aSelector = a2;
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    v11 = v7;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "messageSelectionStrategy:indexPathOfItemID:", self, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = objc_msgSend(v9, "item");
    else
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    v47 = v9;
    v48 = v4;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v4;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    v51 = v7;
    if (v12)
    {
      v13 = v12;
      v14 = v7;
      v15 = *(_QWORD *)v56;
      v16 = v10;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v56 != v15)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          v19 = objc_loadWeakRetained((id *)&self->_dataSource);
          objc_msgSend(v19, "messageSelectionStrategy:indexPathOfItemID:", self, v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            v21 = objc_msgSend(v20, "item");
            if (v21 > v10)
            {
              v22 = v18;

              v51 = v22;
              v10 = v21;
            }
            if (v21 < v16)
            {
              v23 = v18;

              v14 = v23;
              v16 = v21;
            }
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      }
      while (v13);
    }
    else
    {
      v14 = v7;
    }

    v4 = v48;
    v7 = v51;
    v11 = v14;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__MessageSelectionStrategy_itemIDToSelectAfterDeletedMessageItemIDs___block_invoke;
  aBlock[3] = &unk_1E99E13B0;
  aBlock[4] = self;
  v24 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
  -[MessageSelectionStrategy _itemIDToSelectFromItemID:deletedMessageIDs:withDirection:](self, "_itemIDToSelectFromItemID:deletedMessageIDs:withDirection:", v11, v4, 0xFFFFFFFFLL);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v24[2](v24, v25);
  -[MessageSelectionStrategy _itemIDToSelectFromItemID:deletedMessageIDs:withDirection:](self, "_itemIDToSelectFromItemID:deletedMessageIDs:withDirection:", v7, v4, 1);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v24[2](v24, v27);
  if ((!v25 || v27) && (v25 || !v27))
  {
    if (v26 == v28)
    {
      if (v25 | v27)
      {
        v39 = v11;
        v40 = objc_loadWeakRetained((id *)&self->_dataSource);
        v41 = objc_msgSend(v40, "lastChangeDirectionForMessageSelectionStrategy:", self);

        _ef_log_MessageSelectionStrategy();
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
        if (v41 == 1)
        {
          v11 = v39;
          if (v43)
          {
            NSStringFromSelector(aSelector);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v60 = v44;
            v61 = 2114;
            v62 = v27;
            v63 = 2114;
            v64 = v25;
            v65 = 2114;
            v66 = 0;
            _os_log_impl(&dword_1D5522000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ Last browse direction was explicitly down. Older: %{public}@, Newer: %{public}@, Selected: %{public}@", buf, 0x2Au);

          }
          v45 = (id)v27;
        }
        else
        {
          v11 = v39;
          if (v43)
          {
            NSStringFromSelector(aSelector);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v60 = v46;
            v61 = 2114;
            v62 = v27;
            v63 = 2114;
            v64 = v25;
            v65 = 2114;
            v66 = 0;
            _os_log_impl(&dword_1D5522000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ Last browse directio was up or not defined. Older: %{public}@, Newer: %{public}@, Selected: %{public}@", buf, 0x2Au);

          }
          v45 = (id)v25;
        }
        v31 = v45;
      }
      else
      {
        v31 = 0;
      }
    }
    else
    {
      v53 = v11;
      _ef_log_MessageSelectionStrategy();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(aSelector);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v60 = v37;
        v61 = 2114;
        v62 = v27;
        v63 = 2114;
        v64 = v25;
        v65 = 2114;
        v66 = 0;
        _os_log_impl(&dword_1D5522000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ Only one adjacent message is unread. Older: %{public}@, Newer: %{public}@, Selected: %{public}@", buf, 0x2Au);

      }
      if (v26)
        v38 = (void *)v25;
      else
        v38 = (void *)v27;
      v31 = v38;
      v11 = v53;
    }
  }
  else
  {
    v29 = v11;
    if (v25)
      v30 = (void *)v25;
    else
      v30 = (void *)v27;
    v31 = v30;
    _ef_log_MessageSelectionStrategy();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(aSelector);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v60 = v33;
      v61 = 2114;
      v62 = v27;
      v63 = 2114;
      v64 = v25;
      v65 = 2114;
      v66 = v31;
      _os_log_impl(&dword_1D5522000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ One of the adjacent messages does not exist. Older: %{public}@, Newer: %{public}@, Selected: %{public}@", buf, 0x2Au);

    }
    v11 = v29;
  }
  v34 = v31;

  return v34;
}

uint64_t __69__MessageSelectionStrategy_itemIDToSelectAfterDeletedMessageItemIDs___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;

  if (!a2)
    return 0;
  v3 = (id *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "messageSelectionStrategy:messageListItemForItemID:", *(_QWORD *)(a1 + 32), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "flags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "read") ^ 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)itemIDToSelectFromItemID:(id)a3 withDirection:(int)a4
{
  return -[MessageSelectionStrategy _itemIDToSelectFromItemID:deletedMessageIDs:withDirection:](self, "_itemIDToSelectFromItemID:deletedMessageIDs:withDirection:", a3, 0, *(_QWORD *)&a4);
}

- (id)_itemIDToSelectFromItemID:(id)a3 deletedMessageIDs:(id)a4 withDirection:(int)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void (**v20)(void *, void *);
  void *v21;
  id v22;
  int v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  BOOL v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  _QWORD aBlock[5];
  uint8_t buf[4];
  id v43;
  __int16 v44;
  int v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v13 = 0;
    goto LABEL_39;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "messageSelectionStrategy:indexPathOfItemID:", self, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = objc_msgSend(v11, "item");
  else
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  _ef_log_MessageSelectionStrategy();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v43 = v8;
    v44 = 1024;
    v45 = a5;
    v46 = 2048;
    v47 = v12;
    _os_log_debug_impl(&dword_1D5522000, v14, OS_LOG_TYPE_DEBUG, "_itemIDToSelectFromItemID:%{public}@ direction:%i startIndex:%li", buf, 0x1Cu);
  }

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v15, "indexPathOfSelectedMessageForMessageSelectionStrategy:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v12 = objc_msgSend(v16, "item");
      v17 = 0;
      v11 = v16;
    }
    else
    {
      v18 = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(v18, "indexPathOfPreviouslySelectedMessageForMessageSelectionStrategy:", self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v12 = objc_msgSend(v11, "item");
      else
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      _ef_log_MessageSelectionStrategy();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[MessageSelectionStrategy _itemIDToSelectFromItemID:deletedMessageIDs:withDirection:].cold.2((uint64_t)v8, v12, v19);

      v17 = 1;
    }
  }
  else
  {
    v17 = 0;
  }
  if (a5 != 1)
  {
    v22 = objc_loadWeakRetained((id *)&self->_dataSource);
    v23 = objc_msgSend(v22, "messageSelectionStrategy:anyExpandedThreadContainsItemID:", self, v8);

    if (v23)
    {
      v24 = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(v24, "messageSelectionStrategy:indexPathOfItemID:", self, v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v26 = objc_loadWeakRetained((id *)&self->_dataSource);
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v25, "item") - 1, objc_msgSend(v25, "section"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "messageSelectionStrategy:itemIDForIndexPath:", self, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = objc_loadWeakRetained((id *)&self->_dataSource);
          objc_msgSend(v29, "messageSelectionStrategy:anyExpandedThreadContainsItemID:", self, v28);

        }
      }

    }
    v30 = v12 < 1;
    v31 = v12 - 1;
    if (v30)
    {
      v13 = 0;
    }
    else
    {
      v32 = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v31, objc_msgSend(v11, "section"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "messageSelectionStrategy:itemIDForIndexPath:", self, v33);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_36;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__MessageSelectionStrategy__itemIDToSelectFromItemID_deletedMessageIDs_withDirection___block_invoke;
  aBlock[3] = &unk_1E99E20C8;
  aBlock[4] = self;
  v20 = (void (**)(void *, void *))_Block_copy(aBlock);
  if ((v17 & 1) == 0)
  {
    v34 = objc_loadWeakRetained((id *)&self->_dataSource);
    v35 = objc_msgSend(v34, "numberOfItemsForMessageSelectionStrategy:", self) - 1;

    if (v12 < v35)
    {
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", ++v12, objc_msgSend(v11, "section"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v20[2](v20, v36);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v9, "containsObject:", v13))
          goto LABEL_34;

        v37 = objc_loadWeakRetained((id *)&self->_dataSource);
        v38 = objc_msgSend(v37, "numberOfItemsForMessageSelectionStrategy:", self) - 1;

        if (v12 >= v38)
          goto LABEL_33;
      }
    }
    goto LABEL_33;
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_33:
    v13 = 0;
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v12, objc_msgSend(v11, "section"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v20, v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
LABEL_36:
  _ef_log_MessageSelectionStrategy();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    -[MessageSelectionStrategy _itemIDToSelectFromItemID:deletedMessageIDs:withDirection:].cold.1((uint64_t)v8, (uint64_t)v13, v39);

LABEL_39:
  return v13;
}

id __86__MessageSelectionStrategy__itemIDToSelectFromItemID_deletedMessageIDs_withDirection___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "messageSelectionStrategy:itemIDForIndexPath:", *(_QWORD *)(a1 + 32), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MessageSelectionStrategyDataSource)dataSource
{
  return (MessageSelectionStrategyDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)initWithDataSource:.cold.1()
{
  __assert_rtn("-[MessageSelectionStrategy initWithDataSource:]", "MessageSelectionStrategy.m", 24, "nil != dataSource");
}

- (void)_itemIDToSelectFromItemID:(uint64_t)a1 deletedMessageIDs:(uint64_t)a2 withDirection:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_2(&dword_1D5522000, a2, a3, "_itemIDToSelectFromItemID:%{public}@ result:%{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

- (void)_itemIDToSelectFromItemID:(uint64_t)a1 deletedMessageIDs:(uint64_t)a2 withDirection:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_2(&dword_1D5522000, a2, a3, "_itemIDToSelectFromItemID:%{public}@ message was deleted. Get the index of where it should have been startIndex:%li", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

@end
