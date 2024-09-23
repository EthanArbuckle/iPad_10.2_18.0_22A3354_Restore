@implementation EAWiFiUnconfiguredAccessoryBrowser

- (EAWiFiUnconfiguredAccessoryBrowser)init
{
  return -[EAWiFiUnconfiguredAccessoryBrowser initWithDelegate:queue:](self, "initWithDelegate:queue:", 0, 0);
}

- (EAWiFiUnconfiguredAccessoryBrowser)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  id v6;
  NSObject *v7;
  EAWiFiUnconfiguredAccessoryBrowser *v8;
  EAWiFiUnconfiguredAccessoryBrowser *v9;
  NSSet *v10;
  NSSet *unconfiguredAccessories;
  NSObject *v12;
  OS_dispatch_queue *delegateQueue;
  OS_dispatch_queue *v14;
  id v15;
  EAWiFiUnconfiguredAccessoryBrowser *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t block;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  EAWiFiUnconfiguredAccessoryBrowser *v26;
  objc_super v27;

  v6 = delegate;
  v7 = queue;
  v27.receiver = self;
  v27.super_class = (Class)EAWiFiUnconfiguredAccessoryBrowser;
  v8 = -[EAWiFiUnconfiguredAccessoryBrowser init](&v27, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    unconfiguredAccessories = v9->_unconfiguredAccessories;
    v9->_unconfiguredAccessories = v10;

    if (v7)
    {
      v12 = v7;
      delegateQueue = v9->_delegateQueue;
      v9->_delegateQueue = (OS_dispatch_queue *)v12;
    }
    else
    {
      v14 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v15 = MEMORY[0x1E0C80D38];
      delegateQueue = v9->_delegateQueue;
      v9->_delegateQueue = v14;
    }

    v9->__debugLog = +[WACLogging isEnabled](WACLogging, "isEnabled");
    block = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __61__EAWiFiUnconfiguredAccessoryBrowser_initWithDelegate_queue___block_invoke;
    v25 = &unk_1E6B07D88;
    v16 = v9;
    v26 = v16;
    if (initWithDelegate_queue__token != -1)
      dispatch_once(&initWithDelegate_queue__token, &block);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v16, sel__handleBrowserDidUpdateState_, CFSTR("EAWiFiUnconfiguredAccessoryBrowserDidUpdateState"), 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v16, sel__handleNewAccessoriesNotification_, CFSTR("EAWiFiUnconfiguredAccessoriesAddedNotification"), 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v16, sel__handleRemovedAccessoriesNotification_, CFSTR("EAWiFiUnconfiguredAccessoriesRemovedNotification"), 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v16, sel__handlePurgeAccessoriesSetNotification_, CFSTR("EAWiFiUnconfiguredAccessoryBrowserPurgeAccessoriesSet"), 0);
    if (v9->__debugLog)
    {
      EAUIApplicationDidEnterBackgroundNotification();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("### %@"), v18, block, v23, v24, v25, v26);

    }
    EAUIApplicationDidEnterBackgroundNotification();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v16, sel_stopSearchingForUnconfiguredAccessories, v19, 0);

  }
  v20 = (id)objc_msgSend((id)__EAWiFiUnconfiguredAccessoryBrowserManager, "sharedInstance");

  return v9;
}

void __61__EAWiFiUnconfiguredAccessoryBrowser_initWithDelegate_queue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  uikitFramework_0 = (uint64_t)dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.ExternalAccessory"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "builtInPlugInsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("ExternalAccessoryWACUIBits.bundle"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "load");
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    NSLog(CFSTR("### bundlePath: %@"), v5);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
    {
      NSLog(CFSTR("### bundle:     %@"), v4);
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
        NSLog(CFSTR("### principle:  %@"), objc_msgSend(v4, "principalClass"));
    }
  }
  if (v4)
  {
    __EAWiFiUnconfiguredAccessoryBrowserManager = objc_msgSend(v4, "principalClass");
    if (!__EAWiFiUnconfiguredAccessoryBrowserManager)
      NSLog(CFSTR("WAC: Browser: ERROR: Unable to find EAWiFiUnconfiguredAccessoryBrowserManager class"));
  }
  else
  {
    NSLog(CFSTR("WAC: Browser: ERROR: Unable to load EA WAC UI bundle."));
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (uikitFramework_0 && dealloc_token != -1)
    dispatch_once(&dealloc_token, &__block_literal_global_1);
  v4.receiver = self;
  v4.super_class = (Class)EAWiFiUnconfiguredAccessoryBrowser;
  -[EAWiFiUnconfiguredAccessoryBrowser dealloc](&v4, sel_dealloc);
}

uint64_t __45__EAWiFiUnconfiguredAccessoryBrowser_dealloc__block_invoke()
{
  return dlclose((void *)uikitFramework_0);
}

- (void)startSearchingForUnconfiguredAccessoriesMatchingPredicate:(NSPredicate *)predicate
{
  void *v4;
  NSPredicate *v5;

  v5 = predicate;
  if (self->__debugLog)
    NSLog(CFSTR("WAC: Browser: startSearchingForAccessories"));
  -[EAWiFiUnconfiguredAccessoryBrowser setAccessorySearchPredicate:](self, "setAccessorySearchPredicate:", v5);
  objc_msgSend((id)__EAWiFiUnconfiguredAccessoryBrowserManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startSearchingForUnconfiguredAccessories");

}

- (void)stopSearchingForUnconfiguredAccessories
{
  id v2;

  if (self->__debugLog)
    NSLog(CFSTR("WAC: Browser: stopSearchingForAccessories"), a2);
  objc_msgSend((id)__EAWiFiUnconfiguredAccessoryBrowserManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopSearchingForUnconfiguredAccessories");

}

- (void)configureAccessory:(EAWiFiUnconfiguredAccessory *)accessory withConfigurationUIOnViewController:(UIViewController *)viewController
{
  UIViewController *v6;
  void *v7;
  void *v8;
  EAWiFiUnconfiguredAccessory *v9;

  v9 = accessory;
  v6 = viewController;
  if (self->__debugLog)
    NSLog(CFSTR("WAC: Browser: configureAccessory: %@"), v9);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleBrowserFinishedConfiguring_, CFSTR("EAWiFiUnconfiguredAccessoryBrowserFinishedConfiguringAccessoryNotification"), 0);

  objc_msgSend((id)__EAWiFiUnconfiguredAccessoryBrowserManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureAccessory:withConfigurationUIOnViewController:", v9, v6);

}

- (void)_handleBrowserDidUpdateState:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  NSObject *delegateQueue;
  _QWORD block[6];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("EAWiFiUnconfiguredAccessoryBrowserState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");

  if (self->__debugLog)
    NSLog(CFSTR("WAC: Browser: _handleBrowserDidUpdateState: %d"), v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__EAWiFiUnconfiguredAccessoryBrowser__handleBrowserDidUpdateState___block_invoke;
      block[3] = &unk_1E6B07DB0;
      block[4] = self;
      block[5] = v6;
      dispatch_async(delegateQueue, block);
    }
  }
}

void __67__EAWiFiUnconfiguredAccessoryBrowser__handleBrowserDidUpdateState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "accessoryBrowser:didUpdateState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_handleNewAccessoriesNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  char v13;
  NSObject *delegateQueue;
  _QWORD block[5];
  id v16;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("EAWiFiUnconfiguredAccessoriesAddedOrRemovedSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->__debugLog)
    NSLog(CFSTR("WAC: Browser: _handleNewAccessoriesNotification: %@"), v5);
  -[EAWiFiUnconfiguredAccessoryBrowser accessorySearchPredicate](self, "accessorySearchPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[EAWiFiUnconfiguredAccessoryBrowser accessorySearchPredicate](self, "accessorySearchPredicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredSetUsingPredicate:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v5;
  }
  -[EAWiFiUnconfiguredAccessoryBrowser unconfiguredAccessories](self, "unconfiguredAccessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v8);

  if (objc_msgSend(v8, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v11 = WeakRetained;
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        delegateQueue = self->_delegateQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __72__EAWiFiUnconfiguredAccessoryBrowser__handleNewAccessoriesNotification___block_invoke;
        block[3] = &unk_1E6B07DD8;
        block[4] = self;
        v16 = v8;
        dispatch_async(delegateQueue, block);

      }
    }
  }

}

void __72__EAWiFiUnconfiguredAccessoryBrowser__handleNewAccessoriesNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "accessoryBrowser:didFindUnconfiguredAccessories:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_handleRemovedAccessoriesNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  char v13;
  NSObject *delegateQueue;
  _QWORD block[5];
  id v16;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("EAWiFiUnconfiguredAccessoriesAddedOrRemovedSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->__debugLog)
    NSLog(CFSTR("WAC: Browser: _handleRemovedAccessoriesNotification: %@"), v5);
  -[EAWiFiUnconfiguredAccessoryBrowser accessorySearchPredicate](self, "accessorySearchPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[EAWiFiUnconfiguredAccessoryBrowser accessorySearchPredicate](self, "accessorySearchPredicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredSetUsingPredicate:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v5;
  }
  -[EAWiFiUnconfiguredAccessoryBrowser unconfiguredAccessories](self, "unconfiguredAccessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v8);

  if (objc_msgSend(v8, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v11 = WeakRetained;
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        delegateQueue = self->_delegateQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __76__EAWiFiUnconfiguredAccessoryBrowser__handleRemovedAccessoriesNotification___block_invoke;
        block[3] = &unk_1E6B07DD8;
        block[4] = self;
        v16 = v8;
        dispatch_async(delegateQueue, block);

      }
    }
  }

}

void __76__EAWiFiUnconfiguredAccessoryBrowser__handleRemovedAccessoriesNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "accessoryBrowser:didRemoveUnconfiguredAccessories:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_handlePurgeAccessoriesSetNotification:(id)a3
{
  void *v4;
  NSObject *delegateQueue;
  id v6;
  NSSet *v7;
  NSSet *unconfiguredAccessories;
  _QWORD block[5];
  id v10;

  if (self->__debugLog)
    NSLog(CFSTR("WAC: Browser: _handlePurgeAccessoriesSetNotification. Purging: %@"), a2, a3, self->_unconfiguredAccessories);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_unconfiguredAccessories);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__EAWiFiUnconfiguredAccessoryBrowser__handlePurgeAccessoriesSetNotification___block_invoke;
  block[3] = &unk_1E6B07DD8;
  block[4] = self;
  v10 = v4;
  v6 = v4;
  dispatch_async(delegateQueue, block);
  v7 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  unconfiguredAccessories = self->_unconfiguredAccessories;
  self->_unconfiguredAccessories = v7;

}

void __77__EAWiFiUnconfiguredAccessoryBrowser__handlePurgeAccessoriesSetNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "accessoryBrowser:didRemoveUnconfiguredAccessories:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_handleBrowserFinishedConfiguring:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  id v14;
  char v15;
  NSObject *delegateQueue;
  _QWORD block[5];
  id v18;
  uint64_t v19;

  v4 = a3;
  v5 = v4;
  if (self->__debugLog)
    NSLog(CFSTR("WAC: Browser: _handleBrowserFinishedConfiguring: %@"), v4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("EAWiFiUnconfiguredAccessoryBrowserFinishedConfiguringAccessoryNotification"), 0);

  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("EAWiFiUnconfiguredAccessoryBrowserConfigurationStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v5, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("EAWiFiUnconfiguredAccessoryConfigured"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v13 = WeakRetained;
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__EAWiFiUnconfiguredAccessoryBrowser__handleBrowserFinishedConfiguring___block_invoke;
      block[3] = &unk_1E6B07E00;
      block[4] = self;
      v18 = v11;
      v19 = v9;
      dispatch_async(delegateQueue, block);

    }
  }

}

void __72__EAWiFiUnconfiguredAccessoryBrowser__handleBrowserFinishedConfiguring___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  objc_msgSend(WeakRetained, "accessoryBrowser:didFinishConfiguringAccessory:withStatus:", a1[4], a1[5], a1[6]);

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (NSSet)unconfiguredAccessories
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSPredicate)accessorySearchPredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAccessorySearchPredicate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySearchPredicate, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_unconfiguredAccessories, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
