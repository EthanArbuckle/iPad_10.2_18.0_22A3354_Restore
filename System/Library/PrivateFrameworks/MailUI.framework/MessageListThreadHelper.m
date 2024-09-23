@implementation MessageListThreadHelper

- (int64_t)styleForMessageListItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  objc_msgSend(v4, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MessageListItemHelper delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "count") <= 1)
    {
      if (objc_msgSend(v6, "messageListItemHelper:anyExpandedThreadContainsItemID:", self, v5))
        v7 = 2;
      else
        v7 = 0;
    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)needsFlushSeparatorForItemID:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[MessageListItemHelper delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "messageListItemHelper:anyExpandedThreadContainsItemID:", self, v6))
      v9 = -[MessageListItemHelper _isNextItemLastExpandedItemID:snapshot:](self, "_isNextItemLastExpandedItemID:snapshot:", v6, v7);
    else
      v9 = -[MessageListThreadHelper _isNextItemAnExpandedThreadItemID:snapshot:](self, "_isNextItemAnExpandedThreadItemID:snapshot:", v6, v7);
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_isNextItemAnExpandedThreadItemID:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;

  v6 = a3;
  -[MessageListItemHelper itemIDAfterItemID:snapshot:](self, "itemIDAfterItemID:snapshot:", v6, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v7 && v7 != v6)
  {
    -[MessageListItemHelper delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "messageListItemHelper:isItemIDExpandedThread:", self, v7);

  }
  return v8;
}

- (MessageListThreadHelper)initWithDelegate:(id)a3
{
  MessageListThreadHelper *v3;
  NSMutableSet *v4;
  NSMutableSet *collapsingItemIDs;
  NSMutableSet *v6;
  NSMutableSet *expandingItemIDs;
  NSMutableSet *v8;
  NSMutableSet *itemIDsNeedingReloadPostUpdate;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MessageListThreadHelper;
  v3 = -[MessageListItemHelper initWithDelegate:](&v11, sel_initWithDelegate_, a3);
  if (v3)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    collapsingItemIDs = v3->_collapsingItemIDs;
    v3->_collapsingItemIDs = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    expandingItemIDs = v3->_expandingItemIDs;
    v3->_expandingItemIDs = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    itemIDsNeedingReloadPostUpdate = v3->_itemIDsNeedingReloadPostUpdate;
    v3->_itemIDsNeedingReloadPostUpdate = v8;

    v3->_itemIDsNeedingReloadLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (id)popItemIDsNeedingReloadPostUpdate
{
  os_unfair_lock_s *p_itemIDsNeedingReloadLock;
  void *v4;
  void *v5;
  void *v6;

  p_itemIDsNeedingReloadLock = &self->_itemIDsNeedingReloadLock;
  os_unfair_lock_lock(&self->_itemIDsNeedingReloadLock);
  -[MessageListThreadHelper itemIDsNeedingReloadPostUpdate](self, "itemIDsNeedingReloadPostUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MessageListThreadHelper itemIDsNeedingReloadPostUpdate](self, "itemIDsNeedingReloadPostUpdate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  os_unfair_lock_unlock(p_itemIDsNeedingReloadLock);
  return v5;
}

- (NSMutableSet)itemIDsNeedingReloadPostUpdate
{
  return self->_itemIDsNeedingReloadPostUpdate;
}

- (BOOL)isThreadExpandingWithItemID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MessageListThreadHelper expandingItemIDs](self, "expandingItemIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSMutableSet)expandingItemIDs
{
  return self->_expandingItemIDs;
}

- (void)collapseMessageListItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[MessageListThreadHelper collapsingItemIDs](self, "collapsingItemIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v8.receiver = self;
  v8.super_class = (Class)MessageListThreadHelper;
  -[MessageListItemHelper delegate](&v8, sel_delegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageListThreadHelper:didCollapseMessageListItem:", self, v4);

}

- (void)expandMessageListItem:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MessageListThreadHelper;
  v4 = a3;
  -[MessageListItemHelper delegate](&v6, sel_delegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageListThreadHelper:didExpandMessageListItem:", self, v4, v6.receiver, v6.super_class);

}

- (id)collapsingOrExpandingItemIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MessageListThreadHelper;
  -[MessageListItemHelper delegate](&v8, sel_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListThreadHelper collapsingItemIDs](self, "collapsingItemIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expandedThreadItemIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)itemIDsForReloadAfterInsertingItemsAfterItemID:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[MessageListThreadHelper collapsingOrExpandingItemIDs](self, "collapsingOrExpandingItemIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if (v9)
  {
    -[MessageListThreadHelper collapsingItemIDs](self, "collapsingItemIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v6);

    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v11, "addObject:", v6);
    -[MessageListItemHelper itemIDBeforeItemID:snapshot:](self, "itemIDBeforeItemID:snapshot:", v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && (objc_msgSend(v12, "isEqual:", v6) & 1) == 0)
      objc_msgSend(v11, "addObject:", v13);

  }
  else
  {
    v11 = (id)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (id)itemIDsForReloadAfterDeletingItemIDs:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  uint64_t v18;
  id v19;
  BOOL v20;
  id v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  MessageListThreadHelper *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MessageListThreadHelper collapsingOrExpandingItemIDs](self, "collapsingOrExpandingItemIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[MessageListItemHelper delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __73__MessageListThreadHelper_itemIDsForReloadAfterDeletingItemIDs_snapshot___block_invoke;
    v33[3] = &unk_1E99E1E80;
    v10 = v9;
    v34 = v10;
    v35 = self;
    objc_msgSend(v6, "ef_filter:", v33);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v26 = v10;
      v27 = v6;
      v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v25 = v11;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v30 != v15)
              objc_enumerationMutation(v12);
            v17 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * i);
            -[MessageListItemHelper itemIDBeforeItemID:snapshot:](self, "itemIDBeforeItemID:snapshot:", v17, v7, v25);
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = (id)v18;
            if (v18)
              v20 = v18 == (_QWORD)v17;
            else
              v20 = 1;
            if (!v20)
            {
              while (!objc_msgSend(v8, "containsObject:", v19))
              {
                v21 = v19;
                -[MessageListItemHelper itemIDBeforeItemID:snapshot:](self, "itemIDBeforeItemID:snapshot:", v21, v7);
                v19 = (id)objc_claimAutoreleasedReturnValue();

                if (v19 == v21)
                  goto LABEL_19;
                if (!v19 || v19 == v17)
                  goto LABEL_20;
              }
              objc_msgSend(v28, "addObject:", v19);
              -[MessageListItemHelper itemIDBeforeItemID:snapshot:](self, "itemIDBeforeItemID:snapshot:", v19, v7);
              v21 = (id)objc_claimAutoreleasedReturnValue();

              if (v21)
                objc_msgSend(v28, "addObject:", v21);
LABEL_19:

              v19 = 0;
            }
LABEL_20:

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
        }
        while (v14);
      }

      -[MessageListThreadHelper collapsingItemIDs](self, "collapsingItemIDs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "minusSet:", v28);

      objc_msgSend(v28, "allObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v26;
      v6 = v27;
      v11 = v25;
    }
    else
    {
      v23 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v23;
}

uint64_t __73__MessageListThreadHelper_itemIDsForReloadAfterDeletingItemIDs_snapshot___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "messageListItemHelper:anyExpandedThreadContainsItemID:", *(_QWORD *)(a1 + 40), a2);
}

- (void)addItemIDsNeedingReloadPostUpdate:(id)a3
{
  os_unfair_lock_s *p_itemIDsNeedingReloadLock;
  void *v5;
  id v6;

  v6 = a3;
  p_itemIDsNeedingReloadLock = &self->_itemIDsNeedingReloadLock;
  os_unfair_lock_lock(&self->_itemIDsNeedingReloadLock);
  -[MessageListThreadHelper itemIDsNeedingReloadPostUpdate](self, "itemIDsNeedingReloadPostUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  os_unfair_lock_unlock(p_itemIDsNeedingReloadLock);
}

- (id)itemIDsInExpandedThread:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[MessageListItemHelper delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "messageListItemHelper:isItemIDExpandedThread:", self, v6))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    while (1)
    {
      -[MessageListItemHelper itemIDAfterItemID:snapshot:](self, "itemIDAfterItemID:snapshot:", v6, v7);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10 || v10 == v6)
        break;
      v11 = v6;
      v6 = v10;

      if (!objc_msgSend(v8, "messageListItemHelper:anyExpandedThreadContainsItemID:", self, v6))
      {
        v10 = v6;
        break;
      }
      objc_msgSend(v9, "addObject:", v6);

    }
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (id)threadItemIDForItemInExpandedThread:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  -[MessageListItemHelper delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "messageListItemHelper:isItemIDExpandedThread:", self, v6) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    -[MessageListItemHelper itemIDBeforeItemID:snapshot:](self, "itemIDBeforeItemID:snapshot:", v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (!v10 || v10 == v6)
    {
      v11 = v6;
    }
    else
    {
      while (1)
      {
        v11 = v10;
        if (objc_msgSend(v8, "messageListItemHelper:isItemIDExpandedThread:", self, v10))
          break;

        -[MessageListItemHelper itemIDBeforeItemID:snapshot:](self, "itemIDBeforeItemID:snapshot:", v11, v7);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        if (v10)
        {
          v6 = v11;
          if (v10 != v11)
            continue;
        }
        goto LABEL_11;
      }
      v10 = v11;
      v11 = v6;
      v9 = v10;
    }
LABEL_11:

    v6 = v11;
  }

  return v9;
}

- (BOOL)_isNextItemAnExpandedItemID:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;

  v6 = a3;
  -[MessageListItemHelper itemIDAfterItemID:snapshot:](self, "itemIDAfterItemID:snapshot:", v6, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v7 && v7 != v6)
  {
    -[MessageListItemHelper delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "messageListItemHelper:isItemIDExpandedThread:", self, v7);

  }
  return v8;
}

- (void)addExpandingThreadWithItemID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MessageListThreadHelper expandingItemIDs](self, "expandingItemIDs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeExpandingThreadWithItemID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MessageListThreadHelper expandingItemIDs](self, "expandingItemIDs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (NSMutableSet)collapsingItemIDs
{
  return self->_collapsingItemIDs;
}

- (void)setCollapsingItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_collapsingItemIDs, a3);
}

- (void)setExpandingItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_expandingItemIDs, a3);
}

- (void)setItemIDsNeedingReloadPostUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_itemIDsNeedingReloadPostUpdate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIDsNeedingReloadPostUpdate, 0);
  objc_storeStrong((id *)&self->_expandingItemIDs, 0);
  objc_storeStrong((id *)&self->_collapsingItemIDs, 0);
}

@end
