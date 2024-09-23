@implementation SUUIMenuBarTemplateDocumentViewController

- (SUUIMenuBarTemplateDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5;
  SUUIMenuBarTemplateDocumentViewController *v6;
  SUUIMenuBarTemplateDocumentViewController *v7;
  uint64_t v8;
  SUUIMenuBarViewElement *menuBarViewElement;
  uint64_t v10;
  SUUIMenuBarViewElementConfiguration *menuBarViewElementConfiguration;
  uint64_t v12;
  SUUIMenuItemViewElement *pendingSelectedMenuItemViewElement;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIMenuBarTemplateDocumentViewController;
  v6 = -[SUUIMenuBarTemplateDocumentViewController init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_templateElement, a3);
    -[SUUIMenuBarTemplateElement menuBar](v7->_templateElement, "menuBar");
    v8 = objc_claimAutoreleasedReturnValue();
    menuBarViewElement = v7->_menuBarViewElement;
    v7->_menuBarViewElement = (SUUIMenuBarViewElement *)v8;

    -[SUUIMenuBarViewElement configuration](v7->_menuBarViewElement, "configuration");
    v10 = objc_claimAutoreleasedReturnValue();
    menuBarViewElementConfiguration = v7->_menuBarViewElementConfiguration;
    v7->_menuBarViewElementConfiguration = (SUUIMenuBarViewElementConfiguration *)v10;

    -[SUUIMenuBarViewElementConfiguration setDelegate:](v7->_menuBarViewElementConfiguration, "setDelegate:", v7);
    -[SUUIMenuBarViewElementConfiguration selectedMenuItemViewElement](v7->_menuBarViewElementConfiguration, "selectedMenuItemViewElement");
    v12 = objc_claimAutoreleasedReturnValue();
    pendingSelectedMenuItemViewElement = v7->_pendingSelectedMenuItemViewElement;
    v7->_pendingSelectedMenuItemViewElement = (SUUIMenuItemViewElement *)v12;

    v7->_scrollingTabAppearanceStatus.progress = 1.0;
    *(_QWORD *)&v7->_scrollingTabAppearanceStatus.isBouncingOffTheEdge = 0;
    -[SUUIMenuBarTemplateDocumentViewController _reloadContentViewController](v7, "_reloadContentViewController");
  }

  return v7;
}

- (void)dealloc
{
  SUUIScrollingSegmentedController *scrollingSegmentedController;
  SUUIHorizontalScrollingContainerViewController *horizontalScrollingContainerViewController;
  objc_super v5;

  scrollingSegmentedController = self->_scrollingSegmentedController;
  if (scrollingSegmentedController)
  {
    -[SUUIScrollingSegmentedController setDelegate:](scrollingSegmentedController, "setDelegate:", 0);
    -[SUUIMenuBarTemplateDocumentViewController _removeContentViewController:](self, "_removeContentViewController:", self->_scrollingSegmentedController);
  }
  horizontalScrollingContainerViewController = self->_horizontalScrollingContainerViewController;
  if (horizontalScrollingContainerViewController)
  {
    -[SUUIHorizontalScrollingContainerViewController setDelegate:](horizontalScrollingContainerViewController, "setDelegate:", 0);
    -[SUUIMenuBarTemplateDocumentViewController _removeContentViewController:](self, "_removeContentViewController:", self->_horizontalScrollingContainerViewController);
  }
  v5.receiver = self;
  v5.super_class = (Class)SUUIMenuBarTemplateDocumentViewController;
  -[SUUIViewController dealloc](&v5, sel_dealloc);
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SUUIMenuBarTemplateDocumentViewController;
  -[SUUIMenuBarTemplateDocumentViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_);
  -[SUUIHorizontalScrollingContainerViewController setPreferredContentSize:](self->_horizontalScrollingContainerViewController, "setPreferredContentSize:", width, height);
  -[SUUIScrollingSegmentedController setPreferredContentSize:](self->_scrollingSegmentedController, "setPreferredContentSize:", width, height);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIMenuBarTemplateDocumentViewController;
  -[SUUIMenuBarTemplateDocumentViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[SUUIMenuBarTemplateDocumentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIMenuBarTemplateDocumentViewController _contentViewController](self, "_contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    objc_msgSend(v6, "setFrame:");
    objc_msgSend(v6, "setAutoresizingMask:", 18);
    objc_msgSend(v3, "addSubview:", v6);

  }
}

- (id)contentScrollView
{
  void *v2;
  void *v3;

  -[SUUIMenuBarTemplateDocumentViewController _contentViewController](self, "_contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setClientContext:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUUIMenuBarTemplateDocumentViewController;
  -[SUUIViewController setClientContext:](&v6, sel_setClientContext_, v4);
  -[SUUIViewController setClientContext:](self->_menuBarSectionsViewController, "setClientContext:", v4);
  v5 = self->_menuBarStyle - 1;
  if (v5 <= 2)
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *off_2511F45A8[v5]), "setClientContext:", v4);

}

- (void)setOperationQueue:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUUIMenuBarTemplateDocumentViewController;
  -[SUUIViewController setOperationQueue:](&v6, sel_setOperationQueue_, v4);
  -[SUUIViewController setOperationQueue:](self->_menuBarSectionsViewController, "setOperationQueue:", v4);
  v5 = self->_menuBarStyle - 1;
  if (v5 <= 2)
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *off_2511F45A8[v5]), "setOperationQueue:", v4);

}

- (void)documentDidUpdate:(id)a3
{
  SUUIMenuBarViewElementConfiguration *menuBarViewElementConfiguration;
  id v5;
  SUUIMenuBarTemplateElement *v6;
  SUUIMenuBarTemplateElement *templateElement;
  SUUIMenuBarViewElement *v8;
  SUUIMenuBarViewElement *menuBarViewElement;
  SUUIMenuBarViewElementConfiguration *v10;
  SUUIMenuBarViewElementConfiguration *v11;
  SUUIDynamicPageSectionIndexMapper *dynamicPageSectionIndexMapper;
  void *v13;

  menuBarViewElementConfiguration = self->_menuBarViewElementConfiguration;
  v5 = a3;
  -[SUUIMenuBarViewElementConfiguration setDelegate:](menuBarViewElementConfiguration, "setDelegate:", 0);
  objc_msgSend(v5, "templateElement");
  v6 = (SUUIMenuBarTemplateElement *)objc_claimAutoreleasedReturnValue();

  templateElement = self->_templateElement;
  self->_templateElement = v6;

  -[SUUIMenuBarTemplateElement menuBar](self->_templateElement, "menuBar");
  v8 = (SUUIMenuBarViewElement *)objc_claimAutoreleasedReturnValue();
  menuBarViewElement = self->_menuBarViewElement;
  self->_menuBarViewElement = v8;

  -[SUUIMenuBarViewElement configuration](self->_menuBarViewElement, "configuration");
  v10 = (SUUIMenuBarViewElementConfiguration *)objc_claimAutoreleasedReturnValue();
  v11 = self->_menuBarViewElementConfiguration;
  self->_menuBarViewElementConfiguration = v10;

  -[SUUIMenuBarViewElementConfiguration setDelegate:](self->_menuBarViewElementConfiguration, "setDelegate:", self);
  dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
  -[SUUIViewElement entityProvider](self->_menuBarViewElement, "entityProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDynamicPageSectionIndexMapper setEntityProvider:](dynamicPageSectionIndexMapper, "setEntityProvider:", v13);

  -[SUUIMenuBarTemplateDocumentViewController _reloadContentViewController](self, "_reloadContentViewController");
}

- (void)documentMediaQueriesDidUpdate:(id)a3
{
  SUUIMenuBarSectionsViewController *menuBarSectionsViewController;
  void *v5;

  menuBarSectionsViewController = self->_menuBarSectionsViewController;
  -[SUUIMenuBarTemplateDocumentViewController _colorScheme](self, "_colorScheme", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionsViewController setColorScheme:](menuBarSectionsViewController, "setColorScheme:", v5);

  -[SUUIStorePageSectionsViewController invalidateAndReload](self->_menuBarSectionsViewController, "invalidateAndReload");
}

- (id)navigationPaletteView
{
  SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *v3;
  void *v4;
  SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *embeddedPaletteHost;
  SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *v6;
  double v7;
  SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *v8;
  SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *v9;
  void *v10;

  if (-[SUUIMenuBarTemplateDocumentViewController _isFirstViewControllerOnNavigationStack](self, "_isFirstViewControllerOnNavigationStack"))
  {
    -[SUUIMenuBarSectionsViewController view](self->_menuBarSectionsViewController, "view");
    v3 = (SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *)objc_claimAutoreleasedReturnValue();
    -[SUUIMenuBarSectionsViewController contentScrollView](self->_menuBarSectionsViewController, "contentScrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost layoutIfNeeded](v3, "layoutIfNeeded");
    objc_msgSend(v4, "layoutIfNeeded");
    objc_msgSend(v4, "contentSize");
    -[SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost frame](v3, "frame");
    -[SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost setFrame:](v3, "setFrame:");

  }
  else
  {
    embeddedPaletteHost = self->_embeddedPaletteHost;
    if (!embeddedPaletteHost)
    {
      v6 = [SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost alloc];
      -[SUUIMenuBarTemplateDocumentViewController titleViewHeight](self, "titleViewHeight");
      v8 = -[SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost initWithFrame:](v6, "initWithFrame:", 0.0, 0.0, 0.0, v7 + 7.0);
      v9 = self->_embeddedPaletteHost;
      self->_embeddedPaletteHost = v8;

      -[SUUIMenuBarTemplateDocumentViewController titleView](self, "titleView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sizeToFit");
      -[SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost setTitleView:](self->_embeddedPaletteHost, "setTitleView:", v10);

      embeddedPaletteHost = self->_embeddedPaletteHost;
    }
    v3 = embeddedPaletteHost;
  }
  return v3;
}

- (void)horizontalScrollingContainerViewController:(id)a3 willDisplayViewControllerAtIndex:(unint64_t)a4
{
  -[SUUIMenuBarTemplateDocumentViewController _willDisplayViewControllerAtIndex:](self, "_willDisplayViewControllerAtIndex:", a4);
}

- (void)menuBarViewElementConfiguration:(id)a3 didReplaceDocumentForEntityUniqueIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v17 = a3;
  v6 = a4;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_entityUniqueIdentifierToEntityIndex, "objectForKey:", v6, v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_3;
    -[SUUIMenuBarTemplateDocumentViewController _dynamicPageSectionIndexMapper](self, "_dynamicPageSectionIndexMapper");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_5;
    v10 = (void *)v11;
    -[SUUIViewElement entityProvider](self->_menuBarViewElement, "entityProvider");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v10, "totalNumberOfEntities");
    if (!v18)
      goto LABEL_4;
    v7 = 0;
    for (i = 0; i != v18; ++i)
    {
      objc_msgSend(v10, "entityIndexPathForGlobalIndex:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "entityValueProviderAtIndexPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "entityUniqueIdentifier");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[SUUIMenuBarTemplateDocumentViewController _recordEntityUniqueIdentifier:forEntityIndex:](self, "_recordEntityUniqueIdentifier:forEntityIndex:", v15, i);
      if (v15 == v6 || objc_msgSend(v15, "isEqual:", v6))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
        v16 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v16;
      }

    }
    if (v7)
    {
LABEL_3:
      v8 = objc_msgSend(v7, "unsignedIntegerValue");
      v9 = -[SUUIMenuBarTemplateDocumentViewController _newChildViewControllerForEntityAtIndex:](self, "_newChildViewControllerForEntityAtIndex:", v8);
      -[SUUIMenuBarTemplateDocumentViewController _replaceViewControllerAtIndex:withViewController:](self, "_replaceViewControllerAtIndex:withViewController:", v8, v9);
      v10 = v7;
LABEL_4:

    }
  }
LABEL_5:

}

- (void)menuBarViewElementConfiguration:(id)a3 didReplaceDocumentForMenuItemAtIndex:(unint64_t)a4
{
  id v6;

  v6 = -[SUUIMenuBarTemplateDocumentViewController _newChildViewControllerForEntityAtIndex:](self, "_newChildViewControllerForEntityAtIndex:", a4);
  -[SUUIMenuBarTemplateDocumentViewController _replaceViewControllerAtIndex:withViewController:](self, "_replaceViewControllerAtIndex:withViewController:", a4, v6);

}

- (void)menuBarViewElementConfiguration:(id)a3 selectMenuItemViewElement:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  if (self->_scrollingSegmentedController)
  {
    v9 = objc_msgSend(v10, "indexOfMenuItemViewElement:", v8);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      -[SUUIScrollingSegmentedController selectViewControllerAtIndex:animated:](self->_scrollingSegmentedController, "selectViewControllerAtIndex:animated:", v9, v5);
  }
  else
  {
    objc_storeStrong((id *)&self->_pendingSelectedMenuItemViewElement, a4);
  }

}

- (id)navigationBarControllerWithViewElement:(id)a3
{
  id v4;
  SUUIMenuBarNavigationBarController *v5;
  void *v6;

  v4 = a3;
  v5 = -[SUUINavigationBarController initWithNavigationBarViewElement:]([SUUIMenuBarNavigationBarController alloc], "initWithNavigationBarViewElement:", v4);

  if (-[SUUIMenuBarTemplateDocumentViewController _isFirstViewControllerOnNavigationStack](self, "_isFirstViewControllerOnNavigationStack"))
  {
    -[SUUIMenuBarTemplateDocumentViewController titleView](self, "titleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMenuBarNavigationBarController setTitleView:](v5, "setTitleView:", v6);

  }
  return v5;
}

- (void)scrollingSegmentedController:(id)a3 willDisplayViewControllerAtIndex:(unint64_t)a4
{
  -[SUUIMenuBarTemplateDocumentViewController _willDisplayViewControllerAtIndex:](self, "_willDisplayViewControllerAtIndex:", a4);
}

- (void)scrollingTabAppearanceStatusWasUpdated:(id)a3
{
  self->_scrollingTabAppearanceStatus = ($D35E09B864CB17FEE2308AEA3FA0107F)a3;
  -[SUUIScrollingSegmentedController scrollingTabAppearanceStatusWasUpdated:](self->_scrollingSegmentedController, "scrollingTabAppearanceStatusWasUpdated:");
}

- (UIScrollView)scrollingTabNestedPagingScrollView
{
  return -[SUUIScrollingSegmentedController scrollingTabNestedPagingScrollView](self->_scrollingSegmentedController, "scrollingTabNestedPagingScrollView");
}

- (id)scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3
{
  return -[SUUIScrollingSegmentedController scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:](self->_scrollingSegmentedController, "scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:", a3);
}

- (UIView)titleView
{
  return (UIView *)-[SUUIScrollingSegmentedController navigationBarTitleView](self->_scrollingSegmentedController, "navigationBarTitleView");
}

- (double)titleViewHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  -[SUUIScrollingSegmentedController navigationBarTitleView](self->_scrollingSegmentedController, "navigationBarTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;
  v7 = v6;

  -[SUUIScrollingSegmentedController navigationBarTitleView](self->_scrollingSegmentedController, "navigationBarTitleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "segmentedControlMinimumHeight");
  v10 = v9;

  return v7 + v5 + v10;
}

- (void)_addContentViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SUUIMenuBarTemplateDocumentViewController addChildViewController:](self, "addChildViewController:", v7);
    if (-[SUUIMenuBarTemplateDocumentViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SUUIMenuBarTemplateDocumentViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      objc_msgSend(v6, "setFrame:");
      objc_msgSend(v6, "setAutoresizingMask:", 18);
      objc_msgSend(v5, "addSubview:", v6);

    }
    objc_msgSend(v7, "didMoveToParentViewController:", self);
  }

}

- (id)_childViewControllersForMenuItems
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUUIMenuBarTemplateDocumentViewController _dynamicPageSectionIndexMapper](self, "_dynamicPageSectionIndexMapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "totalNumberOfEntities");
  else
    v6 = -[SUUIMenuBarViewElementConfiguration numberOfMenuItems](self->_menuBarViewElementConfiguration, "numberOfMenuItems");
  v7 = v6;
  if (v6)
  {
    v8 = 0;
    do
    {
      v9 = -[SUUIMenuBarTemplateDocumentViewController _newChildViewControllerForEntityAtIndex:](self, "_newChildViewControllerForEntityAtIndex:", v8);
      objc_msgSend(v3, "addObject:", v9);

      ++v8;
    }
    while (v7 != v8);
  }

  return v3;
}

- (id)_colorScheme
{
  void *v2;
  void *v3;
  void *v4;
  SUUIColorScheme *v5;

  -[SUUIMenuBarTemplateElement style](self->_templateElement, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ikBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_alloc_init(SUUIColorScheme);
  -[SUUIColorScheme setBackgroundColor:](v5, "setBackgroundColor:", v4);

  return v5;
}

- (id)_contentViewController
{
  unint64_t v2;

  v2 = self->_menuBarStyle - 1;
  if (v2 > 2)
    return 0;
  else
    return objc_autoreleaseReturnValue(objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                                                         + *off_2511F45A8[v2])));
}

- (id)_dynamicPageSectionIndexMapper
{
  SUUIDynamicPageSectionIndexMapper *v3;
  SUUIDynamicPageSectionIndexMapper *dynamicPageSectionIndexMapper;
  SUUIDynamicPageSectionIndexMapper *v5;
  void *v6;

  if (!self->_dynamicPageSectionIndexMapper
    && -[SUUIViewElement isDynamicContainer](self->_menuBarViewElement, "isDynamicContainer"))
  {
    v3 = objc_alloc_init(SUUIDynamicPageSectionIndexMapper);
    dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
    self->_dynamicPageSectionIndexMapper = v3;

    v5 = self->_dynamicPageSectionIndexMapper;
    -[SUUIViewElement entityProvider](self->_menuBarViewElement, "entityProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDynamicPageSectionIndexMapper setEntityProvider:](v5, "setEntityProvider:", v6);

  }
  return self->_dynamicPageSectionIndexMapper;
}

- (unint64_t)_menuItemIndexForEntityIndex:(unint64_t)a3 entityValueProvider:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SUUIMenuBarTemplateDocumentViewController _dynamicPageSectionIndexMapper](self, "_dynamicPageSectionIndexMapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v10 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[SUUIViewElement entityProvider](self->_menuBarViewElement, "entityProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entityIndexPathForGlobalIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entityValueProviderAtIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  a3 = 0;
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v10);
LABEL_4:

  return a3;
}

- (id)_newChildViewControllerForEntityAtIndex:(unint64_t)a3
{
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SUUIDocumentContainerViewController *v11;
  void *v12;
  SUUIDocumentContainerViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v18 = 0;
  v5 = -[SUUIMenuBarTemplateDocumentViewController _menuItemIndexForEntityIndex:entityValueProvider:](self, "_menuItemIndexForEntityIndex:entityValueProvider:", a3, &v18);
  v6 = v18;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "entityUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMenuBarTemplateDocumentViewController _recordEntityUniqueIdentifier:forEntityIndex:](self, "_recordEntityUniqueIdentifier:forEntityIndex:", v8, a3);
    -[SUUIMenuBarViewElementConfiguration documentForEntityUniqueIdentifier:](self->_menuBarViewElementConfiguration, "documentForEntityUniqueIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMenuBarViewElementConfiguration documentOptionsForEntityUniqueIdentifier:](self->_menuBarViewElementConfiguration, "documentOptionsForEntityUniqueIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_6;
LABEL_5:
    v11 = [SUUIDocumentContainerViewController alloc];
    -[SUUIViewController clientContext](self, "clientContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SUUIDocumentContainerViewController initWithDocument:options:clientContext:](v11, "initWithDocument:options:clientContext:", v9, v10, v12);

    if (v13)
      goto LABEL_7;
    goto LABEL_6;
  }
  -[SUUIMenuBarViewElementConfiguration documentForMenuItemAtIndex:](self->_menuBarViewElementConfiguration, "documentForMenuItemAtIndex:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIMenuBarViewElementConfiguration documentOptionsForMenuItemAtIndex:](self->_menuBarViewElementConfiguration, "documentOptionsForMenuItemAtIndex:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_5;
LABEL_6:
  v13 = (SUUIDocumentContainerViewController *)objc_alloc_init(MEMORY[0x24BEBDB08]);
LABEL_7:
  if (self->_menuBarStyle == 1)
  {
    -[SUUIMenuBarViewElement titleForMenuItemAtIndex:](self->_menuBarViewElement, "titleForMenuItemAtIndex:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDocumentContainerViewController setTitle:](v13, "setTitle:", v16);

  }
  return v13;
}

- (void)_recordEntityUniqueIdentifier:(id)a3 forEntityIndex:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *entityUniqueIdentifierToEntityIndex;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v6 = a3;
  if (v6)
  {
    v11 = v6;
    entityUniqueIdentifierToEntityIndex = self->_entityUniqueIdentifierToEntityIndex;
    if (!entityUniqueIdentifierToEntityIndex)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v9 = self->_entityUniqueIdentifierToEntityIndex;
      self->_entityUniqueIdentifierToEntityIndex = v8;

      entityUniqueIdentifierToEntityIndex = self->_entityUniqueIdentifierToEntityIndex;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](entityUniqueIdentifierToEntityIndex, "setObject:forKey:", v10, v11);

    v6 = v11;
  }

}

- (void)_reloadContentViewController
{
  int64_t v3;
  int64_t menuBarStyle;
  SUUIScrollingSegmentedController **p_scrollingSegmentedController;
  uint64_t v6;
  SUUIScrollingSegmentedController *v7;
  SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *embeddedPaletteHost;
  SUUIScrollingSegmentedController *scrollingSegmentedController;
  void *pendingSelectedMenuItemViewElement;
  void *v11;
  SUUILoadingDocumentViewController *v12;
  SUUILoadingDocumentViewController *loadingDocumentViewController;
  SUUILoadingDocumentViewController *v14;
  void *v15;
  SUUILoadingDocumentViewController *v16;
  void *v17;
  SUUILoadingDocumentViewController *v18;
  SUUIHorizontalScrollingContainerViewController *horizontalScrollingContainerViewController;
  SUUIHorizontalScrollingContainerViewController *v20;
  SUUIHorizontalScrollingContainerViewController *v21;
  void *v22;
  SUUIMenuBarSectionsViewController *menuBarSectionsViewController;
  SUUIMenuBarSectionsViewController *v24;
  SUUIMenuBarSectionsViewController *v25;
  SUUIMenuBarSectionsViewController *v26;
  void *v27;
  SUUIMenuBarSectionsViewController *v28;
  void *v29;
  SUUIMenuBarSectionsViewController *v30;
  void *v31;
  SUUIScrollingSegmentedController *v32;
  SUUIScrollingSegmentedController *v33;
  SUUIScrollingSegmentedController *v34;
  void *v35;
  SUUIScrollingSegmentedController *v36;
  void *v37;
  SUUIScrollingSegmentedController *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  float v46;
  void *v47;
  void *v48;
  SUUIMenuBarSectionsViewController *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  CGRect v56;

  v3 = -[SUUIMenuBarViewElementConfiguration menuBarStyle](self->_menuBarViewElementConfiguration, "menuBarStyle");
  menuBarStyle = self->_menuBarStyle;
  if (menuBarStyle != v3)
  {
    switch(menuBarStyle)
    {
      case 3:
        v6 = 1072;
        break;
      case 2:
        -[SUUIHorizontalScrollingContainerViewController setDelegate:](self->_horizontalScrollingContainerViewController, "setDelegate:", 0);
        -[SUUIMenuBarTemplateDocumentViewController _removeContentViewController:](self, "_removeContentViewController:", self->_horizontalScrollingContainerViewController);
        v6 = 1080;
        break;
      case 1:
        p_scrollingSegmentedController = &self->_scrollingSegmentedController;
        -[SUUIScrollingSegmentedController setDelegate:](self->_scrollingSegmentedController, "setDelegate:", 0);
LABEL_9:
        -[SUUIMenuBarTemplateDocumentViewController _removeContentViewController:](self, "_removeContentViewController:", *p_scrollingSegmentedController);
        v7 = *p_scrollingSegmentedController;
        *p_scrollingSegmentedController = 0;

        goto LABEL_10;
      default:
LABEL_10:
        embeddedPaletteHost = self->_embeddedPaletteHost;
        self->_embeddedPaletteHost = 0;

        goto LABEL_11;
    }
    p_scrollingSegmentedController = (SUUIScrollingSegmentedController **)((char *)self + v6);
    goto LABEL_9;
  }
LABEL_11:
  self->_menuBarStyle = v3;
  if (v3 == 3)
  {
    if (self->_loadingDocumentViewController)
      return;
    -[SUUIViewElement firstChildForElementType:](self->_menuBarViewElement, "firstChildForElementType:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SUUILoadingDocumentViewController initWithActivityIndicatorElement:]([SUUILoadingDocumentViewController alloc], "initWithActivityIndicatorElement:", v11);
    loadingDocumentViewController = self->_loadingDocumentViewController;
    self->_loadingDocumentViewController = v12;

    v14 = self->_loadingDocumentViewController;
    -[SUUIViewController clientContext](self, "clientContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewController setClientContext:](v14, "setClientContext:", v15);

    v16 = self->_loadingDocumentViewController;
    -[SUUIViewController operationQueue](self, "operationQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewController setOperationQueue:](v16, "setOperationQueue:", v17);

    v18 = self->_loadingDocumentViewController;
LABEL_36:

    if (!v18)
      return;
    goto LABEL_37;
  }
  if (v3 != 2)
  {
    if (v3 != 1)
      return;
    scrollingSegmentedController = self->_scrollingSegmentedController;
    if (scrollingSegmentedController)
    {
      -[SUUIMenuBarTemplateDocumentViewController _childViewControllersForMenuItems](self, "_childViewControllersForMenuItems");
      pendingSelectedMenuItemViewElement = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIScrollingSegmentedController setViewControllers:](scrollingSegmentedController, "setViewControllers:", pendingSelectedMenuItemViewElement);
    }
    else
    {
      v32 = objc_alloc_init(SUUIScrollingSegmentedController);
      v33 = self->_scrollingSegmentedController;
      self->_scrollingSegmentedController = v32;

      v34 = self->_scrollingSegmentedController;
      -[SUUIViewController clientContext](self, "clientContext");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIScrollingSegmentedController setClientContext:](v34, "setClientContext:", v35);

      v36 = self->_scrollingSegmentedController;
      -[SUUIViewController operationQueue](self, "operationQueue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewController setOperationQueue:](v36, "setOperationQueue:", v37);

      -[SUUIScrollingSegmentedController setDelegate:](self->_scrollingSegmentedController, "setDelegate:", self);
      -[SUUIScrollingSegmentedController scrollingTabAppearanceStatusWasUpdated:](self->_scrollingSegmentedController, "scrollingTabAppearanceStatusWasUpdated:", *(_QWORD *)&self->_scrollingTabAppearanceStatus.progress, *(_QWORD *)&self->_scrollingTabAppearanceStatus.isBouncingOffTheEdge);
      v38 = self->_scrollingSegmentedController;
      -[SUUIMenuBarTemplateDocumentViewController _childViewControllersForMenuItems](self, "_childViewControllersForMenuItems");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIScrollingSegmentedController setViewControllers:](v38, "setViewControllers:", v39);

      if (!self->_pendingSelectedMenuItemViewElement)
        goto LABEL_29;
      v40 = -[SUUIMenuBarViewElementConfiguration indexOfMenuItemViewElement:](self->_menuBarViewElementConfiguration, "indexOfMenuItemViewElement:");
      if (v40 != 0x7FFFFFFFFFFFFFFFLL)
        -[SUUIScrollingSegmentedController selectViewControllerAtIndex:animated:](self->_scrollingSegmentedController, "selectViewControllerAtIndex:animated:", v40, 0);
      pendingSelectedMenuItemViewElement = self->_pendingSelectedMenuItemViewElement;
      self->_pendingSelectedMenuItemViewElement = 0;
    }

LABEL_29:
    -[SUUIMenuBarViewElement style](self->_menuBarViewElement, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForStyle:", *MEMORY[0x24BE518E8]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIScrollingSegmentedController navigationBarTitleView](self->_scrollingSegmentedController, "navigationBarTitleView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v41)
    {
      objc_msgSend(v42, "setLayoutStyle:", 1);
      objc_msgSend(v41, "UIEdgeInsetsValue");
    }
    else
    {
      objc_msgSend(v42, "setLayoutStyle:", 0);
      v55 = 0;
      v44 = SUUIViewElementPaddingForStyle(v11, &v55);
      if (!v55)
      {
LABEL_33:
        objc_msgSend(v11, "valueForStyle:", *MEMORY[0x24BE518D8], v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v45, "length"))
        {
          objc_msgSend(v45, "floatValue");
          objc_msgSend(v43, "setSegmentedControlMinimumHeight:", v46);
        }
        v18 = self->_scrollingSegmentedController;

        goto LABEL_36;
      }
    }
    objc_msgSend(v43, "setLayoutMargins:");
    goto LABEL_33;
  }
  horizontalScrollingContainerViewController = self->_horizontalScrollingContainerViewController;
  if (!horizontalScrollingContainerViewController)
  {
    v20 = objc_alloc_init(SUUIHorizontalScrollingContainerViewController);
    v21 = self->_horizontalScrollingContainerViewController;
    self->_horizontalScrollingContainerViewController = v20;

    -[SUUIHorizontalScrollingContainerViewController setDelegate:](self->_horizontalScrollingContainerViewController, "setDelegate:", self);
    horizontalScrollingContainerViewController = self->_horizontalScrollingContainerViewController;
  }
  -[SUUIMenuBarTemplateDocumentViewController _childViewControllersForMenuItems](self, "_childViewControllersForMenuItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIHorizontalScrollingContainerViewController setViewControllers:](horizontalScrollingContainerViewController, "setViewControllers:", v22);

  menuBarSectionsViewController = self->_menuBarSectionsViewController;
  if (!menuBarSectionsViewController)
  {
    v24 = -[SUUIMenuBarSectionsViewController initWithLayoutStyle:]([SUUIMenuBarSectionsViewController alloc], "initWithLayoutStyle:", 0);
    v25 = self->_menuBarSectionsViewController;
    self->_menuBarSectionsViewController = v24;

    v26 = self->_menuBarSectionsViewController;
    -[SUUIViewController clientContext](self, "clientContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewController setClientContext:](v26, "setClientContext:", v27);

    v28 = self->_menuBarSectionsViewController;
    -[SUUIViewController operationQueue](self, "operationQueue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewController setOperationQueue:](v28, "setOperationQueue:", v29);

    v30 = self->_menuBarSectionsViewController;
    -[SUUIMenuBarTemplateDocumentViewController preferredContentSize](self, "preferredContentSize");
    -[SUUIMenuBarSectionsViewController setPreferredContentSize:](v30, "setPreferredContentSize:");
    -[SUUIMenuBarSectionsViewController view](self->_menuBarSectionsViewController, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "frame");
    if (CGRectIsEmpty(v56))
    {
      if (-[SUUIMenuBarTemplateDocumentViewController isViewLoaded](self, "isViewLoaded"))
        -[SUUIMenuBarTemplateDocumentViewController view](self, "view");
      else
        objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bounds");
      objc_msgSend(v31, "setFrame:");

    }
    menuBarSectionsViewController = self->_menuBarSectionsViewController;
  }
  -[SUUIMenuBarTemplateDocumentViewController _colorScheme](self, "_colorScheme");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionsViewController setColorScheme:](menuBarSectionsViewController, "setColorScheme:", v48);

  -[SUUIMenuBarSectionsViewController setNumberOfIterationsForShelfPageSections:](self->_menuBarSectionsViewController, "setNumberOfIterationsForShelfPageSections:", 1);
  -[SUUIStorePageSectionsViewController _setRendersWithPerspective:](self->_menuBarSectionsViewController, "_setRendersWithPerspective:", -[SUUIViewElement rendersWithPerspective](self->_templateElement, "rendersWithPerspective"));
  -[SUUIStorePageSectionsViewController _setRendersWithParallax:](self->_menuBarSectionsViewController, "_setRendersWithParallax:", -[SUUIViewElement rendersWithParallax](self->_templateElement, "rendersWithParallax"));
  v49 = self->_menuBarSectionsViewController;
  -[SUUIMenuBarTemplateDocumentViewController _zoomingShelfPageSplitsDescription](self, "_zoomingShelfPageSplitsDescription");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionsViewController setSectionsWithSplitsDescription:](v49, "setSectionsWithSplitsDescription:", v50);

  -[SUUIStorePageSectionsViewController sections](self->_menuBarSectionsViewController, "sections");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "firstObject");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v52, "configuration");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "shelfCollectionView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIHorizontalScrollingContainerViewController setMenuBarCollectionView:](self->_horizontalScrollingContainerViewController, "setMenuBarCollectionView:", v54);
  v18 = self->_horizontalScrollingContainerViewController;

  if (v18)
  {
LABEL_37:
    -[SUUIMenuBarTemplateDocumentViewController _addContentViewController:](self, "_addContentViewController:", v18);

  }
}

- (void)_removeContentViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v6, "willMoveToParentViewController:", 0);
  if (objc_msgSend(v6, "isViewLoaded"))
  {
    objc_msgSend(v6, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v4, "removeFromSuperview");

  }
  if (v3)
    objc_msgSend(v6, "removeFromParentViewController");

}

- (void)_replaceViewControllerAtIndex:(unint64_t)a3 withViewController:(id)a4
{
  id v6;
  int64_t menuBarStyle;
  int *v8;
  id v9;

  v6 = a4;
  menuBarStyle = self->_menuBarStyle;
  if (menuBarStyle == 1)
  {
    v8 = &OBJC_IVAR___SUUIMenuBarTemplateDocumentViewController__scrollingSegmentedController;
    goto LABEL_5;
  }
  if (menuBarStyle == 2)
  {
    v8 = &OBJC_IVAR___SUUIMenuBarTemplateDocumentViewController__horizontalScrollingContainerViewController;
LABEL_5:
    v9 = v6;
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v8), "replaceViewControllerAtIndex:withViewController:", a3, v6);
    v6 = v9;
  }

}

- (BOOL)_isFirstViewControllerOnNavigationStack
{
  SUUIMenuBarTemplateDocumentViewController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[SUUIMenuBarTemplateDocumentViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = SUUIViewControllerIsDescendent(v2, v5);

  return (char)v2;
}

- (void)_willDisplayViewControllerAtIndex:(unint64_t)a3
{
  unint64_t v4;
  SUUIMenuBarViewElementConfiguration *menuBarViewElementConfiguration;
  id v6;
  void *v7;
  id v8;

  v8 = 0;
  v4 = -[SUUIMenuBarTemplateDocumentViewController _menuItemIndexForEntityIndex:entityValueProvider:](self, "_menuItemIndexForEntityIndex:entityValueProvider:", a3, &v8);
  menuBarViewElementConfiguration = self->_menuBarViewElementConfiguration;
  v6 = v8;
  -[SUUIViewController clientContext](self, "clientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIMenuBarViewElementConfiguration contentWillAppearForMenuItemAtIndex:withEntityValueProvider:clientContext:](menuBarViewElementConfiguration, "contentWillAppearForMenuItemAtIndex:withEntityValueProvider:clientContext:", v4, v6, v7);

}

- (id)_zoomingShelfPageSplitsDescription
{
  SUUIStorePageSplitsDescription *v3;
  SUUIMenuBarViewElement *v4;
  objc_class *v5;
  void *v6;
  SUUIStorePageSplit *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (self->_menuBarStyle == 2)
  {
    v3 = objc_alloc_init(SUUIStorePageSplitsDescription);
    v4 = self->_menuBarViewElement;
    v5 = (objc_class *)SUUIPageComponentClassForComponentType(-[SUUIViewElement pageComponentType](v4, "pageComponentType"));
    if (v5)
    {
      v6 = (void *)objc_msgSend([v5 alloc], "initWithViewElement:", v4);
      v7 = objc_alloc_init(SUUIStorePageSplit);
      v10[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStorePageSplit setPageComponents:](v7, "setPageComponents:", v8);

      -[SUUIStorePageSplitsDescription setTopSplit:](v3, "setTopSplit:", v7);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_scrollingSegmentedController, 0);
  objc_storeStrong((id *)&self->_pendingSelectedMenuItemViewElement, 0);
  objc_storeStrong((id *)&self->_menuBarViewElementConfiguration, 0);
  objc_storeStrong((id *)&self->_menuBarViewElement, 0);
  objc_storeStrong((id *)&self->_menuBarSectionsViewController, 0);
  objc_storeStrong((id *)&self->_loadingDocumentViewController, 0);
  objc_storeStrong((id *)&self->_horizontalScrollingContainerViewController, 0);
  objc_storeStrong((id *)&self->_entityUniqueIdentifierToEntityIndex, 0);
  objc_storeStrong((id *)&self->_dynamicPageSectionIndexMapper, 0);
  objc_storeStrong((id *)&self->_embeddedPaletteHost, 0);
}

@end
