@implementation _SFOpenWithAppUIActivity

- (_SFOpenWithAppUIActivity)initWithApplicationIdentifier:(id)a3 andFilePath:(id)a4
{
  id v6;
  id v7;
  _SFOpenWithAppUIActivity *v8;
  uint64_t v9;
  LSApplicationProxy *appProxy;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SFOpenWithAppUIActivity;
  v8 = -[UIActivity init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    appProxy = v8->_appProxy;
    v8->_appProxy = (LSApplicationProxy *)v9;

    objc_storeStrong((id *)&v8->_filePath, a4);
  }

  return v8;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilesafari.activity.openWithApp");
}

- (id)activityTitle
{
  return (id)-[LSApplicationProxy localizedName](self->_appProxy, "localizedName");
}

- (id)_activityImage
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", self->_appProxy, 2);
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_filePath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationProxy bundleIdentifier](self->_appProxy, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:userInfo:delegate:", v4, v5, 0, 0, self);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "start");
}

- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75___SFOpenWithAppUIActivity_openResourceOperation_didFinishCopyingResource___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_appProxy, 0);
}

@end
