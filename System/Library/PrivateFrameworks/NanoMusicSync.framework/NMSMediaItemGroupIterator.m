@implementation NMSMediaItemGroupIterator

- (NMSQuotaEvaluationState)evaluationState
{
  NMSQuotaEvaluationState_Legacy *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(NMSQuotaEvaluationState_Legacy);
  -[NMSMediaItemGroupIterator currentItem](self, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaLibraryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSQuotaEvaluationState_Legacy setMediaLibraryIdentifier:](v3, "setMediaLibraryIdentifier:", v5);

  -[NMSMediaItemGroupIterator currentItem](self, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "externalLibraryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSQuotaEvaluationState_Legacy setExternalLibraryIdentifier:](v3, "setExternalLibraryIdentifier:", v7);

  -[NMSQuotaEvaluationState_Legacy setContainerIndex:](v3, "setContainerIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
  -[NMSQuotaEvaluationState_Legacy setItemIndex:](v3, "setItemIndex:", -[NMSMediaItemGroupIterator currentItemIndex](self, "currentItemIndex"));
  -[NMSQuotaEvaluationState_Legacy setItemSize:](v3, "setItemSize:", -[NMSMediaItemGroupIterator sizeForCurrentIdentifier](self, "sizeForCurrentIdentifier"));
  -[NMSQuotaEvaluationState_Legacy setListTotalSize:](v3, "setListTotalSize:", -[NMSMediaItemGroupIterator sizeForItemListWithinQuota](self, "sizeForItemListWithinQuota"));
  return (NMSQuotaEvaluationState *)v3;
}

- (NMSMediaItemGroupIterator)initWithItemGroups:(id)a3 estimatedItemSize:(unint64_t)a4
{
  id v6;
  NMSMediaItemGroupIterator *v7;
  uint64_t v8;
  NSArray *itemGroups;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NMSMediaItemGroupIterator;
  v7 = -[NMSMediaItemGroupIterator init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    itemGroups = v7->_itemGroups;
    v7->_itemGroups = (NSArray *)v8;

    v7->_estimatedItemSize = a4;
  }

  return v7;
}

- (NSMutableArray)remainingContainers
{
  NSMutableArray *remainingContainers;
  NSMutableArray *v4;
  NSMutableArray *v5;

  remainingContainers = self->_remainingContainers;
  if (!remainingContainers)
  {
    v4 = (NSMutableArray *)-[NSArray mutableCopy](self->_itemGroups, "mutableCopy");
    v5 = self->_remainingContainers;
    self->_remainingContainers = v4;

    remainingContainers = self->_remainingContainers;
  }
  return remainingContainers;
}

- (NSMutableOrderedSet)mutableItemListWithinQuota
{
  NSMutableOrderedSet *mutableItemListWithinQuota;
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *v5;

  mutableItemListWithinQuota = self->_mutableItemListWithinQuota;
  if (!mutableItemListWithinQuota)
  {
    v4 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v5 = self->_mutableItemListWithinQuota;
    self->_mutableItemListWithinQuota = v4;

    mutableItemListWithinQuota = self->_mutableItemListWithinQuota;
  }
  return mutableItemListWithinQuota;
}

- (id)downloadInfoWithinQuota
{
  NMSMediaDownloadInfo *v3;
  void *v4;
  NMSMediaDownloadInfo *v5;

  v3 = [NMSMediaDownloadInfo alloc];
  -[NMSMediaItemGroupIterator mutableItemListWithinQuota](self, "mutableItemListWithinQuota");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NMSMediaDownloadInfo initWithItems:](v3, "initWithItems:", v4);

  return v5;
}

- (void)_generateItemListAndSizesDictIfNecessary
{
  void *v3;
  void *v4;
  NMLogActionsCoalescer *v5;
  uint64_t v6;
  void *v7;
  NMLogActionsCoalescer *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *obj;
  uint64_t v27;
  NMLogActionsCoalescer *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_itemGroups, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMediaItemGroupIterator setRemainingItemLists:](self, "setRemainingItemLists:", v4);

    v5 = [NMLogActionsCoalescer alloc];
    v6 = objc_opt_class();
    NMLogForCategory(6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NMLogActionsCoalescer initWithIdentifier:logCategory:](v5, "initWithIdentifier:logCategory:", v6, v7);

    objc_msgSend(CFSTR("[MediaQuota]"), "stringByAppendingString:", CFSTR(" Building item list"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v8;
    -[NMLogActionsCoalescer setPrefix:](v8, "setPrefix:", v9);

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = self->_itemGroups;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v29)
    {
      v10 = 0;
      v27 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v12, "itemList");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count"))
          {
            -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v15);

            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            v16 = v13;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v31;
              do
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v31 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
                  if ((objc_msgSend(v21, "isManuallyAdded") & 1) == 0)
                    self->_nominatedItemSize += objc_msgSend(v21, "size");
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              }
              while (v18);
            }

            v22 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v12, "itemList");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stringWithFormat:", CFSTR("CTNR:%3d %@ generated item list which has %lu items."), v10, v12, objc_msgSend(v23, "count"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = (v10 + 1);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Skipped %@ because it's empty."), v12);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          +[NMGenericMessageLogAction logActionWithMessage:](NMGenericMessageLogAction, "logActionWithMessage:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NMLogActionsCoalescer addLogAction:](v28, "addLogAction:", v25);

        }
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v29);
    }

    -[NMLogActionsCoalescer flush](v28, "flush");
  }
}

- (unint64_t)iteratingOrder
{
  return 0;
}

- (id)currentItem
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  -[NMSMediaItemGroupIterator _generateItemListAndSizesDictIfNecessary](self, "_generateItemListAndSizesDictIfNecessary");
  v3 = -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex");
  -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= objc_msgSend(v4, "count"))
  {
    v10 = 0;
  }
  else
  {
    v5 = -[NMSMediaItemGroupIterator currentItemIndex](self, "currentItemIndex");
    -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v5 >= v8)
    {
      v10 = 0;
      return v10;
    }
    -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", -[NMSMediaItemGroupIterator currentItemIndex](self, "currentItemIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)skipCurrentIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NMSMediaItemGroupIterator _generateItemListAndSizesDictIfNecessary](self, "_generateItemListAndSizesDictIfNecessary");
  -[NMSMediaItemGroupIterator currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NMSMediaItemGroupIterator remainingContainers](self, "remainingContainers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "quotaData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHasSkippedItems:", 1);

    -[NMSMediaItemGroupIterator _continueToNextIdentifier](self, "_continueToNextIdentifier");
  }
}

- (void)removeCurrentIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NMSMediaItemGroupIterator _generateItemListAndSizesDictIfNecessary](self, "_generateItemListAndSizesDictIfNecessary");
  -[NMSMediaItemGroupIterator currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NMSMediaItemGroupIterator _markToBeRemoved](self, "_markToBeRemoved");
    -[NMSMediaItemGroupIterator remainingContainers](self, "remainingContainers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "quotaData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHasRemovedItems:", 1);

    -[NMSMediaItemGroupIterator _continueToNextIdentifier](self, "_continueToNextIdentifier");
  }
}

- (void)addCurrentIdentifierToWithinQuotaListAndCountSizeTowardsQuota:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  -[NMSMediaItemGroupIterator _generateItemListAndSizesDictIfNecessary](self, "_generateItemListAndSizesDictIfNecessary");
  -[NMSMediaItemGroupIterator currentItem](self, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = v5;
    -[NMSMediaItemGroupIterator mutableItemListWithinQuota](self, "mutableItemListWithinQuota");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v12);

    if ((v7 & 1) == 0)
    {
      -[NMSMediaItemGroupIterator mutableItemListWithinQuota](self, "mutableItemListWithinQuota");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v12);

      if (v3)
        self->_sizeForItemListWithinQuota += objc_msgSend(v12, "size");
    }
    -[NMSMediaItemGroupIterator remainingContainers](self, "remainingContainers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "quotaData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNumItemsAdded:", objc_msgSend(v11, "numItemsAdded") + 1);

    -[NMSMediaItemGroupIterator _markToBeRemoved](self, "_markToBeRemoved");
    -[NMSMediaItemGroupIterator _continueToNextIdentifier](self, "_continueToNextIdentifier");
    v5 = v12;
  }

}

- (void)resetToIterateOverQuotaIdentifiers
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NSMutableArray *indexesToBeRemoved;

  -[NMSMediaItemGroupIterator _generateItemListAndSizesDictIfNecessary](self, "_generateItemListAndSizesDictIfNecessary");
  -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[NMSMediaItemGroupIterator indexesToBeRemoved](self, "indexesToBeRemoved");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectsAtIndexes:", v9);

      if (objc_msgSend(v7, "count"))
      {
        -[NMSMediaItemGroupIterator remainingContainers](self, "remainingContainers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "quotaData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setHasSkippedItems:", 0);

        ++v5;
      }
      else
      {
        -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectAtIndex:", v5);

        -[NMSMediaItemGroupIterator remainingContainers](self, "remainingContainers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeObjectAtIndex:", v5);

        -[NMSMediaItemGroupIterator indexesToBeRemoved](self, "indexesToBeRemoved");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObjectAtIndex:", v5);

      }
      -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    while (v5 < v17);
  }
  -[NMSMediaItemGroupIterator setCurrentContainerIndex:](self, "setCurrentContainerIndex:", 0);
  -[NMSMediaItemGroupIterator setCurrentItemIndex:](self, "setCurrentItemIndex:", 0);
  indexesToBeRemoved = self->_indexesToBeRemoved;
  self->_indexesToBeRemoved = 0;

}

- (unint64_t)sizeForCurrentIdentifier
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[NMSMediaItemGroupIterator _generateItemListAndSizesDictIfNecessary](self, "_generateItemListAndSizesDictIfNecessary");
  -[NMSMediaItemGroupIterator currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "minimumSize");
  else
    v4 = objc_msgSend(v3, "size");
  v5 = v4;

  return v5;
}

- (BOOL)isCurrentIdentifierEstimate
{
  void *v3;
  void *v4;
  char v5;

  -[NMSMediaItemGroupIterator _generateItemListAndSizesDictIfNecessary](self, "_generateItemListAndSizesDictIfNecessary");
  -[NMSMediaItemGroupIterator remainingContainers](self, "remainingContainers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", self->_currentContainerIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEstimate");

  return v5;
}

- (id)identifiersForContainersOfType:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NMSMediaItemGroupIterator itemGroups](self, "itemGroups", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "identifiersForContainerType:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)mediaContainersAboveQuota
{
  void *v2;
  void *v3;
  void *v4;

  -[NMSMediaItemGroupIterator itemGroups](self, "itemGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __54__NMSMediaItemGroupIterator_mediaContainersAboveQuota__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "quotaData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasItemsAboveQuota");

  return v3;
}

- (NSMutableArray)indexesToBeRemoved
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *indexesToBeRemoved;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  if (!self->_indexesToBeRemoved)
  {
    v3 = (void *)MEMORY[0x24BDBCEB8];
    -[NMSMediaItemGroupIterator remainingContainers](self, "remainingContainers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    indexesToBeRemoved = self->_indexesToBeRemoved;
    self->_indexesToBeRemoved = v5;

    -[NMSMediaItemGroupIterator remainingContainers](self, "remainingContainers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 0;
      do
      {
        v10 = self->_indexesToBeRemoved;
        objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v10, "addObject:", v11);

        ++v9;
        -[NMSMediaItemGroupIterator remainingContainers](self, "remainingContainers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

      }
      while (v9 < v13);
    }
  }
  return self->_indexesToBeRemoved;
}

- (void)_markToBeRemoved
{
  void *v3;
  id v4;

  -[NMSMediaItemGroupIterator indexesToBeRemoved](self, "indexesToBeRemoved");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addIndex:", -[NMSMediaItemGroupIterator currentItemIndex](self, "currentItemIndex"));

}

- (unint64_t)estimatedItemSize
{
  return self->_estimatedItemSize;
}

- (unint64_t)sizeForItemListWithinQuota
{
  return self->_sizeForItemListWithinQuota;
}

- (void)setSizeForItemListWithinQuota:(unint64_t)a3
{
  self->_sizeForItemListWithinQuota = a3;
}

- (unint64_t)nominatedItemSize
{
  return self->_nominatedItemSize;
}

- (void)setNominatedItemSize:(unint64_t)a3
{
  self->_nominatedItemSize = a3;
}

- (NSArray)itemGroups
{
  return self->_itemGroups;
}

- (void)setItemGroups:(id)a3
{
  objc_storeStrong((id *)&self->_itemGroups, a3);
}

- (void)setRemainingContainers:(id)a3
{
  objc_storeStrong((id *)&self->_remainingContainers, a3);
}

- (NSMutableArray)remainingItemLists
{
  return self->_remainingItemLists;
}

- (void)setRemainingItemLists:(id)a3
{
  objc_storeStrong((id *)&self->_remainingItemLists, a3);
}

- (unint64_t)currentContainerIndex
{
  return self->_currentContainerIndex;
}

- (void)setCurrentContainerIndex:(unint64_t)a3
{
  self->_currentContainerIndex = a3;
}

- (unint64_t)currentItemIndex
{
  return self->_currentItemIndex;
}

- (void)setCurrentItemIndex:(unint64_t)a3
{
  self->_currentItemIndex = a3;
}

- (void)setMutableItemListWithinQuota:(id)a3
{
  objc_storeStrong((id *)&self->_mutableItemListWithinQuota, a3);
}

- (void)setIndexesToBeRemoved:(id)a3
{
  objc_storeStrong((id *)&self->_indexesToBeRemoved, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesToBeRemoved, 0);
  objc_storeStrong((id *)&self->_mutableItemListWithinQuota, 0);
  objc_storeStrong((id *)&self->_remainingItemLists, 0);
  objc_storeStrong((id *)&self->_remainingContainers, 0);
  objc_storeStrong((id *)&self->_itemGroups, 0);
}

@end
