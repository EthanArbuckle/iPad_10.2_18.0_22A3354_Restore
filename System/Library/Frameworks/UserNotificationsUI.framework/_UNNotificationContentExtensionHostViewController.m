@implementation _UNNotificationContentExtensionHostViewController

- (_UNNotificationContentExtensionHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UNNotificationContentExtensionHostViewController;
  return -[_UNNotificationContentExtensionHostViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
}

- (BOOL)__shouldRemoteViewControllerFenceOperations
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostViewController viewWillAppear:]";
    _os_log_impl(&dword_216870000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostViewController;
  -[_UIRemoteViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostViewController viewDidAppear:]";
    _os_log_impl(&dword_216870000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostViewController;
  -[_UIRemoteViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostViewController viewWillDisappear:]";
    _os_log_impl(&dword_216870000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostViewController;
  -[_UIRemoteViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostViewController viewDidDisappear:]";
    _os_log_impl(&dword_216870000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostViewController;
  -[_UIRemoteViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  NSCopying *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id WeakRetained;
  NSObject *v9;
  NSObject *v10;
  NSCopying *extensionRequestIdentifier;
  int v12;
  id v13;
  __int16 v14;
  NSCopying *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (NSCopying *)a3;
  -[_UNNotificationContentExtensionHostViewController notificationRequestIdentifier](self, "notificationRequestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_logDigest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_216870000, v7, OS_LOG_TYPE_DEFAULT, "Extension view service for notification request %{public}@ disconnected with error: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_extension);
  if (WeakRetained && self->_extensionRequestIdentifier)
  {
    v9 = UNLogExtensionsHost;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_216870000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling loaded extension for notification request %{public}@", (uint8_t *)&v12, 0xCu);
    }
    objc_msgSend(WeakRetained, "cancelExtensionRequestWithIdentifier:", self->_extensionRequestIdentifier);
  }
  else
  {
    v10 = UNLogExtensionsHost;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_ERROR))
    {
      extensionRequestIdentifier = self->_extensionRequestIdentifier;
      v12 = 138543874;
      v13 = WeakRetained;
      v14 = 2114;
      v15 = extensionRequestIdentifier;
      v16 = 2114;
      v17 = v6;
      _os_log_error_impl(&dword_216870000, v10, OS_LOG_TYPE_ERROR, "Can't cancel extension request – missing extension (%{public}@) or extension request ID (%{public}@) for notification request %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UNNotificationContentExtensionHostViewController;
  -[_UNNotificationContentExtensionHostViewController setPreferredContentSize:](&v3, sel_setPreferredContentSize_, a3.width, a3.height, 0.0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[_UNNotificationContentExtensionHostViewController notificationRequestIdentifier](self, "notificationRequestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_logDigest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationContentExtensionHostViewController extension](self, "extension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationContentExtensionHostViewController extensionRequestIdentifier](self, "extensionRequestIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; notificationRequestID: %@; extensionID: %@; extensionRequestID: %@>"),
    v4,
    self,
    v6,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSExtension)extension
{
  return (NSExtension *)objc_loadWeakRetained((id *)&self->_extension);
}

- (void)setExtension:(id)a3
{
  objc_storeWeak((id *)&self->_extension, a3);
}

- (NSCopying)extensionRequestIdentifier
{
  return self->_extensionRequestIdentifier;
}

- (void)setExtensionRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1480);
}

- (NSString)notificationRequestIdentifier
{
  return self->_notificationRequestIdentifier;
}

- (void)setNotificationRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1488);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_destroyWeak((id *)&self->_extension);
}

@end
