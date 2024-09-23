@implementation SUUIPhysicalCirclesDocumentViewController

- (SUUIPhysicalCirclesDocumentViewController)initWithPhysicalCirclesTemplateViewElement:(id)a3
{
  id v5;
  SUUIPhysicalCirclesDocumentViewController *v6;
  SUUIPhysicalCirclesDocumentViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIPhysicalCirclesDocumentViewController;
  v6 = -[SUUIPhysicalCirclesDocumentViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_templateElement, a3);
    -[SUUIPhysicalCirclesTemplateViewElement scriptInterface](v7->_templateElement, "scriptInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v7);

  }
  return v7;
}

- (void)dealloc
{
  SUUIPhysicalCirclesDocumentViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[UIGestureRecognizer delegate](self->_interactivePopGestureRecognizer, "delegate");
  v3 = (SUUIPhysicalCirclesDocumentViewController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    -[UIGestureRecognizer setDelegate:](self->_interactivePopGestureRecognizer, "setDelegate:", 0);
  -[SUUIOnboardingAffiliationCirclesViewController setDelegate:](self->_circlesViewController, "setDelegate:", 0);
  -[SUUIOnboardingFooterView leftButton](self->_footerView, "leftButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SUUIOnboardingFooterView rightButton](self->_footerView, "rightButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SUUIPhysicalCirclesTemplateViewElement scriptInterface](self->_templateElement, "scriptInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  v7.receiver = self;
  v7.super_class = (Class)SUUIPhysicalCirclesDocumentViewController;
  -[SUUIViewController dealloc](&v7, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  SUUIOnboardingAffiliationCirclesViewController *v6;
  SUUIOnboardingAffiliationCirclesViewController *circlesViewController;
  SUUIOnboardingAffiliationCirclesViewController *v8;
  void *v9;
  void *v10;
  SUUIOnboardingAffiliationCirclesViewController *v11;
  void *v12;
  SUUIOnboardingFooterView *v13;
  SUUIOnboardingFooterView *footerView;
  SUUIOnboardingFooterView *v15;
  void *v16;
  void *v17;
  void *v18;
  SUUIOnboardingProgressView *v19;
  SUUIOnboardingProgressView *progressView;
  SUUIOnboardingProgressView *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[SUUIPhysicalCirclesTemplateViewElement style](self->_templateElement, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ikBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v24, "setBackgroundColor:", v5);
  -[SUUIPhysicalCirclesDocumentViewController setView:](self, "setView:", v24);
  if (!self->_circlesViewController)
  {
    v6 = objc_alloc_init(SUUIOnboardingAffiliationCirclesViewController);
    circlesViewController = self->_circlesViewController;
    self->_circlesViewController = v6;

    v8 = self->_circlesViewController;
    -[SUUIPhysicalCirclesTemplateViewElement circleItemElements](self->_templateElement, "circleItemElements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPhysicalCirclesDocumentViewController _affiliationItemsWithCircleItemElements:](self, "_affiliationItemsWithCircleItemElements:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIOnboardingAffiliationCirclesViewController setAffiliationItems:](v8, "setAffiliationItems:", v10);

    v11 = self->_circlesViewController;
    -[SUUIViewController clientContext](self, "clientContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIOnboardingAffiliationCirclesViewController setClientContext:](v11, "setClientContext:", v12);

    -[SUUIOnboardingAffiliationCirclesViewController setDelegate:](self->_circlesViewController, "setDelegate:", self);
    -[SUUIPhysicalCirclesDocumentViewController addChildViewController:](self, "addChildViewController:", self->_circlesViewController);
    -[SUUIOnboardingAffiliationCirclesViewController didMoveToParentViewController:](self->_circlesViewController, "didMoveToParentViewController:", self);
  }
  if (!self->_footerView)
  {
    v13 = objc_alloc_init(SUUIOnboardingFooterView);
    footerView = self->_footerView;
    self->_footerView = v13;

    v15 = self->_footerView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIOnboardingFooterView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[SUUIOnboardingFooterView leftButton](self->_footerView, "leftButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel__footerLeftButtonAction_, 64);

    -[SUUIOnboardingFooterView rightButton](self->_footerView, "rightButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__footerRightButtonAction_, 64);

    -[SUUIOnboardingAffiliationCirclesViewController setFooterView:](self->_circlesViewController, "setFooterView:", self->_footerView);
  }
  if (!self->_progressView)
  {
    v19 = objc_alloc_init(SUUIOnboardingProgressView);
    progressView = self->_progressView;
    self->_progressView = v19;

    v21 = self->_progressView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIOnboardingProgressView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[SUUIOnboardingProgressView setFillColor:](self->_progressView, "setFillColor:", v5);
    -[SUUIOnboardingProgressView sizeToFit](self->_progressView, "sizeToFit");
    -[SUUIOnboardingFooterView setProgressView:](self->_footerView, "setProgressView:", self->_progressView);
  }
  -[SUUIPhysicalCirclesDocumentViewController _reloadFooterViewAnimated:](self, "_reloadFooterViewAnimated:", 0);
  -[SUUIPhysicalCirclesDocumentViewController _reloadInstructionsView](self, "_reloadInstructionsView");
  -[SUUIOnboardingAffiliationCirclesViewController view](self->_circlesViewController, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAutoresizingMask:", 18);
  objc_msgSend(v24, "bounds");
  objc_msgSend(v23, "setFrame:");
  objc_msgSend(v24, "addSubview:", v23);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  SUUIPhysicalCirclesDocumentViewController *v5;
  void *v6;
  UIGestureRecognizer *v7;
  UIGestureRecognizer *interactivePopGestureRecognizer;
  UIGestureRecognizer *v9;
  objc_super v10;

  v3 = a3;
  -[SUUIResourceLoader enterForeground](self->_resourceLoader, "enterForeground");
  if (!self->_resourceLoader)
    -[SUUIPhysicalCirclesDocumentViewController _loadImagesWithReason:](self, "_loadImagesWithReason:", 0);
  -[UIGestureRecognizer delegate](self->_interactivePopGestureRecognizer, "delegate");
  v5 = (SUUIPhysicalCirclesDocumentViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    -[UIGestureRecognizer setDelegate:](self->_interactivePopGestureRecognizer, "setDelegate:", 0);
  -[SUUIPhysicalCirclesDocumentViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactivePopGestureRecognizer");
  v7 = (UIGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  interactivePopGestureRecognizer = self->_interactivePopGestureRecognizer;
  self->_interactivePopGestureRecognizer = v7;

  v9 = self->_interactivePopGestureRecognizer;
  if (v9)
    -[UIGestureRecognizer setDelegate:](v9, "setDelegate:", self);
  v10.receiver = self;
  v10.super_class = (Class)SUUIPhysicalCirclesDocumentViewController;
  -[SUUIPhysicalCirclesDocumentViewController viewDidAppear:](&v10, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  SUUIPhysicalCirclesDocumentViewController *v5;
  UIGestureRecognizer *interactivePopGestureRecognizer;
  objc_super v7;

  v3 = a3;
  -[UIGestureRecognizer delegate](self->_interactivePopGestureRecognizer, "delegate");
  v5 = (SUUIPhysicalCirclesDocumentViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    -[UIGestureRecognizer setDelegate:](self->_interactivePopGestureRecognizer, "setDelegate:", 0);
  interactivePopGestureRecognizer = self->_interactivePopGestureRecognizer;
  self->_interactivePopGestureRecognizer = 0;

  v7.receiver = self;
  v7.super_class = (Class)SUUIPhysicalCirclesDocumentViewController;
  -[SUUIPhysicalCirclesDocumentViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIPhysicalCirclesDocumentViewController;
  -[SUUIPhysicalCirclesDocumentViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SUUIResourceLoader enterBackground](self->_resourceLoader, "enterBackground");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  CGFloat v10;
  void *v11;
  double Width;
  void *v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  -[SUUIPhysicalCirclesDocumentViewController topLayoutGuide](self, "topLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "length");
  v5 = v4;

  -[SUUIPhysicalCirclesDocumentViewController bottomLayoutGuide](self, "bottomLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "length");
  v8 = v7;

  -[SUUIPhysicalCirclesDocumentViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v10 = CGRectGetHeight(v15) - v5 - v8;

  -[SUUIPhysicalCirclesDocumentViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  Width = CGRectGetWidth(v16);

  -[SUUIOnboardingAffiliationCirclesViewController view](self->_circlesViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", 0.0, v5, Width, v10);

  v14.receiver = self;
  v14.super_class = (Class)SUUIPhysicalCirclesDocumentViewController;
  -[SUUIPhysicalCirclesDocumentViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSMapTable *imageRequests;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v17 = a4;
  v6 = (objc_class *)MEMORY[0x24BDD16E0];
  v7 = a3;
  v8 = [v6 alloc];
  v9 = objc_msgSend(v7, "requestIdentifier");

  v10 = (void *)objc_msgSend(v8, "initWithUnsignedLongLong:", v9);
  -[SUUIPhysicalCirclesDocumentViewController _profileImageElement](self, "_profileImageElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    goto LABEL_5;
  imageRequests = self->_imageRequests;
  objc_msgSend(v11, "resourceCacheKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](imageRequests, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "isEqualToNumber:", v10))
  {

LABEL_5:
    -[SUUIOnboardingAffiliationCirclesViewController affiliationItems](self->_circlesViewController, "affiliationItems", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __73__SUUIPhysicalCirclesDocumentViewController_artworkRequest_didLoadImage___block_invoke;
    v18[3] = &unk_2511FC560;
    v18[4] = self;
    v19 = v10;
    v20 = v17;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v18);

    goto LABEL_6;
  }
  -[SUUIOnboardingProgressView setImage:](self->_progressView, "setImage:", v17);

LABEL_6:
}

void __73__SUUIPhysicalCirclesDocumentViewController_artworkRequest_didLoadImage___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a2;
  v7 = *(void **)(a1[4] + 1056);
  v10 = v6;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToNumber:", a1[5]))
  {
    objc_msgSend(*(id *)(a1[4] + 1040), "setImage:forAffiliationItem:", a1[6], v10);
    *a4 = 1;
  }

}

- (void)documentDidUpdate:(id)a3
{
  id v4;
  dispatch_group_t v5;
  SUUIPhysicalCirclesTemplateViewElement *v6;
  SUUIPhysicalCirclesTemplateViewElement **p_templateElement;
  SUUIPhysicalCirclesTemplateViewElement *templateElement;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  SUUIOnboardingAffiliationCirclesViewController *circlesViewController;
  SUUIPhysicalCirclesTemplateViewElement *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  SUUIPhysicalCirclesTemplateViewElement *v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  NSObject *v31;
  SUUIPhysicalCirclesDocumentViewController *v32;

  v4 = a3;
  v5 = dispatch_group_create();
  objc_msgSend(v4, "templateElement");
  v6 = (SUUIPhysicalCirclesTemplateViewElement *)objc_claimAutoreleasedReturnValue();

  p_templateElement = &self->_templateElement;
  templateElement = self->_templateElement;
  if (templateElement != v6)
  {
    -[SUUIPhysicalCirclesTemplateViewElement scriptInterface](templateElement, "scriptInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", 0);

    objc_storeStrong((id *)&self->_templateElement, v6);
    -[SUUIPhysicalCirclesTemplateViewElement scriptInterface](*p_templateElement, "scriptInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

  }
  -[SUUIPhysicalCirclesDocumentViewController _reloadFooterViewAnimated:](self, "_reloadFooterViewAnimated:", 1);
  -[SUUIPhysicalCirclesDocumentViewController _reloadInstructionsView](self, "_reloadInstructionsView");
  -[SUUIOnboardingAffiliationCirclesViewController affiliationItems](self->_circlesViewController, "affiliationItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIPhysicalCirclesTemplateViewElement circleItemElements](*p_templateElement, "circleItemElements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIPhysicalCirclesDocumentViewController _affiliationItemsWithCircleItemElements:](self, "_affiliationItemsWithCircleItemElements:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v15 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __63__SUUIPhysicalCirclesDocumentViewController_documentDidUpdate___block_invoke;
  v28[3] = &unk_2511FC588;
  v16 = v13;
  v29 = v16;
  v17 = v14;
  v30 = v17;
  v18 = v5;
  v31 = v18;
  v32 = self;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v28);
  if (objc_msgSend(v17, "count"))
  {
    dispatch_group_enter(v18);
    circlesViewController = self->_circlesViewController;
    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = __63__SUUIPhysicalCirclesDocumentViewController_documentDidUpdate___block_invoke_3;
    v26[3] = &unk_2511F4908;
    v27 = v18;
    -[SUUIOnboardingAffiliationCirclesViewController removeAffiliationItemsInIndexSet:animated:completionBlock:](circlesViewController, "removeAffiliationItemsInIndexSet:animated:completionBlock:", v17, 1, v26);

  }
  if (objc_msgSend(v16, "count"))
    -[SUUIOnboardingAffiliationCirclesViewController addAffiliationItems:](self->_circlesViewController, "addAffiliationItems:", v16);
  v21 = v15;
  v22 = 3221225472;
  v23 = __63__SUUIPhysicalCirclesDocumentViewController_documentDidUpdate___block_invoke_4;
  v24 = &unk_2511F47C0;
  v25 = v6;
  v20 = v6;
  dispatch_group_notify(v18, MEMORY[0x24BDAC9B8], &v21);
  -[SUUIPhysicalCirclesDocumentViewController _loadImagesWithReason:](self, "_loadImagesWithReason:", 0, v21, v22, v23, v24);

}

void __63__SUUIPhysicalCirclesDocumentViewController_documentDidUpdate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }
  else
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "userAffinityCount");
    if (v9 != objc_msgSend(v8, "userAffinityCount"))
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      v10 = *(void **)(*(_QWORD *)(a1 + 56) + 1040);
      v11 = objc_msgSend(v8, "userAffinityCount");
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __63__SUUIPhysicalCirclesDocumentViewController_documentDidUpdate___block_invoke_2;
      v12[3] = &unk_2511F4908;
      v13 = *(id *)(a1 + 48);
      objc_msgSend(v10, "setUserAffinityCount:forAffiliationItemAtIndex:animated:completionBlock:", v11, a3, 1, v12);

    }
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v7);

  }
}

void __63__SUUIPhysicalCirclesDocumentViewController_documentDidUpdate___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__SUUIPhysicalCirclesDocumentViewController_documentDidUpdate___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__SUUIPhysicalCirclesDocumentViewController_documentDidUpdate___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "scriptInterface");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishDOMUpdates");

}

- (void)onboardingCircles:(id)a3 didRemoveAffiliationItem:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SUUIPhysicalCirclesDocumentViewController *v10;

  objc_msgSend(a4, "identifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIPhysicalCirclesTemplateViewElement circleItemElements](self->_templateElement, "circleItemElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __88__SUUIPhysicalCirclesDocumentViewController_onboardingCircles_didRemoveAffiliationItem___block_invoke;
  v8[3] = &unk_2511FC5B0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __88__SUUIPhysicalCirclesDocumentViewController_onboardingCircles_didRemoveAffiliationItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1088), "dispatchRemovedEventWithChildViewElement:", v8);
    *a4 = 1;
  }

}

- (void)onboardingCircles:(id)a3 didSelectAffiliationItem:(id)a4 atIndex:(int64_t)a5
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a4, "identifier", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIPhysicalCirclesTemplateViewElement circleItemElements](self->_templateElement, "circleItemElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __96__SUUIPhysicalCirclesDocumentViewController_onboardingCircles_didSelectAffiliationItem_atIndex___block_invoke;
  v9[3] = &unk_2511FC5D8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __96__SUUIPhysicalCirclesDocumentViewController_onboardingCircles_didSelectAffiliationItem_atIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
  {
    objc_msgSend(v7, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
    *a4 = 1;
  }

}

- (void)physicalCirclesDOMFeature:(id)a3 didRequestAnimation:(id)a4
{
  id v5;
  uint64_t v6;
  SUUIOnboardingAffiliationCirclesViewController *v7;
  id *v8;
  SUUIOnboardingAffiliationCirclesViewController *circlesViewController;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = objc_msgSend(v5, "animationType");
  if (v6 == 1)
  {
    circlesViewController = self->_circlesViewController;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __91__SUUIPhysicalCirclesDocumentViewController_physicalCirclesDOMFeature_didRequestAnimation___block_invoke_2;
    v10[3] = &unk_2511F4908;
    v8 = &v11;
    v11 = v5;
    -[SUUIOnboardingAffiliationCirclesViewController resetWithAffiliationItems:animated:completionBlock:](circlesViewController, "resetWithAffiliationItems:animated:completionBlock:", 0, 1, v10);
    goto LABEL_5;
  }
  if (!v6)
  {
    v7 = self->_circlesViewController;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __91__SUUIPhysicalCirclesDocumentViewController_physicalCirclesDOMFeature_didRequestAnimation___block_invoke;
    v12[3] = &unk_2511FC600;
    v8 = &v13;
    v13 = v5;
    -[SUUIOnboardingAffiliationCirclesViewController performFinishAnimationWithCompletionBlock:](v7, "performFinishAnimationWithCompletionBlock:", v12);
LABEL_5:

  }
}

uint64_t __91__SUUIPhysicalCirclesDocumentViewController_physicalCirclesDOMFeature_didRequestAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishAnimation");
}

uint64_t __91__SUUIPhysicalCirclesDocumentViewController_physicalCirclesDOMFeature_didRequestAnimation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishAnimation");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 0;
}

- (void)_footerLeftButtonAction:(id)a3
{
  id v3;

  -[SUUIPhysicalCirclesDocumentViewController _leftFooterButtonElement](self, "_leftFooterButtonElement", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

}

- (void)_footerRightButtonAction:(id)a3
{
  id v3;

  -[SUUIPhysicalCirclesDocumentViewController _rightFooterButtonElement](self, "_rightFooterButtonElement", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

}

- (id)_affiliationItemsWithCircleItemElements:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__SUUIPhysicalCirclesDocumentViewController__affiliationItemsWithCircleItemElements___block_invoke;
  v8[3] = &unk_2511FC5D8;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __85__SUUIPhysicalCirclesDocumentViewController__affiliationItemsWithCircleItemElements___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  SUUIOnboardingAffiliationItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v3 = objc_msgSend(v17, "circleSize");
  if ((v3 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = objc_alloc_init(SUUIOnboardingAffiliationItem);
    objc_msgSend(v17, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIOnboardingAffiliationItem setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v17, "titleElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIOnboardingAffiliationItem setTitle:](v5, "setTitle:", v9);

    -[SUUIOnboardingAffiliationItem setUserAffinityCount:](v5, "setUserAffinityCount:", v4);
    objc_msgSend(v17, "imageElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resourceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[SUUIOnboardingAffiliationItem setImageName:](v5, "setImageName:", v11);
    }
    else
    {
      objc_msgSend(v10, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIOnboardingAffiliationItem setImageURL:](v5, "setImageURL:", v12);

    }
    objc_msgSend(v17, "style");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ikColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "color");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIOnboardingAffiliationItem setFillColor:](v5, "setFillColor:", v15);

    objc_msgSend(v13, "imageTreatment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIOnboardingAffiliationItem setImageTreatment:](v5, "setImageTreatment:", v16);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

- (id)_leftFooterButtonElement
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
  v9 = __Block_byref_object_copy__82;
  v10 = __Block_byref_object_dispose__82;
  v11 = 0;
  -[SUUIPhysicalCirclesTemplateViewElement footerPaletteElement](self->_templateElement, "footerPaletteElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__SUUIPhysicalCirclesDocumentViewController__leftFooterButtonElement__block_invoke;
  v5[3] = &unk_2511F4B90;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateChildrenUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__SUUIPhysicalCirclesDocumentViewController__leftFooterButtonElement__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 12)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
LABEL_4:
    *a3 = 1;
    goto LABEL_5;
  }
  if (objc_msgSend(v6, "elementType") == 95)
    goto LABEL_4;
LABEL_5:

}

- (void)_loadImagesWithReason:(int64_t)a3
{
  NSMapTable *v4;
  NSMapTable *imageRequests;
  SUUIResourceLoader *v6;
  void *v7;
  void *v8;
  SUUIResourceLoader *v9;
  SUUIResourceLoader *resourceLoader;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SUUIArtworkRequest *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  SUUIOnboardingCircleImageDataConsumer *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SUUIArtworkRequest *v32;
  void *v33;
  void *v34;
  SUUIOnboardingCircleImageDataConsumer *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  NSMapTable *v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (!self->_imageRequests)
  {
    v4 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    imageRequests = self->_imageRequests;
    self->_imageRequests = v4;

  }
  if (!self->_resourceLoader)
  {
    v6 = [SUUIResourceLoader alloc];
    -[SUUIViewController operationQueue](self, "operationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewController clientContext](self, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SUUIResourceLoader initWithOperationQueue:clientContext:](v6, "initWithOperationQueue:clientContext:", v7, v8);
    resourceLoader = self->_resourceLoader;
    self->_resourceLoader = v9;

  }
  -[SUUIPhysicalCirclesDocumentViewController _profileImageElement](self, "_profileImageElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "resourceCacheKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_imageRequests, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14
      || !-[SUUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_resourceLoader, "trySetReason:forRequestWithIdentifier:", a3, objc_msgSend(v14, "unsignedIntegerValue")))
    {
      v16 = objc_alloc_init(SUUIArtworkRequest);
      -[SUUIResourceRequest setCacheKey:](v16, "setCacheKey:", v13);
      -[SUUIArtworkRequest setDelegate:](v16, "setDelegate:", self);
      objc_msgSend(v12, "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIArtworkRequest setURL:](v16, "setURL:", v17);

      -[SUUIPhysicalCirclesDocumentViewController traitCollection](self, "traitCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "userInterfaceIdiom");

      if (v19 == 1)
        v20 = 120.0;
      else
        v20 = 78.0;
      v21 = objc_alloc_init(SUUIOnboardingCircleImageDataConsumer);
      objc_msgSend((id)objc_opt_class(), "preferredImageSizeForViewSize:", v20, v20);
      -[SUUIOnboardingCircleImageDataConsumer setOutputSize:](v21, "setOutputSize:");
      -[SUUIArtworkRequest setDataConsumer:](v16, "setDataConsumer:", v21);
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v16, "requestIdentifier"));
      -[NSMapTable setObject:forKey:](self->_imageRequests, "setObject:forKey:", v22, v13);
      -[SUUIResourceLoader loadResourceWithRequest:reason:](self->_resourceLoader, "loadResourceWithRequest:reason:", v16, a3);

    }
  }
  v44 = v12;
  -[SUUIOnboardingAffiliationCirclesViewController affiliationItems](self->_circlesViewController, "affiliationItems");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIPhysicalCirclesDocumentViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "tintColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIOnboardingAffiliationCirclesViewController maximumCircleDiameter](self->_circlesViewController, "maximumCircleDiameter");
  v26 = v25;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v23;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v51 != v47)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v28, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](self->_imageRequests, "objectForKey:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (!v30
          || !-[SUUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_resourceLoader, "trySetReason:forRequestWithIdentifier:", a3, objc_msgSend(v30, "unsignedIntegerValue")))
        {
          v32 = objc_alloc_init(SUUIArtworkRequest);
          -[SUUIArtworkRequest setDelegate:](v32, "setDelegate:", self);
          objc_msgSend(v28, "imageName");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            -[SUUIArtworkRequest setImageName:](v32, "setImageName:", v33);
          }
          else
          {
            objc_msgSend(v28, "imageURL");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUUIArtworkRequest setURL:](v32, "setURL:", v34);

          }
          v35 = objc_alloc_init(SUUIOnboardingCircleImageDataConsumer);
          -[SUUIOnboardingCircleImageDataConsumer setOutputSize:](v35, "setOutputSize:", v26, v26);
          objc_msgSend(v28, "imageTreatment");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "isEqualToString:", 0x251212428);

          if (v37)
          {
            objc_msgSend(v28, "fillColor");
            v38 = objc_claimAutoreleasedReturnValue();
            v39 = (void *)v38;
            if (v38)
              v40 = (void *)v38;
            else
              v40 = v45;
            -[SUUIOnboardingCircleImageDataConsumer setTintColor:](v35, "setTintColor:", v40);

            -[SUUIOnboardingCircleImageDataConsumer setUsesSaturationFilter:](v35, "setUsesSaturationFilter:", 1);
          }
          -[SUUIArtworkRequest setDataConsumer:](v32, "setDataConsumer:", v35);
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v32, "requestIdentifier"));
          v42 = self->_imageRequests;
          objc_msgSend(v28, "identifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](v42, "setObject:forKey:", v41, v43);

          -[SUUIResourceLoader loadResourceWithRequest:reason:](self->_resourceLoader, "loadResourceWithRequest:reason:", v32, a3);
        }

      }
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v48);
  }

}

- (id)_profileImageElement
{
  void *v2;
  void *v3;
  void *v4;

  -[SUUIPhysicalCirclesTemplateViewElement footerPaletteElement](self->_templateElement, "footerPaletteElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstChildForElementType:", 95);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstChildForElementType:", 49);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_reloadFooterViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  SUUIOnboardingFooterView *footerView;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  SUUIOnboardingFooterView *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SUUIOnboardingProgressView *progressView;
  float v22;
  SUUIOnboardingProgressView *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = a3;
  -[SUUIPhysicalCirclesDocumentViewController _leftFooterButtonElement](self, "_leftFooterButtonElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  footerView = self->_footerView;
  v26 = v5;
  if (v5)
  {
    objc_msgSend(v5, "buttonText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v9 = 2;
    else
      v9 = 1;
    -[SUUIOnboardingFooterView showLeftButtonWithTitle:animation:](footerView, "showLeftButtonWithTitle:animation:", v8, v9);

    -[SUUIOnboardingFooterView leftButton](self->_footerView, "leftButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", objc_msgSend(v26, "isEnabled"));

  }
  else
  {
    -[SUUIOnboardingFooterView hideLeftButtonWithAnimation:](footerView, "hideLeftButtonWithAnimation:", v3 ^ 1);
  }
  -[SUUIPhysicalCirclesDocumentViewController _rightFooterButtonElement](self, "_rightFooterButtonElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = self->_footerView;
  if (v11)
  {
    objc_msgSend(v11, "buttonText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v16 = 2;
    else
      v16 = 1;
    -[SUUIOnboardingFooterView showRightButtonWithTitle:animation:](v13, "showRightButtonWithTitle:animation:", v15, v16);

    -[SUUIOnboardingFooterView rightButton](self->_footerView, "rightButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEnabled:", objc_msgSend(v12, "isEnabled"));

  }
  else
  {
    -[SUUIOnboardingFooterView hideRightButtonWithAnimation:](self->_footerView, "hideRightButtonWithAnimation:", v3 ^ 1);
  }
  -[SUUIPhysicalCirclesTemplateViewElement footerPaletteElement](self->_templateElement, "footerPaletteElement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstChildForElementType:", 95);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "firstChildForElementType:", 138);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  progressView = self->_progressView;
  objc_msgSend(v19, "value");
  -[SUUIOnboardingProgressView setProgress:animated:](progressView, "setProgress:animated:", v3, v22);
  v23 = self->_progressView;
  objc_msgSend(v20, "text");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "string");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIOnboardingProgressView setTitle:](v23, "setTitle:", v25);

}

- (void)_reloadInstructionsView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[SUUIOnboardingAffiliationCirclesViewController instructionsView](self->_circlesViewController, "instructionsView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIPhysicalCirclesTemplateViewElement titleElement](self->_templateElement, "titleElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_opt_class();
    objc_msgSend(v3, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleAttributedStringWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPhysicalCirclesDocumentViewController _styleAttributedString:withStyle:](self, "_styleAttributedString:withStyle:", v7, v8);

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v17, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedText:", v7);

  -[SUUIPhysicalCirclesTemplateViewElement subtitleElement](self->_templateElement, "subtitleElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)objc_opt_class();
    objc_msgSend(v10, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "explanationAttributedStringWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "style");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPhysicalCirclesDocumentViewController _styleAttributedString:withStyle:](self, "_styleAttributedString:withStyle:", v14, v15);

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v17, "explanationLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAttributedText:", v14);

  objc_msgSend(v17, "setNeedsLayout");
}

- (id)_rightFooterButtonElement
{
  void *v2;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  _QWORD v12[5];
  id v13;

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__82;
  v12[4] = __Block_byref_object_dispose__82;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__82;
  v10 = __Block_byref_object_dispose__82;
  v11 = 0;
  -[SUUIPhysicalCirclesTemplateViewElement footerPaletteElement](self->_templateElement, "footerPaletteElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__SUUIPhysicalCirclesDocumentViewController__rightFooterButtonElement__block_invoke;
  v5[3] = &unk_2511FC628;
  v5[4] = v12;
  v5[5] = &v6;
  objc_msgSend(v2, "enumerateChildrenUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(v12, 8);
  return v3;
}

void __70__SUUIPhysicalCirclesDocumentViewController__rightFooterButtonElement__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v6;
  id *v7;
  id v8;

  v8 = a2;
  v6 = objc_msgSend(v8, "elementType");
  v7 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v6 == 95)
  {
    objc_storeStrong(v7, a2);
  }
  else if (*v7 && objc_msgSend(v8, "elementType") == 12)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)_styleAttributedString:(id)a3 withStyle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  SUUIViewElementFontWithStyle(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x24BEBB360], v7, 0, objc_msgSend(v12, "length"));
  objc_msgSend(v6, "ikColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIPhysicalCirclesDocumentViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithIKColor(v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x24BEBB368], v11, 0, objc_msgSend(v12, "length"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_interactivePopGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_imageRequests, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_circlesViewController, 0);
}

@end
