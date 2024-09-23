@implementation SFCapsuleCollectionViewUpdate

- (void)setSelectedItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  NSIndexSet *indexesOfDeletedItems;
  NSIndexSet *indexesOfInsertedItems;
  BOOL v9;

  if (self->_selectedItemIndexAfterUpdate != a3)
  {
    indexesOfDeletedItems = self->_indexesOfDeletedItems;
    self->_indexesOfDeletedItems = 0;

    indexesOfInsertedItems = self->_indexesOfInsertedItems;
    self->_indexesOfInsertedItems = 0;

    self->_selectedItemIndexAfterUpdate = a3;
    v9 = self->_animated || a4;
    self->_animated = v9;
  }
}

- (int64_t)selectedItemIndexAfterUpdate
{
  return self->_selectedItemIndexAfterUpdate;
}

- (int64_t)selectedItemIndexBeforeUpdate
{
  return self->_selectedItemIndexBeforeUpdate;
}

- (NSArray)itemsBeforeUpdate
{
  return self->_itemsBeforeUpdate;
}

- (NSArray)itemsAfterUpdate
{
  return &self->_itemsAfterUpdate->super;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (NSIndexSet)indexesOfVisibleItemsBeforeUpdate
{
  return self->_indexesOfVisibleItemsBeforeUpdate;
}

- (NSIndexSet)indexesOfDeletedItems
{
  -[SFCapsuleCollectionViewUpdate _calculateIndexesIfNeeded](self, "_calculateIndexesIfNeeded");
  return self->_indexesOfDeletedItems;
}

- (NSIndexSet)indexesOfInsertedItems
{
  -[SFCapsuleCollectionViewUpdate _calculateIndexesIfNeeded](self, "_calculateIndexesIfNeeded");
  return self->_indexesOfInsertedItems;
}

- (void)_calculateIndexesIfNeeded
{
  void *v3;
  void *v4;
  NSArray *itemsBeforeUpdate;
  uint64_t v6;
  NSIndexSet *v7;
  NSIndexSet *indexesOfDeletedItems;
  NSMutableArray *itemsAfterUpdate;
  id v10;
  NSIndexSet *v11;
  NSIndexSet *indexesOfInsertedItems;
  id v13;
  _QWORD v14[4];
  id v15;
  SFCapsuleCollectionViewUpdate *v16;
  _QWORD v17[4];
  id v18;
  SFCapsuleCollectionViewUpdate *v19;

  if (!self->_indexesOfDeletedItems || !self->_indexesOfInsertedItems)
  {
    *(int64x2_t *)&self->_indexBeforeUpdateOfSelectedItemAfterUpdate = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    if (-[NSArray count](self->_itemsBeforeUpdate, "count") < 2)
    {
      v3 = 0;
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_itemsBeforeUpdate, "objectAtIndexedSubscript:", self->_selectedItemIndexBeforeUpdate);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((unint64_t)-[NSMutableArray count](self->_itemsAfterUpdate, "count") < 2)
    {
      v4 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_itemsAfterUpdate, "objectAtIndexedSubscript:", self->_selectedItemIndexAfterUpdate);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    itemsBeforeUpdate = self->_itemsBeforeUpdate;
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__SFCapsuleCollectionViewUpdate__calculateIndexesIfNeeded__block_invoke;
    v17[3] = &unk_1E21E2140;
    v18 = v4;
    v19 = self;
    v13 = v4;
    -[NSArray indexesOfObjectsPassingTest:](itemsBeforeUpdate, "indexesOfObjectsPassingTest:", v17);
    v7 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    indexesOfDeletedItems = self->_indexesOfDeletedItems;
    self->_indexesOfDeletedItems = v7;

    itemsAfterUpdate = self->_itemsAfterUpdate;
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __58__SFCapsuleCollectionViewUpdate__calculateIndexesIfNeeded__block_invoke_2;
    v14[3] = &unk_1E21E2140;
    v15 = v3;
    v16 = self;
    v10 = v3;
    -[NSMutableArray indexesOfObjectsPassingTest:](itemsAfterUpdate, "indexesOfObjectsPassingTest:", v14);
    v11 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    indexesOfInsertedItems = self->_indexesOfInsertedItems;
    self->_indexesOfInsertedItems = v11;

  }
}

- (int64_t)indexAfterUpdateOfSelectedItemBeforeUpdate
{
  -[SFCapsuleCollectionViewUpdate _calculateIndexesIfNeeded](self, "_calculateIndexesIfNeeded");
  return self->_indexAfterUpdateOfSelectedItemBeforeUpdate;
}

- (SFCapsuleCollectionViewUpdate)initWithCollectionView:(id)a3
{
  id v4;
  SFCapsuleCollectionViewUpdate *v5;
  SFCapsuleCollectionViewUpdate *v6;
  void *v7;
  uint64_t v8;
  NSArray *itemsBeforeUpdate;
  void *v10;
  uint64_t v11;
  NSIndexSet *indexesOfVisibleItemsBeforeUpdate;
  void *v13;
  uint64_t v14;
  NSMutableArray *itemsAfterUpdate;
  uint64_t v16;
  NSMutableSet *deletedItems;
  uint64_t v18;
  NSMutableSet *insertedItems;
  uint64_t v20;
  NSIndexSet *indexesOfDeletedItems;
  uint64_t v22;
  NSIndexSet *indexesOfInsertedItems;
  SFCapsuleCollectionViewUpdate *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SFCapsuleCollectionViewUpdate;
  v5 = -[SFCapsuleCollectionViewUpdate init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_collectionView, v4);
    objc_msgSend(v4, "_items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    itemsBeforeUpdate = v6->_itemsBeforeUpdate;
    v6->_itemsBeforeUpdate = (NSArray *)v8;

    objc_msgSend(v4, "_indexesOfVisibleItemsIncludingAction:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    indexesOfVisibleItemsBeforeUpdate = v6->_indexesOfVisibleItemsBeforeUpdate;
    v6->_indexesOfVisibleItemsBeforeUpdate = (NSIndexSet *)v11;

    v6->_selectedItemIndexBeforeUpdate = objc_msgSend(v4, "selectedItemIndex");
    objc_msgSend(v4, "_items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "mutableCopy");
    itemsAfterUpdate = v6->_itemsAfterUpdate;
    v6->_itemsAfterUpdate = (NSMutableArray *)v14;

    v6->_selectedItemIndexAfterUpdate = v6->_selectedItemIndexBeforeUpdate;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    deletedItems = v6->_deletedItems;
    v6->_deletedItems = (NSMutableSet *)v16;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    insertedItems = v6->_insertedItems;
    v6->_insertedItems = (NSMutableSet *)v18;

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v20 = objc_claimAutoreleasedReturnValue();
    indexesOfDeletedItems = v6->_indexesOfDeletedItems;
    v6->_indexesOfDeletedItems = (NSIndexSet *)v20;

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v22 = objc_claimAutoreleasedReturnValue();
    indexesOfInsertedItems = v6->_indexesOfInsertedItems;
    v6->_indexesOfInsertedItems = (NSIndexSet *)v22;

    v24 = v6;
  }

  return v6;
}

uint64_t __58__SFCapsuleCollectionViewUpdate__calculateIndexesIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_QWORD *)(a1 + 32) == a2)
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) = a3;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "containsObject:", a2);
}

uint64_t __58__SFCapsuleCollectionViewUpdate__calculateIndexesIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_QWORD *)(a1 + 32) == a2)
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) = a3;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "containsObject:", a2);
}

- (NSSet)deletedItems
{
  return &self->_deletedItems->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesOfVisibleItemsBeforeUpdate, 0);
  objc_storeStrong((id *)&self->_itemsBeforeUpdate, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_indexesOfInsertedItems, 0);
  objc_storeStrong((id *)&self->_indexesOfDeletedItems, 0);
  objc_storeStrong((id *)&self->_insertedItems, 0);
  objc_storeStrong((id *)&self->_deletedItems, 0);
  objc_storeStrong((id *)&self->_itemsAfterUpdate, 0);
}

- (void)insertItemsAtIndexes:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSIndexSet *indexesOfDeletedItems;
  NSIndexSet *indexesOfInsertedItems;
  void *v8;
  unint64_t v9;
  SFCapsuleCollectionViewItem *v10;
  id WeakRetained;
  SFCapsuleCollectionViewItem *v12;
  unint64_t v13;
  int64_t selectedItemIndexAfterUpdate;
  int64_t v15;
  void *v16;
  void *v17;
  BOOL animated;
  id v19;
  _QWORD v20[5];

  v4 = a4;
  v19 = a3;
  if (objc_msgSend(v19, "count"))
  {
    indexesOfDeletedItems = self->_indexesOfDeletedItems;
    self->_indexesOfDeletedItems = 0;

    indexesOfInsertedItems = self->_indexesOfInsertedItems;
    self->_indexesOfInsertedItems = 0;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (v9 < objc_msgSend(v19, "count"))
    {
      do
      {
        v10 = [SFCapsuleCollectionViewItem alloc];
        WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
        v12 = -[SFCapsuleCollectionViewItem initWithCollectionView:](v10, "initWithCollectionView:", WeakRetained);
        objc_msgSend(v8, "addObject:", v12);

        v13 = objc_msgSend(v8, "count");
      }
      while (v13 < objc_msgSend(v19, "count"));
    }
    -[NSMutableSet addObjectsFromArray:](self->_insertedItems, "addObjectsFromArray:", v8);
    -[NSMutableArray insertObjects:atIndexes:](self->_itemsAfterUpdate, "insertObjects:atIndexes:", v8, v19);
    selectedItemIndexAfterUpdate = self->_selectedItemIndexAfterUpdate;
    self->_selectedItemIndexAfterUpdate = objc_msgSend(v19, "countOfIndexesInRange:", 0, selectedItemIndexAfterUpdate + 1)+ selectedItemIndexAfterUpdate;
    if (-[NSMutableArray count](self->_itemsAfterUpdate, "count") > 1)
    {
      v15 = self->_selectedItemIndexAfterUpdate;
      if (v15 >= -[NSMutableArray count](self->_itemsAfterUpdate, "count") - 1)
        self->_selectedItemIndexAfterUpdate = -[NSMutableArray count](self->_itemsAfterUpdate, "count") - 2;
    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __63__SFCapsuleCollectionViewUpdate_insertItemsAtIndexes_animated___block_invoke;
    v20[3] = &unk_1E21E2118;
    v20[4] = self;
    objc_msgSend(v19, "indexesPassingTest:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    animated = self->_animated;
    if (!self->_animated && v4)
      animated = objc_msgSend(v16, "count") != 0;
    self->_animated = animated;

  }
}

BOOL __63__SFCapsuleCollectionViewUpdate_insertItemsAtIndexes_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  if (v2 < 0)
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) - a2;
  return (unint64_t)v2 < 2;
}

- (void)deleteItemsAtIndexes:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSIndexSet *indexesOfDeletedItems;
  NSIndexSet *indexesOfInsertedItems;
  void *v8;
  void *v9;
  BOOL animated;
  NSMutableSet *deletedItems;
  void *v12;
  void *v13;
  int64_t selectedItemIndexAfterUpdate;
  uint64_t i;
  NSMutableArray *itemsAfterUpdate;
  void *v18;
  uint64_t v19;
  int64_t v20;
  id v21;
  id v22;
  _QWORD v23[5];

  v4 = a4;
  v21 = a3;
  indexesOfDeletedItems = self->_indexesOfDeletedItems;
  self->_indexesOfDeletedItems = 0;

  indexesOfInsertedItems = self->_indexesOfInsertedItems;
  self->_indexesOfInsertedItems = 0;

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __63__SFCapsuleCollectionViewUpdate_deleteItemsAtIndexes_animated___block_invoke;
  v23[3] = &unk_1E21E2118;
  v23[4] = self;
  objc_msgSend(v21, "indexesPassingTest:", v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  animated = self->_animated;
  if (!self->_animated && v4)
    animated = objc_msgSend(v8, "count") != 0;
  self->_animated = animated;
  deletedItems = self->_deletedItems;
  -[NSMutableArray objectsAtIndexes:](self->_itemsAfterUpdate, "objectsAtIndexes:", v21, v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObjectsFromArray:](deletedItems, "addObjectsFromArray:", v12);

  v13 = (void *)-[NSMutableArray copy](self->_itemsAfterUpdate, "copy");
  -[NSMutableArray removeObjectsAtIndexes:](self->_itemsAfterUpdate, "removeObjectsAtIndexes:", v22);
  selectedItemIndexAfterUpdate = self->_selectedItemIndexAfterUpdate;
  for (i = -[NSMutableArray count](self->_itemsAfterUpdate, "count");
        selectedItemIndexAfterUpdate < i - 1
     && objc_msgSend(v22, "containsIndex:", selectedItemIndexAfterUpdate);
        i = -[NSMutableArray count](self->_itemsAfterUpdate, "count"))
  {
    ++selectedItemIndexAfterUpdate;
  }
  if (selectedItemIndexAfterUpdate >= 1)
  {
    while (objc_msgSend(v22, "containsIndex:", selectedItemIndexAfterUpdate))
    {
      if (selectedItemIndexAfterUpdate-- <= 1)
      {
        selectedItemIndexAfterUpdate = 0;
        break;
      }
    }
  }
  itemsAfterUpdate = self->_itemsAfterUpdate;
  objc_msgSend(v13, "objectAtIndexedSubscript:", selectedItemIndexAfterUpdate);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NSMutableArray indexOfObject:](itemsAfterUpdate, "indexOfObject:", v18);

  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    v20 = 0;
  else
    v20 = v19;
  self->_selectedItemIndexAfterUpdate = v20;

}

BOOL __63__SFCapsuleCollectionViewUpdate_deleteItemsAtIndexes_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  if (v2 < 0)
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) - a2;
  return (unint64_t)v2 < 2;
}

- (int64_t)indexBeforeUpdateOfSelectedItemAfterUpdate
{
  -[SFCapsuleCollectionViewUpdate _calculateIndexesIfNeeded](self, "_calculateIndexesIfNeeded");
  return self->_indexBeforeUpdateOfSelectedItemAfterUpdate;
}

- (SFCapsuleCollectionView)collectionView
{
  return (SFCapsuleCollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

@end
