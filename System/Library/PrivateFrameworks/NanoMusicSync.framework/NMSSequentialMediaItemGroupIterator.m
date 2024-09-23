@implementation NMSSequentialMediaItemGroupIterator

- (unint64_t)iteratingOrder
{
  return 0;
}

- (void)_continueToNextIdentifier
{
  unint64_t v3;
  NMSSequentialMediaItemGroupIterator *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;

  -[NMSMediaItemGroupIterator _generateItemListAndSizesDictIfNecessary](self, "_generateItemListAndSizesDictIfNecessary");
  v3 = -[NMSMediaItemGroupIterator currentItemIndex](self, "currentItemIndex") + 1;
  v4 = self;
  while (1)
  {
    -[NMSMediaItemGroupIterator setCurrentItemIndex:](v4, "setCurrentItemIndex:", v3);
    v5 = -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex");
    -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 >= objc_msgSend(v10, "count"))
      break;
    v6 = -[NMSMediaItemGroupIterator currentItemIndex](self, "currentItemIndex");
    -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v6 < v9)
      return;
    -[NMSMediaItemGroupIterator setCurrentContainerIndex:](self, "setCurrentContainerIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex") + 1);
    v4 = self;
    v3 = 0;
  }

}

- (void)_continueToNextContainer
{
  -[NMSMediaItemGroupIterator _generateItemListAndSizesDictIfNecessary](self, "_generateItemListAndSizesDictIfNecessary");
  -[NMSMediaItemGroupIterator setCurrentContainerIndex:](self, "setCurrentContainerIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex") + 1);
  -[NMSMediaItemGroupIterator setCurrentItemIndex:](self, "setCurrentItemIndex:", 0);
}

- (void)markAllRemainingContainersAsSkipped
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NMSMediaItemGroupIterator _generateItemListAndSizesDictIfNecessary](self, "_generateItemListAndSizesDictIfNecessary");
  while (1)
  {
    v3 = -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex");
    -[NMSMediaItemGroupIterator remainingItemLists](self, "remainingItemLists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v3 >= v5)
      break;
    -[NMSMediaItemGroupIterator currentItem](self, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NMSMediaItemGroupIterator remainingContainers](self, "remainingContainers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "quotaData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHasSkippedItems:", 1);

    }
    -[NMSSequentialMediaItemGroupIterator _continueToNextContainer](self, "_continueToNextContainer");
  }
}

@end
