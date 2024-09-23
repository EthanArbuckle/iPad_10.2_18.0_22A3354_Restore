@implementation SUUINavigationBarSectionController

- (void)dealloc
{
  objc_super v3;

  -[SUUIViewElementLayoutContext setArtworkRequestDelegate:](self->_viewLayoutContext, "setArtworkRequestDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUINavigationBarSectionController;
  -[SUUINavigationBarSectionController dealloc](&v3, sel_dealloc);
}

- (id)barButtonItemForElementIdentifier:(id)a3
{
  return 0;
}

- (UIView)view
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (SUUIViewElementLayoutContext)viewLayoutContext
{
  SUUIViewElementLayoutContext *viewLayoutContext;
  SUUIViewElementLayoutContext *v4;
  SUUIViewElementLayoutContext *v5;
  SUUIViewElementLayoutContext *v6;
  void *v7;
  SUUIViewElementLayoutContext *v8;
  void *v9;
  SUUIViewElementLayoutContext *v10;
  void *v11;
  SUUIViewElementTextLayoutCache *v12;
  void *v13;
  SUUIViewElementTextLayoutCache *v14;

  viewLayoutContext = self->_viewLayoutContext;
  if (!viewLayoutContext)
  {
    v4 = objc_alloc_init(SUUIViewElementLayoutContext);
    v5 = self->_viewLayoutContext;
    self->_viewLayoutContext = v4;

    -[SUUIViewElementLayoutContext setArtworkRequestDelegate:](self->_viewLayoutContext, "setArtworkRequestDelegate:", self);
    v6 = self->_viewLayoutContext;
    -[SUUINavigationBarContext clientContext](self->_navigationBarContext, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewElementLayoutContext setClientContext:](v6, "setClientContext:", v7);

    v8 = self->_viewLayoutContext;
    -[SUUINavigationBarContext parentViewController](self->_navigationBarContext, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewElementLayoutContext setParentViewController:](v8, "setParentViewController:", v9);

    v10 = self->_viewLayoutContext;
    -[SUUINavigationBarContext resourceLoader](self->_navigationBarContext, "resourceLoader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewElementLayoutContext setResourceLoader:](v10, "setResourceLoader:", v11);

    v12 = [SUUIViewElementTextLayoutCache alloc];
    -[SUUINavigationBarContext textLayoutCache](self->_navigationBarContext, "textLayoutCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SUUIViewElementTextLayoutCache initWithLayoutCache:](v12, "initWithLayoutCache:", v13);

    -[SUUIViewElementLayoutContext setLabelLayoutCache:](self->_viewLayoutContext, "setLabelLayoutCache:", v14);
    viewLayoutContext = self->_viewLayoutContext;
  }
  return viewLayoutContext;
}

- (SUUINavigationBarContext)context
{
  return self->_navigationBarContext;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewLayoutContext, 0);
  objc_storeStrong((id *)&self->_navigationBarContext, 0);
}

@end
