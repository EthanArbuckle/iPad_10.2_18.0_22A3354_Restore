@implementation ContinuousReadingController

- (id)nextReadingListItem
{
  -[ContinuousReadingController _updateCachedItemsIfNeeded](self, "_updateCachedItemsIfNeeded");
  return self->_nextContinuousItem;
}

- (void)_updateCachedItemsIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  ContinuousReadingItem *v6;
  ContinuousReadingItem *currentContinuousItem;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  ContinuousReadingItem *v16;
  ContinuousReadingItem *nextContinuousItem;
  void *v18;
  void *v19;
  void *v20;
  ContinuousReadingItem *v21;
  ContinuousReadingItem *previousContinuousItem;
  id v23;

  -[ContinuousReadingController _tabDocument](self, "_tabDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "readingListBookmarkID");

  if ((_DWORD)v4)
  {
    if (self->_activeDocumentBookmarkID != (_DWORD)v4)
    {
      -[ContinuousReadingController _clearCachedItems](self, "_clearCachedItems");
      self->_activeDocumentBookmarkID = v4;
      objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bookmarkWithID:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[ContinuousReadingItem itemWithReadingListItem:](ContinuousReadingItem, "itemWithReadingListItem:", v5);
      v6 = (ContinuousReadingItem *)objc_claimAutoreleasedReturnValue();
      currentContinuousItem = self->_currentContinuousItem;
      self->_currentContinuousItem = v6;

      v8 = objc_msgSend(v23, "indexOfReadingListBookmark:countingOnlyUnread:", v5, self->_unreadReadingListItemsOnly);
      v9 = v8;
      objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "readingListWithUnreadOnly:", self->_unreadReadingListItemsOnly);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      v13 = (v8 + 1);
      while (1)
      {
        v14 = v12;
        -[ContinuousReadingController _itemAtIndex:inReadingList:](self, "_itemAtIndex:inReadingList:", v13, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          break;
        -[WebBookmark safari_bestCurrentURL](v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (v13 + 1);
        if (v15)
        {
          +[ContinuousReadingItem itemWithReadingListItem:](ContinuousReadingItem, "itemWithReadingListItem:", v12);
          v16 = (ContinuousReadingItem *)objc_claimAutoreleasedReturnValue();
          nextContinuousItem = self->_nextContinuousItem;
          self->_nextContinuousItem = v16;

          break;
        }
      }
      v18 = 0;
      while (v9 - 1 < v8)
      {
        -[ContinuousReadingController _itemAtIndex:inReadingList:](self, "_itemAtIndex:inReadingList:", (v9 - 1), v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
          goto LABEL_16;
        -[WebBookmark safari_bestCurrentURL](v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = v19;
        --v9;
        if (v20)
          goto LABEL_15;
      }
      v19 = v18;
      if (!v18)
        goto LABEL_16;
LABEL_15:
      +[ContinuousReadingItem itemWithReadingListItem:](ContinuousReadingItem, "itemWithReadingListItem:", v19);
      v21 = (ContinuousReadingItem *)objc_claimAutoreleasedReturnValue();
      previousContinuousItem = self->_previousContinuousItem;
      self->_previousContinuousItem = v21;

LABEL_16:
    }
  }
  else
  {
    -[ContinuousReadingController _clearCachedItems](self, "_clearCachedItems");
  }
}

- (id)_tabDocument
{
  return -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
}

- (void)_clearCachedItems
{
  ContinuousReadingItem *currentContinuousItem;
  ContinuousReadingItem *nextContinuousItem;
  ContinuousReadingItem *previousContinuousItem;

  self->_activeDocumentBookmarkID = 0;
  currentContinuousItem = self->_currentContinuousItem;
  self->_currentContinuousItem = 0;

  nextContinuousItem = self->_nextContinuousItem;
  self->_nextContinuousItem = 0;

  previousContinuousItem = self->_previousContinuousItem;
  self->_previousContinuousItem = 0;

}

- (ContinuousReadingController)initWithTabController:(id)a3
{
  id v5;
  ContinuousReadingController *v6;
  ContinuousReadingController *v7;
  ContinuousReadingController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ContinuousReadingController;
  v6 = -[ContinuousReadingController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabController, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[ContinuousReadingController _clearCachedItems](self, "_clearCachedItems");
  v3.receiver = self;
  v3.super_class = (Class)ContinuousReadingController;
  -[ContinuousReadingController dealloc](&v3, sel_dealloc);
}

- (id)currentReadingListItem
{
  -[ContinuousReadingController _updateCachedItemsIfNeeded](self, "_updateCachedItemsIfNeeded");
  return self->_currentContinuousItem;
}

- (id)previousReadingListItem
{
  -[ContinuousReadingController _updateCachedItemsIfNeeded](self, "_updateCachedItemsIfNeeded");
  return self->_previousContinuousItem;
}

- (id)_itemAtIndex:(unsigned int)a3 inReadingList:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  if (objc_msgSend(v5, "bookmarkCount") <= v4)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "bookmarkAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)unreadReadingListItemsOnly
{
  return self->_unreadReadingListItemsOnly;
}

- (void)setUnreadReadingListItemsOnly:(BOOL)a3
{
  self->_unreadReadingListItemsOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousContinuousItem, 0);
  objc_storeStrong((id *)&self->_nextContinuousItem, 0);
  objc_storeStrong((id *)&self->_currentContinuousItem, 0);
  objc_storeStrong((id *)&self->_tabController, 0);
}

@end
