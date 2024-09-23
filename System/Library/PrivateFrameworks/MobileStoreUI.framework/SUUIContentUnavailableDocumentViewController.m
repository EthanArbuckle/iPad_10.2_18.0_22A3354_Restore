@implementation SUUIContentUnavailableDocumentViewController

- (SUUIContentUnavailableDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5;
  SUUIContentUnavailableDocumentViewController *v6;
  SUUIContentUnavailableDocumentViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIContentUnavailableDocumentViewController;
  v6 = -[SUUIContentUnavailableDocumentViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_templateElement, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIViewElementLayoutContext setArtworkRequestDelegate:](self->_layoutContext, "setArtworkRequestDelegate:", 0);
  -[SUUIViewElementLayoutContext setParentViewController:](self->_layoutContext, "setParentViewController:", 0);
  -[SUUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIContentUnavailableDocumentViewController;
  -[SUUIViewController dealloc](&v3, sel_dealloc);
}

- (void)documentDidUpdate:(id)a3
{
  SUUIContentUnavailableTemplateElement *v4;
  SUUIContentUnavailableTemplateElement *templateElement;
  void *v6;
  void *v7;
  SUUIContentUnavailableView *contentUnavailableView;
  void *v9;
  SUUIContentUnavailableView *v10;
  double v11;
  id v12;

  objc_msgSend(a3, "templateElement");
  v4 = (SUUIContentUnavailableTemplateElement *)objc_claimAutoreleasedReturnValue();
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  if (self->_contentUnavailableView)
  {
    -[SUUIContentUnavailableTemplateElement style](self->_templateElement, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ikBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "color");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    contentUnavailableView = self->_contentUnavailableView;
    if (v12)
    {
      -[SUUIViewReuseView setBackgroundColor:](self->_contentUnavailableView, "setBackgroundColor:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewReuseView setBackgroundColor:](contentUnavailableView, "setBackgroundColor:", v9);

    }
    v10 = self->_contentUnavailableView;
    -[SUUIContentUnavailableView bounds](v10, "bounds");
    -[SUUIContentUnavailableDocumentViewController _reloadContentUnavailableView:width:](self, "_reloadContentUnavailableView:width:", v10, v11);

  }
}

- (void)viewDidLoad
{
  SUUIContentUnavailableView *contentUnavailableView;
  void *v4;
  void *v5;
  void *v6;
  SUUIContentUnavailableView *v7;
  void *v8;
  SUUIContentUnavailableView *v9;
  SUUIContentUnavailableView *v10;
  SUUIContentUnavailableView *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SUUIContentUnavailableDocumentViewController;
  -[SUUIContentUnavailableDocumentViewController viewDidLoad](&v14, sel_viewDidLoad);
  contentUnavailableView = self->_contentUnavailableView;
  if (!contentUnavailableView)
  {
    -[SUUIContentUnavailableTemplateElement style](self->_templateElement, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ikBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = [SUUIContentUnavailableView alloc];
    -[SUUIContentUnavailableDocumentViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v9 = -[SUUIViewReuseView initWithFrame:](v7, "initWithFrame:");
    v10 = self->_contentUnavailableView;
    self->_contentUnavailableView = v9;

    v11 = self->_contentUnavailableView;
    if (v6)
    {
      -[SUUIViewReuseView setBackgroundColor:](self->_contentUnavailableView, "setBackgroundColor:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewReuseView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    }
    contentUnavailableView = self->_contentUnavailableView;
  }
  -[SUUIContentUnavailableView setAutoresizingMask:](contentUnavailableView, "setAutoresizingMask:", 18);
  -[SUUIContentUnavailableDocumentViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_contentUnavailableView);

}

- (void)viewWillLayoutSubviews
{
  SUUIContentUnavailableView *contentUnavailableView;
  SUUIContentUnavailableView *v4;
  double v5;
  objc_super v6;

  contentUnavailableView = self->_contentUnavailableView;
  -[SUUIContentUnavailableDocumentViewController _contentInsets](self, "_contentInsets");
  -[SUUIContentUnavailableView setContentInset:](contentUnavailableView, "setContentInset:");
  v4 = self->_contentUnavailableView;
  if (v4)
  {
    -[SUUIContentUnavailableView bounds](self->_contentUnavailableView, "bounds");
    -[SUUIContentUnavailableDocumentViewController _reloadContentUnavailableView:width:](self, "_reloadContentUnavailableView:width:", v4, v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)SUUIContentUnavailableDocumentViewController;
  -[SUUIContentUnavailableDocumentViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  SUUIContentUnavailableView *contentUnavailableView;
  id v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  contentUnavailableView = self->_contentUnavailableView;
  v8 = a4;
  -[SUUIContentUnavailableDocumentViewController _reloadContentUnavailableView:width:](self, "_reloadContentUnavailableView:width:", contentUnavailableView, width);
  v9.receiver = self;
  v9.super_class = (Class)SUUIContentUnavailableDocumentViewController;
  -[SUUIContentUnavailableDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  SUUIContentUnavailableView *contentUnavailableView;
  id v7;
  id v8;
  id v9;

  contentUnavailableView = self->_contentUnavailableView;
  v7 = a4;
  v8 = a3;
  -[SUUIContentUnavailableDocumentViewController _layoutContext](self, "_layoutContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIContentUnavailableView setImage:forArtworkRequest:context:](contentUnavailableView, "setImage:forArtworkRequest:context:", v7, v8, v9);

}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  SUUIContentUnavailableView *contentUnavailableView;
  SUUIContentUnavailableTemplateElement *templateElement;
  double v6;
  double v7;
  id v8;

  contentUnavailableView = self->_contentUnavailableView;
  templateElement = self->_templateElement;
  -[SUUIContentUnavailableView bounds](contentUnavailableView, "bounds", a3);
  v7 = v6;
  -[SUUIContentUnavailableDocumentViewController _layoutContext](self, "_layoutContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIContentUnavailableView reloadWithViewElement:width:context:](contentUnavailableView, "reloadWithViewElement:width:context:", templateElement, v8, v7);

}

- (UIEdgeInsets)_contentInsets
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  -[SUUIContentUnavailableDocumentViewController topLayoutGuide](self, "topLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "length");
  v5 = v4;
  -[SUUIContentUnavailableDocumentViewController bottomLayoutGuide](self, "bottomLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "length");
  v8 = v7;

  v9 = 15.0;
  v10 = 15.0;
  v11 = v5;
  v12 = v8;
  result.right = v10;
  result.bottom = v12;
  result.left = v9;
  result.top = v11;
  return result;
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
  void *v13;
  SUUIResourceLoader *v14;

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

    -[SUUIViewElementLayoutContext setContainerViewElementType:](self->_layoutContext, "setContainerViewElementType:", -[SUUIContentUnavailableTemplateElement elementType](self->_templateElement, "elementType"));
    -[SUUIViewElementLayoutContext setParentViewController:](self->_layoutContext, "setParentViewController:", self);
    v8 = objc_alloc_init(SUUILayoutCache);
    textLayoutCache = self->_textLayoutCache;
    self->_textLayoutCache = v8;

    -[SUUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", self);
    v10 = -[SUUIViewElementTextLayoutCache initWithLayoutCache:]([SUUIViewElementTextLayoutCache alloc], "initWithLayoutCache:", self->_textLayoutCache);
    -[SUUIViewElementLayoutContext setLabelLayoutCache:](self->_layoutContext, "setLabelLayoutCache:", v10);
    v11 = [SUUIResourceLoader alloc];
    -[SUUIViewController operationQueue](self, "operationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewController clientContext](self, "clientContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SUUIResourceLoader initWithOperationQueue:clientContext:](v11, "initWithOperationQueue:clientContext:", v12, v13);

    -[SUUIViewElementLayoutContext setResourceLoader:](self->_layoutContext, "setResourceLoader:", v14);
    layoutContext = self->_layoutContext;
  }
  return layoutContext;
}

- (void)_reloadContentUnavailableView:(id)a3 width:(double)a4
{
  id v6;
  void *v7;
  float v8;
  double v9;
  id v10;

  if (a4 > 0.00000011920929)
  {
    v6 = a3;
    -[SUUIContentUnavailableDocumentViewController _layoutContext](self, "_layoutContext");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v7);

    objc_msgSend((id)objc_opt_class(), "prefetchResourcesForViewElement:reason:context:", self->_templateElement, 1, v10);
    v8 = a4 + -30.0;
    v9 = floorf(v8);
    objc_msgSend((id)objc_opt_class(), "requestLayoutForViewElement:width:context:", self->_templateElement, v10, v9);
    -[SUUILayoutCache commitLayoutRequests](self->_textLayoutCache, "commitLayoutRequests");
    objc_msgSend(v6, "reloadWithViewElement:width:context:", self->_templateElement, v10, v9);
    -[SUUIContentUnavailableDocumentViewController _contentInsets](self, "_contentInsets");
    objc_msgSend(v6, "setContentInset:");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
}

@end
