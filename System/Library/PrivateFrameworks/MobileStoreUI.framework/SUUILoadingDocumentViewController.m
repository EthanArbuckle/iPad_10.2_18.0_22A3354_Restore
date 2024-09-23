@implementation SUUILoadingDocumentViewController

- (SUUILoadingDocumentViewController)initWithActivityIndicatorElement:(id)a3
{
  id v5;
  SUUILoadingDocumentViewController *v6;
  SUUILoadingDocumentViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUILoadingDocumentViewController;
  v6 = -[SUUILoadingDocumentViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_activityIndicatorElement, a3);

  return v7;
}

- (SUUILoadingDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5;
  SUUILoadingDocumentViewController *v6;
  SUUILoadingDocumentViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUILoadingDocumentViewController;
  v6 = -[SUUILoadingDocumentViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_templateElement, a3);

  return v7;
}

- (void)dealloc
{
  NSObject *delayTimer;
  objc_super v4;

  delayTimer = self->_delayTimer;
  if (delayTimer)
    dispatch_source_cancel(delayTimer);
  -[SUUIViewElementLayoutContext setParentViewController:](self->_viewLayoutContext, "setParentViewController:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SUUILoadingDocumentViewController;
  -[SUUIViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  SUUIActivityIndicatorView *activityIndicatorView;
  SUUIActivityIndicatorView *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[SUUILoadingDocumentViewController setView:](self, "setView:");
  activityIndicatorView = self->_activityIndicatorView;
  if (activityIndicatorView)
  {
    -[SUUIActivityIndicatorView frame](activityIndicatorView, "frame");
    objc_msgSend(v5, "setFrame:");
    v4 = self->_activityIndicatorView;
    objc_msgSend(v5, "bounds");
    -[SUUIActivityIndicatorView setFrame:](v4, "setFrame:");
    objc_msgSend(v5, "addSubview:", self->_activityIndicatorView);
  }
  -[SUUILoadingDocumentViewController _reloadViewStyling](self, "_reloadViewStyling");

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  OS_dispatch_source *v5;
  OS_dispatch_source *delayTimer;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  objc_super v10;
  _QWORD handler[4];
  id v12;
  id location;

  v3 = a3;
  if (!self->_activityIndicatorView && !self->_delayTimer)
  {
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    delayTimer = self->_delayTimer;
    self->_delayTimer = v5;

    v7 = self->_delayTimer;
    v8 = dispatch_time(0, 500000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    v9 = self->_delayTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __51__SUUILoadingDocumentViewController_viewDidAppear___block_invoke;
    handler[3] = &unk_2511F53F8;
    objc_copyWeak(&v12, &location);
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->_delayTimer);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v10.receiver = self;
  v10.super_class = (Class)SUUILoadingDocumentViewController;
  -[SUUILoadingDocumentViewController viewDidAppear:](&v10, sel_viewDidAppear_, v3);
}

void __51__SUUILoadingDocumentViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showActivityIndicator");

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *delayTimer;
  OS_dispatch_source *v6;
  objc_super v7;

  v3 = a3;
  delayTimer = self->_delayTimer;
  if (delayTimer)
  {
    dispatch_source_cancel(delayTimer);
    v6 = self->_delayTimer;
    self->_delayTimer = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)SUUILoadingDocumentViewController;
  -[SUUILoadingDocumentViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
}

- (void)viewWillLayoutSubviews
{
  SUUIActivityIndicatorView *activityIndicatorView;
  objc_super v4;

  activityIndicatorView = self->_activityIndicatorView;
  if (activityIndicatorView)
  {
    -[SUUILoadingDocumentViewController _computedFrameForActivityIndicatorView](self, "_computedFrameForActivityIndicatorView");
    -[SUUIActivityIndicatorView setFrame:](activityIndicatorView, "setFrame:");
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUILoadingDocumentViewController;
  -[SUUILoadingDocumentViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
}

- (void)documentDidUpdate:(id)a3
{
  SUUILoadingTemplateViewElement *v4;
  SUUILoadingTemplateViewElement *templateElement;

  objc_msgSend(a3, "templateElement");
  v4 = (SUUILoadingTemplateViewElement *)objc_claimAutoreleasedReturnValue();
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  -[SUUILoadingDocumentViewController _reloadViewStyling](self, "_reloadViewStyling");
}

- (id)_activityIndicator
{
  SUUIActivityIndicatorViewElement *v2;

  if (self->_templateElement)
  {
    -[SUUILoadingTemplateViewElement activityIndicator](self->_templateElement, "activityIndicator");
    v2 = (SUUIActivityIndicatorViewElement *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = self->_activityIndicatorElement;
  }
  return v2;
}

- (id)_layoutCache
{
  SUUILayoutCache *layoutCache;
  SUUILayoutCache *v4;
  SUUILayoutCache *v5;

  layoutCache = self->_layoutCache;
  if (!layoutCache)
  {
    v4 = objc_alloc_init(SUUILayoutCache);
    v5 = self->_layoutCache;
    self->_layoutCache = v4;

    layoutCache = self->_layoutCache;
  }
  return layoutCache;
}

- (void)_reloadViewStyling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SUUILoadingDocumentViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUILoadingTemplateViewElement style](self->_templateElement, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ikBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v7, "setBackgroundColor:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

  }
  if (self->_activityIndicatorView)
    -[SUUILoadingDocumentViewController _showActivityIndicator](self, "_showActivityIndicator");

}

- (void)_showActivityIndicator
{
  NSObject *delayTimer;
  OS_dispatch_source *v4;
  SUUIActivityIndicatorView *v5;
  SUUIActivityIndicatorView *activityIndicatorView;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  SUUIActivityIndicatorView *v13;
  SUUIActivityIndicatorView *v14;
  void *v15;
  id v16;

  delayTimer = self->_delayTimer;
  if (delayTimer)
  {
    dispatch_source_cancel(delayTimer);
    v4 = self->_delayTimer;
    self->_delayTimer = 0;

  }
  -[SUUILoadingDocumentViewController view](self, "view");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_activityIndicatorView)
  {
    v5 = objc_alloc_init(SUUIActivityIndicatorView);
    activityIndicatorView = self->_activityIndicatorView;
    self->_activityIndicatorView = v5;

  }
  -[SUUILoadingDocumentViewController _activityIndicator](self, "_activityIndicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILoadingDocumentViewController _viewLayoutContext](self, "_viewLayoutContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;

  objc_msgSend((id)objc_opt_class(), "requestLayoutForViewElement:width:context:", v7, v8, v11);
  -[SUUILoadingDocumentViewController _layoutCache](self, "_layoutCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "commitLayoutRequests");

  -[SUUIActivityIndicatorView reloadWithViewElement:width:context:](self->_activityIndicatorView, "reloadWithViewElement:width:context:", v7, v8, v11);
  v13 = self->_activityIndicatorView;
  -[SUUILoadingDocumentViewController _computedFrameForActivityIndicatorView](self, "_computedFrameForActivityIndicatorView");
  -[SUUIActivityIndicatorView setFrame:](v13, "setFrame:");
  -[SUUIActivityIndicatorView setAutoresizingMask:](self->_activityIndicatorView, "setAutoresizingMask:", 45);
  v14 = self->_activityIndicatorView;
  objc_msgSend(v16, "backgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseView setBackgroundColor:](v14, "setBackgroundColor:", v15);

  objc_msgSend(v16, "addSubview:", self->_activityIndicatorView);
}

- (CGRect)_computedFrameForActivityIndicatorView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[SUUILoadingDocumentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  -[SUUIActivityIndicatorView frame](self->_activityIndicatorView, "frame");
  -[SUUIActivityIndicatorView sizeThatFits:](self->_activityIndicatorView, "sizeThatFits:", 1.79769313e308, v6);
  v8 = v7;
  v10 = v9;
  objc_msgSend(v3, "frame");
  v12 = (v11 - v8) * 0.5;
  v13 = floorf(v12);
  v14 = v6 * 0.5 - v10;
  v15 = floorf(v14);

  v16 = v13;
  v17 = v15;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_viewLayoutContext
{
  SUUIViewElementLayoutContext *viewLayoutContext;
  SUUIViewElementLayoutContext *v4;
  SUUIViewElementLayoutContext *v5;
  void *v6;
  SUUIViewElementTextLayoutCache *v7;
  void *v8;
  SUUIViewElementTextLayoutCache *v9;
  SUUIResourceLoader *v10;
  void *v11;
  SUUIResourceLoader *v12;

  viewLayoutContext = self->_viewLayoutContext;
  if (!viewLayoutContext)
  {
    v4 = objc_alloc_init(SUUIViewElementLayoutContext);
    v5 = self->_viewLayoutContext;
    self->_viewLayoutContext = v4;

    -[SUUIViewElementLayoutContext setParentViewController:](self->_viewLayoutContext, "setParentViewController:", self);
    -[SUUIViewController clientContext](self, "clientContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewElementLayoutContext setClientContext:](self->_viewLayoutContext, "setClientContext:", v6);
    v7 = [SUUIViewElementTextLayoutCache alloc];
    -[SUUILoadingDocumentViewController _layoutCache](self, "_layoutCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SUUIViewElementTextLayoutCache initWithLayoutCache:](v7, "initWithLayoutCache:", v8);

    -[SUUIViewElementLayoutContext setLabelLayoutCache:](self->_viewLayoutContext, "setLabelLayoutCache:", v9);
    v10 = [SUUIResourceLoader alloc];
    -[SUUIViewController operationQueue](self, "operationQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SUUIResourceLoader initWithOperationQueue:clientContext:](v10, "initWithOperationQueue:clientContext:", v11, v6);

    -[SUUIViewElementLayoutContext setResourceLoader:](self->_viewLayoutContext, "setResourceLoader:", v12);
    viewLayoutContext = self->_viewLayoutContext;
  }
  return viewLayoutContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewLayoutContext, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_layoutCache, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorElement, 0);
}

@end
