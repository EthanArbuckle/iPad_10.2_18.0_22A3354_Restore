@implementation SUUIAnimatorDOMFeature

- (SUUIAnimatorDOMFeature)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6;
  id v7;
  SUUIAnimatorDOMFeature *v8;
  void *v9;
  uint64_t v10;
  NSString *featureName;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUIAnimatorDOMFeature;
  v8 = -[SUUIAnimatorDOMFeature init](&v13, sel_init);
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
  SKJSUIAnimatorDOMFeature *v4;
  void *v5;
  SKJSUIAnimatorDOMFeature *v6;

  v3 = a3;
  v4 = [SKJSUIAnimatorDOMFeature alloc];
  objc_msgSend(v3, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKJSUIAnimatorDOMFeature initWithAppContext:DOMFeature:](v4, "initWithAppContext:DOMFeature:", v5, v3);

  return v6;
}

+ (id)featureName
{
  return CFSTR("animator");
}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (SUUIAnimatorDOMFeatureDelegate)delegate
{
  return (SUUIAnimatorDOMFeatureDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
