@implementation SUUISlideshowViewController

- (SUUISlideshowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUUISlideshowViewController *v4;
  SUUISlideshowViewController *v5;
  NSOperationQueue *v6;
  NSOperationQueue *remoteLoadQueue;
  NSMutableDictionary *v8;
  NSMutableDictionary *itemViewControllersCache;
  uint64_t v10;
  UIPageViewController *pageViewController;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SUUISlideshowViewController;
  v4 = -[SUUISlideshowViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_currentIndex = 0;
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    remoteLoadQueue = v5->_remoteLoadQueue;
    v5->_remoteLoadQueue = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    itemViewControllersCache = v5->_itemViewControllersCache;
    v5->_itemViewControllersCache = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD7D8]), "initWithTransitionStyle:navigationOrientation:options:", 1, 0, 0);
    pageViewController = v5->_pageViewController;
    v5->_pageViewController = (UIPageViewController *)v10;

    -[UIPageViewController setDataSource:](v5->_pageViewController, "setDataSource:", v5);
    -[UIPageViewController setDelegate:](v5->_pageViewController, "setDelegate:", v5);
    -[SUUISlideshowViewController addChildViewController:](v5, "addChildViewController:", v5->_pageViewController);
    v5->_shouldCancelDelayedOverlayVisibilityChange = 0;
    v5->_overlayVisibilityWillChangeWithDelay = 0;
    v5->_lockOverlayControlsVisible = 0;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v5, sel__doneButtonTapped_);
    -[SUUISlideshowViewController navigationItem](v5, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPageViewController setDataSource:](self->_pageViewController, "setDataSource:", 0);
  -[UIPageViewController setDelegate:](self->_pageViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUISlideshowViewController;
  -[SUUISlideshowViewController dealloc](&v3, sel_dealloc);
}

- (id)animatorForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  SUUISlideshowAnimator *v6;
  id WeakRetained;
  char v8;
  id v9;
  void *v10;

  v6 = objc_alloc_init(SUUISlideshowAnimator);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "slideshowViewController:poppedImageViewAtIndex:", self, self->_currentIndex);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUISlideshowAnimator setImageView:](v6, "setImageView:", v10);
  }
  return v6;
}

- (id)animatorForDismissedController:(id)a3
{
  SUUISlideshowDismissalAnimator *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id WeakRetained;
  char v21;
  id v22;
  id v23;
  char v24;
  id v25;
  void *v26;

  v4 = objc_alloc_init(SUUISlideshowDismissalAnimator);
  -[SUUISlideshowViewController currentItemViewController](self, "currentItemViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUISlideshowViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v7, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v7, "superview");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertRect:fromView:", v19, v12, v14, v16, v18);
    -[SUUISlideshowDismissalAnimator setImageRect:](v4, "setImageRect:");

  }
  else
  {
    objc_msgSend(v9, "bounds");
    -[SUUISlideshowDismissalAnimator setImageRect:](v4, "setImageRect:");
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    v22 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v22, "slideshowViewController:scrollToImageAtIndex:", self, self->_currentIndex);

  }
  v23 = objc_loadWeakRetained((id *)&self->_delegate);
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    v25 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v25, "slideshowViewController:poppedImageViewAtIndex:", self, self->_currentIndex);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUISlideshowDismissalAnimator setImageView:](v4, "setImageView:", v26);
  }

  return v4;
}

- (void)setCurrentIndex:(int64_t)a3
{
  void *v5;
  UIPageViewController *pageViewController;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[SUUISlideshowViewController _itemViewControllerForIndex:](self, "_itemViewControllerForIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pageViewController = self->_pageViewController;
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPageViewController setViewControllers:direction:animated:completion:](pageViewController, "setViewControllers:direction:animated:completion:", v7, 0, 0, 0);

  self->_currentIndex = a3;
  -[SUUISlideshowViewController _updateCurrentIndex](self, "_updateCurrentIndex");

}

- (void)reloadData
{
  -[SUUISlideshowViewController setCurrentIndex:](self, "setCurrentIndex:", self->_currentIndex);
}

- (id)currentItemViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[UIPageViewController viewControllers](self->_pageViewController, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[UIPageViewController viewControllers](self->_pageViewController, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v10 = (id)objc_msgSend(v3, "initWithFrame:");

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithPrivateStyle:", 2020);
  objc_msgSend(v6, "setAutoresizingMask:", 18);
  objc_msgSend(v10, "addSubview:", v6);
  -[UIPageViewController view](self->_pageViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v10, "addSubview:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__contentViewTapped_);
  objc_msgSend(v8, "setNumberOfTapsRequired:", 2);
  objc_msgSend(v7, "addGestureRecognizer:", v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__contentViewTapped_);
  objc_msgSend(v9, "requireGestureRecognizerToFail:", v8);
  objc_msgSend(v7, "addGestureRecognizer:", v9);
  -[SUUISlideshowViewController setView:](self, "setView:", v10);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUISlideshowViewController;
  -[SUUISlideshowViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[SUUISlideshowViewController setCurrentIndex:](self, "setCurrentIndex:", self->_currentIndex);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUISlideshowViewController;
  -[SUUISlideshowViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SUUISlideshowViewController _saveStatusBarAppearanceState](self, "_saveStatusBarAppearanceState");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUISlideshowViewController;
  -[SUUISlideshowViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SUUISlideshowViewController _restoreStatusBarAppearanceState](self, "_restoreStatusBarAppearanceState");
  self->_shouldCancelDelayedOverlayVisibilityChange = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUISlideshowViewController;
  -[SUUISlideshowViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SUUISlideshowViewController _setOverlayVisible:animated:](self, "_setOverlayVisible:animated:", 1, 1);
  -[SUUISlideshowViewController _fadeOutOverlayAfterDelay:](self, "_fadeOutOverlayAfterDelay:", 2);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  void *v7;
  objc_super v8;

  if (!self->_overlayVisible)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStatusBarHidden:", 0);

  }
  v8.receiver = self;
  v8.super_class = (Class)SUUISlideshowViewController;
  -[SUUISlideshowViewController willRotateToInterfaceOrientation:duration:](&v8, sel_willRotateToInterfaceOrientation_duration_, a3, a4);
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  void *v7;
  objc_super v8;

  if (!self->_overlayVisible)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStatusBarHidden:", 1);

  }
  v8.receiver = self;
  v8.super_class = (Class)SUUISlideshowViewController;
  -[SUUISlideshowViewController willAnimateRotationToInterfaceOrientation:duration:](&v8, sel_willAnimateRotationToInterfaceOrientation_duration_, a3, a4);
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  return -[SUUISlideshowViewController _itemViewControllerForIndex:](self, "_itemViewControllerForIndex:", objc_msgSend(a4, "indexInCollection", a3) + 1);
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  return -[SUUISlideshowViewController _itemViewControllerForIndex:](self, "_itemViewControllerForIndex:", objc_msgSend(a4, "indexInCollection", a3) - 1);
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  void *v7;
  id v8;

  if (a6)
  {
    objc_msgSend(a3, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    self->_currentIndex = objc_msgSend(v8, "indexInCollection");
    -[SUUISlideshowViewController _updateCurrentIndex](self, "_updateCurrentIndex");

  }
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  -[SUUISlideshowViewController _setOverlayVisible:animated:](self, "_setOverlayVisible:animated:", 0, 1);
  self->_shouldCancelDelayedOverlayVisibilityChange = 1;
}

- (void)slideshowItemViewControllerDidBeginPinchGesture:(id)a3
{
  -[SUUISlideshowViewController _setOverlayVisible:animated:](self, "_setOverlayVisible:animated:", 0, 1);
}

- (void)slideshowItemViewControllerDidDismissWithPinchGesture:(id)a3 ratio:(double)a4
{
  id v5;

  if (a4 > 0.0)
  {
    -[SUUISlideshowViewController delegate](self, "delegate", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SUUISlideshowViewController _restoreStatusBarAppearanceState](self, "_restoreStatusBarAppearanceState");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "slideshowViewControllerDidFinish:", self);
    else
      -[SUUISlideshowViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (id)_itemViewControllerForIndex:(int64_t)a3
{
  SUUISlideshowViewControllerDataSource **p_dataSource;
  id WeakRetained;
  void *v7;
  id v8;
  int64_t v9;
  NSMutableDictionary *itemViewControllersCache;
  void *v11;
  SUUISlideshowItemViewController *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  _QWORD v23[4];
  SUUISlideshowItemViewController *v24;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v7 = WeakRetained;
  if (a3 < 0 || !WeakRetained)
  {

    goto LABEL_11;
  }
  v8 = objc_loadWeakRetained((id *)p_dataSource);
  v9 = objc_msgSend(v8, "numberOfItemsInSlideshowViewController:", self);

  if (v9 <= a3)
  {
LABEL_11:
    v12 = 0;
    return v12;
  }
  itemViewControllersCache = self->_itemViewControllersCache;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](itemViewControllersCache, "objectForKeyedSubscript:", v11);
  v12 = (SUUISlideshowItemViewController *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v12 = objc_alloc_init(SUUISlideshowItemViewController);
    -[SUUISlideshowItemViewController setClientContext:](v12, "setClientContext:", self->_clientContext);
    -[SUUISlideshowItemViewController setIndexInCollection:](v12, "setIndexInCollection:", a3);
    -[SUUISlideshowItemViewController setDelegate:](v12, "setDelegate:", self);
    v13 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v13, "slideshowViewController:placeholderImageAtIndex:", self, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      -[SUUISlideshowItemViewController setItemImage:](v12, "setItemImage:", v14);
    v15 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v15, "slideshowViewController:dataConsumerAtIndex:", self, a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v17, "slideshowViewController:imageURLAtIndex:", self, a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURL:", v18);
      objc_msgSend(v19, "setITunesStoreRequest:", 0);
      objc_msgSend(v19, "setDataConsumer:", v16);
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __59__SUUISlideshowViewController__itemViewControllerForIndex___block_invoke;
      v23[3] = &unk_2511F6588;
      v24 = v12;
      objc_msgSend(v19, "setOutputBlock:", v23);
      -[NSOperationQueue addOperation:](self->_remoteLoadQueue, "addOperation:", v19);

    }
    v20 = self->_itemViewControllersCache;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v12, v21);

  }
  return v12;
}

void __59__SUUISlideshowViewController__itemViewControllerForIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__SUUISlideshowViewController__itemViewControllerForIndex___block_invoke_2;
  v5[3] = &unk_2511F46D0;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __59__SUUISlideshowViewController__itemViewControllerForIndex___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemImage:", *(_QWORD *)(a1 + 40));
}

- (void)_updateCurrentIndex
{
  -[SUUISlideshowViewController _updateTitleWithIndex:](self, "_updateTitleWithIndex:", self->_currentIndex);
}

- (void)_updateTitleWithIndex:(int64_t)a3
{
  SUUISlideshowViewControllerDataSource **p_dataSource;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SUUIClientContext *clientContext;
  void *v14;
  void *v15;
  id v16;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained)
  {
    v16 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v16, "setNumberStyle:", 1);
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "numberOfItemsInSlideshowViewController:", self));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringFromNumber:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringFromNumber:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("SCREENSHOTS_INDEX_STRING"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SCREENSHOTS_INDEX_STRING"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@%@"), 0, v12, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISlideshowViewController setTitle:](self, "setTitle:", v15);

  }
  else
  {
    -[SUUISlideshowViewController setTitle:](self, "setTitle:", 0);
  }
}

- (void)_contentViewTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "numberOfTapsRequired") == 1)
  {
    if (objc_msgSend(v7, "numberOfTouches") == 1)
    {
      if (self->_overlayVisible)
      {
        if (self->_overlayVisibilityWillChangeWithDelay)
          self->_shouldCancelDelayedOverlayVisibilityChange = 1;
      }
      else
      {
        -[SUUISlideshowViewController _fadeOutOverlayAfterDelay:](self, "_fadeOutOverlayAfterDelay:", 4);
      }
      -[SUUISlideshowViewController _toggleFadeOverlay](self, "_toggleFadeOverlay");
    }
  }
  else if (objc_msgSend(v7, "numberOfTapsRequired") == 2)
  {
    -[UIPageViewController viewControllers](self->_pageViewController, "viewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "imageScrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v6);
    objc_msgSend(v6, "zoomIntoPoint:");

  }
}

- (void)_doneButtonTapped:(id)a3
{
  id v4;

  -[SUUISlideshowViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "slideshowViewControllerDidFinish:", self);
  else
    -[SUUISlideshowViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_toggleFadeOverlay
{
  void *v3;

  -[SUUISlideshowViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[SUUISlideshowViewController _setOverlayVisible:animated:](self, "_setOverlayVisible:animated:", !self->_overlayVisible, 1);
}

- (void)_fadeOutOverlayAfterDelay:(unint64_t)a3
{
  dispatch_time_t v4;
  _QWORD block[4];
  id v6[2];
  id location;

  if (!self->_overlayVisibilityWillChangeWithDelay)
  {
    self->_overlayVisibilityWillChangeWithDelay = 1;
    objc_initWeak(&location, self);
    v4 = dispatch_time(0, 1000000000 * a3);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__SUUISlideshowViewController__fadeOutOverlayAfterDelay___block_invoke;
    block[3] = &unk_2511F5F10;
    objc_copyWeak(v6, &location);
    v6[1] = (id)a3;
    dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(v6);
    objc_destroyWeak(&location);
  }
}

void __57__SUUISlideshowViewController__fadeOutOverlayAfterDelay___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;
  _BYTE *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1002] = 0;
    if (WeakRetained[1003])
    {
      v3 = WeakRetained;
      objc_msgSend(WeakRetained, "_fadeOutOverlayAfterDelay:", *(_QWORD *)(a1 + 40));
      WeakRetained = v3;
    }
    else
    {
      if (!WeakRetained[1001])
      {
        v4 = WeakRetained;
        objc_msgSend(WeakRetained, "_setOverlayVisible:animated:", 0, 1);
        WeakRetained = v4;
      }
      WeakRetained[1001] = 0;
    }
  }

}

- (void)_setOverlayVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  double v16;

  if (self->_overlayVisible != a3)
  {
    v4 = a4;
    v5 = a3;
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStatusBarHidden:withAnimation:", !v5, 1);

    -[SUUISlideshowViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0.0;
    if (v5)
      v11 = 1.0;
    else
      v11 = 0.0;
    objc_msgSend(v9, "setAlpha:", (double)!v5);
    v12 = (void *)MEMORY[0x24BEBDB00];
    if (v4)
      v10 = 0.349999994;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__SUUISlideshowViewController__setOverlayVisible_animated___block_invoke;
    v14[3] = &unk_2511F5818;
    v15 = v9;
    v16 = v11;
    v13 = v9;
    objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 2, v14, 0, v10, 0.0);
    self->_overlayVisible = v5;

  }
}

uint64_t __59__SUUISlideshowViewController__setOverlayVisible_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)_saveStatusBarAppearanceState
{
  id v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self = (SUUISlideshowViewController *)((char *)self + 1008);
  *(_BYTE *)&self->super.super._responderFlags = objc_msgSend(v3, "isStatusBarHidden");
  self->super.super.super.isa = (Class)objc_msgSend(v3, "statusBarStyle");

}

- (void)_restoreStatusBarAppearanceState
{
  int v3;
  $87A25CFEB4A12616BCF98622A5C372A6 *p_savedStatusBarState;
  int hidden;
  id v6;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "isStatusBarHidden");
  p_savedStatusBarState = &self->_savedStatusBarState;
  hidden = p_savedStatusBarState->hidden;
  if (hidden != v3)
    objc_msgSend(v6, "setStatusBarHidden:", hidden != 0);
  if (objc_msgSend(v6, "statusBarStyle") != p_savedStatusBarState->style)
    objc_msgSend(v6, "setStatusBarStyle:");

}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUISlideshowViewControllerDataSource)dataSource
{
  return (SUUISlideshowViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (SUUISlideshowViewControllerDelegate)delegate
{
  return (SUUISlideshowViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_itemViewControllersCache, 0);
  objc_storeStrong((id *)&self->_remoteLoadQueue, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
