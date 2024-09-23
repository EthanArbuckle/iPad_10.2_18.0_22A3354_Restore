@implementation SUUIViewController

- (void)setClientContext:(id)a3
{
  SUUIClientContext *v5;
  SUUIClientContext *v6;

  v5 = (SUUIClientContext *)a3;
  if (self->_clientContext != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    -[SUUIIPadSearchController setClientContext:](self->_searchController, "setClientContext:", self->_clientContext);
    v5 = v6;
  }

}

- (SUUIViewController)initWithTabBarItem:(id)a3
{
  id v4;
  SUUIViewController *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIViewController;
  v5 = -[SUUIViewController init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "underlyingTabBarItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewController setTabBarItem:](v5, "setTabBarItem:", v6);
    objc_msgSend(v6, "_internalTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewController setTitle:](v5, "setTitle:", v7);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUINetworkErrorViewController setDelegate:](self->_networkErrorViewController, "setDelegate:", 0);
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  -[UIBarButtonItem setTarget:](self->_wishlistButtonItem, "setTarget:", 0);
  -[SUUIPopoverObserver setTarget:selector:](self->_wishlistPopoverObserver, "setTarget:selector:", 0, 0);
  -[SUUIWishlistViewController setDelegate:](self->_wishlistViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIViewController;
  -[SUUIViewController dealloc](&v3, sel_dealloc);
}

- (SUUIIPadSearchController)IPadSearchController
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  BOOL v7;

  v3 = (void *)SUUIUserInterfaceIdiom(self->_clientContext);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    if (v6 <= SUUICompactThreshold())
    {

    }
    else
    {
      v7 = -[SUUIClientContext shouldForceTransientSearchControllerBahavior](self->_clientContext, "shouldForceTransientSearchControllerBahavior");

      if (!v7)
      {
        -[SUUIViewController _getIPadSearchController](self, "_getIPadSearchController");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        return (SUUIIPadSearchController *)v3;
      }
    }
    v3 = 0;
  }
  return (SUUIIPadSearchController *)v3;
}

- (id)_getIPadSearchController
{
  SUUIIPadSearchController *searchController;
  SUUIIPadSearchController *v4;
  SUUIIPadSearchController *v5;
  SUUIIPadSearchController *v6;
  void *v7;

  searchController = self->_searchController;
  if (!searchController)
  {
    v4 = -[SUUIIPadSearchController initWithParentViewController:]([SUUIIPadSearchController alloc], "initWithParentViewController:", self);
    v5 = self->_searchController;
    self->_searchController = v4;

    v6 = self->_searchController;
    -[SUUIViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIIPadSearchController setClientContext:](v6, "setClientContext:", v7);

    searchController = self->_searchController;
  }
  return searchController;
}

- (NSOperationQueue)operationQueue
{
  NSOperationQueue *operationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;
  NSOperationQueue *v6;
  void *v7;

  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 2);
    v6 = self->_operationQueue;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.iTunesStoreUI.%@.%p"), objc_opt_class(), self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v6, "setName:", v7);

    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (void)showDefaultNavigationItems
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  -[SUUIViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[SUUIViewController _defaultRightBarButtonItemsIsCompact:](self, "_defaultRightBarButtonItemsIsCompact:", v6 <= SUUICompactThreshold());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItems:", v7);

  -[SUUIViewController navigationItem](self, "navigationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIViewController _defaultLeftBarButtonItems](self, "_defaultLeftBarButtonItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItems:", v8);

}

- (void)showDefaultNavigationItemsForSize:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  width = a3.width;
  -[SUUIViewController navigationItem](self, "navigationItem", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewController _defaultLeftBarButtonItems](self, "_defaultLeftBarButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItems:", v6);

  -[SUUIViewController navigationItem](self, "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIViewController _defaultRightBarButtonItemsIsCompact:](self, "_defaultRightBarButtonItemsIsCompact:", width <= SUUICompactThreshold());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItems:", v7);

}

- (void)showDefaultNavigationItemsIsCompact:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[SUUIViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewController _defaultLeftBarButtonItems](self, "_defaultLeftBarButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItems:", v6);

  -[SUUIViewController navigationItem](self, "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIViewController _defaultRightBarButtonItemsIsCompact:](self, "_defaultRightBarButtonItemsIsCompact:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItems:", v7);

}

- (void)showError:(id)a3
{
  SUUINetworkErrorViewController *v4;
  SUUINetworkErrorViewController *networkErrorViewController;
  SUUINetworkErrorViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (+[SUUINetworkErrorViewController canDisplayError:](SUUINetworkErrorViewController, "canDisplayError:"))
  {
    if (!self->_networkErrorViewController)
    {
      v4 = -[SUUINetworkErrorViewController initWithError:]([SUUINetworkErrorViewController alloc], "initWithError:", v10);
      networkErrorViewController = self->_networkErrorViewController;
      self->_networkErrorViewController = v4;

      v6 = self->_networkErrorViewController;
      -[SUUIViewController clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUINetworkErrorViewController setClientContext:](v6, "setClientContext:", v7);

      -[SUUINetworkErrorViewController setDelegate:](self->_networkErrorViewController, "setDelegate:", self);
      -[SUUIViewController addChildViewController:](self, "addChildViewController:", self->_networkErrorViewController);
      -[SUUIViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUINetworkErrorViewController view](self->_networkErrorViewController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAutoresizingMask:", 18);
      objc_msgSend(v8, "bounds");
      objc_msgSend(v9, "setFrame:");
      objc_msgSend(v8, "addSubview:", v9);

    }
  }
  else
  {
    NSLog(CFSTR("[Load Failure]: %@"), v10);
    if (SUUIViewControllerIsVisible(self))
      -[SUUIViewController _showDialogWithError:](self, "_showDialogWithError:", v10);
  }

}

- (BOOL)showingError
{
  return self->_networkErrorViewController != 0;
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
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIViewController;
  -[SUUIViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SUUIViewController _reloadForOrientation:](self, "_reloadForOrientation:", -[SUUIViewController interfaceOrientation](self, "interfaceOrientation"));
  -[SUUIIPadSearchController reloadSearchField](self->_searchController, "reloadSearchField");
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIViewController;
  -[SUUIViewController willAnimateRotationToInterfaceOrientation:duration:](&v6, sel_willAnimateRotationToInterfaceOrientation_duration_, a4);
  -[SUUIViewController _reloadForOrientation:](self, "_reloadForOrientation:", a3);
}

- (void)forceOrientationBackToSupportedOrientation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v7, "statusBarOrientation") - 3) <= 1
    && (-[SUUIViewController supportedInterfaceOrientations](self, "supportedInterfaceOrientations") & 0x18) == 0)
  {
    if (!-[SUUIViewController isViewLoaded](self, "isViewLoaded")
      || (-[SUUIViewController view](self, "view"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "window"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v3,
          !v4))
    {
      -[SUUIViewController presentedViewController](self, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        objc_msgSend(MEMORY[0x24BEBDB58], "keyWindow");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_msgSend(v4, "_setRotatableViewOrientation:duration:force:", 1, 1, 0.0);

  }
}

- (void)networkErrorViewControllerInvalidated:(id)a3
{
  id v4;
  SUUINetworkErrorViewController *networkErrorViewController;
  void *v6;
  SUUINetworkErrorViewController *v7;
  int IsVisible;
  id v9;

  v4 = a3;
  networkErrorViewController = self->_networkErrorViewController;
  if (networkErrorViewController)
  {
    v9 = v4;
    -[SUUINetworkErrorViewController setDelegate:](networkErrorViewController, "setDelegate:", 0);
    -[SUUINetworkErrorViewController view](self->_networkErrorViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[SUUINetworkErrorViewController removeFromParentViewController](self->_networkErrorViewController, "removeFromParentViewController");
    v7 = self->_networkErrorViewController;
    self->_networkErrorViewController = 0;

    IsVisible = SUUIViewControllerIsVisible(self);
    v4 = v9;
    if (IsVisible)
    {
      -[SUUIViewController reloadData](self, "reloadData");
      v4 = v9;
    }
  }

}

- (void)_wishlistPopoverDidDismiss
{
  SUUIPopoverObserver *wishlistPopoverObserver;
  SUUIWishlistViewController *wishlistViewController;

  -[SUUIPopoverObserver setTarget:selector:](self->_wishlistPopoverObserver, "setTarget:selector:", 0, 0);
  wishlistPopoverObserver = self->_wishlistPopoverObserver;
  self->_wishlistPopoverObserver = 0;

  -[SUUIWishlistViewController setDelegate:](self->_wishlistViewController, "setDelegate:", 0);
  wishlistViewController = self->_wishlistViewController;
  self->_wishlistViewController = 0;

}

- (void)productPageOverlayDidDismiss:(id)a3
{
  SUUIProductPageOverlayController *productPageOverlayController;

  -[SUUIProductPageOverlayController setDelegate:](self->_productPageOverlayController, "setDelegate:", 0);
  productPageOverlayController = self->_productPageOverlayController;
  self->_productPageOverlayController = 0;

}

- (void)wishlist:(id)a3 didSelectItem:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  SUUIPopoverObserver *wishlistPopoverObserver;
  SUUIWishlistViewController *wishlistViewController;
  SUUIProductPageOverlayController *v17;
  SUUIProductPageOverlayController *productPageOverlayController;
  SUUIProductPageOverlayController *v19;
  void *v20;
  float v21;
  dispatch_time_t v22;
  id *v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "userInterfaceIdiom"))
  {

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyWindow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v14 = SUUICompactThreshold();

  if (v13 <= v14)
  {
LABEL_7:
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __57__SUUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke;
    v28[3] = &unk_2511F46D0;
    v23 = &v29;
    v28[4] = self;
    v29 = v8;
    v25 = v8;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v28);
    goto LABEL_8;
  }
  -[SUUIPopoverObserver setTarget:selector:](self->_wishlistPopoverObserver, "setTarget:selector:", 0, 0);
  -[SUUIPopoverObserver dismissPopoverAnimated:](self->_wishlistPopoverObserver, "dismissPopoverAnimated:", 1);
  wishlistPopoverObserver = self->_wishlistPopoverObserver;
  self->_wishlistPopoverObserver = 0;

  -[SUUIWishlistViewController setDelegate:](self->_wishlistViewController, "setDelegate:", 0);
  wishlistViewController = self->_wishlistViewController;
  self->_wishlistViewController = 0;

  if (!self->_productPageOverlayController)
  {
    v17 = -[SUUIProductPageOverlayController initWithParentViewController:]([SUUIProductPageOverlayController alloc], "initWithParentViewController:", self);
    productPageOverlayController = self->_productPageOverlayController;
    self->_productPageOverlayController = v17;

    v19 = self->_productPageOverlayController;
    -[SUUIViewController clientContext](self, "clientContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageOverlayController setClientContext:](v19, "setClientContext:", v20);

    -[SUUIProductPageOverlayController setDelegate:](self->_productPageOverlayController, "setDelegate:", self);
  }
  UIAnimationDragCoefficient();
  v22 = dispatch_time(0, (uint64_t)(v21 * 0.35 * 1000000000.0));
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __57__SUUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke_4;
  v26[3] = &unk_2511F46D0;
  v23 = &v27;
  v26[4] = self;
  v27 = v8;
  v24 = v8;
  dispatch_after(v22, MEMORY[0x24BDAC9B8], v26);
LABEL_8:

}

void __57__SUUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "clientContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lookupDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIXEventSidepackDictionary((uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__SUUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke_2;
  v6[3] = &unk_2511FA080;
  v7 = *(id *)(a1 + 40);
  v8 = v2;
  v9 = *(_QWORD *)(a1 + 32);
  v5 = v2;
  objc_msgSend(v5, "sendOnXEventWithDictionary:completionBlock:", v4, v6);

}

void __57__SUUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke_2(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;

  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__SUUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke_3;
    block[3] = &unk_2511F4798;
    v6 = *(id *)(a1 + 32);
    v3 = *(id *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v7 = v3;
    v8 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __57__SUUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;
  SUUIIPhoneProductPageViewController *v3;

  v3 = -[SUUIIPhoneProductPageViewController initWithItem:]([SUUIIPhoneProductPageViewController alloc], "initWithItem:", *(_QWORD *)(a1 + 32));
  -[SUUIViewController setClientContext:](v3, "setClientContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

uint64_t __57__SUUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "showWithInitialItem:", *(_QWORD *)(a1 + 40));
}

- (void)_setWishlistButtonHidden:(BOOL)a3
{
  self->_wishlistButtonHidden = a3;
}

- (void)_wishlistAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  SUUIPopoverObserver *wishlistPopoverObserver;
  SUUIPopoverObserver *v11;
  SUUIWishlistViewController *wishlistViewController;
  id v13;

  v13 = a3;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "userInterfaceIdiom"))
  {

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v9 = SUUICompactThreshold();

  if (v8 <= v9)
  {
LABEL_7:
    -[SUUIViewController _presentWishlistFromSheet](self, "_presentWishlistFromSheet");
    goto LABEL_8;
  }
  wishlistPopoverObserver = self->_wishlistPopoverObserver;
  if (wishlistPopoverObserver)
  {
    -[SUUIPopoverObserver setTarget:selector:](wishlistPopoverObserver, "setTarget:selector:", 0, 0);
    -[SUUIPopoverObserver dismissPopoverAnimated:](self->_wishlistPopoverObserver, "dismissPopoverAnimated:", 1);
    v11 = self->_wishlistPopoverObserver;
    self->_wishlistPopoverObserver = 0;

    -[SUUIWishlistViewController setDelegate:](self->_wishlistViewController, "setDelegate:", 0);
    wishlistViewController = self->_wishlistViewController;
    self->_wishlistViewController = 0;

  }
  -[SUUIViewController _presentWishlistFromPopover:](self, "_presentWishlistFromPopover:", v13);
LABEL_8:

}

- (void)_presentWishlistFromSheet
{
  SUUIWishlistViewController *v3;
  void *v4;
  id v5;

  -[SUUIViewController clientContext](self, "clientContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(SUUIWishlistViewController);
  -[SUUIWishlistViewController setClientContext:](v3, "setClientContext:", v5);
  -[SUUIWishlistViewController setDelegate:](v3, "setDelegate:", self);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v3);
  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  -[SUUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_presentWishlistFromPopover:(id)a3
{
  id v4;
  SUUIWishlistViewController *v5;
  SUUIWishlistViewController *wishlistViewController;
  void *v7;
  void *v8;
  SUUIPopoverObserver *v9;
  SUUIPopoverObserver *wishlistPopoverObserver;
  id v11;

  v4 = a3;
  -[SUUIViewController clientContext](self, "clientContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(SUUIWishlistViewController);
  wishlistViewController = self->_wishlistViewController;
  self->_wishlistViewController = v5;

  -[SUUIWishlistViewController setClientContext:](self->_wishlistViewController, "setClientContext:", v11);
  -[SUUIWishlistViewController setDelegate:](self->_wishlistViewController, "setDelegate:", self);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", self->_wishlistViewController);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD858]), "initWithContentViewController:", v7);
  objc_msgSend(v8, "setPopoverContentSize:", 320.0, 416.0);
  objc_msgSend(v8, "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", v4, 1, 1);

  v9 = -[SUUIPopoverObserver initWithPopoverController:]([SUUIPopoverObserver alloc], "initWithPopoverController:", v8);
  wishlistPopoverObserver = self->_wishlistPopoverObserver;
  self->_wishlistPopoverObserver = v9;

  -[SUUIPopoverObserver setTarget:selector:](self->_wishlistPopoverObserver, "setTarget:selector:", self, sel__wishlistPopoverDidDismiss);
}

- (void)_showDialogWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SUUIViewController clientContext](self, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedAlertWithError:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "show");
}

- (void)_reloadForOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[SUUIViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "customView", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "sizeToFit");
          objc_msgSend(v11, "frame");
          objc_msgSend(v11, "setFrame:");
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[SUUIViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRightBarButtonItems:", 0);

  -[SUUIViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItems:", v6);

}

- (id)_defaultLeftBarButtonItems
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUUIViewController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalLeftBarButtonItemForViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addObject:", v5);

  return v3;
}

- (id)_defaultRightBarButtonItemsIsCompact:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  UIBarButtonItem *wishlistButtonItem;
  void *v16;
  UIBarButtonItem *v17;
  UIBarButtonItem *v18;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUUIViewController clientContext](self, "clientContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "additionalRightBarButtonItemForViewController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "addObject:", v7);
  -[SUUIViewController IPadSearchController](self, "IPadSearchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "newSearchFieldBarItem");

  if (!v9 && !v3)
  {
    if (SUUIUserInterfaceIdiom(self->_clientContext) != 1)
    {
      v9 = 0;
      goto LABEL_12;
    }
    -[SUUIViewController _getIPadSearchController](self, "_getIPadSearchController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "newSearchFieldBarItem");

  }
  if (v9)
  {
    -[SUUIViewController clientContext](self, "clientContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "storeViewController:shouldDisplayDefaultDarButton:", self, 0);

    if (v12)
    {
      if (!v3)
        objc_msgSend(v5, "addObject:", v9);
    }
  }
LABEL_12:
  if (!self->_wishlistButtonHidden)
  {
    -[SUUIViewController clientContext](self, "clientContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "storeViewController:shouldDisplayDefaultDarButton:", self, 1);

    if (v14)
    {
      wishlistButtonItem = self->_wishlistButtonItem;
      if (!wishlistButtonItem)
      {
        -[SUUIViewController clientContext](self, "clientContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUUIWishlistViewController wishlistBarButtonItemWithClientContext:](SUUIWishlistViewController, "wishlistBarButtonItemWithClientContext:", v16);
        v17 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
        v18 = self->_wishlistButtonItem;
        self->_wishlistButtonItem = v17;

        -[UIBarButtonItem setAction:](self->_wishlistButtonItem, "setAction:", sel__wishlistAction_);
        -[UIBarButtonItem setTarget:](self->_wishlistButtonItem, "setTarget:", self);
        wishlistButtonItem = self->_wishlistButtonItem;
      }
      objc_msgSend(v5, "addObject:", wishlistButtonItem);
    }
  }

  return v5;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (UIBarButtonItem)_wishlistButtonItem
{
  return self->_wishlistButtonItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wishlistViewController, 0);
  objc_storeStrong((id *)&self->_wishlistPopoverObserver, 0);
  objc_storeStrong((id *)&self->_wishlistButtonItem, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_productPageOverlayController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_networkErrorViewController, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
