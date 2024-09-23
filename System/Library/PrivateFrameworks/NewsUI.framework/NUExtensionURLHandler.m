@implementation NUExtensionURLHandler

- (NUExtensionURLHandler)initWithExtensionContext:(id)a3
{
  id v5;
  NUExtensionURLHandler *v6;
  NUExtensionURLHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUExtensionURLHandler;
  v6 = -[NUExtensionURLHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_extensionContext, a3);

  return v7;
}

- (void)openURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  -[NUExtensionURLHandler extensionContext](self, "extensionContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openURL:completionHandler:", v8, v7);

}

- (void)openURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NUExtensionURLHandler extensionContext](self, "extensionContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:completionHandler:", v4, 0);

}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionContext, 0);
}

@end
