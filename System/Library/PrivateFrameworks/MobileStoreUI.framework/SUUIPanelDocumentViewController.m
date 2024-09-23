@implementation SUUIPanelDocumentViewController

- (SUUIPanelDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5;
  SUUIPanelDocumentViewController *v6;
  SUUIPanelDocumentViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIPanelDocumentViewController;
  v6 = -[SUUIPanelDocumentViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lastContentWidth = -1;
    objc_storeStrong((id *)&v6->_templateElement, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__keyboardHideNotification_, *MEMORY[0x24BEBE440], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__keyboardHideNotification_, *MEMORY[0x24BEBE578], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__keyboardWillChangeNotification_, *MEMORY[0x24BEBE570], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__keyboardWillChangeNotification_, *MEMORY[0x24BEBE580], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE440], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE570], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE578], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE580], 0);
  -[SUUIViewElementLayoutContext setArtworkRequestDelegate:](self->_layoutContext, "setArtworkRequestDelegate:", 0);
  -[SUUIViewElementLayoutContext setParentViewController:](self->_layoutContext, "setParentViewController:", 0);
  -[SUUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SUUIPanelDocumentViewController;
  -[SUUIViewController dealloc](&v4, sel_dealloc);
}

- (id)contentScrollView
{
  return self->_scrollView;
}

- (void)loadView
{
  void *v3;
  SUUIPanelView *v4;
  SUUIPanelView *panelView;
  SUUIPanelView *v6;
  void *v7;
  UIScrollView *scrollView;
  UIScrollView *v9;
  UIScrollView *v10;
  UIScrollView *v11;
  void *v12;
  id v13;

  v13 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[SUUIPanelDocumentViewController _templateBackgroundColor](self, "_templateBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v3);

  objc_msgSend(v13, "setPreservesSuperviewLayoutMargins:", 1);
  if (!self->_panelView)
  {
    v4 = objc_alloc_init(SUUIPanelView);
    panelView = self->_panelView;
    self->_panelView = v4;

    v6 = self->_panelView;
    -[SUUIPanelDocumentViewController _activeBackgroundColor](self, "_activeBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewReuseView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SUUIPanelView setPreservesSuperviewLayoutMargins:](self->_panelView, "setPreservesSuperviewLayoutMargins:", 1);
  }
  scrollView = self->_scrollView;
  if (!scrollView)
  {
    v9 = (UIScrollView *)objc_alloc_init(MEMORY[0x24BEBD918]);
    v10 = self->_scrollView;
    self->_scrollView = v9;

    -[UIScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", 0);
    -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 0);
    v11 = self->_scrollView;
    -[SUUIPanelDocumentViewController _activeBackgroundColor](self, "_activeBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UIScrollView setPreservesSuperviewLayoutMargins:](self->_scrollView, "setPreservesSuperviewLayoutMargins:", 1);
    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_panelView);
    scrollView = self->_scrollView;
  }
  objc_msgSend(v13, "addSubview:", scrollView);
  -[SUUIPanelDocumentViewController setView:](self, "setView:", v13);
  -[SUUIPanelDocumentViewController _reloadBackgroundImageView](self, "_reloadBackgroundImageView");

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  SUUIMetricsImpressionSession *v5;
  SUUIMetricsImpressionSession *metricsImpressionSession;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(SUUIMetricsImpressionSession);
  metricsImpressionSession = self->_metricsImpressionSession;
  self->_metricsImpressionSession = v5;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SUUIPanelTemplateViewElement children](self->_templateElement, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[SUUIMetricsImpressionSession beginActiveImpressionForViewElement:](self->_metricsImpressionSession, "beginActiveImpressionForViewElement:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  v12.receiver = self;
  v12.super_class = (Class)SUUIPanelDocumentViewController;
  -[SUUIPanelDocumentViewController viewDidAppear:](&v12, sel_viewDidAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SUUIMetricsImpressionSession *metricsImpressionSession;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SUUIPanelTemplateViewElement children](self->_templateElement, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[SUUIMetricsImpressionSession endActiveImpressionForViewElement:](self->_metricsImpressionSession, "endActiveImpressionForViewElement:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  metricsImpressionSession = self->_metricsImpressionSession;
  self->_metricsImpressionSession = 0;

  self->_didAttemptBecomeFirstResponder = 0;
  v11.receiver = self;
  v11.super_class = (Class)SUUIPanelDocumentViewController;
  -[SUUIPanelDocumentViewController viewDidDisappear:](&v11, sel_viewDidDisappear_, v3);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  if (!self->_didAttemptBecomeFirstResponder)
  {
    if (-[SUUIPanelView canBecomeFirstResponder](self->_panelView, "canBecomeFirstResponder"))
    {
      UIKeyboardOrderInAutomatic();
      -[SUUIPanelView becomeFirstResponder](self->_panelView, "becomeFirstResponder");
    }
    self->_didAttemptBecomeFirstResponder = 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)SUUIPanelDocumentViewController;
  -[SUUIPanelDocumentViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  objc_super v7;

  v3 = a3;
  -[SUUIPanelDocumentViewController _layoutScrollView](self, "_layoutScrollView");
  if (self->_panelView)
  {
    -[UIScrollView bounds](self->_scrollView, "bounds");
    -[SUUIPanelDocumentViewController _reloadPanelViewWithScrollViewSize:](self, "_reloadPanelViewWithScrollViewSize:", v5, v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)SUUIPanelDocumentViewController;
  -[SUUIViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  self->_didAttemptBecomeFirstResponder = 0;
  -[SUUIPanelView resignFirstResponder](self->_panelView, "resignFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)SUUIPanelDocumentViewController;
  -[SUUIPanelDocumentViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  -[SUUIPanelDocumentViewController _layoutBackgroundImageView](self, "_layoutBackgroundImageView");
  -[SUUIPanelDocumentViewController _layoutScrollView](self, "_layoutScrollView");
  if (self->_panelView)
    -[SUUIPanelDocumentViewController _reloadContentSize](self, "_reloadContentSize");
  v3.receiver = self;
  v3.super_class = (Class)SUUIPanelDocumentViewController;
  -[SUUIPanelDocumentViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[SUUIPanelDocumentViewController _reloadPanelViewWithScrollViewSize:](self, "_reloadPanelViewWithScrollViewSize:", width, height);
  v8.receiver = self;
  v8.super_class = (Class)SUUIPanelDocumentViewController;
  -[SUUIPanelDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  SUUIPanelView *panelView;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[SUUIPanelTemplateViewElement backgroundImageElement](self->_templateElement, "backgroundImageElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "resourceCacheKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cacheKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (v11)
    {
      -[UIImageView setImage:](self->_backgroundImageView, "setImage:", v6);
      -[SUUIPanelDocumentViewController _layoutBackgroundImageView](self, "_layoutBackgroundImageView");
    }
  }
  panelView = self->_panelView;
  -[SUUIPanelDocumentViewController _layoutContext](self, "_layoutContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIPanelView setImage:forArtworkRequest:context:](panelView, "setImage:forArtworkRequest:context:", v6, v14, v13);

}

- (void)documentDidUpdate:(id)a3
{
  SUUIPanelTemplateViewElement *v4;
  SUUIPanelTemplateViewElement *templateElement;
  SUUIPanelView *panelView;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "templateElement");
  v4 = (SUUIPanelTemplateViewElement *)objc_claimAutoreleasedReturnValue();
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  -[SUUIPanelDocumentViewController _activeBackgroundColor](self, "_activeBackgroundColor");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UIScrollView setBackgroundColor:](self->_scrollView, "setBackgroundColor:");
  panelView = self->_panelView;
  if (panelView)
  {
    -[SUUIViewReuseView setBackgroundColor:](panelView, "setBackgroundColor:", v11);
    -[UIScrollView bounds](self->_scrollView, "bounds");
    -[SUUIPanelDocumentViewController _reloadPanelViewWithScrollViewSize:](self, "_reloadPanelViewWithScrollViewSize:", v7, v8);
  }
  if (-[SUUIPanelDocumentViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SUUIPanelDocumentViewController _reloadBackgroundImageView](self, "_reloadBackgroundImageView");
    -[SUUIPanelDocumentViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPanelDocumentViewController _templateBackgroundColor](self, "_templateBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

  }
}

- (id)impressionableViewElements
{
  return (id)-[SUUIPanelTemplateViewElement children](self->_templateElement, "children");
}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  SUUIPanelView *panelView;
  SUUIPanelTemplateViewElement *templateElement;
  double v6;
  double v7;
  id v8;

  panelView = self->_panelView;
  templateElement = self->_templateElement;
  -[UIScrollView bounds](self->_scrollView, "bounds", a3);
  v7 = v6;
  -[SUUIPanelDocumentViewController _layoutContext](self, "_layoutContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIPanelView reloadWithViewElement:width:context:](panelView, "reloadWithViewElement:width:context:", templateElement, v8, v7);

}

- (void)_keyboardHideNotification:(id)a3
{
  CGSize v4;

  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->_keyboardFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->_keyboardFrame.size = v4;
  -[SUUIPanelDocumentViewController _layoutScrollView](self, "_layoutScrollView", a3);
  -[SUUIPanelDocumentViewController _reloadContentSize](self, "_reloadContentSize");
}

- (void)_keyboardWillChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBE468]);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v10)
  {
    objc_msgSend(v10, "CGRectValue");
    self->_keyboardFrame.origin.x = v6;
    self->_keyboardFrame.origin.y = v7;
    self->_keyboardFrame.size.width = v8;
    self->_keyboardFrame.size.height = v9;
    -[SUUIPanelDocumentViewController _layoutScrollView](self, "_layoutScrollView");
    -[SUUIPanelDocumentViewController _reloadContentSize](self, "_reloadContentSize");
    v5 = v10;
  }

}

- (id)_activeBackgroundColor
{
  void *v3;
  void *v4;

  -[SUUIPanelTemplateViewElement backgroundImageElement](self->_templateElement, "backgroundImageElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  else
    -[SUUIPanelDocumentViewController _templateBackgroundColor](self, "_templateBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_imageForBackgroundImageElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SUUIArtworkRequest *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[SUUIPanelDocumentViewController _layoutContext](self, "_layoutContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceLoader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "resourceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    SUUIImageWithResourceName(v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v8 = v8;
    v12 = v8;
    goto LABEL_9;
  }
  objc_msgSend(v4, "resourceCacheKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestIdentifierForCacheKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    v8 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v6, "cachedResourceForRequestIdentifier:", objc_msgSend(v10, "unsignedIntegerValue"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v11, "unsignedIntegerValue")) & 1) == 0)
  {
LABEL_7:
    v13 = objc_alloc_init(SUUIArtworkRequest);
    -[SUUIResourceRequest setCacheKey:](v13, "setCacheKey:", v9);
    +[SSVURLDataConsumer consumer](SUUIImageDataConsumer, "consumer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIArtworkRequest setDataConsumer:](v13, "setDataConsumer:", v14);

    -[SUUIArtworkRequest setDelegate:](v13, "setDelegate:", self);
    objc_msgSend(v4, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIArtworkRequest setURL:](v13, "setURL:", v15);

    objc_msgSend(v6, "loadResourceWithRequest:reason:", v13, 1);
    goto LABEL_8;
  }

  v12 = 0;
LABEL_9:

  return v12;
}

- (void)_layoutBackgroundImageView
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  unint64_t v17;
  double v18;
  id v19;
  CGRect v20;

  if (self->_backgroundImageView)
  {
    -[SUUIPanelDocumentViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    -[UIImageView image](self->_backgroundImageView, "image");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (-[UIImageView contentMode](self->_backgroundImageView, "contentMode") == 2 || !v19)
    {
      v18 = v5;
LABEL_13:
      -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:", v18, v7, v9, v11);

      return;
    }
    objc_msgSend(v19, "size");
    *(float *)&v12 = v13 * (v9 / v12);
    v14 = floorf(*(float *)&v12);
    -[SUUIPanelTemplateViewElement backgroundImageElement](self->_templateElement, "backgroundImageElement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "elementPosition");

    v18 = 0.0;
    if (v17 <= 9)
    {
      if (((1 << v17) & 0x33) != 0)
      {
        v7 = floor((v11 - v14) * 0.5);
LABEL_12:
        v11 = v14;
        goto LABEL_13;
      }
      if (((1 << v17) & 0x308) != 0)
      {
        v20.origin.x = v5;
        v20.origin.y = v7;
        v20.size.width = v9;
        v20.size.height = v11;
        v7 = CGRectGetMaxY(v20) - v14;
        goto LABEL_12;
      }
    }
    v7 = 0.0;
    goto LABEL_12;
  }
}

- (id)_layoutContext
{
  SUUIViewElementLayoutContext *layoutContext;
  SUUIViewElementLayoutContext *v4;
  SUUIViewElementLayoutContext *v5;
  SUUIViewElementLayoutContext *v6;
  void *v7;
  SUUILayoutCache *v8;
  SUUILayoutCache *textLayoutCache;
  SUUIViewElementTextLayoutCache *v10;
  SUUIResourceLoader *v11;
  void *v12;
  SUUIResourceLoader *v13;

  layoutContext = self->_layoutContext;
  if (!layoutContext)
  {
    v4 = objc_alloc_init(SUUIViewElementLayoutContext);
    v5 = self->_layoutContext;
    self->_layoutContext = v4;

    -[SUUIViewElementLayoutContext setArtworkRequestDelegate:](self->_layoutContext, "setArtworkRequestDelegate:", self);
    v6 = self->_layoutContext;
    -[SUUIViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewElementLayoutContext setClientContext:](v6, "setClientContext:", v7);

    -[SUUIViewElementLayoutContext setContainerViewElementType:](self->_layoutContext, "setContainerViewElementType:", -[SUUIPanelTemplateViewElement elementType](self->_templateElement, "elementType"));
    -[SUUIViewElementLayoutContext setParentViewController:](self->_layoutContext, "setParentViewController:", self);
    v8 = objc_alloc_init(SUUILayoutCache);
    textLayoutCache = self->_textLayoutCache;
    self->_textLayoutCache = v8;

    -[SUUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", self);
    v10 = -[SUUIViewElementTextLayoutCache initWithLayoutCache:]([SUUIViewElementTextLayoutCache alloc], "initWithLayoutCache:", self->_textLayoutCache);
    -[SUUIViewElementLayoutContext setLabelLayoutCache:](self->_layoutContext, "setLabelLayoutCache:", v10);
    v11 = [SUUIResourceLoader alloc];
    -[SUUIViewController clientContext](self, "clientContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SUUIResourceLoader initWithClientContext:](v11, "initWithClientContext:", v12);

    -[SUUIViewElementLayoutContext setResourceLoader:](self->_layoutContext, "setResourceLoader:", v13);
    layoutContext = self->_layoutContext;
  }
  return layoutContext;
}

- (void)_layoutScrollView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[SUUIPanelDocumentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v5, v7, v9, v11 - self->_keyboardFrame.size.height);
}

- (void)_reloadBackgroundImageView
{
  void *v3;
  UIImageView *backgroundImageView;
  UIImageView *v5;
  UIImageView *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  UIImageView *v11;
  void *v12;
  UIImageView *v13;
  void *v14;
  UIImageView *v15;
  id v16;

  -[SUUIPanelTemplateViewElement backgroundImageElement](self->_templateElement, "backgroundImageElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundImageView = self->_backgroundImageView;
  v16 = v3;
  if (v3)
  {
    if (!backgroundImageView)
    {
      v5 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
      v6 = self->_backgroundImageView;
      self->_backgroundImageView = v5;

      -[UIImageView setClipsToBounds:](self->_backgroundImageView, "setClipsToBounds:", 1);
      -[SUUIPanelDocumentViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertSubview:atIndex:", self->_backgroundImageView, 0);

      v3 = v16;
    }
    objc_msgSend(v3, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "fillImage");

    if (v9 == 1)
      v10 = 2;
    else
      v10 = 1;
    -[UIImageView setContentMode:](self->_backgroundImageView, "setContentMode:", v10);
    v11 = self->_backgroundImageView;
    -[SUUIPanelDocumentViewController _templateBackgroundColor](self, "_templateBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    v13 = self->_backgroundImageView;
    -[SUUIPanelDocumentViewController _imageForBackgroundImageElement:](self, "_imageForBackgroundImageElement:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v13, "setImage:", v14);

    -[SUUIPanelDocumentViewController _layoutBackgroundImageView](self, "_layoutBackgroundImageView");
  }
  else
  {
    -[UIImageView removeFromSuperview](backgroundImageView, "removeFromSuperview");
    v15 = self->_backgroundImageView;
    self->_backgroundImageView = 0;

  }
}

- (void)_reloadContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  SUUIPanelTemplateViewElement *templateElement;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;

  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  v4 = v3;
  v6 = v5;
  -[SUUIPanelView layoutMargins](self->_panelView, "layoutMargins");
  v8 = v7;
  v10 = v9;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v13 = v11;
  v14 = 0.0;
  if (self->_keyboardFrame.size.height < 0.00000011920929)
    v14 = v6;
  v15 = v12 - v4 - v14;
  v16 = v11 - v8 - v10;
  v17 = vcvtms_s32_f32(v16);
  -[SUUIPanelDocumentViewController _requestPanelViewLayoutWithContentWidth:forced:](self, "_requestPanelViewLayoutWithContentWidth:forced:", v17, 0);
  v18 = *MEMORY[0x24BDBF090];
  v19 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v20 = (void *)objc_opt_class();
  v21 = (double)v17;
  templateElement = self->_templateElement;
  -[SUUIPanelDocumentViewController _layoutContext](self, "_layoutContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeThatFitsWidth:viewElement:context:", templateElement, v23, v21);
  v25 = v24;
  v27 = v26;

  if (v27 < v15)
    v27 = v15;
  if (v25 < v13)
    v25 = v13;
  -[SUUIPanelView setFrame:](self->_panelView, "setFrame:", v18, v19, v25, v27);
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v25, v27);
}

- (void)_reloadPanelViewWithScrollViewSize:(CGSize)a3
{
  double width;
  BOOL v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  id v12;

  width = a3.width;
  if (self->_panelView)
    v4 = a3.width <= 0.00000011920929;
  else
    v4 = 1;
  if (!v4)
  {
    -[SUUIPanelDocumentViewController _layoutContext](self, "_layoutContext");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[SUUIPanelView tintColor](self->_panelView, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTintColor:", v6);

    objc_msgSend((id)objc_opt_class(), "prefetchResourcesForViewElement:reason:context:", self->_templateElement, 1, v12);
    -[SUUIPanelView layoutMargins](self->_panelView, "layoutMargins");
    v8 = v7;
    v10 = v9;
    -[SUUIPanelView setLayoutMargins:](self->_panelView, "setLayoutMargins:", 0.0);
    v11 = width - v8 - v10;
    -[SUUIPanelDocumentViewController _requestPanelViewLayoutWithContentWidth:forced:](self, "_requestPanelViewLayoutWithContentWidth:forced:", vcvtms_s32_f32(v11), 1);
    -[SUUIPanelDocumentViewController _reloadContentSize](self, "_reloadContentSize");

  }
}

- (void)_requestPanelViewLayoutWithContentWidth:(int64_t)a3 forced:(BOOL)a4
{
  id v6;

  if (a4 || self->_lastContentWidth != a3)
  {
    -[SUUIPanelDocumentViewController _layoutContext](self, "_layoutContext");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "requestLayoutForViewElement:width:context:", self->_templateElement, v6, (double)a3);
    -[SUUILayoutCache commitLayoutRequests](self->_textLayoutCache, "commitLayoutRequests");
    -[SUUIPanelView reloadWithViewElement:width:context:](self->_panelView, "reloadWithViewElement:width:context:", self->_templateElement, v6, (double)a3);
    self->_lastContentWidth = a3;

  }
}

- (id)_templateBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SUUIPanelTemplateViewElement style](self->_templateElement, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ikBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_panelView, 0);
  objc_storeStrong((id *)&self->_metricsImpressionSession, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end
