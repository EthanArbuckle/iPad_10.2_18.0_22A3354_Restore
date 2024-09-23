@implementation SUUICollectionDOMFeature

- (SUUICollectionDOMFeature)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6;
  id v7;
  SUUICollectionDOMFeature *v8;
  void *v9;
  uint64_t v10;
  NSString *featureName;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUICollectionDOMFeature;
  v8 = -[SUUICollectionDOMFeature init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_appContext, v9);

    v10 = objc_msgSend(v7, "copy");
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v10;

  }
  return v8;
}

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3;
  SUUIJSDOMFeatureCollection *v4;
  void *v5;
  SUUIJSDOMFeatureCollection *v6;

  v3 = a3;
  v4 = [SUUIJSDOMFeatureCollection alloc];
  objc_msgSend(v3, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKJSObject initWithAppContext:](v4, "initWithAppContext:", v5);

  -[SUUIJSDOMFeatureCollection setAppBridge:](v6, "setAppBridge:", v3);
  return v6;
}

+ (id)featureName
{
  return CFSTR("Collection");
}

- (void)setEditing:(BOOL)a3 options:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__SUUICollectionDOMFeature_setEditing_options___block_invoke;
  v9[3] = &unk_2511F67C8;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(WeakRetained, "evaluateDelegateBlockSync:", v9);

}

void __47__SUUICollectionDOMFeature_setEditing_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("animated"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setEditing:animated:", v2, objc_msgSend(v3, "BOOLValue"));

}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (SUUICollectionDOMFeatureTargetting)collectionTarget
{
  return (SUUICollectionDOMFeatureTargetting *)objc_loadWeakRetained((id *)&self->_collectionTarget);
}

- (void)setCollectionTarget:(id)a3
{
  objc_storeWeak((id *)&self->_collectionTarget, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionTarget);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

@end
