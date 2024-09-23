@implementation SUUIExploreDocumentViewController

- (SUUIExploreDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5;
  SUUIExploreDocumentViewController *v6;
  SUUIExploreDocumentViewController *v7;
  SUUIMetricsImpressionSession *v8;
  SUUIMetricsImpressionSession *activeMetricsImpressionSession;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIExploreDocumentViewController;
  v6 = -[SUUIExploreDocumentViewController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_exploreTemplate, a3);
    v8 = objc_alloc_init(SUUIMetricsImpressionSession);
    activeMetricsImpressionSession = v7->_activeMetricsImpressionSession;
    v7->_activeMetricsImpressionSession = v8;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIExploreDocumentViewController;
  -[SUUIViewController dealloc](&v3, sel_dealloc);
}

- (void)selectGenreListComponent:(id)a3
{
  id v3;

  objc_msgSend(a3, "viewElement");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

}

- (BOOL)managesNavigationBarContents
{
  return !-[SUUIExploreTemplateElement usesSplits](self->_exploreTemplate, "usesSplits");
}

- (void)setClientContext:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIExploreDocumentViewController;
  v4 = a3;
  -[SUUIViewController setClientContext:](&v5, sel_setClientContext_, v4);
  -[SUUIViewController setClientContext:](self->_rightVC, "setClientContext:", v4, v5.receiver, v5.super_class);

}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (id)contentScrollView
{
  return self->_contentScrollView;
}

- (void)loadView
{
  SUUIContentInsetScrollView *v3;
  SUUIContentInsetScrollView *contentScrollView;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[SUUIExploreDocumentViewController setView:](self, "setView:", v6);
  -[SUUIExploreDocumentViewController _updateChildViewControllers](self, "_updateChildViewControllers");
  v3 = objc_alloc_init(SUUIContentInsetScrollView);
  contentScrollView = self->_contentScrollView;
  self->_contentScrollView = v3;

  objc_msgSend(v6, "addSubview:", self->_contentScrollView);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__contentInsetDidChange_, 0x2512098A8, self->_contentScrollView);

  if (-[SUUIExploreTemplateElement usesSplits](self->_exploreTemplate, "usesSplits"))
  {
    -[SUUIExploreDocumentViewController _reloadLeftViewControllers](self, "_reloadLeftViewControllers");
    -[SUUIExploreDocumentViewController _reloadRightViewController](self, "_reloadRightViewController");
  }
  else
  {
    -[SUUIExploreDocumentViewController _reloadData](self, "_reloadData");
  }

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  CGFloat height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  objc_super v13;
  CGSize result;

  height = a4.height;
  width = a4.width;
  if (self->_rightVC == a3)
  {
    -[UISplitViewController primaryColumnWidth](self->_splitVC, "primaryColumnWidth");
    v10 = width - v9;
    -[UISplitViewController gutterWidth](self->_splitVC, "gutterWidth");
    v7 = v10 - v11;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUIExploreDocumentViewController;
    -[SUUIExploreDocumentViewController sizeForChildContentContainer:withParentContainerSize:](&v13, sel_sizeForChildContentContainer_withParentContainerSize_, a4.width, a4.height);
    height = v8;
  }
  v12 = height;
  result.height = v12;
  result.width = v7;
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SUUIExploreDocumentViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 0, v3);

  -[SUUIExploreDocumentViewController _endAllPendingActiveImpression](self, "_endAllPendingActiveImpression");
  v6.receiver = self;
  v6.super_class = (Class)SUUIExploreDocumentViewController;
  -[SUUIExploreDocumentViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SUUIExploreDocumentViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", -[SUUIExploreTemplateElement usesSplits](self->_exploreTemplate, "usesSplits") ^ 1, v3);

  -[SUUIExploreDocumentViewController _beginActiveImpressionsForImpressionableViewElements](self, "_beginActiveImpressionsForImpressionableViewElements");
  v6.receiver = self;
  v6.super_class = (Class)SUUIExploreDocumentViewController;
  -[SUUIViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("SUUIApplicationPageDidDisplayNotification"), self);

  v6.receiver = self;
  v6.super_class = (Class)SUUIExploreDocumentViewController;
  -[SUUIExploreDocumentViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
}

- (void)documentDidUpdate:(id)a3
{
  id v4;
  void *v5;
  SUUIExploreTemplateElement *v6;
  SUUIExploreTemplateElement *exploreTemplate;
  _BOOL8 v8;
  NSArray *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  NSArray *contentOffsets;
  NSArray *v22;
  SUUIExploreTemplateElement *v23;
  SUUIExploreTemplateElement *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 IsDescendent;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("SUUIApplicationPageDidUpdateNotification"), self);

  objc_msgSend(v4, "templateElement");
  v6 = (SUUIExploreTemplateElement *)objc_claimAutoreleasedReturnValue();
  exploreTemplate = self->_exploreTemplate;
  self->_exploreTemplate = v6;

  -[SUUIExploreDocumentViewController _updateChildViewControllers](self, "_updateChildViewControllers");
  v8 = -[SUUIExploreTemplateElement usesSplits](self->_exploreTemplate, "usesSplits");
  if (v8)
  {
    v32 = v4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[UINavigationController viewControllers](self->_leftVC, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "contentScrollView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "contentOffset");
          v17 = v16;
          v19 = v18;

          objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v17, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v9, "addObject:", v20);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v12);
    }

    contentOffsets = self->_contentOffsets;
    self->_contentOffsets = v9;
    v22 = v9;

    v4 = v32;
    objc_msgSend(v32, "templateElement");
    v23 = (SUUIExploreTemplateElement *)objc_claimAutoreleasedReturnValue();
    v24 = self->_exploreTemplate;
    self->_exploreTemplate = v23;

    -[SUUIExploreDocumentViewController _reloadLeftViewControllers](self, "_reloadLeftViewControllers");
    -[SUUIExploreDocumentViewController _reloadRightViewController](self, "_reloadRightViewController");
    -[UINavigationController topViewController](self->_leftVC, "topViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIExploreDocumentViewController _reloadSelectionForViewController:](self, "_reloadSelectionForViewController:", v25);
  }
  else
  {
    -[SUUIExploreDocumentViewController _reloadData](self, "_reloadData");
  }
  -[SUUIExploreDocumentViewController navigationController](self, "navigationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  IsDescendent = SUUIViewControllerIsDescendent(self, v27);

  if (IsDescendent)
  {
    if (v8)
    {
      +[SUUINavigationControllerAssistant existingAssistantForNavigationController:](SUUINavigationControllerAssistant, "existingAssistantForNavigationController:", v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setPalettePinningBarHidden:", 0);

    }
    objc_msgSend(v26, "setNavigationBarHidden:animated:", v8 ^ 1, 0);
  }
  -[UINavigationController view](self->_navigationController, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setHidden:", v8);

  -[UISplitViewController view](self->_splitVC, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setHidden:", v8 ^ 1);

}

- (void)documentMediaQueriesDidUpdate:(id)a3
{
  void *v4;

  -[UINavigationController viewControllers](self->_leftVC, "viewControllers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_18);

  -[SUUIStorePageSectionsViewController invalidateAndReload](self->_rightVC, "invalidateAndReload");
}

uint64_t __67__SUUIExploreDocumentViewController_documentMediaQueriesDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateAndReload");
}

- (void)_updateChildViewControllers
{
  UINavigationController *v3;
  UINavigationController *leftVC;
  SUUIStorePageSectionsViewController *v5;
  SUUIStorePageSectionsViewController *rightVC;
  SUUIStorePageSectionsViewController *v7;
  void *v8;
  SUUIStorePageSectionsViewController *v9;
  void *v10;
  UISplitViewController *v11;
  UISplitViewController *splitVC;
  UISplitViewController *v13;
  UISplitViewController *v14;
  UISplitViewController *v15;
  SUUIStorePageSectionsViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UINavigationController *navigationController;
  void *v22;
  UINavigationController *v23;
  UINavigationController *v24;
  UINavigationController *v25;
  void *v26;
  void *v27;
  void *v28;
  UISplitViewController *v29;
  void *v30;
  UISplitViewController *v31;
  UINavigationController *v32;
  SUUIStorePageSectionsViewController *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  if (-[SUUIExploreTemplateElement usesSplits](self->_exploreTemplate, "usesSplits"))
  {
    if (!self->_splitVC)
    {
      v3 = (UINavigationController *)objc_alloc_init(MEMORY[0x24BEBD7A0]);
      leftVC = self->_leftVC;
      self->_leftVC = v3;

      -[UINavigationController setNavigationBarHidden:](self->_leftVC, "setNavigationBarHidden:", 1);
      -[UINavigationController setDelegate:](self->_leftVC, "setDelegate:", self);
      v5 = -[SUUIStorePageSectionsViewController initWithLayoutStyle:]([SUUIStorePageSectionsViewController alloc], "initWithLayoutStyle:", 2);
      rightVC = self->_rightVC;
      self->_rightVC = v5;

      v7 = self->_rightVC;
      -[SUUIViewController clientContext](self, "clientContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewController setClientContext:](v7, "setClientContext:", v8);

      v9 = self->_rightVC;
      -[SUUIViewController operationQueue](self, "operationQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewController setOperationQueue:](v9, "setOperationQueue:", v10);

      -[SUUIStorePageSectionsViewController setActiveMetricsImpressionSession:](self->_rightVC, "setActiveMetricsImpressionSession:", self->_activeMetricsImpressionSession);
      v11 = (UISplitViewController *)objc_alloc_init(MEMORY[0x24BEBD968]);
      splitVC = self->_splitVC;
      self->_splitVC = v11;

      v13 = self->_splitVC;
      -[SUUIExploreDocumentViewController _leftColumnWidth](self, "_leftColumnWidth");
      -[UISplitViewController setMaximumPrimaryColumnWidth:](v13, "setMaximumPrimaryColumnWidth:");
      v14 = self->_splitVC;
      -[SUUIExploreDocumentViewController _leftColumnWidth](self, "_leftColumnWidth");
      -[UISplitViewController setMinimumPrimaryColumnWidth:](v14, "setMinimumPrimaryColumnWidth:");
      v15 = self->_splitVC;
      v16 = self->_rightVC;
      v34[0] = self->_leftVC;
      v34[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISplitViewController setViewControllers:](v15, "setViewControllers:", v17);

      -[UISplitViewController setDelegate:](self->_splitVC, "setDelegate:", self);
      -[SUUIExploreDocumentViewController addChildViewController:](self, "addChildViewController:", self->_splitVC);
      -[UISplitViewController view](self->_splitVC, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAutoresizingMask:", 18);
      -[SUUIExploreDocumentViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      objc_msgSend(v18, "setFrame:");

      -[SUUIExploreDocumentViewController view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addSubview:", v18);

    }
    navigationController = self->_navigationController;
    if (navigationController)
    {
      -[UINavigationController view](navigationController, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeFromSuperview");

      -[SUUIExploreDocumentViewController removeChildViewController:](self, "removeChildViewController:", self->_navigationController);
      -[UINavigationController setDelegate:](self->_navigationController, "setDelegate:", 0);
      v23 = self->_navigationController;
      self->_navigationController = 0;

    }
  }
  else
  {
    if (!self->_navigationController)
    {
      v24 = (UINavigationController *)objc_alloc_init(MEMORY[0x24BEBD7A0]);
      v25 = self->_navigationController;
      self->_navigationController = v24;

      -[UINavigationController setDelegate:](self->_navigationController, "setDelegate:", self);
      -[UINavigationController setNavigationBarHidden:animated:](self->_navigationController, "setNavigationBarHidden:animated:", 1, 0);
      -[SUUIExploreDocumentViewController addChildViewController:](self, "addChildViewController:", self->_navigationController);
      -[UINavigationController view](self->_navigationController, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAutoresizingMask:", 18);
      -[SUUIExploreDocumentViewController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      objc_msgSend(v26, "setFrame:");

      -[SUUIExploreDocumentViewController view](self, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addSubview:", v26);

    }
    v29 = self->_splitVC;
    if (v29)
    {
      -[UISplitViewController view](v29, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "removeFromSuperview");

      -[SUUIExploreDocumentViewController removeChildViewController:](self, "removeChildViewController:", self->_splitVC);
      -[UISplitViewController setDelegate:](self->_splitVC, "setDelegate:", 0);
      v31 = self->_splitVC;
      self->_splitVC = 0;

      -[UINavigationController setDelegate:](self->_leftVC, "setDelegate:", 0);
      v32 = self->_leftVC;
      self->_leftVC = 0;

      v33 = self->_rightVC;
      self->_rightVC = 0;

    }
  }
}

- (id)impressionableViewElements
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (-[SUUIExploreTemplateElement usesSplits](self->_exploreTemplate, "usesSplits"))
  {
    -[UINavigationController visibleViewController](self->_leftVC, "visibleViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "_impressionableViewElements");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    -[SUUIStorePageSectionsViewController _impressionableViewElements](self->_rightVC, "_impressionableViewElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (v4)
      {
        objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
        v7 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v7;
      }
      else
      {
        v4 = v5;
      }
    }

  }
  else
  {
    -[UINavigationController visibleViewController](self->_navigationController, "visibleViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "_impressionableViewElements");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  _BOOL4 IsEnabledForAuthorizationStatus;

  IsEnabledForAuthorizationStatus = SUUINearMeIsEnabledForAuthorizationStatus(a4);
  if (self->_nearMeEnabled != IsEnabledForAuthorizationStatus)
  {
    self->_nearMeEnabled = IsEnabledForAuthorizationStatus;
    if (-[SUUIExploreTemplateElement usesSplits](self->_exploreTemplate, "usesSplits"))
      -[SUUIExploreDocumentViewController _reloadRightViewController](self, "_reloadRightViewController");
    else
      -[SUUIExploreDocumentViewController _reloadData](self, "_reloadData");
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  NSUInteger v17;
  void *v18;
  void *v19;
  UINavigationController *v20;

  v20 = (UINavigationController *)a3;
  v7 = a4;
  if (self->_leftVC == v20)
  {
    objc_msgSend(v7, "contentScrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIContentInsetScrollView scrollIndicatorInsets](self->_contentScrollView, "scrollIndicatorInsets");
    SUUIScrollViewSetContentInsets(v8, "SUUIExploreDocumentViewController", v9, v10, v11, v12);

    SUUIStackedBarNavDidShow(v20, v7);
    -[UINavigationController viewControllers](v20, "viewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "indexOfObject:", v7);

    if (-[NSArray count](self->_contentOffsets, "count") > v14)
    {
      -[UINavigationController viewControllers](v20, "viewControllers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      v17 = -[NSArray count](self->_contentOffsets, "count");

      if (v16 == v17)
      {
        objc_msgSend(v7, "contentScrollView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndex:](self->_contentOffsets, "objectAtIndex:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "CGPointValue");
        objc_msgSend(v18, "setContentOffset:");

      }
    }
  }
  else
  {
    SUUIStackedBarNavDidShow(v20, v7);
  }

}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  UINavigationController *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v21;

  v10 = (UINavigationController *)a3;
  v11 = a5;
  v12 = a6;
  if (self->_leftVC != v10)
  {
    -[UINavigationController viewControllers](v10, "viewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a4 == 1)
    {
      if ((unint64_t)objc_msgSend(v13, "count") < 2)
        goto LABEL_13;
      objc_msgSend(v14, "objectAtIndex:", 1);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (v19 != v12)
        goto LABEL_13;
      v21 = 0;
      -[SUUIExploreDocumentViewController _getPageComponents:title:forViewControllerAtIndex:](self, "_getPageComponents:title:forViewControllerAtIndex:", 0, &v21, 0);
      v16 = v21;
      v17 = v11;
    }
    else
    {
      if (a4 != 2)
        goto LABEL_13;
      objc_msgSend(v13, "firstObject");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15 != v12)
        goto LABEL_13;
      -[SUUIExploreDocumentViewController _rootNavigationTitle](self, "_rootNavigationTitle");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
LABEL_12:

LABEL_13:
        SUUIStackedBarNavAnimationController(v10, a4, v11, v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
      v17 = v12;
    }
    objc_msgSend(v17, "setTitle:", v16);
    goto LABEL_12;
  }
  SUUIStackedBarNavAnimationController(v10, a4, v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v18;
}

- (BOOL)prefersNavigationBarBackgroundViewHidden
{
  return 0;
}

- (id)navigationBarTintColor
{
  return 0;
}

- (BOOL)prefersNavigationBarHidden
{
  return !-[SUUIExploreTemplateElement usesSplits](self->_exploreTemplate, "usesSplits");
}

- (void)stackedBar:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;

  if ((a4 & 0x8000000000000000) == 0)
  {
    -[SUUIExploreTemplateElement childViewElements](self->_exploreTemplate, "childViewElements", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 > a4)
    {
      -[SUUIExploreTemplateElement childViewElements](self->_exploreTemplate, "childViewElements");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", a4);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
    }
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  NSUInteger v17;
  void *v18;
  void *v19;
  UINavigationController *v20;

  v20 = (UINavigationController *)a3;
  v7 = a4;
  if (self->_leftVC == v20)
  {
    objc_msgSend(v7, "contentScrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIContentInsetScrollView scrollIndicatorInsets](self->_contentScrollView, "scrollIndicatorInsets");
    SUUIScrollViewSetContentInsets(v8, "SUUIExploreDocumentViewController", v9, v10, v11, v12);

    -[SUUIExploreDocumentViewController _reloadSelectionForViewController:](self, "_reloadSelectionForViewController:", v7);
    -[UINavigationController viewControllers](v20, "viewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "indexOfObject:", v7);

    if (-[NSArray count](self->_contentOffsets, "count") > v14)
    {
      -[UINavigationController viewControllers](v20, "viewControllers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      v17 = -[NSArray count](self->_contentOffsets, "count");

      if (v16 == v17)
      {
        objc_msgSend(v7, "contentScrollView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndex:](self->_contentOffsets, "objectAtIndex:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "CGPointValue");
        objc_msgSend(v18, "setContentOffset:");

      }
    }
  }

}

- (BOOL)splitViewController:(id)a3 shouldHideViewController:(id)a4 inOrientation:(int64_t)a5
{
  return 0;
}

- (void)_contentInsetDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  if (-[SUUIExploreTemplateElement usesSplits](self->_exploreTemplate, "usesSplits", a3))
  {
    -[UINavigationController viewControllers](self->_leftVC, "viewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "view");

    v7 = (id)-[SUUIStorePageSectionsViewController view](self->_rightVC, "view");
    -[SUUIContentInsetScrollView scrollIndicatorInsets](self->_contentScrollView, "scrollIndicatorInsets");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[SUUIStorePageSectionsViewController contentScrollView](self->_rightVC, "contentScrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIScrollViewSetContentInsets(v16, "SUUIExploreDocumentViewController", v9, v11, v13, v15);

    -[UINavigationController viewControllers](self->_leftVC, "viewControllers");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentScrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIScrollViewSetContentInsets(v18, "SUUIExploreDocumentViewController", v9, v11, 0.0, v15);

  }
}

- (id)_rootNavigationTitle
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  v11 = 0;
  -[SUUIExploreTemplateElement navigationBarElement](self->_exploreTemplate, "navigationBarElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__SUUIExploreDocumentViewController__rootNavigationTitle__block_invoke;
  v5[3] = &unk_2511F4B90;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateChildrenUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __57__SUUIExploreDocumentViewController__rootNavigationTitle__block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    v5 = v10;
    if (objc_msgSend(v5, "labelViewStyle") == 5)
    {
      objc_msgSend(v5, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "string");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
    v4 = v10;
  }

}

- (void)_getPageComponents:(id *)a3 title:(id *)a4 forViewControllerAtIndex:(int64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SUUIExploreTemplateElement childViewElements](self->_exploreTemplate, "childViewElements");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") <= (unint64_t)a5)
  {
    v10 = 0;
    v11 = 0;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v12, "objectAtIndex:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIExploreDocumentViewController _pageComponentsAtIndex:](self, "_pageComponentsAtIndex:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease(v10);
LABEL_6:
  if (a3)
    *a3 = objc_retainAutorelease(v11);

}

- (id)_newSectionsViewControllerAtIndex:(int64_t)a3
{
  id v5;
  id v6;
  SUUIStackedBar *v7;
  uint64_t v8;
  SUUIStorePageSectionsViewController *v9;
  void *v10;
  void *v11;
  id v13;
  id v14;

  v13 = 0;
  v14 = 0;
  -[SUUIExploreDocumentViewController _getPageComponents:title:forViewControllerAtIndex:](self, "_getPageComponents:title:forViewControllerAtIndex:", &v14, &v13, a3);
  v5 = v14;
  v6 = v13;
  v7 = objc_alloc_init(SUUIStackedBar);
  -[SUUIStackedBar setDelegate:](v7, "setDelegate:", self);
  -[SUUIStackedBar setSplitViewStyle:](v7, "setSplitViewStyle:", -[SUUIExploreTemplateElement usesSplits](self->_exploreTemplate, "usesSplits"));
  if (-[SUUIExploreTemplateElement usesSplits](self->_exploreTemplate, "usesSplits"))
    -[SUUIStackedBar setZeroHeightWhenFirstChildExpanded:](v7, "setZeroHeightWhenFirstChildExpanded:", a3 == 0);
  if (-[SUUIExploreTemplateElement usesSplits](self->_exploreTemplate, "usesSplits"))
    v8 = 2;
  else
    v8 = 0;
  v9 = -[SUUIStorePageSectionsViewController initWithLayoutStyle:]([SUUIStorePageSectionsViewController alloc], "initWithLayoutStyle:", v8);
  -[SUUIViewController clientContext](self, "clientContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewController setClientContext:](v9, "setClientContext:", v10);

  -[SUUIViewController operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewController setOperationQueue:](v9, "setOperationQueue:", v11);

  -[SUUIStorePageSectionsViewController setSectionsWithPageComponents:](v9, "setSectionsWithPageComponents:", v5);
  -[SUUIStorePageSectionsViewController setSUUIStackedBar:](v9, "setSUUIStackedBar:", v7);
  if (-[SUUIExploreTemplateElement usesSplits](self->_exploreTemplate, "usesSplits"))
    -[SUUIStorePageSectionsViewController setAutomaticallyAdjustsScrollViewInsets:](v9, "setAutomaticallyAdjustsScrollViewInsets:", 0);
  -[SUUIStorePageSectionsViewController setTitle:](v9, "setTitle:", v6);
  -[SUUIStorePageSectionsViewController setActiveMetricsImpressionSession:](v9, "setActiveMetricsImpressionSession:", self->_activeMetricsImpressionSession);

  return v9;
}

- (id)_pageComponentsAtIndex:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUUIExploreTemplateElement childViewElements](self->_exploreTemplate, "childViewElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __60__SUUIExploreDocumentViewController__pageComponentsAtIndex___block_invoke;
  v23[3] = &unk_2511F46F8;
  v8 = v5;
  v24 = v8;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v23);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v20;
    while (2)
    {
      v14 = 0;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
        if (objc_msgSend(v16, "componentType", (_QWORD)v19) == 16)
        {
          if (objc_msgSend(v15, "componentType") != 17)
            objc_msgSend(v16, "setShowTopBorder:", 1);
          v12 = v15;
          goto LABEL_14;
        }
        v12 = v16;

        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_14:

  v17 = v9;
  return v17;
}

void __60__SUUIExploreDocumentViewController__pageComponentsAtIndex___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (objc_class *)SUUIPageComponentClassForComponentType(objc_msgSend(v5, "pageComponentType"));
  if (v3)
  {
    v4 = (void *)objc_msgSend([v3 alloc], "initWithViewElement:", v5);
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
}

- (void)_reloadData
{
  uint64_t v3;
  CLLocationManager *v4;
  CLLocationManager *locationManager;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;

  if (!self->_locationManager)
  {
    v3 = SUUICoreLocationFramework();
    v4 = (CLLocationManager *)objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("CLLocationManager"), v3));
    locationManager = self->_locationManager;
    self->_locationManager = v4;

    -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
    objc_opt_class();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_nearMeEnabled = SUUINearMeIsEnabledForAuthorizationStatus(objc_msgSend(v6, "authorizationStatus"));

  }
  -[UINavigationController viewControllers](self->_navigationController, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIExploreTemplateElement childViewElements](self->_exploreTemplate, "childViewElements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    do
    {
      if (objc_msgSend(v7, "count") <= v11)
      {
        v14 = -[SUUIExploreDocumentViewController _newSectionsViewControllerAtIndex:](self, "_newSectionsViewControllerAtIndex:", v11);
      }
      else
      {
        v23 = 0;
        v24 = 0;
        -[SUUIExploreDocumentViewController _getPageComponents:title:forViewControllerAtIndex:](self, "_getPageComponents:title:forViewControllerAtIndex:", &v24, &v23, v11);
        v12 = v24;
        v13 = v23;
        objc_msgSend(v7, "objectAtIndex:", v11);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSectionsWithPageComponents:", v12);

      }
      -[SUUIExploreTemplateElement childViewElements](self->_exploreTemplate, "childViewElements");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16 == 1)
      {
        -[SUUIExploreDocumentViewController _rootNavigationTitle](self, "_rootNavigationTitle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v14, "setTitle:", v17);

      }
      objc_msgSend(v8, "addObject:", v14);

      ++v11;
      -[SUUIExploreTemplateElement childViewElements](self->_exploreTemplate, "childViewElements");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

    }
    while (v11 < v19);
  }
  if (objc_msgSend(v7, "count"))
  {
    v20 = objc_msgSend(v7, "count");
    if (v20 != objc_msgSend(v8, "count"))
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __48__SUUIExploreDocumentViewController__reloadData__block_invoke;
      v21[3] = &unk_2511F46D0;
      v21[4] = self;
      v22 = v8;
      dispatch_async(MEMORY[0x24BDAC9B8], v21);

    }
  }
  else
  {
    -[UINavigationController setViewControllers:animated:](self->_navigationController, "setViewControllers:animated:", v8, 0);
  }

}

uint64_t __48__SUUIExploreDocumentViewController__reloadData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setViewControllers:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (void)_reloadLeftViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  -[UINavigationController viewControllers](self->_leftVC, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIExploreTemplateElement childViewElements](self->_exploreTemplate, "childViewElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      if (objc_msgSend(v3, "count") <= v7)
      {
        v10 = -[SUUIExploreDocumentViewController _newSectionsViewControllerAtIndex:](self, "_newSectionsViewControllerAtIndex:", v7);
      }
      else
      {
        v16 = 0;
        v17 = 0;
        -[SUUIExploreDocumentViewController _getPageComponents:title:forViewControllerAtIndex:](self, "_getPageComponents:title:forViewControllerAtIndex:", &v17, &v16, v7);
        v8 = v17;
        v9 = v16;
        objc_msgSend(v3, "objectAtIndex:", v7);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTitle:", v9);
        objc_msgSend(v10, "setSectionsWithPageComponents:", v8);

      }
      objc_msgSend(v4, "addObject:", v10);

      ++v7;
      -[SUUIExploreTemplateElement childViewElements](self->_exploreTemplate, "childViewElements");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

    }
    while (v7 < v12);
  }
  if (objc_msgSend(v3, "count"))
  {
    v13 = objc_msgSend(v3, "count");
    if (v13 != objc_msgSend(v4, "count"))
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __63__SUUIExploreDocumentViewController__reloadLeftViewControllers__block_invoke;
      v14[3] = &unk_2511F46D0;
      v14[4] = self;
      v15 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], v14);

    }
  }
  else
  {
    -[UINavigationController setViewControllers:animated:](self->_leftVC, "setViewControllers:animated:", v4, 0);
  }

}

uint64_t __63__SUUIExploreDocumentViewController__reloadLeftViewControllers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setViewControllers:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (void)_reloadSelectionForViewController:(id)a3
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "pageComponent");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "viewElement");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isSelected");

        if (v8)
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "collectionView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "selectItemAtIndexPath:animated:scrollPosition:", v9, 0, 0);

        }
      }

      ++v4;
    }
    while (v4 < objc_msgSend(v3, "count"));
  }

}

- (void)_reloadRightViewController
{
  uint64_t v3;
  CLLocationManager *v4;
  CLLocationManager *locationManager;
  void *v6;
  SUUIStorePageSectionsViewController *rightVC;
  void *v8;
  id v9;

  if (!self->_locationManager)
  {
    v3 = SUUICoreLocationFramework();
    v4 = (CLLocationManager *)objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("CLLocationManager"), v3));
    locationManager = self->_locationManager;
    self->_locationManager = v4;

    -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
    objc_opt_class();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_nearMeEnabled = SUUINearMeIsEnabledForAuthorizationStatus(objc_msgSend(v6, "authorizationStatus"));

  }
  rightVC = self->_rightVC;
  -[SUUIExploreDocumentViewController _rightPageComponents](self, "_rightPageComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionsViewController setSectionsWithPageComponents:](rightVC, "setSectionsWithPageComponents:", v8);

  -[SUUIExploreDocumentViewController _rightVCColorScheme](self, "_rightVCColorScheme");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionsViewController setColorScheme:](self->_rightVC, "setColorScheme:", v9);

}

- (double)_leftColumnWidth
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v12;
  CGRect v13;

  objc_msgSend(MEMORY[0x24BEBDB58], "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  if (CGRectGetWidth(v12) >= 1024.0
    && (v13.origin.x = v4, v13.origin.y = v6, v13.size.width = v8, v13.size.height = v10, CGRectGetHeight(v13) >= 1024.0))
  {
    return 375.0;
  }
  else
  {
    return 300.0;
  }
}

- (id)_leftPageComponentsAtIndex:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  objc_class *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUUIExploreTemplateElement childViewElements](self->_exploreTemplate, "childViewElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "flattenedChildren");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v15 = (objc_class *)SUUIPageComponentClassForComponentType(objc_msgSend(v14, "pageComponentType"));
        if (v15)
        {
          v16 = (void *)objc_msgSend([v15 alloc], "initWithViewElement:", v14);
          if (v16)
          {
            objc_msgSend(v5, "addObject:", v16);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v16, "setIndex:", v11++);
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v5;
}

- (id)_rightPageComponents
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUUIExploreTemplateElement rightSplit](self->_exploreTemplate, "rightSplit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__SUUIExploreDocumentViewController__rightPageComponents__block_invoke;
  v7[3] = &unk_2511F46F8;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateChildrenUsingBlock:", v7);

  return v5;
}

void __57__SUUIExploreDocumentViewController__rightPageComponents__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (objc_class *)SUUIPageComponentClassForComponentType(objc_msgSend(v5, "pageComponentType"));
  if (v3)
  {
    v4 = (void *)objc_msgSend([v3 alloc], "initWithViewElement:", v5);
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
}

- (id)_rightVCColorScheme
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  SUUIColorScheme *v6;

  -[SUUIExploreTemplateElement rightSplit](self->_exploreTemplate, "rightSplit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ikBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(SUUIColorScheme);
    -[SUUIColorScheme setBackgroundColor:](v6, "setBackgroundColor:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_beginActiveImpressionsForImpressionableViewElements
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[SUUIExploreDocumentViewController impressionableViewElements](self, "impressionableViewElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[SUUIMetricsImpressionSession beginActiveImpressionForViewElement:](self->_activeMetricsImpressionSession, "beginActiveImpressionForViewElement:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_endAllPendingActiveImpression
{
  -[SUUIMetricsImpressionSession endAllPendingActiveImpression](self->_activeMetricsImpressionSession, "endAllPendingActiveImpression");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitVC, 0);
  objc_storeStrong((id *)&self->_rightVC, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_leftVC, 0);
  objc_storeStrong((id *)&self->_exploreTemplate, 0);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_contentOffsets, 0);
  objc_storeStrong((id *)&self->_activeMetricsImpressionSession, 0);
}

@end
