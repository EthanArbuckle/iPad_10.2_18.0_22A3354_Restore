@implementation SUUIItemListTableViewController

- (SUUIItemListTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUUIItemListTableViewController *v4;
  void *v5;
  uint64_t v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIItemListTableViewController;
  v4 = -[SUUIItemListTableViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    v7 = 95.0;
    if (v6 != 1)
      v7 = 84.0;
    v4->_rowHeight = v7;
    v4->_selectionStyle = v6 != 1;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIItemCollectionController setDelegate:](self->_itemCollectionController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIItemListTableViewController;
  -[SUUIItemListTableViewController dealloc](&v3, sel_dealloc);
}

- (void)addItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  SUUIItemList *itemList;
  void *v10;
  SUUIItemCollectionController *itemCollectionController;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUUIItemList items](self->_itemList, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (objc_msgSend(v14, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v6 + v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

      itemList = self->_itemList;
      objc_msgSend(v14, "objectAtIndex:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIItemList addItem:](itemList, "addItem:", v10);

      ++v7;
    }
    while (v7 < objc_msgSend(v14, "count"));
  }
  itemCollectionController = self->_itemCollectionController;
  -[SUUIItemList items](self->_itemList, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemCollectionController setItems:](itemCollectionController, "setItems:", v12);

  -[SUUIItemListTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "beginUpdates");
  objc_msgSend(v13, "insertRowsAtIndexPaths:withRowAnimation:", v4, 5);
  objc_msgSend(v13, "endUpdates");

}

- (SUUIItemArtworkContext)artworkContext
{
  void *v2;
  void *v3;

  -[SUUIItemListTableViewController _itemCollectionController](self, "_itemCollectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artworkContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUUIItemArtworkContext *)v3;
}

- (SUUIResourceLoader)artworkLoader
{
  return -[SUUIItemCollectionController artworkLoader](self->_itemCollectionController, "artworkLoader");
}

- (void)deleteRowsAtIndexPaths:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SUUIItemCollectionController *itemCollectionController;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
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
        objc_msgSend(v5, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10++), "row", (_QWORD)v14));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[SUUIItemList removeItemsAtIndexes:](self->_itemList, "removeItemsAtIndexes:", v5);
  itemCollectionController = self->_itemCollectionController;
  -[SUUIItemList items](self->_itemList, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemCollectionController setItems:](itemCollectionController, "setItems:", v12);

  -[SUUIItemListTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deleteRowsAtIndexPaths:withRowAnimation:", v6, 100);

}

- (CGRect)frameForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[SUUIItemListTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForRowAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "bounds");
    objc_msgSend(v6, "convertRect:toView:", 0);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v8 = *MEMORY[0x24BDBF070];
    v10 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v12 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v14 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (SUUIStyledImageDataConsumer)iconDataConsumer
{
  void *v2;
  void *v3;

  -[SUUIItemListTableViewController _itemCollectionController](self, "_itemCollectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconDataConsumer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUUIStyledImageDataConsumer *)v3;
}

- (void)loadNextPageOfArtworkWithReason:(int64_t)a3
{
  id v4;

  -[SUUIItemListTableViewController _itemCollectionController](self, "_itemCollectionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadNextPageOfArtworkWithReason:", a3);

}

- (id)popIconImageViewForItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableIndexSet *hiddenIconIndexSet;
  NSMutableIndexSet *v23;
  NSMutableIndexSet *v24;

  -[SUUIItemListTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "layout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v18 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(v8, "iconImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithImage:", v19);

    -[SUUIItemListTableViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "convertRect:fromView:", v7, v11, v13, v15, v17);
    objc_msgSend(v20, "setFrame:");

    hiddenIconIndexSet = self->_hiddenIconIndexSet;
    if (!hiddenIconIndexSet)
    {
      v23 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
      v24 = self->_hiddenIconIndexSet;
      self->_hiddenIconIndexSet = v23;

      hiddenIconIndexSet = self->_hiddenIconIndexSet;
    }
    -[NSMutableIndexSet addIndex:](hiddenIconIndexSet, "addIndex:", a3);
    objc_msgSend(v8, "setIconImageHidden:", 1);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)setArtworkLoader:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIItemListTableViewController _itemCollectionController](self, "_itemCollectionController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArtworkLoader:", v4);

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateWantsCanRemove = objc_opt_respondsToSelector() & 1;

    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateWantsDidRemove = objc_opt_respondsToSelector() & 1;

    self->_delegateWantsWillDisplay = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setIconDataConsumer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIItemListTableViewController _itemCollectionController](self, "_itemCollectionController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIconDataConsumer:", v4);

}

- (void)setItemArtworkContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIItemListTableViewController _itemCollectionController](self, "_itemCollectionController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArtworkContext:", v4);

}

- (void)setItemCellClass:(Class)a3
{
  id v4;

  -[SUUIItemListTableViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", a3, CFSTR("ItemCellReuseIdentifier"));

}

- (void)setItemList:(id)a3
{
  SUUIItemList *v5;
  void *v6;
  SSVLoadURLOperation *loadMoreOperation;
  SSVLoadURLOperation *v8;
  void *v9;
  SUUIItemCollectionController *itemCollectionController;
  void *v11;
  SUUIItemCollectionController *v12;
  SUUIItemList *v13;

  v5 = (SUUIItemList *)a3;
  if (self->_itemList != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_itemList, a3);
    self->_didLoadMore = 0;
    if (-[SUUIItemListTableViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SUUIItemListTableViewController tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    loadMoreOperation = self->_loadMoreOperation;
    if (loadMoreOperation)
    {
      -[SSVLoadURLOperation setOutputBlock:](loadMoreOperation, "setOutputBlock:", 0);
      -[SSVLoadURLOperation cancel](self->_loadMoreOperation, "cancel");
      v8 = self->_loadMoreOperation;
      self->_loadMoreOperation = 0;

      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deleteSections:withRowAnimation:", v9, 5);

    }
    itemCollectionController = self->_itemCollectionController;
    -[SUUIItemList items](self->_itemList, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemCollectionController setItems:](itemCollectionController, "setItems:", v11);

    if (v6)
    {
      objc_msgSend(v6, "reloadData");
      v12 = self->_itemCollectionController;
      objc_msgSend(v6, "contentOffset");
      -[SUUIItemCollectionController precacheNextPageArtworkForOffset:direction:](v12, "precacheNextPageArtworkForOffset:direction:");
    }

    v5 = v13;
  }

}

- (void)setRowHeight:(double)a3
{
  id v4;

  if (self->_rowHeight != a3)
  {
    self->_rowHeight = a3;
    if (-[SUUIItemListTableViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SUUIItemListTableViewController tableView](self, "tableView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRowHeight:", self->_rowHeight);

    }
  }
}

- (void)setSeparatorStyle:(int64_t)a3
{
  id v4;

  if (self->_separatorStyle != a3)
  {
    self->_separatorStyle = a3;
    if (-[SUUIItemListTableViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SUUIItemListTableViewController tableView](self, "tableView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reloadData");

    }
  }
}

- (void)unhideIcons
{
  void *v3;
  NSMutableIndexSet *hiddenIconIndexSet;
  id v5;
  NSMutableIndexSet *v6;
  _QWORD v7[4];
  id v8;

  if (self->_hiddenIconIndexSet)
  {
    if (-[SUUIItemListTableViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SUUIItemListTableViewController tableView](self, "tableView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      hiddenIconIndexSet = self->_hiddenIconIndexSet;
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __46__SUUIItemListTableViewController_unhideIcons__block_invoke;
      v7[3] = &unk_2511F4E08;
      v8 = v3;
      v5 = v3;
      -[NSMutableIndexSet enumerateIndexesWithOptions:usingBlock:](hiddenIconIndexSet, "enumerateIndexesWithOptions:usingBlock:", 0, v7);

    }
    v6 = self->_hiddenIconIndexSet;
    self->_hiddenIconIndexSet = 0;

  }
}

void __46__SUUIItemListTableViewController_unhideIcons__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a2, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconImageHidden:", 0);

}

- (NSString)visibleMetricsImpressions
{
  SUUIMetricsImpressionSession *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(SUUIMetricsImpressionSession);
  -[SUUIItemListTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForVisibleRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIItemList items](self->_itemList, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "row", (_QWORD)v18);
        if (objc_msgSend(v12, "section") || v13 >= objc_msgSend(v6, "count"))
        {
          v15 = 0;
        }
        else
        {
          objc_msgSend(v6, "objectAtIndex:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "itemIdentifier");

        }
        -[SUUIMetricsImpressionSession addItemIdentifier:](v3, "addItemIdentifier:", v15);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  -[SUUIMetricsImpressionSession impressionsString](v3, "impressionsString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (id)itemCollectionController:(id)a3 cellLayoutForItemIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SUUIItemListTableViewController tableView](self, "tableView", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (_NSRange)itemCollectionController:(id)a3 itemPageRangeForOffset:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  y = a4.y;
  x = a4.x;
  -[SUUIItemListTableViewController tableView](self, "tableView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SUUIItemCollectionItemPageRangeForTableView(v6, x, y);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)visibleItemRangeForItemCollectionController:(id)a3
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  -[SUUIItemListTableViewController tableView](self, "tableView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SUUIItemCollectionVisibleItemRangeForTableView(v3);
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIItemListTableViewController;
  -[SUUIItemListTableViewController loadView](&v6, sel_loadView);
  -[SUUIItemListTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRowHeight:", self->_rowHeight);
  objc_msgSend(v3, "setSeparatorStyle:", 0);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", objc_msgSend(v4, "userInterfaceIdiom") == 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("LoadMoreCellReuseIdentifier"));
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[SUUIItemCollectionController enterForeground](self->_itemCollectionController, "enterForeground");
  -[SUUIItemListTableViewController _itemCollectionController](self, "_itemCollectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemListTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  objc_msgSend(v5, "precacheNextPageArtworkForOffset:direction:");

  v7.receiver = self;
  v7.super_class = (Class)SUUIItemListTableViewController;
  -[SUUIItemListTableViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIItemListTableViewController;
  -[SUUIItemListTableViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SUUIItemCollectionController enterBackground](self->_itemCollectionController, "enterBackground");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[SUUIItemCollectionController scrollViewDidEndDecelerating:](self->_itemCollectionController, "scrollViewDidEndDecelerating:", a3);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "itemListWillBeginDragging:", self);

  }
  -[SUUIItemCollectionController scrollViewWillBeginDragging:](self->_itemCollectionController, "scrollViewWillBeginDragging:", v7);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  id v12;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5->y;
  v12 = v9;
  objc_msgSend(v9, "contentSize");
  if (v10 >= v11 * 0.33)
    -[SUUIItemListTableViewController _loadRemainingItemsWithPriority:](self, "_loadRemainingItemsWithPriority:", 0);
  -[SUUIItemCollectionController scrollViewWillEndDragging:withVelocity:targetContentOffset:](self->_itemCollectionController, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v12, a5, x, y);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_loadMoreOperation)
    return 2;
  else
    return 1;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;

  if (!self->_delegateWantsCanRemove)
    return self->_delegateWantsDidRemove;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_msgSend(WeakRetained, "itemList:canRemoveItemAtIndexPath:", self, v5);

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "section"))
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("LoadMoreCellReuseIdentifier"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ItemCellReuseIdentifier"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setSelectionStyle:", self->_selectionStyle);
    objc_msgSend(v8, "multipleSelectionBackgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_alloc_init(MEMORY[0x24BEBDB00]);
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v11);

      objc_msgSend(v8, "setMultipleSelectionBackgroundView:", v10);
    }
    objc_msgSend(v8, "layout");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClientContext:", self->_clientContext);
  }

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  if (a4)
    return 1;
  -[SUUIItemList items](self->_itemList, "items", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (void)itemTableView:(id)a3 didConfirmItemOfferForTableViewCell:(id)a4
{
  void *v6;
  id WeakRetained;
  char v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_msgSend(a3, "indexPathForCell:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "section"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[SUUIItemCollectionController items](self->_itemCollectionController, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "itemList:didConfirmItemOfferForItem:atIndexPath:", self, v10, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_7;
    }
    else
    {
      -[SUUIItemCollectionController performActionForItemAtIndex:](self->_itemCollectionController, "performActionForItemAtIndex:", objc_msgSend(v6, "row"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
LABEL_7:

        goto LABEL_8;
      }
    }
    objc_msgSend(v14, "layout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItemState:animated:", v12, 1);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)itemTableView:(id)a3 didRemoveCell:(id)a4
{
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  objc_msgSend(a3, "indexPathForCell:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    v5 = v9;
    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "itemList:didRemoveItemAtIndexPath:", self, v9);

      v5 = v9;
    }
  }

}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  _BOOL4 v8;
  id WeakRetained;
  id v10;

  v10 = a5;
  v8 = -[SUUIItemListTableViewController tableView:canEditRowAtIndexPath:](self, "tableView:canEditRowAtIndexPath:", a3);
  if (a4 == 1 && v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "itemList:didRemoveItemAtIndexPath:", self, v10);

  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id WeakRetained;
  char v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  if (!objc_msgSend(v10, "section"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[SUUIItemList items](self->_itemList, "items");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v10, "row"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "itemList:didDeselectItem:atIndexPath:", self, v8, v10);

    }
  }

}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;

  v8 = a4;
  v7 = a5;
  if (objc_msgSend(v7, "section") == 1)
    objc_msgSend(v8, "stopAnimating");
  else
    -[SUUIItemCollectionController didEndDisplayingItemAtIndex:](self->_itemCollectionController, "didEndDisplayingItemAtIndex:", objc_msgSend(v7, "row"));

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id WeakRetained;
  char v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  if (!objc_msgSend(v10, "section"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[SUUIItemList items](self->_itemList, "items");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v10, "row"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "itemList:didSelectItem:atIndexPath:", self, v8, v10);

    }
  }

}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[SUUIItemListTableViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "itemList:titleForDeleteConfirmationButtonForRowAtIndexPath:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SUUIItemListTableViewController clientContext](self, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "localizedStringForKey:", CFSTR("SWIPE_TO_DELETE_BUTTON"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SWIPE_TO_DELETE_BUTTON"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id WeakRetained;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = a5;
  -[SUUIUber colorScheme](self->_uber, "colorScheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "setBackgroundColor:", v11);
  }
  else
  {
    objc_msgSend(v25, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v12);

  }
  if (self->_separatorStyle == 1)
  {
    objc_msgSend(v8, "setBottomBorderColor:", 0);
  }
  else
  {
    -[SUUIUber colorScheme](self->_uber, "colorScheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "primaryTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v8, "setBottomBorderColor:", v14);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.75, 1.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBottomBorderColor:", v15);

    }
  }
  if (objc_msgSend(v9, "section") == 1)
  {
    objc_msgSend(v8, "startAnimating");
  }
  else
  {
    objc_msgSend(v8, "layout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v9, "row");
    -[SUUIItemList items](self->_itemList, "items");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndex:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "configureForItem:clientContext:rowIndex:", v19, self->_clientContext, v17);
    -[SUUIItemListTableViewController _itemCollectionController](self, "_itemCollectionController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "configureCellLayout:forIndex:", v16, v17);

    objc_msgSend(v16, "setIconImageHidden:", -[NSMutableIndexSet containsIndex:](self->_hiddenIconIndexSet, "containsIndex:", v17));
    -[SUUIUber colorScheme](self->_uber, "colorScheme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setColoringWithColorScheme:", v21);

    if (self->_imageBoundingSize.width != *MEMORY[0x24BDBF148]
      || self->_imageBoundingSize.height != *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      objc_msgSend(v16, "setImageBoundingSize:");
    }
    if (self->_delegateWantsWillDisplay)
    {
      -[SUUIItemList items](self->_itemList, "items");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndex:", objc_msgSend(v9, "row"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "itemList:willDisplayCellForItem:atIndexPath:", self, v23, v9);

    }
  }

}

- (void)_finishLoadMoreOperationWithItems:(id)a3 error:(id)a4
{
  SSVLoadURLOperation *loadMoreOperation;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  SUUIItemList *itemList;
  void *v14;
  SUUIItemCollectionController *itemCollectionController;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  self->_didLoadMore = 1;
  -[SSVLoadURLOperation setOutputBlock:](self->_loadMoreOperation, "setOutputBlock:", 0);
  loadMoreOperation = self->_loadMoreOperation;
  self->_loadMoreOperation = 0;

  v6 = 0;
  if (-[SUUIItemListTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SUUIItemListTableViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[SUUIItemList items](self->_itemList, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v10 = objc_msgSend(v18, "count");
    if (v9 < v10)
    {
      v11 = v10;
      do
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v9, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

        itemList = self->_itemList;
        objc_msgSend(v18, "objectAtIndex:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIItemList addItem:](itemList, "addItem:", v14);

        ++v9;
      }
      while (v11 != v9);
    }
    itemCollectionController = self->_itemCollectionController;
    -[SUUIItemList items](self->_itemList, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemCollectionController setItems:](itemCollectionController, "setItems:", v16);

    objc_msgSend(v6, "beginUpdates");
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteSections:withRowAnimation:", v17, 5);

    objc_msgSend(v6, "insertRowsAtIndexPaths:withRowAnimation:", v7, 5);
    objc_msgSend(v6, "endUpdates");
    -[SUUIItemListTableViewController loadNextPageOfArtworkWithReason:](self, "loadNextPageOfArtworkWithReason:", -1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteSections:withRowAnimation:", v7, 5);
  }

}

- (id)_itemCollectionController
{
  SUUIItemCollectionController *itemCollectionController;
  SUUIItemCollectionController *v4;
  SUUIItemCollectionController *v5;
  SUUIItemCollectionController *v6;
  void *v7;
  SUUIItemCollectionController *v8;
  void *v9;

  itemCollectionController = self->_itemCollectionController;
  if (!itemCollectionController)
  {
    v4 = -[SUUIItemCollectionController initWithClientContext:]([SUUIItemCollectionController alloc], "initWithClientContext:", self->_clientContext);
    v5 = self->_itemCollectionController;
    self->_itemCollectionController = v4;

    -[SUUIItemCollectionController setDelegate:](self->_itemCollectionController, "setDelegate:", self);
    v6 = self->_itemCollectionController;
    +[SUUIStyledImageDataConsumer listIconConsumer](SUUIStyledImageDataConsumer, "listIconConsumer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemCollectionController setIconDataConsumer:](v6, "setIconDataConsumer:", v7);

    -[SUUIItemCollectionController setArtworkContext:](self->_itemCollectionController, "setArtworkContext:", self->_artworkContext);
    v8 = self->_itemCollectionController;
    -[SUUIItemList items](self->_itemList, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemCollectionController setItems:](v8, "setItems:", v9);

    -[SUUIItemCollectionController setNumberOfItemsPerPage:](self->_itemCollectionController, "setNumberOfItemsPerPage:", 10);
    -[SUUIItemCollectionController setNumberOfPagesToCacheAhead:](self->_itemCollectionController, "setNumberOfPagesToCacheAhead:", 1.5);
    itemCollectionController = self->_itemCollectionController;
  }
  return itemCollectionController;
}

- (void)_loadRemainingItemsWithPriority:(int64_t)a3
{
  void *v5;
  void *v6;
  SSVLoadURLOperation *v7;
  SSVLoadURLOperation *loadMoreOperation;
  SSVLoadURLOperation *v9;
  void *v10;
  void *v11;
  void *v12;
  SSVLoadURLOperation *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id location;

  if (!self->_didLoadMore && self->_loadsMoreItems && !self->_loadMoreOperation)
  {
    -[SUUIItemList seeAllURLString](self->_itemList, "seeAllURLString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (SSVLoadURLOperation *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURL:", v6);
      loadMoreOperation = self->_loadMoreOperation;
      self->_loadMoreOperation = v7;

      -[SSVLoadURLOperation setQueuePriority:](self->_loadMoreOperation, "setQueuePriority:", a3);
      v9 = self->_loadMoreOperation;
      -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVLoadURLOperation setStoreFrontSuffix:](v9, "setStoreFrontSuffix:", v10);

      +[SSVURLDataConsumer consumer](SUUILoadMoreDataConsumer, "consumer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIItemList unavailableItemIdentifiers](self->_itemList, "unavailableItemIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setUnavailableItemIdentifiers:", v12);

      -[SSVLoadURLOperation setDataConsumer:](self->_loadMoreOperation, "setDataConsumer:", v11);
      objc_initWeak(&location, self);
      v13 = self->_loadMoreOperation;
      v16 = MEMORY[0x24BDAC760];
      v17 = 3221225472;
      v18 = __67__SUUIItemListTableViewController__loadRemainingItemsWithPriority___block_invoke;
      v19 = &unk_2511F58B8;
      objc_copyWeak(&v20, &location);
      -[SSVLoadURLOperation setOutputBlock:](v13, "setOutputBlock:", &v16);
      if (-[SUUIItemListTableViewController isViewLoaded](self, "isViewLoaded", v16, v17, v18, v19))
      {
        -[SUUIItemListTableViewController tableView](self, "tableView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "insertSections:withRowAnimation:", v15, 5);

      }
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", self->_loadMoreOperation);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);

    }
  }
}

void __67__SUUIItemListTableViewController__loadRemainingItemsWithPriority___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SUUIItemListTableViewController__loadRemainingItemsWithPriority___block_invoke_2;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __67__SUUIItemListTableViewController__loadRemainingItemsWithPriority___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishLoadMoreOperationWithItems:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (SUUIItemListTableDelegate)delegate
{
  return (SUUIItemListTableDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setArtworkContext:(id)a3
{
  objc_storeStrong((id *)&self->_artworkContext, a3);
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (CGSize)imageBoundingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageBoundingSize.width;
  height = self->_imageBoundingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageBoundingSize:(CGSize)a3
{
  self->_imageBoundingSize = a3;
}

- (SUUIItemList)itemList
{
  return self->_itemList;
}

- (BOOL)loadsMoreItems
{
  return self->_loadsMoreItems;
}

- (void)setLoadsMoreItems:(BOOL)a3
{
  self->_loadsMoreItems = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (int64_t)selectionStyle
{
  return self->_selectionStyle;
}

- (void)setSelectionStyle:(int64_t)a3
{
  self->_selectionStyle = a3;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (SUUIUber)uber
{
  return self->_uber;
}

- (void)setUber:(id)a3
{
  objc_storeStrong((id *)&self->_uber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uber, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_itemList, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadMoreOperation, 0);
  objc_storeStrong((id *)&self->_itemCollectionController, 0);
  objc_storeStrong((id *)&self->_artworkContext, 0);
  objc_storeStrong((id *)&self->_hiddenIconIndexSet, 0);
}

@end
