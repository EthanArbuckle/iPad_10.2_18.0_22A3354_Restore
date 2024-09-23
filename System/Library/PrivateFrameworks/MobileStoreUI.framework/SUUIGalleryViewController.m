@implementation SUUIGalleryViewController

- (SUUIGalleryViewController)initWithGalleryComponent:(id)a3 artworkLoader:(id)a4
{
  id v7;
  id v8;
  SUUIGalleryViewController *v9;
  SUUIGalleryViewController *v10;
  uint64_t v11;
  NSMapTable *componentArtworkRequests;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUUIGalleryViewController;
  v9 = -[SUUIGalleryViewController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_artworkLoader, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    componentArtworkRequests = v10->_componentArtworkRequests;
    v10->_componentArtworkRequests = (NSMapTable *)v11;

    objc_storeStrong((id *)&v10->_galleryComponent, a3);
  }

  return v10;
}

- (void)dealloc
{
  NSObject *cycleTimer;
  objc_super v4;

  cycleTimer = self->_cycleTimer;
  if (cycleTimer)
    dispatch_source_cancel(cycleTimer);
  -[UIPageViewController setDataSource:](self->_pageViewController, "setDataSource:", 0);
  -[UIPageViewController setDelegate:](self->_pageViewController, "setDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_tapGestureRecognizer, "removeTarget:action:", self, 0);
  v4.receiver = self;
  v4.super_class = (Class)SUUIGalleryViewController;
  -[SUUIGalleryViewController dealloc](&v4, sel_dealloc);
}

- (void)loadArtworkForChildComponent:(id)a3 reason:(int64_t)a4 constraintWidth:(double)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SUUIArtworkRequest *v12;
  void *v13;
  NSMapTable *componentArtworkRequests;
  void *v15;
  id v16;

  v16 = a3;
  -[NSMapTable objectForKey:](self->_componentArtworkRequests, "objectForKey:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8
    || !-[SUUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_artworkLoader, "trySetReason:forRequestWithIdentifier:", a4, objc_msgSend(v8, "unsignedIntegerValue")))
  {
    objc_msgSend(v16, "bestThumbnailArtwork");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_alloc_init(SUUIArtworkRequest);
      +[SUUISizeToFitImageDataConsumer consumerWithConstraintSize:](SUUISizeToFitImageDataConsumer, "consumerWithConstraintSize:", a5, 0.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIArtworkRequest setDataConsumer:](v12, "setDataConsumer:", v13);

      -[SUUIArtworkRequest setDelegate:](v12, "setDelegate:", self);
      -[SUUIArtworkRequest setURL:](v12, "setURL:", v11);
      componentArtworkRequests = self->_componentArtworkRequests;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v12, "requestIdentifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](componentArtworkRequests, "setObject:forKey:", v15, v16);

      -[SUUIResourceLoader loadResourceWithRequest:reason:](self->_artworkLoader, "loadResourceWithRequest:reason:", v12, a4);
    }

  }
}

- (void)performActionForSelectedComponentAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SUUIGalleryViewController _selectedViewController](self, "_selectedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "beginPlaybackAnimated:", v3);
}

- (SUUIMediaComponent)selectedMediaComponent
{
  void *v2;
  void *v3;

  -[SUUIGalleryViewController _selectedViewController](self, "_selectedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUUIMediaComponent *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SUUIGalleryViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[SUUIGalleryViewController _selectedViewController](self, "_selectedViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

}

- (void)setEmbeddedMediaDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SUUIGalleryViewController _selectedViewController](self, "_selectedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDelegate:", v4);
  objc_storeWeak((id *)&self->_embeddedMediaDelegate, v4);

}

- (void)loadView
{
  id v3;
  void *v4;
  uint64_t v5;
  UIPageControl *pageIndicator;
  UIPageControl *v7;
  UIPageControl *v8;
  UIPageViewController *pageViewController;
  UIPageViewController *v10;
  UIPageViewController *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  UITapGestureRecognizer *v21;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  UIPageControl *v28;
  UIPageControl *v29;
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
  _QWORD v40[3];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[SUUIGalleryViewController setView:](self, "setView:", v3);
  -[SUUIGalleryPageComponent childComponents](self->_galleryComponent, "childComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  pageIndicator = self->_pageIndicator;
  if (pageIndicator)
    goto LABEL_6;
  if (!-[SUUIGalleryPageComponent hidesPageIndicator](self->_galleryComponent, "hidesPageIndicator") && v5 >= 2)
  {
    v7 = (UIPageControl *)objc_alloc_init(MEMORY[0x24BEBD7D0]);
    v8 = self->_pageIndicator;
    self->_pageIndicator = v7;

    -[UIPageControl setEnabled:](self->_pageIndicator, "setEnabled:", 0);
    -[UIPageControl setNumberOfPages:](self->_pageIndicator, "setNumberOfPages:", v5);
    -[UIPageControl sizeToFit](self->_pageIndicator, "sizeToFit");
  }
  pageIndicator = self->_pageIndicator;
  if (pageIndicator)
  {
LABEL_6:
    -[UIPageControl bounds](pageIndicator, "bounds");
    objc_msgSend(v3, "setFrame:");
  }
  pageViewController = self->_pageViewController;
  if (!pageViewController)
  {
    v10 = (UIPageViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7D8]), "initWithTransitionStyle:navigationOrientation:options:", 1, 0, 0);
    v11 = self->_pageViewController;
    self->_pageViewController = v10;

    -[UIPageViewController setDataSource:](self->_pageViewController, "setDataSource:", self);
    -[UIPageViewController setDelegate:](self->_pageViewController, "setDelegate:", self);
    if (v5 >= 1)
    {
      v12 = -[SUUIGalleryViewController _newViewControllerWithIndex:](self, "_newViewControllerWithIndex:", 0);
      v40[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIPageViewController setViewControllers:direction:animated:completion:](self->_pageViewController, "setViewControllers:direction:animated:completion:", v13, 0, 0, 0);
    }
    -[SUUIGalleryViewController addChildViewController:](self, "addChildViewController:", self->_pageViewController);
    pageViewController = self->_pageViewController;
  }
  -[UIPageViewController view](pageViewController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "bounds");
  objc_msgSend(v14, "setFrame:");
  objc_msgSend(v3, "addSubview:", v14);
  objc_msgSend(v14, "subviews");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v20, "setDelegate:", self);
          objc_msgSend(v20, "setScrollsToTop:", 0);
          goto LABEL_21;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v17)
        continue;
      break;
    }
  }
LABEL_21:

  if (!self->_tapGestureRecognizer)
  {
    v21 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__tapAction_);
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v21;

    -[UIPageViewController gestureRecognizers](self->_pageViewController, "gestureRecognizers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v23);
          -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_tapGestureRecognizer, "requireGestureRecognizerToFail:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v25);
    }
    objc_msgSend(v14, "addGestureRecognizer:", self->_tapGestureRecognizer);

  }
  v28 = self->_pageIndicator;
  if (v28)
  {
    -[UIPageControl setAutoresizingMask:](v28, "setAutoresizingMask:", 10);
    v29 = self->_pageIndicator;
    objc_msgSend(v3, "bounds");
    -[UIPageControl setFrame:](v29, "setFrame:");
    objc_msgSend(v3, "addSubview:", self->_pageIndicator);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUUIGalleryViewController _startCycleTimer](self, "_startCycleTimer");
  v5.receiver = self;
  v5.super_class = (Class)SUUIGalleryViewController;
  -[SUUIGalleryViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUUIGalleryViewController _stopCycleTimer](self, "_stopCycleTimer");
  v5.receiver = self;
  v5.super_class = (Class)SUUIGalleryViewController;
  -[SUUIGalleryViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[SUUIGalleryViewController _selectedViewController](self, "_selectedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "component");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_componentArtworkRequests, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");
    if (v11 == objc_msgSend(v13, "requestIdentifier"))
    {
      objc_msgSend(v8, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setThumbnailImage:", v6);

    }
  }

}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  return -[SUUIGalleryViewController _newViewControllerWithIndex:](self, "_newViewControllerWithIndex:", objc_msgSend(a4, "galleryIndex", a3) - 1);
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  return -[SUUIGalleryViewController _newViewControllerWithIndex:](self, "_newViewControllerWithIndex:", objc_msgSend(a4, "galleryIndex", a3) + 1);
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  id v7;

  -[SUUIGalleryViewController _selectedViewController](self, "_selectedViewController", a3, a4, a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPageControl setCurrentPage:](self->_pageIndicator, "setCurrentPage:", objc_msgSend(v7, "galleryIndex"));

}

- (void)_tapAction:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[SUUIGalleryViewController performActionForSelectedComponentAnimated:](self, "performActionForSelectedComponentAnimated:", 1);
}

- (void)_finishPaneAnimation
{
  id v3;

  -[SUUIGalleryViewController _selectedViewController](self, "_selectedViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPageControl setCurrentPage:](self->_pageIndicator, "setCurrentPage:", objc_msgSend(v3, "galleryIndex"));
  -[SUUIGalleryViewController _startCycleTimer](self, "_startCycleTimer");

}

- (id)_newViewControllerWithIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  SUUIGalleryPaneViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  -[SUUIGalleryPageComponent childComponents](self->_galleryComponent, "childComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a3 % (unint64_t)objc_msgSend(v5, "count");
  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUUIGalleryPaneViewController initWithMediaComponent:galleryIndex:]([SUUIGalleryPaneViewController alloc], "initWithMediaComponent:galleryIndex:", v7, v6);
  -[NSMapTable objectForKey:](self->_componentArtworkRequests, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    -[SUUIResourceLoader cachedResourceForRequestIdentifier:](self->_artworkLoader, "cachedResourceForRequestIdentifier:", objc_msgSend(v9, "unsignedIntegerValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = -[SUUIGalleryViewController _newViewWithMediaComponent:](self, "_newViewWithMediaComponent:", v7);
  objc_msgSend(v12, "setAutoresizingMask:", 18);
  -[SUUIGalleryViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v14);

  objc_msgSend(v12, "setThumbnailImage:", v11);
  -[SUUIGalleryPaneViewController setView:](v8, "setView:", v12);

  return v8;
}

- (id)_newViewWithMediaComponent:(id)a3
{
  id v4;
  SUUIEmbeddedMediaView *v5;
  void *v6;
  id WeakRetained;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(SUUIEmbeddedMediaView);
  objc_msgSend(v4, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIEmbeddedMediaView setAccessibilityLabel:](v5, "setAccessibilityLabel:", v6);

  WeakRetained = objc_loadWeakRetained((id *)&self->_embeddedMediaDelegate);
  -[SUUIEmbeddedMediaView setDelegate:](v5, "setDelegate:", WeakRetained);

  -[SUUIEmbeddedMediaView setMediaType:](v5, "setMediaType:", objc_msgSend(v4, "mediaType"));
  objc_msgSend(v4, "mediaURLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIEmbeddedMediaView setMediaURLString:](v5, "setMediaURLString:", v8);
  return v5;
}

- (id)_selectedViewController
{
  void *v2;
  void *v3;

  -[UIPageViewController viewControllers](self->_pageViewController, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_showNextPaneAnimated:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  UIPageViewController *pageViewController;
  void *v9;
  _QWORD v10[4];
  id v11;
  char v12;
  id location;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[SUUIGalleryViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUserInteractionEnabled");
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  -[SUUIGalleryViewController _stopCycleTimer](self, "_stopCycleTimer");
  -[SUUIGalleryViewController _selectedViewController](self, "_selectedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUUIGalleryViewController _newViewControllerWithIndex:](self, "_newViewControllerWithIndex:", objc_msgSend(v6, "galleryIndex") + 1);
  objc_initWeak(&location, self);
  pageViewController = self->_pageViewController;
  v14[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__SUUIGalleryViewController__showNextPaneAnimated___block_invoke;
  v10[3] = &unk_2511FB4D8;
  objc_copyWeak(&v11, &location);
  v12 = v5;
  -[UIPageViewController setViewControllers:direction:animated:completion:](pageViewController, "setViewControllers:direction:animated:completion:", v9, 0, 1, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __51__SUUIGalleryViewController__showNextPaneAnimated___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", *(unsigned __int8 *)(a1 + 40));

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_finishPaneAnimation");

}

- (void)_startCycleTimer
{
  double v3;
  double v4;
  NSObject *cycleTimer;
  dispatch_time_t v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[SUUIGalleryPageComponent cycleInterval](self->_galleryComponent, "cycleInterval");
  if (v3 > 0.0)
  {
    v4 = v3;
    cycleTimer = self->_cycleTimer;
    if (cycleTimer)
    {
      v6 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
      dispatch_source_set_timer(cycleTimer, v6, 0, 0);
    }
    else
    {
      objc_initWeak(&location, self);
      v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
      v8 = self->_cycleTimer;
      self->_cycleTimer = v7;

      v9 = self->_cycleTimer;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __45__SUUIGalleryViewController__startCycleTimer__block_invoke;
      v12[3] = &unk_2511F53F8;
      objc_copyWeak(&v13, &location);
      dispatch_source_set_event_handler(v9, v12);
      v10 = self->_cycleTimer;
      v11 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
      dispatch_source_set_timer(v10, v11, 0, 0);
      dispatch_resume((dispatch_object_t)self->_cycleTimer);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __45__SUUIGalleryViewController__startCycleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showNextPaneAnimated:", 1);

}

- (void)_stopCycleTimer
{
  NSObject *cycleTimer;
  OS_dispatch_source *v4;

  cycleTimer = self->_cycleTimer;
  if (cycleTimer)
  {
    dispatch_source_cancel(cycleTimer);
    v4 = self->_cycleTimer;
    self->_cycleTimer = 0;

  }
}

- (SUUIEmbeddedMediaViewDelegate)embeddedMediaDelegate
{
  return (SUUIEmbeddedMediaViewDelegate *)objc_loadWeakRetained((id *)&self->_embeddedMediaDelegate);
}

- (SUUIGalleryPageComponent)galleryComponent
{
  return self->_galleryComponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_pageIndicator, 0);
  objc_storeStrong((id *)&self->_galleryComponent, 0);
  objc_destroyWeak((id *)&self->_embeddedMediaDelegate);
  objc_storeStrong((id *)&self->_cycleTimer, 0);
  objc_storeStrong((id *)&self->_componentArtworkRequests, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

@end
