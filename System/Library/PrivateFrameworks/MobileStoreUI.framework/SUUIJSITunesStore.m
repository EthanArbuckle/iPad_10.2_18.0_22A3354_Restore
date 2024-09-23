@implementation SUUIJSITunesStore

- (SUUIJSITunesStore)initWithAppContext:(id)a3 clientContext:(id)a4
{
  id v7;
  SUUIJSITunesStore *v8;
  SUUIJSITunesStore *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUUIJSITunesStore;
  v8 = -[IKJSITunesStore initWithAppContext:](&v14, sel_initWithAppContext_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clientContext, a4);
    +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:", v9);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, sel__purchaseRequestDidSucceedNotification_, 0x2512025A8, 0);

    v12 = SUUIMediaPlayerFramework();
    objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("MPMediaQuery"), v12), "setFilteringDisabled:", 1);
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, 0x2512025A8, 0);

  v5.receiver = self;
  v5.super_class = (Class)SUUIJSITunesStore;
  -[IKJSITunesStore dealloc](&v5, sel_dealloc);
}

- (void)sendApplicationDidEnterBackground
{
  id v2;

  v2 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("applicationDidEnterBackground"), 0);
}

- (void)sendApplicationWillEnterForeground
{
  id v2;

  v2 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("applicationWillEnterForeground"), 0);
}

- (void)sendOnNavigationStackWillPop:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("isInteractive");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onNavigationStackWillPop"), v6);

}

- (void)sendOnPageResponseWithDocument:(id)a3 data:(id)a4 URLResponse:(id)a5 performanceMetrics:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SUUIJSFakeXMLHTTPRequest *v14;
  void *v15;
  SUUIJSFakeXMLHTTPRequest *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [SUUIJSFakeXMLHTTPRequest alloc];
  -[IKJSObject appContext](self, "appContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SUUIJSFakeXMLHTTPRequest initWithAppContext:data:URLResponse:performanceMetrics:](v14, "initWithAppContext:data:URLResponse:performanceMetrics:", v15, v12, v11, v10);

  objc_msgSend(v13, "valueForKey:", CFSTR("jsDocument"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = v17;
  v20[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onPageResponse"), v18);

}

- (BOOL)sendOnXEventWithDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDDA730];
  v5 = a3;
  -[IKJSObject appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueWithObject:inContext:", self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v8, "hasProperty:", CFSTR("onXEvent"));
  v12[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onXEvent"), v9);
  return (char)v4;
}

- (BOOL)sendAppPreviewStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v3 = a3;
  v16[1] = *MEMORY[0x24BDAC8D0];
  self->_isAppPreview = a3;
  v5 = (void *)MEMORY[0x24BDDA730];
  -[IKJSObject appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithObject:inContext:", self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "hasProperty:", CFSTR("onAppPreviewStateChanged"));
  v15 = CFSTR("isPreview");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onAppPreviewStateChanged"), v11);

  return (char)v6;
}

- (void)sendApplicationWindowSizeDidUpdate:(CGSize)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE70], "su_dictionaryWithSize:", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onWindowSizeDidUpdate"), v5);

}

- (BOOL)sendOnShowPageEventType:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDDA730];
  -[IKJSObject appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueWithObject:inContext:", self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "hasProperty:", CFSTR("onShowPage"));
  v19 = CFSTR("type");
  v20[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (v7)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("data"));
  v18 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onShowPage"), v15);

  return v12;
}

- (int64_t)applicationIconBadgeNumber
{
  int64_t v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SUUIJSITunesStore_applicationIconBadgeNumber__block_invoke;
  block[3] = &unk_2511FA508;
  block[4] = &v5;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __47__SUUIJSITunesStore_applicationIconBadgeNumber__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "applicationIconBadgeNumber");

}

- (BOOL)areVideosCloudPurchasesEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("VideosShowCloudMediaEnabledSetting"), CFSTR("com.apple.mobileipod"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (void)attemptLocalAskToBuyApproval:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a3;
  v4 = SUUIAskPermissionFramework();
  v5 = SUUIWeakLinkedClassForString(CFSTR("PRRequestQueue"), v4);
  v6 = (void *)SUUIAskPermissionFramework();
  objc_msgSend(v5, "_requestQueueForIdentifier:", *(_QWORD *)SUUIWeakLinkedSymbolForString("kPRRequestQueueiTunesStoreIdentifier", v6));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "longLongValue");

  objc_msgSend(v8, "_attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:completionHandler:", v7, 0);
}

- (void)buy:(id)a3
{
  id v4;
  SUUIItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SUUIClientContext *clientContext;
  _QWORD *v11;
  id *v12;
  SUUIClientContext *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  SUUIItem *v19;
  SUUIJSITunesStore *v20;
  id v21;
  uint64_t *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  id location;

  v4 = a3;
  v5 = -[SUUIItem initWithLookupDictionary:]([SUUIItem alloc], "initWithLookupDictionary:", v4);
  -[SUUIItem primaryItemOffer](v5, "primaryItemOffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_initWeak(&location, self);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 1;
    if (SUUIItemKindIsToneKind(-[SUUIItem itemKind](v5, "itemKind")))
    {
      -[IKJSObject appContext](self, "appContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __25__SUUIJSITunesStore_buy___block_invoke;
      v18[3] = &unk_2511FAD70;
      v19 = v5;
      v20 = self;
      objc_copyWeak(&v23, &location);
      v21 = v4;
      v22 = &v24;
      objc_msgSend(v8, "evaluateDelegateBlockSync:", v18);

      objc_destroyWeak(&v23);
    }
    if (*((_BYTE *)v25 + 24))
    {
      if (SUUIItemStateCenterUseAppstoredPurchases(v5))
      {
        +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        clientContext = self->_clientContext;
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __25__SUUIJSITunesStore_buy___block_invoke_3;
        v16[3] = &unk_2511FAD98;
        v11 = v16;
        v12 = &v17;
        objc_copyWeak(&v17, &location);
        v16[4] = v4;
        objc_msgSend(v9, "purchaseSoftwareItem:offer:clientContext:completionBlock:", v5, v6, clientContext, v16);
      }
      else
      {
        +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = self->_clientContext;
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __25__SUUIJSITunesStore_buy___block_invoke_4;
        v14[3] = &unk_2511FAD48;
        v11 = v14;
        v12 = &v15;
        objc_copyWeak(&v15, &location);
        v14[4] = v4;
        objc_msgSend(v9, "purchaseItem:offer:clientContext:completionBlock:", v5, v6, v13, v14);
      }

      objc_destroyWeak(v12);
    }
    _Block_object_dispose(&v24, 8);
    objc_destroyWeak(&location);
  }

}

void __25__SUUIJSITunesStore_buy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SUUITonePurchaseController *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "presentationViewControllerForAppContext:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = -[SUUITonePurchaseController initWithItem:]([SUUITonePurchaseController alloc], "initWithItem:", *(_QWORD *)(a1 + 32));
      -[SUUITonePurchaseController setClientContext:](v7, "setClientContext:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
      -[SUUITonePurchaseController setParentViewController:](v7, "setParentViewController:", v6);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __25__SUUIJSITunesStore_buy___block_invoke_2;
      v8[3] = &unk_2511FAD48;
      objc_copyWeak(&v10, (id *)(a1 + 64));
      v9 = *(id *)(a1 + 48);
      -[SUUITonePurchaseController showPurchaseFlowWithCompletionBlock:](v7, "showPurchaseFlowWithCompletionBlock:", v8);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;

      objc_destroyWeak(&v10);
    }
  }

}

void __25__SUUIJSITunesStore_buy___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_finishPurchaseForOptions:purchaseResponse:", *(_QWORD *)(a1 + 32), v4);

}

void __25__SUUIJSITunesStore_buy___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_finishSoftwarePurchaseForOptions:purchaseResponse:", *(_QWORD *)(a1 + 32), v4);

}

void __25__SUUIJSITunesStore_buy___block_invoke_4(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_finishPurchaseForOptions:purchaseResponse:", *(_QWORD *)(a1 + 32), v4);

}

- (void)approveInPerson:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  SUUIJSITunesStore *v27;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  v12 = SUUIAskPermissionFramework();
  v13 = SUUIWeakLinkedClassForString(CFSTR("PRRequestQueue"), v12);
  v14 = (void *)SUUIAskPermissionFramework();
  v15 = *(id *)SUUIWeakLinkedSymbolForString("kPRRequestQueueiTunesStoreIdentifier", v14);
  objc_msgSend(v13, "_requestQueueForIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v6, "longLongValue");
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __38__SUUIJSITunesStore_approveInPerson::__block_invoke;
  v22[3] = &unk_2511FADE8;
  v23 = v8;
  v24 = v9;
  v25 = v6;
  v26 = v11;
  v27 = self;
  v18 = v11;
  v19 = v6;
  v20 = v9;
  v21 = v8;
  objc_msgSend(v16, "_attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:completionHandler:", v17, v22);

}

void __38__SUUIJSITunesStore_approveInPerson::__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__SUUIJSITunesStore_approveInPerson::__block_invoke_2;
  v8[3] = &unk_2511FADC0;
  v5 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v13 = a3;
  v10 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v11 = v6;
  v12 = v7;
  objc_msgSend(v5, "evaluate:completionBlock:", v8, 0);

}

void __38__SUUIJSITunesStore_approveInPerson::__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 64), CFSTR("status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("adamId");
  v8[0] = v3;
  v8[1] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "callWithArguments:", v5);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)clearToggleStateItems
{
  id v2;

  +[SUUIToggleStateCenter defaultCenter](SUUIToggleStateCenter, "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAll");

}

- (void)download:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x24BEB1E30];
  v4 = a3;
  v8 = (id)objc_msgSend([v3 alloc], "initWithDictionary:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E08]), "initWithDownloadMetadata:", v8);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v5, 0);
  if (objc_msgSend(v6, "count"))
  {
    +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDownloads:", v6);

  }
}

- (void)downloadExistsFor:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  v12 = (void *)objc_msgSend(v6, "longLongValue");
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BEB1E18], "IPodDownloadManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __40__SUUIJSITunesStore_downloadExistsFor::__block_invoke;
  v17[3] = &unk_2511FAE38;
  objc_copyWeak(v21, &location);
  v21[1] = v12;
  v14 = v8;
  v18 = v14;
  v15 = v9;
  v19 = v15;
  v16 = v11;
  v20 = v16;
  objc_msgSend(v13, "getDownloadsUsingBlock:", v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

}

void __40__SUUIJSITunesStore_downloadExistsFor::__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v5 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __40__SUUIJSITunesStore_downloadExistsFor::__block_invoke_2;
  v17[3] = &unk_2511FAE10;
  v6 = *(_QWORD *)(a1 + 64);
  v17[4] = &v18;
  v17[5] = v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v17);
  v22 = CFSTR("exists");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v19 + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __40__SUUIJSITunesStore_downloadExistsFor::__block_invoke_3;
  v12[3] = &unk_2511F9768;
  v9 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v10 = v8;
  v14 = v10;
  v15 = *(id *)(a1 + 48);
  v11 = WeakRetained;
  v16 = v11;
  objc_msgSend(v9, "evaluate:completionBlock:", v12, 0);

  _Block_object_dispose(&v18, 8);
}

void __40__SUUIJSITunesStore_downloadExistsFor::__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BEB2410]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "longLongValue");

    if (*(_QWORD *)(a1 + 40) == v7)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

void __40__SUUIJSITunesStore_downloadExistsFor::__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)exit:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __26__SUUIJSITunesStore_exit___block_invoke;
  v7[3] = &unk_2511F9740;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "evaluateDelegateBlockSync:", v7);

}

void __26__SUUIJSITunesStore_exit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "appContext:didExitWithOptions:", v4, *(_QWORD *)(a1 + 32));

}

- (void)findApps:(id)a3 :(id)a4 :(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  SUUIJSITunesStore *v21;

  v7 = a4;
  v8 = a3;
  -[IKJSObject appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "virtualMachine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addManagedReference:withOwner:", v10, self);
  v13 = objc_alloc_init(MEMORY[0x24BEB1FD0]);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __32__SUUIJSITunesStore_findApps_::__block_invoke;
  v17[3] = &unk_2511FAE60;
  v18 = v9;
  v19 = v10;
  v20 = v12;
  v21 = self;
  v14 = v12;
  v15 = v10;
  v16 = v9;
  objc_msgSend(v13, "getLibraryItemForBundleIdentifiers:completionBlock:", v8, v17);

}

void __32__SUUIJSITunesStore_findApps_::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  SUUILibraryItemState *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v24 = a1;
  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v25 = a3;
  v28 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    v9 = *MEMORY[0x24BEB2A60];
    v26 = *(_QWORD *)v35;
    v27 = *MEMORY[0x24BEB2A80];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x2426A2860]();
        objc_msgSend(v11, "valueForProperty:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 && (objc_msgSend(v11, "isPlaceholder") & 1) == 0 && (objc_msgSend(v11, "isBeta") & 1) == 0)
        {
          v14 = -[SUUILibraryItemState initWithApplication:]([SUUILibraryItemState alloc], "initWithApplication:", v11);
          v15 = -[SUUILibraryItemState newJavaScriptRepresentation](v14, "newJavaScriptRepresentation");
          objc_msgSend(v11, "valueForProperty:", v27);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "stringValue");
            v18 = v5;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKey:", v19, 0x251203528);

            v5 = v18;
            v8 = v26;
          }
          objc_msgSend(v28, "setObject:forKey:", v15, v13, v24, v25);

        }
        objc_autoreleasePoolPop(v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v7);
  }

  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __32__SUUIJSITunesStore_findApps_::__block_invoke_2;
  v29[3] = &unk_2511F9768;
  v20 = *(void **)(v24 + 32);
  v30 = *(id *)(v24 + 40);
  v31 = v28;
  v21 = *(id *)(v24 + 48);
  v22 = *(_QWORD *)(v24 + 56);
  v32 = v21;
  v33 = v22;
  v23 = v28;
  objc_msgSend(v20, "evaluate:completionBlock:", v29, 0);

}

void __32__SUUIJSITunesStore_findApps_::__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)findLibraryItems:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  SUUIJSITunesStore *v23;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[IKJSObject appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "virtualMachine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addManagedReference:withOwner:", v12, self);
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __40__SUUIJSITunesStore_findLibraryItems_::__block_invoke;
  v19[3] = &unk_2511FAE88;
  v20 = v11;
  v21 = v12;
  v22 = v14;
  v23 = self;
  v16 = v14;
  v17 = v12;
  v18 = v11;
  objc_msgSend(v15, "findLibraryItemsForContentIdentifiers:options:completionBlock:", v10, v8, v19);

}

void __40__SUUIJSITunesStore_findLibraryItems_::__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__SUUIJSITunesStore_findLibraryItems_::__block_invoke_2;
  v8[3] = &unk_2511F9768;
  v4 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v11 = v5;
  v12 = v6;
  v7 = v3;
  objc_msgSend(v4, "evaluate:completionBlock:", v8, 0);

}

void __40__SUUIJSITunesStore_findLibraryItems_::__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)findOwnedItems:(id)a3 :(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  SUUIStoreIdentifier *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  SUUIJSITunesStore *v26;
  void *v27;
  void *v28;
  id v29;
  id obj;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  SUUIJSITunesStore *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v28 = v7;
  objc_msgSend(v7, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "virtualMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v10;
  v25 = (void *)v8;
  v26 = self;
  objc_msgSend(v10, "addManagedReference:withOwner:", v8, self);
  v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v6;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v15, "longLongValue"));
        v17 = v16;
        v18 = -[SUUIStoreIdentifier initWithLongLong:]([SUUIStoreIdentifier alloc], "initWithLongLong:", objc_msgSend(v16, "longLongValue"));
        if (v18)
        {
          +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stateForItemWithStoreIdentifier:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v20, "state") & 8) != 0)
            objc_msgSend(v29, "addObject:", v15);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v12);
  }

  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __37__SUUIJSITunesStore_findOwnedItems::__block_invoke;
  v31[3] = &unk_2511F9768;
  v32 = v25;
  v33 = v29;
  v34 = v24;
  v35 = v26;
  v21 = v24;
  v22 = v29;
  v23 = v25;
  objc_msgSend(v27, "evaluate:completionBlock:", v31, 0);

}

void __37__SUUIJSITunesStore_findOwnedItems::__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)findToggleStateForItem:(id)a3 :(id)a4
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
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  SUUIJSITunesStore *v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[IKJSObject appContext](self, "appContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "virtualMachine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
    +[SUUIToggleStateCenter defaultCenter](SUUIToggleStateCenter, "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itemForIdentifier:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v12) = objc_msgSend(v13, "toggled");
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setValue:forKey:", v6, CFSTR("itemID"));
    if ((_DWORD)v12 == 1)
      v15 = MEMORY[0x24BDBD1C8];
    else
      v15 = MEMORY[0x24BDBD1C0];
    objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("toggled"));
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __45__SUUIJSITunesStore_findToggleStateForItem::__block_invoke;
    v19[3] = &unk_2511F9768;
    v20 = v9;
    v21 = v14;
    v22 = v11;
    v23 = self;
    v16 = v11;
    v17 = v14;
    v18 = v9;
    objc_msgSend(v8, "evaluate:completionBlock:", v19, 0);

  }
}

void __45__SUUIJSITunesStore_findToggleStateForItem::__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)getBookSample:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x24BEB1E30];
  v4 = a3;
  v7 = (id)objc_msgSend([v3 alloc], "initWithDictionary:", v4);

  objc_msgSend(v7, "primaryAssetURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addManifestDownloadWithURL:placeholderMetadata:", v5, v7);

  }
}

- (void)getAdminStatus:(id)a3 :(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  SUUIJSITunesStore *v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDDA728];
  v8 = a4;
  objc_msgSend(v7, "managedValueWithValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v6, "objectForKey:", CFSTR("ignoreCache"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v13, "BOOLValue"))
    objc_msgSend(v12, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("SUUIMediaSocialAdminPermissionsOptionIgnoreCache"));
  -[IKJSObject appContext](self, "appContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUIMediaSocialAdminPermissionsCoordinator sharedCoordinator](SUUIMediaSocialAdminPermissionsCoordinator, "sharedCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __37__SUUIJSITunesStore_getAdminStatus::__block_invoke;
  v19[3] = &unk_2511F74A0;
  v20 = v14;
  v21 = v9;
  v22 = v11;
  v23 = self;
  v16 = v11;
  v17 = v9;
  v18 = v14;
  objc_msgSend(v15, "getAdminStatusWithOptions:resultBlock:", v6, v19);

}

void __37__SUUIJSITunesStore_getAdminStatus::__block_invoke(uint64_t a1, char a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  if (a3)
  {
    objc_msgSend(a3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BEB24A8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)(objc_msgSend(v6, "integerValue") - 500) <= 0x62)
    {
      +[SUUIMediaSocialAdminPermissionsCoordinator sharedCoordinator](SUUIMediaSocialAdminPermissionsCoordinator, "sharedCoordinator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastKnownAdminStatus");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        a2 = objc_msgSend(v8, "BOOLValue");

    }
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __37__SUUIJSITunesStore_getAdminStatus::__block_invoke_2;
  v12[3] = &unk_2511F7478;
  v9 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v16 = a2;
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v14 = v10;
  v15 = v11;
  objc_msgSend(v9, "evaluate:completionBlock:", v12, 0);

}

uint64_t __37__SUUIJSITunesStore_getAdminStatus::__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDBD1C8];
  if (!*(_BYTE *)(a1 + 56))
    v3 = MEMORY[0x24BDBD1C0];
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "callWithArguments:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (NSString)hostApp
{
  void *v3;
  void *v4;

  if (-[SUUIClientContext conformsToProtocol:](self->_clientContext, "conformsToProtocol:", &unk_257264DE8))
  {
    -[SUUIClientContext hostApplicationIdentifier](self->_clientContext, "hostApplicationIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (BOOL)isAppPreview
{
  return self->_isAppPreview;
}

- (id)documentSizeForNavigationDocument:(id)a3
{
  SUUIClientContext *clientContext;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  clientContext = self->_clientContext;
  v4 = a3;
  -[SUUIClientContext applicationController](clientContext, "applicationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeForNavigationDocument:", v4);
  v7 = v6;
  v9 = v8;

  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "su_dictionaryWithSize:", v7, v9);
}

- (void)getProfilePermissions:(id)a3 :(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  SUUIJSITunesStore *v23;

  v6 = (void *)MEMORY[0x24BDDA728];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "managedValueWithValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v8, "objectForKey:", CFSTR("ignoreCache"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v13, "BOOLValue"))
    objc_msgSend(v12, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("SUUIMediaSocialAdminPermissionsOptionIgnoreCache"));
  -[IKJSObject appContext](self, "appContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUIMediaSocialAdminPermissionsCoordinator sharedCoordinator](SUUIMediaSocialAdminPermissionsCoordinator, "sharedCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __44__SUUIJSITunesStore_getProfilePermissions::__block_invoke;
  v19[3] = &unk_2511FAE60;
  v20 = v14;
  v21 = v9;
  v22 = v11;
  v23 = self;
  v16 = v11;
  v17 = v9;
  v18 = v14;
  objc_msgSend(v15, "getAuthorsWithOptions:authorsBlock:", v12, v19);

}

void __44__SUUIJSITunesStore_getProfilePermissions::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SUUIJSMediaSocialAuthor *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BEB24A8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)(objc_msgSend(v9, "integerValue") - 500) <= 0x62)
    {
      +[SUUIMediaSocialAdminPermissionsCoordinator sharedCoordinator](SUUIMediaSocialAdminPermissionsCoordinator, "sharedCoordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastKnownAuthors");
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v11;
    }

  }
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v18 = -[SUUIJSMediaSocialAuthor initWithSUUIMediaSocialAuthor:]([SUUIJSMediaSocialAuthor alloc], "initWithSUUIMediaSocialAuthor:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v17));
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v15);
  }

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __44__SUUIJSITunesStore_getProfilePermissions::__block_invoke_2;
  v23[3] = &unk_2511F9768;
  v19 = *(void **)(a1 + 32);
  v24 = *(id *)(a1 + 40);
  v25 = v12;
  v20 = *(id *)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 56);
  v26 = v20;
  v27 = v21;
  v22 = v12;
  objc_msgSend(v19, "evaluate:completionBlock:", v23, 0);

}

uint64_t __44__SUUIJSITunesStore_getProfilePermissions::__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  return objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)isInstalledApp:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SUUIJSITunesStore *v21;
  char v22;

  v6 = a4;
  v7 = a3;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  v12 = objc_msgSend(v7, "unsignedIntegerValue");

  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stateForItemWithIdentifier:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = ((unint64_t)objc_msgSend(v14, "state") >> 2) & 1;
  else
    LOBYTE(v15) = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __37__SUUIJSITunesStore_isInstalledApp::__block_invoke;
  v18[3] = &unk_2511F7478;
  v22 = v15;
  v19 = v9;
  v20 = v11;
  v21 = self;
  v16 = v11;
  v17 = v9;
  objc_msgSend(v8, "evaluate:completionBlock:", v18, 0);

}

void __37__SUUIJSITunesStore_isInstalledApp::__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "callWithArguments:", v4);

  objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)isRemovedSystemApp:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  v12 = objc_alloc_init(MEMORY[0x24BEB1FD0]);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __41__SUUIJSITunesStore_isRemovedSystemApp::__block_invoke;
  v17[3] = &unk_2511FAEB0;
  v17[4] = self;
  v18 = v6;
  v19 = v8;
  v20 = v9;
  v21 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v8;
  v16 = v6;
  objc_msgSend(v12, "isRemovedSystemApplicationWithBundleIdentifier:completionBlock:", v16, v17);

}

void __41__SUUIJSITunesStore_isRemovedSystemApp::__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  char v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v8 &= 2u;
    if (v8)
    {
      v10 = (void *)objc_opt_class();
      v11 = *(_QWORD *)(a1 + 40);
      v23 = 138412802;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v5;
      v12 = v10;
      LODWORD(v17) = 32;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v23, v17);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __41__SUUIJSITunesStore_isRemovedSystemApp::__block_invoke_167;
  v18[3] = &unk_2511F7478;
  v14 = *(void **)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v22 = a2;
  v15 = *(id *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 32);
  v20 = v15;
  v21 = v16;
  objc_msgSend(v14, "evaluate:completionBlock:", v18, 0);

}

void __41__SUUIJSITunesStore_isRemovedSystemApp::__block_invoke_167(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "callWithArguments:", v4);

  objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)launchICloudFamilySettings
{
  id v2;

  -[IKJSObject appContext](self, "appContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "evaluateDelegateBlockSync:", &__block_literal_global_39);

}

void __47__SUUIJSITunesStore_launchICloudFamilySettings__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "presentationViewControllerForAppContext:", v7);
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = SUUIFamilyCircleFramework();
      v6 = objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("FAFamilySettings"), v5));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "setPresentingViewController:", v4);
        objc_msgSend(v6, "launchiCloudFamilySettings");
      }

    }
  }

}

- (void)loadGratisContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  SUUIJSITunesStore *v19;

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "virtualMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addManagedReference:withOwner:", v6, self);
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadGratisEligibilityWithBundleIdentifiers:clientContext:", 0, self->_clientContext);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __39__SUUIJSITunesStore_loadGratisContent___block_invoke;
  v14[3] = &unk_2511FAF18;
  v15 = v9;
  v16 = v5;
  v17 = v6;
  v18 = v8;
  v19 = self;
  v10 = v8;
  v11 = v6;
  v12 = v5;
  v13 = v9;
  objc_msgSend(v13, "finishLoadingWithCompletionBlock:", v14);

}

void __39__SUUIJSITunesStore_loadGratisContent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "gratisEligibleItemIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SUUIJSITunesStore_loadGratisContent___block_invoke_2;
  v7[3] = &unk_2511F9768;
  v3 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = v2;
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v10 = v4;
  v11 = v5;
  v6 = v2;
  objc_msgSend(v3, "evaluate:completionBlock:", v7, 0);

}

void __39__SUUIJSITunesStore_loadGratisContent___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)log:(id)a3
{
  NSLog(CFSTR("[JS]: %@"), a2, a3);
}

- (void)headsUp:(id)a3 :(id)a4
{
  NSLog(CFSTR("[HeadsUp]: %@"), a2, a3, a4, a3);
}

- (SUUIJSAppleAccount)primaryAppleAccount
{
  uint64_t v2;
  id v3;
  SUUIJSAppleAccount *v4;
  void *v5;
  SUUIJSAppleAccount *v6;

  v2 = SUUIAccountsFramework();
  v3 = objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("ACAccountStore"), v2));
  v4 = [SUUIJSAppleAccount alloc];
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUUIJSAppleAccount initWithACAccount:](v4, "initWithACAccount:", v5);

  return v6;
}

- (SUUIJSRestrictions)restrictions
{
  SUUIJSRestrictions *v3;
  void *v4;
  SUUIJSRestrictions *v5;

  v3 = [SUUIJSRestrictions alloc];
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUUIJSRestrictions initWithAppContext:clientContext:](v3, "initWithAppContext:clientContext:", v4, self->_clientContext);

  return v5;
}

- (void)resetStateForActiveDocument
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "app");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SUUIStoreDialogControllerPurchaseRequestDidSucceedNotification"), v5);

}

- (BOOL)resourceExists:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v3);
  else
    v4 = 0;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("resource")))
  {
    objc_msgSend(v4, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = SUUIImageExistsWithResourceName(v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)restoreRemovedSystemApp:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  v12 = objc_alloc_init(MEMORY[0x24BEB1FD0]);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __46__SUUIJSITunesStore_restoreRemovedSystemApp::__block_invoke;
  v17[3] = &unk_2511FAEB0;
  v17[4] = self;
  v18 = v6;
  v19 = v8;
  v20 = v9;
  v21 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v8;
  v16 = v6;
  objc_msgSend(v12, "restoreRemovedSystemApplicationWithBundleIdentifier:completionBlock:", v16, v17);

}

void __46__SUUIJSITunesStore_restoreRemovedSystemApp::__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  char v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v8 &= 2u;
    if (v8)
    {
      v10 = (void *)objc_opt_class();
      v11 = *(_QWORD *)(a1 + 40);
      v23 = 138412802;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v5;
      v12 = v10;
      LODWORD(v17) = 32;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v23, v17);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __46__SUUIJSITunesStore_restoreRemovedSystemApp::__block_invoke_183;
  v18[3] = &unk_2511F7478;
  v14 = *(void **)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v22 = a2;
  v15 = *(id *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 32);
  v20 = v15;
  v21 = v16;
  objc_msgSend(v14, "evaluate:completionBlock:", v18, 0);

}

void __46__SUUIJSITunesStore_restoreRemovedSystemApp::__block_invoke_183(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "callWithArguments:", v4);

  objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)setApplicationIconBadgeNumber:(int64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUUIJSITunesStore_setApplicationIconBadgeNumber___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __51__SUUIJSITunesStore_setApplicationIconBadgeNumber___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setApplicationIconBadgeNumber:", *(_QWORD *)(a1 + 32));

}

- (void)setPreviewOverlay:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && objc_msgSend(MEMORY[0x24BE51938], "instancesRespondToSelector:", sel_initWithAppContext_document_owner_))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51938]), "initWithAppContext:document:owner:", v8, v6, self);
  }
  else
  {
    v9 = 0;
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __40__SUUIJSITunesStore_setPreviewOverlay::__block_invoke;
  v12[3] = &unk_2511FAC60;
  v13 = v9;
  v14 = v7;
  v10 = v7;
  v11 = v9;
  objc_msgSend(v8, "evaluateDelegateBlockSync:", v12);

}

void __40__SUUIJSITunesStore_setPreviewOverlay::__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "appContext:setPreviewOverlayDocument:withOptions:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)updateToggleStateForItem:(id)a3 toggled:(BOOL)a4 :(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  SUUIJSITunesStore *v25;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  +[SUUIToggleStateCenter defaultCenter](SUUIToggleStateCenter, "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemForIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setToggled:", v5);
  objc_msgSend(v10, "updateItem:", v11);
  -[IKJSObject appContext](self, "appContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "virtualMachine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addManagedReference:withOwner:", v13, self);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setValue:forKey:", v9, CFSTR("itemID"));

  if (v5)
    v17 = MEMORY[0x24BDBD1C8];
  else
    v17 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v16, "setValue:forKey:", v17, CFSTR("toggled"));
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __55__SUUIJSITunesStore_updateToggleStateForItem_toggled::__block_invoke;
  v21[3] = &unk_2511F9768;
  v22 = v13;
  v23 = v16;
  v24 = v15;
  v25 = self;
  v18 = v15;
  v19 = v16;
  v20 = v13;
  objc_msgSend(v12, "evaluate:completionBlock:", v21, 0);

}

void __55__SUUIJSITunesStore_updateToggleStateForItem_toggled::__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)loadRentals:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id from;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[IKJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v4, v6);
  -[IKJSObject appContext](self, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v7);

  objc_initWeak(&from, self);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __33__SUUIJSITunesStore_loadRentals___block_invoke;
  v10[3] = &unk_2511FAF68;
  v10[4] = self;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  v9 = v6;
  v11 = v9;
  objc_msgSend(v8, "addOperationWithBlock:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __33__SUUIJSITunesStore_loadRentals___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v2 = SUUIMediaPlayerFramework();
  objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("MPMediaQuery"), v2), "movieRentalsQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)SUUIMediaPlayerFramework();
  v5 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalExpirationDate", v4);
  v6 = SUUIMediaPlayerFramework();
  v7 = SUUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), v6);
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithValue:forProperty:comparisonType:", v9, v5, 101);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addFilterPredicate:", v10);

  objc_msgSend(v3, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(a1[4], "_rentalInfoFromMediaItems:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __33__SUUIJSITunesStore_loadRentals___block_invoke_2;
  v15[3] = &unk_2511FAF40;
  objc_copyWeak(&v18, a1 + 7);
  v16 = a1[5];
  v14 = v12;
  v17 = v14;
  objc_msgSend(WeakRetained, "evaluate:completionBlock:", v15, 0);

  objc_destroyWeak(&v18);
}

void __33__SUUIJSITunesStore_loadRentals___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "jsValueForProperty:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "callWithArguments:", v4);

  objc_msgSend(WeakRetained, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 32));
}

- (void)loadRental:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SUUIJSITunesStore *v16;
  id v17;
  id v18;
  id v19;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[IKJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v7, v9);
  -[IKJSObject appContext](self, "appContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v10);

  objc_initWeak(&from, self);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __33__SUUIJSITunesStore_loadRental::__block_invoke;
  v14[3] = &unk_2511FAF90;
  v12 = v6;
  v15 = v12;
  v16 = self;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  v13 = v9;
  v17 = v13;
  objc_msgSend(v11, "addOperationWithBlock:", v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __33__SUUIJSITunesStore_loadRental::__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v2 = SUUIMediaPlayerFramework();
  objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("MPMediaQuery"), v2), "movieRentalsQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SUUIMediaPlayerFramework();
  v5 = SUUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), v4);
  v6 = (void *)SUUIMediaPlayerFramework();
  v7 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v6);
  objc_msgSend(v5, "predicateWithValue:forProperty:", *(_QWORD *)(a1 + 32), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addFilterPredicate:", v8);

  objc_msgSend(v3, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v9, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_rentalInfoFromMediaItems:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x24BDBD1A8];
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __33__SUUIJSITunesStore_loadRental::__block_invoke_2;
  v17[3] = &unk_2511FAF40;
  objc_copyWeak(&v20, (id *)(a1 + 64));
  v18 = *(id *)(a1 + 48);
  v16 = v14;
  v19 = v16;
  objc_msgSend(WeakRetained, "evaluate:completionBlock:", v17, 0);

  objc_destroyWeak(&v20);
}

void __33__SUUIJSITunesStore_loadRental::__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "jsValueForProperty:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "callWithArguments:", v4);

  objc_msgSend(WeakRetained, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 32));
}

- (id)_rentalInfoFromMediaItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  id obj;
  id v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v86;
    v68 = *(_QWORD *)v86;
    do
    {
      v7 = 0;
      v69 = v5;
      do
      {
        if (*(_QWORD *)v86 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v7);
        if (objc_msgSend(v8, "isRental"))
        {
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 4);
          v10 = (void *)SUUIMediaPlayerFramework();
          v11 = *(id *)SUUIWeakLinkedSymbolForString("AVFileProcessorAttribute_RentalStartDate", v10);
          v12 = (void *)SUUIMediaPlayerFramework();
          v13 = *(id *)SUUIWeakLinkedSymbolForString("AVFileProcessorAttribute_RentalPeriod", v12);
          v14 = (void *)SUUIMediaPlayerFramework();
          v84 = *(id *)SUUIWeakLinkedSymbolForString("AVFileProcessorAttribute_RentalPlaybackStartDate", v14);
          v15 = (void *)SUUIMediaPlayerFramework();
          v16 = *(id *)SUUIWeakLinkedSymbolForString("AVFileProcessorAttribute_RentalPlaybackPeriod", v15);
          v17 = (void *)SUUIMediaPlayerFramework();
          v79 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v17);
          objc_msgSend(v8, "valueForProperty:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringValue");
          v19 = objc_claimAutoreleasedReturnValue();

          if (v19)
            objc_msgSend(v9, "setObject:forKey:", v19, CFSTR("item-id"));
          v20 = (void *)SUUIMediaPlayerFramework();
          v77 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyFilePath", v20);
          objc_msgSend(v8, "valueForProperty:");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = SUUIMediaPlayerFramework();
          objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("MPStoreDownloadManager"), v22), "sharedManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "downloadForMediaItem:", v8);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v75 = v24;
          v76 = v21;
          v82 = v16;
          v83 = v9;
          v81 = v11;
          v78 = (void *)v19;
          if (objc_msgSend(v21, "length"))
          {
            v25 = SUUICelestialFramework();
            objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("AVFileProcessor"), v25), "fileProcessor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "rentalInfo:", v21);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else if (v24)
          {
            objc_msgSend(v24, "rentalInformation");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)SUUIMediaPlayerFramework();
            v30 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalPlaybackStartTime", v29);
            v31 = (void *)SUUIMediaPlayerFramework();
            v73 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalPlaybackDuration", v31);
            v32 = (void *)SUUIMediaPlayerFramework();
            v71 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalStartTime", v32);
            v33 = (void *)SUUIMediaPlayerFramework();
            v34 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalDuration", v33);
            v66 = v30;
            objc_msgSend(v8, "valueForProperty:", v30);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v35, "isEqualToNumber:", &unk_2512EEC40) & 1) == 0)
            {
              v36 = (void *)MEMORY[0x24BDBCE60];
              objc_msgSend(v35, "doubleValue");
              objc_msgSend(v36, "dateWithTimeIntervalSinceReferenceDate:");
              v37 = objc_claimAutoreleasedReturnValue();
              if (v37)
              {
                v38 = (void *)v37;
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v37, v84);

              }
            }
            v39 = v13;
            objc_msgSend(v8, "valueForProperty:", v73);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (v40)
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v40, v82);
            objc_msgSend(v8, "valueForProperty:", v71);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v41, "isEqualToNumber:", &unk_2512EEC40) & 1) == 0)
            {
              v42 = (void *)MEMORY[0x24BDBCE60];
              objc_msgSend(v41, "doubleValue");
              objc_msgSend(v42, "dateWithTimeIntervalSinceReferenceDate:");
              v43 = objc_claimAutoreleasedReturnValue();
              if (v43)
              {
                v44 = (void *)v43;
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v43, v81);

              }
            }
            objc_msgSend(v8, "valueForProperty:", v34);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (v45)
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v45, v39);
            v46 = v28;
            v27 = (void *)objc_msgSend(v28, "copy");

            v11 = v81;
            v16 = v82;
            v13 = v39;
          }
          objc_msgSend(v27, "objectForKey:", v11);
          v47 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", v13);
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = (void *)v48;
          v50 = 0;
          v80 = v13;
          if (v47 && v48)
          {
            v51 = objc_alloc(MEMORY[0x24BDBCE60]);
            objc_msgSend(v49, "doubleValue");
            v50 = objc_msgSend(v51, "initWithTimeInterval:sinceDate:", v47);
          }
          objc_msgSend(v27, "objectForKey:", v84);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", v16);
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = (void *)v53;
          v55 = 0;
          if (v52 && v53)
          {
            v56 = objc_alloc(MEMORY[0x24BDBCE60]);
            objc_msgSend(v54, "doubleValue");
            v55 = objc_msgSend(v56, "initWithTimeInterval:sinceDate:", v52);
          }
          objc_msgSend(v27, "objectForKey:", CFSTR("expiration-date"));
          v57 = objc_claimAutoreleasedReturnValue();
          v58 = (void *)v57;
          v72 = v54;
          v74 = (void *)v47;
          if (v50 && v55)
          {
            objc_msgSend((id)v50, "earlierDate:", v55);
            v59 = (id)objc_claimAutoreleasedReturnValue();
            if (!v59)
            {
              v60 = v49;
LABEL_41:
              objc_msgSend(v8, "title");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              if (v62)
                objc_msgSend(v83, "setObject:forKey:", v62, CFSTR("title"));
              if (objc_msgSend(v83, "count"))
                objc_msgSend(v67, "addObject:", v83);

              v6 = v68;
              v5 = v69;
              goto LABEL_46;
            }
          }
          else
          {
            if (v55)
              v61 = (void *)v55;
            else
              v61 = (void *)v50;
            if (!(v55 | v50))
            {
              v61 = (void *)v57;
              if (!v57)
              {
                v60 = v49;
                v59 = 0;
                goto LABEL_41;
              }
            }
            v59 = v61;
          }
          v60 = v49;
          objc_msgSend(v83, "setObject:forKey:", v59, CFSTR("expiration-date"));
          goto LABEL_41;
        }
LABEL_46:
        ++v7;
      }
      while (v5 != v7);
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
      v5 = v63;
    }
    while (v63);
  }

  v64 = (void *)objc_msgSend(v67, "copy");
  return v64;
}

- (void)fetchTemplates:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  SUUITemplateLoader *v24;
  SUUITemplateLoader *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  id v32;
  id v33;
  id v34;
  SUUIJSITunesStore *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v37;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v37 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v13));
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            v26 = (id)objc_msgSend(v7, "callWithArguments:", &unk_2512EEA30);

            goto LABEL_12;
          }
          v15 = (void *)v14;
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v11)
          continue;
        break;
      }
    }

    -[IKJSObject appContext](self, "appContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "virtualMachine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addManagedReference:withOwner:", v17, self);
    v28 = MEMORY[0x24BDAC760];
    v29 = 3221225472;
    v30 = __37__SUUIJSITunesStore_fetchTemplates::__block_invoke;
    v31 = &unk_2511FAFE0;
    v32 = v16;
    v33 = v17;
    v34 = v19;
    v35 = self;
    v20 = v19;
    v21 = v17;
    v22 = v16;
    v23 = _Block_copy(&v28);
    v24 = [SUUITemplateLoader alloc];
    v25 = -[SUUITemplateLoader initWithURLs:completionBlock:](v24, "initWithURLs:completionBlock:", v8, v23, v28, v29, v30, v31);
    -[SUUITemplateLoader load](v25, "load");

LABEL_12:
  }
  else
  {
    v27 = (id)objc_msgSend(v7, "callWithArguments:", &unk_2512EEA18);
  }

}

void __37__SUUIJSITunesStore_fetchTemplates::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __37__SUUIJSITunesStore_fetchTemplates::__block_invoke_2;
  v12[3] = &unk_2511FAFB8;
  v13 = v6;
  v7 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = v5;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v16 = v8;
  v17 = v9;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v7, "evaluate:completionBlock:", v12, 0);

}

uint64_t __37__SUUIJSITunesStore_fetchTemplates::__block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32) == 0;
  objc_msgSend(*(id *)(a1 + 40), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v9[0] = v4;
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "callWithArguments:", v6);

  return objc_msgSend(*(id *)(a1 + 56), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
}

- (void)fetchMSOProviderStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  SUUIJSITunesStore *v18;

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "virtualMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addManagedReference:withOwner:", v6, self);
  v9 = SUUIVideoSubscriberAccountFramework();
  objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("VSAccountChannelsCenter"), v9), "sharedCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __44__SUUIJSITunesStore_fetchMSOProviderStatus___block_invoke;
  v14[3] = &unk_2511FB008;
  v15 = v5;
  v16 = v6;
  v17 = v8;
  v18 = self;
  v11 = v8;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v10, "fetchAccountChannelsWithCompletionHandler:", v14);

}

void __44__SUUIJSITunesStore_fetchMSOProviderStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "adamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("providerId"));
  objc_msgSend(v3, "channelIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("providedAppTitles"));
  objc_msgSend(v3, "providerInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("providerInfo"));
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__SUUIJSITunesStore_fetchMSOProviderStatus___block_invoke_2;
  v13[3] = &unk_2511F9768;
  v9 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = v4;
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v16 = v10;
  v17 = v11;
  v12 = v4;
  objc_msgSend(v9, "evaluate:completionBlock:", v13, 0);

}

void __44__SUUIJSITunesStore_fetchMSOProviderStatus___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)itemStateCenterMediaLibrariesDidChange:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[IKJSObject appContext](self, "appContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__SUUIJSITunesStore_itemStateCenterMediaLibrariesDidChange___block_invoke;
  v5[3] = &unk_2511F61F8;
  v5[4] = self;
  objc_msgSend(v4, "evaluate:completionBlock:", v5, 0);

}

id __60__SUUIJSITunesStore_itemStateCenterMediaLibrariesDidChange___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "invokeMethod:withArguments:", CFSTR("onLibraryChange"), 0);
}

- (void)_finishPurchaseForOptions:(id)a3 purchaseResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SUUIJSITunesStore *v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "purchase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = MEMORY[0x24BDAC760];
  if (v9)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __64__SUUIJSITunesStore__finishPurchaseForOptions_purchaseResponse___block_invoke;
    v18[3] = &unk_2511F9740;
    v19 = v9;
    objc_msgSend(v8, "evaluateDelegateBlockSync:", v18);

  }
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __64__SUUIJSITunesStore__finishPurchaseForOptions_purchaseResponse___block_invoke_2;
  v14[3] = &unk_2511F74C8;
  v15 = v6;
  v16 = v7;
  v17 = self;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v8, "evaluate:completionBlock:", v14, 0);

}

void __64__SUUIJSITunesStore__finishPurchaseForOptions_purchaseResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "appContext:didCompletePurchase:", v4, *(_QWORD *)(a1 + 32));

}

void __64__SUUIJSITunesStore__finishPurchaseForOptions_purchaseResponse___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("options"));
  objc_msgSend(*(id *)(a1 + 40), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5 == 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("result"));

  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB24A0]))
  {
    v8 = objc_msgSend(v5, "code") == 134;

  }
  else
  {

    v8 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("error"));

  objc_msgSend(*(id *)(a1 + 40), "responseMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = (id)objc_msgSend(v10, "mutableCopy");
  else
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = v11;
  v25[0] = CFSTR("requestStartTime");
  v13 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "requestStartTime");
  objc_msgSend(v13, "_millisecondsFromTimeInterval:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v25[1] = CFSTR("responseStartTime");
  v15 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "responseStartTime");
  objc_msgSend(v15, "_millisecondsFromTimeInterval:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v16;
  v25[2] = CFSTR("responseEndTime");
  v17 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "responseEndTime");
  objc_msgSend(v17, "_millisecondsFromTimeInterval:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKey:", v19, CFSTR("performanceMetrics"));
  v20 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("metrics"));

  v21 = *(void **)(a1 + 48);
  v24 = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v21, "invokeMethod:withArguments:", CFSTR("onBuy"), v22);

}

- (void)_finishSoftwarePurchaseForOptions:(id)a3 purchaseResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SUUIJSITunesStore *v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "purchase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = MEMORY[0x24BDAC760];
  if (v9)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __72__SUUIJSITunesStore__finishSoftwarePurchaseForOptions_purchaseResponse___block_invoke;
    v18[3] = &unk_2511F9740;
    v19 = v9;
    objc_msgSend(v8, "evaluateDelegateBlockSync:", v18);

  }
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __72__SUUIJSITunesStore__finishSoftwarePurchaseForOptions_purchaseResponse___block_invoke_2;
  v14[3] = &unk_2511F74C8;
  v15 = v6;
  v16 = v7;
  v17 = self;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v8, "evaluate:completionBlock:", v14, 0);

}

void __72__SUUIJSITunesStore__finishSoftwarePurchaseForOptions_purchaseResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "appContext:didCompleteSoftwarePurchase:", v4, *(_QWORD *)(a1 + 32));

}

void __72__SUUIJSITunesStore__finishSoftwarePurchaseForOptions_purchaseResponse___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("options"));
  objc_msgSend(*(id *)(a1 + 40), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5 == 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("result"));

  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB24A0]))
  {
    v8 = objc_msgSend(v5, "code") == 134;

  }
  else
  {

    v8 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("error"));

  objc_msgSend(*(id *)(a1 + 40), "responseMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = (id)objc_msgSend(v10, "mutableCopy");
  else
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = v11;
  v25[0] = CFSTR("requestStartTime");
  v13 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "requestStartTime");
  objc_msgSend(v13, "_millisecondsFromTimeInterval:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v25[1] = CFSTR("responseStartTime");
  v15 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "responseStartTime");
  objc_msgSend(v15, "_millisecondsFromTimeInterval:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v16;
  v25[2] = CFSTR("responseEndTime");
  v17 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "responseEndTime");
  objc_msgSend(v17, "_millisecondsFromTimeInterval:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKey:", v19, CFSTR("performanceMetrics"));
  v20 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("metrics"));

  v21 = *(void **)(a1 + 48);
  v24 = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v21, "invokeMethod:withArguments:", CFSTR("onBuy"), v22);

}

- (void)_displayWifiConnectionRequiredAlert
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_248);
}

void __56__SUUIJSITunesStore__displayWifiConnectionRequiredAlert__block_invoke()
{
  int v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = objc_alloc_init(MEMORY[0x24BEBD3B8]);
  v0 = MGGetBoolAnswer();
  SUUIBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v0)
  {
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("PENDING_RENTAL_NETWORK_ERROR_MESSAGE_WLAN_ONLY"), &stru_2511FF0C8, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMessage:", v3);

    SUUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("PENDING_RENTAL_NETWORK_ERROR_TITLE_WLAN_ONLY");
  }
  else
  {
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("PENDING_RENTAL_NETWORK_ERROR_MESSAGE_WIFI_ONLY"), &stru_2511FF0C8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMessage:", v7);

    SUUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("PENDING_RENTAL_NETWORK_ERROR_TITLE_WIFI_ONLY");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_2511FF0C8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v8);

  SUUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_2511FF0C8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addButtonWithTitle:", v10);

  objc_msgSend(v11, "show");
}

- (id)_millisecondsFromTimeInterval:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", (uint64_t)(a3 * 1000.0));
}

- (void)_purchaseRequestDidSucceedNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", 0x2512025C8);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[SUUIJSITunesStore _finishPurchaseForOptions:purchaseResponse:](self, "_finishPurchaseForOptions:purchaseResponse:", 0, v6);
    v5 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
