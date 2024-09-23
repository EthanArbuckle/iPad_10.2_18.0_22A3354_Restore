@implementation SUUIURLResolver

- (SUUIURLResolver)initWithClientContext:(id)a3
{
  id v5;
  SUUIURLResolver *v6;
  SUUIURLResolver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIURLResolver;
  v6 = -[SUUIURLResolver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clientContext, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIPassbookLoader setDelegate:](self->_passbookLoader, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIURLResolver;
  -[SUUIURLResolver dealloc](&v3, sel_dealloc);
}

+ (id)tabIdentifierForURL:(id)a3
{
  void *v3;
  const __CFString *v4;
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "actionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("audiobooks")) & 1) != 0)
  {
    v4 = CFSTR("audiobooks");
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("books")) & 1) != 0)
    goto LABEL_4;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("movies")) & 1) != 0)
  {
    v4 = CFSTR("movies");
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("music")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("music-videos")) & 1) != 0)
  {
    v4 = CFSTR("music");
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("podcasts")) & 1) != 0)
    goto LABEL_4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ringtones")))
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 == 1)
      v4 = 0;
    else
      v4 = CFSTR("tones");
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("software")) & 1) != 0)
  {
LABEL_4:
    v4 = CFSTR("featured");
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tv-shows")) & 1) != 0)
  {
    v4 = CFSTR("tv");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("updates")) & 1) != 0)
  {
    v4 = CFSTR("updates");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("purchased")) & 1) != 0)
  {
    v4 = CFSTR("purchased");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("manage")))
  {
    v4 = CFSTR("managed");
  }
  else
  {
    v4 = 0;
  }
LABEL_10:

  return (id)v4;
}

- (void)resolveURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "actionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "tabIdentifierForURL:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("accessory-lookup")))
    goto LABEL_2;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("account")))
  {
    -[SUUIURLResolver _showAccountViewControllerWithURL:](self, "_showAccountViewControllerWithURL:", v10);
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("addpassbookpass")))
  {
    -[SUUIURLResolver _addPassbookPassWithURL:](self, "_addPassbookPassWithURL:", v10);
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("donate")))
  {
    -[SUUIURLResolver _showDonationViewControllerWithURL:](self, "_showDonationViewControllerWithURL:", v10);
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("gift")))
  {
    -[SUUIURLResolver _showGiftViewControllerWithURL:](self, "_showGiftViewControllerWithURL:", v10);
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("library-link")))
    goto LABEL_2;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2A50]))
  {
    -[SUUIURLResolver _handleSafariScriptDataUpdate:](self, "_handleSafariScriptDataUpdate:", v10);
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("lookup")))
  {
    -[SUUIURLResolver _performLookupWithURL:](self, "_performLookupWithURL:", v10);
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("redeem")))
  {
    -[SUUIURLResolver _showRedeemViewControllerWithURL:](self, "_showRedeemViewControllerWithURL:", v10);
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("search")))
  {
    -[SUUIURLResolver _showSearchWithURL:](self, "_showSearchWithURL:", v10);
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("bagurl"))
    || objc_msgSend(v4, "isEqualToString:", CFSTR("newsstand"))
    || objc_msgSend(v4, "isEqualToString:", CFSTR("passbook")))
  {
LABEL_2:
    -[SUUIURLResolver _showBagURLWithURL:](self, "_showBagURLWithURL:", v10);
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ringtones")))
  {
    if (SUUIUserInterfaceIdiom(self->_clientContext) != 1)
    {
      if (!objc_msgSend(v5, "length"))
        goto LABEL_11;
      goto LABEL_29;
    }
    goto LABEL_2;
  }
  if (objc_msgSend(v5, "length"))
  {
LABEL_29:
    -[SUUIURLResolver _selectTabWithIdentifier:](self, "_selectTabWithIdentifier:", v5);
    goto LABEL_11;
  }
  objc_msgSend(v10, "underlyingURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (void *)objc_msgSend(v10, "newURLRequest");
    -[SUUIURLResolver _resolveURLRequest:withOriginURL:](self, "_resolveURLRequest:withOriginURL:", v9, v10);

  }
  else
  {
    -[SUUIURLResolver _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 0);
  }

LABEL_11:
}

- (void)amsResolveURL:(id)a3 forURLType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v6 = a3;
  objc_msgSend(v6, "underlyingURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v8 = (void *)getAMSURLParserClass_softClass_0;
  v31 = getAMSURLParserClass_softClass_0;
  if (!getAMSURLParserClass_softClass_0)
  {
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __getAMSURLParserClass_block_invoke_0;
    v26 = &unk_2511FA508;
    v27 = &v28;
    __getAMSURLParserClass_block_invoke_0((uint64_t)&v23);
    v8 = (void *)v29[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v28, 8);
  objc_msgSend(v9, "createBagForSubProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ams_activeiTunesAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v17 = (void *)getAMSUIWebViewControllerClass_softClass;
    v31 = getAMSUIWebViewControllerClass_softClass;
    if (!getAMSUIWebViewControllerClass_softClass)
    {
      v23 = MEMORY[0x24BDAC760];
      v24 = 3221225472;
      v25 = __getAMSUIWebViewControllerClass_block_invoke;
      v26 = &unk_2511FA508;
      v27 = &v28;
      __getAMSUIWebViewControllerClass_block_invoke((uint64_t)&v23);
      v17 = (void *)v29[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v28, 8);
    v19 = [v18 alloc];
    objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v19, "initWithBag:account:clientInfo:", v10, v13, v20);

    v21 = (id)objc_msgSend(v14, "loadURL:", v7);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v14);
    -[SUUIURLResolver _presentViewController:](self, "_presentViewController:", v22);
    -[SUUIURLResolver _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 1);

    goto LABEL_11;
  }
  if (a4 == 2)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v11 = (void *)getAMSUIDynamicViewControllerClass_softClass;
    v31 = getAMSUIDynamicViewControllerClass_softClass;
    if (!getAMSUIDynamicViewControllerClass_softClass)
    {
      v23 = MEMORY[0x24BDAC760];
      v24 = 3221225472;
      v25 = __getAMSUIDynamicViewControllerClass_block_invoke;
      v26 = &unk_2511FA508;
      v27 = &v28;
      __getAMSUIDynamicViewControllerClass_block_invoke((uint64_t)&v23);
      v11 = (void *)v29[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v28, 8);
    v13 = (void *)objc_msgSend([v12 alloc], "initWithBag:URL:", v10, v7);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v13);
    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationControllerDelegate);
    objc_msgSend(v14, "setDelegate:", WeakRetained);

    objc_msgSend(v14, "setModalPresentationStyle:", 2);
    -[SUUIURLResolver _presentViewController:](self, "_presentViewController:", v14);
    -[SUUIURLResolver _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 1);
LABEL_11:

  }
}

- (void)passbookLoaderDidFinish:(id)a3
{
  SUUIPassbookLoader *passbookLoader;

  -[SUUIPassbookLoader setDelegate:](self->_passbookLoader, "setDelegate:", 0);
  passbookLoader = self->_passbookLoader;
  self->_passbookLoader = 0;

  -[SUUIURLResolver _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 1);
}

- (id)presentationViewControllerForPassbookLoader:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationViewControllerForURLResolver:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_addPassbookPassWithURL:(id)a3
{
  id v4;
  SUUIPassbookLoader *passbookLoader;
  SUUIPassbookLoader *v6;
  SUUIPassbookLoader *v7;
  void *v8;
  id v9;

  v4 = a3;
  passbookLoader = self->_passbookLoader;
  v9 = v4;
  if (!passbookLoader)
  {
    v6 = -[SUUIPassbookLoader initWithClientContext:]([SUUIPassbookLoader alloc], "initWithClientContext:", self->_clientContext);
    v7 = self->_passbookLoader;
    self->_passbookLoader = v6;

    -[SUUIPassbookLoader setDelegate:](self->_passbookLoader, "setDelegate:", self);
    v4 = v9;
    passbookLoader = self->_passbookLoader;
  }
  objc_msgSend(v4, "underlyingURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIPassbookLoader loadPassWithURL:](passbookLoader, "loadPassWithURL:", v8);

}

- (void)_handleSafariScriptDataUpdate:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "underlyingURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BEB1FC8], "shouldHandleSafariScriptURL:"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x24BEB2A48], v4);

  }
}

- (id)_newHTMLViewControllerWithSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SUUIClientContext clientInterface](self->_clientContext, "clientInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newStorePageViewControllerWithSection:", v4);

  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8DB8]), "initWithSection:", v4);
  objc_msgSend(v7, "setCanMoveToOverlay:", 0);
  objc_msgSend(v7, "setClientInterface:", v5);
  objc_msgSend(v7, "setExternalRequest:", 1);

  return v7;
}

- (void)_performLookupWithURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "valueForQueryParameter:", CFSTR("ids"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longLongValue");

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BEB2058]);
    -[SUUIClientContext platformContext](self->_clientContext, "platformContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithPlatformContext:", v8);

    objc_msgSend(v9, "setKeyProfile:", *MEMORY[0x24BEB2780]);
    -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStoreFrontSuffix:", v10);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItemIdentifiers:", v12);

    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __41__SUUIURLResolver__performLookupWithURL___block_invoke;
    v14[3] = &unk_2511FD5B0;
    v13 = v11;
    v15 = v13;
    objc_copyWeak(&v17, &location);
    v16 = v4;
    objc_msgSend(v9, "setResponseBlock:", v14);
    -[SUUIURLResolver _showPlaceholderViewController](self, "_showPlaceholderViewController");
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v9);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  else
  {
    -[SUUIURLResolver _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 0);
  }

}

void __41__SUUIURLResolver__performLookupWithURL___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__SUUIURLResolver__performLookupWithURL___block_invoke_2;
  v5[3] = &unk_2511F50B0;
  v6 = v3;
  v7 = a1[4];
  v4 = v3;
  objc_copyWeak(&v9, a1 + 6);
  v8 = a1[5];
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v9);
}

void __41__SUUIURLResolver__performLookupWithURL___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "itemForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productPageURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 48), "newURLRequest");
    objc_msgSend(v3, "setURL:", v5);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_resolveURLRequest:withOriginURL:", v3, *(_QWORD *)(a1 + 48));

  }
  else
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v3, "_sendDidFinishWithResult:", 0);
  }

}

- (void)_presentViewController:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  dispatch_time_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationViewControllerForURLResolver:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = dispatch_time(0, 1000000000);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__SUUIURLResolver__presentViewController___block_invoke;
  v10[3] = &unk_2511F46D0;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_after(v7, MEMORY[0x24BDAC9B8], v10);

}

void __42__SUUIURLResolver__presentViewController___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      objc_msgSend(v2, "presentedViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "presentedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v6;
      v2 = v6;
    }
    while (v4);
  }
  else
  {
    v5 = v2;
  }
  v7 = v5;
  objc_msgSend(v5, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)_resolveURLRequest:(id)a3 withOriginURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SUUIURL *v9;
  void *v10;
  SUUIURL *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  -[SUUIURLResolver delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_3;
  v9 = [SUUIURL alloc];
  objc_msgSend(v6, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SUUIURL initWithURL:](v9, "initWithURL:", v10);

  objc_msgSend(v7, "referrerApplicationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIURL setReferrerApplicationName:](v11, "setReferrerApplicationName:", v12);

  objc_msgSend(v7, "referrerURLString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIURL setReferrerURLString:](v11, "setReferrerURLString:", v13);

  LODWORD(v13) = objc_msgSend(v8, "URLResolver:shouldPerformDefaultActionForURL:", self, v11);
  if ((_DWORD)v13)
  {
LABEL_3:
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURLRequest:", v6);
    +[SSVURLDataConsumer consumer](SUUIURLResolverDataConsumer, "consumer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDataConsumer:", v15);

    objc_msgSend(v7, "referrerApplicationName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setReferrerApplicationName:", v16);

    objc_msgSend(v7, "referrerURLString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setReferrerURLString:", v17);

    -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStoreFrontSuffix:", v18);

    objc_initWeak(&location, v14);
    objc_initWeak(&from, self);
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __52__SUUIURLResolver__resolveURLRequest_withOriginURL___block_invoke;
    v22 = &unk_2511FD600;
    objc_copyWeak(&v23, &from);
    objc_copyWeak(&v24, &location);
    objc_msgSend(v14, "setOutputBlock:", &v19);
    -[SUUIURLResolver _showPlaceholderViewController](self, "_showPlaceholderViewController", v19, v20, v21, v22);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v14);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

void __52__SUUIURLResolver__resolveURLRequest_withOriginURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SUUIURLResolver__resolveURLRequest_withOriginURL___block_invoke_2;
  block[3] = &unk_2511FD5D8;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);

}

void __52__SUUIURLResolver__resolveURLRequest_withOriginURL___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_showViewControllerWithResponse:fromOperation:", v3, v4);

  }
  else
  {
    objc_msgSend(WeakRetained, "_sendDidFinishWithResult:", 0);
  }

}

- (void)_selectTabWithIdentifier:(id)a3
{
  SUUIURLResolverDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "URLResolver:showURL:withTabIdentifier:", self, 0, v5);

  -[SUUIURLResolver _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 1);
}

- (void)_sendDidFinishWithResult:(BOOL)a3
{
  _BOOL8 v3;
  SUUIURLResolverDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "URLResolver:didFinishWithResult:", self, v3);

  }
}

- (void)_showAccountViewControllerWithURL:(id)a3
{
  SUUIClientContext *clientContext;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  clientContext = self->_clientContext;
  v5 = a3;
  -[SUUIClientContext clientInterface](clientContext, "clientInterface");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BEC8CC0]);
  objc_msgSend(v5, "underlyingURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithExternalAccountURL:", v7);
  objc_msgSend(v8, "setCanMoveToOverlay:", 0);
  objc_msgSend(v8, "setClientInterface:", v11);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationControllerDelegate);
  objc_msgSend(v9, "setDelegate:", WeakRetained);

  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  -[SUUIURLResolver _presentViewController:](self, "_presentViewController:", v9);
  -[SUUIURLResolver _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 1);

}

- (void)_showBagURLWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_msgSend(v4, "URLBagKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(&location, self);
    -[SUUIClientContext URLBag](self->_clientContext, "URLBag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__SUUIURLResolver__showBagURLWithURL___block_invoke;
    v7[3] = &unk_2511FD628;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    objc_msgSend(v6, "loadValueForKey:completionBlock:", v5, v7);

    -[SUUIURLResolver _showPlaceholderViewController](self, "_showPlaceholderViewController");
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SUUIURLResolver _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 0);
  }

}

void __38__SUUIURLResolver__showBagURLWithURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SUUIURLResolver__showBagURLWithURL___block_invoke_2;
  block[3] = &unk_2511F5100;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

void __38__SUUIURLResolver__showBagURLWithURL___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "newURLRequestWithBaseURL:");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_resolveURLRequest:withOriginURL:", v2, *(_QWORD *)(a1 + 40));

  }
  else
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v4, "_sendDidFinishWithResult:", 0);
  }

}

- (void)_showDonationViewControllerWithURL:(id)a3
{
  id v4;
  SUUIDonationViewController *v5;

  v4 = a3;
  v5 = -[SUUIDonationViewController initWithURL:]([SUUIDonationViewController alloc], "initWithURL:", v4);

  -[SUUIDonationViewController setClientContext:](v5, "setClientContext:", self->_clientContext);
  -[SUUIURLResolver _presentViewController:](self, "_presentViewController:", v5);
  -[SUUIURLResolver _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 1);

}

- (void)_showGiftViewControllerWithURL:(id)a3
{
  SUUIGiftViewController *v4;
  SUUIGift *v5;

  v5 = -[SUUIGift initWithGiftCategory:]([SUUIGift alloc], "initWithGiftCategory:", 0);
  v4 = -[SUUIGiftViewController initWithGift:]([SUUIGiftViewController alloc], "initWithGift:", v5);
  -[SUUIGiftViewController setClientContext:](v4, "setClientContext:", self->_clientContext);
  -[SUUIURLResolver _presentViewController:](self, "_presentViewController:", v4);
  -[SUUIURLResolver _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 1);

}

- (void)_showPlaceholderViewController
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "URLResolver:showTransientViewController:", self, 0);

}

- (void)_showRedeemViewControllerWithURL:(id)a3
{
  id v4;
  void *v5;
  SUUIRedeemViewController *v6;

  v4 = a3;
  v6 = -[SUUIRedeemViewController initWithRedeemCategory:]([SUUIRedeemViewController alloc], "initWithRedeemCategory:", 0);
  -[SUUIRedeemViewController setAttempsAutomaticRedeem:](v6, "setAttempsAutomaticRedeem:", 1);
  -[SUUIRedeemViewController setClientContext:](v6, "setClientContext:", self->_clientContext);
  objc_msgSend(v4, "redeemCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIRedeemViewController setInitialCode:](v6, "setInitialCode:", v5);
  -[SUUIURLResolver _presentViewController:](self, "_presentViewController:", v6);
  -[SUUIURLResolver _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 1);

}

- (void)_showSearchWithURL:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "underlyingURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)objc_msgSend(v8, "newURLRequest");
    -[SUUIURLResolver _resolveURLRequest:withOriginURL:](self, "_resolveURLRequest:withOriginURL:", v7, v8);

  }
  else
  {
    -[SUUIURLResolver _showBagURLWithURL:](self, "_showBagURLWithURL:", v8);
  }

}

- (void)_showViewControllerWithResponse:(id)a3 fromOperation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SUUILegacyNativeViewController *v10;
  void *v11;
  SUUILegacyNativeViewController *v12;
  id WeakRetained;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  objc_msgSend(v20, "URLResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MIMEType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "rangeOfString:options:", CFSTR("application/json"), 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = [SUUILegacyNativeViewController alloc];
    objc_msgSend(v20, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SUUILegacyNativeViewController initWithData:fromOperation:](v10, "initWithData:fromOperation:", v11, v6);

    -[SUUIViewController setClientContext:](v12, "setClientContext:", self->_clientContext);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "URLResolver:showTransientViewController:", self, v12);
LABEL_6:

    v9 = 1;
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "rangeOfString:options:", CFSTR("html"), 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = -[SUUIURLResolver _newHTMLViewControllerWithSection:](self, "_newHTMLViewControllerWithSection:", 0);
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "URLResolver:showTransientViewController:", self, v12);

    objc_msgSend(v20, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLResponse");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUILegacyNativeViewController reloadWithStorePage:ofType:forURL:](v12, "reloadWithStorePage:ofType:forURL:", v15, 1, v17);

    v18 = objc_alloc(MEMORY[0x24BEB2008]);
    objc_msgSend(v6, "URLRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = (id)objc_msgSend(v18, "initWithURLRequest:", v19);

    -[SUUILegacyNativeViewController setURLRequestProperties:](v12, "setURLRequestProperties:", WeakRetained);
    goto LABEL_6;
  }
  v9 = 0;
LABEL_7:
  -[SUUIURLResolver _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", v9);

}

- (SUUIURLResolverDelegate)delegate
{
  return (SUUIURLResolverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UINavigationControllerDelegate)navigationControllerDelegate
{
  return (UINavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_navigationControllerDelegate);
}

- (void)setNavigationControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationControllerDelegate, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passbookLoader, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_navigationControllerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
