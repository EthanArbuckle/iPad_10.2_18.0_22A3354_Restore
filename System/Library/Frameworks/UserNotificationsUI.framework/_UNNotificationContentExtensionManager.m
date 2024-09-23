@implementation _UNNotificationContentExtensionManager

+ (void)initialize
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_beginMatchingExtensions");

}

- (_UNNotificationContentExtensionManager)init
{
  _UNNotificationContentExtensionManager *v2;
  _UNNotificationContentExtensionCache *v3;
  _UNNotificationContentExtensionCache *extensionsCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionManager;
  v2 = -[_UNNotificationContentExtensionManager init](&v6, sel_init);
  if (v2)
  {
    UNRegisterUserNotificationsUILogging();
    v3 = objc_alloc_init(_UNNotificationContentExtensionCache);
    extensionsCache = v2->_extensionsCache;
    v2->_extensionsCache = v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_instance;
}

- (id)extensionForNotificationSourceIdentifier:(id)a3 categoryIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[_UNNotificationContentExtensionManager extensionsCache](self, "extensionsCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionForNotificationSourceIdentifier:categoryIdentifier:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = UNLogExtensions;
    if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_216870000, v10, OS_LOG_TYPE_DEFAULT, "Not loading an extension because the notification has no category identifier", v12, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)_matchingAttributes
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.usernotifications.content-extension"), *MEMORY[0x24BDD0C48]);
  return v2;
}

- (void)_beginMatchingExtensions
{
  NSObject *v3;
  void *v4;
  void *v5;
  id extensionsDiscoveryToken;
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = UNLogExtensions;
  if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216870000, v3, OS_LOG_TYPE_DEFAULT, "Starting notifications extensions discovery", buf, 2u);
  }
  -[_UNNotificationContentExtensionManager _matchingAttributes](self, "_matchingAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66___UNNotificationContentExtensionManager__beginMatchingExtensions__block_invoke;
  v7[3] = &unk_24D5BB018;
  v7[4] = self;
  objc_msgSend(MEMORY[0x24BDD1550], "beginMatchingExtensionsWithAttributes:completion:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  extensionsDiscoveryToken = self->_extensionsDiscoveryToken;
  self->_extensionsDiscoveryToken = v5;

}

- (void)_stopMatchingExtensions
{
  id extensionsDiscoveryToken;

  if (self->_extensionsDiscoveryToken)
  {
    objc_msgSend(MEMORY[0x24BDD1550], "endMatchingExtensions:");
    extensionsDiscoveryToken = self->_extensionsDiscoveryToken;
    self->_extensionsDiscoveryToken = 0;

  }
}

- (_UNNotificationContentExtensionCache)extensionsCache
{
  return self->_extensionsCache;
}

- (void)setExtensionsCache:(id)a3
{
  objc_storeStrong((id *)&self->_extensionsCache, a3);
}

- (id)extensionsDiscoveryToken
{
  return self->_extensionsDiscoveryToken;
}

- (void)setExtensionsDiscoveryToken:(id)a3
{
  objc_storeStrong(&self->_extensionsDiscoveryToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_extensionsDiscoveryToken, 0);
  objc_storeStrong((id *)&self->_extensionsCache, 0);
}

@end
