@implementation IKViewElementStyleFactory

+ (IKViewElementStyleFactory)styleFactoryWithMarkup:(id)a3 styleSheet:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMarkup:styleSheet:", v7, v6);

  return (IKViewElementStyleFactory *)v8;
}

- (IKViewElementStyleFactory)initWithMarkup:(id)a3 styleSheet:(id)a4
{
  id v6;
  id v7;
  IKViewElementStyleFactory *v8;
  uint64_t v9;
  IKStyleFactory *styleFactory;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IKViewElementStyleFactory;
  v8 = -[IKViewElementStyleFactory init](&v12, sel_init);
  if (v8)
  {
    +[IKStyleFactory styleFactoryWithMarkup:filterBlockedStyles:](IKStyleFactory, "styleFactoryWithMarkup:filterBlockedStyles:", v6, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    styleFactory = v8->_styleFactory;
    v8->_styleFactory = (IKStyleFactory *)v9;

    objc_storeStrong((id *)&v8->_styleSheet, a4);
  }

  return v8;
}

- (id)styleComposerForElement:(id)a3 elementStyleOverrides:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  -[IKViewElementStyleFactory styleSheet](self, "styleSheet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "styleComposerForElement:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "parentStyleableElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "styleComposer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKViewElementStyleFactory styleFactory](self, "styleFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "classDescriptorString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "styleListForClassSelector:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[IKViewElementStyleComposer styleComposerWithDefaultStyleComposer:parentStyleComposer:styleList:elementStyleOverrides:](IKViewElementStyleComposer, "styleComposerWithDefaultStyleComposer:parentStyleComposer:styleList:elementStyleOverrides:", v9, v11, v14, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setViewElementStylesDirty
{
  void *v3;
  id v4;

  -[IKViewElementStyleFactory styleSheet](self, "styleSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setViewElementStylesDirty");

  -[IKViewElementStyleFactory styleFactory](self, "styleFactory");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setViewElementStylesDirty");

}

- (IKTemplateStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (IKStyleFactory)styleFactory
{
  return self->_styleFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleFactory, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
}

@end
