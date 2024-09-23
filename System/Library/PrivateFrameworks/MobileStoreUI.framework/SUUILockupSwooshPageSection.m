@implementation SUUILockupSwooshPageSection

- (SUUILockupSwooshPageSection)initWithPageComponent:(id)a3
{
  SUUILockupSwooshPageSection *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUILockupSwooshPageSection;
  result = -[SUUIStorePageSection initWithPageComponent:](&v4, sel_initWithPageComponent_, a3);
  if (result)
    result->_overlaySourceIndex = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", 0);
  -[SUUIProductPageOverlayController setDelegate:](self->_overlayController, "setDelegate:", 0);
  -[SUUILockupSwooshViewController setDelegate:](self->_swooshViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUILockupSwooshPageSection;
  -[SUUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addItemViewElement:", v9);

  -[SUUILockupSwooshViewController indexPathsForVisibleItems](self->_swooshViewController, "indexPathsForVisibleItems");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x2426A2860](v11);
        -[SUUILockupSwooshPageSection _addImpressionForItemIndex:toSession:](self, "_addImpressionForItemIndex:toSession:", objc_msgSend(v15, "item", (_QWORD)v17), v7);
        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v12 = v11;
    }
    while (v11);
  }

}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("SUUILockupSwooshPageSectionReuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUILockupSwooshPageSection _swooshViewController](self, "_swooshViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentChildView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    objc_msgSend(v7, "setContentChildView:", v9);
    objc_msgSend(v7, "setContentInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  }

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[SUUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUILockupSwooshPageSection _swooshViewController](self, "_swooshViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sizeToFit");
  objc_msgSend(v7, "frame");
  v9 = v8;
  objc_msgSend(v5, "bounds");
  v11 = v10;

  v12 = v11;
  v13 = v9;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  -[SUUISwooshArtworkLoader deprioritizePendingImageLoads](self->_artworkLoader, "deprioritizePendingImageLoads", a3);
}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  void *v5;

  -[SUUILockupSwooshPageSection _artworkLoader](self, "_artworkLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadImagesForNextPageWithReason:", a3);

  -[SUUILockupSwooshPageSection _loadMissingItemsFromIndex:withReason:](self, "_loadMissingItemsFromIndex:withReason:", 0, a3);
}

- (void)setImage:(id)a3 forRequest:(id)a4
{
  -[SUUILockupSwooshArtworkLoader setImage:forRequest:](self->_artworkLoader, "setImage:forRequest:", a3, a4);
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("SUUILockupSwooshPageSectionReuseIdentifier"));
  v6.receiver = self;
  v6.super_class = (Class)SUUILockupSwooshPageSection;
  -[SUUIStorePageSection willAppearInContext:](&v6, sel_willAppearInContext_, v4);

}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  SUUILockupSwooshViewController *swooshViewController;
  void *v14;
  double v15;
  double v16;
  void *v18;
  id v19;
  _QWORD v20[5];

  v19 = a4;
  if (objc_msgSend(v19, "count"))
  {
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUILockupSwooshViewController view](self->_swooshViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v12 = (id)objc_msgSend(v6, "_updateLockupItemsWithItems:", v19);
    swooshViewController = self->_swooshViewController;
    objc_msgSend(v6, "lockups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUILockupSwooshViewController setLockups:](swooshViewController, "setLockups:", v14);

    objc_msgSend(v7, "frame");
    if (v16 != v9 || v15 != v11)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __85__SUUILockupSwooshPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke;
      v20[3] = &unk_2511F47C0;
      v20[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v20);
    }
    -[SUUILockupSwooshPageSection _artworkLoader](self, "_artworkLoader");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loadImagesForNextPageWithReason:", 0);

  }
}

void __85__SUUILockupSwooshPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, objc_msgSend(*(id *)(a1 + 32), "sectionIndex"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadItemsAtIndexPaths:", v5);

}

- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "lockups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SUUIStorePageSection clickEventWithItem:elementName:index:](self, "clickEventWithItem:elementName:index:", v8, *MEMORY[0x24BEB2978], a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v14, "frameForItemAtIndex:", a4);
      SUUIMetricsSetClickEventPositionWithPoint(v9, v10, v11);
      -[SUUIStorePageSection context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "metricsController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recordEvent:", v9);

    }
    -[SUUILockupSwooshPageSection _showProductPageForItem:index:animated:](self, "_showProductPageForItem:index:animated:", v8, a4, 1);

  }
}

- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[SUUILockupSwooshPageSection _artworkLoader](self, "_artworkLoader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lockups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v12 = v7;
    v13 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v7, "cachedImageForItem:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v7, "loadImageForItem:reason:", v10, 1);
    v12 = v7;
    v13 = v10;
LABEL_5:
    objc_msgSend(v12, "placeholderImageForItem:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)swoosh:(id)a3 videoThumbnailForCellAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  -[SUUILockupSwooshPageSection _artworkLoader](self, "_artworkLoader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lockups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "videos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v7;
  if (!v12)
  {
    v15 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v7, "cachedImageForVideo:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v7, "loadImageForVideo:reason:", v12, 1);
    v13 = v7;
    v15 = v12;
LABEL_5:
    objc_msgSend(v13, "placeholderImageForVideo:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (void)swoosh:(id)a3 willDisplayCellAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  -[SUUIStorePageSection context](self, "context", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metricsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeImpressionsSession");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[SUUILockupSwooshPageSection _addImpressionForItemIndex:toSession:](self, "_addImpressionForItemIndex:toSession:", a4, v8);
  -[SUUILockupSwooshPageSection _loadMissingItemsFromIndex:withReason:](self, "_loadMissingItemsFromIndex:withReason:", a4, 1);

}

- (void)swooshDidSelectSeeAll:(id)a3
{
  void *v4;
  SUUILink *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SUUIStorePageViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "seeAllURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[SUUILink initWithURL:]([SUUILink alloc], "initWithURL:", v4);
    -[SUUIStorePageSection clickEventWithLink:elementName:index:](self, "clickEventWithLink:elementName:index:", v5, *MEMORY[0x24BEB2968], 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v17, "seeAllButtonFrame");
      SUUIMetricsSetClickEventPositionWithPoint(v6, v7, v8);
      -[SUUIStorePageSection context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "metricsController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recordEvent:", v6);

    }
    -[SUUIStorePageSection context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "parentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc_init(SUUIStorePageViewController);
    objc_msgSend(v12, "clientContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageViewController setClientContext:](v13, "setClientContext:", v14);

    objc_msgSend(v17, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageViewController setTitle:](v13, "setTitle:", v15);

    -[SUUIStorePageViewController loadURL:withCompletionBlock:](v13, "loadURL:withCompletionBlock:", v4, 0);
    objc_msgSend(v12, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pushViewController:animated:", v13, 1);

  }
}

- (void)productPageOverlayDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  SUUIProductPageOverlayController *overlayController;

  -[SUUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pageSectionDidDismissOverlayController:", self->_overlayController);

  -[SUUIProductPageOverlayController setDelegate:](self->_overlayController, "setDelegate:", 0);
  overlayController = self->_overlayController;
  self->_overlayController = 0;

  -[SUUILockupSwooshViewController unhideImages](self->_swooshViewController, "unhideImages");
  self->_overlaySourceIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_addImpressionForItemIndex:(int64_t)a3 toSession:(id)a4
{
  SUUILockupSwooshViewController *swooshViewController;
  id v6;
  void *v7;
  void *v8;
  id v9;

  swooshViewController = self->_swooshViewController;
  v6 = a4;
  -[SUUILockupSwooshViewController lockups](swooshViewController, "lockups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addItemIdentifier:", objc_msgSend(v9, "itemIdentifier"));
  objc_msgSend(v9, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItemViewElement:", v8);

}

- (id)_artworkLoader
{
  SUUILockupSwooshArtworkLoader *artworkLoader;
  void *v4;
  SUUILockupSwooshArtworkLoader *v5;
  void *v6;
  void *v7;
  SUUILockupSwooshArtworkLoader *v8;
  SUUILockupSwooshArtworkLoader *v9;
  SUUILockupSwooshArtworkLoader *v10;
  void *v11;

  artworkLoader = self->_artworkLoader;
  if (!artworkLoader)
  {
    -[SUUIStorePageSection context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [SUUILockupSwooshArtworkLoader alloc];
    objc_msgSend(v4, "resourceLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUILockupSwooshPageSection _swooshViewController](self, "_swooshViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SUUILockupSwooshArtworkLoader initWithArtworkLoader:swoosh:](v5, "initWithArtworkLoader:swoosh:", v6, v7);
    v9 = self->_artworkLoader;
    self->_artworkLoader = v8;

    v10 = self->_artworkLoader;
    objc_msgSend(v4, "colorScheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISwooshArtworkLoader setPlaceholderColorWithColorScheme:](v10, "setPlaceholderColorWithColorScheme:", v11);

    artworkLoader = self->_artworkLoader;
  }
  return artworkLoader;
}

- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4
{
  void *v7;
  id v8;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isMissingItemData"))
  {
    -[SUUILockupSwooshPageSection _missingItemLoader](self, "_missingItemLoader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loadItemsForPageComponent:startIndex:reason:", v8, a3, a4);

  }
}

- (id)_missingItemLoader
{
  SUUIMissingItemLoader *missingItemLoader;
  SUUIMissingItemLoader *v4;
  void *v5;
  void *v6;
  SUUIMissingItemLoader *v7;
  SUUIMissingItemLoader *v8;
  void *v9;
  void *v10;

  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    v4 = [SUUIMissingItemLoader alloc];
    -[SUUIStorePageSection context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resourceLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SUUIMissingItemLoader initWithResourceLoader:](v4, "initWithResourceLoader:", v6);
    v8 = self->_missingItemLoader;
    self->_missingItemLoader = v7;

    -[SUUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", self);
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "platformKeyProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[SUUIMissingItemLoader setKeyProfile:](self->_missingItemLoader, "setKeyProfile:", v10);

    missingItemLoader = self->_missingItemLoader;
  }
  return missingItemLoader;
}

- (id)_popSourceViewForOverlayController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "lockupStyle");

  if (self->_overlaySourceIndex != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "numberOfVisibleOverlays");

  return 0;
}

- (void)_showProductPageForItem:(id)a3 index:(int64_t)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  int64_t v16;

  v7 = a3;
  -[SUUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "clientContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (SUUIUserInterfaceIdiom(v10) == 1 && SUUIItemKindIsSoftwareKind(objc_msgSend(v7, "itemKind")))
  {
    if (!self->_overlayController)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __70__SUUILockupSwooshPageSection__showProductPageForItem_index_animated___block_invoke;
      v12[3] = &unk_2511F7300;
      v12[4] = self;
      v13 = v9;
      v14 = v10;
      v16 = a4;
      v15 = v7;
      -[SUUIStorePageSection sendXEventWithItem:completionBlock:](self, "sendXEventWithItem:completionBlock:", v15, v12);

    }
  }
  else
  {
    -[SUUIStorePageSection showProductViewControllerWithItem:](self, "showProductViewControllerWithItem:", v7);
    -[SUUILockupSwooshPageSection _swooshViewController](self, "_swooshViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deselectAllItems");

  }
}

void __70__SUUILockupSwooshPageSection__showProductPageForItem_index_animated___block_invoke(uint64_t a1, char a2)
{
  SUUIProductPageOverlayController *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if ((a2 & 1) == 0)
  {
    v3 = -[SUUIProductPageOverlayController initWithParentViewController:]([SUUIProductPageOverlayController alloc], "initWithParentViewController:", *(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setClientContext:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setDelegate:");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "showWithInitialItem:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "_setActiveProductPageOverlayController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
    objc_msgSend(*(id *)(a1 + 32), "_swooshViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deselectAllItems");

  }
}

- (id)_swooshViewController
{
  SUUILockupSwooshViewController *swooshViewController;
  void *v4;
  void *v5;
  SUUILockupSwooshViewController *v6;
  void *v7;
  SUUILockupSwooshViewController *v8;
  SUUILockupSwooshViewController *v9;
  SUUILockupSwooshViewController *v10;
  void *v11;
  SUUILockupSwooshViewController *v12;
  void *v13;

  swooshViewController = self->_swooshViewController;
  if (!swooshViewController)
  {
    -[SUUIStorePageSection context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [SUUILockupSwooshViewController alloc];
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SUUILockupSwooshViewController initWithSwoosh:](v6, "initWithSwoosh:", v7);
    v9 = self->_swooshViewController;
    self->_swooshViewController = v8;

    v10 = self->_swooshViewController;
    objc_msgSend(v5, "clientContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUILockupSwooshViewController setClientContext:](v10, "setClientContext:", v11);

    -[SUUILockupSwooshViewController setDelegate:](self->_swooshViewController, "setDelegate:", self);
    v12 = self->_swooshViewController;
    objc_msgSend(v4, "colorScheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUILockupSwooshViewController setColorScheme:](v12, "setColorScheme:", v13);

    objc_msgSend(v5, "addChildViewController:", self->_swooshViewController);
    swooshViewController = self->_swooshViewController;
  }
  return swooshViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshViewController, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

@end
