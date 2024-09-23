@implementation SGSuggestionStore

- (SGSuggestionStore)init
{
  SGSuggestionStore *v2;
  SGSuggestionStore *v3;
  uint64_t v4;
  NSMutableArray *suggestions;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SGSuggestionStore;
  v2 = -[SGList init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SGList setDelegate:](v2, "setDelegate:", v2);
    v4 = objc_opt_new();
    suggestions = v3->_suggestions;
    v3->_suggestions = (NSMutableArray *)v4;

    v3->_hostApp = 2;
  }
  return v3;
}

- (id)sectionWithItem:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend(a3, "suggestionCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionCategoryId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SGList count](self, "count"))
  {
    v6 = 0;
    while (1)
    {
      -[SGList itemAtIndex:](self, "itemAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "category");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "suggestionCategoryId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v5, "isEqual:", v9);

      if ((v10 & 1) != 0)
        break;

      if (++v6 >= -[SGList count](self, "count"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = 0;
  }

  return v7;
}

- (void)addSuggestion:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSMutableArray *v7;
  NSMutableArray *suggestions;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[SGSuggestionStore sectionWithItem:](self, "sectionWithItem:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v6 = v11;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setDelegate:", self);
    objc_msgSend(v5, "addItem:", v11);
    v4 = self;
    v6 = v5;
  }
  objc_msgSend(v4, "addItem:", v6);
  if (!self->_suggestions)
  {
    v7 = (NSMutableArray *)objc_opt_new();
    suggestions = self->_suggestions;
    self->_suggestions = v7;

  }
  -[SGSuggestionStore suggestionDelegate](self, "suggestionDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SGSuggestionStore suggestionDelegate](self, "suggestionDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSuggestionDelegate:", v10);

  }
}

- (void)removeSuggestion:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SGSuggestionStore sectionWithItem:](self, "sectionWithItem:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "removeItem:", v6);
    if (!objc_msgSend(v5, "count"))
      -[SGList removeItem:](self, "removeItem:", v5);
  }
  objc_msgSend(v6, "setSuggestionDelegate:", 0);

}

- (void)dismissAllSuggestions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SGSuggestionStore lockNotifications](self, "lockNotifications");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)-[NSMutableArray copy](self->_suggestions, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "setSuggestionDelegate:", 0);
        objc_msgSend(v8, "suggestionDismissAction");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "execute");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[SGList removeAllItems](self, "removeAllItems");
  -[SGSuggestionStore unlockNotifications](self, "unlockNotifications");
}

- (void)updateSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[3];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SGSuggestionStore sectionWithItem:](self, "sectionWithItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "indexOfItem:", v4);
    v8 = -[NSMutableArray indexOfObject:](self->_suggestions, "indexOfObject:", v4);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v8;
      sgLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349312;
        v19 = v7;
        v20 = 2050;
        v21 = v10;
        _os_log_debug_impl(&dword_1B1170000, v11, OS_LOG_TYPE_DEBUG, "SGSuggestionStore: Updated notification sent out for :(%{public}lu, %{public}lu) index", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7, CFSTR("SGListNotificationKeyItemUpdated"), CFSTR("SGListNotificationKeyItemIndex"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v13;
      v16[2] = CFSTR("SGListNotificationKeyItemGlobalIndex");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("com.apple.coresuggestionsui.SGListDidChangeNotification"), v6, v15);

    }
  }

}

- (void)setSuggestions:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SGSuggestionStore lockNotifications](self, "lockNotifications");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_suggestions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9++), "setSuggestionDelegate:", 0);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  -[SGList removeAllItems](self, "removeAllItems");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
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
        -[SGSuggestionStore addSuggestion:](self, "addSuggestion:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  -[SGSuggestionStore unlockNotifications](self, "unlockNotifications");
}

- (NSArray)suggestions
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_suggestions, "copy");
}

- (int64_t)hostApp
{
  int64_t result;
  void *v4;
  void *v5;
  int64_t v6;

  result = self->_hostApp;
  if (result == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D19A28]) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D19A38]))
      {
LABEL_7:

        return self->_hostApp;
      }
      v6 = 1;
    }
    self->_hostApp = v6;
    goto LABEL_7;
  }
  return result;
}

- (void)lockNotifications
{
  int64_t notificationsLockCount;

  notificationsLockCount = self->_notificationsLockCount;
  self->_notificationsLockCount = notificationsLockCount + 1;
  if (!notificationsLockCount)
    self->_modified = 0;
}

- (void)unlockNotifications
{
  int64_t notificationsLockCount;
  BOOL v3;
  BOOL v4;
  int64_t v5;
  void *v7;
  char v8;
  id v9;

  notificationsLockCount = self->_notificationsLockCount;
  v3 = notificationsLockCount == 1;
  v4 = notificationsLockCount < 1;
  v5 = notificationsLockCount - 1;
  if (!v4)
  {
    self->_notificationsLockCount = v5;
    if (v3 && self->_modified)
    {
      -[SGList delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[SGList delegate](self, "delegate");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "suggestionsStoreChanged:", self);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("com.apple.coresuggestionsui.SGListDidChangeNotification"), self, 0);
      }

    }
  }
}

- (void)list:(id)a3 didAddItem:(id)a4 atIndex:(unint64_t)a5
{
  SGSuggestionStore *v8;
  id v9;
  void *v10;
  NSMutableArray *suggestions;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];
  _QWORD v27[3];
  _QWORD v28[3];
  uint8_t buf[4];
  unint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = (SGSuggestionStore *)a3;
  v9 = a4;
  if (self->_notificationsLockCount)
  {
    if (v8 != self)
    {
      -[NSMutableArray addObject:](self->_suggestions, "addObject:", v9);
      -[SGList comparator](v8, "comparator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        suggestions = self->_suggestions;
        -[SGList comparator](v8, "comparator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray sortUsingComparator:](suggestions, "sortUsingComparator:", v12);

      }
    }
    self->_modified = 1;
  }
  else
  {
    if (v8 == self)
    {
      sgLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349056;
        v30 = a5;
        _os_log_debug_impl(&dword_1B1170000, v23, OS_LOG_TYPE_DEBUG, "SGSuggestionStore: Added notification sent out for index (%{public}lu)", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5, CFSTR("SGListNotificationKeyItemAdded"), CFSTR("SGListNotificationKeyItemIndex"), v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("com.apple.coresuggestionsui.SGListDidChangeNotification"), self, v24);

    }
    else
    {
      -[NSMutableArray addObject:](self->_suggestions, "addObject:", v9);
      -[SGList comparator](v8, "comparator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = self->_suggestions;
        -[SGList comparator](v8, "comparator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray sortUsingComparator:](v14, "sortUsingComparator:", v15);

      }
      v16 = -[NSMutableArray indexOfObject:](self->_suggestions, "indexOfObject:", v9);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        __assert_rtn("-[SGSuggestionStore list:didAddItem:atIndex:]", "SGSuggestionStore.m", 249, "globalIndex!=NSNotFound");
      v17 = v16;
      sgLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349312;
        v30 = a5;
        v31 = 2050;
        v32 = v17;
        _os_log_debug_impl(&dword_1B1170000, v18, OS_LOG_TYPE_DEBUG, "SGSuggestionStore: Added notification sent out for :(%{public}lu, %{public}lu) index", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v9;
      v27[0] = CFSTR("SGListNotificationKeyItemAdded");
      v27[1] = CFSTR("SGListNotificationKeyItemIndex");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v20;
      v27[2] = CFSTR("SGListNotificationKeyItemGlobalIndex");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("com.apple.coresuggestionsui.SGListDidChangeNotification"), v8, v22);

    }
  }

}

- (void)list:(id)a3 didRemoveItem:(id)a4 atIndex:(unint64_t)a5
{
  SGSuggestionStore *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[3];
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = (SGSuggestionStore *)a3;
  v9 = a4;
  if (self->_notificationsLockCount)
  {
    if (v8 != self)
      -[NSMutableArray removeObject:](self->_suggestions, "removeObject:", v9);
    self->_modified = 1;
  }
  else if (v8 == self)
  {
    sgLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v26 = a5;
      _os_log_debug_impl(&dword_1B1170000, v17, OS_LOG_TYPE_DEBUG, "SGSuggestionStore: Removed notification sent out for index:(%{public}lu)", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5, CFSTR("SGListNotificationKeyItemRemoved"), CFSTR("SGListNotificationKeyItemIndex"), v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("com.apple.coresuggestionsui.SGListDidChangeNotification"), self, v20);

  }
  else
  {
    v10 = -[NSMutableArray indexOfObject:](self->_suggestions, "indexOfObject:", v9);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      __assert_rtn("-[SGSuggestionStore list:didRemoveItem:atIndex:]", "SGSuggestionStore.m", 282, "globalIndex!=NSNotFound");
    v11 = v10;
    -[NSMutableArray removeObject:](self->_suggestions, "removeObject:", v9);
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349312;
      v26 = a5;
      v27 = 2050;
      v28 = v11;
      _os_log_debug_impl(&dword_1B1170000, v12, OS_LOG_TYPE_DEBUG, "SGSuggestionStore: Removed notification sent out for index:(%{public}lu, %{public}lu)", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v9;
    v23[0] = CFSTR("SGListNotificationKeyItemRemoved");
    v23[1] = CFSTR("SGListNotificationKeyItemIndex");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v14;
    v23[2] = CFSTR("SGListNotificationKeyItemGlobalIndex");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("com.apple.coresuggestionsui.SGListDidChangeNotification"), v8, v16);

  }
}

- (SGSuggestionDelegate)suggestionDelegate
{
  return (SGSuggestionDelegate *)objc_loadWeakRetained((id *)&self->_suggestionDelegate);
}

- (void)setSuggestionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_suggestionDelegate, a3);
}

- (void)setHostApp:(int64_t)a3
{
  self->_hostApp = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionDelegate);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
