@implementation NMSAlternatingMediaItemGroupIterator

- (unint64_t)iteratingOrder
{
  return 1;
}

- (void)_generateItemListAndSizesDictIfNecessary
{
  void *v3;
  objc_super v4;

  -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4.receiver = self;
    v4.super_class = (Class)NMSAlternatingMediaItemGroupIterator;
    -[NMSMediaItemGroupIterator _generateItemListAndSizesDictIfNecessary](&v4, sel__generateItemListAndSizesDictIfNecessary);
    -[NMSAlternatingMediaItemGroupIterator _resetMaxItemListSize](self, "_resetMaxItemListSize");
  }
}

- (void)_continueToNextIdentifier
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;

  -[NMSAlternatingMediaItemGroupIterator _generateItemListAndSizesDictIfNecessary](self, "_generateItemListAndSizesDictIfNecessary");
  do
  {
    if (-[NMSMediaItemGroupIterator currentItemIndex](self, "currentItemIndex") >= self->_maxItemListSize)
      break;
    v3 = -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex") + 1;
    -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v3 >= v5)
    {
      -[NMSMediaItemGroupIterator setCurrentContainerIndex:](self, "setCurrentContainerIndex:", 0);
      -[NMSMediaItemGroupIterator setCurrentItemIndex:](self, "setCurrentItemIndex:", -[NMSMediaItemGroupIterator currentItemIndex](self, "currentItemIndex") + 1);
    }
    else
    {
      -[NMSMediaItemGroupIterator setCurrentContainerIndex:](self, "setCurrentContainerIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex") + 1);
    }
    -[NMSMediaItemGroupIterator currentItem](self, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (!v6);
}

- (void)_continueToNextContainer
{
  -[NMSAlternatingMediaItemGroupIterator _generateItemListAndSizesDictIfNecessary](self, "_generateItemListAndSizesDictIfNecessary");
  -[NMSMediaItemGroupIterator setCurrentContainerIndex:](self, "setCurrentContainerIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex") + 1);
}

- (void)markAllRemainingContainersAsSkipped
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void (**v6)(void);
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[NMSAlternatingMediaItemGroupIterator _generateItemListAndSizesDictIfNecessary](self, "_generateItemListAndSizesDictIfNecessary");
  v3 = -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v11 = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__NMSAlternatingMediaItemGroupIterator_markAllRemainingContainersAsSkipped__block_invoke;
  v7[3] = &unk_24D6476D8;
  v7[4] = self;
  v7[5] = &v8;
  v6 = (void (**)(void))MEMORY[0x219A03B50](v7);
  v6[2]();
  -[NMSMediaItemGroupIterator setCurrentContainerIndex:](self, "setCurrentContainerIndex:", 0);
  -[NMSMediaItemGroupIterator setCurrentItemIndex:](self, "setCurrentItemIndex:", -[NMSMediaItemGroupIterator currentItemIndex](self, "currentItemIndex") + 1);
  v9[3] = v3;
  ((void (*)(void (**)(void)))v6[2])(v6);

  _Block_object_dispose(&v8, 8);
}

unint64_t __75__NMSAlternatingMediaItemGroupIterator_markAllRemainingContainersAsSkipped__block_invoke(uint64_t a1)
{
  void *i;
  unint64_t result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  for (i = *(void **)(a1 + 32); ; i = *(void **)(a1 + 32))
  {
    result = objc_msgSend(i, "currentContainerIndex");
    if (result >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      break;
    objc_msgSend(*(id *)(a1 + 32), "currentItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "remainingContainers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "currentContainerIndex"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "quotaData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHasSkippedItems:", 1);

    }
    objc_msgSend(*(id *)(a1 + 32), "_continueToNextContainer");
  }
  return result;
}

- (void)resetToIterateOverQuotaIdentifiers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NMSAlternatingMediaItemGroupIterator;
  -[NMSMediaItemGroupIterator resetToIterateOverQuotaIdentifiers](&v3, sel_resetToIterateOverQuotaIdentifiers);
  -[NMSAlternatingMediaItemGroupIterator _resetMaxItemListSize](self, "_resetMaxItemListSize");
}

- (void)_resetMaxItemListSize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t maxItemListSize;
  unint64_t v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  self->_maxItemListSize = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        maxItemListSize = self->_maxItemListSize;
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "count");
        if (maxItemListSize <= v9)
          v10 = v9;
        else
          v10 = maxItemListSize;
        self->_maxItemListSize = v10;
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

@end
