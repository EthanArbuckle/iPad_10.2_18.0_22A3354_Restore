@implementation SUUIStorePageViewController

- (SUUIStorePageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUUIStorePageViewController *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIStorePageViewController;
  v4 = -[SUUIStorePageViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    -[SUUIStorePageViewController setRestorationClass:](v4, "setRestorationClass:", objc_opt_class());
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageViewController setRestorationIdentifier:](v4, "setRestorationIdentifier:", v6);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__metricsEnterEventNotification_, CFSTR("SUUIMetricsDidRecordEnterEventNotification"), 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUUIMetricsDidRecordEnterEventNotification"), 0);
  -[SUUIStorePageSectionsViewController setDelegate:](self->_sectionsViewController, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SUUIStorePageViewController;
  -[SUUIStorePageViewController dealloc](&v4, sel_dealloc);
}

- (void)cancelPageLoad
{
  SSVLoadURLOperation *loadOperation;

  -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  -[SSVLoadURLOperation cancel](self->_loadOperation, "cancel");
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

}

- (BOOL)isSkLoading
{
  return self->_loadOperation != 0;
}

- (void)loadURL:(id)a3 withCompletionBlock:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x24BDB74A0];
  v7 = a4;
  v8 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithURL:", v8);

  -[SUUIStorePageViewController loadURLRequest:withCompletionBlock:](self, "loadURLRequest:withCompletionBlock:", v9, v7);
}

- (void)loadURL:(id)a3 withDataConsumer:(id)a4 completionBlock:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = (objc_class *)MEMORY[0x24BDB74A0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (id)objc_msgSend([v8 alloc], "initWithURL:", v11);

  -[SUUIStorePageViewController loadURLRequest:withDataConsumer:completionBlock:](self, "loadURLRequest:withDataConsumer:completionBlock:", v12, v10, v9);
}

- (void)loadURLRequest:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[SSVURLDataConsumer consumer](SUUIStorePageDataConsumer, "consumer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageViewController loadURLRequest:withDataConsumer:completionBlock:](self, "loadURLRequest:withDataConsumer:completionBlock:", v7, v8, v6);

}

- (void)loadURLRequest:(id)a3 withDataConsumer:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  NSURLRequest *v10;
  const __CFString *v11;
  NSURLRequest *v12;
  NSURLRequest *lastRequest;
  objc_class *v14;
  NSString *v15;
  NSString *lastDataConsumerClassName;
  SSMetricsPageEvent *lastPageEvent;
  void *v18;
  void *v19;
  NSURLRequest *v20;

  v20 = (NSURLRequest *)a3;
  v8 = a4;
  v9 = a5;
  v10 = v20;
  if (v20)
  {
    if (v8)
      goto LABEL_6;
    v11 = CFSTR("nil consumer");
  }
  else
  {
    v11 = CFSTR("nil request");
  }
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], v11);
  v10 = v20;
LABEL_6:
  if (self->_lastRequest != v10)
  {
    v12 = (NSURLRequest *)-[NSURLRequest copy](v20, "copy");
    lastRequest = self->_lastRequest;
    self->_lastRequest = v12;

  }
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastDataConsumerClassName = self->_lastDataConsumerClassName;
  self->_lastDataConsumerClassName = v15;

  lastPageEvent = self->_lastPageEvent;
  self->_lastPageEvent = 0;

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURLRequest:", v20);
  objc_msgSend(v18, "setDataConsumer:", v8);
  -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setStoreFrontSuffix:", v19);

  -[SUUIStorePageViewController _loadWithOperation:completionBlock:](self, "_loadWithOperation:completionBlock:", v18, v9);
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

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 4);
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (void)setMetricsController:(id)a3
{
  SUUIMetricsController *metricsController;
  id v5;

  metricsController = self->_metricsController;
  self->_metricsController = 0;
  v5 = a3;

  -[SUUIStorePageViewController _setMetricsController:](self, "_setMetricsController:", v5);
}

- (void)setRefreshControl:(id)a3
{
  UIRefreshControl *v5;
  UIRefreshControl **p_refreshControl;
  UIRefreshControl *refreshControl;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIRefreshControl *v13;

  v5 = (UIRefreshControl *)a3;
  p_refreshControl = &self->_refreshControl;
  refreshControl = self->_refreshControl;
  if (refreshControl != v5)
  {
    v13 = v5;
    -[UIRefreshControl removeFromSuperview](refreshControl, "removeFromSuperview");
    objc_storeStrong((id *)&self->_refreshControl, a3);
    -[UIRefreshControl setAutoresizingMask:](*p_refreshControl, "setAutoresizingMask:", 2);
    -[SUUIStorePageSectionsViewController collectionView](self->_sectionsViewController, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UIRefreshControl frame](*p_refreshControl, "frame");
      v10 = v9;
      v12 = v11;
      objc_msgSend(v8, "bounds");
      -[UIRefreshControl setFrame:](*p_refreshControl, "setFrame:", v10, v12);
      objc_msgSend(v8, "_addContentSubview:atBack:", *p_refreshControl, 1);
    }

    v5 = v13;
  }

}

- (void)setStorePage:(id)a3
{
  SUUIStorePage *v4;
  SUUIStorePage *storePage;
  id v6;

  if (self->_storePage != a3)
  {
    v4 = (SUUIStorePage *)objc_msgSend(a3, "copy");
    storePage = self->_storePage;
    self->_storePage = v4;

    -[SUUIStorePageSectionsViewController dismissOverlays](self->_sectionsViewController, "dismissOverlays");
    -[SUUIStorePageViewController _reloadStorePage](self, "_reloadStorePage");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("SUUIApplicationPageDidDisplayNotification"), self);

  }
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *lastDataConsumerClassName;
  NSURLRequest *v8;
  NSURLRequest *lastRequest;
  SUUIColorScheme *v10;
  SUUIColorScheme *placeholderColorScheme;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageViewController setTitle:](self, "setTitle:", v5);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("consumerClass"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastDataConsumerClassName = self->_lastDataConsumerClassName;
  self->_lastDataConsumerClassName = v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("request"));
  v8 = (NSURLRequest *)objc_claimAutoreleasedReturnValue();
  lastRequest = self->_lastRequest;
  self->_lastRequest = v8;

  self->_loadOnAppear = self->_lastRequest != 0;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorScheme"));
  v10 = (SUUIColorScheme *)objc_claimAutoreleasedReturnValue();
  placeholderColorScheme = self->_placeholderColorScheme;
  self->_placeholderColorScheme = v10;

  -[SUUIStorePageViewController _sectionsViewController](self, "_sectionsViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIDecodeRestorableStateWithCoder(v4, CFSTR("sectionsVC"), v12);
  -[SUUIStorePageViewController _colorScheme](self, "_colorScheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setColorScheme:", v13);

  v14.receiver = self;
  v14.super_class = (Class)SUUIStorePageViewController;
  -[SUUIStorePageViewController decodeRestorableStateWithCoder:](&v14, sel_decodeRestorableStateWithCoder_, v4);

}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  SUUIMetricsController *metricsController;
  void *v6;
  objc_super v7;

  metricsController = self->_metricsController;
  SUUIMetricsWindowOrientationForInterfaceOrientation(-[SUUIStorePageViewController interfaceOrientation](self, "interfaceOrientation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIMetricsController setWindowOrientation:](metricsController, "setWindowOrientation:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SUUIStorePageViewController;
  -[SUUIStorePageViewController didRotateFromInterfaceOrientation:](&v7, sel_didRotateFromInterfaceOrientation_, a3);
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  SUUIStorePageSectionsViewController *sectionsViewController;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  sectionsViewController = self->_sectionsViewController;
  v5 = a3;
  SUUIEncodeRestorableStateWithCoder(v5, CFSTR("sectionsVC"), sectionsViewController);
  -[SUUIStorePageViewController _colorScheme](self, "_colorScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("colorScheme"));

  -[SUUIStorePageViewController title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("title"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_lastDataConsumerClassName, CFSTR("consumerClass"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastRequest, CFSTR("request"));
  v8.receiver = self;
  v8.super_class = (Class)SUUIStorePageViewController;
  -[SUUIStorePageViewController encodeRestorableStateWithCoder:](&v8, sel_encodeRestorableStateWithCoder_, v5);

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[SUUIStorePageViewController _sectionsViewController](self, "_sectionsViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v6, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v6, "addSubview:", v4);
  if (self->_refreshControl)
  {
    objc_msgSend(v3, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_addContentSubview:atBack:", self->_refreshControl, 1);

  }
  -[SUUIStorePageViewController setView:](self, "setView:", v6);

}

- (unint64_t)supportedInterfaceOrientations
{
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
    return 30;
  if (SUUIAllowsLandscapePhone())
    return 26;
  return 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSURLRequest *lastRequest;
  NSString *lastDataConsumerClassName;
  uint64_t v7;
  void *v8;
  SSMetricsPageEvent *lastPageEvent;
  void *v10;
  objc_super v11;

  v3 = a3;
  if (self->_loadOnAppear)
  {
    self->_loadOnAppear = 0;
    if (!self->_storePage && !self->_loadOperation)
    {
      lastRequest = self->_lastRequest;
      if (lastRequest)
      {
        lastDataConsumerClassName = self->_lastDataConsumerClassName;
        if (lastDataConsumerClassName
          && (-[objc_class consumer](NSClassFromString(lastDataConsumerClassName), "consumer"),
              v7 = objc_claimAutoreleasedReturnValue(),
              lastRequest = self->_lastRequest,
              v7))
        {
          v8 = (void *)v7;
          -[SUUIStorePageViewController loadURLRequest:withDataConsumer:completionBlock:](self, "loadURLRequest:withDataConsumer:completionBlock:", lastRequest, v7, 0);

        }
        else
        {
          -[SUUIStorePageViewController loadURLRequest:withCompletionBlock:](self, "loadURLRequest:withCompletionBlock:", lastRequest, 0);
        }
      }
    }
  }
  else if (self->_metricsController)
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMetricsPageEvent setOriginalTimeUsingDate:](lastPageEvent, "setOriginalTimeUsingDate:", v10);

      -[SUUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", self->_lastPageEvent);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)SUUIStorePageViewController;
  -[SUUIStorePageViewController viewWillAppear:](&v11, sel_viewWillAppear_, v3);
}

- (id)activeMetricsController
{
  return self->_metricsController;
}

- (BOOL)sectionsViewController:(id)a3 showProductPageForItem:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "storePage:showProductPageForItem:", self, v5);

  }
  return v7 & 1;
}

- (BOOL)sectionsViewController:(id)a3 showStorePageForURL:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "storePage:showStorePageForURL:", self, v5);

  }
  return v7 & 1;
}

- (void)sectionsViewControllerDidDismissOverlayController:(id)a3
{
  SSMetricsPageEvent *lastPageEvent;
  void *v5;

  if (SUUIViewControllerIsVisible(self) && self->_metricsController)
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMetricsPageEvent setOriginalTimeUsingDate:](lastPageEvent, "setOriginalTimeUsingDate:", v5);

      -[SUUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", self->_lastPageEvent);
    }
  }
}

- (BOOL)performTestWithName:(id)a3 options:(id)a4
{
  id v6;
  NSString *v7;
  NSString *performanceTestName;
  NSDictionary *v9;
  NSDictionary *performanceTestOptions;

  v6 = a4;
  v7 = (NSString *)objc_msgSend(a3, "copy");
  performanceTestName = self->_performanceTestName;
  self->_performanceTestName = v7;

  v9 = (NSDictionary *)objc_msgSend(v6, "copy");
  performanceTestOptions = self->_performanceTestOptions;
  self->_performanceTestOptions = v9;

  return 1;
}

+ (SUUIStorePageViewController)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
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

  return (SUUIStorePageViewController *)v4;
}

- (void)_metricsEnterEventNotification:(id)a3
{
  void *v4;
  SSMetricsPageEvent *lastPageEvent;
  void *v6;

  if (SUUIViewControllerIsVisible(self) && self->_lastPageEvent)
  {
    -[SUUIStorePageViewController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else if (!-[SUUIStorePageSectionsViewController isDisplayingOverlays](self->_sectionsViewController, "isDisplayingOverlays"))
    {
      lastPageEvent = self->_lastPageEvent;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMetricsPageEvent setOriginalTimeUsingDate:](lastPageEvent, "setOriginalTimeUsingDate:", v6);

      -[SUUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", self->_lastPageEvent);
    }
  }
}

- (void)loadWithJSONData:(id)a3 fromOperation:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSURLRequest *v11;
  NSString *lastDataConsumerClassName;
  SSMetricsPageEvent *lastPageEvent;
  void *v14;
  void *v15;
  NSURLRequest *obj;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "URLRequest");
  v11 = (NSURLRequest *)objc_claimAutoreleasedReturnValue();
  obj = v11;
  if (self->_lastRequest != v11)
    objc_storeStrong((id *)&self->_lastRequest, v11);
  lastDataConsumerClassName = self->_lastDataConsumerClassName;
  self->_lastDataConsumerClassName = (NSString *)CFSTR("SUUIStorePageDataConsumer");

  lastPageEvent = self->_lastPageEvent;
  self->_lastPageEvent = 0;

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithData:fromOperation:", v10, v9);
  +[SSVURLDataConsumer consumer](SUUIStorePageDataConsumer, "consumer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDataConsumer:", v15);

  -[SUUIStorePageViewController _loadWithOperation:completionBlock:](self, "_loadWithOperation:completionBlock:", v14, v8);
}

- (id)_colorScheme
{
  SUUIStorePage *storePage;
  void *v4;
  void *v5;
  SUUIColorScheme *v6;
  void *v7;

  storePage = self->_storePage;
  if (storePage)
  {
    -[SUUIStorePage uber](storePage, "uber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4 || (objc_msgSend(v4, "colorScheme"), (v6 = (SUUIColorScheme *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[SUUIStorePage backgroundArtwork](self->_storePage, "backgroundArtwork");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        v6 = objc_alloc_init(SUUIColorScheme);
      else
        v6 = 0;
    }

  }
  else
  {
    v6 = self->_placeholderColorScheme;
  }
  return v6;
}

- (void)_loadWithOperation:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  SSVLoadURLOperation **p_loadOperation;
  SSVLoadURLOperation *loadOperation;
  uint64_t v11;
  id v12;
  SUUIClientContext *clientContext;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v7 = a3;
  v8 = a4;
  p_loadOperation = &self->_loadOperation;
  -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  -[SSVLoadURLOperation cancel](self->_loadOperation, "cancel");
  objc_storeStrong((id *)&self->_loadOperation, a3);
  objc_initWeak(&location, self);
  loadOperation = self->_loadOperation;
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __66__SUUIStorePageViewController__loadWithOperation_completionBlock___block_invoke;
  v20[3] = &unk_2511FBCB0;
  objc_copyWeak(&v22, &location);
  v12 = v8;
  v21 = v12;
  -[SSVLoadURLOperation setOutputBlock:](loadOperation, "setOutputBlock:", v20);
  if (!self->_metricsController)
  {
    clientContext = self->_clientContext;
    v15 = v11;
    v16 = 3221225472;
    v17 = __66__SUUIStorePageViewController__loadWithOperation_completionBlock___block_invoke_3;
    v18 = &unk_2511F6CB8;
    objc_copyWeak(&v19, &location);
    -[SUUIClientContext getDefaultMetricsControllerWithCompletionBlock:](clientContext, "getDefaultMetricsControllerWithCompletionBlock:", &v15);
    objc_destroyWeak(&v19);
  }
  -[SUUIStorePageViewController operationQueue](self, "operationQueue", v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOperation:", *p_loadOperation);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __66__SUUIStorePageViewController__loadWithOperation_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v9[2] = __66__SUUIStorePageViewController__loadWithOperation_completionBlock___block_invoke_2;
  v9[3] = &unk_2511FBC88;
  v10 = v5;
  v7 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(&v13);
}

void __66__SUUIStorePageViewController__loadWithOperation_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = *(id *)(a1 + 32);
  else
    v4 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_setStorePage:error:", v4, *(_QWORD *)(a1 + 40));

  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, BOOL, _QWORD))(v3 + 16))(v3, v4 != 0, *(_QWORD *)(a1 + 40));

}

void __66__SUUIStorePageViewController__loadWithOperation_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setMetricsController:", v3);

}

- (void)_recordMetricsPageEvent:(id)a3 forStorePage:(id)a4
{
  id v7;
  SUUIStorePage *v8;
  SUUIStorePage *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  SUUIClientContext *clientContext;
  _QWORD v16[4];
  id v17;
  SUUIStorePage *v18;
  id v19;
  id location;

  v7 = a3;
  v8 = (SUUIStorePage *)a4;
  v9 = v8;
  if (self->_metricsController)
  {
    if (self->_storePage == v8)
    {
      -[SUUIStorePageViewController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewControllers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12 >= 2)
        objc_msgSend(v7, "setNavigationType:", *MEMORY[0x24BEB2958]);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSince1970");
      objc_msgSend(v7, "setPageRenderTime:");

      -[SUUIStorePage uber](v9, "uber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUbered:", v14 != 0);

      if (!-[SUUIStorePageSectionsViewController isDisplayingOverlays](self->_sectionsViewController, "isDisplayingOverlays"))-[SUUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", v7);
      objc_storeStrong((id *)&self->_lastPageEvent, a3);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    clientContext = self->_clientContext;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __68__SUUIStorePageViewController__recordMetricsPageEvent_forStorePage___block_invoke;
    v16[3] = &unk_2511FBCD8;
    objc_copyWeak(&v19, &location);
    v17 = v7;
    v18 = v9;
    -[SUUIClientContext getDefaultMetricsControllerWithCompletionBlock:](clientContext, "getDefaultMetricsControllerWithCompletionBlock:", v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

void __68__SUUIStorePageViewController__recordMetricsPageEvent_forStorePage___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  id v6;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_setMetricsController:", v4);

  if (v4)
  {
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "_recordMetricsPageEvent:forStorePage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_reloadStorePage
{
  SUUIMetricsController *metricsController;
  void *v4;
  SUUIMetricsController *v5;
  void *v6;
  void *v7;
  SUUIStorePageSectionsViewController *sectionsViewController;
  void *v9;
  SUUIStorePageSectionsViewController *v10;
  id v11;

  metricsController = self->_metricsController;
  -[SUUIStorePage metricsConfiguration](self->_storePage, "metricsConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIMetricsController setPageConfiguration:](metricsController, "setPageConfiguration:", v4);

  v5 = self->_metricsController;
  -[SUUIStorePage pageURL](self->_storePage, "pageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIMetricsController setPageURL:](v5, "setPageURL:", v7);

  sectionsViewController = self->_sectionsViewController;
  -[SUUIStorePageViewController _colorScheme](self, "_colorScheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionsViewController setColorScheme:](sectionsViewController, "setColorScheme:", v9);

  v10 = self->_sectionsViewController;
  -[SUUIStorePage pageComponents](self->_storePage, "pageComponents");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionsViewController setSectionsWithPageComponents:](v10, "setSectionsWithPageComponents:", v11);

}

- (void)_runPerformanceTestAfterIdle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSString *performanceTestName;
  NSString *v12;
  NSDictionary *performanceTestOptions;
  id v14;

  if (-[NSString hasPrefix:](self->_performanceTestName, "hasPrefix:", CFSTR("Switch")))
  {
    SUUIViewControllerGetAncestorTabBarController(self);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_performanceTestOptions, "objectForKey:", CFSTR("destinationTabIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    if (objc_msgSend(v14, "selectedIndex") != v4)
    {
      objc_msgSend(v14, "viewControllers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "topViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      performanceTestName = self->_performanceTestName;
      if ((v8 & 1) != 0)
      {
        objc_msgSend(v9, "startedTest:", performanceTestName);

        objc_msgSend(v7, "performTestWithName:options:", self->_performanceTestName, self->_performanceTestOptions);
        objc_msgSend(v14, "setSelectedIndex:", v4);
      }
      else
      {
        objc_msgSend(v9, "failedTest:", performanceTestName);

      }
      v12 = self->_performanceTestName;
      self->_performanceTestName = 0;

      performanceTestOptions = self->_performanceTestOptions;
      self->_performanceTestOptions = 0;

    }
  }
}

- (void)_runPerformanceTestAfterPageLoad
{
  void *v3;
  NSString *performanceTestName;
  NSDictionary *performanceTestOptions;
  dispatch_time_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;
  NSDictionary *v11;
  id v12;
  _QWORD block[5];

  if (-[NSString hasPrefix:](self->_performanceTestName, "hasPrefix:", CFSTR("launch")))
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishedTest:extraResults:", self->_performanceTestName, 0);

    performanceTestName = self->_performanceTestName;
    self->_performanceTestName = 0;

    performanceTestOptions = self->_performanceTestOptions;
    self->_performanceTestOptions = 0;

  }
  else if (-[NSString hasPrefix:](self->_performanceTestName, "hasPrefix:", CFSTR("Scroll")))
  {
    v6 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__SUUIStorePageViewController__runPerformanceTestAfterPageLoad__block_invoke;
    block[3] = &unk_2511F47C0;
    block[4] = self;
    dispatch_after(v6, MEMORY[0x24BDAC9B8], block);
  }
  else if (-[NSString hasPrefix:](self->_performanceTestName, "hasPrefix:", CFSTR("Switch")))
  {
    -[NSDictionary objectForKey:](self->_performanceTestOptions, "objectForKey:", CFSTR("destinationTabIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    SUUIViewControllerGetAncestorTabBarController(self);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "selectedIndex") == v8)
    {
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "finishedTest:extraResults:", self->_performanceTestName, 0);

      v10 = self->_performanceTestName;
      self->_performanceTestName = 0;

      v11 = self->_performanceTestOptions;
      self->_performanceTestOptions = 0;

    }
  }
}

void __63__SUUIStorePageViewController__runPerformanceTestAfterPageLoad__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_runScrollTestWithName:options:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1040);
  *(_QWORD *)(v2 + 1040) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1048);
  *(_QWORD *)(v4 + 1048) = 0;

}

- (void)_runScrollTestWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  id v22;

  v22 = a3;
  v6 = a4;
  -[SUUIStorePageSectionsViewController collectionView](self->_sectionsViewController, "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((objc_msgSend(v7, "isScrollEnabled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "subviews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    v13 = objc_msgSend(v12, "count");
    v8 = v7;
    if (v13 >= 1)
    {
      v14 = v13;
      v15 = 0;
      while (1)
      {
        objc_msgSend(v12, "objectAtIndex:", v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v8, "subviews");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v12, "addObjectsFromArray:", v16);
          v14 = objc_msgSend(v12, "count");
        }

        if (++v15 >= v14)
        {
          v8 = v7;
          goto LABEL_10;
        }
      }

    }
LABEL_10:

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("iterations"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "intValue");
  objc_msgSend(v6, "objectForKey:", CFSTR("offset"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "intValue");
  objc_msgSend(v8, "contentSize");
  objc_msgSend(v8, "_performScrollTest:iterations:delta:length:", v22, v18, v20, (int)v21);

}

- (id)_sectionsViewController
{
  SUUIStorePageSectionsViewController *sectionsViewController;
  SUUIStorePageSectionsViewController *v4;
  SUUIStorePageSectionsViewController *v5;
  SUUIStorePageSectionsViewController *v6;
  void *v7;
  SUUIStorePageSectionsViewController *v8;
  void *v9;
  SUUIStorePageSectionsViewController *v10;
  void *v11;
  SUUIStorePage *storePage;
  SUUIStorePageSectionsViewController *v13;
  void *v14;

  sectionsViewController = self->_sectionsViewController;
  if (!sectionsViewController)
  {
    v4 = objc_alloc_init(SUUIStorePageSectionsViewController);
    v5 = self->_sectionsViewController;
    self->_sectionsViewController = v4;

    v6 = self->_sectionsViewController;
    -[SUUIStorePageViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewController setClientContext:](v6, "setClientContext:", v7);

    -[SUUIStorePageSectionsViewController setDelegate:](self->_sectionsViewController, "setDelegate:", self);
    v8 = self->_sectionsViewController;
    -[SUUIStorePageViewController operationQueue](self, "operationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewController setOperationQueue:](v8, "setOperationQueue:", v9);

    v10 = self->_sectionsViewController;
    -[SUUIStorePageViewController _colorScheme](self, "_colorScheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageSectionsViewController setColorScheme:](v10, "setColorScheme:", v11);

    -[SUUIStorePageSectionsViewController setMetricsController:](self->_sectionsViewController, "setMetricsController:", self->_metricsController);
    storePage = self->_storePage;
    if (storePage)
    {
      v13 = self->_sectionsViewController;
      -[SUUIStorePage pageComponents](storePage, "pageComponents");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStorePageSectionsViewController setSectionsWithPageComponents:](v13, "setSectionsWithPageComponents:", v14);

    }
    -[SUUIStorePageViewController addChildViewController:](self, "addChildViewController:", self->_sectionsViewController);
    sectionsViewController = self->_sectionsViewController;
  }
  return sectionsViewController;
}

- (void)_setMetricsController:(id)a3
{
  id v5;
  SUUIMetricsController **p_metricsController;
  SUUIMetricsController *v7;
  void *v8;
  SUUIMetricsController *v9;
  void *v10;
  SUUIMetricsController *v11;
  void *v12;
  void *v13;
  SUUIMetricsController *v14;
  void *v15;
  void *v16;
  SUUIMetricsController *v17;
  void *v18;
  void *v19;
  id v20;

  v5 = a3;
  p_metricsController = &self->_metricsController;
  if (!self->_metricsController)
  {
    v20 = v5;
    objc_storeStrong((id *)&self->_metricsController, a3);
    v7 = *p_metricsController;
    -[SUUIStorePage metricsConfiguration](self->_storePage, "metricsConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController setPageConfiguration:](v7, "setPageConfiguration:", v8);

    v9 = *p_metricsController;
    -[SUUIClientContext metricsPageContextForViewController:](self->_clientContext, "metricsPageContextForViewController:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController setPageContext:](v9, "setPageContext:", v10);

    v11 = *p_metricsController;
    -[SUUIStorePage pageURL](self->_storePage, "pageURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController setPageURL:](v11, "setPageURL:", v13);

    v14 = *p_metricsController;
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIMetricsWindowOrientationForInterfaceOrientation(objc_msgSend(v15, "statusBarOrientation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController setWindowOrientation:](v14, "setWindowOrientation:", v16);

    -[SUUIStorePageSectionsViewController setMetricsController:](self->_sectionsViewController, "setMetricsController:", *p_metricsController);
    v17 = *p_metricsController;
    -[SUUIStorePage metricsConfiguration](self->_storePage, "metricsConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pingURLs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController pingURLs:withClientContext:](v17, "pingURLs:withClientContext:", v19, self->_clientContext);

    v5 = v20;
  }

}

- (void)_setStorePage:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  SUUIMetricsController *metricsController;
  void *v15;
  void *v16;
  SSVLoadURLOperation *loadOperation;
  _QWORD block[5];
  id v19;
  id v20;

  v6 = a3;
  objc_msgSend(v6, "productPage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SSVLoadURLOperation metricsPageEvent](self->_loadOperation, "metricsPageEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageViewController _showProductPage:withPageEvent:](self, "_showProductPage:withPageEvent:", v7, v8);
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v6, "pageType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("itml"));

  if (v10)
  {
    -[SUUIStorePageViewController clientContext](self, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ITMLData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ITMLResponse");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendOnPageResponseWithDocument:data:URLResponse:performanceMetrics:", 0, v11, v12, 0);

LABEL_9:
    goto LABEL_10;
  }
  if (v6)
  {
    objc_storeStrong((id *)&self->_storePage, a3);
    -[SUUIStorePageViewController _reloadStorePage](self, "_reloadStorePage");
    -[SSVLoadURLOperation metricsPageEvent](self->_loadOperation, "metricsPageEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (v13)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __51__SUUIStorePageViewController__setStorePage_error___block_invoke;
      block[3] = &unk_2511F4798;
      block[4] = self;
      v19 = v13;
      v20 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    metricsController = self->_metricsController;
    -[SUUIStorePage metricsConfiguration](self->_storePage, "metricsConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pingURLs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController pingURLs:withClientContext:](metricsController, "pingURLs:withClientContext:", v16, self->_clientContext);

    -[SUUIStorePageViewController _runPerformanceTestAfterPageLoad](self, "_runPerformanceTestAfterPageLoad");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("SUUIApplicationPageDidDisplayNotification"), self);
    goto LABEL_9;
  }
LABEL_11:
  -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

}

uint64_t __51__SUUIStorePageViewController__setStorePage_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recordMetricsPageEvent:forStorePage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_showProductPage:(id)a3 withPageEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  SUUIIPhoneProductPageViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD block[5];
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "itemKind");

  if (SUUIItemKindIsSoftwareKind(v9) || v9 == 5)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    if (v18 == 1)
    {
      -[SUUIStorePageSectionsViewController showOverlayWithProductPage:metricsPageEvent:](self->_sectionsViewController, "showOverlayWithProductPage:metricsPageEvent:", v6, v7);
    }
    else
    {
      v19 = -[SUUIIPhoneProductPageViewController initWithProductPage:]([SUUIIPhoneProductPageViewController alloc], "initWithProductPage:", v6);
      -[SUUIStorePageViewController clientContext](self, "clientContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewController setClientContext:](v19, "setClientContext:", v20);

      -[SUUIIPhoneProductPageViewController configureMetricsWithPageEvent:](v19, "configureMetricsWithPageEvent:", v7);
      -[SUUIStorePageViewController navigationController](self, "navigationController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "viewControllers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "mutableCopy");

      v24 = MEMORY[0x24BDAC760];
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __62__SUUIStorePageViewController__showProductPage_withPageEvent___block_invoke_2;
      v27[3] = &unk_2511FBD00;
      v27[4] = self;
      v25 = objc_msgSend(v23, "indexOfObjectPassingTest:", v27);
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v23, "addObject:", v19);
      else
        objc_msgSend(v23, "replaceObjectAtIndex:withObject:", v25, v19);
      objc_msgSend(v21, "setViewControllers:animated:", v23, 0);
      block[0] = v24;
      block[1] = 3221225472;
      block[2] = __62__SUUIStorePageViewController__showProductPage_withPageEvent___block_invoke_3;
      block[3] = &unk_2511F47C0;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x24BDEA6E0]);
    objc_msgSend(v10, "setAutomaticallyDismisses:", 1);
    v11 = objc_alloc(MEMORY[0x24BDBCE70]);
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "item");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithLongLong:", objc_msgSend(v13, "itemIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v14, CFSTR("id"), 0);

    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __62__SUUIStorePageViewController__showProductPage_withPageEvent___block_invoke;
    v28[3] = &unk_2511F52A0;
    v29 = v10;
    v16 = v10;
    objc_msgSend(v16, "loadProductWithParameters:completionBlock:", v15, v28);
    -[SUUIStorePageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);

  }
}

uint64_t __62__SUUIStorePageViewController__showProductPage_withPageEvent___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return result;
}

BOOL __62__SUUIStorePageViewController__showProductPage_withPageEvent___block_invoke_2(uint64_t a1, void *a2)
{
  return SUUIViewControllerIsDescendent(*(void **)(a1 + 32), a2);
}

uint64_t __62__SUUIStorePageViewController__showProductPage_withPageEvent___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelPageLoad");
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUIStorePageDelegate)delegate
{
  return (SUUIStorePageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (SUUIStorePage)storePage
{
  return self->_storePage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storePage, 0);
  objc_storeStrong((id *)&self->_sectionsViewController, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_placeholderColorScheme, 0);
  objc_storeStrong((id *)&self->_performanceTestOptions, 0);
  objc_storeStrong((id *)&self->_performanceTestName, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_lastRequest, 0);
  objc_storeStrong((id *)&self->_lastPageEvent, 0);
  objc_storeStrong((id *)&self->_lastDataConsumerClassName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
