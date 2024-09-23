@implementation SUUIItemCollectionController

- (id)_initSUUIItemCollectionController
{
  SUUIItemCollectionController *v2;
  SUUIItemCollectionController *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *itemIDsToArtworkRequestIDs;
  NSMutableDictionary *v6;
  NSMutableDictionary *itemIDsToScreenshotRequestIDs;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUUIItemCollectionController;
  v2 = -[SUUIItemCollectionController init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_numberOfItemsPerPage = 10;
    v2->_numberOfPagesToCacheAhead = 1.5;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    itemIDsToArtworkRequestIDs = v3->_itemIDsToArtworkRequestIDs;
    v3->_itemIDsToArtworkRequestIDs = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    itemIDsToScreenshotRequestIDs = v3->_itemIDsToScreenshotRequestIDs;
    v3->_itemIDsToScreenshotRequestIDs = v6;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__memoryWarningNotification_, *MEMORY[0x24BEBDFA8], 0);
    +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:", v3);

  }
  return v3;
}

- (SUUIItemCollectionController)initWithClientContext:(id)a3
{
  id v4;
  SUUIItemCollectionController *v5;
  SUUIItemCollectionController *v6;

  v4 = a3;
  v5 = -[SUUIItemCollectionController _initSUUIItemCollectionController](self, "_initSUUIItemCollectionController");
  v6 = v5;
  if (v5)
    -[SUUIItemCollectionController setClientContext:](v5, "setClientContext:", v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBDFA8], 0);
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SUUIItemCollectionController;
  -[SUUIItemCollectionController dealloc](&v5, sel_dealloc);
}

- (void)cancelArtworkLoadForItemIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (-[NSArray count](self->_items, "count") > a3)
  {
    -[NSArray objectAtIndex:](self->_items, "objectAtIndex:", a3);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v14, "itemIdentifier"));
    -[NSMutableDictionary objectForKey:](self->_itemIDsToArtworkRequestIDs, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SUUIItemCollectionController _artworkLoader](self, "_artworkLoader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cancelRequestWithIdentifier:", objc_msgSend(v6, "unsignedIntegerValue"));

      -[SUUIItemCollectionController _artworkLoader](self, "_artworkLoader");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cachedResourceForRequestIdentifier:", objc_msgSend(v6, "unsignedIntegerValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        -[NSMutableDictionary removeObjectForKey:](self->_itemIDsToArtworkRequestIDs, "removeObjectForKey:", v5);
    }
    -[NSMutableDictionary objectForKey:](self->_itemIDsToScreenshotRequestIDs, "objectForKey:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SUUIItemCollectionController _artworkLoader](self, "_artworkLoader");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cancelRequestWithIdentifier:", objc_msgSend(v10, "unsignedIntegerValue"));

      -[SUUIItemCollectionController _artworkLoader](self, "_artworkLoader");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cachedResourceForRequestIdentifier:", objc_msgSend(v10, "unsignedIntegerValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        -[NSMutableDictionary removeObjectForKey:](self->_itemIDsToScreenshotRequestIDs, "removeObjectForKey:", v5);
    }

  }
}

- (void)didEndDisplayingItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  if (-[NSArray count](self->_items, "count") > a3)
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a3);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v12, "itemIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_itemIDsToArtworkRequestIDs, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SUUIItemCollectionController _artworkLoader](self, "_artworkLoader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "trySetReason:forRequestWithIdentifier:", 0, objc_msgSend(v6, "unsignedIntegerValue"));

      if ((v8 & 1) == 0)
        -[NSMutableDictionary removeObjectForKey:](self->_itemIDsToArtworkRequestIDs, "removeObjectForKey:", v5);
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_itemIDsToScreenshotRequestIDs, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[SUUIItemCollectionController _artworkLoader](self, "_artworkLoader");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "trySetReason:forRequestWithIdentifier:", 0, objc_msgSend(v9, "unsignedIntegerValue"));

      if ((v11 & 1) == 0)
        -[NSMutableDictionary removeObjectForKey:](self->_itemIDsToScreenshotRequestIDs, "removeObjectForKey:", v5);
    }

  }
}

- (void)configureCellLayout:(id)a3 forIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v6, "parentalControlsRank"));
  objc_msgSend(v21, "setRestricted:", v8);
  objc_msgSend(v6, "storeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "stateForItemWithStoreIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setItemState:", v10);

  }
  objc_msgSend(v6, "artworkImage");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[SUUIItemCollectionController artworkContext](self, "artworkContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataConsumerForItem:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "imageForImage:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v6, "itemIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemCollectionController _artworkLoader](self, "_artworkLoader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_itemIDsToArtworkRequestIDs, "objectForKeyedSubscript:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    goto LABEL_8;
  objc_msgSend(v12, "cachedResourceForRequestIdentifier:", objc_msgSend(v16, "unsignedIntegerValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    if ((objc_msgSend(v12, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v17, "unsignedIntegerValue")) & 1) != 0)
    {
LABEL_11:
      v15 = 0;
      goto LABEL_12;
    }
LABEL_8:
    -[SUUIItemCollectionController _iconArtworkRequestWithItem:](self, "_iconArtworkRequestWithItem:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v18, "requestIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemIDsToArtworkRequestIDs, "setObject:forKeyedSubscript:", v20, v14);

      objc_msgSend(v12, "loadResourceWithRequest:reason:", v19, 1);
    }

    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  if (!v15)
  {
    -[SUUIItemCollectionController _placeholderImageForItem:](self, "_placeholderImageForItem:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v21, "setIconImage:", v15);
  -[SUUIItemCollectionController _reloadScreenshotForCellLayout:item:isRestricted:](self, "_reloadScreenshotForCellLayout:item:isRestricted:", v21, v6, v8);

}

- (void)loadNextPageOfArtworkWithReason:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  _BOOL4 v10;

  v5 = -[NSArray count](self->_items, "count");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    do
    {
      if (v8 >= self->_numberOfItemsPerPage)
        break;
      -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SUUIItemCollectionController _loadArtworkForItem:reason:](self, "_loadArtworkForItem:reason:", v9, a3);

      v8 += v10;
      ++v7;
    }
    while (v6 != v7);
  }
}

- (void)precacheNextPageArtworkForOffset:(CGPoint)a3 direction:(double)a4
{
  double y;
  double x;
  id WeakRetained;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSUInteger v21;
  uint64_t v22;
  void *v23;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_msgSend(WeakRetained, "itemCollectionController:itemPageRangeForOffset:", self, x, y);
  v11 = v10;

  if (v11)
  {
    -[SUUIItemCollectionController numberOfPagesToCacheAhead](self, "numberOfPagesToCacheAhead");
    *(float *)&v12 = v12 * (double)v11;
    v13 = vcvtps_s32_f32(*(float *)&v12);
    if (a4 <= 0.0)
    {
      v20 = v9 - 1;
      v21 = -[NSArray count](self->_items, "count");
      if (v9 - 1 >= v21 - 1)
        v20 = v21 - 1;
      v22 = (v9 - v13) & ~((uint64_t)(v9 - v13) >> 63);
      if (v20 >= v22)
      {
        do
        {
          -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUIItemCollectionController _loadArtworkForItem:reason:](self, "_loadArtworkForItem:reason:", v23, -1);

        }
        while (v20-- > v22);
      }
    }
    else
    {
      v14 = v9 + v11;
      v15 = v9 + v13;
      v16 = -[NSArray count](self->_items, "count");
      if (v15 >= v16)
        v17 = v16;
      else
        v17 = v15;
      v18 = v14 & ~(v14 >> 63);
      if (v18 < v17)
      {
        do
        {
          -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUIItemCollectionController _loadArtworkForItem:reason:](self, "_loadArtworkForItem:reason:", v19, -1);

          ++v18;
        }
        while (v17 != v18);
      }
    }
  }
}

- (id)performActionForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NSArray objectAtIndex:](self->_items, "objectAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performActionForItem:clientContext:", v4, self->_clientContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeAllCachedResources
{
  -[SUUIResourceLoader removeAllCachedResources](self->_artworkLoader, "removeAllCachedResources");
  -[NSMutableDictionary removeAllObjects](self->_itemIDsToArtworkRequestIDs, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_itemIDsToScreenshotRequestIDs, "removeAllObjects");
}

- (void)enterBackground
{
  -[SUUIResourceLoader enterBackground](self->_artworkLoader, "enterBackground");
}

- (void)enterForeground
{
  -[SUUIResourceLoader enterForeground](self->_artworkLoader, "enterForeground");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  double y;
  double v9;
  double v10;
  SUUIItemCollectionController *v11;

  objc_msgSend(a3, "contentOffset", a4.x, a4.y);
  v9 = a5->y - y;
  if (v9 == 0.0)
  {
    v10 = 1.0;
    v11 = self;
  }
  else
  {
    -[SUUIItemCollectionController precacheNextPageArtworkForOffset:direction:](self, "precacheNextPageArtworkForOffset:direction:");
    x = a5->x;
    y = a5->y;
    v11 = self;
    v10 = v9;
  }
  -[SUUIItemCollectionController precacheNextPageArtworkForOffset:direction:](v11, "precacheNextPageArtworkForOffset:direction:", x, y, v10);
}

- (void)setDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  v4 = objc_storeWeak((id *)&self->_delegate, v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateProvidesScreenshots = objc_opt_respondsToSelector() & 1;

  }
  else
  {
    self->_delegateProvidesScreenshots = 0;
  }

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v6 = a4;
  v7 = a3;
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "requestIdentifier");

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__SUUIItemCollectionController_artworkRequest_didLoadImage___block_invoke;
  v12[3] = &unk_2511FB5A0;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v9;
  v10 = v8;
  v11 = v6;
  -[SUUIItemCollectionController _enumerateVisibleCellLayoutsWithBlock:](self, "_enumerateVisibleCellLayoutsWithBlock:", v12);

}

void __60__SUUIItemCollectionController_artworkRequest_didLoadImage___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectAtIndex:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v7, "itemIdentifier"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "unsignedIntegerValue") == *(_QWORD *)(a1 + 56))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v14, "setIconImage:");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_placeholderImageForItem:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setIconImage:", v13);

    }
    *a4 = 1;
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v10 + 32))
    {
      objc_msgSend(*(id *)(v10 + 24), "objectForKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "unsignedIntegerValue") == *(_QWORD *)(a1 + 56))
      {
        if ((objc_msgSend(*(id *)(a1 + 48), "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v7, "parentalControlsRank")) & 1) == 0)
        {
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
          objc_msgSend(WeakRetained, "itemCollectionController:applyScreenshotImage:toCellLayout:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v14);

        }
        *a4 = 1;
      }

    }
  }

}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__SUUIItemCollectionController_itemStateCenter_itemStatesChanged___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __66__SUUIItemCollectionController_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadForItemStateChange:", *(_QWORD *)(a1 + 40));
}

- (void)itemStateCenterRestrictionsChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SUUIItemCollectionController_itemStateCenterRestrictionsChanged___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __67__SUUIItemCollectionController_itemStateCenterRestrictionsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadForRestrictionsChange");
}

- (void)_memoryWarningNotification:(id)a3
{
  -[SUUIResourceLoader removeAllCachedResources](self->_artworkLoader, "removeAllCachedResources", a3);
  -[NSMutableDictionary removeAllObjects](self->_itemIDsToArtworkRequestIDs, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_itemIDsToScreenshotRequestIDs, "removeAllObjects");
}

- (id)_artworkLoader
{
  SUUIResourceLoader *artworkLoader;
  SUUIResourceLoader *v4;
  SUUIResourceLoader *v5;
  SUUIResourceLoader *v6;
  void *v7;

  artworkLoader = self->_artworkLoader;
  if (!artworkLoader)
  {
    v4 = -[SUUIResourceLoader initWithClientContext:]([SUUIResourceLoader alloc], "initWithClientContext:", self->_clientContext);
    v5 = self->_artworkLoader;
    self->_artworkLoader = v4;

    v6 = self->_artworkLoader;
    SUUIResourceLoaderGetNameForObject(self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIResourceLoader setName:](v6, "setName:", v7);

    artworkLoader = self->_artworkLoader;
  }
  return artworkLoader;
}

- (void)_enumerateVisibleCellLayoutsWithBlock:(id)a3
{
  void (**v4)(id, int64_t, void *, _BYTE *);
  int64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  id WeakRetained;
  void *v11;
  int v12;
  unsigned __int8 v13;

  v4 = (void (**)(id, int64_t, void *, _BYTE *))a3;
  v5 = -[NSArray count](self->_items, "count");
  v6 = -[SUUIItemCollectionController _visibleItemRange](self, "_visibleItemRange");
  v8 = v6 + v7;
  if (v6 < v6 + v7)
  {
    v9 = v6;
    while (v9 < v5)
    {
      v13 = 0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "itemCollectionController:cellLayoutForItemIndex:", self, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v4[2](v4, v9, v11, &v13);
      v12 = v13;

      if (v12)
        break;
      if (++v9 >= v8)
        break;
    }
  }

}

- (id)_iconArtworkRequestWithItem:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  SUUIArtworkRequest *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  -[SUUIItemArtworkContext URLForItem:](self->_artworkContext, "URLForItem:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (v7 <= 1.0 ? (v9 = 100) : (v9 = 200),
        objc_msgSend(v4, "artworkURLForSize:", v9),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = objc_alloc_init(SUUIArtworkRequest);
    -[SUUIItemArtworkContext dataConsumerForItem:](self->_artworkContext, "dataConsumerForItem:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[SUUIArtworkRequest setDataConsumer:](v10, "setDataConsumer:", v11);
    }
    else
    {
      -[SUUIItemCollectionController iconDataConsumer](self, "iconDataConsumer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIArtworkRequest setDataConsumer:](v10, "setDataConsumer:", v12);

    }
    -[SUUIArtworkRequest setDelegate:](v10, "setDelegate:", self);
    -[SUUIArtworkRequest setURL:](v10, "setURL:", v8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_loadArtworkForItem:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSMutableDictionary *itemIDsToArtworkRequestIDs;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *itemIDsToScreenshotRequestIDs;
  void *v19;

  v6 = a3;
  -[SUUIItemCollectionController _artworkLoader](self, "_artworkLoader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v6, "itemIdentifier"));
  -[NSMutableDictionary objectForKey:](self->_itemIDsToArtworkRequestIDs, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    -[SUUIItemCollectionController _iconArtworkRequestWithItem:](self, "_iconArtworkRequestWithItem:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      itemIDsToArtworkRequestIDs = self->_itemIDsToArtworkRequestIDs;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "requestIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](itemIDsToArtworkRequestIDs, "setObject:forKey:", v14, v8);

      v10 = objc_msgSend(v7, "loadResourceWithRequest:reason:", v12, a4);
    }
    else
    {
      v10 = 0;
    }

  }
  -[NSMutableDictionary objectForKey:](self->_itemIDsToScreenshotRequestIDs, "objectForKey:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[SUUIItemCollectionController _screenshotArtworkRequestWithItem:](self, "_screenshotArtworkRequestWithItem:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      itemIDsToScreenshotRequestIDs = self->_itemIDsToScreenshotRequestIDs;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "requestIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](itemIDsToScreenshotRequestIDs, "setObject:forKey:", v19, v8);

      objc_msgSend(v7, "loadResourceWithRequest:reason:", v17, a4);
    }

  }
  return v10;
}

- (id)_placeholderImageForItem:(id)a3
{
  id v4;
  SUUIItemArtworkContext *artworkContext;
  UIImage *v6;
  UIImage *placeholderImage;
  void *v8;
  void *v9;
  UIImage *v10;
  UIImage *v11;
  UIImage *v12;

  v4 = a3;
  artworkContext = self->_artworkContext;
  if (artworkContext)
  {
    -[SUUIItemArtworkContext placeholderImageForItem:](artworkContext, "placeholderImageForItem:", v4);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    placeholderImage = self->_placeholderImage;
    if (!placeholderImage)
    {
      -[SUUIItemCollectionController iconDataConsumer](self, "iconDataConsumer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.8, 1.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageForColor:", v9);
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v11 = self->_placeholderImage;
      self->_placeholderImage = v10;

      placeholderImage = self->_placeholderImage;
    }
    v6 = placeholderImage;
  }
  v12 = v6;

  return v12;
}

- (id)_placeholderImageForScreenshot:(id)a3
{
  id v4;
  void *v5;
  int v6;
  UIImage *landscapeScreenshotPlaceholderImage;
  UIImage **p_landscapeScreenshotPlaceholderImage;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  UIImage *v15;
  UIImage *portraitScreenshotPlaceholderImage;
  double v17;
  double v18;
  double v19;
  double v20;
  UIImage *v21;
  UIImage *v22;

  v4 = a3;
  objc_msgSend(v4, "orientationString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("landscape"));

  if (v6)
  {
    p_landscapeScreenshotPlaceholderImage = &self->_landscapeScreenshotPlaceholderImage;
    landscapeScreenshotPlaceholderImage = self->_landscapeScreenshotPlaceholderImage;
    if (!landscapeScreenshotPlaceholderImage)
    {
      -[SUUIItemCollectionController landscapeScreenshotDataConsumer](self, "landscapeScreenshotDataConsumer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sizeForVariant:", CFSTR("low-dpi"));
      v11 = v10;
      v13 = v12;
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.9, 1.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageForColor:size:", v14, v11, v13);
      v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
      portraitScreenshotPlaceholderImage = self->_landscapeScreenshotPlaceholderImage;
      self->_landscapeScreenshotPlaceholderImage = v15;
LABEL_6:

      landscapeScreenshotPlaceholderImage = *p_landscapeScreenshotPlaceholderImage;
    }
  }
  else
  {
    p_landscapeScreenshotPlaceholderImage = &self->_portraitScreenshotPlaceholderImage;
    landscapeScreenshotPlaceholderImage = self->_portraitScreenshotPlaceholderImage;
    if (!landscapeScreenshotPlaceholderImage)
    {
      -[SUUIItemCollectionController portraitScreenshotDataConsumer](self, "portraitScreenshotDataConsumer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sizeForVariant:", CFSTR("low-dpi"));
      v18 = v17;
      v20 = v19;
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.9, 1.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageForColor:size:", v14, v18, v20);
      v21 = (UIImage *)objc_claimAutoreleasedReturnValue();
      portraitScreenshotPlaceholderImage = self->_portraitScreenshotPlaceholderImage;
      self->_portraitScreenshotPlaceholderImage = v21;
      goto LABEL_6;
    }
  }
  v22 = landscapeScreenshotPlaceholderImage;

  return v22;
}

- (void)_reloadForItemStateChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "storeIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__SUUIItemCollectionController__reloadForItemStateChange___block_invoke;
  v14[3] = &unk_2511FB5C8;
  v14[4] = self;
  v15 = v5;
  v13 = v5;
  -[SUUIItemCollectionController _enumerateVisibleCellLayoutsWithBlock:](self, "_enumerateVisibleCellLayoutsWithBlock:", v14);

}

void __58__SUUIItemCollectionController__reloadForItemStateChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v5, "storeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v9, "setItemState:animated:", v8, 1);

}

- (void)_reloadForRestrictionsChange
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__SUUIItemCollectionController__reloadForRestrictionsChange__block_invoke;
  v5[3] = &unk_2511FB5C8;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  -[SUUIItemCollectionController _enumerateVisibleCellLayoutsWithBlock:](self, "_enumerateVisibleCellLayoutsWithBlock:", v5);

}

void __60__SUUIItemCollectionController__reloadForRestrictionsChange__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v6 = a3;
  objc_msgSend(v5, "objectAtIndex:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 40), "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v8, "parentalControlsRank"));
  objc_msgSend(v6, "setRestricted:", v7);
  objc_msgSend(*(id *)(a1 + 32), "_reloadScreenshotForCellLayout:item:isRestricted:", v6, v8, v7);

}

- (void)_reloadScreenshotForCellLayout:(id)a3 item:(id)a4 isRestricted:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id WeakRetained;
  id v22;

  v5 = a5;
  v22 = a3;
  v8 = a4;
  -[SUUIItemCollectionController _screenshotForItem:](self, "_screenshotForItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v5)
    {
      -[SUUIItemCollectionController _placeholderImageForScreenshot:](self, "_placeholderImageForScreenshot:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "itemCollectionController:applyScreenshotImage:toCellLayout:", self, v10, v22);

      goto LABEL_17;
    }
    -[SUUIItemCollectionController _artworkLoader](self, "_artworkLoader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v8, "itemIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_itemIDsToScreenshotRequestIDs, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v11, "cachedResourceForRequestIdentifier:", objc_msgSend(v13, "unsignedIntegerValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v14, "unsignedIntegerValue")) & 1) == 0)
      {
        -[SUUIItemCollectionController _screenshotArtworkRequestWithItem:](self, "_screenshotArtworkRequestWithItem:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "requestIdentifier"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemIDsToScreenshotRequestIDs, "setObject:forKeyedSubscript:", v17, v12);

          objc_msgSend(v11, "loadResourceWithRequest:reason:", v16, 1);
        }

      }
      if (v10)
        goto LABEL_15;
    }
    else
    {
      -[SUUIItemCollectionController _screenshotArtworkRequestWithItem:](self, "_screenshotArtworkRequestWithItem:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v18, "requestIdentifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemIDsToScreenshotRequestIDs, "setObject:forKeyedSubscript:", v20, v12);

        objc_msgSend(v11, "loadResourceWithRequest:reason:", v19, 1);
      }

    }
    -[SUUIItemCollectionController _placeholderImageForScreenshot:](self, "_placeholderImageForScreenshot:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:

}

- (id)_screenshotArtworkRequestWithItem:(id)a3
{
  void *v4;
  void *v5;
  SUUIArtworkRequest *v6;
  void *v7;
  int v8;
  void *v9;

  -[SUUIItemCollectionController _screenshotForItem:](self, "_screenshotForItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForVariant:", CFSTR("low-dpi"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(SUUIArtworkRequest);
    -[SUUIArtworkRequest setDelegate:](v6, "setDelegate:", self);
    objc_msgSend(v4, "orientationString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("landscape"));

    if (v8)
      -[SUUIItemCollectionController landscapeScreenshotDataConsumer](self, "landscapeScreenshotDataConsumer");
    else
      -[SUUIItemCollectionController portraitScreenshotDataConsumer](self, "portraitScreenshotDataConsumer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIArtworkRequest setDataConsumer:](v6, "setDataConsumer:", v9);

    -[SUUIArtworkRequest setURL:](v6, "setURL:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_screenshotForItem:(id)a3
{
  SUUIItemCollectionDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;

  if (self->_delegateProvidesScreenshots)
  {
    p_delegate = &self->_delegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "itemCollectionController:screenshotForItem:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (_NSRange)_visibleItemRange
{
  id WeakRetained;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "visibleItemRangeForItemCollectionController:", self);
  v6 = v5;

  if (v4)
  {
    ++v6;
    v7 = v4 - 1;
  }
  else
  {
    v7 = 0;
  }
  if (v6 + v7 >= -[NSArray count](self->_items, "count") - 1)
    v8 = v6;
  else
    v8 = v6 + 1;
  v9 = v7;
  result.length = v8;
  result.location = v9;
  return result;
}

- (SUUIItemCollectionDelegate)delegate
{
  return (SUUIItemCollectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SUUIResourceLoader)artworkLoader
{
  return self->_artworkLoader;
}

- (void)setArtworkLoader:(id)a3
{
  objc_storeStrong((id *)&self->_artworkLoader, a3);
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUIItemArtworkContext)artworkContext
{
  return self->_artworkContext;
}

- (void)setArtworkContext:(id)a3
{
  objc_storeStrong((id *)&self->_artworkContext, a3);
}

- (SUUIStyledImageDataConsumer)iconDataConsumer
{
  return self->_iconDataConsumer;
}

- (void)setIconDataConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_iconDataConsumer, a3);
}

- (SUUIScreenshotDataConsumer)landscapeScreenshotDataConsumer
{
  return self->_landscapeScreenshotDataConsumer;
}

- (void)setLandscapeScreenshotDataConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeScreenshotDataConsumer, a3);
}

- (SUUIScreenshotDataConsumer)portraitScreenshotDataConsumer
{
  return self->_portraitScreenshotDataConsumer;
}

- (void)setPortraitScreenshotDataConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_portraitScreenshotDataConsumer, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)numberOfItemsPerPage
{
  return self->_numberOfItemsPerPage;
}

- (void)setNumberOfItemsPerPage:(int64_t)a3
{
  self->_numberOfItemsPerPage = a3;
}

- (double)numberOfPagesToCacheAhead
{
  return self->_numberOfPagesToCacheAhead;
}

- (void)setNumberOfPagesToCacheAhead:(double)a3
{
  self->_numberOfPagesToCacheAhead = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_portraitScreenshotDataConsumer, 0);
  objc_storeStrong((id *)&self->_landscapeScreenshotDataConsumer, 0);
  objc_storeStrong((id *)&self->_iconDataConsumer, 0);
  objc_storeStrong((id *)&self->_artworkContext, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_portraitScreenshotPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_landscapeScreenshotPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_itemIDsToScreenshotRequestIDs, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_itemIDsToArtworkRequestIDs, 0);
}

@end
