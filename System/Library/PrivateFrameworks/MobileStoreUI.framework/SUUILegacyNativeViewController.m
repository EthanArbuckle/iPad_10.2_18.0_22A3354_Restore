@implementation SUUILegacyNativeViewController

- (SUUILegacyNativeViewController)initWithData:(id)a3 fromOperation:(id)a4
{
  id v7;
  id v8;
  SUUILegacyNativeViewController *v9;
  void *v10;
  uint64_t v11;
  NSURL *activeURL;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUUILegacyNativeViewController;
  v9 = -[SUUILegacyNativeViewController init](&v14, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "URLRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = objc_claimAutoreleasedReturnValue();
    activeURL = v9->_activeURL;
    v9->_activeURL = (NSURL *)v11;

    objc_storeStrong((id *)&v9->_defaultURL, v9->_activeURL);
    objc_storeStrong((id *)&v9->_initialData, a3);
    objc_storeStrong((id *)&v9->_initialOperation, a4);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUICategoryController setDelegate:](self->_categoryController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUILegacyNativeViewController;
  -[SUUIViewController dealloc](&v3, sel_dealloc);
}

- (void)reloadData
{
  void *v3;
  NSData *initialData;
  SSVLoadURLOperation *initialOperation;
  NSData *v6;
  SSVLoadURLOperation *v7;
  id *v8;
  void *v9;
  NSURL *activeURL;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  if (self->_initialData)
  {
    objc_initWeak(&location, self);
    -[SUUILegacyNativeViewController _storePageViewController](self, "_storePageViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    initialData = self->_initialData;
    initialOperation = self->_initialOperation;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __44__SUUILegacyNativeViewController_reloadData__block_invoke;
    v13[3] = &unk_2511F5770;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v3, "loadWithJSONData:fromOperation:completionBlock:", initialData, initialOperation, v13);

    v6 = self->_initialData;
    self->_initialData = 0;

    v7 = self->_initialOperation;
    self->_initialOperation = 0;

    v8 = &v14;
  }
  else
  {
    if (!self->_activeURL)
      goto LABEL_6;
    objc_initWeak(&location, self);
    -[SUUILegacyNativeViewController _storePageViewController](self, "_storePageViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    activeURL = self->_activeURL;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __44__SUUILegacyNativeViewController_reloadData__block_invoke_3;
    v11[3] = &unk_2511F5770;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v9, "loadURL:withCompletionBlock:", activeURL, v11);

    v8 = &v12;
  }
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
LABEL_6:
  if (-[SUUILegacyNativeViewController isViewLoaded](self, "isViewLoaded"))
    -[SUUILegacyNativeViewController _reloadNavigationItem](self, "_reloadNavigationItem");
}

void __44__SUUILegacyNativeViewController_reloadData__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SUUILegacyNativeViewController_reloadData__block_invoke_2;
  block[3] = &unk_2511F7B40;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __44__SUUILegacyNativeViewController_reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishLoadWithResult:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

void __44__SUUILegacyNativeViewController_reloadData__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SUUILegacyNativeViewController_reloadData__block_invoke_4;
  block[3] = &unk_2511F7B40;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __44__SUUILegacyNativeViewController_reloadData__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishLoadWithResult:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[SUUILegacyNativeViewController _storePageViewController](self, "_storePageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v5, "addSubview:", v4);
  if ((objc_msgSend(MEMORY[0x24BEBD3C8], "shouldMakeUIForDefaultPNG") & 1) == 0)
    -[SUUIViewController showDefaultNavigationItems](self, "showDefaultNavigationItems");
  -[SUUILegacyNativeViewController setView:](self, "setView:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  objc_super v8;

  v3 = a3;
  -[SUUIStorePageViewController storePage](self->_storePageViewController, "storePage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || -[SUUIStorePageViewController isSkLoading](self->_storePageViewController, "isSkLoading")
    || objc_msgSend(MEMORY[0x24BEBD3C8], "shouldMakeUIForDefaultPNG"))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "launchedToTest");

    if ((v7 & 1) == 0)
      -[SUUILegacyNativeViewController reloadData](self, "reloadData");
  }
  -[SUUILegacyNativeViewController _reloadNavigationItem](self, "_reloadNavigationItem");
  v8.receiver = self;
  v8.super_class = (Class)SUUILegacyNativeViewController;
  -[SUUIViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  void *v7;
  uint64_t v8;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 1)
  {
    -[SUUICategoryController dismiss](self->_categoryController, "dismiss");
    -[SUUILegacyNativeViewController _reloadNavigationItem](self, "_reloadNavigationItem");
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUILegacyNativeViewController;
  -[SUUIViewController willAnimateRotationToInterfaceOrientation:duration:](&v9, sel_willAnimateRotationToInterfaceOrientation_duration_, a3, a4);
}

- (void)categoryController:(id)a3 didSelectCategory:(id)a4
{
  id v5;
  NSURL *v6;
  NSURL *activeURL;
  void *v8;
  void *v9;

  v5 = a4;
  objc_msgSend(v5, "URL");
  v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
  activeURL = self->_activeURL;
  self->_activeURL = v6;

  -[SUUILegacyNativeViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTitle:", v9);
  -[SUUIStorePageViewController setStorePage:](self->_storePageViewController, "setStorePage:", 0);
  -[SUUILegacyNativeViewController reloadData](self, "reloadData");
}

- (id)activeMetricsController
{
  return -[SUUIStorePageViewController activeMetricsController](self->_storePageViewController, "activeMetricsController");
}

- (id)_categoryController
{
  SUUICategoryController *categoryController;
  SUUICategoryController *v4;
  SUUICategoryController *v5;
  SUUICategoryController *v6;
  void *v7;
  SUUICategoryController *v8;
  void *v9;

  categoryController = self->_categoryController;
  if (!categoryController)
  {
    v4 = -[SUUICategoryController initWithContentsController:]([SUUICategoryController alloc], "initWithContentsController:", self);
    v5 = self->_categoryController;
    self->_categoryController = v4;

    v6 = self->_categoryController;
    -[SUUIViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICategoryController setClientContext:](v6, "setClientContext:", v7);

    -[SUUICategoryController setDelegate:](self->_categoryController, "setDelegate:", self);
    v8 = self->_categoryController;
    -[SUUIViewController operationQueue](self, "operationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICategoryController setOperationQueue:](v8, "setOperationQueue:", v9);

    categoryController = self->_categoryController;
  }
  return categoryController;
}

- (void)_finishLoadWithResult:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SUUICategory *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  v4 = a3;
  v6 = a4;
  if (v4)
  {
    -[SUUILegacyNativeViewController _categoryController](self, "_categoryController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[SUUIStorePageViewController storePage](self->_storePageViewController, "storePage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForPageKey:", CFSTR("categoryList"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForPageKey:", CFSTR("categoryListUrl"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = -[SUUICategory initWithCategoryDictionary:]([SUUICategory alloc], "initWithCategoryDictionary:", v10);
        objc_msgSend(v7, "setCategory:", v12);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "setCategory:", 0);
          objc_initWeak(&location, self);
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = MEMORY[0x24BDAC760];
          v17 = 3221225472;
          v18 = __62__SUUILegacyNativeViewController__finishLoadWithResult_error___block_invoke;
          v19 = &unk_2511F5770;
          objc_copyWeak(&v20, &location);
          objc_msgSend(v7, "loadFromURL:withCompletionBlock:", v13, &v16);

          objc_destroyWeak(&v20);
          objc_destroyWeak(&location);
        }
      }

    }
    -[SUUIStorePageViewController storePage](self->_storePageViewController, "storePage", v16, v17, v18, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUILegacyNativeViewController setTitle:](self, "setTitle:", v15);

    -[SUUILegacyNativeViewController _reloadNavigationItem](self, "_reloadNavigationItem");
  }
  if (v6)
    -[SUUIViewController showError:](self, "showError:", v6);

}

void __62__SUUILegacyNativeViewController__finishLoadWithResult_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadNavigationItem");

}

- (void)_reloadNavigationItem
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  -[SUUILegacyNativeViewController navigationItem](self, "navigationItem");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLeftItemsSupplementBackButton:", 1);
  objc_msgSend(v15, "setLeftBarButtonItem:", 0);
  objc_msgSend(v15, "setTitleView:", 0);
  -[SUUILegacyNativeViewController _categoryController](self, "_categoryController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[SUUIViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = SUUIUserInterfaceIdiom(v7);

    if (v8 == 1
      && (-[SUUIStorePageViewController storePage](self->_storePageViewController, "storePage"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "valueForPageKey:", CFSTR("categoryListUrl")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          !v10))
    {
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "statusBarOrientation");

      if ((unint64_t)(v13 - 1) < 2)
        v14 = 4;
      else
        v14 = 5;
      objc_msgSend(v3, "setSegmentedControlLength:", v14);
      objc_msgSend(v3, "setDefaultURL:", self->_defaultURL);
      objc_msgSend(v3, "setSelectedURL:", self->_activeURL);
      objc_msgSend(v3, "segmentedControl");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sizeToFit");
      objc_msgSend(v15, "setTitleView:", v11);
    }
    else
    {
      objc_msgSend(v3, "setSelectedURL:", self->_activeURL);
      objc_msgSend(v3, "setDefaultURL:", self->_defaultURL);
      objc_msgSend(v3, "categoryButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLeftBarButtonItem:", v11);
    }

  }
}

- (id)_storePageViewController
{
  SUUIStorePageViewController *storePageViewController;
  SUUIStorePageViewController *v4;
  SUUIStorePageViewController *v5;
  SUUIStorePageViewController *v6;
  void *v7;

  storePageViewController = self->_storePageViewController;
  if (!storePageViewController)
  {
    v4 = objc_alloc_init(SUUIStorePageViewController);
    v5 = self->_storePageViewController;
    self->_storePageViewController = v4;

    v6 = self->_storePageViewController;
    -[SUUIViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageViewController setClientContext:](v6, "setClientContext:", v7);

    -[SUUILegacyNativeViewController addChildViewController:](self, "addChildViewController:", self->_storePageViewController);
    storePageViewController = self->_storePageViewController;
  }
  return storePageViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storePageViewController, 0);
  objc_storeStrong((id *)&self->_initialOperation, 0);
  objc_storeStrong((id *)&self->_initialData, 0);
  objc_storeStrong((id *)&self->_defaultURL, 0);
  objc_storeStrong((id *)&self->_categoryController, 0);
  objc_storeStrong((id *)&self->_activeURL, 0);
}

@end
