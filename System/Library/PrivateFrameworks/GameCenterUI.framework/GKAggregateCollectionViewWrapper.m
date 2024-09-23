@implementation GKAggregateCollectionViewWrapper

+ (id)wrapperForView:(id)a3 mapping:(id)a4
{
  id v5;
  id v6;
  GKAggregateCollectionViewWrapper *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[GKAggregateCollectionViewWrapper initWithView:mapping:]([GKAggregateCollectionViewWrapper alloc], "initWithView:mapping:", v6, v5);

  return v7;
}

- (GKAggregateCollectionViewWrapper)initWithView:(id)a3 mapping:(id)a4
{
  id v7;
  id v8;
  GKAggregateCollectionViewWrapper *v9;
  GKAggregateCollectionViewWrapper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GKAggregateCollectionViewWrapper;
  v9 = -[GKAggregateCollectionViewWrapper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_wrappedView, a3);
    objc_storeStrong((id *)&v10->_mapping, a4);
  }

  return v10;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_wrappedView;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKAggregateCollectionViewWrapper;
  objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKAggregateCollectionViewWrapper;
  -[GKAggregateCollectionViewWrapper methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKAggregateCollectionViewWrapper forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKAggregateCollectionViewWrapper;
  if (-[GKAggregateCollectionViewWrapper respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKAggregateCollectionViewWrapper forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if (!a3)
    return 0;
  if (class_respondsToSelector((Class)a1, a3))
    return 1;
  return objc_msgSend(MEMORY[0x1E0DC35B8], "instancesRespondToSelector:", a3);
}

- (id)valueForUndefinedKey:(id)a3
{
  return (id)-[UICollectionView valueForKey:](self->_wrappedView, "valueForKey:", a3);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  -[UICollectionView setValue:forKey:](self->_wrappedView, "setValue:forKey:", a3, a4);
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4
{
  UICollectionView *wrappedView;
  GKAggregateMapping *mapping;
  id v7;
  void *v8;
  void *v9;

  wrappedView = self->_wrappedView;
  mapping = self->_mapping;
  v7 = a3;
  -[GKAggregateMapping globalIndexPathForLocalIndexPath:](mapping, "globalIndexPathForLocalIndexPath:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](wrappedView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dequeueReusableSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4 forIndexPath:(id)a5
{
  UICollectionView *wrappedView;
  GKAggregateMapping *mapping;
  id v9;
  id v10;
  void *v11;
  void *v12;

  wrappedView = self->_wrappedView;
  mapping = self->_mapping;
  v9 = a4;
  v10 = a3;
  -[GKAggregateMapping globalIndexPathForLocalIndexPath:](mapping, "globalIndexPathForLocalIndexPath:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:](wrappedView, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)indexPathsForSelectedItems
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UICollectionView indexPathsForSelectedItems](self->_wrappedView, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          -[GKAggregateMapping localIndexPathForGlobalIndexPath:](self->_mapping, "localIndexPathForGlobalIndexPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  _BOOL8 v6;
  UICollectionView *wrappedView;
  id v8;

  v6 = a4;
  wrappedView = self->_wrappedView;
  -[GKAggregateMapping globalIndexPathForLocalIndexPath:](self->_mapping, "globalIndexPathForLocalIndexPath:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](wrappedView, "selectItemAtIndexPath:animated:scrollPosition:", v8, v6, a5);

}

- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UICollectionView *wrappedView;
  id v6;

  v4 = a4;
  wrappedView = self->_wrappedView;
  -[GKAggregateMapping globalIndexPathForLocalIndexPath:](self->_mapping, "globalIndexPathForLocalIndexPath:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView deselectItemAtIndexPath:animated:](wrappedView, "deselectItemAtIndexPath:animated:", v6, v4);

}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return -[UICollectionView numberOfItemsInSection:](self->_wrappedView, "numberOfItemsInSection:", -[GKAggregateMapping globalSectionForLocalSection:](self->_mapping, "globalSectionForLocalSection:", a3));
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  UICollectionView *wrappedView;
  void *v4;
  void *v5;

  wrappedView = self->_wrappedView;
  -[GKAggregateMapping globalIndexPathForLocalIndexPath:](self->_mapping, "globalIndexPathForLocalIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView layoutAttributesForItemAtIndexPath:](wrappedView, "layoutAttributesForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)layoutAttributesForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  UICollectionView *wrappedView;
  GKAggregateMapping *mapping;
  id v7;
  void *v8;
  void *v9;

  wrappedView = self->_wrappedView;
  mapping = self->_mapping;
  v7 = a3;
  -[GKAggregateMapping globalIndexPathForLocalIndexPath:](mapping, "globalIndexPathForLocalIndexPath:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView layoutAttributesForSupplementaryElementOfKind:atIndexPath:](wrappedView, "layoutAttributesForSupplementaryElementOfKind:atIndexPath:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)indexPathForItemAtPoint:(CGPoint)a3
{
  void *v4;
  void *v5;

  -[UICollectionView indexPathForItemAtPoint:](self->_wrappedView, "indexPathForItemAtPoint:", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAggregateMapping localIndexPathForGlobalIndexPath:](self->_mapping, "localIndexPathForGlobalIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)indexPathForCell:(id)a3
{
  void *v4;
  void *v5;

  -[UICollectionView indexPathForCell:](self->_wrappedView, "indexPathForCell:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAggregateMapping localIndexPathForGlobalIndexPath:](self->_mapping, "localIndexPathForGlobalIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  UICollectionView *wrappedView;
  void *v4;
  void *v5;

  wrappedView = self->_wrappedView;
  -[GKAggregateMapping globalIndexPathForLocalIndexPath:](self->_mapping, "globalIndexPathForLocalIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](wrappedView, "cellForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)indexPathsForVisibleItems
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UICollectionView indexPathsForVisibleItems](self->_wrappedView, "indexPathsForVisibleItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          -[GKAggregateMapping localIndexPathForGlobalIndexPath:](self->_mapping, "localIndexPathForGlobalIndexPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)scrollToItemAtIndexPath:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  UICollectionView *wrappedView;
  id v8;

  v5 = a5;
  wrappedView = self->_wrappedView;
  -[GKAggregateMapping globalIndexPathForLocalIndexPath:](self->_mapping, "globalIndexPathForLocalIndexPath:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](wrappedView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v8, a4, v5);

}

- (void)insertSections:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0CB3788];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__GKAggregateCollectionViewWrapper_insertSections___block_invoke;
  v8[3] = &unk_1E59C4820;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v8);
  -[UICollectionView insertSections:](self->_wrappedView, "insertSections:", v5);

}

uint64_t __51__GKAggregateCollectionViewWrapper_insertSections___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "globalSectionForLocalSection:", a2));
}

- (void)deleteSections:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0CB3788];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__GKAggregateCollectionViewWrapper_deleteSections___block_invoke;
  v8[3] = &unk_1E59C4820;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v8);
  -[UICollectionView deleteSections:](self->_wrappedView, "deleteSections:", v5);

}

uint64_t __51__GKAggregateCollectionViewWrapper_deleteSections___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "globalSectionForLocalSection:", a2));
}

- (void)reloadSections:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0CB3788];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__GKAggregateCollectionViewWrapper_reloadSections___block_invoke;
  v8[3] = &unk_1E59C4820;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v8);
  -[UICollectionView reloadSections:](self->_wrappedView, "reloadSections:", v5);

}

uint64_t __51__GKAggregateCollectionViewWrapper_reloadSections___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "globalSectionForLocalSection:", a2));
}

- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4
{
  -[UICollectionView moveSection:toSection:](self->_wrappedView, "moveSection:toSection:", -[GKAggregateMapping globalSectionForLocalSection:](self->_mapping, "globalSectionForLocalSection:", a3), -[GKAggregateMapping globalSectionForLocalSection:](self->_mapping, "globalSectionForLocalSection:", a4));
}

- (void)insertItemsAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[GKAggregateMapping globalIndexPathForLocalIndexPath:](self->_mapping, "globalIndexPathForLocalIndexPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[UICollectionView insertItemsAtIndexPaths:](self->_wrappedView, "insertItemsAtIndexPaths:", v5);
}

- (void)deleteItemsAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[GKAggregateMapping globalIndexPathForLocalIndexPath:](self->_mapping, "globalIndexPathForLocalIndexPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[UICollectionView deleteItemsAtIndexPaths:](self->_wrappedView, "deleteItemsAtIndexPaths:", v5);
}

- (void)reloadItemsAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[GKAggregateMapping globalIndexPathForLocalIndexPath:](self->_mapping, "globalIndexPathForLocalIndexPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[UICollectionView reloadItemsAtIndexPaths:](self->_wrappedView, "reloadItemsAtIndexPaths:", v5);
}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  UICollectionView *wrappedView;
  GKAggregateMapping *mapping;
  id v8;
  void *v9;
  id v10;

  wrappedView = self->_wrappedView;
  mapping = self->_mapping;
  v8 = a4;
  -[GKAggregateMapping globalIndexPathForLocalIndexPath:](mapping, "globalIndexPathForLocalIndexPath:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[GKAggregateMapping globalIndexPathForLocalIndexPath:](self->_mapping, "globalIndexPathForLocalIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICollectionView moveItemAtIndexPath:toIndexPath:](wrappedView, "moveItemAtIndexPath:toIndexPath:", v10, v9);
}

- (void)_gkRegisterCellClass:(Class)a3
{
  UICollectionView *wrappedView;
  id v5;

  wrappedView = self->_wrappedView;
  -[UICollectionView _gkReuseIdentifierForClass:](wrappedView, "_gkReuseIdentifierForClass:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](wrappedView, "registerClass:forCellWithReuseIdentifier:", a3, v5);

}

- (id)_gkDequeueCellForClass:(Class)a3 forIndexPath:(id)a4
{
  void *v6;
  UICollectionView *wrappedView;
  void *v8;
  void *v9;

  -[GKAggregateMapping globalIndexPathForLocalIndexPath:](self->_mapping, "globalIndexPathForLocalIndexPath:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  wrappedView = self->_wrappedView;
  -[UICollectionView _gkReuseIdentifierForClass:](wrappedView, "_gkReuseIdentifierForClass:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](wrappedView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_gkPerformWithoutViewReuse:(id)a3
{
  -[UICollectionView _gkPerformWithoutViewReuse:](self->_wrappedView, "_gkPerformWithoutViewReuse:", a3);
}

- (void)_gkRegisterClass:(Class)a3 forSupplementaryViewOfKind:(id)a4
{
  UICollectionView *wrappedView;
  id v6;
  id v7;

  wrappedView = self->_wrappedView;
  v6 = a4;
  -[UICollectionView _gkReuseIdentifierForClass:](wrappedView, "_gkReuseIdentifierForClass:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](wrappedView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", a3, v6, v7);

}

- (id)_gkDequeueSupplementaryViewForClass:(Class)a3 ofKind:(id)a4 forIndexPath:(id)a5
{
  GKAggregateMapping *mapping;
  id v9;
  void *v10;
  void *v11;

  mapping = self->_mapping;
  v9 = a4;
  -[GKAggregateMapping globalIndexPathForLocalIndexPath:](mapping, "globalIndexPathForLocalIndexPath:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView _gkDequeueSupplementaryViewForClass:ofKind:forIndexPath:](self->_wrappedView, "_gkDequeueSupplementaryViewForClass:ofKind:forIndexPath:", a3, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UICollectionView)wrappedView
{
  return self->_wrappedView;
}

- (void)setWrappedView:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedView, a3);
}

- (GKAggregateMapping)mapping
{
  return self->_mapping;
}

- (void)setMapping:(id)a3
{
  objc_storeStrong((id *)&self->_mapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapping, 0);
  objc_storeStrong((id *)&self->_wrappedView, 0);
}

@end
