@implementation SUUIItemGridViewController

- (SUUIItemGridViewController)initWithRowHeight:(double)a3
{
  SUUIItemGridViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIItemGridViewController;
  result = -[SUUIItemGridViewController init](&v5, sel_init);
  if (result)
    result->_rowHeight = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", 0);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  -[SUUIItemCollectionController setDelegate:](self->_itemCollectionController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIItemGridViewController;
  -[SUUIItemGridViewController dealloc](&v3, sel_dealloc);
}

- (SUUIItemArtworkContext)artworkContext
{
  return -[SUUIItemCollectionController artworkContext](self->_itemCollectionController, "artworkContext");
}

- (CGPoint)contentOffset
{
  UICollectionView *collectionView;
  double v3;
  double v4;
  CGPoint result;

  collectionView = self->_collectionView;
  if (collectionView)
  {
    -[UICollectionView contentOffset](collectionView, "contentOffset");
  }
  else
  {
    v3 = *MEMORY[0x24BDBEFB0];
    v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (SUUIStyledImageDataConsumer)iconDataConsumer
{
  return -[SUUIItemCollectionController iconDataConsumer](self->_itemCollectionController, "iconDataConsumer");
}

- (void)loadNextPageOfArtworkWithReason:(int64_t)a3
{
  id v4;

  -[SUUIItemGridViewController _itemCollectionController](self, "_itemCollectionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadNextPageOfArtworkWithReason:", a3);

}

- (NSOperationQueue)operationQueue
{
  NSOperationQueue *operationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 2);
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (id)popIconImageViewForItemAtIndex:(int64_t)a3
{
  UICollectionView *collectionView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  NSMutableIndexSet *hiddenIconIndexSet;
  NSMutableIndexSet *v23;
  NSMutableIndexSet *v24;

  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "iconImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v19 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(v8, "iconImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v19, "initWithImage:", v20);

    -[SUUIItemGridViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "convertRect:fromView:", v7, v12, v14, v16, v18);
    objc_msgSend(v9, "setFrame:");

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

  return v9;
}

- (void)removeItemsAtIndexes:(id)a3
{
  -[NSMutableArray removeObjectsAtIndexes:](self->_items, "removeObjectsAtIndexes:", a3);
  -[SUUIItemCollectionController setItems:](self->_itemCollectionController, "setItems:", self->_items);
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
}

- (void)setArtworkContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIItemGridViewController _itemCollectionController](self, "_itemCollectionController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArtworkContext:", v4);

}

- (void)setContentOffset:(CGPoint)a3
{
  -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", a3.x, a3.y);
}

- (void)setIconDataConsumer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIItemGridViewController _itemCollectionController](self, "_itemCollectionController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIconDataConsumer:", v4);

}

- (void)setItemCellClass:(Class)a3
{
  id v4;

  -[SUUIItemGridViewController _collectionView](self, "_collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", a3, CFSTR("ItemCellReuseIdentifier"));

}

- (void)setItems:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *items;

  if (self->_items != a3)
  {
    v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    items = self->_items;
    self->_items = v4;

    -[SUUIItemCollectionController setItems:](self->_itemCollectionController, "setItems:", self->_items);
    -[UICollectionView reloadData](self->_collectionView, "reloadData");
  }
}

- (void)unhideIcons
{
  NSMutableIndexSet *hiddenIconIndexSet;
  NSMutableIndexSet *v4;
  _QWORD v5[5];

  hiddenIconIndexSet = self->_hiddenIconIndexSet;
  if (hiddenIconIndexSet)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __41__SUUIItemGridViewController_unhideIcons__block_invoke;
    v5[3] = &unk_2511F4E08;
    v5[4] = self;
    -[NSMutableIndexSet enumerateIndexesWithOptions:usingBlock:](hiddenIconIndexSet, "enumerateIndexesWithOptions:usingBlock:", 0, v5);
    v4 = self->_hiddenIconIndexSet;
    self->_hiddenIconIndexSet = 0;

  }
}

void __41__SUUIItemGridViewController_unhideIcons__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForItemAtIndexPath:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconImageHidden:", 0);

}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[SUUIItemGridViewController _collectionView](self, "_collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");
  objc_msgSend(v5, "addSubview:", v3);
  objc_msgSend(v3, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[SUUIItemGridViewController setView:](self, "setView:", v5);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SUUIItemCollectionController enterForeground](self->_itemCollectionController, "enterForeground");
  -[SUUIItemGridViewController _itemCollectionController](self, "_itemCollectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
  objc_msgSend(v5, "precacheNextPageArtworkForOffset:direction:");

  v6.receiver = self;
  v6.super_class = (Class)SUUIItemGridViewController;
  -[SUUIItemGridViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIItemGridViewController;
  -[SUUIItemGridViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SUUIItemCollectionController enterBackground](self->_itemCollectionController, "enterBackground");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  -[SUUIItemGridViewController _reloadLayout](self, "_reloadLayout");
  v3.receiver = self;
  v3.super_class = (Class)SUUIItemGridViewController;
  -[SUUIItemGridViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
}

- (id)itemCollectionController:(id)a3 cellLayoutForItemIndex:(int64_t)a4
{
  UICollectionView *collectionView;
  void *v5;
  void *v6;
  void *v7;

  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_NSRange)itemCollectionController:(id)a3 itemPageRangeForOffset:(CGPoint)a4
{
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v4 = SUUIItemCollectionItemPageRangeForCollectionView(self->_collectionView, a4.x, a4.y);
  result.length = v5;
  result.location = v4;
  return result;
}

- (_NSRange)visibleItemRangeForItemCollectionController:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = SUUIItemCollectionVisibleItemRangeForCollectionView(self->_collectionView);
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)itemCollectionView:(id)a3 didConfirmItemOfferForCell:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "indexPathForCell:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemCollectionController performActionForItemAtIndex:](self->_itemCollectionController, "performActionForItemAtIndex:", objc_msgSend(v6, "item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v9, "layout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItemState:animated:", v7, 1);

  }
}

- (void)itemCollectionView:(id)a3 didPerformEditActionForCell:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "indexPathForCell:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = v5;
    -[SUUIItemGridViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_msgSend(v9, "item");
      -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "itemGrid:didPerformEditActionForItem:atIndex:", self, v8, v7);

    }
    v5 = v9;
  }

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("ItemCellReuseIdentifier"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeparatorStyle:", 1);
  objc_msgSend(v5, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClientContext:", self->_clientContext);

  return v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  int64_t v5;
  void *v6;
  uint64_t v7;

  v5 = -[NSMutableArray count](self->_items, "count", a3, a4);
  -[SUUIItemGridViewController _collectionViewLayout](self, "_collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfColumns");

  if (v5 % v7)
    return v7 + v5 - v5 % v7;
  else
    return v5;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  objc_msgSend(v14, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIUber colorScheme](self->_uber, "colorScheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSeparatorColor:", v10);

  v11 = objc_msgSend(v7, "item");
  if (v11 >= -[NSMutableArray count](self->_items, "count"))
  {
    objc_msgSend(v14, "configureForItem:clientContext:", 0, self->_clientContext);
    objc_msgSend(v8, "resetLayout");
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configureForItem:clientContext:", v12, self->_clientContext);
    -[SUUIItemCollectionController configureCellLayout:forIndex:](self->_itemCollectionController, "configureCellLayout:forIndex:", v8, v11);
    objc_msgSend(v8, "setIconImageHidden:", -[NSMutableIndexSet containsIndex:](self->_hiddenIconIndexSet, "containsIndex:", v11));
    objc_msgSend(v8, "setSelected:", -[NSMutableIndexSet containsIndex:](self->_selectedItemIndexSet, "containsIndex:", v11));
    -[SUUIUber colorScheme](self->_uber, "colorScheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setColoringWithColorScheme:", v13);

    if (self->_imageBoundingSize.width != *MEMORY[0x24BDBF148]
      || self->_imageBoundingSize.height != *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      objc_msgSend(v8, "setImageBoundingSize:");
    }

  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  unint64_t v6;

  v6 = objc_msgSend(a5, "item", a3, a4);
  if (v6 < -[NSMutableArray count](self->_items, "count"))
    -[SUUIItemCollectionController didEndDisplayingItemAtIndex:](self->_itemCollectionController, "didEndDisplayingItemAtIndex:", v6);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id WeakRetained;
  char v6;
  unint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_msgSend(v10, "item");
    if (v7 < -[NSMutableArray count](self->_items, "count"))
    {
      -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "itemGrid:didSelectItem:atIndex:", self, v8, v7);

    }
  }

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
    objc_msgSend(v6, "itemGridWillBeginDragging:", self);

  }
  -[SUUIItemCollectionController scrollViewWillBeginDragging:](self->_itemCollectionController, "scrollViewWillBeginDragging:", v7);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  -[SUUIItemCollectionController scrollViewWillEndDragging:withVelocity:targetContentOffset:](self->_itemCollectionController, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", a3, a5, a4.x, a4.y);
}

- (id)_collectionView
{
  UICollectionView *collectionView;
  id v4;
  SUUIItemGridCollectionViewLayout *v5;
  UICollectionView *v6;
  UICollectionView *v7;
  UICollectionView *v8;
  void *v9;

  collectionView = self->_collectionView;
  if (!collectionView)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD450]);
    v5 = objc_alloc_init(SUUIItemGridCollectionViewLayout);
    v6 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v7 = self->_collectionView;
    self->_collectionView = v6;

    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](self->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x24BEBE050], CFSTR("a"));
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](self->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x24BEBE048], CFSTR("a"));
    -[UICollectionView setAlwaysBounceVertical:](self->_collectionView, "setAlwaysBounceVertical:", 1);
    -[UICollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
    v8 = self->_collectionView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[UICollectionView setSemanticContentAttribute:](self->_collectionView, "setSemanticContentAttribute:", storeSemanticContentAttribute());
    -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
    -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
    -[UICollectionView setPrefetchingEnabled:](self->_collectionView, "setPrefetchingEnabled:", 0);
    -[SUUIItemGridViewController _reloadLayout](self, "_reloadLayout");
    collectionView = self->_collectionView;
  }
  return collectionView;
}

- (id)_collectionViewLayout
{
  return -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
}

- (void)_reloadLayout
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  float v8;
  id v9;

  -[SUUIItemGridViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  if (v5 > 0.00000011920929)
  {
    -[SUUIItemGridViewController _collectionViewLayout](self, "_collectionViewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    if (v5 <= 1000.0)
      v7 = 2;
    else
      v7 = 3;
    objc_msgSend(v6, "setNumberOfColumns:", v7);
    v8 = v5 / (double)v7;
    objc_msgSend(v9, "setItemSize:", floorf(v8), self->_rowHeight);
    objc_msgSend(v9, "invalidateLayout");
    -[UICollectionView reloadData](self->_collectionView, "reloadData");

  }
}

- (id)_itemCollectionController
{
  SUUIItemCollectionController *itemCollectionController;
  SUUIItemCollectionController *v4;
  SUUIItemCollectionController *v5;
  SUUIItemCollectionController *v6;
  void *v7;

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

    -[SUUIItemCollectionController setItems:](self->_itemCollectionController, "setItems:", self->_items);
    -[SUUIItemCollectionController setNumberOfItemsPerPage:](self->_itemCollectionController, "setNumberOfItemsPerPage:", 20);
    -[SUUIItemCollectionController setNumberOfPagesToCacheAhead:](self->_itemCollectionController, "setNumberOfPagesToCacheAhead:", 3.0);
    itemCollectionController = self->_itemCollectionController;
  }
  return itemCollectionController;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUIItemGridDelegate)delegate
{
  return (SUUIItemGridDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (NSArray)items
{
  return &self->_items->super;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_selectedItemIndexSet, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_itemCollectionController, 0);
  objc_storeStrong((id *)&self->_hiddenIconIndexSet, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
