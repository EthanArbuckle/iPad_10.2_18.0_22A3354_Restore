@implementation SUUIStackDocumentViewController

- (SUUIStackDocumentViewController)initWithTemplateElement:(id)a3 layoutStyle:(int64_t)a4
{
  id v7;
  SUUIStackDocumentViewController *v8;
  SUUIStackDocumentViewController *v9;
  void *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIStackDocumentViewController;
  v8 = -[SUUIStackDocumentViewController init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_layoutStyle = a4;
    objc_storeStrong((id *)&v8->_templateElement, a3);
    -[SUUIStackDocumentViewController _updateEntryListControllersWithReload:](v9, "_updateEntryListControllersWithReload:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__resetStateForDocumentNotification_, CFSTR("SUUIStoreDialogControllerPurchaseRequestDidSucceedNotification"), 0);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[SUUIIndexBarControlController setDataSource:](self->_indexBarControlController, "setDataSource:", 0);
  -[SUUIIndexBarControlController setDelegate:](self->_indexBarControlController, "setDelegate:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMapTable objectEnumerator](self->_viewElementToEntryListController, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "setDelegate:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("SUUIStoreDialogControllerPurchaseRequestDidSucceedNotification"), 0);

  v9.receiver = self;
  v9.super_class = (Class)SUUIStackDocumentViewController;
  -[SUUIViewController dealloc](&v9, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIStackDocumentViewController;
  -[SUUIStackDocumentViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SUUIResourceLoader enterForeground](self->_resourceLoader, "enterForeground");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIStackDocumentViewController;
  -[SUUIStackDocumentViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SUUIResourceLoader enterBackground](self->_resourceLoader, "enterBackground");
}

- (void)documentDidUpdate:(id)a3 withTemplate:(id)a4
{
  SUUIStackTemplateElement *v7;
  SUUIStackTemplateElement **p_templateElement;
  SUUIStackTemplateElement *templateElement;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  _BOOL4 v41;
  SUUIStorePageSectionsViewController *sectionsViewController;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int64_t v47;
  double v48;
  double v49;
  id v50;

  v50 = a3;
  v7 = (SUUIStackTemplateElement *)a4;
  objc_storeStrong((id *)&self->_document, a3);
  p_templateElement = &self->_templateElement;
  templateElement = self->_templateElement;
  v10 = -[SUUIStackTemplateElement needsStateReset](v7, "needsStateReset");
  if (templateElement == v7)
  {
    if (v10)
    {
      if (!self->_hasResetState)
        goto LABEL_3;
    }
    else
    {
      self->_hasResetState = 0;
    }
  }
  else
  {
    if (v10)
    {
LABEL_3:
      -[SUUIStackDocumentViewController _resetState](self, "_resetState");
      self->_hasResetState = 1;
      goto LABEL_9;
    }
    self->_hasResetState = 0;
  }
LABEL_9:
  objc_storeStrong((id *)&self->_templateElement, a4);
  -[SUUIStackDocumentViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStackDocumentViewController _colorScheme](self, "_colorScheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v11, "setBackgroundColor:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v14);

  }
  -[SUUIStackDocumentViewController _indexBarViewElement](self, "_indexBarViewElement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v17 = *MEMORY[0x24BDBF148];
    v16 = *(double *)(MEMORY[0x24BDBF148] + 8);
    -[SUUIStorePageSectionsViewController collectionView](self->_sectionsViewController, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v48 = v20;
    v49 = v19;
    -[SUUIStorePageSectionsViewController collectionView](self->_sectionsViewController, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentInset");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    -[SUUIIndexBarControlController indexBarControl](self->_indexBarControlController, "indexBarControl");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v16;
    v32 = v17;
    if (v30)
    {
      -[SUUIIndexBarControlController indexBarControl](self->_indexBarControlController, "indexBarControl");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "frame");
      v32 = v34;
      v31 = v35;

    }
    -[SUUIIndexBarControlController indexBarControl](self->_indexBarControlController, "indexBarControl");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStackDocumentViewController _configureIndexBarControl:](self, "_configureIndexBarControl:", v36);

    -[SUUIIndexBarControlController indexBarControl](self->_indexBarControlController, "indexBarControl");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      -[SUUIIndexBarControlController indexBarControl](self->_indexBarControlController, "indexBarControl");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "sizeThatFits:", v49 - (v25 + v29), v48 - (v23 + v27));
      v17 = v39;
      v16 = v40;

    }
    v41 = v31 != v16 || v32 != v17;
  }
  else
  {
    v41 = 0;
  }
  -[SUUIStackDocumentViewController _updateEntryListControllersWithReload:](self, "_updateEntryListControllersWithReload:", 1);
  -[SUUIStackDocumentViewController _updateIndexBarVisibility](self, "_updateIndexBarVisibility");
  -[SUUIStorePageSectionsViewController setColorScheme:](self->_sectionsViewController, "setColorScheme:", v12);
  -[SUUIStorePageSectionsViewController setPinningTransitionStyle:](self->_sectionsViewController, "setPinningTransitionStyle:", -[SUUIStackDocumentViewController _pinningTransitionStyle](self, "_pinningTransitionStyle"));
  -[SUUIStorePageSectionsViewController _setRendersWithPerspective:](self->_sectionsViewController, "_setRendersWithPerspective:", -[SUUIViewElement rendersWithPerspective](*p_templateElement, "rendersWithPerspective"));
  -[SUUIStorePageSectionsViewController _setRendersWithParallax:](self->_sectionsViewController, "_setRendersWithParallax:", -[SUUIViewElement rendersWithParallax](*p_templateElement, "rendersWithParallax"));
  sectionsViewController = self->_sectionsViewController;
  -[SUUIStackDocumentViewController _pageSplitsDescription](self, "_pageSplitsDescription");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionsViewController setSectionsWithSplitsDescription:](sectionsViewController, "setSectionsWithSplitsDescription:", v43);

  if (v41)
  {
    -[SUUIStorePageSectionsViewController collectionView](self->_sectionsViewController, "collectionView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "collectionViewLayout");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "invalidateLayout");

  }
  -[SUUIStorePageSectionsViewController sections](self->_sectionsViewController, "sections");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "count");

  if (self->_lastNeedsMoreCount >= v47)
    self->_lastNeedsMoreCount = 0;

}

- (void)suui_viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUUIStorePageSectionsViewController suui_viewWillAppear:](self->_sectionsViewController, "suui_viewWillAppear:");
  v5.receiver = self;
  v5.super_class = (Class)SUUIStackDocumentViewController;
  -[SUUIViewController suui_viewWillAppear:](&v5, sel_suui_viewWillAppear_, v3);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  SUUIStorePageSectionsViewController *v6;
  SUUIStorePageSectionsViewController *sectionsViewController;
  SUUIStorePageSectionsViewController *v8;
  void *v9;
  SUUIStorePageSectionsViewController *v10;
  void *v11;
  SUUIStorePageSectionsViewController *v12;
  void *v13;
  SUUIStorePageSectionsViewController *v14;
  SUUIStorePageSectionsViewController *v15;
  void *v16;
  SUUIStorePageSectionsViewController *v17;
  SUUIMetricsImpressionSession *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[SUUIStackDocumentViewController _colorScheme](self, "_colorScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v23, "setBackgroundColor:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v5);

  }
  if (!self->_sectionsViewController)
  {
    v6 = -[SUUIStorePageSectionsViewController initWithLayoutStyle:]([SUUIStorePageSectionsViewController alloc], "initWithLayoutStyle:", self->_layoutStyle);
    sectionsViewController = self->_sectionsViewController;
    self->_sectionsViewController = v6;

    v8 = self->_sectionsViewController;
    -[SUUIViewController clientContext](self, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewController setClientContext:](v8, "setClientContext:", v9);

    v10 = self->_sectionsViewController;
    -[SUUIStackDocumentViewController _resourceLoader](self, "_resourceLoader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageSectionsViewController setResourceLoader:](v10, "setResourceLoader:", v11);

    -[SUUIStorePageSectionsViewController setColorScheme:](self->_sectionsViewController, "setColorScheme:", v3);
    v12 = self->_sectionsViewController;
    -[SUUIViewController operationQueue](self, "operationQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewController setOperationQueue:](v12, "setOperationQueue:", v13);

    -[SUUIStorePageSectionsViewController setPinningTransitionStyle:](self->_sectionsViewController, "setPinningTransitionStyle:", -[SUUIStackDocumentViewController _pinningTransitionStyle](self, "_pinningTransitionStyle"));
    v14 = self->_sectionsViewController;
    -[SUUIStackDocumentViewController preferredContentSize](self, "preferredContentSize");
    -[SUUIStorePageSectionsViewController setPreferredContentSize:](v14, "setPreferredContentSize:");
    -[SUUIStorePageSectionsViewController _setRendersWithPerspective:](self->_sectionsViewController, "_setRendersWithPerspective:", -[SUUIViewElement rendersWithPerspective](self->_templateElement, "rendersWithPerspective"));
    -[SUUIStorePageSectionsViewController _setRendersWithParallax:](self->_sectionsViewController, "_setRendersWithParallax:", -[SUUIViewElement rendersWithParallax](self->_templateElement, "rendersWithParallax"));
    v15 = self->_sectionsViewController;
    -[SUUIStackDocumentViewController _pageSplitsDescription](self, "_pageSplitsDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageSectionsViewController setSectionsWithSplitsDescription:](v15, "setSectionsWithSplitsDescription:", v16);

    v17 = self->_sectionsViewController;
    v18 = objc_alloc_init(SUUIMetricsImpressionSession);
    -[SUUIStorePageSectionsViewController setActiveMetricsImpressionSession:](v17, "setActiveMetricsImpressionSession:", v18);

    -[SUUIStorePageSectionsViewController setDelegate:](self->_sectionsViewController, "setDelegate:", self);
    -[SUUIStackDocumentViewController addChildViewController:](self, "addChildViewController:", self->_sectionsViewController);
  }
  -[SUUIStackDocumentViewController _indexBarViewElement](self, "_indexBarViewElement");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[SUUIStackDocumentViewController _updateEntryListControllersWithReload:](self, "_updateEntryListControllersWithReload:", 1);
    -[SUUIStackDocumentViewController _updateIndexBarVisibility](self, "_updateIndexBarVisibility");
    -[SUUIIndexBarControlController indexBarControl](self->_indexBarControlController, "indexBarControl");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStackDocumentViewController _configureIndexBarControl:](self, "_configureIndexBarControl:", v20);

  }
  -[SUUIStackDocumentViewController _pullToRefreshElement](self, "_pullToRefreshElement");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[SUUIStorePageSectionsViewController setUsePullToRefresh:](self->_sectionsViewController, "setUsePullToRefresh:", 1);
    -[SUUIStorePageSectionsViewController setPullToRefreshDelegate:](self->_sectionsViewController, "setPullToRefreshDelegate:", self);
  }
  -[SUUIStorePageSectionsViewController view](self->_sectionsViewController, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAutoresizingMask:", 18);
  objc_msgSend(v23, "bounds");
  objc_msgSend(v22, "setFrame:");
  objc_msgSend(v23, "addSubview:", v22);
  -[SUUIStackDocumentViewController setView:](self, "setView:", v23);

}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SUUIStackDocumentViewController;
  -[SUUIStackDocumentViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_);
  -[SUUIStorePageSectionsViewController setPreferredContentSize:](self->_sectionsViewController, "setPreferredContentSize:", width, height);
}

- (void)documentDidUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "templateElement");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIStackDocumentViewController documentDidUpdate:withTemplate:](self, "documentDidUpdate:withTemplate:", v4);

  if (-[SUUIResourceLoader isIdleForReason:](self->_resourceLoader, "isIdleForReason:", 1))
    -[SUUIStackDocumentViewController resourceLoader:didLoadAllForReason:](self, "resourceLoader:didLoadAllForReason:", self->_resourceLoader, 1);

}

- (void)documentMediaQueriesDidUpdate:(id)a3
{
  -[SUUIStorePageSectionsViewController invalidateAndReload](self->_sectionsViewController, "invalidateAndReload", a3);
}

- (id)impressionableViewElements
{
  return -[SUUIStorePageSectionsViewController _impressionableViewElements](self->_sectionsViewController, "_impressionableViewElements");
}

- (id)indexBarControlController:(id)a3 entryDescriptorAtIndexPath:(id)a4
{
  void *v4;
  NSArray *entryListControllers;
  id v6;
  void *v7;
  uint64_t v8;

  if (self->_indexBarControlController == a3)
  {
    entryListControllers = self->_entryListControllers;
    v6 = a4;
    -[NSArray objectAtIndex:](entryListControllers, "objectAtIndex:", objc_msgSend(v6, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "item");

    objc_msgSend(v7, "entryDescriptorAtIndex:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)indexBarControlController:(id)a3 numberOfEntryDescriptorsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  if (self->_indexBarControlController != a3)
    return 0;
  -[NSArray objectAtIndex:](self->_entryListControllers, "objectAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfEntryDescriptors");

  return v6;
}

- (int64_t)numberOfSectionsInIndexBarControlController:(id)a3
{
  if (self->_indexBarControlController == a3)
    return -[NSArray count](self->_entryListControllers, "count");
  else
    return 0;
}

- (void)indexBarControlController:(id)a3 didSelectEntryDescriptorAtIndexPath:(id)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (!-[SUUIStackDocumentViewController _tryToScrollToSectionAtIndexPath:](self, "_tryToScrollToSectionAtIndexPath:", v6))
  {
    v7 = -[SUUIStackDocumentViewController _globalIndexFromIndexPath:](self, "_globalIndexFromIndexPath:", v6);
    v8 = -[SUUIStackDocumentViewController _maxGlobalIndex](self, "_maxGlobalIndex");
    if ((v8 & 0x8000000000000000) == 0)
    {
      v9 = v8;
      v10 = 0;
      for (i = -1; ; --i)
      {
        if (v7 + i >= 0)
        {
          -[SUUIStackDocumentViewController _indexPathFromGlobalIndex:](self, "_indexPathFromGlobalIndex:", v7 + i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[SUUIStackDocumentViewController _tryToScrollToSectionAtIndexPath:](self, "_tryToScrollToSectionAtIndexPath:", v12);

          if (v13)
            break;
        }
        if (v7 + v10 + 1 <= v9)
        {
          -[SUUIStackDocumentViewController _indexPathFromGlobalIndex:](self, "_indexPathFromGlobalIndex:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[SUUIStackDocumentViewController _tryToScrollToSectionAtIndexPath:](self, "_tryToScrollToSectionAtIndexPath:", v14);

          if (v15)
            break;
        }
        if (v10 >= v9)
          break;
        ++v10;
      }
    }
  }

}

- (void)indexBarControlControllerDidSelectBeyondBottom:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  id v7;

  -[SUUIStorePageSectionsViewController sections](self->_sectionsViewController, "sections", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[SUUIStorePageSectionsViewController collectionView](self->_sectionsViewController, "collectionView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentSize");
    objc_msgSend(v7, "scrollRectToVisible:animated:", 0, 0.0, v6 + -1.0, 0.0, 0.0);

  }
}

- (void)indexBarControlControllerDidSelectBeyondTop:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  -[SUUIStorePageSectionsViewController sections](self->_sectionsViewController, "sections", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[SUUIStorePageSectionsViewController collectionView](self->_sectionsViewController, "collectionView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollRectToVisible:animated:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  }
}

- (void)indexBarEntryListControllerDidInvalidate:(id)a3
{
  NSArray *entryListControllers;
  uint64_t v5;
  SUUIIndexBarControlController *indexBarControlController;
  id v7;

  if (a3)
  {
    entryListControllers = self->_entryListControllers;
    if (entryListControllers)
    {
      v5 = -[NSArray indexOfObject:](entryListControllers, "indexOfObject:");
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        indexBarControlController = self->_indexBarControlController;
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v5);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        -[SUUIIndexBarControlController reloadSections:](indexBarControlController, "reloadSections:", v7);

      }
    }
  }
}

- (void)refresh:(id)a3 refreshControl:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  -[SUUIStackDocumentViewController _pullToRefreshElement](self, "_pullToRefreshElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__SUUIStackDocumentViewController_refresh_refreshControl___block_invoke;
    v7[3] = &unk_2511F51C8;
    v8 = v5;
    objc_msgSend(v6, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 15, 1, 0, 0, v7);

  }
}

void __58__SUUIStackDocumentViewController_refresh_refreshControl___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SUUIStackDocumentViewController_refresh_refreshControl___block_invoke_2;
  block[3] = &unk_2511F47C0;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], block);

}

uint64_t __58__SUUIStackDocumentViewController_refresh_refreshControl___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endRefreshing");
}

- (void)getModalSourceViewForElementIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[SUUIStorePageSectionsViewController sections](self->_sectionsViewController, "sections");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
      objc_msgSend(v13, "pageComponent", (_QWORD)v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "viewElement");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "elementWithIdentifier:", v6);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
        break;

      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v17 = (void *)v16;
    v18 = v13;

    if (!v18)
      goto LABEL_12;
    objc_msgSend(v18, "getModalSourceViewForViewElement:completionBlock:", v17, v7);

  }
  else
  {
LABEL_9:

    v17 = 0;
LABEL_12:
    v7[2](v7, 0);
  }

}

- (BOOL)performTestWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (-[SUUIStorePageSectionsViewController conformsToProtocol:](self->_sectionsViewController, "conformsToProtocol:", &unk_2571C66C8))v8 = -[SUUIStorePageSectionsViewController performTestWithName:options:](self->_sectionsViewController, "performTestWithName:options:", v6, v7);
  else
    v8 = 0;

  return v8;
}

- (void)sectionsViewController:(id)a3 willScrollToOffset:(CGPoint)a4 visibleRange:(SUUIIndexPathRange *)a5
{
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v7 = a3;
  objc_msgSend(v7, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  objc_msgSend(v7, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "lastObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "pageComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "elementType");

    v9 -= v13 == 4;
  }
  if (self->_lastNeedsMoreCount < v9 && a5->var2 + 2 >= v9)
  {
    self->_lastNeedsMoreCount = v9;
    -[SUUIStackTemplateElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_templateElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 16, 1, 1, 0, 0);
  }

}

- (void)resourceLoaderDidBeginLoading:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SUUIStackDocumentViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_2571AF260) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "resourceLoaderDidBeginLoading:", v5);

}

- (void)resourceLoader:(id)a3 didLoadAllForReason:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (a4 == 1)
    -[SUUIStackTemplateElement dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:](self->_templateElement, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", CFSTR("visibleimagesloaded"), CFSTR("onvisibleimagesloaded"), 1, 1, 0, 0);
  -[SUUIStackDocumentViewController parentViewController](self, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_2571AF260) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "resourceLoader:didLoadAllForReason:", v7, a4);

}

- (id)_colorScheme
{
  void *v2;
  void *v3;
  void *v4;
  SUUIColorScheme *v5;

  -[SUUIStackTemplateElement style](self->_templateElement, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ikBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(SUUIColorScheme);
    -[SUUIColorScheme setBackgroundColor:](v5, "setBackgroundColor:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_configureIndexBarControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUIStackDocumentViewController _indexBarViewElement](self, "_indexBarViewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "ikBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementPlainColorWithIKColor(v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = v9;

      v7 = v10;
    }
    SUUIViewElementPlainColorWithStyle(v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v13 = v11;

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v4, "setBackgroundColor:", v7);
  objc_msgSend(v4, "setTintColor:", v12);
  SUUIViewElementFontWithStyle(v6);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
  {
    v17 = *MEMORY[0x24BEBB360];
    v18[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v4, "setDefaultTextAttributes:", v16);

}

- (int64_t)_globalIndexFromIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  v4 = a3;
  if (-[NSArray count](self->_entryListControllers, "count"))
  {
    v5 = 0;
    v6 = 0;
    while (1)
    {
      -[NSArray objectAtIndex:](self->_entryListControllers, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "numberOfEntryDescriptors");
      if (v5 == objc_msgSend(v4, "section"))
        break;
      v6 += v8;

      if (++v5 >= -[NSArray count](self->_entryListControllers, "count"))
        goto LABEL_5;
    }
    v9 = objc_msgSend(v4, "item") + v6;

  }
  else
  {
LABEL_5:
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (id)_indexBarControlController
{
  SUUIIndexBarControlController *indexBarControlController;
  SUUIIndexBarControl *v4;
  SUUIIndexBarControl *v5;
  SUUIIndexBarControlController *v6;
  SUUIIndexBarControlController *v7;
  SUUIIndexBarControlController *v8;
  void *v9;

  indexBarControlController = self->_indexBarControlController;
  if (!indexBarControlController)
  {
    v4 = [SUUIIndexBarControl alloc];
    v5 = -[SUUIIndexBarControl initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[SUUIIndexBarControl contentEdgeInsets](v5, "contentEdgeInsets");
    -[SUUIIndexBarControl setContentEdgeInsets:](v5, "setContentEdgeInsets:", 16.0);
    -[SUUIStackDocumentViewController _configureIndexBarControl:](self, "_configureIndexBarControl:", v5);
    v6 = -[SUUIIndexBarControlController initWithIndexBarControl:]([SUUIIndexBarControlController alloc], "initWithIndexBarControl:", v5);
    v7 = self->_indexBarControlController;
    self->_indexBarControlController = v6;

    -[SUUIIndexBarControlController setDataSource:](self->_indexBarControlController, "setDataSource:", self);
    -[SUUIIndexBarControlController setDelegate:](self->_indexBarControlController, "setDelegate:", self);
    v8 = self->_indexBarControlController;
    -[SUUIStackDocumentViewController _resourceLoader](self, "_resourceLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIIndexBarControlController setResourceLoader:](v8, "setResourceLoader:", v9);

    indexBarControlController = self->_indexBarControlController;
  }
  return indexBarControlController;
}

- (id)_indexBarViewElement
{
  return -[SUUIStackTemplateElement indexBarViewElement](self->_templateElement, "indexBarViewElement");
}

- (id)_indexPathFromGlobalIndex:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;

  if (-[NSArray count](self->_entryListControllers, "count"))
  {
    v5 = 0;
    while (1)
    {
      -[NSArray objectAtIndex:](self->_entryListControllers, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = a3 - objc_msgSend(v6, "numberOfEntryDescriptors");
      if (v7 < 0)
        break;

      ++v5;
      a3 = v7;
      if (v5 >= -[NSArray count](self->_entryListControllers, "count"))
        goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v8 = 0;
  }
  return v8;
}

- (int64_t)_maxGlobalIndex
{
  uint64_t v3;
  unint64_t v4;
  void *v5;

  if (!-[NSArray count](self->_entryListControllers, "count"))
    return -1;
  v3 = 0;
  v4 = 0;
  do
  {
    -[NSArray objectAtIndex:](self->_entryListControllers, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 += objc_msgSend(v5, "numberOfEntryDescriptors");

    ++v4;
  }
  while (v4 < -[NSArray count](self->_entryListControllers, "count"));
  return v3 - 1;
}

- (id)_pageComponentsWithViewElements:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  objc_class *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v11 = (objc_class *)SUUIPageComponentClassForComponentType(objc_msgSend(v10, "pageComponentType", (_QWORD)v14));
        if (v11)
        {
          v12 = (void *)objc_msgSend([v11 alloc], "initWithViewElement:", v10);
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_pageSplitsDescription
{
  SUUIStorePageSplitsDescription *v3;
  id v4;
  id v5;
  SUUIStackTemplateElement *templateElement;
  id v7;
  SUUIStorePageSplit *v8;
  void *v9;
  SUUIStorePageSplit *v10;
  void *v11;
  double v12;
  double v13;
  SUUIStorePageSplit *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[5];
  id v38;

  v3 = objc_alloc_init(SUUIStorePageSplitsDescription);
  if (-[SUUIStackTemplateElement numberOfSplits](self->_templateElement, "numberOfSplits") == 2)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__44;
    v37[4] = __Block_byref_object_dispose__44;
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v38 = v5;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__44;
    v35 = __Block_byref_object_dispose__44;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__44;
    v29 = __Block_byref_object_dispose__44;
    v30 = 0;
    templateElement = self->_templateElement;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __57__SUUIStackDocumentViewController__pageSplitsDescription__block_invoke;
    v20[3] = &unk_2511F9F18;
    v23 = &v25;
    v24 = v37;
    v22 = &v31;
    v20[4] = self;
    v7 = v4;
    v21 = v7;
    -[SUUIViewElement enumerateChildrenUsingBlock:](templateElement, "enumerateChildrenUsingBlock:", v20);
    if (objc_msgSend(v5, "count"))
    {
      v8 = objc_alloc_init(SUUIStorePageSplit);
      -[SUUIStackDocumentViewController _pageComponentsWithViewElements:](self, "_pageComponentsWithViewElements:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStorePageSplit setPageComponents:](v8, "setPageComponents:", v9);

      -[SUUIStorePageSplitsDescription setTopSplit:](v3, "setTopSplit:", v8);
    }
    if (objc_msgSend(v7, "count"))
    {
      v10 = objc_alloc_init(SUUIStorePageSplit);
      -[SUUIStackDocumentViewController _pageComponentsWithViewElements:](self, "_pageComponentsWithViewElements:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStorePageSplit setPageComponents:](v10, "setPageComponents:", v11);

      -[SUUIStorePageSplitsDescription setBottomSplit:](v3, "setBottomSplit:", v10);
    }
    objc_msgSend((id)v32[5], "widthFraction");
    if (v12 < 0.00000011920929)
    {
      objc_msgSend((id)v26[5], "widthFraction");
      if (v13 < 0.00000011920929)
        objc_msgSend((id)v32[5], "setWidthFraction:", 0.600000024);
    }
    -[SUUIStorePageSplitsDescription setLeftSplit:](v3, "setLeftSplit:", v32[5]);
    -[SUUIStorePageSplitsDescription setRightSplit:](v3, "setRightSplit:", v26[5]);

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(v37, 8);
  }
  else
  {
    v14 = objc_alloc_init(SUUIStorePageSplit);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStackTemplateElement collectionHeaderViewElement](self->_templateElement, "collectionHeaderViewElement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v15, "addObject:", v16);
    -[SUUIStackTemplateElement collectionElements](self->_templateElement, "collectionElements");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v17);

    -[SUUIStackDocumentViewController _pageComponentsWithViewElements:](self, "_pageComponentsWithViewElements:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageSplit setPageComponents:](v14, "setPageComponents:", v18);

    -[SUUIStorePageSplitsDescription setTopSplit:](v3, "setTopSplit:", v14);
  }
  return v3;
}

void __57__SUUIStackDocumentViewController__pageSplitsDescription__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  double v9;
  double v10;
  SUUIStorePageSplit *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  SUUIStorePageSplit *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;

  v31 = a2;
  v3 = objc_msgSend(v31, "elementType");
  if (v3 == 128)
  {
    objc_msgSend(v31, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemWidth");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("%"));
    v7 = objc_msgSend(v5, "length") - 1;
    objc_msgSend(v5, "floatValue");
    v9 = v8;
    if (v6 == v7)
      v10 = v9 / 100.0;
    else
      v10 = v9;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
LABEL_14:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));

        goto LABEL_15;
      }
      v11 = objc_alloc_init(SUUIStorePageSplit);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v15 = *(void **)(a1 + 32);
      objc_msgSend(v31, "flattenedChildren");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_pageComponentsWithViewElements:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPageComponents:", v17);

      v18 = *(_QWORD *)(a1 + 56);
    }
    else
    {
      v19 = objc_alloc_init(SUUIStorePageSplit);
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

      v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v23 = *(void **)(a1 + 32);
      objc_msgSend(v31, "flattenedChildren");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_pageComponentsWithViewElements:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setPageComponents:", v25);

      v18 = *(_QWORD *)(a1 + 48);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(v18 + 8) + 40), "setWidthFraction:", v10);
    goto LABEL_14;
  }
  if (v3 == 32
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(v31, "style");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementPlainColorWithStyle(v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v29 = v27;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v29;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDividerColor:", v30);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v31);
  }
LABEL_15:

}

- (int64_t)_pinningTransitionStyle
{
  void *v2;
  int v3;

  -[SUUIStackTemplateElement navigationBarElement](self->_templateElement, "navigationBarElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hidesShadow");

  if (v3)
    return 2;
  else
    return 1;
}

- (id)_pullToRefreshElement
{
  return -[SUUIViewElement firstChildForElementType:](self->_templateElement, "firstChildForElementType:", 99);
}

- (void)_resetState
{
  self->_lastNeedsMoreCount = 0;
}

- (void)_resetStateForDocumentNotification:(id)a3
{
  IKAppDocument *document;
  IKAppDocument *v5;

  document = self->_document;
  objc_msgSend(a3, "object");
  v5 = (IKAppDocument *)objc_claimAutoreleasedReturnValue();

  if (document == v5)
    -[SUUIStackDocumentViewController _resetState](self, "_resetState");
}

- (id)_resourceLoader
{
  SUUIResourceLoader *resourceLoader;
  SUUIResourceLoader *v4;
  void *v5;
  SUUIResourceLoader *v6;
  SUUIResourceLoader *v7;
  SUUIResourceLoader *v8;
  void *v9;

  resourceLoader = self->_resourceLoader;
  if (!resourceLoader)
  {
    v4 = [SUUIResourceLoader alloc];
    -[SUUIViewController clientContext](self, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUIResourceLoader initWithClientContext:](v4, "initWithClientContext:", v5);
    v7 = self->_resourceLoader;
    self->_resourceLoader = v6;

    v8 = self->_resourceLoader;
    SUUIResourceLoaderGetNameForObject(self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIResourceLoader setName:](v8, "setName:", v9);

    -[SUUIResourceLoader setDelegate:](self->_resourceLoader, "setDelegate:", self);
    resourceLoader = self->_resourceLoader;
  }
  return resourceLoader;
}

- (BOOL)_shouldShowIndexBar
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  char v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_entryListControllers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "numberOfEntryDescriptors", (_QWORD)v11);
        v8 = objc_msgSend(v6, "hidesIndexBar");
        v9 = v8;
        if (v7 >= 1 && (v8 & 1) != 0)
        {
          LOBYTE(v3) = 0;
          goto LABEL_14;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
    if (v7 > 0)
      LOBYTE(v3) = v9 ^ 1;
    else
      LOBYTE(v3) = 0;
  }
LABEL_14:

  return v3;
}

- (BOOL)_tryToScrollToSectionAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double MinY;
  double Width;
  double Height;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t j;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double MinX;
  double v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  void *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v72 = 0;
  -[NSArray objectAtIndex:](self->_entryListControllers, "objectAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetIndexBarEntryIDForEntryDescriptorAtIndex:returningRelativeSectionIndex:", objc_msgSend(v4, "item"), &v72);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    -[SUUIStorePageSectionsViewController sections](self->_sectionsViewController, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v69;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v69 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v11, "containsElementWithIndexBarEntryID:", v6))
          {
            v62 = v5;
            v63 = v4;
            objc_msgSend(v11, "targetScrollingIndexPathForElementWithIndexBarEntryID:relativeSectionIndex:", v6, v72);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUUIStorePageSectionsViewController collectionView](self->_sectionsViewController, "collectionView");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "collectionViewLayout");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "layoutAttributesForUnpinnedItemAtIndexPath:", v7);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "frame");
            v16 = v15;
            v18 = v17;
            v20 = v19;
            v22 = v21;

            objc_msgSend(v12, "bounds");
            v24 = v23;
            v26 = v25;
            v28 = v27;
            v30 = v29;
            objc_msgSend(v12, "contentSize");
            v57 = v31;
            v76.origin.x = v16;
            v76.origin.y = v18;
            v76.size.width = v20;
            v76.size.height = v22;
            MinX = CGRectGetMinX(v76);
            v60 = v18;
            v61 = v16;
            v77.origin.x = v16;
            v77.origin.y = v18;
            v58 = v22;
            v59 = v20;
            v77.size.width = v20;
            v77.size.height = v22;
            v32 = v24;
            MinY = CGRectGetMinY(v77);
            v78.origin.x = v24;
            v78.origin.y = v26;
            v78.size.width = v28;
            v78.size.height = v30;
            Width = CGRectGetWidth(v78);
            v79.origin.x = v24;
            v79.origin.y = v26;
            v79.size.width = v28;
            v79.size.height = v30;
            Height = CGRectGetHeight(v79);
            objc_msgSend(v12, "collectionViewLayout");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "pinnedLayoutAttributesForItemsInRect:", MinX, MinY, Width, Height);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v37, "sortedArrayUsingComparator:", &__block_literal_global_29);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            v66 = 0u;
            v67 = 0u;
            v64 = 0u;
            v65 = 0u;
            v39 = v38;
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
            if (v40)
            {
              v41 = v40;
              v42 = *(_QWORD *)v65;
              v43 = 0.0;
              while (2)
              {
                for (j = 0; j != v41; ++j)
                {
                  if (*(_QWORD *)v65 != v42)
                    objc_enumerationMutation(v39);
                  v45 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
                  objc_msgSend(v45, "indexPath", *(_QWORD *)&MinX);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v46, "compare:", v7) != -1)
                  {

                    goto LABEL_23;
                  }
                  objc_msgSend(v45, "frame");
                  v43 = v43 - CGRectGetHeight(v80);

                }
                v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
                if (v41)
                  continue;
                break;
              }
            }
            else
            {
              v43 = 0.0;
            }
LABEL_23:

            objc_msgSend(v12, "contentOffset");
            v48 = v47;
            objc_msgSend(v12, "contentInset");
            v50 = v49;
            v52 = v51;
            v81.origin.y = v60;
            v81.origin.x = v61;
            v81.size.height = v58;
            v81.size.width = v59;
            v53 = v43 + CGRectGetMinY(v81);
            v82.origin.x = v32;
            v82.origin.y = v26;
            v82.size.width = v28;
            v82.size.height = v30;
            v54 = v52 + v50 + v57 - CGRectGetHeight(v82);
            if (v53 < v54)
              v54 = v53;
            objc_msgSend(v12, "setContentOffset:animated:", 0, v48, v54 - v50, *(_QWORD *)&MinX);

            LOBYTE(v7) = 1;
            v5 = v62;
            v4 = v63;
            goto LABEL_26;
          }
        }
        v7 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_26:

  }
  return (char)v7;
}

uint64_t __68__SUUIStackDocumentViewController__tryToScrollToSectionAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_updateEntryListControllersWithReload:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSArray *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  NSMapTable *viewElementToEntryListController;
  NSArray *entryListControllers;
  _BOOL4 v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  SUUIStackDocumentViewController *v30;
  id v31;
  NSArray *v32;
  _BYTE v33[128];
  uint64_t v34;

  v22 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  -[NSMapTable keyEnumerator](self->_viewElementToEntryListController, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
  -[SUUIStackDocumentViewController _indexBarViewElement](self, "_indexBarViewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __73__SUUIStackDocumentViewController__updateEntryListControllersWithReload___block_invoke;
  v28[3] = &unk_2511F9F60;
  v10 = v6;
  v29 = v10;
  v30 = self;
  v11 = v7;
  v31 = v11;
  v12 = v8;
  v32 = v12;
  v23 = v9;
  objc_msgSend(v9, "enumerateChildrenUsingBlock:", v28);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_viewElementToEntryListController, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setDelegate:", 0);
        -[NSMapTable removeObjectForKey:](self->_viewElementToEntryListController, "removeObjectForKey:", v18);
        if (!-[NSMapTable count](self->_viewElementToEntryListController, "count"))
        {
          viewElementToEntryListController = self->_viewElementToEntryListController;
          self->_viewElementToEntryListController = 0;

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v15);
  }

  if (!-[NSArray count](v12, "count"))
  {

    v12 = 0;
  }
  entryListControllers = self->_entryListControllers;
  if (entryListControllers == v12 || -[NSArray isEqualToArray:](entryListControllers, "isEqualToArray:", v12))
  {
    if (objc_msgSend(v11, "count") && v22)
      -[SUUIIndexBarControlController reloadSections:](self->_indexBarControlController, "reloadSections:", v11);
  }
  else
  {
    objc_storeStrong((id *)&self->_entryListControllers, v12);
    if (v22)
      -[SUUIIndexBarControlController reloadData](self->_indexBarControlController, "reloadData");
  }

}

void __73__SUUIStackDocumentViewController__updateEntryListControllersWithReload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", v13);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1104), "objectForKey:", v13);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(*(id *)(a1 + 56), "count"));
  }
  else
  {
    v11 = objc_msgSend(v13, "elementType");
    if (v11 == 54)
    {
      +[SUUIIndexBarEntryListController entryListControllerForEntryViewElement:](SUUIIndexBarEntryListController, "entryListControllerForEntryViewElement:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11 != 55)
      {
        objc_msgSend(0, "setDelegate:", *(_QWORD *)(a1 + 40));
        goto LABEL_8;
      }
      +[SUUIIndexBarEntryListController entryListControllerForEntryListViewElement:](SUUIIndexBarEntryListController, "entryListControllerForEntryListViewElement:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = v12;
    objc_msgSend(v12, "setDelegate:", *(_QWORD *)(a1 + 40));
    if (!v4)
      goto LABEL_8;
  }
  if (objc_msgSend(v4, "needsRootTargetViewElement"))
  {
    objc_msgSend(v4, "rootTargetIndexBarEntryID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1096), "firstDescendentWithIndexBarEntryID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRootTargetViewElement:", v6);

  }
  objc_msgSend(v4, "reloadViewElementData");
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v4);
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 1104);
  if (!v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 1);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v9 + 1104);
    *(_QWORD *)(v9 + 1104) = v8;

    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 1104);
  }
  objc_msgSend(v7, "setObject:forKey:", v4, v13);

LABEL_8:
}

- (void)_updateIndexBarVisibility
{
  _BOOL4 v3;
  void *v4;
  SUUIStorePageSectionsViewController *sectionsViewController;
  void *v6;
  id v7;

  v3 = -[SUUIStackDocumentViewController _shouldShowIndexBar](self, "_shouldShowIndexBar");
  -[SUUIStorePageSectionsViewController indexBarControl](self->_sectionsViewController, "indexBarControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v4)
    {
      sectionsViewController = self->_sectionsViewController;
      -[SUUIStackDocumentViewController _indexBarControlController](self, "_indexBarControlController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "indexBarControl");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStorePageSectionsViewController setIndexBarControl:](sectionsViewController, "setIndexBarControl:", v6);

    }
  }
  else if (v4)
  {
    -[SUUIStorePageSectionsViewController setIndexBarControl:](self->_sectionsViewController, "setIndexBarControl:", 0);
  }
}

- (SUUIStorePageSectionsViewController)sectionsViewController
{
  return self->_sectionsViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionsViewController, 0);
  objc_storeStrong((id *)&self->_viewElementToEntryListController, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_indexBarControlController, 0);
  objc_storeStrong((id *)&self->_entryListControllers, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end
