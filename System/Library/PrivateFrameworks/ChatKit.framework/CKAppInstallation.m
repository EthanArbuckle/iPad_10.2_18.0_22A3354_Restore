@implementation CKAppInstallation

- (CKAppInstallation)init
{
  return -[CKAppInstallation initWithBundleIdentifier:](self, "initWithBundleIdentifier:", 0);
}

- (CKAppInstallation)initWithBundleIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CKAppInstallation *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v7 = -[CKAppInstallation initWithBundleIdentifier:startTime:](self, "initWithBundleIdentifier:startTime:", v5);

  return v7;
}

- (CKAppInstallation)initWithBundleIdentifier:(id)a3 startTime:(double)a4
{
  id v7;
  CKAppInstallation *v8;
  CKAppInstallation *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  LSApplicationProxy *proxy;
  CKAppInstallation *v14;
  objc_super v16;

  v7 = a3;
  if (v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)CKAppInstallation;
    v8 = -[CKAppInstallation init](&v16, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_bundleIdentifier, a3);
      v10 = (void *)MEMORY[0x1E0CA5860];
      -[CKAppInstallation bundleIdentifier](v9, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "applicationProxyForIdentifier:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      proxy = v9->_proxy;
      v9->_proxy = (LSApplicationProxy *)v12;

      v9->_startTime = a4;
      if (!v9->_proxy)
      {

        v9 = 0;
      }
    }
    self = v9;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKAppInstallation *v4;
  void *v5;
  uint64_t v6;

  v4 = [CKAppInstallation alloc];
  -[CKAppInstallation bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKAppInstallation initWithBundleIdentifier:](v4, "initWithBundleIdentifier:", v5);

  -[CKAppInstallation percentComplete](self, "percentComplete");
  objc_msgSend((id)v6, "setPercentComplete:");
  *(_QWORD *)(v6 + 40) = self->_installState;
  objc_storeStrong((id *)(v6 + 24), self->_icon);
  *(double *)(v6 + 48) = self->_startTime;
  return (id)v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)pluginBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[CKAppInstallation proxy](self, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__ck_messagesPluginKitProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)localizedDisplayName
{
  void *v2;
  void *v3;

  -[CKAppInstallation proxy](self, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (LSApplicationProxy)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
  LSApplicationProxy *v5;
  UIImage *icon;
  LSApplicationProxy *v7;

  v5 = (LSApplicationProxy *)a3;
  if (self->_proxy != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_proxy, a3);
    icon = self->_icon;
    self->_icon = 0;

    v5 = v7;
  }

}

- (BOOL)installed
{
  void *v2;
  char v3;

  -[CKAppInstallation proxy](self, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInstalled");

  return v3;
}

- (UIImage)icon
{
  void *v3;
  void *v4;
  UIImage *v5;
  UIImage *icon;
  void *v7;
  UIImage *v8;
  UIImage *v9;
  NSObject *v10;
  UIImage *v11;
  int v13;
  UIImage *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_icon)
  {
    -[CKAppInstallation proxy](self, "proxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "__ck_messagesPluginKitProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "__ck_icon");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    icon = self->_icon;
    self->_icon = v5;

    if (!self->_icon)
    {
      -[CKAppInstallation proxy](self, "proxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "__ck_icon");
      v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v9 = self->_icon;
      self->_icon = v8;

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = self->_icon;
        v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Loaded icon: %@", (uint8_t *)&v13, 0xCu);
      }

    }
  }
  return self->_icon;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKAppInstallation bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppInstallation percentComplete](self, "percentComplete");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CKAppInstallation installState](self, "installState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppInstallation proxy](self, "proxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInstalled");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("CKAppInstallation[%@, %f%% complete, install state=%@, installed=%@, icon=%@]"), v4, v6, v7, v10, self->_icon);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (unint64_t)installState
{
  return self->_installState;
}

- (void)setInstallState:(unint64_t)a3
{
  self->_installState = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (LSApplicationWorkspace)_applicationWorkspace
{
  return self->__applicationWorkspace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
