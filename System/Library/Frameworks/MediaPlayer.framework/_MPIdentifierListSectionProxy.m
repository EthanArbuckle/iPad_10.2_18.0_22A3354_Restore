@implementation _MPIdentifierListSectionProxy

- (_MPIdentifierListSectionProxy)initWithSection:(id)a3 sectionedIdentifierList:(id)a4 existingItemIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  _MPIdentifierListSectionProxy *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *sectionIdentifier;
  uint64_t v18;
  NSMutableArray *mutableItemIdentifiers;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_MPIdentifierListSectionProxy;
  v11 = -[_MPIdentifierListSectionProxy init](&v21, sel_init);
  if (v11)
  {
    v12 = os_log_create("com.apple.amp.mediaplayer", "SIL");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "count");
      objc_msgSend(v10, "msv_compactDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v8;
      v24 = 2114;
      v25 = v13;
      v26 = 2048;
      v27 = v14;
      v28 = 2114;
      v29 = v15;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] init | [] sil=%{public}@ items=(:%lld)[%{public}@]", buf, 0x2Au);

    }
    v16 = objc_msgSend(v8, "copy");
    sectionIdentifier = v11->_sectionIdentifier;
    v11->_sectionIdentifier = (NSString *)v16;

    objc_storeWeak((id *)&v11->_sectionedIdentifierList, v9);
    v18 = objc_msgSend(v10, "mutableCopy");
    mutableItemIdentifiers = v11->_mutableItemIdentifiers;
    v11->_mutableItemIdentifiers = (NSMutableArray *)v18;

  }
  return v11;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSArray)itemIdentifiers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableItemIdentifiers, "copy");
}

- (void)applyChanges:(id)a3 itemLookupBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *WeakRetained;
  NSObject *v9;
  NSString *sectionIdentifier;
  NSMutableArray *mutableItemIdentifiers;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  NSMutableArray *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSString *v25;
  NSString *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;
  _MPIdentifierListSectionProxy *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  NSString *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "hasChanges") & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
    v9 = os_log_create("com.apple.amp.mediaplayer", "SIL");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      sectionIdentifier = self->_sectionIdentifier;
      *(_DWORD *)buf = 138543618;
      v36 = sectionIdentifier;
      v37 = 2114;
      v38 = v6;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] applyChanges:… | begin transaction [] changes=%{public}@", buf, 0x16u);
    }

    -[NSObject dataSourceBeginTransactionForSection:](WeakRetained, "dataSourceBeginTransactionForSection:", self->_sectionIdentifier);
    mutableItemIdentifiers = self->_mutableItemIdentifiers;
    objc_msgSend(v6, "updatedIndexes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectsAtIndexes:](mutableItemIdentifiers, "objectsAtIndexes:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __62___MPIdentifierListSectionProxy_applyChanges_itemLookupBlock___block_invoke;
    v30[3] = &unk_1E315E408;
    v17 = v15;
    v31 = v17;
    v32 = self;
    v18 = v7;
    v34 = v18;
    v19 = v14;
    v33 = v19;
    objc_msgSend(v6, "enumerateMovesUsingBlock:", v30);
    if (objc_msgSend(v19, "count"))
      -[_MPIdentifierListSectionProxy updateItems:](self, "updateItems:", v19);
    v20 = self->_mutableItemIdentifiers;
    objc_msgSend(v6, "deletedIndexes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectsAtIndexes:](v20, "objectsAtIndexes:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "insertedIndexes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = __62___MPIdentifierListSectionProxy_applyChanges_itemLookupBlock___block_invoke_2;
    v28[3] = &unk_1E315E430;
    v28[4] = self;
    v29 = v18;
    objc_msgSend(v23, "enumerateRangesUsingBlock:", v28);

    v27[0] = v16;
    v27[1] = 3221225472;
    v27[2] = __62___MPIdentifierListSectionProxy_applyChanges_itemLookupBlock___block_invoke_3;
    v27[3] = &unk_1E315F2B0;
    v27[4] = self;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v27);
    if (objc_msgSend(v22, "count"))
      -[_MPIdentifierListSectionProxy removeItems:](self, "removeItems:", v22);
    -[NSObject dataSourceEndTransactionForSection:](WeakRetained, "dataSourceEndTransactionForSection:", self->_sectionIdentifier);
    v24 = os_log_create("com.apple.amp.mediaplayer", "SIL");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = self->_sectionIdentifier;
      *(_DWORD *)buf = 138543618;
      v36 = v25;
      v37 = 2114;
      v38 = v6;
      _os_log_impl(&dword_193B9B000, v24, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] applyChanges:… | end transaction [] changes=%{public}@", buf, 0x16u);
    }

  }
  else
  {
    WeakRetained = os_log_create("com.apple.amp.mediaplayer", "SIL");
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      v26 = self->_sectionIdentifier;
      *(_DWORD *)buf = 138543618;
      v36 = v26;
      v37 = 2114;
      v38 = v6;
      _os_log_impl(&dword_193B9B000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] applyChanges:… | ignoring [no changes] changes=%{public}@", buf, 0x16u);
    }
  }

}

- (void)insertItemsAtHead:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *sectionIdentifier;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  NSMutableArray *mutableItemIdentifiers;
  void *v11;
  int v12;
  NSString *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    v7 = objc_msgSend(v4, "count");
    objc_msgSend(v4, "msv_compactDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = sectionIdentifier;
    v14 = 2048;
    v15 = v7;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] insertItemsAtHead:(:%lld)[%{public}@]", (uint8_t *)&v12, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  objc_msgSend(WeakRetained, "dataSourceInsertItemsAtHead:inSection:", v4, self->_sectionIdentifier);

  mutableItemIdentifiers = self->_mutableItemIdentifiers;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v4, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObjects:atIndexes:](mutableItemIdentifiers, "insertObjects:atIndexes:", v4, v11);

}

- (void)insertItems:(id)a3 afterItem:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSString *sectionIdentifier;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  NSMutableArray *mutableItemIdentifiers;
  void *v16;
  void *v17;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    v11 = objc_msgSend(v7, "count");
    objc_msgSend(v7, "msv_compactDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v19 = sectionIdentifier;
    v20 = 2114;
    v21 = v8;
    v22 = 2048;
    v23 = v11;
    v24 = 2114;
    v25 = v12;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] insertItems:… afterItem:%{public}@ | [] items=(:%lld)[%{public}@]", buf, 0x2Au);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  objc_msgSend(WeakRetained, "dataSourceInsertItems:afterItem:inSection:", v7, v8, self->_sectionIdentifier);

  v14 = -[NSMutableArray indexOfObject:](self->_mutableItemIdentifiers, "indexOfObject:", v8);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierList.m"), 1146, CFSTR("Did not find item %@ to insert after."), v8);

  }
  mutableItemIdentifiers = self->_mutableItemIdentifiers;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v14 + 1, objc_msgSend(v7, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObjects:atIndexes:](mutableItemIdentifiers, "insertObjects:atIndexes:", v7, v16);

}

- (void)insertItemsAtTail:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *sectionIdentifier;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  int v10;
  NSString *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    v7 = objc_msgSend(v4, "count");
    objc_msgSend(v4, "msv_compactDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = sectionIdentifier;
    v12 = 2048;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] insertItemsAtTail:(:%lld)[%{public}@]", (uint8_t *)&v10, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  objc_msgSend(WeakRetained, "dataSourceInsertItemsAtTail:inSection:", v4, self->_sectionIdentifier);

  -[NSMutableArray addObjectsFromArray:](self->_mutableItemIdentifiers, "addObjectsFromArray:", v4);
}

- (void)moveItemToHead:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *sectionIdentifier;
  id WeakRetained;
  int v8;
  NSString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    v8 = 138543618;
    v9 = sectionIdentifier;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] moveItemToHead:%{public}@", (uint8_t *)&v8, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  objc_msgSend(WeakRetained, "dataSourceMoveItemToHead:inSection:", v4, self->_sectionIdentifier);

  -[NSMutableArray removeObject:](self->_mutableItemIdentifiers, "removeObject:", v4);
  -[NSMutableArray insertObject:atIndex:](self->_mutableItemIdentifiers, "insertObject:atIndex:", v4, 0);

}

- (void)moveItem:(id)a3 afterItem:(id)a4
{
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  NSString *sectionIdentifier;
  NSString *v13;
  id WeakRetained;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "isEqualToString:", v8);
  v10 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      sectionIdentifier = self->_sectionIdentifier;
      *(_DWORD *)buf = 138543874;
      v18 = sectionIdentifier;
      v19 = 2114;
      v20 = v7;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] moveItem:%{public}@ afterItem:%{public}@ | ignoring [declaration doesn't declare anything]", buf, 0x20u);
    }

  }
  else
  {
    if (v11)
    {
      v13 = self->_sectionIdentifier;
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      v19 = 2114;
      v20 = v7;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] moveItem:%{public}@ afterItem:%{public}@", buf, 0x20u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
    objc_msgSend(WeakRetained, "dataSourceMoveItem:afterItem:inSection:", v7, v8, self->_sectionIdentifier);

    -[NSMutableArray removeObject:](self->_mutableItemIdentifiers, "removeObject:", v7);
    v15 = -[NSMutableArray indexOfObject:](self->_mutableItemIdentifiers, "indexOfObject:", v8);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierList.m"), 1172, CFSTR("Did not find item %@ to move after."), v8);

    }
    -[NSMutableArray insertObject:atIndex:](self->_mutableItemIdentifiers, "insertObject:atIndex:", v7, v15 + 1);
  }

}

- (void)moveItemToTail:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *sectionIdentifier;
  id WeakRetained;
  int v8;
  NSString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    v8 = 138543618;
    v9 = sectionIdentifier;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] moveItemToTail:%{public}@", (uint8_t *)&v8, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  objc_msgSend(WeakRetained, "dataSourceMoveItemToTail:inSection:", v4, self->_sectionIdentifier);

  -[NSMutableArray removeObject:](self->_mutableItemIdentifiers, "removeObject:", v4);
  -[NSMutableArray addObject:](self->_mutableItemIdentifiers, "addObject:", v4);

}

- (void)removeItems:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *sectionIdentifier;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  int v10;
  NSString *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    v7 = objc_msgSend(v4, "count");
    objc_msgSend(v4, "msv_compactDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = sectionIdentifier;
    v12 = 2048;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] removeItems:(:%lld)[%{public}@]", (uint8_t *)&v10, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  objc_msgSend(WeakRetained, "dataSourceRemoveItems:fromSection:", v4, self->_sectionIdentifier);

  -[NSMutableArray removeObjectsInArray:](self->_mutableItemIdentifiers, "removeObjectsInArray:", v4);
}

- (void)updateSection
{
  NSObject *v3;
  NSString *sectionIdentifier;
  id WeakRetained;
  int v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    v6 = 138543362;
    v7 = sectionIdentifier;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] updateSection", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  objc_msgSend(WeakRetained, "dataSourceUpdateSection:", self->_sectionIdentifier);

}

- (void)updateItems:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *sectionIdentifier;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  int v10;
  NSString *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    v7 = objc_msgSend(v4, "count");
    objc_msgSend(v4, "msv_compactDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = sectionIdentifier;
    v12 = 2048;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] updateItems:(:%lld)[%{public}@]", (uint8_t *)&v10, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  objc_msgSend(WeakRetained, "dataSourceReloadItems:inSection:", v4, self->_sectionIdentifier);

}

- (MPSectionedIdentifierList)sectionedIdentifierList
{
  return (MPSectionedIdentifierList *)objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
}

- (NSMutableArray)mutableItemIdentifiers
{
  return self->_mutableItemIdentifiers;
}

- (void)setMutableItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_mutableItemIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableItemIdentifiers, 0);
  objc_destroyWeak((id *)&self->_sectionedIdentifierList);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

@end
