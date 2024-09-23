@implementation SUUIBannerViewController

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SUUIBannerView closeButton](self->_bannerView, "closeButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SUUIBannerView itemOfferButton](self->_bannerView, "itemOfferButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SUUIItemStateCenter removeObserver:](self->_itemStateCenter, "removeObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)SUUIBannerViewController;
  -[SUUIBannerViewController dealloc](&v5, sel_dealloc);
}

- (void)loadWithProductParameters:(id)a3 mainDocumentURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id location;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BEB2058]);
  -[SUUIClientContext platformContext](self->_clientContext, "platformContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithPlatformContext:", v9);

  -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStoreFrontSuffix:", v11);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = (_QWORD *)MEMORY[0x24BEB2778];
  if (v13 != 1)
    v14 = (_QWORD *)MEMORY[0x24BEB2770];
  objc_msgSend(v10, "setKeyProfile:", *v14);
  objc_msgSend(v10, "setMainDocumentURL:", v7);
  objc_msgSend(v10, "setShouldSuppressUserInfo:", 1);
  objc_msgSend(v10, "setAttribution:", 1);
  objc_msgSend(v6, "objectForKey:", CFSTR("id"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "stringValue");
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setItemIdentifiers:", v17);

    self->_itemIdentifier = objc_msgSend(v15, "longLongValue");
  }
  objc_initWeak(&location, self);
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __70__SUUIBannerViewController_loadWithProductParameters_mainDocumentURL___block_invoke;
  v22 = &unk_2511F5448;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v10, "setResponseBlock:", &v19);
  -[SUUIBannerViewController resourceOperationQueue](self, "resourceOperationQueue", v19, v20, v21, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addOperation:", v10);

  -[SUUIBannerViewController _warmItemStateCenter](self, "_warmItemStateCenter");
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __70__SUUIBannerViewController_loadWithProductParameters_mainDocumentURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__SUUIBannerViewController_loadWithProductParameters_mainDocumentURL___block_invoke_2;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __70__SUUIBannerViewController_loadWithProductParameters_mainDocumentURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishWithResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (NSOperationQueue)resourceOperationQueue
{
  NSOperationQueue *resourceOperationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  resourceOperationQueue = self->_resourceOperationQueue;
  if (!resourceOperationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v5 = self->_resourceOperationQueue;
    self->_resourceOperationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_resourceOperationQueue, "setMaxConcurrentOperationCount:", 1);
    resourceOperationQueue = self->_resourceOperationQueue;
  }
  return resourceOperationQueue;
}

- (void)setClientContext:(id)a3
{
  SUUIClientContext *v5;
  SUUIClientContext *v6;

  v5 = (SUUIClientContext *)a3;
  if (self->_clientContext != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    -[SUUIBannerView setClientContext:](self->_bannerView, "setClientContext:", self->_clientContext);
    v5 = v6;
  }

}

- (void)loadView
{
  SUUIBannerView *bannerView;
  SUUIBannerView *v4;
  SUUIBannerView *v5;
  void *v6;
  void *v7;

  bannerView = self->_bannerView;
  if (!bannerView)
  {
    v4 = objc_alloc_init(SUUIBannerView);
    v5 = self->_bannerView;
    self->_bannerView = v4;

    -[SUUIBannerView setClientContext:](self->_bannerView, "setClientContext:", self->_clientContext);
    -[SUUIBannerView sizeToFit](self->_bannerView, "sizeToFit");
    -[SUUIBannerView closeButton](self->_bannerView, "closeButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__closeButtonAction_, 64);

    -[SUUIBannerView itemOfferButton](self->_bannerView, "itemOfferButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__bannerViewAction_, 64);

    -[SUUIBannerViewController _reloadBannerView](self, "_reloadBannerView");
    bannerView = self->_bannerView;
  }
  -[SUUIBannerViewController setView:](self, "setView:", bannerView);
}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__SUUIBannerViewController_itemStateCenter_itemStatesChanged___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __62__SUUIBannerViewController_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v7, "itemIdentifier", (_QWORD)v11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "longLongValue");
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008);

          if (v9 == v10)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setItemState:", v7);
            goto LABEL_12;
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)_bannerViewAction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  -[SUUIBannerViewController _itemState](self, "_itemState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if ((v6 & 4) != 0)
  {
    -[SUUIBannerViewController _launchApp](self, "_launchApp");
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__41;
    v15 = __Block_byref_object_dispose__41;
    -[SSLookupItem productPageURL](self->_item, "productPageURL");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v12[5])
    {
      -[NSDictionary objectForKey:](self->_scriptContextDictionary, "objectForKey:", CFSTR("affiliateData"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "copyDictionaryForQueryString:unescapedValues:", v7, 1);
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __46__SUUIBannerViewController__bannerViewAction___block_invoke;
        v10[3] = &unk_2511F5088;
        v10[4] = &v11;
        objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

      }
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "openURL:options:completionHandler:", v12[5], MEMORY[0x24BDBD1B8], 0);

    }
    _Block_object_dispose(&v11, 8);

  }
}

void __46__SUUIBannerViewController__bannerViewAction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "URLByAppendingQueryParameter:value:", a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)_closeButtonAction:(id)a3
{
  SUUIBannerViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "bannerViewDidClose:", self);

  }
}

- (void)_finishWithResponse:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v12)
  {
    objc_msgSend(v12, "allItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong((id *)&self->_item, v8);
  -[SUUIBannerViewController _reloadBannerView](self, "_reloadBannerView");
  -[SUUIBannerViewController _loadImages](self, "_loadImages");
  if (!self->_item)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "bannerView:didFailWithError:", self, v6);

    }
  }

}

- (id)_iconImage
{
  UIImage *v3;
  void *v4;
  SUUIItem *v5;
  void *v6;
  SUUIItem *v7;

  v3 = self->_iconImage;
  if (!v3)
  {
    -[SUUIBannerViewController _itemArtworkContext](self, "_itemArtworkContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [SUUIItem alloc];
    -[SSLookupItem lookupDictionary](self->_item, "lookupDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SUUIItem initWithLookupDictionary:](v5, "initWithLookupDictionary:", v6);
    objc_msgSend(v4, "placeholderImageForItem:", v7);
    v3 = (UIImage *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_itemState
{
  void *v3;

  if (self->_itemIdentifier < 1)
  {
    v3 = 0;
  }
  else
  {
    -[SUUIBannerViewController _warmItemStateCenter](self, "_warmItemStateCenter");
    -[SUUIItemStateCenter stateForItemWithIdentifier:](self->_itemStateCenter, "stateForItemWithIdentifier:", self->_itemIdentifier);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_launchApp
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[NSDictionary objectForKey:](self->_scriptContextDictionary, "objectForKey:", CFSTR("app-argument"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_scriptContextDictionary, "objectForKey:", CFSTR("applicationLaunchArgument"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v3, "length"))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v3);
  else
    v4 = 0;
  if (self->_itemIdentifier)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", self->_itemIdentifier);
    v6 = objc_alloc_init(MEMORY[0x24BEB1FD0]);
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __38__SUUIBannerViewController__launchApp__block_invoke;
    v8[3] = &unk_2511F6D38;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v6, "getLibraryItemsForITunesStoreItemIdentifiers:completionBlock:", v7, v8);

  }
  else
  {
    -[SUUIBannerViewController _launchURL:withBundleIdentifier:](self, "_launchURL:withBundleIdentifier:", v4, 0);
  }

}

void __38__SUUIBannerViewController__launchApp__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BEB2A60]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_launchURL:withBundleIdentifier:", *(_QWORD *)(a1 + 40), v4);

}

- (void)_launchURL:(id)a3 withBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    if (v9)
    {
      v8 = v9;
      SUUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptions((uint64_t)v7, (uint64_t)v8, 0, 0, 0);
      CFRelease(v8);
    }
    else
    {
      SUUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptions((uint64_t)v7, 0, 0, 0, 0);
    }
    CFRelease(v7);
  }
  else
  {
    SUUIMetricsOpenURL(v9);
  }

}

- (void)_loadImages
{
  void *v2;
  uint64_t v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SUUIItem *v13;
  void *v14;
  SUUIItem *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  NSMutableArray *v25;
  NSMutableArray *screenshotImages;
  void *v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  double v32;
  _BOOL4 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  SUUIArtwork *v42;
  uint64_t v43;
  double v44;
  BOOL v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  id obj;
  id v60;
  uint64_t v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  SUUIBannerViewController *v66;
  id v67;
  id *v68;
  id location[4];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    v4 = 75.0;
  else
    v4 = 64.0;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  -[SSLookupItem artwork](self->_item, "artwork");
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v81;
LABEL_6:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v81 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v10);
      if (objc_msgSend(v11, "width") == (uint64_t)(v4 * v7))
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
        if (v8)
          goto LABEL_6;
        goto LABEL_12;
      }
    }
    v57 = v11;

    if (v57)
      goto LABEL_16;
  }
  else
  {
LABEL_12:

  }
  if (objc_msgSend(obj, "count")
    && (objc_msgSend(obj, "objectAtIndex:", 0), (v57 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_16:
    -[SUUIBannerViewController _itemArtworkContext](self, "_itemArtworkContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [SUUIItem alloc];
    -[SSLookupItem lookupDictionary](self->_item, "lookupDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SUUIItem initWithLookupDictionary:](v13, "initWithLookupDictionary:", v14);
    objc_msgSend(v12, "dataConsumerForItem:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x24BEB2040]);
    objc_msgSend(v57, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithURL:", v18);

    objc_msgSend(v19, "setDataConsumer:", v16);
    objc_msgSend(v19, "setITunesStoreRequest:", 0);
    -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setStoreFrontSuffix:", v20);

    objc_initWeak(location, self);
    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __39__SUUIBannerViewController__loadImages__block_invoke;
    v78[3] = &unk_2511F4A00;
    objc_copyWeak(&v79, location);
    objc_msgSend(v19, "setOutputBlock:", v78);
    -[SUUIBannerViewController resourceOperationQueue](self, "resourceOperationQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addOperation:", v19);

    objc_destroyWeak(&v79);
    objc_destroyWeak(location);

  }
  else
  {
    v57 = 0;
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceIdiom") == 1;

  if (v23)
  {
    v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    screenshotImages = self->_screenshotImages;
    self->_screenshotImages = v25;

    -[SSLookupItem lookupDictionary](self->_item, "lookupDictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKey:", *MEMORY[0x24BEB2870]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v56, "objectForKey:", *MEMORY[0x24BEB2858]);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v60 = v55;
        v28 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
        if (v28)
        {
          v61 = *(_QWORD *)v75;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v75 != v61)
                objc_enumerationMutation(v60);
              v30 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "scale");
                v33 = v32 == 2.0;

                if (v33)
                  v34 = 148.0;
                else
                  v34 = 34.0;
                if (v33)
                  v35 = 83.0;
                else
                  v35 = 60.0;
                if (v33)
                  v36 = 180.0;
                else
                  v36 = 82.0;
                v72 = 0u;
                v73 = 0u;
                if (v33)
                  v37 = 135.0;
                else
                  v37 = 62.0;
                v70 = 0uLL;
                v71 = 0uLL;
                v38 = v30;
                v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
                if (v39)
                {
                  v40 = *(_QWORD *)v71;
                  do
                  {
                    for (j = 0; j != v39; ++j)
                    {
                      if (*(_QWORD *)v71 != v40)
                        objc_enumerationMutation(v38);
                      v42 = -[SUUIArtwork initWithArtworkDictionary:]([SUUIArtwork alloc], "initWithArtworkDictionary:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j));
                      v43 = -[SUUIArtwork width](v42, "width");
                      v44 = (double)-[SUUIArtwork height](v42, "height");
                      v45 = v36 == (double)v43 && v37 == v44;
                      if (v45 || (v34 == (double)v43 ? (v46 = v35 == v44) : (v46 = 0), v46))
                        objc_msgSend(v24, "addObject:", v42, v55);

                    }
                    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
                  }
                  while (v39);
                }

              }
            }
            v28 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
          }
          while (v28);
        }

      }
    }
    -[SUUIBannerViewController resourceOperationQueue](self, "resourceOperationQueue", v55);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBannerViewController _screenshotConsumerWithSize:](self, "_screenshotConsumerWithSize:", 100.0, 75.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBannerViewController _screenshotConsumerWithSize:](self, "_screenshotConsumerWithSize:", 56.0, 75.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    location[0] = 0;
    location[1] = location;
    location[2] = (id)0x2020000000;
    location[3] = (id)0x4076200000000000;
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __39__SUUIBannerViewController__loadImages__block_invoke_3;
    v62[3] = &unk_2511F96A0;
    v51 = v49;
    v63 = v51;
    v52 = v48;
    v64 = v52;
    v68 = location;
    v53 = v50;
    v65 = v53;
    v66 = self;
    v54 = v47;
    v67 = v54;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", v62);
    -[SUUIBannerView setScreenshotImages:](self->_bannerView, "setScreenshotImages:", self->_screenshotImages);

    _Block_object_dispose(location, 8);
  }

}

void __39__SUUIBannerViewController__loadImages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SUUIBannerViewController__loadImages__block_invoke_2;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __39__SUUIBannerViewController__loadImages__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setIcon:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __39__SUUIBannerViewController__loadImages__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18[2];
  id location;

  v5 = a2;
  v6 = objc_msgSend(v5, "width");
  v7 = objc_msgSend(v5, "height");
  v8 = 40;
  if (v6 >= v7)
  {
    v9 = 100.0;
  }
  else
  {
    v8 = 32;
    v9 = 56.0;
  }
  v10 = *(id *)(a1 + v8);
  if (v9 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v11 = objc_alloc(MEMORY[0x24BEB2040]);
    objc_msgSend(v5, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithURL:", v12);

    objc_msgSend(v13, "setDataConsumer:", v10);
    objc_msgSend(v13, "setITunesStoreRequest:", 0);
    objc_msgSend(v13, "setStoreFrontSuffix:", *(_QWORD *)(a1 + 48));
    objc_initWeak(&location, *(id *)(a1 + 56));
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __39__SUUIBannerViewController__loadImages__block_invoke_4;
    v17[3] = &unk_2511F9678;
    objc_copyWeak(v18, &location);
    v18[1] = a3;
    objc_msgSend(v13, "setOutputBlock:", v17);
    objc_msgSend(*(id *)(a1 + 64), "addOperation:", v13);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                            + 24)
                                                                - (v9
                                                                 + 15.0);
    v14 = *(void **)(*(_QWORD *)(a1 + 56) + 1032);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.8, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageForColor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v16);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);

  }
}

void __39__SUUIBannerViewController__loadImages__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12[2];

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__SUUIBannerViewController__loadImages__block_invoke_5;
  v9[3] = &unk_2511F9650;
  objc_copyWeak(v12, (id *)(a1 + 32));
  v12[1] = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(v12);
}

void __39__SUUIBannerViewController__loadImages__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setScreenshot:forIndex:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (void)_reloadBannerView
{
  SSLookupItem *item;
  SUUIBannerView *bannerView;
  void *v5;
  SUUIBannerView *v6;
  void *v7;
  SUUIBannerView *v8;
  void *v9;
  SUUIBannerView *v10;
  float v11;
  double v12;
  uint64_t v13;
  SUUIBannerView *v14;
  void *v15;
  void *v16;
  SUUIBannerView *v17;
  void *v18;
  id v19;

  item = self->_item;
  if (item)
  {
    bannerView = self->_bannerView;
    -[SSLookupItem artistName](item, "artistName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBannerView setArtistName:](bannerView, "setArtistName:", v5);

    v6 = self->_bannerView;
    -[SUUIBannerViewController _iconImage](self, "_iconImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBannerView setIconImage:](v6, "setIconImage:", v7);

    -[SUUIBannerView setScreenshotImages:](self->_bannerView, "setScreenshotImages:", self->_screenshotImages);
    v8 = self->_bannerView;
    -[SSLookupItem displayName](self->_item, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBannerView setTitle:](v8, "setTitle:", v9);

    v10 = self->_bannerView;
    -[SSLookupItem userRating](self->_item, "userRating");
    *(float *)&v12 = v11 / 5.0;
    -[SUUIBannerView setUserRating:](v10, "setUserRating:", v12);
    -[SSLookupItem offers](self->_item, "offers");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v19, "count");
    v14 = self->_bannerView;
    if (v13)
    {
      objc_msgSend(v19, "objectAtIndex:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIBannerView setItemOffer:](v14, "setItemOffer:", v15);

    }
    else
    {
      -[SUUIBannerView setItemOffer:](self->_bannerView, "setItemOffer:", 0);
    }
    -[SSLookupItem ITunesStoreIdentifier](self->_item, "ITunesStoreIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self->_itemIdentifier = objc_msgSend(v16, "longLongValue");

    v17 = self->_bannerView;
    -[SUUIBannerViewController _itemState](self, "_itemState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBannerView setItemState:](v17, "setItemState:", v18);

  }
}

- (id)_screenshotConsumerWithSize:(CGSize)a3
{
  return +[SUUIScreenshotDataConsumer consumerWithScreenshotSize:](SUUIScreenshotDataConsumer, "consumerWithScreenshotSize:", a3.width, a3.height);
}

- (void)_setIcon:(id)a3 error:(id)a4
{
  id v6;
  SUUIBannerView *bannerView;
  id v8;

  objc_storeStrong((id *)&self->_iconImage, a3);
  v6 = a3;
  bannerView = self->_bannerView;
  -[SUUIBannerViewController _iconImage](self, "_iconImage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIBannerView setIconImage:](bannerView, "setIconImage:", v8);

}

- (void)_setScreenshot:(id)a3 forIndex:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  if (v9 && -[NSMutableArray count](self->_screenshotImages, "count") > (unint64_t)a4)
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_screenshotImages, "replaceObjectAtIndex:withObject:", a4, v9);
    -[SUUIBannerView setScreenshotImages:](self->_bannerView, "setScreenshotImages:", self->_screenshotImages);
  }

}

- (void)_warmItemStateCenter
{
  SUUIItemStateCenter *v3;
  SUUIItemStateCenter *itemStateCenter;

  if (!self->_itemStateCenter)
  {
    +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
    v3 = (SUUIItemStateCenter *)objc_claimAutoreleasedReturnValue();
    itemStateCenter = self->_itemStateCenter;
    self->_itemStateCenter = v3;

    -[SUUIItemStateCenter addObserver:](self->_itemStateCenter, "addObserver:", self);
  }
}

- (id)_itemArtworkContext
{
  SUUIItemArtworkContext *itemArtworkContext;
  SUUIItemArtworkContext *v4;
  SUUIItemArtworkContext *v5;
  SUUIItemArtworkContext *v6;
  void *v7;
  SUUIItemArtworkContext *v8;
  void *v9;
  SUUIItemArtworkContext *v10;
  void *v11;

  itemArtworkContext = self->_itemArtworkContext;
  if (!itemArtworkContext)
  {
    v4 = objc_alloc_init(SUUIItemArtworkContext);
    v5 = self->_itemArtworkContext;
    self->_itemArtworkContext = v4;

    v6 = self->_itemArtworkContext;
    +[SUUIStyledImageDataConsumer safariBannerIconConsumer](SUUIStyledImageDataConsumer, "safariBannerIconConsumer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setIconConsumer:](v6, "setIconConsumer:", v7);

    v8 = self->_itemArtworkContext;
    +[SUUIProductImageDataConsumer smartBannerConsumer](SUUIProductImageDataConsumer, "smartBannerConsumer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setGeneralConsumer:](v8, "setGeneralConsumer:", v9);

    v10 = self->_itemArtworkContext;
    +[SUUIStyledImageDataConsumer safariBannerProductImageConsumer](SUUIStyledImageDataConsumer, "safariBannerProductImageConsumer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setNewsstandConsumer:](v10, "setNewsstandConsumer:", v11);

    itemArtworkContext = self->_itemArtworkContext;
  }
  return itemArtworkContext;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SUUIBannerViewDelegate)delegate
{
  return (SUUIBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setResourceOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resourceOperationQueue, a3);
}

- (NSDictionary)scriptContextDictionary
{
  return self->_scriptContextDictionary;
}

- (void)setScriptContextDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemArtworkContext, 0);
  objc_storeStrong((id *)&self->_scriptContextDictionary, 0);
  objc_storeStrong((id *)&self->_screenshotImages, 0);
  objc_storeStrong((id *)&self->_resourceOperationQueue, 0);
  objc_storeStrong((id *)&self->_itemStateCenter, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
}

@end
