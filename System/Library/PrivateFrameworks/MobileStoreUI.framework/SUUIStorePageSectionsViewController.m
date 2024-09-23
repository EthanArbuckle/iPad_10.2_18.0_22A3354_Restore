@implementation SUUIStorePageSectionsViewController

- (SUUIStorePageSectionsViewController)initWithLayoutStyle:(int64_t)a3
{
  SUUIStorePageSectionsViewController *v5;
  SUUIStorePageSectionsViewController *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  if (initWithLayoutStyle__onceToken != -1)
    dispatch_once(&initWithLayoutStyle__onceToken, &__block_literal_global_5);
  v12.receiver = self;
  v12.super_class = (Class)SUUIStorePageSectionsViewController;
  v5 = -[SUUIStorePageSectionsViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    v5->_layoutStyle = a3;
    v5->_itemsChangedStateWhileDisappeared = 0;
    -[SUUIStorePageSectionsViewController setRestorationClass:](v5, "setRestorationClass:", objc_opt_class());
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageSectionsViewController setRestorationIdentifier:](v6, "setRestorationIdentifier:", v8);

    +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:", v6);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel__contentSizeChangeNotification_, *MEMORY[0x24BEBE088], 0);

  }
  return v6;
}

void __59__SUUIStorePageSectionsViewController_initWithLayoutStyle___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  __orbSupported = objc_msgSend(v0, "_supportsForceTouch");

}

- (SUUIStorePageSectionsViewController)initWithCoder:(id)a3
{
  return -[SUUIStorePageSectionsViewController initWithLayoutStyle:](self, "initWithLayoutStyle:", 0);
}

- (SUUIStorePageSectionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[SUUIStorePageSectionsViewController initWithLayoutStyle:](self, "initWithLayoutStyle:", 0, a4);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UIViewControllerPreviewing *viewControllerPreviewing;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE088], 0);
  -[SUUIStorePageSplitsDescription enumerateSplitsUsingBlock:](self->_splitsDescription, "enumerateSplitsUsingBlock:", &__block_literal_global_7);
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_entityProviderToRelevantSections;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        -[SUUIStorePageSectionsViewController _unregisterForNotificationsForEntityProvider:](self, "_unregisterForNotificationsForEntityProvider:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[SUUICollectionView setDataSource:](self->_collectionView, "setDataSource:", 0);
  -[SUUICollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  -[SUUIProductPageOverlayController setDelegate:](self->_overlayController, "setDelegate:", 0);
  -[SUUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", 0);
  if (self->_viewControllerPreviewing)
  {
    -[SUUIStorePageSectionsViewController unregisterPreviewing:](self, "unregisterPreviewing:");
    viewControllerPreviewing = self->_viewControllerPreviewing;
    self->_viewControllerPreviewing = 0;

  }
  v11.receiver = self;
  v11.super_class = (Class)SUUIStorePageSectionsViewController;
  -[SUUIViewController dealloc](&v11, sel_dealloc);
}

void __46__SUUIStorePageSectionsViewController_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "sectionContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setParentViewController:", 0);

}

- (UICollectionView)collectionView
{
  SUUICollectionView *collectionView;
  id v4;
  SUUICollectionView *v5;
  void *v6;
  SUUICollectionView *v7;
  SUUICollectionView *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  UITapGestureRecognizer *v14;
  UITapGestureRecognizer *collectionViewTapGestureRecognizer;
  _QWORD v17[5];

  collectionView = self->_collectionView;
  if (!collectionView)
  {
    v4 = -[SUUIStorePageSectionsViewController _newStorePageCollectionViewLayout](self, "_newStorePageCollectionViewLayout");
    v5 = [SUUICollectionView alloc];
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = -[SUUICollectionView initWithFrame:collectionViewLayout:](v5, "initWithFrame:collectionViewLayout:", v4);
    v8 = self->_collectionView;
    self->_collectionView = v7;

    -[SUUICollectionView setSemanticContentAttribute:](self->_collectionView, "setSemanticContentAttribute:", storeSemanticContentAttribute());
    -[SUUICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("UICollectionViewCell"));
    -[SUUICollectionView setClipsToBounds:](self->_collectionView, "setClipsToBounds:", !self->_rendersWithPerspective);
    -[SUUICollectionView setIndexBarControl:](self->_collectionView, "setIndexBarControl:", self->_indexBarControl);
    if (self->_refreshControl)
      -[SUUICollectionView setRefreshControl:](self->_collectionView, "setRefreshControl:");
    -[SUUIColorScheme backgroundColor](self->_colorScheme, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    -[SUUICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v12);
    -[SUUICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
    -[SUUICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__longPressAction_);
    -[SUUICollectionView addGestureRecognizer:](self->_collectionView, "addGestureRecognizer:", v13);
    objc_msgSend(v13, "setCancelsTouchesInView:", 1);
    objc_msgSend(v13, "setDelaysTouchesBegan:", 0);
    v14 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__handleTap_);
    collectionViewTapGestureRecognizer = self->_collectionViewTapGestureRecognizer;
    self->_collectionViewTapGestureRecognizer = v14;

    -[SUUICollectionView addGestureRecognizer:](self->_collectionView, "addGestureRecognizer:", self->_collectionViewTapGestureRecognizer);
    -[UITapGestureRecognizer setEnabled:](self->_collectionViewTapGestureRecognizer, "setEnabled:", 0);
    -[UITapGestureRecognizer setDelegate:](self->_collectionViewTapGestureRecognizer, "setDelegate:", self);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __53__SUUIStorePageSectionsViewController_collectionView__block_invoke;
    v17[3] = &unk_2511F5C30;
    v17[4] = self;
    -[SUUIStorePageSectionsViewController _enumerateSectionContextsUsingBlock:](self, "_enumerateSectionContextsUsingBlock:", v17);

    collectionView = self->_collectionView;
  }
  return (UICollectionView *)collectionView;
}

uint64_t __53__SUUIStorePageSectionsViewController_collectionView__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setCollectionView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056));
}

- (id)defaultSectionForComponent:(id)a3
{
  id v4;
  void *v5;
  __objc2_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;

  v4 = a3;
  v5 = 0;
  switch(objc_msgSend(v4, "componentType"))
  {
    case 1:
      v6 = SUUIAccountButtonsSection;
      goto LABEL_27;
    case 3:
      objc_msgSend(v4, "viewElement");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        v6 = SUUIRowViewElementPageSection;
      else
        v6 = SUUIRowSection;
      goto LABEL_27;
    case 4:
      v6 = SUUIDividerPageSection;
      goto LABEL_27;
    case 5:
      v6 = SUUIEditorialPageSection;
      goto LABEL_27;
    case 6:
    case 13:
    case 18:
      v6 = SUUICarouselPageSection;
      goto LABEL_27;
    case 8:
      -[SUUIStorePageSectionsViewController _defaultSectionForGridComponent:](self, "_defaultSectionForGridComponent:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 9:
      objc_msgSend(v4, "viewElement");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        goto LABEL_10;
      break;
    case 10:
      v6 = SUUIMediaPageSection;
      goto LABEL_27;
    case 12:
      v6 = SUUIQuicklinksPageSection;
      goto LABEL_27;
    case 14:
      v6 = SUUISpacePageSection;
      goto LABEL_27;
    case 15:
      -[SUUIStorePageSectionsViewController _defaultSectionForSwooshComponent:](self, "_defaultSectionForSwooshComponent:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 16:
      v6 = SUUIBrowseItemPageSection;
      goto LABEL_27;
    case 17:
      v6 = SUUIBrowseHeaderPageSection;
      goto LABEL_27;
    case 20:
      v6 = SUUIFacebookPageSection;
      goto LABEL_27;
    case 21:
      v6 = SUUIReviewListPageSection;
      goto LABEL_27;
    case 22:
      v9 = objc_opt_class();
      objc_msgSend(v4, "viewElement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isDynamicContainer");

      if (v11)
        v9 = objc_opt_class();
      v6 = (__objc2_class *)v9;
      goto LABEL_27;
    case 23:
      v6 = SUUITracklistPageSection;
      goto LABEL_27;
    case 24:
LABEL_10:
      v6 = SUUIViewElementPageSection;
      goto LABEL_27;
    case 25:
      v6 = SUUISearchBarPageSection;
      goto LABEL_27;
    case 26:
      v6 = SUUIKeyValueInfoListPageSection;
      goto LABEL_27;
    case 27:
      v6 = SUUIVerticalInfoListPageSection;
LABEL_27:
      v8 = objc_msgSend([v6 alloc], "initWithPageComponent:", v4);
LABEL_28:
      v5 = (void *)v8;
      break;
    default:
      break;
  }

  return v5;
}

- (void)dismissOverlays
{
  SUUIProductPageOverlayController *overlayController;

  -[SUUIProductPageOverlayController setDelegate:](self->_overlayController, "setDelegate:", 0);
  -[SUUIProductPageOverlayController dismiss](self->_overlayController, "dismiss");
  overlayController = self->_overlayController;
  self->_overlayController = 0;

}

- (void)invalidateAndReload
{
  SUUILayoutCache *textLayoutCache;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[SUUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", 0);
  textLayoutCache = self->_textLayoutCache;
  self->_textLayoutCache = 0;

  -[SUUIStorePageSectionsViewController _collectionViewSublayouts](self, "_collectionViewSublayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "invalidateLayout");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }
  -[SUUICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateLayout");

  -[SUUIStorePageSectionsViewController _textLayoutCache](self, "_textLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = self->_sections;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        objc_msgSend(v16, "context", (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_setTextLayoutCache:", v10);
        objc_msgSend(v16, "willAppearInContext:", v17);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

  objc_msgSend(v10, "commitLayoutRequests");
  -[SUUICollectionView reloadData](self->_collectionView, "reloadData");

}

- (BOOL)isDisplayingOverlays
{
  return self->_overlayController || self->_initialOverlayURLs != 0;
}

- (void)reloadSections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBDB00];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__SUUIStorePageSectionsViewController_reloadSections___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWithoutAnimation:", v7);

}

uint64_t __54__SUUIStorePageSectionsViewController_reloadSections___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "reloadSections:", *(_QWORD *)(a1 + 40));
}

- (SUUIResourceLoader)resourceLoader
{
  SUUIResourceLoader *resourceLoader;
  SUUIResourceLoader *v4;
  void *v5;
  SUUIResourceLoader *v6;
  void *v7;

  resourceLoader = self->_resourceLoader;
  if (!resourceLoader)
  {
    v4 = [SUUIResourceLoader alloc];
    -[SUUIViewController clientContext](self, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUIResourceLoader initWithClientContext:](v4, "initWithClientContext:", v5);

    SUUIResourceLoaderGetNameForObject(self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIResourceLoader setName:](v6, "setName:", v7);

    -[SUUIStorePageSectionsViewController setResourceLoader:](self, "setResourceLoader:", v6);
    resourceLoader = self->_resourceLoader;
  }
  return resourceLoader;
}

- (void)setColorScheme:(id)a3
{
  SUUIColorScheme *v4;
  SUUIColorScheme *colorScheme;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  if (self->_colorScheme != a3)
  {
    v4 = (SUUIColorScheme *)objc_msgSend(a3, "copy");
    colorScheme = self->_colorScheme;
    self->_colorScheme = v4;

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __54__SUUIStorePageSectionsViewController_setColorScheme___block_invoke;
    v11[3] = &unk_2511F5C30;
    v11[4] = self;
    -[SUUIStorePageSectionsViewController _enumerateSectionContextsUsingBlock:](self, "_enumerateSectionContextsUsingBlock:", v11);
    -[SUUIColorScheme backgroundColor](self->_colorScheme, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    -[SUUICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v9);
    if (-[SUUIStorePageSectionsViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SUUIStorePageSectionsViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v9);

    }
  }
}

uint64_t __54__SUUIStorePageSectionsViewController_setColorScheme___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setColorScheme:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072));
}

- (void)setDelegate:(id)a3
{
  SUUIStorePageSectionsDelegate **p_delegate;
  id v5;
  char v6;
  id WeakRetained;
  id v8;

  p_delegate = &self->_delegate;
  v8 = a3;
  v5 = objc_storeWeak((id *)p_delegate, v8);
  v6 = objc_opt_respondsToSelector();

  self->_delegateWantsDidScroll = v6 & 1;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  self->_delegateWantsWillScrollToOffsetVisibleRange = objc_opt_respondsToSelector() & 1;

}

- (void)setIndexBarControl:(id)a3
{
  SUUIIndexBarControl *v5;
  SUUIIndexBarControl *v6;

  v5 = (SUUIIndexBarControl *)a3;
  if (self->_indexBarControl != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_indexBarControl, a3);
    -[SUUICollectionView setIndexBarControl:](self->_collectionView, "setIndexBarControl:", self->_indexBarControl);
    v5 = v6;
  }

}

- (void)setActiveMetricsImpressionSession:(id)a3
{
  SUUIMetricsImpressionSession *v5;
  _QWORD v6[4];
  SUUIMetricsImpressionSession *v7;

  v5 = (SUUIMetricsImpressionSession *)a3;
  if (self->_activeMetricsImpressionSession != v5)
  {
    objc_storeStrong((id *)&self->_activeMetricsImpressionSession, a3);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __73__SUUIStorePageSectionsViewController_setActiveMetricsImpressionSession___block_invoke;
    v6[3] = &unk_2511F5C30;
    v7 = v5;
    -[SUUIStorePageSectionsViewController _enumerateSectionContextsUsingBlock:](self, "_enumerateSectionContextsUsingBlock:", v6);

  }
}

uint64_t __73__SUUIStorePageSectionsViewController_setActiveMetricsImpressionSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setActiveMetricsImpressionSession:", *(_QWORD *)(a1 + 32));
}

- (void)setPinningTransitionStyle:(int64_t)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_pinningTransitionStyle != a3)
  {
    self->_pinningTransitionStyle = a3;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __65__SUUIStorePageSectionsViewController_setPinningTransitionStyle___block_invoke;
    v5[3] = &unk_2511F5C30;
    v5[4] = self;
    -[SUUIStorePageSectionsViewController _enumerateSectionContextsUsingBlock:](self, "_enumerateSectionContextsUsingBlock:", v5);
    -[SUUICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateLayout");

  }
}

uint64_t __65__SUUIStorePageSectionsViewController_setPinningTransitionStyle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setDefaultPinningTransitionStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1240));
}

- (void)setMetricsController:(id)a3
{
  SUUIMetricsController *v5;
  _QWORD v6[4];
  SUUIMetricsController *v7;

  v5 = (SUUIMetricsController *)a3;
  if (self->_metricsController != v5)
  {
    objc_storeStrong((id *)&self->_metricsController, a3);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__SUUIStorePageSectionsViewController_setMetricsController___block_invoke;
    v6[3] = &unk_2511F5C30;
    v7 = v5;
    -[SUUIStorePageSectionsViewController _enumerateSectionContextsUsingBlock:](self, "_enumerateSectionContextsUsingBlock:", v6);

  }
}

uint64_t __60__SUUIStorePageSectionsViewController_setMetricsController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setMetricsController:", *(_QWORD *)(a1 + 32));
}

- (void)setSectionsWithPageComponents:(id)a3
{
  SUUIStorePageSplitsDescription *v4;
  SUUIStorePageSplit *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = objc_alloc_init(SUUIStorePageSplitsDescription);
    v5 = objc_alloc_init(SUUIStorePageSplit);
    -[SUUIStorePageSplit setPageComponents:](v5, "setPageComponents:", v6);
    -[SUUIStorePageSplitsDescription setTopSplit:](v4, "setTopSplit:", v5);
    -[SUUIStorePageSectionsViewController setSectionsWithSplitsDescription:](self, "setSectionsWithSplitsDescription:", v4);

  }
  else
  {
    -[SUUIStorePageSectionsViewController setSectionsWithSplitsDescription:](self, "setSectionsWithSplitsDescription:", 0);
  }

}

- (void)setSectionsWithSplitsDescription:(id)a3
{
  SUUIStorePageSplitsDescription *v5;
  SUUIStorePageSplitsDescription *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  NSMapTable *menuSectionContexts;
  NSMapTable *expandSectionContexts;
  objc_class *v18;
  void *v19;
  SUUIStorePageSplitsDescription *v20;
  SUUIStorePageSplitsDescription *splitsDescription;
  int64_t v22;
  uint64_t v23;
  void *v24;
  id deferredSplitsDescription;
  SUUILayoutCache *textLayoutCache;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[8];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v5 = (SUUIStorePageSplitsDescription *)a3;
  v6 = v5;
  if (self->_ignoreSectionsChangeCount < 1)
  {
    if (self->_splitsDescription != v5)
    {
      v51 = 0;
      v52 = &v51;
      v53 = 0x3032000000;
      v54 = __Block_byref_object_copy__13;
      v55 = __Block_byref_object_dispose__13;
      v56 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v31 = 1296;
      v7 = self->_sections;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v48 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(v11, "pageComponent", v31);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "viewElement");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "persistenceKey");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
              objc_msgSend((id)v52[5], "setObject:forKey:", v11, v14);

          }
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
        }
        while (v8);
      }

      v15 = -[SUUIStorePageSplitsDescription numberOfSplits](self->_splitsDescription, "numberOfSplits");
      menuSectionContexts = self->_menuSectionContexts;
      self->_menuSectionContexts = 0;

      expandSectionContexts = self->_expandSectionContexts;
      self->_expandSectionContexts = 0;

      v18 = (objc_class *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v19 = *(Class *)((char *)&self->super.super.super.super.isa + v31);
      *(Class *)((char *)&self->super.super.super.super.isa + v31) = v18;

      v20 = (SUUIStorePageSplitsDescription *)-[SUUIStorePageSplitsDescription copy](v6, "copy");
      splitsDescription = self->_splitsDescription;
      self->_splitsDescription = v20;

      v22 = -[SUUIStorePageSplitsDescription numberOfSplits](self->_splitsDescription, "numberOfSplits");
      v43 = 0;
      v44 = &v43;
      v45 = 0x2020000000;
      v46 = 0;
      if (self->_collectionView
        && self->_didInitialReload
        && (v23 = v22, objc_msgSend((id)v52[5], "count"))
        && v15 < 2 != v23 > 1)
      {
        v44[3] = 1;
      }
      else
      {
        -[SUUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", 0, v31);
        textLayoutCache = self->_textLayoutCache;
        self->_textLayoutCache = 0;

      }
      v37 = 0;
      v38 = &v37;
      v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__13;
      v41 = __Block_byref_object_dispose__13;
      v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __72__SUUIStorePageSectionsViewController_setSectionsWithSplitsDescription___block_invoke;
      v36[3] = &unk_2511F5C80;
      v36[4] = self;
      v36[5] = &v37;
      v36[6] = &v51;
      v36[7] = &v43;
      -[SUUIStorePageSectionsViewController _updateCollectionViewWithUpdates:](self, "_updateCollectionViewWithUpdates:", v36);
      if (!v44[3])
        goto LABEL_31;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v27 = (id)v38[5];
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v57, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v33 != v29)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "prefetchResourcesWithReason:", -1, v31);
          }
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v57, 16);
        }
        while (v28);
      }

      if (v44[3] != 3)
LABEL_31:
        -[SUUIStorePageSectionsViewController _reloadRelevantEntityProviders](self, "_reloadRelevantEntityProviders", v31);
      _Block_object_dispose(&v37, 8);

      _Block_object_dispose(&v43, 8);
      _Block_object_dispose(&v51, 8);

    }
  }
  else if (v5)
  {
    if (self->_deferredSplitsDescription != v5)
      objc_storeStrong(&self->_deferredSplitsDescription, a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    deferredSplitsDescription = self->_deferredSplitsDescription;
    self->_deferredSplitsDescription = v24;

  }
}

uint64_t __72__SUUIStorePageSectionsViewController_setSectionsWithSplitsDescription___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  __int128 v22;
  __int128 v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newSectionContext");
  objc_msgSend(v2, "activePageWidth");
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1304);
  v21[1] = 3221225472;
  v21[0] = MEMORY[0x24BDAC760];
  v21[2] = __72__SUUIStorePageSectionsViewController_setSectionsWithSplitsDescription___block_invoke_2;
  v21[3] = &unk_2511F5C58;
  v22 = v3;
  v23 = v4;
  v24 = &v31;
  v25 = &v35;
  v26 = &v27;
  objc_msgSend(v5, "sizeSplitsToFitWidth:usingBlock:", v21);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 1
    && !objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
  {
    v6 = v36[3];
    if (v32[3] + v6 == v28[3])
    {
      v7 = v6 <= 0;
      v8 = 2;
      if (v7)
        v8 = 3;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
    }
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v39, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "context");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "willHideInContext:", v14);

        objc_msgSend(v13, "_setContext:", 0);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v39, 16);
    }
    while (v10);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v15;
}

void __72__SUUIStorePageSectionsViewController_setSectionsWithSplitsDescription___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newSectionContext");
  objc_msgSend(v6, "_setActivePageWidth:", a3);
  v51 = v6;
  objc_msgSend(v5, "setSectionContext:", v6);
  v45 = v5;
  objc_msgSend(v5, "pageComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  v9 = &OBJC_IVAR___SUUIPlayButtonControl__progressIndicatorCompositingFilter;
  if (v8)
  {
    v10 = v8;
    v50 = 0;
    v11 = *(_QWORD *)v57;
    v46 = v7;
    v47 = *(_QWORD *)v57;
    while (1)
    {
      v12 = 0;
      v48 = v10;
      do
      {
        if (*(_QWORD *)v57 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v12);
        objc_msgSend(v13, "viewElement");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "persistenceKey");
        v15 = objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "componentType") == 19)
        {
          objc_msgSend(*(id *)(a1 + 32), "_createSectionsForExpandPageComponent:context:newSections:sectionCount:sectionsByViewElement:updateStyle:", v13, v51, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v50, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndex:", 3);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v19 = *(void **)(v18 + 40);
          *(_QWORD *)(v18 + 40) = v17;

          objc_msgSend(v16, "objectAtIndex:", 4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v20, "integerValue");

          objc_msgSend(v16, "objectAtIndex:", 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += objc_msgSend(v21, "integerValue");

          objc_msgSend(v16, "objectAtIndex:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += objc_msgSend(v22, "integerValue");

          objc_msgSend(v16, "objectAtIndex:", 2);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v25 = *(void **)(v24 + 40);
          *(_QWORD *)(v24 + 40) = v23;

          v26 = (void *)v15;
          goto LABEL_27;
        }
        if (v15)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKey:", v15);
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = (void *)v27;
            v29 = v7;
            v30 = (void *)v15;
            v31 = v9[137];
            v32 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v31), "count");
            objc_msgSend(v28, "setBottomSection:", 0);
            objc_msgSend(v28, "setSectionIndex:", v32);
            objc_msgSend(v28, "setTopSection:", v50 == 0);
            v16 = v28;
            v33 = objc_msgSend(v28, "updateWithContext:pageComponent:", v51, v13);
            if (v33 == 2)
            {
              v34 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
              v26 = v30;
              v7 = v29;
              v11 = v47;
              v10 = v48;
LABEL_25:
              ++*v34;
            }
            else
            {
              v26 = v30;
              v7 = v29;
              v11 = v47;
              v10 = v48;
              if (v33 == 1)
              {
                v34 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
                goto LABEL_25;
              }
            }
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v31), "addObject:", v16);
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeObjectForKey:", v26);
            ++v50;
            goto LABEL_27;
          }
        }
        v49 = v12;
        v35 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newSectionsWithPageComponent:", v13);
        v36 = v9[137];
        v37 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v36), "count");
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v38 = v35;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v53 != v41)
                objc_enumerationMutation(v38);
              v43 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
              objc_msgSend(v43, "setBottomSection:", 0);
              objc_msgSend(v43, "_setContext:", v51);
              objc_msgSend(v43, "setSectionIndex:", v37 + i);
              objc_msgSend(v43, "setTopSection:", v50 + i == 0);
              if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 1)
                objc_msgSend(v43, "willAppearInContext:", v51);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v43);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v36), "addObject:", v43);
            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
            v37 += i;
            v50 += i;
          }
          while (v40);
          v7 = v46;
          v11 = v47;
          v9 = &OBJC_IVAR___SUUIPlayButtonControl__progressIndicatorCompositingFilter;
        }
        v16 = v38;

        v10 = v48;
        v26 = (void *)v15;
        v12 = v49;
LABEL_27:

        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      if (!v10)
        goto LABEL_31;
    }
  }
  v50 = 0;
LABEL_31:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v9[137]), "lastObject");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setBottomSection:", 1);
  objc_msgSend(v45, "setNumberOfPageSections:", v50);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) += v50;

}

- (void)setSUUIStackedBar:(id)a3
{
  SUUIStackedBar *v5;
  SUUIStackedBar **p_stackedBar;
  SUUIStackedBar *v7;

  v5 = (SUUIStackedBar *)a3;
  p_stackedBar = &self->_stackedBar;
  if (*p_stackedBar != v5)
  {
    v7 = v5;
    -[SUUIStackedBar removeFromSuperview](*p_stackedBar, "removeFromSuperview");
    objc_storeStrong((id *)p_stackedBar, a3);
    v5 = v7;
  }

}

- (void)showOverlayWithProductPage:(id)a3 metricsPageEvent:(id)a4
{
  id v6;
  SUUIProductPageOverlayController *v7;
  SUUIProductPageOverlayController *overlayController;
  SUUIProductPageOverlayController *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (self->_overlayController)
    -[SUUIStorePageSectionsViewController dismissOverlays](self, "dismissOverlays");
  v7 = -[SUUIProductPageOverlayController initWithParentViewController:]([SUUIProductPageOverlayController alloc], "initWithParentViewController:", self);
  overlayController = self->_overlayController;
  self->_overlayController = v7;

  v9 = self->_overlayController;
  -[SUUIViewController clientContext](self, "clientContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageOverlayController setClientContext:](v9, "setClientContext:", v10);

  -[SUUIProductPageOverlayController setDelegate:](self->_overlayController, "setDelegate:", self);
  -[SUUIProductPageOverlayController showWithInitialProductPage:metricsPageEvent:](self->_overlayController, "showWithInitialProductPage:metricsPageEvent:", v11, v6);
  -[SUUIStorePageSectionsViewController _setActiveProductPageOverlayController:](self, "_setActiveProductPageOverlayController:", self->_overlayController);

}

- (id)SUUIStackedBar
{
  return self->_stackedBar;
}

- (void)setUsePullToRefresh:(BOOL)a3
{
  UIRefreshControl *refreshControl;
  UIRefreshControl *v5;
  UIRefreshControl *v6;
  SUUICollectionView *collectionView;
  UIRefreshControl *v8;

  refreshControl = self->_refreshControl;
  if (a3)
  {
    if (!refreshControl)
    {
      v5 = (UIRefreshControl *)objc_opt_new();
      v6 = self->_refreshControl;
      self->_refreshControl = v5;

      -[UIRefreshControl addTarget:action:forControlEvents:](self->_refreshControl, "addTarget:action:forControlEvents:", self, sel__startRefresh_, 4096);
      collectionView = self->_collectionView;
      if (collectionView)
        -[SUUICollectionView setRefreshControl:](collectionView, "setRefreshControl:", self->_refreshControl);
      return;
    }
  }
  else if (!refreshControl)
  {
    return;
  }
  if (-[UIRefreshControl isRefreshing](refreshControl, "isRefreshing"))
    -[UIRefreshControl endRefreshing](self->_refreshControl, "endRefreshing");
  -[UIRefreshControl removeFromSuperview](self->_refreshControl, "removeFromSuperview");
  v8 = self->_refreshControl;
  self->_refreshControl = 0;

}

- (void)_startRefresh:(id)a3
{
  SUUICollectionViewPullToRefreshDelegate **p_pullToRefreshDelegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;

  p_pullToRefreshDelegate = &self->_pullToRefreshDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pullToRefreshDelegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_pullToRefreshDelegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_pullToRefreshDelegate);
      objc_msgSend(v9, "refresh:refreshControl:", self->_collectionView, self->_refreshControl);

    }
  }
}

- (void)_longPressAction:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "state") == 1;
  v5 = v9;
  if (v4)
  {
    objc_msgSend(v9, "locationInView:", self->_collectionView);
    -[SUUICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v6, "section"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "collectionViewDidLongPressItemAtIndexPath:", v7);

    }
    v5 = v9;
  }

}

- (void)suui_viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUUIStorePageSectionsViewController _deselectCellsForAppearance:](self, "_deselectCellsForAppearance:");
  v5.receiver = self;
  v5.super_class = (Class)SUUIStorePageSectionsViewController;
  -[SUUIViewController suui_viewWillAppear:](&v5, sel_suui_viewWillAppear_, v3);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 0;
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *initialOverlayURLs;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overlayURLs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "addObject:", v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v13 = (NSArray *)objc_msgSend(v6, "copy");
    initialOverlayURLs = self->_initialOverlayURLs;
    self->_initialOverlayURLs = v13;

  }
  v15.receiver = self;
  v15.super_class = (Class)SUUIStorePageSectionsViewController;
  -[SUUIStorePageSectionsViewController decodeRestorableStateWithCoder:](&v15, sel_decodeRestorableStateWithCoder_, v4);

}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  objc_super v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeOverlayController);
  objc_msgSend(WeakRetained, "URLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("overlayURLs"));
  v7.receiver = self;
  v7.super_class = (Class)SUUIStorePageSectionsViewController;
  -[SUUIStorePageSectionsViewController encodeRestorableStateWithCoder:](&v7, sel_encodeRestorableStateWithCoder_, v4);

}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double Height;
  void *v15;
  double v16;
  UIViewControllerPreviewing *v17;
  UIViewControllerPreviewing *viewControllerPreviewing;
  id v19;
  CGRect v20;
  CGRect v21;

  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v19 = (id)objc_msgSend(v3, "initWithFrame:");

  -[SUUIStorePageSectionsViewController setView:](self, "setView:", v19);
  -[SUUIStorePageSectionsViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v19, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v19, "addSubview:", v5);
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v6);

  if (self->_stackedBar)
  {
    objc_msgSend(v19, "bounds");
    v8 = v7;
    v10 = v9;
    v11 = 0.0;
    if (-[SUUIStackedBar splitViewStyle](self->_stackedBar, "splitViewStyle"))
    {
      -[SUUIStorePageSectionsViewController navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "navigationBar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      Height = CGRectGetHeight(v20);

      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "statusBarFrame");
      v16 = CGRectGetHeight(v21);

      v11 = Height + v16;
    }
    -[SUUIStackedBar setAutoresizingMask:](self->_stackedBar, "setAutoresizingMask:", 2);
    -[SUUIStackedBar setFrame:](self->_stackedBar, "setFrame:", v8, v11, v10, 0.0);
    objc_msgSend(v19, "addSubview:", self->_stackedBar);
  }
  if (__orbSupported)
  {
    -[SUUIStorePageSectionsViewController registerForPreviewingWithDelegate:sourceView:](self, "registerForPreviewingWithDelegate:sourceView:", self, v5);
    v17 = (UIViewControllerPreviewing *)objc_claimAutoreleasedReturnValue();
    viewControllerPreviewing = self->_viewControllerPreviewing;
    self->_viewControllerPreviewing = v17;

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *initialOverlayURLs;
  SUUIProductPageOverlayController *v6;
  SUUIProductPageOverlayController *overlayController;
  SUUIProductPageOverlayController *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  initialOverlayURLs = self->_initialOverlayURLs;
  if (initialOverlayURLs)
  {
    if (!self->_overlayController)
    {
      v6 = -[SUUIProductPageOverlayController initWithParentViewController:]([SUUIProductPageOverlayController alloc], "initWithParentViewController:", self);
      overlayController = self->_overlayController;
      self->_overlayController = v6;

      v8 = self->_overlayController;
      -[SUUIViewController clientContext](self, "clientContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageOverlayController setClientContext:](v8, "setClientContext:", v9);

      -[SUUIProductPageOverlayController setDelegate:](self->_overlayController, "setDelegate:", self);
      -[SUUIProductPageOverlayController showWithInitialURLs:](self->_overlayController, "showWithInitialURLs:", self->_initialOverlayURLs);
      -[SUUIStorePageSectionsViewController _setActiveProductPageOverlayController:](self, "_setActiveProductPageOverlayController:", self->_overlayController);
      initialOverlayURLs = self->_initialOverlayURLs;
    }
    self->_initialOverlayURLs = 0;

  }
  -[SUUICollectionView setClipsToBounds:](self->_collectionView, "setClipsToBounds:", !self->_rendersWithPerspective);
  -[SUUIResourceLoader enterForeground](self->_resourceLoader, "enterForeground");
  v10.receiver = self;
  v10.super_class = (Class)SUUIStorePageSectionsViewController;
  -[SUUIStorePageSectionsViewController viewDidAppear:](&v10, sel_viewDidAppear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  -[SUUIStorePageSectionsViewController _invalidateIfLastKnownWidthChanged](self, "_invalidateIfLastKnownWidthChanged");
  -[SUUICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionsViewController _currentBackdropGroupName](self, "_currentBackdropGroupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackdropGroupName:", v6);

  -[SUUIStorePageSectionsViewController _deselectCellsForAppearance:](self, "_deselectCellsForAppearance:", v3);
  -[SUUIStorePageSectionsViewController _beginActiveImpressionsForImpressionableViewElements](self, "_beginActiveImpressionsForImpressionableViewElements");
  if (self->_itemsChangedStateWhileDisappeared)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_sections;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "requestLayoutWithReloadReason:", 2);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    -[SUUIStorePageSectionsViewController _textLayoutCache](self, "_textLayoutCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "commitLayoutRequests");

    self->_itemsChangedStateWhileDisappeared = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)SUUIStorePageSectionsViewController;
  -[SUUIViewController viewWillAppear:](&v13, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSNumber *v9;
  NSNumber *lastKnownWidth;
  objc_super v11;

  v3 = a3;
  -[SUUIStorePageSectionsViewController _invalidateIfLastKnownWidthChanged](self, "_invalidateIfLastKnownWidthChanged");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[SUUIStorePageSectionsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  *(float *)&v8 = v7;
  objc_msgSend(v5, "numberWithFloat:", v8);
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  lastKnownWidth = self->_lastKnownWidth;
  self->_lastKnownWidth = v9;

  -[SUUICollectionView setClipsToBounds:](self->_collectionView, "setClipsToBounds:", 1);
  -[SUUIStorePageSectionsViewController _endAllPendingActiveImpression](self, "_endAllPendingActiveImpression");
  v11.receiver = self;
  v11.super_class = (Class)SUUIStorePageSectionsViewController;
  -[SUUIStorePageSectionsViewController viewWillDisappear:](&v11, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIStorePageSectionsViewController;
  -[SUUIStorePageSectionsViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SUUIResourceLoader enterBackground](self->_resourceLoader, "enterBackground");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  NSNumber *v12;
  NSNumber *lastKnownWidth;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a4;
  -[SUUIStorePageSectionsViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  *(float *)&v11 = v10;
  objc_msgSend(v7, "numberWithFloat:", v11);
  v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  lastKnownWidth = self->_lastKnownWidth;
  self->_lastKnownWidth = v12;

  v14.receiver = self;
  v14.super_class = (Class)SUUIStorePageSectionsViewController;
  -[SUUIStorePageSectionsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUUIStorePageSectionsViewController;
  v4 = a3;
  -[SUUIStorePageSectionsViewController traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v12.receiver, v12.super_class);

  -[SUUIStorePageSectionsViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    -[SUUICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      objc_msgSend(v9, "indexPathsForPinningItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        v11 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
        objc_msgSend(v11, "setInvalidateFlowLayoutAttributes:", 0);
        objc_msgSend(v11, "setInvalidateFlowLayoutDelegateMetrics:", 0);
        objc_msgSend(v11, "setInvalidateItemPinningLayoutInformation:", 0);
        objc_msgSend(v11, "setInvalidatePinnedBackdropViewStyle:", 1);
        objc_msgSend(v11, "invalidateDecorationElementsOfKind:atIndexPaths:", 0x2511FF4C8, v10);
        objc_msgSend(v9, "invalidateLayoutWithContext:", v11);

      }
    }

  }
}

- (void)collectionView:(id)a3 editorialView:(id)a4 didSelectLink:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v8, "superview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertRect:fromView:", v18, v11, v13, v15, v17);
  v20 = v19;
  v22 = v21;

  objc_msgSend(v9, "indexPathForItemAtPoint:", v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v23, "section"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "showPageWithLink:", v25);

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
  v7[2] = __73__SUUIStorePageSectionsViewController_itemStateCenter_itemStatesChanged___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __73__SUUIStorePageSectionsViewController_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id obj;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
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
  v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "indexPathsForVisibleItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = *(id *)(a1 + 40);
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v22)
  {
    v20 = *(_QWORD *)v35;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(obj);
        v23 = v2;
        v3 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v2);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v4 = v21;
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v31 != v7)
                objc_enumerationMutation(v4);
              v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              v10 = objc_msgSend(v9, "section");
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "objectAtIndex:", v10);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v11, "updateCellWithIndexPath:itemState:animated:", v9, v3, 0))
              {
                objc_msgSend(v25, "addObject:", v9);
                objc_msgSend(v24, "addIndex:", v10);
              }

            }
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v6);
        }

        v2 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v22);
  }

  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1344) = 1;
    v14 = objc_alloc_init(MEMORY[0x24BDD1698]);
    v15 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __73__SUUIStorePageSectionsViewController_itemStateCenter_itemStatesChanged___block_invoke_2;
    v28[3] = &unk_2511F5CA8;
    v28[4] = *(_QWORD *)(a1 + 32);
    v16 = v14;
    v29 = v16;
    objc_msgSend(v24, "enumerateIndexesUsingBlock:", v28);
    objc_msgSend(*(id *)(a1 + 32), "_textLayoutCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "commitLayoutRequests");

    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = __73__SUUIStorePageSectionsViewController_itemStateCenter_itemStatesChanged___block_invoke_3;
    v26[3] = &unk_2511F5CD0;
    v26[4] = *(_QWORD *)(a1 + 32);
    v27 = v16;
    v18 = v16;
    objc_msgSend(v25, "enumerateObjectsUsingBlock:", v26);

  }
}

void __73__SUUIStorePageSectionsViewController_itemStateCenter_itemStatesChanged___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "objectAtIndex:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "requestLayoutWithReloadReason:", 2))
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);

}

void __73__SUUIStorePageSectionsViewController_itemStateCenter_itemStatesChanged___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "section");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "objectAtIndex:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", v3))
  {
    objc_msgSend(v4, "reloadVisibleCellsWithReason:", 2);
    objc_msgSend(*(id *)(a1 + 40), "removeIndex:", v3);
  }
  else
  {
    objc_msgSend(v4, "reloadCellWithIndexPath:reason:", v5, 2);
  }

}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__SUUIStorePageSectionsViewController_layoutCacheDidFinishBatch___block_invoke;
  v3[3] = &unk_2511F47C0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v3);
}

uint64_t __65__SUUIStorePageSectionsViewController_layoutCacheDidFinishBatch___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 1296);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "invalidateCachedLayoutInformation", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "reloadData");
}

- (void)productPageOverlayDidDismiss:(id)a3
{
  SUUIProductPageOverlayController *overlayController;
  void *v5;
  id v6;

  if (self->_overlayController == a3)
  {
    -[SUUIStorePageSectionsViewController _setActiveProductPageOverlayController:](self, "_setActiveProductPageOverlayController:", 0);
    -[SUUIProductPageOverlayController setDelegate:](self->_overlayController, "setDelegate:", 0);
    overlayController = self->_overlayController;
    self->_overlayController = 0;

    if (!-[NSMutableArray count](self->_sections, "count"))
    {
      SUUIViewControllerGetAncestorTabBarController(self);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "transientViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        if (SUUIViewControllerIsDescendent(self, v5))
          objc_msgSend(v6, "setTransientViewController:animated:", 0, 0);
      }

    }
  }
}

- (id)backgroundColorForSection:(int64_t)a3
{
  void *v5;
  void *v6;

  if (-[NSMutableArray count](self->_sections, "count") <= (unint64_t)a3)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColorForSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)collectionView:(id)a3 canScrollCellAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSIndexPath *indexPathOfEditedCell;
  uint64_t v10;
  void *v11;
  NSIndexPath *v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  indexPathOfEditedCell = self->_indexPathOfEditedCell;
  if (!indexPathOfEditedCell
    || (v10 = objc_msgSend(v7, "compare:"), indexPathOfEditedCell = self->_indexPathOfEditedCell, !v10))
  {
    if (-[NSIndexPath compare:](indexPathOfEditedCell, "compare:", v8) == NSOrderedSame)
      goto LABEL_6;
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  -[SUUICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", indexPathOfEditedCell);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isDeleteButtonHidden") & 1) == 0)
  {
    if ((objc_msgSend(v11, "isScrollingCellToHideActionButton") & 1) == 0)
      objc_msgSend(v11, "hideDeleteButton");

    goto LABEL_10;
  }
  v12 = self->_indexPathOfEditedCell;
  self->_indexPathOfEditedCell = 0;

  -[UITapGestureRecognizer setEnabled:](self->_collectionViewTapGestureRecognizer, "setEnabled:", 0);
LABEL_6:
  v13 = 1;
LABEL_11:

  return v13;
}

- (void)collectionView:(id)a3 didEndEditingItemAtIndexPath:(id)a4
{
  NSIndexPath *indexPathOfEditedCell;

  indexPathOfEditedCell = self->_indexPathOfEditedCell;
  self->_indexPathOfEditedCell = 0;

  -[UITapGestureRecognizer setEnabled:](self->_collectionViewTapGestureRecognizer, "setEnabled:", 0);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 pinningContentInsetForItemAtIndexPath:(id)a5
{
  NSMutableArray *sections;
  id v6;
  void *v7;
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
  double v19;
  UIEdgeInsets result;

  sections = self->_sections;
  v6 = a5;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pinningContentInsetForItemAtIndexPath:", v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (int64_t)collectionView:(id)a3 layout:(id)a4 pinningStyleForItemAtIndexPath:(id)a5
{
  NSMutableArray *sections;
  id v6;
  void *v7;
  int64_t v8;

  sections = self->_sections;
  v6 = a5;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pinningStyleForItemAtIndexPath:", v6);

  return v8;
}

- (int64_t)collectionView:(id)a3 layout:(id)a4 pinningGroupForItemAtIndexPath:(id)a5
{
  NSMutableArray *sections;
  id v6;
  void *v7;
  int64_t v8;

  sections = self->_sections;
  v6 = a5;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pinningGroupForItemAtIndexPath:", v6);

  return v8;
}

- (int64_t)collectionView:(id)a3 layout:(id)a4 pinningTransitionStyleForItemAtIndexPath:(id)a5
{
  NSMutableArray *sections;
  id v6;
  void *v7;
  int64_t v8;

  sections = self->_sections;
  v6 = a5;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pinningTransitionStyleForItemAtIndexPath:", v6);

  return v8;
}

- (void)collectionView:(id)a3 layout:(id)a4 willApplyLayoutAttributes:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  v8 = a5;
  if (!objc_msgSend(v8, "representedElementCategory"))
  {
    objc_msgSend(v8, "indexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v6, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionViewWillApplyLayoutAttributes:", v8);

  }
}

- (void)collectionView:(id)a3 willBeginEditingItemAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  SUUICollectionView *collectionView;
  void *v9;
  id v10;

  v10 = a4;
  objc_storeStrong((id *)&self->_indexPathOfEditedCell, a4);
  -[SUUICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    collectionView = self->_collectionView;
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICollectionView deselectItemAtIndexPath:animated:](collectionView, "deselectItemAtIndexPath:animated:", v9, 0);

  }
  -[UITapGestureRecognizer setEnabled:](self->_collectionViewTapGestureRecognizer, "setEnabled:", 1);

}

- (id)indexPathsForPinningItemsInCollectionView:(id)a3 layout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  SUUIStorePageSplitsDescription *splitsDescription;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3010000000;
  v25 = 0;
  v26 = 0;
  v24 = "";
  -[SUUIStorePageSectionsViewController _collectionViewSublayouts](self, "_collectionViewSublayouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") > 1)
  {
    splitsDescription = self->_splitsDescription;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __88__SUUIStorePageSectionsViewController_indexPathsForPinningItemsInCollectionView_layout___block_invoke;
    v17[3] = &unk_2511F5CF8;
    v18 = v7;
    v19 = v8;
    v20 = &v21;
    -[SUUIStorePageSplitsDescription enumerateSplitsUsingBlock:](splitsDescription, "enumerateSplitsUsingBlock:", v17);

    v10 = v22;
    v9 = v22[5];
  }
  else
  {
    v9 = -[NSMutableArray count](self->_sections, "count");
    v10 = v22;
    v22[5] = v9;
  }
  v12 = v10[4];
  if (v12 >= v9 + v12)
  {
    v13 = 0;
  }
  else
  {
    v13 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "indexPathsForPinningItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        if (!v13)
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v15, "count"));
        objc_msgSend(v13, "addObjectsFromArray:", v15);
      }

      ++v12;
    }
    while (v12 < v22[5] + v22[4]);
  }

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __88__SUUIStorePageSectionsViewController_indexPathsForPinningItemsInCollectionView_layout___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v7 = objc_msgSend(a2, "numberOfPageSections");
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v8 == v9)
  {
    *(_QWORD *)(v10 + 40) = v7;
    *a4 = 1;
  }
  else
  {
    *(_QWORD *)(v10 + 32) += v7;
  }
}

- (id)indexPathsForGradientItemsInCollectionView:(id)a3 layout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  SUUIStorePageSplitsDescription *splitsDescription;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3010000000;
  v25 = 0;
  v26 = 0;
  v24 = "";
  -[SUUIStorePageSectionsViewController _collectionViewSublayouts](self, "_collectionViewSublayouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") > 1)
  {
    splitsDescription = self->_splitsDescription;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __89__SUUIStorePageSectionsViewController_indexPathsForGradientItemsInCollectionView_layout___block_invoke;
    v17[3] = &unk_2511F5CF8;
    v18 = v7;
    v19 = v8;
    v20 = &v21;
    -[SUUIStorePageSplitsDescription enumerateSplitsUsingBlock:](splitsDescription, "enumerateSplitsUsingBlock:", v17);

    v10 = v22;
    v9 = v22[5];
  }
  else
  {
    v9 = -[NSMutableArray count](self->_sections, "count");
    v10 = v22;
    v22[5] = v9;
  }
  v12 = v10[4];
  if (v12 >= v9 + v12)
  {
    v13 = 0;
  }
  else
  {
    v13 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "indexPathsForBackgroundItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        if (!v13)
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v15, "count"));
        objc_msgSend(v13, "addObjectsFromArray:", v15);
      }

      ++v12;
    }
    while (v12 < v22[5] + v22[4]);
  }

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __89__SUUIStorePageSectionsViewController_indexPathsForGradientItemsInCollectionView_layout___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v7 = objc_msgSend(a2, "numberOfPageSections");
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v8 == v9)
  {
    *(_QWORD *)(v10 + 40) = v7;
    *a4 = 1;
  }
  else
  {
    *(_QWORD *)(v10 + 32) += v7;
  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UIEdgeInsets result;

  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", a5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_sections, "count") <= (unint64_t)(a5 + 1))
  {
    v8 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "pageComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    objc_msgSend(v8, "pageComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    v15 = objc_opt_class();

    if (v14 == v15)
    {
      v21 = 5.0;
      v17 = 0.0;
      v19 = 0.0;
      v23 = 0.0;
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend(v7, "sectionContentInset");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
LABEL_8:

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double Width;
  double v7;
  double v8;
  double v9;
  CGSize result;
  CGRect v11;

  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(a5, "section", a3, a4)), "cellSizeForIndexPath:", a5);
  v8 = v7;
  if (Width < 0.00000011920929)
  {
    objc_msgSend(a3, "bounds");
    Width = CGRectGetWidth(v11);
  }
  v9 = 1.0;
  if (v8 >= 0.00000011920929)
    v9 = v8;
  result.height = v9;
  result.width = Width;
  return result;
}

- (BOOL)performTestWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SUUICollectionView *collectionView;
  uint64_t v14;
  uint64_t v15;
  double v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("Scroll")))
  {
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", 4.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "runUntilDate:", v10);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iterations"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("offset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    collectionView = self->_collectionView;
    v14 = objc_msgSend(v11, "intValue");
    v15 = objc_msgSend(v12, "intValue");
    -[SUUICollectionView contentSize](self->_collectionView, "contentSize");
    -[SUUICollectionView _performScrollTest:iterations:delta:length:](collectionView, "_performScrollTest:iterations:delta:length:", v6, v14, v15, (int)v16);

  }
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionsViewController metricsController](self, "metricsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeImpressionsSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v8, "addImpressionsForIndexPath:toSession:", v7, v11);
  if (!v9)
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("UICollectionViewCell"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfCells");

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return -[NSMutableArray count](self->_sections, "count", a3);
}

- (void)collectionView:(id)a3 didConfirmButtonElement:(id)a4 withClickInfo:(id)a5 forItemAtIndexPath:(id)a6
{
  NSMutableArray *sections;
  id v9;
  id v10;
  id v11;
  id v12;

  sections = self->_sections;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v9, "section"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionViewDidConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v11, v10, v9);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  v8 = objc_msgSend(v7, "section");
  if (v8 < -[NSMutableArray count](self->_sections, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionViewWillDisplayCellForItemAtIndexPath:", v7);
    objc_msgSend(v9, "registerContextActionsForCell:indexPath:viewController:", v10, v7, self);

  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  v8 = objc_msgSend(v7, "section");
  if (v8 < -[NSMutableArray count](self->_sections, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionViewDidEndDisplayingCellForItemAtIndexPath:", v7);
    objc_msgSend(v9, "unregisterContextActionsForCell:indexPath:viewController:", v10, v7, self);

  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  NSMutableArray *sections;
  id v5;
  id v6;

  sections = self->_sections;
  v5 = a4;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v5, "section"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionViewDidSelectItemAtIndexPath:", v5);

}

- (void)collectionView:(id)a3 expandEditorialForLabelElement:(id)a4 indexPath:(id)a5
{
  NSMutableArray *sections;
  id v7;
  id v8;
  id v9;

  sections = self->_sections;
  v7 = a5;
  v8 = a4;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v7, "section"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "expandEditorialForLabelElement:indexPath:", v8, v7);

}

- (void)collectionView:(id)a3 performDefaultActionForViewElement:(id)a4 indexPath:(id)a5
{
  NSMutableArray *sections;
  id v7;
  id v8;

  sections = self->_sections;
  v7 = a4;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(a5, "section"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performDefaultActionForViewElement:", v7);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  NSMutableArray *sections;
  id v5;
  void *v6;
  char v7;

  sections = self->_sections;
  v5 = a4;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "collectionViewShouldHighlightItemAtIndexPath:", v5);

  return v7;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  NSMutableArray *sections;
  id v5;
  void *v6;
  char v7;

  sections = self->_sections;
  v5 = a4;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "collectionViewShouldSelectItemAtIndexPath:", v5);

  return v7;
}

- (void)itemCollectionView:(id)a3 didConfirmItemOfferForCell:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "indexPathForCell:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v5, "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionViewDidConfirmItemOfferAtIndexPath:", v7);

    v5 = v7;
  }

}

- (void)itemCollectionView:(id)a3 didTapVideoForCollectionViewCell:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "indexPathForCell:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v5, "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionViewDidTapVideoAtIndexPath:", v7);

    v5 = v7;
  }

}

- (void)SUUICollectionViewWillLayoutSubviews:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  int64_t lastInterfaceOrientation;
  void *v9;
  _BOOL4 didInitialReload;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSNumber *v17;
  NSNumber *lastKnownWidth;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  UIView *splitsDividerView;
  UIView *v24;
  UIView *v25;
  __int128 v26;
  void *v27;
  SUUIStorePageSplitsDescription *splitsDescription;
  id v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  int ShouldReverseLayoutDirection;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v40;
  double MinX;
  double MinY;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v52;
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t v56;
  CGRect *v57;
  uint64_t v58;
  const char *v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];

  v4 = a3;
  -[SUUIStorePageSectionsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[SUUIStorePageSectionsViewController _setPageSize:](self, "_setPageSize:", v6, v7);

  lastInterfaceOrientation = self->_lastInterfaceOrientation;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (lastInterfaceOrientation == objc_msgSend(v9, "statusBarOrientation"))
  {
    didInitialReload = self->_didInitialReload;

    if (didInitialReload)
    {
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x24BDAC760];
      v62[1] = 3221225472;
      v62[2] = __76__SUUIStorePageSectionsViewController_SUUICollectionViewWillLayoutSubviews___block_invoke;
      v62[3] = &unk_2511F47C0;
      v62[4] = self;
      objc_msgSend(v11, "_performBlockAfterCATransactionCommits:", v62);

      goto LABEL_6;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_lastInterfaceOrientation = objc_msgSend(v12, "statusBarOrientation");

  self->_didInitialReload = 1;
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[SUUIStorePageSectionsViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  *(float *)&v16 = v15;
  objc_msgSend(v13, "numberWithFloat:", v16);
  v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  lastKnownWidth = self->_lastKnownWidth;
  self->_lastKnownWidth = v17;

  -[SUUICollectionView reloadData](self->_collectionView, "reloadData");
  -[SUUIStorePageSectionsViewController _reloadCollectionView](self, "_reloadCollectionView");
  -[SUUIStorePageSectionsViewController _scrollFirstAppearanceSectionToView](self, "_scrollFirstAppearanceSectionToView");
LABEL_6:
  if (SUUICollectionViewWillLayoutSubviews__sLayoutRespondsToFrame == 255)
    SUUICollectionViewWillLayoutSubviews__sLayoutRespondsToFrame = objc_msgSend(MEMORY[0x24BEBD498], "instancesRespondToSelector:", sel__frame);
  -[SUUIStorePageSplitsDescription leftSplit](self->_splitsDescription, "leftSplit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19
    && (-[SUUIStorePageSplitsDescription rightSplit](self->_splitsDescription, "rightSplit"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v20)
    && (objc_msgSend(v19, "dividerColor"), (v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v22 = (void *)v21;
    if (SUUICollectionViewWillLayoutSubviews__sLayoutRespondsToFrame)
    {
      splitsDividerView = self->_splitsDividerView;
      if (!splitsDividerView)
      {
        v24 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
        v25 = self->_splitsDividerView;
        self->_splitsDividerView = v24;

        objc_msgSend(v4, "addSubview:", self->_splitsDividerView);
        splitsDividerView = self->_splitsDividerView;
      }
      -[UIView setBackgroundColor:](splitsDividerView, "setBackgroundColor:", v22);
      v56 = 0;
      v57 = (CGRect *)&v56;
      v58 = 0x4010000000;
      v59 = "";
      v26 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
      v60 = *MEMORY[0x24BDBF090];
      v61 = v26;
      -[SUUIStorePageSectionsViewController _collectionViewSublayouts](self, "_collectionViewSublayouts");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      splitsDescription = self->_splitsDescription;
      v49 = MEMORY[0x24BDAC760];
      v50 = 3221225472;
      v51 = __76__SUUIStorePageSectionsViewController_SUUICollectionViewWillLayoutSubviews___block_invoke_2;
      v52 = &unk_2511F5CF8;
      v53 = v19;
      v29 = v27;
      v54 = v29;
      v55 = &v56;
      -[SUUIStorePageSplitsDescription enumerateSplitsUsingBlock:](splitsDescription, "enumerateSplitsUsingBlock:", &v49);
      objc_msgSend(v4, "frame", v49, v50, v51, v52);
      v31 = v30;
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "scale");
      v34 = v33;

      ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
      x = v57[1].origin.x;
      y = v57[1].origin.y;
      width = v57[1].size.width;
      height = v57[1].size.height;
      v40 = 1.0 / v34;
      if (ShouldReverseLayoutDirection)
        MinX = CGRectGetMinX(*(CGRect *)&x);
      else
        MinX = CGRectGetMaxX(*(CGRect *)&x) - v40;
      MinY = CGRectGetMinY(v57[1]);
      objc_msgSend(v4, "contentOffset");
      v44 = v43;
      objc_msgSend(v4, "contentInset");
      v46 = v44 + v45;
      v47 = v57[1].origin.y;
      if (v47 <= 0.00000011920929)
      {
        v48 = v46;
      }
      else
      {
        v48 = 0.0;
        if (v46 >= v47)
          v48 = v46 - v47;
      }
      -[UIView setFrame:](self->_splitsDividerView, "setFrame:", MinX, MinY + v48, v40, v31);
      -[UIView setHidden:](self->_splitsDividerView, "setHidden:", 0);

      _Block_object_dispose(&v56, 8);
    }
  }
  else
  {
    -[UIView setHidden:](self->_splitsDividerView, "setHidden:", 1);
    v22 = 0;
  }

}

uint64_t __76__SUUIStorePageSectionsViewController_SUUICollectionViewWillLayoutSubviews___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateIfLastKnownWidthChanged");
}

void __76__SUUIStorePageSectionsViewController_SUUICollectionViewWillLayoutSubviews___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (*(_QWORD *)(a1 + 32) == a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_frame");
    v6 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
    v6[4] = v7;
    v6[5] = v8;
    v6[6] = v9;
    v6[7] = v10;
    *a4 = 1;

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SUUIResourceLoader isIdle](self->_resourceLoader, "isIdle"))
    -[SUUIStorePageSectionsViewController _prefetchArtworkForVisibleSections](self, "_prefetchArtworkForVisibleSections");
  if ((objc_msgSend(v4, "isDragging") & 1) == 0
    && (objc_msgSend(v4, "isTracking") & 1) == 0
    && (objc_msgSend(v4, "isDecelerating") & 1) == 0)
  {
    -[SUUIStackedBar animateToFullSizeIfNecessary](self->_stackedBar, "animateToFullSizeIfNecessary");
  }
  self->_scrollOffsetHasChanged = 1;

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    if (-[SUUIResourceLoader isIdle](self->_resourceLoader, "isIdle", a3))
      -[SUUIStorePageSectionsViewController _prefetchArtworkForVisibleSections](self, "_prefetchArtworkForVisibleSections");
    -[SUUIStackedBar animateToFullSizeIfNecessary](self->_stackedBar, "animateToFullSizeIfNecessary");
  }
  self->_scrollOffsetHasChanged = 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  id WeakRetained;
  SUUIStackedBar *stackedBar;
  double v7;
  id v8;

  v8 = a3;
  if (self->_indexPathOfEditedCell)
  {
    -[SUUICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isScrollingCellToHideActionButton") & 1) == 0)
      objc_msgSend(v4, "hideDeleteButton");

  }
  if (self->_delegateWantsDidScroll)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sectionsViewControllerDidScroll:", self);

  }
  if (self->_rendersWithParallax)
    SUUICollectionViewUpdatePerspectiveCells(self->_collectionView, 0);
  stackedBar = self->_stackedBar;
  objc_msgSend(v8, "contentOffset");
  -[SUUIStackedBar setOffset:](stackedBar, "setOffset:", v7);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  double y;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id WeakRetained;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  x = a5->x;
  y = a5->y;
  -[SUUICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:", a3, a5->x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "item");
  v10 = objc_msgSend(v8, "section");
  -[SUUICollectionView contentInset](self->_collectionView, "contentInset");
  v12 = v11;
  -[SUUICollectionView bounds](self->_collectionView, "bounds");
  v14 = y + v13;
  -[SUUICollectionView contentSize](self->_collectionView, "contentSize");
  if (v14 >= v15 - v12)
    v16 = v15 - v12;
  else
    v16 = v14;
  -[SUUICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:", x, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "item");
  v19 = objc_msgSend(v17, "section");
  v30 = v8;
  v20 = objc_msgSend(v8, "section");
  v21 = -[NSMutableArray count](self->_sections, "count") - 1;
  v22 = objc_msgSend(v17, "section");
  if (v21 >= v22)
    v23 = v22;
  else
    v23 = v21;
  if (v20 <= v23)
  {
    do
    {
      -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v10;
      v32 = v9;
      v33 = v19;
      v34 = v18;
      objc_msgSend(v24, "collectionViewWillScrollToOffset:visibleRange:", &v31, x, y);

      v25 = -[NSMutableArray count](self->_sections, "count") - 1;
      v26 = objc_msgSend(v17, "section");
      if (v25 >= v26)
        v27 = v26;
      else
        v27 = v25;
    }
    while (v20++ < v27);
  }
  if (self->_delegateWantsWillScrollToOffsetVisibleRange)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v31 = v10;
    v32 = v9;
    v33 = v19;
    v34 = v18;
    objc_msgSend(WeakRetained, "sectionsViewController:willScrollToOffset:visibleRange:", self, &v31, x, y);

  }
  self->_scrollOffsetHasChanged = 1;

}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  objc_msgSend(v7, "sourceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICollectionView convertPoint:fromView:](self->_collectionView, "convertPoint:fromView:", v8, x, y);
  -[SUUICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "section");
  if (v10 >= -[NSMutableArray count](self->_sections, "count"))
  {
    v12 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "previewingContext:viewControllerForLocation:", v7, x, y);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL IsDescendent;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  -[SUUIStorePageSectionsViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionsViewController parentViewController](self, "parentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    while (1)
    {
      objc_msgSend(v8, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewController clientContext](self, "clientContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "applicationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rootViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      IsDescendent = SUUIViewControllerIsDescendent(v9, v12);

      if (!IsDescendent)
      {

        goto LABEL_11;
      }
      if (v9)
        break;
      if (objc_msgSend(v8, "conformsToProtocol:", &unk_257264CC8))
      {
        objc_msgSend(v8, "overlayNavigationController");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
LABEL_8:
      objc_msgSend(v8, "parentViewController");
      v16 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v16;
      if (!v16)
        goto LABEL_11;
    }
    v14 = v9;
LABEL_7:
    v15 = v14;

    v7 = v15;
    goto LABEL_8;
  }
LABEL_11:
  v17 = v6;
  v18 = v17;
  if (objc_msgSend(v17, "conformsToProtocol:", &unk_25721CA08))
  {
    objc_msgSend(v17, "previewCommitViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v17, "prepareForCommit");
  }
  objc_msgSend(v7, "pushViewController:animated:", v18, 1);

}

- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  id v22;

  y = a4.y;
  x = a4.x;
  v22 = a3;
  v9 = a5;
  -[SUUIStorePageSectionsViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:fromView:", v9, x, y);
  v12 = v11;
  v14 = v13;

  -[SUUIStorePageSectionsViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "indexPathForItemAtPoint:", v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSectionsViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cellForItemAtIndexPath:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "presentationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSourceView:", v18);
  objc_msgSend(v18, "bounds");
  objc_msgSend(v19, "setSourceRect:");
  v20 = objc_msgSend(v16, "section");
  if (v20 < -[NSMutableArray count](self->_sections, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "willPresentPreviewViewController:forLocation:inSourceView:", v22, v9, x, y);

  }
}

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)a1);
  +[SUUIStateRestorationContext sharedContext](SUUIStateRestorationContext, "sharedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientContext:", v6);

  return v4;
}

- (void)_beginIgnoringSectionChanges
{
  ++self->_ignoreSectionsChangeCount;
}

- (void)_endIgnoringSectionChanges
{
  int64_t ignoreSectionsChangeCount;
  BOOL v3;
  BOOL v4;
  int64_t v5;
  id deferredSplitsDescription;
  id v8;

  ignoreSectionsChangeCount = self->_ignoreSectionsChangeCount;
  v3 = ignoreSectionsChangeCount == 1;
  v4 = ignoreSectionsChangeCount < 1;
  v5 = ignoreSectionsChangeCount - 1;
  if (!v4)
  {
    self->_ignoreSectionsChangeCount = v5;
    if (v3)
    {
      if (self->_deferredSplitsDescription)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v8 = self->_deferredSplitsDescription;
        else
          v8 = 0;
        deferredSplitsDescription = self->_deferredSplitsDescription;
        self->_deferredSplitsDescription = 0;

        -[SUUIStorePageSectionsViewController setSectionsWithSplitsDescription:](self, "setSectionsWithSplitsDescription:", v8);
      }
    }
  }
}

- (void)_insertSectionsWithComponents:(id)a3 afterSection:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_sections, "indexOfObjectIdenticalTo:", a4);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7;
    -[SUUIStorePageSectionsViewController _splitForSectionIndex:](self, "_splitForSectionIndex:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sectionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = v8 + 1;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v10);
          -[SUUIStorePageSectionsViewController defaultSectionForComponent:](self, "defaultSectionForComponent:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "setSectionIndex:", v14);
            objc_msgSend(v18, "_setContext:", v9);
            objc_msgSend(v18, "willAppearInContext:", v9);
            -[NSMutableArray insertObject:atIndex:](self->_sections, "insertObject:atIndex:", v18, v14++);
            ++v13;
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    objc_msgSend(v20, "setNumberOfPageSections:", objc_msgSend(v20, "numberOfPageSections") + v13);
    -[SUUIStorePageSectionsViewController _textLayoutCache](self, "_textLayoutCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "commitLayoutRequests");

    -[SUUIStorePageSectionsViewController _updateSectionsAfterMenuChange](self, "_updateSectionsAfterMenuChange");
    v6 = v21;
  }

}

- (void)_pageSectionDidDismissOverlayController:(id)a3
{
  SUUIProductPageOverlayController **p_activeOverlayController;
  id WeakRetained;
  id v7;
  id v8;
  char v9;
  id v10;

  p_activeOverlayController = &self->_activeOverlayController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeOverlayController);
  v7 = a3;

  if (WeakRetained == v7)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "sectionsViewControllerDidDismissOverlayController:", self);

    }
    objc_storeWeak((id *)p_activeOverlayController, 0);
  }
}

- (void)_setActiveProductPageOverlayController:(id)a3
{
  id v4;

  v4 = a3;
  objc_storeWeak((id *)&self->_activeOverlayController, v4);

}

- (void)_setRendersWithPerspective:(BOOL)a3
{
  id v4;

  if (self->_rendersWithPerspective != a3)
  {
    self->_rendersWithPerspective = a3;
    -[SUUICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRendersWithPerspective:", self->_rendersWithPerspective);
    -[SUUICollectionView setClipsToBounds:](self->_collectionView, "setClipsToBounds:", !self->_rendersWithPerspective);
    if (self->_rendersWithPerspective)
      SUUICollectionViewUpdatePerspectiveCells(self->_collectionView, 0);

  }
}

- (void)_setRendersWithParallax:(BOOL)a3
{
  if (self->_rendersWithParallax != a3)
    self->_rendersWithParallax = a3;
}

- (void)_setSelectedIndex:(int64_t)a3 forMenuSection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(v6, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionsViewController _menuContextForMenuComponent:](self, "_menuContextForMenuComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "selectedIndex");
  if (v9 != a3)
  {
    objc_msgSend(v7, "childComponentsForIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v10, "count");

    v22 = v6;
    v19 = objc_msgSend(v6, "sectionIndex");
    -[SUUIStorePageSectionsViewController _splitForSectionIndex:](self, "_splitForSectionIndex:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sectionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageSectionsViewController _childSectionsForMenuComponent:selectedIndex:](self, "_childSectionsForMenuComponent:selectedIndex:", v7, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v17, "_setContext:", v11);
          objc_msgSend(v17, "willAppearInContext:", v11);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }
    -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](self->_sections, "replaceObjectsInRange:withObjectsFromArray:", v19 + 1, v20, v12);
    objc_msgSend(v8, "setSelectedIndex:", a3);
    objc_msgSend(v21, "setNumberOfPageSections:", objc_msgSend(v21, "numberOfPageSections") - v20 + objc_msgSend(v12, "count"));
    -[SUUIStorePageSectionsViewController _textLayoutCache](self, "_textLayoutCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "commitLayoutRequests");

    -[SUUIStorePageSectionsViewController _updateSectionsAfterMenuChange](self, "_updateSectionsAfterMenuChange");
    v6 = v22;
  }

}

- (void)_updateSectionsForIndex:(int64_t)a3 menuSection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(v6, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionsViewController _menuContextForMenuComponent:](self, "_menuContextForMenuComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "selectedIndex") == a3)
  {
    objc_msgSend(v8, "sectionsForIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
    {
      -[SUUIStorePageSectionsViewController _splitForSectionIndex:](self, "_splitForSectionIndex:", objc_msgSend(v6, "sectionIndex"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sectionContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStorePageSectionsViewController _childSectionsForMenuComponent:selectedIndex:](self, "_childSectionsForMenuComponent:selectedIndex:", v7, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v17, "_setContext:", v11);
            objc_msgSend(v17, "willAppearInContext:", v11);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v14);
      }
      -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](self->_sections, "replaceObjectsInRange:withObjectsFromArray:", objc_msgSend(v6, "sectionIndex") + 1, 0, v12);
      objc_msgSend(v19, "setNumberOfPageSections:", objc_msgSend(v12, "count") + objc_msgSend(v19, "numberOfPageSections"));
      -[SUUIStorePageSectionsViewController _textLayoutCache](self, "_textLayoutCache");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "commitLayoutRequests");

      -[SUUIStorePageSectionsViewController _updateSectionsAfterMenuChange](self, "_updateSectionsAfterMenuChange");
    }
  }

}

- (id)_visibleMetricsImpressionsString
{
  SUUIMetricsImpressionSession *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(SUUIMetricsImpressionSession);
  -[SUUICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v9, "section"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addImpressionsForIndexPath:toSession:", v9, v3);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  -[SUUIMetricsImpressionSession impressionsString](v3, "impressionsString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_impressionableViewElements
{
  SUUIMetricsImpressionSession *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(SUUIMetricsImpressionSession);
  -[SUUICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v9, "section"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addImpressionsForIndexPath:toSession:", v9, v3);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  -[SUUIMetricsImpressionSession impressionableViewElements](v3, "impressionableViewElements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_handleTap:(id)a3
{
  id v3;

  if (self->_indexPathOfEditedCell)
  {
    -[SUUICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isScrollingCellToHideActionButton") & 1) == 0)
      objc_msgSend(v3, "hideDeleteButton");

  }
}

- (void)_entityProviderDidInvalidateNotification:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  SUUIStorePageSectionsViewController *v12;

  v4 = a3;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __80__SUUIStorePageSectionsViewController__entityProviderDidInvalidateNotification___block_invoke;
  v10 = &unk_2511F46D0;
  v5 = v4;
  v11 = v5;
  v12 = self;
  v6 = (void (**)(_QWORD))_Block_copy(&v7);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", v7, v8, v9, v10))
    v6[2](v6);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __80__SUUIStorePageSectionsViewController__entityProviderDidInvalidateNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v2;
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1136), "objectForKey:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE51860]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(MEMORY[0x24BEBDB00], "areAnimationsEnabled");
    objc_msgSend(MEMORY[0x24BEBDB00], "setAnimationsEnabled:", 0);
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 1056);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __80__SUUIStorePageSectionsViewController__entityProviderDidInvalidateNotification___block_invoke_2;
    v10[3] = &unk_2511F5D20;
    v11 = v3;
    v12 = v9;
    v13 = v5;
    v14 = *(_QWORD *)(a1 + 40);
    v8 = v5;
    objc_msgSend(v7, "performBatchUpdates:completion:", v10, 0);
    objc_msgSend(MEMORY[0x24BEBDB00], "setAnimationsEnabled:", v6);

  }
}

void __80__SUUIStorePageSectionsViewController__entityProviderDidInvalidateNotification___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "entityProvider:didInvalidateWithContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 56), "_textLayoutCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commitLayoutRequests");

}

- (void)_applyColorScheme:(id)a3 toIndexBarControl:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = a3;
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v9, "setBackgroundColor:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v7);

  }
  objc_msgSend(v5, "primaryTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTintColor:", v8);
}

- (void)_beginActiveImpressionsForImpressionableViewElements
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[SUUIStorePageSectionsViewController _impressionableViewElements](self, "_impressionableViewElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[SUUIStorePageSectionsViewController activeMetricsImpressionSession](self, "activeMetricsImpressionSession");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "beginActiveImpressionForViewElement:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)_childSectionsForMenuComponent:(id)a3 selectedIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SUUIStorePageSectionsViewController _menuContextForMenuComponent:](self, "_menuContextForMenuComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionsForIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "childComponentsForIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
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
          -[SUUIStorePageSectionsViewController defaultSectionForComponent:](self, "defaultSectionForComponent:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }
    objc_msgSend(v7, "setSections:forIndex:", v9, a4);

  }
  return v9;
}

- (id)_collectionViewSublayouts
{
  void *v2;
  void *v3;

  -[SUUICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "sublayouts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_createSectionsForExpandPageComponent:(id)a3 context:(id)a4 newSections:(id)a5 sectionCount:(int64_t)a6 sectionsByViewElement:(id)a7 updateStyle:(int64_t)a8
{
  id v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  NSMutableIndexSet *expandInsertSections;
  NSMutableIndexSet *v45;
  NSMutableIndexSet *v46;
  int v47;
  SUUIStorePageSectionsViewController *v48;
  uint64_t v49;
  NSMutableIndexSet *expandRemoveSections;
  NSMutableIndexSet *v51;
  NSMutableIndexSet *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v57;
  id v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  SUUIStorePageSectionsViewController *v68;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v65 = a4;
  v66 = a5;
  v13 = a7;
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 5;
  do
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v16);

    --v15;
  }
  while (v15);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "replaceObjectAtIndex:withObject:", 0, v17);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "replaceObjectAtIndex:withObject:", 1, v18);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v14;
  objc_msgSend(v14, "replaceObjectAtIndex:withObject:", 4, v19);

  objc_msgSend(v12, "viewElement");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  objc_msgSend(v20, "persistenceKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "flattenedChildren");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
  if (v63)
  {
    v23 = 0;
    v62 = *(_QWORD *)v75;
    v68 = self;
    v58 = v13;
    v59 = v12;
    v57 = v20;
    do
    {
      for (i = 0; i != v63; ++i)
      {
        if (*(_QWORD *)v75 != v62)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "persistenceKey");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(v13, "objectForKey:", v25);
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = (id)v26;
            v64 = i;
            v28 = -[NSMutableArray count](self->_sections, "count");
            objc_msgSend(v27, "setBottomSection:", 0);
            objc_msgSend(v27, "setSectionIndex:", v28);
            objc_msgSend(v27, "setTopSection:", a6 == 0);
            objc_msgSend(v12, "childComponentForIndex:", v23);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v27, "updateWithContext:pageComponent:", v65, v29);

            if (v30 == 2)
            {
              objc_msgSend(v60, "objectAtIndex:", 1);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v31, "integerValue") + 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v60;
              v34 = 1;
LABEL_35:
              objc_msgSend(v33, "replaceObjectAtIndex:withObject:", v34, v32);

            }
            else if (v30 == 1)
            {
              objc_msgSend(v60, "objectAtIndex:", 0);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v31, "integerValue") + 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v60;
              v34 = 0;
              goto LABEL_35;
            }
            self = v68;
            -[NSMutableArray addObject:](v68->_sections, "addObject:", v27);
            objc_msgSend(v13, "removeObjectForKey:", v25);
            ++a6;
LABEL_38:

            ++v23;
            i = v64;
            goto LABEL_39;
          }
        }
        v35 = -[NSMutableArray count](self->_sections, "count");
        if ((objc_msgSend(v20, "isOpen") & 1) != 0)
        {
          v64 = i;
          v61 = v23;
          objc_msgSend(v12, "childComponentForIndex:", v23);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -[SUUIStorePageSectionsViewController _newSectionsWithPageComponent:](self, "_newSectionsWithPageComponent:", v36);

          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          v27 = v37;
          v38 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
          if (v38)
          {
            v39 = v38;
            v40 = v20;
            v41 = *(_QWORD *)v71;
            do
            {
              for (j = 0; j != v39; ++j)
              {
                if (*(_QWORD *)v71 != v41)
                  objc_enumerationMutation(v27);
                v43 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
                objc_msgSend(v43, "setBottomSection:", 0);
                objc_msgSend(v43, "setSectionIndex:", v35 + j);
                objc_msgSend(v43, "setTopSection:", a6 + j == 0);
                if (a8 == 1)
                {
                  objc_msgSend(v43, "_setContext:", v65);
                  objc_msgSend(v43, "willAppearInContext:", v65);
                  objc_msgSend(v66, "addObject:", v43);
                  self = v68;
                  -[NSMutableArray addObject:](v68->_sections, "addObject:", v43);
                  if (objc_msgSend(v40, "isOpen") && (objc_msgSend(v40, "previousIsOpen") & 1) == 0)
                  {
                    expandInsertSections = v68->_expandInsertSections;
                    if (!expandInsertSections)
                    {
                      v45 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
                      v46 = v68->_expandInsertSections;
                      v68->_expandInsertSections = v45;

                      expandInsertSections = v68->_expandInsertSections;
                    }
                    -[NSMutableIndexSet addIndex:](expandInsertSections, "addIndex:", v35 + j);
                  }
                }
                else
                {
                  objc_msgSend(v66, "addObject:", v43);
                  self = v68;
                  -[NSMutableArray addObject:](v68->_sections, "addObject:", v43);
                }
              }
              v39 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
              v35 += j;
              a6 += j;
            }
            while (v39);

            v13 = v58;
            v12 = v59;
            v20 = v40;
            v23 = v61;
          }
          else
          {

            v23 = v61;
          }
          goto LABEL_38;
        }
        v47 = objc_msgSend(v20, "previousIsOpen");
        if (a8 == 1 && v47)
        {
          v48 = self;
          v49 = i;
          expandRemoveSections = v48->_expandRemoveSections;
          if (!expandRemoveSections)
          {
            v51 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
            v52 = v68->_expandRemoveSections;
            v68->_expandRemoveSections = v51;

            expandRemoveSections = v68->_expandRemoveSections;
          }
          -[NSMutableIndexSet addIndex:](expandRemoveSections, "addIndex:", -[NSMutableIndexSet count](expandRemoveSections, "count") + v35);
          i = v49;
          v20 = v57;
          self = v68;
        }
LABEL_39:

      }
      v63 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    }
    while (v63);
  }

  if ((objc_msgSend(v20, "isOpen") & 1) == 0 && (objc_msgSend(v20, "previousIsOpen") & 1) != 0)
  {
    v53 = 0;
    v54 = v60;
LABEL_47:
    objc_msgSend(v20, "setPreviousIsOpen:", v53);
    goto LABEL_48;
  }
  v54 = v60;
  if (objc_msgSend(v20, "isOpen") && (objc_msgSend(v20, "previousIsOpen") & 1) == 0)
  {
    v53 = 1;
    goto LABEL_47;
  }
LABEL_48:
  objc_msgSend(v54, "replaceObjectAtIndex:withObject:", 2, v13);
  objc_msgSend(v54, "replaceObjectAtIndex:withObject:", 3, v66);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "replaceObjectAtIndex:withObject:", 4, v55);

  return v54;
}

- (id)_currentBackdropGroupName
{
  void *v2;
  void *v3;
  void *v4;

  -[SUUIStorePageSectionsViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "_backdropGroupName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_backdropViewLayerGroupName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_defaultSectionForGridComponent:(id)a3
{
  id v3;
  unint64_t v4;
  __objc2_class *v5;
  void *v6;
  void *v8;
  int v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "gridType");
  if (v4 > 6)
  {
    v6 = 0;
  }
  else
  {
    if (((1 << v4) & 0x3B) != 0)
    {
      v5 = SUUIGridPageSection;
    }
    else if (v4 == 2)
    {
      v5 = SUUIBrickGridPageSection;
    }
    else
    {
      v5 = (__objc2_class *)objc_opt_class();
      objc_msgSend(v3, "viewElement");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isDynamicContainer");

      if (v9)
        v5 = (__objc2_class *)objc_opt_class();
    }
    v6 = (void *)objc_msgSend([v5 alloc], "initWithPageComponent:", v3);
  }

  return v6;
}

- (id)_defaultSectionForSwooshComponent:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "swooshType");
  if (v4 > 2)
    v5 = 0;
  else
    v5 = (void *)objc_msgSend(objc_alloc(*off_2511F5E98[v4]), "initWithPageComponent:", v3);

  return v5;
}

- (void)_deselectCellsForAppearance:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  -[SUUICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[SUUICollectionView deselectItemAtIndexPath:animated:](self->_collectionView, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9++), v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_sections;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "deselectItemsAnimated:", v3, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)_endAllPendingActiveImpression
{
  id v2;

  -[SUUIStorePageSectionsViewController activeMetricsImpressionSession](self, "activeMetricsImpressionSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endAllPendingActiveImpression");

}

- (void)_enumerateSectionContextsUsingBlock:(id)a3
{
  id v4;
  SUUIStorePageSplitsDescription *splitsDescription;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  splitsDescription = self->_splitsDescription;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__SUUIStorePageSectionsViewController__enumerateSectionContextsUsingBlock___block_invoke;
  v7[3] = &unk_2511F5D48;
  v8 = v4;
  v6 = v4;
  -[SUUIStorePageSplitsDescription enumerateSplitsUsingBlock:](splitsDescription, "enumerateSplitsUsingBlock:", v7);

}

void __75__SUUIStorePageSectionsViewController__enumerateSectionContextsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "sectionContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v6 + 16))(v6, v7, a3, a4);

}

- (void)_enumerateVisibleSectionsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11++), "section"));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__SUUIStorePageSectionsViewController__enumerateVisibleSectionsUsingBlock___block_invoke;
  v13[3] = &unk_2511F5D70;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v13);

}

void __75__SUUIStorePageSectionsViewController__enumerateVisibleSectionsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "objectAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_invalidateIfLastKnownWidthChanged
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  double v9;
  NSNumber *v10;
  NSNumber *lastKnownWidth;

  if (self->_lastKnownWidth)
  {
    -[SUUIStorePageSectionsViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    -[NSNumber floatValue](self->_lastKnownWidth, "floatValue");
    v9 = floorf(v8);
    if (floor(v5) != v9)
      -[SUUIStorePageSectionsViewController _invalidateLayoutWithNewSize:transitionCoordinator:](self, "_invalidateLayoutWithNewSize:transitionCoordinator:", 0, v5, v7);
    *(float *)&v9 = v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    lastKnownWidth = self->_lastKnownWidth;
    self->_lastKnownWidth = v10;

  }
}

- (void)_invalidateLayoutWithNewSize:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  height = a3.height;
  width = a3.width;
  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[SUUIStorePageSectionsViewController _setPageSize:](self, "_setPageSize:", width, height);
  -[SUUIStorePageSectionsViewController _collectionViewSublayouts](self, "_collectionViewSublayouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "invalidateLayout");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v10);
  }
  -[SUUICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invalidateLayout");

  v14 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = self->_sections;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        v21 = objc_msgSend(v20, "numberOfCells");
        objc_msgSend(v20, "willTransitionToSize:withTransitionCoordinator:", v7, width, height);
        if (v21 != objc_msgSend(v20, "numberOfCells"))
          objc_msgSend(v14, "addIndex:", objc_msgSend(v20, "sectionIndex"));
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v17);
  }

  -[SUUIStorePageSectionsViewController _textLayoutCache](self, "_textLayoutCache");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commitLayoutRequests");

  if (objc_msgSend(v14, "count"))
  {
    v23 = (void *)MEMORY[0x24BEBDB00];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __90__SUUIStorePageSectionsViewController__invalidateLayoutWithNewSize_transitionCoordinator___block_invoke;
    v34[3] = &unk_2511F46D0;
    v34[4] = self;
    v35 = v14;
    objc_msgSend(v23, "performWithoutAnimation:", v34);

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v24 = self->_sections;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v31 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * k);
        if ((objc_msgSend(v14, "containsIndex:", objc_msgSend(v29, "sectionIndex")) & 1) == 0)
          objc_msgSend(v29, "reloadVisibleCellsWithReason:", 0);
      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    }
    while (v26);
  }

}

uint64_t __90__SUUIStorePageSectionsViewController__invalidateLayoutWithNewSize_transitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "reloadSections:", *(_QWORD *)(a1 + 40));
}

- (id)_expandContextForMenuComponent:(id)a3
{
  id v4;
  SUUIExpandPageSectionContext *v5;
  NSMapTable *v6;
  NSMapTable *expandSectionContexts;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_expandSectionContexts, "objectForKey:", v4);
  v5 = (SUUIExpandPageSectionContext *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (!self->_expandSectionContexts)
    {
      v6 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
      expandSectionContexts = self->_expandSectionContexts;
      self->_expandSectionContexts = v6;

    }
    v5 = objc_alloc_init(SUUIExpandPageSectionContext);
    -[NSMapTable setObject:forKey:](self->_expandSectionContexts, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)_menuContextForMenuComponent:(id)a3
{
  id v4;
  SUUIMenuPageSectionContext *v5;
  NSMapTable *v6;
  NSMapTable *menuSectionContexts;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_menuSectionContexts, "objectForKey:", v4);
  v5 = (SUUIMenuPageSectionContext *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (!self->_menuSectionContexts)
    {
      v6 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
      menuSectionContexts = self->_menuSectionContexts;
      self->_menuSectionContexts = v6;

    }
    v5 = objc_alloc_init(SUUIMenuPageSectionContext);
    -[SUUIMenuPageSectionContext setSelectedIndex:](v5, "setSelectedIndex:", objc_msgSend(v4, "defaultSelectedIndex"));
    -[NSMapTable setObject:forKey:](self->_menuSectionContexts, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)_newSectionContext
{
  SUUIStorePageSectionContext *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v3 = objc_alloc_init(SUUIStorePageSectionContext);
  -[SUUIStorePageSectionContext _setCollectionView:](v3, "_setCollectionView:", self->_collectionView);
  -[SUUIStorePageSectionContext _setColorScheme:](v3, "_setColorScheme:", self->_colorScheme);
  -[SUUIStorePageSectionContext _setDefaultPinningTransitionStyle:](v3, "_setDefaultPinningTransitionStyle:", self->_pinningTransitionStyle);
  -[SUUIStorePageSectionContext _setLayoutStyle:](v3, "_setLayoutStyle:", self->_layoutStyle);
  -[SUUIStorePageSectionContext _setMetricsController:](v3, "_setMetricsController:", self->_metricsController);
  -[SUUIStorePageSectionContext _setParentViewController:](v3, "_setParentViewController:", self);
  -[SUUIStorePageSectionsViewController resourceLoader](self, "resourceLoader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionContext _setResourceLoader:](v3, "_setResourceLoader:", v4);

  -[SUUIStorePageSectionsViewController _textLayoutCache](self, "_textLayoutCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionContext _setTextLayoutCache:](v3, "_setTextLayoutCache:", v5);

  -[SUUIStorePageSectionContext _setActiveMetricsImpressionSession:](v3, "_setActiveMetricsImpressionSession:", self->_activeMetricsImpressionSession);
  if (-[SUUIStorePageSectionsViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SUUIStorePageSectionsViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;

    -[SUUICollectionView indexBarControl](self->_collectionView, "indexBarControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SUUICollectionView indexBarControl](self->_collectionView, "indexBarControl");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sizeThatFits:", v8, v10);
      v14 = v13;

      v8 = v8 - v14;
    }
    -[SUUIStorePageSectionContext _setActivePageWidth:](v3, "_setActivePageWidth:", v8);
    -[SUUIStorePageSectionContext _setLandscapePageWidth:](v3, "_setLandscapePageWidth:", v10);
    -[SUUIStorePageSectionContext _setPortraitPageWidth:](v3, "_setPortraitPageWidth:", v8);
  }
  return v3;
}

- (id)_newSectionsWithPageComponent:(id)a3
{
  id v4;
  id v5;
  id v6;
  SUUIMenuPageSection *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v4, "componentType") == 11)
  {
    v6 = v4;
    v7 = -[SUUIMenuPageSection initWithPageComponent:]([SUUIMenuPageSection alloc], "initWithPageComponent:", v6);
    objc_msgSend(v5, "addObject:", v7);
    -[SUUIStorePageSectionsViewController _childSectionsForMenuComponent:selectedIndex:](self, "_childSectionsForMenuComponent:selectedIndex:", v6, objc_msgSend(v6, "defaultSelectedIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v5, "addObjectsFromArray:", v8);

  }
  else
  {
    -[SUUIStorePageSectionsViewController defaultSectionForComponent:](self, "defaultSectionForComponent:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);
  }

  return v5;
}

- (id)_newSectionsWithPageComponents:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = -[SUUIStorePageSectionsViewController _newSectionsWithPageComponent:](self, "_newSectionsWithPageComponent:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_newStorePageCollectionViewLayout
{
  SUUIStorePageCollectionViewLayout *v3;
  void *v4;

  v3 = objc_alloc_init(SUUIStorePageCollectionViewLayout);
  -[SUUIStorePageSectionsViewController _currentBackdropGroupName](self, "_currentBackdropGroupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageCollectionViewLayout setBackdropGroupName:](v3, "setBackdropGroupName:", v4);

  -[SUUIStorePageCollectionViewLayout setRendersWithPerspective:](v3, "setRendersWithPerspective:", self->_rendersWithPerspective);
  -[SUUIStorePageCollectionViewLayout setRendersWithParallax:](v3, "setRendersWithParallax:", self->_rendersWithParallax);
  return v3;
}

- (void)_prefetchArtworkForVisibleSections
{
  -[SUUIStorePageSectionsViewController _enumerateVisibleSectionsUsingBlock:](self, "_enumerateVisibleSectionsUsingBlock:", &__block_literal_global_174);
}

uint64_t __73__SUUIStorePageSectionsViewController__prefetchArtworkForVisibleSections__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prefetchResourcesWithReason:", -1);
}

- (id)_prepareLayoutForSections
{
  void *v3;
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  SUUIStorePageSplitCollectionViewLayout *v10;
  SUUIStorePageSplitsDescription *splitsDescription;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[4];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[SUUIStorePageSplitsDescription numberOfSplits](self->_splitsDescription, "numberOfSplits") > 1)
  {
    v4 = -[SUUIStorePageSectionsViewController _newSectionContext](self, "_newSectionContext");
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    splitsDescription = self->_splitsDescription;
    objc_msgSend(v4, "activePageWidth");
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __64__SUUIStorePageSectionsViewController__prepareLayoutForSections__block_invoke;
    v14[3] = &unk_2511F5DD8;
    v14[4] = self;
    v14[5] = v15;
    -[SUUIStorePageSplitsDescription sizeSplitsToFitWidth:usingBlock:](splitsDescription, "sizeSplitsToFitWidth:usingBlock:", v14);
    v10 = objc_alloc_init(SUUIStorePageSplitCollectionViewLayout);
    -[SUUIStorePageSectionsViewController _currentBackdropGroupName](self, "_currentBackdropGroupName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageSplitCollectionViewLayout setBackdropGroupName:](v10, "setBackdropGroupName:", v12);

    -[SUUIStorePageSplitCollectionViewLayout setRendersWithPerspective:](v10, "setRendersWithPerspective:", self->_rendersWithPerspective);
    -[SUUIStorePageSplitCollectionViewLayout addSublayoutsUsingSplitsDescription:](v10, "addSublayoutsUsingSplitsDescription:", self->_splitsDescription);
    _Block_object_dispose(v15, 8);
  }
  else
  {
    -[SUUIStorePageSplitsDescription firstSplit](self->_splitsDescription, "firstSplit");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sectionContext");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_sections;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v9, "_setContext:", v4);
          objc_msgSend(v9, "willAppearInContext:", v4);
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

    v10 = -[SUUIStorePageSectionsViewController _newStorePageCollectionViewLayout](self, "_newStorePageCollectionViewLayout");
  }

  return v10;
}

void __64__SUUIStorePageSectionsViewController__prepareLayoutForSections__block_invoke(uint64_t a1, void *a2, double a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "sectionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setActivePageWidth:", a3);
  v6 = objc_msgSend(v12, "numberOfPageSections");
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(_QWORD *)(v8 + 24);
  if (v6 < 1)
  {
    v11 = v9 + v6;
  }
  else
  {
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setContext:", v5);
      objc_msgSend(v10, "willAppearInContext:", v5);

      ++v9;
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(_QWORD *)(v8 + 24) + v7;
    }
    while (v9 < v11);
  }
  *(_QWORD *)(v8 + 24) = v11;

}

- (void)_registerForNotificationsForEntityProvider:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__entityProviderDidInvalidateNotification_, *MEMORY[0x24BE51858], v5);

  }
}

- (void)_reloadCollectionView
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  UIEdgeInsets *p_contentInsetAdjustments;
  double top;
  void *v15;
  CGFloat v16;
  SUUIStorePageSectionsViewController *v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  CGFloat v24;
  double v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  _QWORD block[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;

  v44 = *MEMORY[0x24BDAC8D0];
  -[SUUIStorePageSectionsViewController _prepareLayoutForSections](self, "_prepareLayoutForSections");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICollectionView setCollectionViewLayout:animated:](self->_collectionView, "setCollectionViewLayout:animated:");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v3 = self->_sections;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "fitsToHeight") & 1) != 0)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  -[SUUICollectionView setAlwaysBounceVertical:](self->_collectionView, "setAlwaysBounceVertical:", v8);
  -[SUUICollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:", v8);
  -[SUUIColorScheme backgroundColor](self->_colorScheme, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  -[SUUICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v12);
  if (-[NSMutableArray count](self->_sections, "count"))
  {
    p_contentInsetAdjustments = &self->_contentInsetAdjustments;
    top = self->_contentInsetAdjustments.top;
    -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentInsetAdjustmentForCollectionView:", self->_collectionView);
    self->_contentInsetAdjustments.top = v16;
    v17 = self;
    v18 = v17;
    while (!objc_msgSend(v18, "conformsToProtocol:", &unk_257201C40))
    {
      objc_msgSend(v18, "parentViewController");
      v19 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v19;
      if (!v19)
        goto LABEL_21;
    }
    v20 = objc_msgSend(v18, "prefersNavigationBarBackgroundViewHidden");

    if ((v20 & 1) != 0)
    {
      -[SUUIStorePageSectionsViewController navigationController](v17, "navigationController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "navigationBar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "frame");
      p_contentInsetAdjustments->top = p_contentInsetAdjustments->top - CGRectGetMaxY(v45);

    }
LABEL_21:
    if ((unint64_t)-[NSMutableArray count](self->_sections, "count") >= 2)
    {
      -[NSMutableArray lastObject](self->_sections, "lastObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contentInsetAdjustmentForCollectionView:", self->_collectionView);
      self->_contentInsetAdjustments.bottom = v24;

    }
    -[SUUICollectionView contentInset](self->_collectionView, "contentInset");
    -[SUUICollectionView setContentInset:](self->_collectionView, "setContentInset:", v25 + p_contentInsetAdjustments->top - top);

  }
  -[SUUIStorePageSectionsViewController _textLayoutCache](self, "_textLayoutCache");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commitLayoutRequests");

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = self->_sections;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "prefetchResourcesWithReason:", 0);
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v29);
  }

  -[SUUICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[SUUICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[SUUICollectionView reloadData](self->_collectionView, "reloadData");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SUUIStorePageSectionsViewController__reloadCollectionView__block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __60__SUUIStorePageSectionsViewController__reloadCollectionView__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 1296);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "didAppearInContext:", 0, (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_reloadRelevantEntityProviders
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  NSMapTable *v13;
  NSMapTable *entityProviderToRelevantSections;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  uint64_t v27;
  NSMapTable *v28;
  NSMapTable *v29;
  NSMutableArray *obj;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v3 = self->_entityProviderToRelevantSections;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v48 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (!v6)
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", -[NSMapTable count](self->_entityProviderToRelevantSections, "count"));
        objc_msgSend(v6, "addObject:", v9);
      }
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = self->_sections;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_msgSend(v11, "relevantEntityProviders");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {
          v34 = j;
          if (!self->_entityProviderToRelevantSections)
          {
            v13 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
            entityProviderToRelevantSections = self->_entityProviderToRelevantSections;
            self->_entityProviderToRelevantSections = v13;

          }
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v33 = v12;
          v15 = v12;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v40;
            do
            {
              for (k = 0; k != v17; ++k)
              {
                if (*(_QWORD *)v40 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k);
                objc_msgSend(v6, "removeObject:", v20);
                -[NSMapTable objectForKey:](self->_entityProviderToRelevantSections, "objectForKey:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v21)
                {
                  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
                  -[NSMapTable setObject:forKey:](self->_entityProviderToRelevantSections, "setObject:forKey:", v21, v20);
                  -[SUUIStorePageSectionsViewController _registerForNotificationsForEntityProvider:](self, "_registerForNotificationsForEntityProvider:", v20);
                }
                objc_msgSend(v21, "addObject:", v11);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
            }
            while (v17);
          }

          v12 = v33;
          j = v34;
        }

      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v32);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v22 = v6;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v36;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * m);
        -[SUUIStorePageSectionsViewController _unregisterForNotificationsForEntityProvider:](self, "_unregisterForNotificationsForEntityProvider:", v27);
        -[NSMapTable removeObjectForKey:](self->_entityProviderToRelevantSections, "removeObjectForKey:", v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    }
    while (v24);
  }

  v28 = self->_entityProviderToRelevantSections;
  if (v28 && !-[NSMapTable count](v28, "count"))
  {
    v29 = self->_entityProviderToRelevantSections;
    self->_entityProviderToRelevantSections = 0;

  }
}

- (void)_scrollFirstAppearanceSectionToView
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSMutableArray *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!self->_scrollOffsetHasChanged)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = self->_sections;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "firstAppearanceIndexPath", (_QWORD)v10);
          v8 = objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = (NSMutableArray *)v8;

            -[SUUICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](self->_collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v9, 2, 0);
            self->_scrollOffsetHasChanged = 1;
            v3 = v9;
            goto LABEL_12;
          }
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)_setPageSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  SUUIStorePageSplitsDescription *splitsDescription;
  id v12;
  _QWORD v13[4];
  id v14;

  height = a3.height;
  width = a3.width;
  -[SUUIStorePageSectionsViewController _collectionViewSublayouts](self, "_collectionViewSublayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICollectionView indexBarControl](self->_collectionView, "indexBarControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUUICollectionView indexBarControl](self->_collectionView, "indexBarControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeThatFits:", width, height);
    v10 = v9;

    width = width - v10;
  }
  splitsDescription = self->_splitsDescription;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__SUUIStorePageSectionsViewController__setPageSize___block_invoke;
  v13[3] = &unk_2511F5E00;
  v14 = v6;
  v12 = v6;
  -[SUUIStorePageSplitsDescription sizeSplitsToFitWidth:usingBlock:](splitsDescription, "sizeSplitsToFitWidth:usingBlock:", v13, width);

}

void __52__SUUIStorePageSectionsViewController__setPageSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  void *v7;
  id v8;

  objc_msgSend(a2, "sectionContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setActivePageWidth:", a4);
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activePageWidth");
  objc_msgSend(v7, "setOverrideContentWidth:");

}

- (id)_splitForSectionIndex:(int64_t)a3
{
  SUUIStorePageSplitsDescription *splitsDescription;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  _QWORD v13[4];

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__13;
  v11 = __Block_byref_object_dispose__13;
  v12 = 0;
  splitsDescription = self->_splitsDescription;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__SUUIStorePageSectionsViewController__splitForSectionIndex___block_invoke;
  v6[3] = &unk_2511F5E28;
  v6[4] = v13;
  v6[5] = &v7;
  -[SUUIStorePageSplitsDescription enumerateSplitsUsingBlock:](splitsDescription, "enumerateSplitsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
  return v4;
}

void __61__SUUIStorePageSectionsViewController__splitForSectionIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v7 = objc_msgSend(v12, "numberOfPageSections");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(_QWORD *)(v8 + 24);
  v10 = v9 < v7;
  v11 = v9 - v7;
  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
  else
  {
    *(_QWORD *)(v8 + 24) = v11;
  }

}

- (id)_textLayoutCache
{
  SUUILayoutCache *textLayoutCache;
  SUUILayoutCache *v4;
  SUUILayoutCache *v5;

  textLayoutCache = self->_textLayoutCache;
  if (!textLayoutCache)
  {
    v4 = objc_alloc_init(SUUILayoutCache);
    v5 = self->_textLayoutCache;
    self->_textLayoutCache = v4;

    -[SUUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", self);
    textLayoutCache = self->_textLayoutCache;
  }
  return textLayoutCache;
}

- (void)_unregisterForNotificationsForEntityProvider:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BE51858], v5);

  }
}

- (void)_updateCollectionViewWithUpdates:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  SUUICollectionView *collectionView;
  SUUIProductPageOverlayController *overlayController;
  void *v13;
  void *v14;
  NSIndexPath *indexPathOfEditedCell;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  SUUIStorePageSectionsViewController *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD aBlock[5];
  id v25;
  uint64_t v26;
  _QWORD v27[5];

  v4 = (*((uint64_t (**)(id, SEL))a3 + 2))(a3, a2);
  if (v4)
  {
    v5 = v4;
    -[SUUIStorePageSectionsViewController _textLayoutCache](self, "_textLayoutCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "commitLayoutRequests");

    -[SUUICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__SUUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_2;
    aBlock[3] = &unk_2511F5E50;
    v26 = v5;
    aBlock[4] = self;
    v9 = v7;
    v25 = v9;
    v10 = _Block_copy(aBlock);
    if (-[NSMutableIndexSet count](self->_expandInsertSections, "count")
      || -[NSMutableIndexSet count](self->_expandRemoveSections, "count"))
    {
      -[SUUIStorePageSectionsViewController _beginIgnoringSectionChanges](self, "_beginIgnoringSectionChanges");
      collectionView = self->_collectionView;
      v22[0] = v8;
      v22[1] = 3221225472;
      v22[2] = __72__SUUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_4;
      v22[3] = &unk_2511F46D0;
      v22[4] = self;
      v23 = v9;
      v16 = v8;
      v17 = 3221225472;
      v18 = __72__SUUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_5;
      v19 = &unk_2511F5E78;
      v20 = self;
      v21 = v10;
      -[SUUICollectionView performBatchUpdates:completion:](collectionView, "performBatchUpdates:completion:", v22, &v16);

    }
    else
    {
      (*((void (**)(void *, uint64_t))v10 + 2))(v10, 1);
    }

  }
  else if (self->_didInitialReload && self->_collectionView)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __72__SUUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke;
    v27[3] = &unk_2511F47C0;
    v27[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v27);
  }
  if (-[SUUIStorePageSectionsViewController isViewLoaded](self, "isViewLoaded", v16, v17, v18, v19))
  {
    overlayController = self->_overlayController;
    if (overlayController)
    {
      -[SUUIProductPageOverlayController view](overlayController, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "superview");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bringSubviewToFront:", v13);

    }
  }
  -[UITapGestureRecognizer setEnabled:](self->_collectionViewTapGestureRecognizer, "setEnabled:", 0);
  indexPathOfEditedCell = self->_indexPathOfEditedCell;
  self->_indexPathOfEditedCell = 0;

}

uint64_t __72__SUUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "reloadData");
  objc_msgSend(*(id *)(a1 + 32), "_reloadCollectionView");
  return objc_msgSend(*(id *)(a1 + 32), "_scrollFirstAppearanceSectionToView");
}

void __72__SUUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1[6];
  if (v1 == 1)
  {
    v7 = (void *)MEMORY[0x24BEBDB00];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __72__SUUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_3;
    v9[3] = &unk_2511F46D0;
    v8 = (void *)a1[5];
    v9[4] = a1[4];
    v10 = v8;
    objc_msgSend(v7, "performWithoutAnimation:", v9);

  }
  else if (v1 == 2)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v2 = *(id *)(a1[4] + 1296);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v12;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6++), "reloadVisibleCellsWithReason:", 1);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v4);
    }

  }
}

void __72__SUUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "collectionViewLayout");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "addSublayoutsUsingSplitsDescription:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1304));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "contentSize");
  v3 = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setUserInteractionEnabled:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "reloadData");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setUserInteractionEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 40), "indexPathsForPinningItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "collectionViewContentSize");
    if (v5 < v3)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "reloadItemsAtIndexPaths:", v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "_scrollFirstAppearanceSectionToView");

}

void __72__SUUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setExpandChildPageSectionsIndexSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1152));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "insertSections:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1152));
  }
  else if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setExpandChildPageSectionsIndexSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "deleteSections:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160));
  }
  objc_msgSend(*(id *)(a1 + 40), "setExpandChildPageSectionsIndexSet:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1152);
  *(_QWORD *)(v2 + 1152) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1160);
  *(_QWORD *)(v4 + 1160) = 0;

}

uint64_t __72__SUUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_endIgnoringSectionChanges");
}

- (void)_updateSectionsAfterMenuChange
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = -[NSMutableArray count](self->_sections, "count");
  if (v3 < 1)
  {
    v6 = 1;
  }
  else
  {
    v4 = v3;
    v5 = 0;
    LOBYTE(v6) = 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSectionIndex:", v5);
      if ((v6 & 1) != 0)
        v6 = objc_msgSend(v7, "fitsToHeight") ^ 1;
      else
        v6 = 0;

      ++v5;
    }
    while (v4 != v5);
  }
  -[SUUICollectionView setAlwaysBounceVertical:](self->_collectionView, "setAlwaysBounceVertical:", v6);
  -[SUUICollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:", v6);
  -[SUUICollectionView setScrollsToTop:](self->_collectionView, "setScrollsToTop:", v6);
  -[SUUICollectionView reloadData](self->_collectionView, "reloadData");
}

- (SUUIMetricsImpressionSession)activeMetricsImpressionSession
{
  return self->_activeMetricsImpressionSession;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (SUUIStorePageSectionsDelegate)delegate
{
  return (SUUIStorePageSectionsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SUUIMetricsController)metricsController
{
  return self->_metricsController;
}

- (int64_t)pinningTransitionStyle
{
  return self->_pinningTransitionStyle;
}

- (SUUICollectionViewPullToRefreshDelegate)pullToRefreshDelegate
{
  return (SUUICollectionViewPullToRefreshDelegate *)objc_loadWeakRetained((id *)&self->_pullToRefreshDelegate);
}

- (void)setPullToRefreshDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pullToRefreshDelegate, a3);
}

- (NSArray)sections
{
  return &self->_sections->super;
}

- (void)setResourceLoader:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoader, a3);
}

- (SUUIIndexBarControl)indexBarControl
{
  return self->_indexBarControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_stackedBar, 0);
  objc_storeStrong((id *)&self->_splitsDividerView, 0);
  objc_storeStrong((id *)&self->_splitsDescription, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_destroyWeak((id *)&self->_pullToRefreshDelegate);
  objc_storeStrong((id *)&self->_viewControllerPreviewing, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_menuSectionContexts, 0);
  objc_storeStrong((id *)&self->_lastKnownWidth, 0);
  objc_storeStrong((id *)&self->_initialOverlayURLs, 0);
  objc_storeStrong((id *)&self->_indexPathOfEditedCell, 0);
  objc_storeStrong((id *)&self->_indexBarControl, 0);
  objc_storeStrong((id *)&self->_expandRemoveSections, 0);
  objc_storeStrong((id *)&self->_expandInsertSections, 0);
  objc_storeStrong((id *)&self->_expandSectionContexts, 0);
  objc_storeStrong((id *)&self->_entityProviderToRelevantSections, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_deferredSplitsDescription, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_collectionViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_activeMetricsImpressionSession, 0);
  objc_destroyWeak((id *)&self->_activeOverlayController);
}

@end
