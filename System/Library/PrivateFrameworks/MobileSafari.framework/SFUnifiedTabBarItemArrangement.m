@implementation SFUnifiedTabBarItemArrangement

- (SFUnifiedTabBarItemArrangement)initWithItems:(id)a3 activeItem:(id)a4 activeItemIsExpanded:(BOOL)a5 allowsScrollingPinnedItems:(BOOL)a6
{
  return (SFUnifiedTabBarItemArrangement *)-[SFUnifiedTabBarItemArrangement _initWithItems:activeItem:activeItemIsExpanded:allowPinning:allowsScrollingPinnedItems:](self, "_initWithItems:activeItem:activeItemIsExpanded:allowPinning:allowsScrollingPinnedItems:", a3, a4, a5, 1, a6);
}

- (id)_initWithItems:(id)a3 activeItem:(id)a4 activeItemIsExpanded:(BOOL)a5 allowPinning:(BOOL)a6 allowsScrollingPinnedItems:(BOOL)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  SFUnifiedTabBarItemArrangement *v14;
  SFUnifiedTabBarItemArrangement *v15;
  NSArray *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  NSArray *pinnedItems;
  uint64_t v28;
  NSArray *unpinnedItems;
  uint64_t v30;
  NSArray *items;
  NSArray *v32;
  NSArray *v33;
  NSArray *v34;
  NSArray *v35;
  NSArray *overflowPinnedItems;
  void **p_activeItem;
  uint64_t v38;
  void *v39;
  BOOL v40;
  SFUnifiedTabBarItemArrangement *v41;
  BOOL v43;
  _BOOL4 v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  v8 = a6;
  v9 = a5;
  v52 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v50.receiver = self;
  v50.super_class = (Class)SFUnifiedTabBarItemArrangement;
  v14 = -[SFUnifiedTabBarItemArrangement init](&v50, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_24;
  v16 = (NSArray *)MEMORY[0x1E0C9AA60];
  if (v8)
  {
    v43 = a7;
    v44 = v9;
    v45 = v13;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v19 = v12;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v47 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          if (objc_msgSend(v24, "isPinned"))
            v25 = v17;
          else
            v25 = v18;
          objc_msgSend(v25, "addObject:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v21);
    }

    v26 = objc_msgSend(v17, "copy");
    pinnedItems = v15->_pinnedItems;
    v15->_pinnedItems = (NSArray *)v26;

    v28 = objc_msgSend(v18, "copy");
    unpinnedItems = v15->_unpinnedItems;
    v15->_unpinnedItems = (NSArray *)v28;

    -[NSArray arrayByAddingObjectsFromArray:](v15->_pinnedItems, "arrayByAddingObjectsFromArray:", v15->_unpinnedItems);
    v30 = objc_claimAutoreleasedReturnValue();
    items = v15->_items;
    v15->_items = (NSArray *)v30;

    v15->_allowsScrollingPinnedItems = v43;
    v13 = v45;
    v9 = v44;
    v16 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v32 = v14->_pinnedItems;
    v14->_pinnedItems = (NSArray *)MEMORY[0x1E0C9AA60];

    v33 = (NSArray *)objc_msgSend(v12, "copy");
    v34 = v15->_unpinnedItems;
    v15->_unpinnedItems = v33;

    v35 = v33;
    v17 = v15->_items;
    v15->_items = v35;
  }

  overflowPinnedItems = v15->_overflowPinnedItems;
  v15->_overflowPinnedItems = v16;

  p_activeItem = (void **)&v15->_activeItem;
  objc_storeStrong((id *)&v15->_activeItem, a4);
  if (!v15->_activeItem)
  {
    v39 = 0;
    v15->_activeItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_19;
  }
  v38 = -[NSArray indexOfObject:](v15->_items, "indexOfObject:");
  v15->_activeItemIndex = v38;
  if (v38 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v39 = *p_activeItem;
LABEL_19:
    *p_activeItem = 0;

  }
  v40 = v9 && *p_activeItem != 0;
  v15->_activeItemIsExpanded = v40;
  v15->_activeItemSquishState = -1;
  -[SFUnifiedTabBarItemArrangement setNeedsUpdateCachedItemTitles](v15, "setNeedsUpdateCachedItemTitles");
  v41 = v15;
LABEL_24:

  return v15;
}

- (void)setNeedsUpdateCachedItemTitles
{
  self->_needsUpdateCachedItemTitles = 1;
}

- (SFUnifiedBarItem)activeItem
{
  return self->_activeItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overflowPinnedItems, 0);
  objc_storeStrong((id *)&self->_unpinnedItems, 0);
  objc_storeStrong((id *)&self->_pinnedItems, 0);
  objc_storeStrong((id *)&self->_activeItem, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_itemTitles, 0);
}

- (SFUnifiedTabBarItemArrangement)initWithItems:(id)a3 activeItem:(id)a4
{
  return -[SFUnifiedTabBarItemArrangement initWithItems:activeItem:activeItemIsExpanded:allowsScrollingPinnedItems:](self, "initWithItems:activeItem:activeItemIsExpanded:allowsScrollingPinnedItems:", a3, a4, 0, 0);
}

- (SFUnifiedTabBarItemArrangement)init
{
  return -[SFUnifiedTabBarItemArrangement initWithItems:activeItem:](self, "initWithItems:activeItem:", MEMORY[0x1E0C9AA60], 0);
}

- (SFUnifiedTabBarItemArrangement)initWithItem:(id)a3 activeItemIsExpanded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  SFUnifiedTabBarItemArrangement *v9;
  _QWORD v11[2];

  v4 = a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  v9 = -[SFUnifiedTabBarItemArrangement _initWithItems:activeItem:activeItemIsExpanded:allowPinning:allowsScrollingPinnedItems:](self, "_initWithItems:activeItem:activeItemIsExpanded:allowPinning:allowsScrollingPinnedItems:", v8, v7, v4, 0, 0);

  return v9;
}

- (BOOL)isEqualToArrangement:(id)a3
{
  id v4;
  NSArray *pinnedItems;
  void *v6;
  NSArray *unpinnedItems;
  void *v8;
  int allowsScrollingPinnedItems;
  SFUnifiedBarItem *activeItem;
  SFUnifiedBarItem *v11;
  int activeItemIsExpanded;
  int64_t activeItemSquishState;
  BOOL v14;

  v4 = a3;
  pinnedItems = self->_pinnedItems;
  objc_msgSend(v4, "pinnedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray isEqualToArray:](pinnedItems, "isEqualToArray:", v6))
  {
    unpinnedItems = self->_unpinnedItems;
    objc_msgSend(v4, "unpinnedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray isEqualToArray:](unpinnedItems, "isEqualToArray:", v8)
      && (allowsScrollingPinnedItems = self->_allowsScrollingPinnedItems,
          allowsScrollingPinnedItems == objc_msgSend(v4, "allowsScrollingPinnedItems")))
    {
      activeItem = self->_activeItem;
      objc_msgSend(v4, "activeItem");
      v11 = (SFUnifiedBarItem *)objc_claimAutoreleasedReturnValue();
      if (activeItem == v11
        && (activeItemIsExpanded = self->_activeItemIsExpanded,
            activeItemIsExpanded == objc_msgSend(v4, "activeItemIsExpanded")))
      {
        activeItemSquishState = self->_activeItemSquishState;
        v14 = activeItemSquishState == objc_msgSend(v4, "activeItemSquishState")
           || self->_activeItemSquishState == -1
           || objc_msgSend(v4, "activeItemSquishState") == -1;
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (SFUnifiedTabBarItemArrangement)arrangementWithActiveItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = -[SFUnifiedTabBarItemArrangement copy](self, "copy");
  v6 = v5;
  if (v4)
    v7 = objc_msgSend(*(id *)(v5 + 24), "indexOfObject:", v4);
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)(v6 + 40) = v7;
  if (self->_activeItemIndex == 0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = v4;
  objc_storeStrong((id *)(v6 + 32), v8);

  return (SFUnifiedTabBarItemArrangement *)(id)v6;
}

- (SFUnifiedTabBarItemArrangement)arrangementWithActiveItemIsExpanded:(BOOL)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)-[SFUnifiedTabBarItemArrangement copy](self, "copy");
  v4[9] = a3;
  return (SFUnifiedTabBarItemArrangement *)v4;
}

- (SFUnifiedTabBarItemArrangement)arrangementWithActiveItemSquishState:(int64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)-[SFUnifiedTabBarItemArrangement copy](self, "copy");
  v4[6] = a3;
  return (SFUnifiedTabBarItemArrangement *)v4;
}

- (NSArray)itemTitles
{
  NSArray *v3;
  NSArray *itemTitles;

  if (self->_needsUpdateCachedItemTitles)
  {
    -[NSArray safari_mapAndFilterObjectsUsingBlock:](self->_items, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_534);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    itemTitles = self->_itemTitles;
    self->_itemTitles = v3;

    self->_needsUpdateCachedItemTitles = 0;
  }
  return self->_itemTitles;
}

id __44__SFUnifiedTabBarItemArrangement_itemTitles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)resolvedArrangementWithPinnedItemLimit:(unint64_t)a3 overflowItem:(id)a4
{
  id v6;
  SFUnifiedTabBarItemArrangement *v7;
  uint64_t v8;
  NSArray *pinnedItems;
  void *v10;
  NSUInteger v11;
  void *v12;
  NSArray *v13;
  NSArray *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *overflowPinnedItems;
  NSArray *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  NSArray *v25;
  _QWORD v26[5];

  v6 = a4;
  if (self->_allowsScrollingPinnedItems)
  {
    v7 = self;
  }
  else if (-[NSArray count](self->_pinnedItems, "count") <= a3 + 1)
  {
    v7 = (SFUnifiedTabBarItemArrangement *)-[SFUnifiedTabBarItemArrangement copy](self, "copy");
    v7->_pinnedItemLimit = a3;
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    pinnedItems = self->_pinnedItems;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __86__SFUnifiedTabBarItemArrangement_resolvedArrangementWithPinnedItemLimit_overflowItem___block_invoke;
    v26[3] = &unk_1E21E4CD0;
    v26[4] = self;
    -[NSArray safari_filterObjectsUsingBlock:](pinnedItems, "safari_filterObjectsUsingBlock:", v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSArray count](self->_pinnedItems, "count") - a3;
    objc_msgSend(v10, "subarrayWithRange:", objc_msgSend(v10, "count") - v11, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_pinnedItems;
    v21 = v8;
    v22 = 3221225472;
    v23 = __86__SFUnifiedTabBarItemArrangement_resolvedArrangementWithPinnedItemLimit_overflowItem___block_invoke_2;
    v24 = &unk_1E21E4CD0;
    v14 = v12;
    v25 = v14;
    -[NSArray safari_filterObjectsUsingBlock:](v13, "safari_filterObjectsUsingBlock:", &v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObject:", v6, v21, v22, v23, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayByAddingObjectsFromArray:", self->_unpinnedItems);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[SFUnifiedTabBarItemArrangement initWithItems:activeItem:activeItemIsExpanded:allowsScrollingPinnedItems:]([SFUnifiedTabBarItemArrangement alloc], "initWithItems:activeItem:activeItemIsExpanded:allowsScrollingPinnedItems:", v17, self->_activeItem, self->_activeItemIsExpanded, 0);
    v7->_activeItemSquishState = self->_activeItemSquishState;
    overflowPinnedItems = v7->_overflowPinnedItems;
    v7->_pinnedItemLimit = a3;
    v7->_overflowPinnedItems = v14;
    v19 = v14;

  }
  return v7;
}

uint64_t __86__SFUnifiedTabBarItemArrangement_resolvedArrangementWithPinnedItemLimit_overflowItem___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(*(_QWORD *)(a1 + 32) + 32) == a2)
    return 0;
  else
    return objc_msgSend(a2, "isPlaceholder") ^ 1;
}

uint64_t __86__SFUnifiedTabBarItemArrangement_resolvedArrangementWithPinnedItemLimit_overflowItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (BOOL)revealsSquishedActiveItem
{
  return self->_activeItemSquishState == 1;
}

- (NSIndexSet)allItemIndexes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[NSArray count](self->_items, "count"));
}

- (void)determineActiveItemSquishStateIfNeeded:(BOOL)a3
{
  if (self->_activeItemSquishState == -1)
    self->_activeItemSquishState = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SFUnifiedTabBarItemArrangement *v4;

  v4 = objc_alloc_init(SFUnifiedTabBarItemArrangement);
  objc_storeStrong((id *)&v4->_activeItem, self->_activeItem);
  v4->_activeItemIndex = self->_activeItemIndex;
  v4->_activeItemIsExpanded = self->_activeItemIsExpanded;
  v4->_activeItemSquishState = self->_activeItemSquishState;
  v4->_allowsScrollingPinnedItems = self->_allowsScrollingPinnedItems;
  objc_storeStrong((id *)&v4->_items, self->_items);
  objc_storeStrong((id *)&v4->_overflowPinnedItems, self->_overflowPinnedItems);
  v4->_pinnedItemLimit = self->_pinnedItemLimit;
  objc_storeStrong((id *)&v4->_pinnedItems, self->_pinnedItems);
  objc_storeStrong((id *)&v4->_unpinnedItems, self->_unpinnedItems);
  return v4;
}

- (NSArray)items
{
  return self->_items;
}

- (unint64_t)activeItemIndex
{
  return self->_activeItemIndex;
}

- (BOOL)activeItemIsExpanded
{
  return self->_activeItemIsExpanded;
}

- (BOOL)allowsScrollingPinnedItems
{
  return self->_allowsScrollingPinnedItems;
}

- (int64_t)activeItemSquishState
{
  return self->_activeItemSquishState;
}

- (NSArray)pinnedItems
{
  return self->_pinnedItems;
}

- (NSArray)unpinnedItems
{
  return self->_unpinnedItems;
}

- (unint64_t)pinnedItemLimit
{
  return self->_pinnedItemLimit;
}

- (NSArray)overflowPinnedItems
{
  return self->_overflowPinnedItems;
}

@end
