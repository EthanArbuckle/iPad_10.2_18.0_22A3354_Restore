@implementation SUUICategoryController

- (SUUICategoryController)initWithContentsController:(id)a3
{
  id v4;
  SUUICategoryController *v5;
  SUUICategoryController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUICategoryController;
  v5 = -[SUUICategoryController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_contentsController, v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUICategoryController dismiss](self, "dismiss");
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)SUUICategoryController;
  -[SUUICategoryController dealloc](&v3, sel_dealloc);
}

- (UIBarButtonItem)categoryButton
{
  UIBarButtonItem *button;
  SUUIClientContext *clientContext;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;

  button = self->_button;
  if (!button)
  {
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("CATEGORIES_BUTTON"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("CATEGORIES_BUTTON"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v5, 0, self, sel_buttonAction_);
    v7 = self->_button;
    self->_button = v6;

    button = self->_button;
  }
  return button;
}

- (void)dismiss
{
  UIPopoverController *popover;
  SUUICategoryTableViewController *tableViewController;

  -[UIPopoverController setDelegate:](self->_popover, "setDelegate:", 0);
  -[UIPopoverController dismissPopoverAnimated:](self->_popover, "dismissPopoverAnimated:", 1);
  popover = self->_popover;
  self->_popover = 0;

  -[SUUICategoryTableViewController dismissViewControllerAnimated:completion:](self->_tableViewController, "dismissViewControllerAnimated:completion:", 1, 0);
  -[SUUICategoryTableViewController setDelegate:](self->_tableViewController, "setDelegate:", 0);
  tableViewController = self->_tableViewController;
  self->_tableViewController = 0;

}

- (BOOL)isLoading
{
  return self->_loadOperation != 0;
}

- (void)loadFromURL:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  SSVLoadURLOperation *v8;
  SSVLoadURLOperation *loadOperation;
  SSVLoadURLOperation *v10;
  void *v11;
  SSVLoadURLOperation *v12;
  void *v13;
  SSVLoadURLOperation *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  -[SSVLoadURLOperation cancel](self->_loadOperation, "cancel");
  v8 = (SSVLoadURLOperation *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURL:", v6);
  loadOperation = self->_loadOperation;
  self->_loadOperation = v8;

  v10 = self->_loadOperation;
  +[SSVURLDataConsumer consumer](SUUIJSONDataConsumer, "consumer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVLoadURLOperation setDataConsumer:](v10, "setDataConsumer:", v11);

  v12 = self->_loadOperation;
  -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVLoadURLOperation setStoreFrontSuffix:](v12, "setStoreFrontSuffix:", v13);

  objc_initWeak(&location, self);
  v14 = self->_loadOperation;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __58__SUUICategoryController_loadFromURL_withCompletionBlock___block_invoke;
  v17[3] = &unk_2511F6090;
  objc_copyWeak(&v19, &location);
  v15 = v7;
  v18 = v15;
  -[SSVLoadURLOperation setOutputBlock:](v14, "setOutputBlock:", v17);
  -[SUUICategoryController operationQueue](self, "operationQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", self->_loadOperation);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __58__SUUICategoryController_loadFromURL_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__SUUICategoryController_loadFromURL_withCompletionBlock___block_invoke_2;
  v9[3] = &unk_2511F6068;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(&v13);
}

uint64_t __58__SUUICategoryController_loadFromURL_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_setResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32) != 0, *(_QWORD *)(a1 + 40));
  return result;
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

- (UISegmentedControl)segmentedControl
{
  SUUISegmentedControl *segmentedControl;
  SUUISegmentedControl *v4;
  SUUISegmentedControl *v5;
  SUUISegmentedControl *v6;

  segmentedControl = self->_segmentedControl;
  if (!segmentedControl)
  {
    v4 = [SUUISegmentedControl alloc];
    v5 = -[SUUISegmentedControl initWithItems:](v4, "initWithItems:", MEMORY[0x24BDBD1A8]);
    v6 = self->_segmentedControl;
    self->_segmentedControl = v5;

    -[SUUISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", 0);
    -[SUUISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, sel_segmentedControlAction_, 4096);
    -[SUUISegmentedControl _setAutosizeText:](self->_segmentedControl, "_setAutosizeText:", 1);
    -[SUUICategoryController _reloadSegmentedControl](self, "_reloadSegmentedControl");
    segmentedControl = self->_segmentedControl;
  }
  return (UISegmentedControl *)segmentedControl;
}

- (void)setCategory:(id)a3
{
  SUUICategory *v5;
  SUUICategory *v6;

  v5 = (SUUICategory *)a3;
  if (self->_rootCategory != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_rootCategory, a3);
    -[SUUICategoryController _precacheArtworkForCategory:](self, "_precacheArtworkForCategory:", self->_rootCategory);
    -[SUUICategoryController _reloadSegmentedControl](self, "_reloadSegmentedControl");
    v5 = v6;
  }

}

- (void)setSegmentedControlLength:(int64_t)a3
{
  if (self->_segmentedControlLength != a3)
  {
    self->_segmentedControlLength = a3;
    -[SUUICategoryController _reloadSegmentedControl](self, "_reloadSegmentedControl");
  }
}

- (void)setSelectedURL:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_selectedURL) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedURL, a3);
    -[SUUICategoryController _reloadSelectedSegment](self, "_reloadSelectedSegment");
  }

}

- (void)setDefaultURL:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_defaultURL) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_defaultURL, a3);
    -[SUUICategoryController _reloadSelectedSegment](self, "_reloadSelectedSegment");
  }

}

- (void)buttonAction:(id)a3
{
  SUUICategoryTableViewController *v4;
  SUUICategoryTableViewController *tableViewController;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  UIPopoverController *v10;
  UIPopoverController *popover;
  void *v12;
  SUUICategory *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  SUUICategory *v23;
  SUUIBackdropContentViewController *v24;
  id WeakRetained;
  id v26;

  -[SUUICategoryController dismiss](self, "dismiss", a3);
  -[SUUICategoryController _rootMetricsLocations](self, "_rootMetricsLocations");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUICategoryController _tableViewControllerWithCategory:](self, "_tableViewControllerWithCategory:", self->_rootCategory);
  v4 = (SUUICategoryTableViewController *)objc_claimAutoreleasedReturnValue();
  tableViewController = self->_tableViewController;
  self->_tableViewController = v4;

  -[SUUICategoryTableViewController setMetricsLocations:](self->_tableViewController, "setMetricsLocations:", v26);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 1)
  {
    v8 = objc_alloc(MEMORY[0x24BEBD858]);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", self->_tableViewController);
    v10 = (UIPopoverController *)objc_msgSend(v8, "initWithContentViewController:", v9);
    popover = self->_popover;
    self->_popover = v10;

    -[UIPopoverController _setPopoverBackgroundStyle:](self->_popover, "_setPopoverBackgroundStyle:", 3);
    -[UIPopoverController setDelegate:](self->_popover, "setDelegate:", self);
    -[UIPopoverController presentPopoverFromBarButtonItem:permittedArrowDirections:animated:](self->_popover, "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", self->_button, 1, 1);
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", self->_tableViewController);
    objc_msgSend(v12, "_setClipUnderlapWhileTransitioning:", 1);
    v13 = self->_rootCategory;
    -[SUUICategory subcategoryContainingURL:](v13, "subcategoryContainingURL:", self->_selectedURL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = *MEMORY[0x24BEB2980];
      while (1)
      {
        objc_msgSend(v15, "children");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (!v18)
          break;
        -[SUUICategoryController _tableViewControllerWithCategory:](self, "_tableViewControllerWithCategory:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUICategory children](v13, "children");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "indexOfObjectIdenticalTo:", v15);

        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v22 = objc_alloc_init(MEMORY[0x24BEB1EF0]);
          objc_msgSend(v22, "setLocationPosition:", v21 + 1);
          objc_msgSend(v22, "setLocationType:", v16);
          objc_msgSend(v26, "insertObject:atIndex:", v22, 0);
          objc_msgSend(v19, "setMetricsLocations:", v26);

        }
        objc_msgSend(v12, "pushViewController:animated:", v19, 0);
        v23 = v15;

        -[SUUICategory subcategoryContainingURL:](v23, "subcategoryContainingURL:", self->_selectedURL);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v23;
        if (!v15)
        {
          v13 = v23;
          break;
        }
      }

    }
    v24 = -[SUUIBackdropContentViewController initWithContentViewController:]([SUUIBackdropContentViewController alloc], "initWithContentViewController:", v12);
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentsController);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v24, 1, 0);

  }
}

- (void)segmentedControlAction:(id)a3
{
  uint64_t v4;
  char isKindOfClass;
  SUUICategory *rootCategory;
  SUUICategoryTableViewController *v7;
  SUUICategoryTableViewController *tableViewController;
  SUUICategoryTableViewController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SUUICategoryTableViewController *v13;
  SUUICategoryTableViewController *v14;
  SUUICategoryTableViewController *v15;
  void *v16;
  id v17;
  void *v18;
  UIPopoverController *v19;
  UIPopoverController *popover;
  UIPopoverController *v21;
  SUUICategory *v22;
  void *v23;
  void *selectedURL;
  NSURL *defaultURL;
  char v26;
  SUUICategory *v27;

  -[SUUICategoryController dismiss](self, "dismiss", a3);
  v4 = -[SUUISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex");
  -[NSArray objectAtIndex:](self->_segmentedControlSegments, "objectAtIndex:", v4);
  v27 = (SUUICategory *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  rootCategory = self->_rootCategory;
  if ((isKindOfClass & 1) != 0)
  {
    -[SUUICategoryController _tableViewControllerWithCategory:](self, "_tableViewControllerWithCategory:", rootCategory);
    v7 = (SUUICategoryTableViewController *)objc_claimAutoreleasedReturnValue();
    tableViewController = self->_tableViewController;
    self->_tableViewController = v7;

    v9 = self->_tableViewController;
    -[SUUICategoryController _metricsLocationsWithIndex:](self, "_metricsLocationsWithIndex:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICategoryTableViewController setMetricsLocations:](v9, "setMetricsLocations:", v10);

    -[SUUICategoryTableViewController setNumberOfHiddenRows:](self->_tableViewController, "setNumberOfHiddenRows:", -[NSArray count](self->_segmentedControlSegments, "count") - 1);
LABEL_6:
    v17 = objc_alloc(MEMORY[0x24BEBD858]);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", self->_tableViewController);
    v19 = (UIPopoverController *)objc_msgSend(v17, "initWithContentViewController:", v18);
    popover = self->_popover;
    self->_popover = v19;

    -[UIPopoverController _setPopoverBackgroundStyle:](self->_popover, "_setPopoverBackgroundStyle:", 3);
    -[UIPopoverController setDelegate:](self->_popover, "setDelegate:", self);
    v21 = self->_popover;
    -[SUUISegmentedControl frameForSegmentAtIndex:](self->_segmentedControl, "frameForSegmentAtIndex:", v4);
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v21, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", self->_segmentedControl, 1, 1);
    goto LABEL_7;
  }
  if (v27 == rootCategory)
  {
    -[SUUICategory URL](v27, "URL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "isEqual:", self->_selectedURL) & 1) != 0)
    {

      goto LABEL_7;
    }
    selectedURL = self->_selectedURL;
    defaultURL = self->_defaultURL;
  }
  else
  {
    -[SUUICategory children](v27, "children");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      -[SUUICategoryController _tableViewControllerWithCategory:](self, "_tableViewControllerWithCategory:", v27);
      v13 = (SUUICategoryTableViewController *)objc_claimAutoreleasedReturnValue();
      v14 = self->_tableViewController;
      self->_tableViewController = v13;

      v15 = self->_tableViewController;
      -[SUUICategoryController _metricsLocationsWithIndex:](self, "_metricsLocationsWithIndex:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUICategoryTableViewController setMetricsLocations:](v15, "setMetricsLocations:", v16);

      goto LABEL_6;
    }
    -[SUUICategory URL](v27, "URL");
    selectedURL = (void *)objc_claimAutoreleasedReturnValue();
    v23 = selectedURL;
    defaultURL = self->_selectedURL;
  }
  v26 = objc_msgSend(selectedURL, "isEqual:", defaultURL);

  v22 = v27;
  if ((v26 & 1) != 0)
    goto LABEL_8;
  -[SUUICategoryController _recordClickEventWithCategory:index:](self, "_recordClickEventWithCategory:index:", v27, v4);
  -[SUUICategoryController categoryTableView:didSelectCategory:](self, "categoryTableView:didSelectCategory:", 0, v27);
LABEL_7:
  v22 = v27;
LABEL_8:

}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  -[SUUICategoryController dismiss](self, "dismiss", a3);
  -[SUUICategoryController _reloadSelectedSegment](self, "_reloadSelectedSegment");
}

- (void)categoryTableView:(id)a3 didSelectCategory:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  -[SUUICategoryController dismiss](self, "dismiss");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "categoryController:didSelectCategory:", self, v8);

  }
}

- (id)metricsPageContextForCategoryTableView:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_contentsController);
  if (WeakRetained)
  {
    -[SUUIClientContext metricsPageContextForViewController:](self->_clientContext, "metricsPageContextForViewController:", WeakRetained);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_artworkLoader
{
  SUUICategoryArtworkLoader *artworkLoader;
  SUUIResourceLoader *v4;
  SUUICategoryArtworkLoader *v5;
  SUUICategoryArtworkLoader *v6;
  SUUICategoryArtworkLoader *v7;
  void *v8;

  artworkLoader = self->_artworkLoader;
  if (!artworkLoader)
  {
    v4 = -[SUUIResourceLoader initWithClientContext:]([SUUIResourceLoader alloc], "initWithClientContext:", self->_clientContext);
    v5 = -[SUUICategoryArtworkLoader initWithArtworkLoader:]([SUUICategoryArtworkLoader alloc], "initWithArtworkLoader:", v4);
    v6 = self->_artworkLoader;
    self->_artworkLoader = v5;

    v7 = self->_artworkLoader;
    +[SUUIStyledImageDataConsumer categoryIconConsumer](SUUIStyledImageDataConsumer, "categoryIconConsumer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICategoryArtworkLoader setImageDataConsumer:](v7, "setImageDataConsumer:", v8);

    artworkLoader = self->_artworkLoader;
  }
  return artworkLoader;
}

- (id)_metricsLocationsWithIndex:(int64_t)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BEB1EF0]);
  objc_msgSend(v4, "setLocationPosition:", a3);
  objc_msgSend(v4, "setLocationType:", *MEMORY[0x24BEB2980]);
  v5 = objc_alloc_init(MEMORY[0x24BEB1EF0]);
  objc_msgSend(v5, "setLocationPosition:", 0);
  objc_msgSend(v5, "setLocationType:", CFSTR("topNav"));
  v8[0] = v4;
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_reloadSegmentedControl
{
  NSArray *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSArray *segmentedControlSegments;
  NSArray *v10;
  uint64_t v11;
  NSArray *v12;
  id v13;
  id v14;
  _QWORD v15[5];

  if (self->_segmentedControl)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[SUUICategory children](self->_rootCategory, "children");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectEnumerator");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[SUUICategory parentLabel](self->_rootCategory, "parentLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[NSArray addObject:](v3, "addObject:", self->_rootCategory);
    objc_msgSend(v13, "nextObject", v13);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      while (-[NSArray count](v3, "count") < self->_segmentedControlLength)
      {
        -[NSArray addObject:](v3, "addObject:", v7);

        objc_msgSend(v14, "nextObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
          goto LABEL_11;
      }
      -[NSArray removeLastObject](v3, "removeLastObject");
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v3, "addObject:", v8);

    }
LABEL_11:
    segmentedControlSegments = self->_segmentedControlSegments;
    self->_segmentedControlSegments = v3;
    v10 = v3;

    v11 = -[SUUISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex");
    -[SUUISegmentedControl removeAllSegments](self->_segmentedControl, "removeAllSegments");
    v12 = self->_segmentedControlSegments;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __49__SUUICategoryController__reloadSegmentedControl__block_invoke;
    v15[3] = &unk_2511F9588;
    v15[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:", v15);
    -[SUUISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", v11);
    -[SUUICategoryController _reloadSelectedSegment](self, "_reloadSelectedSegment");

  }
}

void __49__SUUICategoryController__reloadSegmentedControl__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2;
  v9 = v5;
  if (*(id *)(*(_QWORD *)(a1 + 32) + 80) == v5)
  {
    objc_msgSend(v5, "parentLabel");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "name");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:", CFSTR("CATEGORIES_MORE_SEGMENT"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("CATEGORIES_MORE_SEGMENT"), 0);
      v6 = objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = (void *)v6;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "insertSegmentWithTitle:atIndex:animated:", v6, a3, 0);

}

- (void)_precacheArtworkForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUICategoryController _artworkLoader](self, "_artworkLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadImageForCategory:reason:", v4, -1);
  objc_msgSend(v4, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[SUUICategoryController _precacheArtworkForCategory:](self, "_precacheArtworkForCategory:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_recordClickEventWithCategory:(id)a3 index:(int64_t)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  SUUIClientContext *clientContext;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int64_t v15;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentsController);
  if (WeakRetained)
  {
    -[SUUIClientContext metricsPageContextForViewController:](self->_clientContext, "metricsPageContextForViewController:", WeakRetained);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  clientContext = self->_clientContext;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__SUUICategoryController__recordClickEventWithCategory_index___block_invoke;
  v12[3] = &unk_2511F95B0;
  v13 = v8;
  v14 = v6;
  v15 = a4;
  v10 = v6;
  v11 = v8;
  -[SUUIClientContext getDefaultMetricsControllerWithCompletionBlock:](clientContext, "getDefaultMetricsControllerWithCompletionBlock:", v12);

}

void __62__SUUICategoryController__recordClickEventWithCategory_index___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "canRecordEventWithType:", *MEMORY[0x24BEB2910]))
  {
    v4 = objc_alloc_init(MEMORY[0x24BEB1EC8]);
    objc_msgSend(v4, "setActionType:", *MEMORY[0x24BEB28F0]);
    objc_msgSend(v4, "setPageContext:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(*(id *)(a1 + 40), "categoryIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTargetIdentifier:", v5);

    v6 = *MEMORY[0x24BEB2980];
    objc_msgSend(v4, "setTargetType:", *MEMORY[0x24BEB2980]);
    objc_msgSend(*(id *)(a1 + 40), "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTargetURL:", v8);

    objc_msgSend(v3, "locationWithPosition:type:fieldData:", 0, CFSTR("topNav"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationWithPosition:type:fieldData:", *(_QWORD *)(a1 + 48), v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v10;
    v12[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocationWithEventLocations:", v11);

    objc_msgSend(v3, "recordEvent:", v4);
  }

}

- (void)_reloadSelectedSegment
{
  NSURL *selectedURL;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSArray *segmentedControlSegments;
  void *v13;
  NSArray *v14;
  void *v15;

  if (!self->_segmentedControl || self->_popover)
    return;
  selectedURL = self->_selectedURL;
  -[SUUICategory URL](self->_rootCategory, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSURL isEqual:](selectedURL, "isEqual:", v4) & 1) != 0)
  {

  }
  else
  {
    v5 = -[NSURL isEqual:](self->_selectedURL, "isEqual:", self->_defaultURL);

    if ((v5 & 1) == 0)
    {
      -[SUUICategory children](self->_rootCategory, "children");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        v8 = 0;
        while (1)
        {
          objc_msgSend(v7, "objectAtIndex:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "containsURL:", self->_selectedURL);

          if (v10)
            break;
          if (++v8 >= (unint64_t)objc_msgSend(v7, "count"))
            goto LABEL_12;
        }
        segmentedControlSegments = self->_segmentedControlSegments;
        objc_msgSend(v7, "objectAtIndex:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[NSArray indexOfObject:](segmentedControlSegments, "indexOfObject:", v13);

        if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v14 = self->_segmentedControlSegments;
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = -[NSArray indexOfObject:](v14, "indexOfObject:", v15);

        }
      }
      else
      {
LABEL_12:
        v6 = 0x7FFFFFFFFFFFFFFFLL;
      }

      goto LABEL_14;
    }
  }
  v6 = -[NSArray indexOfObject:](self->_segmentedControlSegments, "indexOfObject:", self->_rootCategory);
LABEL_14:
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v11 = -1;
  else
    v11 = v6;
  -[SUUISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", v11);
}

- (id)_rootMetricsLocations
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BEB1EF0]);
  objc_msgSend(v2, "setLocationPosition:", 0);
  objc_msgSend(v2, "setLocationType:", CFSTR("topNav"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setResponse:(id)a3 error:(id)a4
{
  SSVLoadURLOperation *loadOperation;
  SUUICategory *v6;
  SUUICategory *rootCategory;
  id v8;

  v8 = a3;
  -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[SUUICategory initWithCategoryDictionary:]([SUUICategory alloc], "initWithCategoryDictionary:", v8);
    rootCategory = self->_rootCategory;
    self->_rootCategory = v6;

    -[SUUICategoryController _precacheArtworkForCategory:](self, "_precacheArtworkForCategory:", self->_rootCategory);
    -[SUUICategoryController _reloadSegmentedControl](self, "_reloadSegmentedControl");
  }

}

- (id)_tableViewControllerWithCategory:(id)a3
{
  SUUICategory *v4;
  SUUICategoryTableViewController *v5;
  void *v6;
  _BOOL8 v7;

  v4 = (SUUICategory *)a3;
  v5 = objc_alloc_init(SUUICategoryTableViewController);
  -[SUUICategoryController _artworkLoader](self, "_artworkLoader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICategoryTableViewController setArtworkLoader:](v5, "setArtworkLoader:", v6);

  -[SUUICategoryTableViewController setClientContext:](v5, "setClientContext:", self->_clientContext);
  -[SUUICategoryTableViewController setCategory:](v5, "setCategory:", v4);
  -[SUUICategoryTableViewController setPreferredContentSize:](v5, "setPreferredContentSize:", 320.0, 472.0);
  -[SUUICategoryTableViewController setSelectedURL:](v5, "setSelectedURL:", self->_selectedURL);
  -[SUUICategoryTableViewController setDefaultURL:](v5, "setDefaultURL:", self->_defaultURL);
  v7 = self->_rootCategory == v4;

  -[SUUICategoryTableViewController setRoot:](v5, "setRoot:", v7);
  -[SUUICategoryTableViewController setDelegate:](v5, "setDelegate:", self);
  return v5;
}

- (SUUICategory)category
{
  return self->_rootCategory;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (NSURL)defaultURL
{
  return self->_defaultURL;
}

- (SUUICategoryControllerDelegate)delegate
{
  return (SUUICategoryControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (int64_t)segmentedControlLength
{
  return self->_segmentedControlLength;
}

- (NSURL)selectedURL
{
  return self->_selectedURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_segmentedControlSegments, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_selectedURL, 0);
  objc_storeStrong((id *)&self->_rootCategory, 0);
  objc_storeStrong((id *)&self->_popover, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultURL, 0);
  objc_destroyWeak((id *)&self->_contentsController);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

@end
