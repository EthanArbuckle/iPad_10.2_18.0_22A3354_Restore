@implementation EDSearchableIndexPendingItem

- (EDSearchableIndexPendingItem)initWithItem:(id)a3
{
  id v5;
  EDSearchableIndexPendingItem *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSMutableArray *items;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EDSearchableIndexPendingItem;
  v6 = -[EDSearchableIndexPendingItem init](&v13, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v5, 0);
    items = v6->_items;
    v6->_items = (NSMutableArray *)v10;

    objc_storeStrong((id *)&v6->_referenceItem, a3);
  }

  return v6;
}

- (void)addItem:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  EDIndexableItem *v9;
  EDIndexableItem *referenceItem;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndexPendingItem identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSearchableIndexPendingItem.m"), 30, CFSTR("Additional items added to a pending item must have the same identifier"));

  }
  -[NSMutableArray ef_insertObject:usingComparator:allowDuplicates:](self->_items, "ef_insertObject:usingComparator:allowDuplicates:", v12, &__block_literal_global_66, 0);
  -[NSMutableArray sortedArrayUsingComparator:](self->_items, "sortedArrayUsingComparator:", &__block_literal_global_6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (EDIndexableItem *)objc_claimAutoreleasedReturnValue();
  referenceItem = self->_referenceItem;
  self->_referenceItem = v9;

}

uint64_t __40__EDSearchableIndexPendingItem_addItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  v6 = +[EDSearchableIndexItem indexingPriorityByIndexingType:](EDSearchableIndexItem, "indexingPriorityByIndexingType:", objc_msgSend(v4, "indexingType"));
  v7 = +[EDSearchableIndexItem indexingPriorityByIndexingType:](EDSearchableIndexItem, "indexingPriorityByIndexingType:", objc_msgSend(v5, "indexingType"));
  if (v7 >= v6)
  {
    if (v7 <= v6)
    {
      v9 = objc_msgSend(v4, "itemInstantiationTime");
      v10 = objc_msgSend(v5, "itemInstantiationTime");
      if (v10 <= v9)
        v11 = 0;
      else
        v11 = -1;
      if (v10 < v9)
        v8 = 1;
      else
        v8 = v11;
    }
    else
    {
      v8 = -1;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t __40__EDSearchableIndexPendingItem_addItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return EDIndexableItemCompare(a2, a3);
}

- (void)addPendingItem:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "items", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[EDSearchableIndexPendingItem addItem:](self, "addItem:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[EDSearchableIndexPendingItem referenceItem](self, "referenceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referenceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = EDIndexableItemCompare(v5, v6);

  return v7;
}

- (unint64_t)estimatedSizeInBytes
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[EDSearchableIndexPendingItem items](self, "items", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v3 += objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "estimatedSizeInBytes");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return v3;
}

- (BOOL)requiresPreprocessing
{
  void *v2;
  char v3;

  -[EDSearchableIndexPendingItem items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ef_any:", &__block_literal_global_8_1);

  return v3;
}

uint64_t __53__EDSearchableIndexPendingItem_requiresPreprocessing__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requiresPreprocessing");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[EDSearchableIndexPendingItem identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[EDSearchableIndexPendingItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (EDIndexableItem)referenceItem
{
  return self->_referenceItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceItem, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
