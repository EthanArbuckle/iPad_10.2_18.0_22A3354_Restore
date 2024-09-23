@implementation WFApplicationContext

void __37__WFApplicationContext_sharedContext__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedContext_sharedContext;
  sharedContext_sharedContext = (uint64_t)v1;

}

- (WFApplicationContext)init
{
  WFApplicationContext *v2;
  uint64_t v3;
  NSLock *observersLock;
  WFApplicationContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFApplicationContext;
  v2 = -[WFApplicationContext init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    observersLock = v2->_observersLock;
    v2->_observersLock = (NSLock *)v3;

    -[NSLock setName:](v2->_observersLock, "setName:", CFSTR("WFApplicationContext observer lock"));
    v5 = v2;
  }

  return v2;
}

- (NSBundle)applicationBundle
{
  NSBundle *applicationBundle;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSBundle *v8;
  NSBundle *v9;

  applicationBundle = self->_applicationBundle;
  if (!applicationBundle)
  {
    objc_msgSend(MEMORY[0x24BDC1540], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", *MEMORY[0x24BEC17D8], 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = (void *)MEMORY[0x24BDD1488];
      objc_msgSend(v4, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleWithURL:", v7);
      v8 = (NSBundle *)objc_claimAutoreleasedReturnValue();
      v9 = self->_applicationBundle;
      self->_applicationBundle = v8;

    }
    applicationBundle = self->_applicationBundle;
  }
  return applicationBundle;
}

+ (WFApplicationContext)sharedContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WFApplicationContext_sharedContext__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedContext_onceToken != -1)
    dispatch_once(&sharedContext_onceToken, block);
  return (WFApplicationContext *)(id)sharedContext_sharedContext;
}

- (void)setProvider:(id)a3
{
  void *v6;
  void *v7;
  WFApplicationContextProvider **p_provider;
  WFApplicationContextProvider *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  WFApplicationContextProvider *v20;

  v20 = (WFApplicationContextProvider *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFApplicationContextProvider extensionApplicationContextProviderDelegate](v20, "extensionApplicationContextProviderDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFApplicationContext.m"), 70, CFSTR("extensionApplicationContextProviderDelegate must be set on the extension context."));

    }
  }
  p_provider = &self->_provider;
  v9 = v20;
  if (self->_provider != v20)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (*p_provider)
    {
      -[WFApplicationContextProvider notificationNameForApplicationStateEvent:applicationContext:](*p_provider, "notificationNameForApplicationStateEvent:applicationContext:", 0, self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFApplicationContextProvider notificationNameForApplicationStateEvent:applicationContext:](self->_provider, "notificationNameForApplicationStateEvent:applicationContext:", 1, self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFApplicationContextProvider notificationNameForApplicationStateEvent:applicationContext:](self->_provider, "notificationNameForApplicationStateEvent:applicationContext:", 2, self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFApplicationContextProvider notificationNameForApplicationStateEvent:applicationContext:](self->_provider, "notificationNameForApplicationStateEvent:applicationContext:", 3, self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v10, "removeObserver:name:object:", self, v11, 0);
      if (v12)
        objc_msgSend(v10, "removeObserver:name:object:", self, v12, 0);
      if (v13)
        objc_msgSend(v10, "removeObserver:name:object:", self, v13, 0);
      if (v14)
        objc_msgSend(v10, "removeObserver:name:object:", self, v14, 0);

    }
    if (v20)
    {
      -[WFApplicationContextProvider notificationNameForApplicationStateEvent:applicationContext:](v20, "notificationNameForApplicationStateEvent:applicationContext:", 0, self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFApplicationContextProvider notificationNameForApplicationStateEvent:applicationContext:](v20, "notificationNameForApplicationStateEvent:applicationContext:", 1, self);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFApplicationContextProvider notificationNameForApplicationStateEvent:applicationContext:](v20, "notificationNameForApplicationStateEvent:applicationContext:", 2, self);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFApplicationContextProvider notificationNameForApplicationStateEvent:applicationContext:](v20, "notificationNameForApplicationStateEvent:applicationContext:", 3, self);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive, v15, 0);
      if (v16)
        objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_applicationWillResignActive, v16, 0);
      if (v17)
        objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground, v17, 0);
      if (v18)
        objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_applicationWillEnterForeground, v18, 0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = -[WFApplicationContextProvider currentApplicationStateForWFApplicationContext:](v20, "currentApplicationStateForWFApplicationContext:", self);
      else
        v19 = 0;
      -[WFApplicationContext setInBackground:](self, "setInBackground:", v19 == 2);
      -[WFApplicationContext setInactive:](self, "setInactive:", v19 == 1);

    }
    objc_storeStrong((id *)&self->_provider, a3);

    v9 = v20;
  }

}

- (void)setInactive:(BOOL)a3
{
  self->_inactive = a3;
}

- (void)setInBackground:(BOOL)a3
{
  self->_inBackground = a3;
}

- (id)applicationOrNil
{
  void *v3;
  void *v4;

  -[WFApplicationContext provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationForWFApplicationContext:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)removeApplicationStateObserver:(id)a3 forEvent:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[WFApplicationContext observersLock](self, "observersLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  -[WFApplicationContext applicationStateObserversByEvent](self, "applicationStateObserversByEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") == 1 && objc_msgSend(v9, "containsObject:", v12))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v10);

  }
  else
  {
    objc_msgSend(v9, "removeObject:", v12);
  }
  -[WFApplicationContext observersLock](self, "observersLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

}

- (void)handleApplicationStateEvent:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[WFApplicationContext observersLock](self, "observersLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  if (self->_applicationStateObserversByEvent)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:copyItems:", self->_applicationStateObserversByEvent, 1);
  else
    v6 = 0;
  -[WFApplicationContext observersLock](self, "observersLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "applicationContext:applicationStateDidChange:", self, a3, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)addApplicationStateObserver:(id)a3 forEvent:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[WFApplicationContext observersLock](self, "observersLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  -[WFApplicationContext applicationStateObserversByEvent](self, "applicationStateObserversByEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, v10);

  }
  objc_msgSend(v9, "addObject:", v12);
  -[WFApplicationContext observersLock](self, "observersLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

}

- (BOOL)shouldReverseLayoutDirection
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[WFApplicationContext provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return WFShouldReverseLayoutDirection();
  -[WFApplicationContext provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldReverseLayoutDirection");

  return v6;
}

- (WFApplicationContextProvider)provider
{
  WFApplicationContextProvider *provider;
  WFApplicationContextProvider *v4;
  WFApplicationContextProvider *v5;

  provider = self->_provider;
  if (!provider)
  {
    v4 = (WFApplicationContextProvider *)objc_opt_new();
    v5 = self->_provider;
    self->_provider = v4;

    provider = self->_provider;
  }
  return provider;
}

- (NSLock)observersLock
{
  return self->_observersLock;
}

- (NSMutableDictionary)applicationStateObserversByEvent
{
  NSMutableDictionary *applicationStateObserversByEvent;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  applicationStateObserversByEvent = self->_applicationStateObserversByEvent;
  if (!applicationStateObserversByEvent)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_applicationStateObserversByEvent;
    self->_applicationStateObserversByEvent = v4;

    applicationStateObserversByEvent = self->_applicationStateObserversByEvent;
  }
  return applicationStateObserversByEvent;
}

- (void)applicationWillEnterForeground
{
  self->_inBackground = 0;
  -[WFApplicationContext handleApplicationStateEvent:](self, "handleApplicationStateEvent:", 3);
}

- (void)applicationDidBecomeActive
{
  notify_post((const char *)WFApplicationActiveIdentifier);
  self->_inactive = 0;
  -[WFApplicationContext handleApplicationStateEvent:](self, "handleApplicationStateEvent:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[WFApplicationContext setProvider:](self, "setProvider:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WFApplicationContext;
  -[WFApplicationContext dealloc](&v3, sel_dealloc);
}

- (void)applicationWillResignActive
{
  self->_inactive = 1;
  -[WFApplicationContext handleApplicationStateEvent:](self, "handleApplicationStateEvent:", 1);
}

- (void)applicationDidEnterBackground
{
  self->_inBackground = 1;
  -[WFApplicationContext handleApplicationStateEvent:](self, "handleApplicationStateEvent:", 2);
}

- (int64_t)applicationState
{
  void *v3;
  char v4;
  void *v5;
  int64_t v6;

  -[WFApplicationContext provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFApplicationContext provider](self, "provider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "currentApplicationStateForWFApplicationContext:", self);

    return v6;
  }
  else if (-[WFApplicationContext inBackground](self, "inBackground"))
  {
    return 2;
  }
  else
  {
    return -[WFApplicationContext inactive](self, "inactive");
  }
}

- (BOOL)canOpenURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x24BDC1548];
  v4 = a3;
  objc_msgSend(v3, "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationsAvailableForOpeningURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count") != 0;
  return v7;
}

- (void)openURL:(id)a3
{
  -[WFApplicationContext openURL:completionHandler:](self, "openURL:completionHandler:", a3, 0);
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  -[WFApplicationContext openURL:withBundleIdentifier:userInterface:completionHandler:](self, "openURL:withBundleIdentifier:userInterface:completionHandler:", a3, 0, 0, a4);
}

- (void)openURL:(id)a3 userInterface:(id)a4 completionHandler:(id)a5
{
  -[WFApplicationContext openURL:withBundleIdentifier:userInterface:completionHandler:](self, "openURL:withBundleIdentifier:userInterface:completionHandler:", a3, 0, a4, a5);
}

- (void)openURL:(id)a3 withBundleIdentifier:(id)a4 userInterface:(id)a5 completionHandler:(id)a6
{
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = a5;
  v13 = a6;
  if (v10 | v11)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __85__WFApplicationContext_openURL_withBundleIdentifier_userInterface_completionHandler___block_invoke;
      v15[3] = &unk_24C4DFA28;
      v18 = v13;
      v15[4] = self;
      v16 = (id)v10;
      v17 = (id)v11;
      objc_msgSend(v12, "openURL:withBundleIdentifier:completionHandler:", v16, v17, v15);

    }
    else
    {
      -[WFApplicationContext _openURL:withBundleIdentifier:completionHandler:](self, "_openURL:withBundleIdentifier:completionHandler:", v10, v11, v13);
    }
  }
  else
  {
    getWFApplicationContextLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[WFApplicationContext openURL:withBundleIdentifier:userInterface:completionHandler:]";
      _os_log_impl(&dword_20BBAD000, v14, OS_LOG_TYPE_ERROR, "%s Asked to open nil URL with nil bundle identifier", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
  }

}

- (void)_openURL:(id)a3 withBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  WFAppLaunchRequest *v10;
  WFAppLaunchRequest *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = [WFAppLaunchRequest alloc];
  if (v8)
  {
    v11 = -[INCAppLaunchRequest initWithBundleIdentifier:options:URL:userActivity:](v10, "initWithBundleIdentifier:options:URL:userActivity:", v8, 0, v7, 0);
    v12 = 0;
    if (v11)
    {
LABEL_3:
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __72__WFApplicationContext__openURL_withBundleIdentifier_completionHandler___block_invoke;
      v14[3] = &unk_24C4DEAD8;
      v15 = v9;
      -[WFAppLaunchRequest performWithCompletionHandler:](v11, "performWithCompletionHandler:", v14);

      goto LABEL_9;
    }
  }
  else
  {
    v16 = 0;
    v11 = -[INCAppLaunchRequest initWithURL:error:](v10, "initWithURL:error:", v7, &v16);
    v12 = v16;
    if (v11)
      goto LABEL_3;
  }
  getWFApplicationContextLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[WFApplicationContext _openURL:withBundleIdentifier:completionHandler:]";
    v19 = 2114;
    v20 = v12;
    _os_log_impl(&dword_20BBAD000, v13, OS_LOG_TYPE_ERROR, "%s Failed to create app launch request: %{public}@", buf, 0x16u);
  }

  if (v9)
    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v12);
LABEL_9:

}

- (NSArray)applicationBundleURLSchemes
{
  void *v2;
  void *v3;

  -[WFApplicationContext applicationBundle](self, "applicationBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFURLSchemesInBundle(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSBundle)bundle
{
  void *v3;
  void *v4;

  -[WFApplicationContext provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleForWFApplicationContext:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSBundle *)v4;
}

- (NSString)currentUserInterfaceType
{
  void *v3;
  void *v4;

  -[WFApplicationContext provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUserInterfaceTypeForWFApplicationContext:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)keyWindow
{
  void *v3;
  void *v4;

  -[WFApplicationContext provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyWindowForWFApplicationContext:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)userInterfaceStyle
{
  void *v3;
  void *v4;
  int64_t v5;

  -[WFApplicationContext provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WFApplicationContext provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)suspend
{
  id v2;

  -[WFApplicationContext applicationOrNil](self, "applicationOrNil");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspend");

}

- (BOOL)isIdleTimerDisabled
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[WFApplicationContext provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[WFApplicationContext provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "wfIdleTimerDisabled");

  return v6;
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[WFApplicationContext provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFApplicationContext provider](self, "provider");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWfIdleTimerDisabled:", v3);

  }
}

- (BOOL)canLoadShortcutsDatabase
{
  __SecTask *v3;
  __SecTask *v4;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  CFTypeID v7;
  BOOL v8;

  if (!-[WFApplicationContext canLoadShortcutsDatabaseEntitlementChecked](self, "canLoadShortcutsDatabaseEntitlementChecked"))
  {
    v3 = SecTaskCreateFromSelf(0);
    if (v3)
    {
      v4 = v3;
      v5 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v3, CFSTR("com.apple.rootless.storage.shortcuts"), 0);
      if (v5)
      {
        v6 = v5;
        v7 = CFGetTypeID(v5);
        v8 = v7 == CFBooleanGetTypeID() && CFBooleanGetValue(v6) != 0;
        self->_canLoadShortcutsDatabase = v8;
        CFRelease(v6);
      }
      CFRelease(v4);
    }
    -[WFApplicationContext setCanLoadShortcutsDatabaseEntitlementChecked:](self, "setCanLoadShortcutsDatabaseEntitlementChecked:", 1);
  }
  return self->_canLoadShortcutsDatabase;
}

- (void)setApplicationStateObserversByEvent:(id)a3
{
  objc_storeStrong((id *)&self->_applicationStateObserversByEvent, a3);
}

- (BOOL)inactive
{
  return self->_inactive;
}

- (BOOL)inBackground
{
  return self->_inBackground;
}

- (BOOL)canLoadShortcutsDatabaseEntitlementChecked
{
  return self->_canLoadShortcutsDatabaseEntitlementChecked;
}

- (void)setCanLoadShortcutsDatabaseEntitlementChecked:(BOOL)a3
{
  self->_canLoadShortcutsDatabaseEntitlementChecked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_applicationStateObserversByEvent, 0);
  objc_storeStrong((id *)&self->_applicationBundle, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

void __72__WFApplicationContext__openURL_withBundleIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    getWFApplicationContextLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[WFApplicationContext _openURL:withBundleIdentifier:completionHandler:]_block_invoke";
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_20BBAD000, v6, OS_LOG_TYPE_ERROR, "%s Error launching app: %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

uint64_t __85__WFApplicationContext_openURL_withBundleIdentifier_userInterface_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
    return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), a3 == 0);
  else
    return objc_msgSend(*(id *)(a1 + 32), "_openURL:withBundleIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

@end
