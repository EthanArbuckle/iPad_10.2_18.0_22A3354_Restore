@implementation DAEASOAuthWebViewController

- (DAEASOAuthWebViewController)initWithAccountDescription:(id)a3 presentationBlock:(id)a4
{
  id v6;
  id v7;
  DAEASOAuthWebViewController *v8;
  DAEASOAuthWebViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DAEASOAuthWebViewController;
  v8 = -[DAEASOAuthWebViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
    -[DAEASOAuthWebViewController _commonInitializationWithAccount:accountStore:username:accountDescription:presentationBlock:](v8, "_commonInitializationWithAccount:accountStore:username:accountDescription:presentationBlock:", 0, 0, 0, v6, v7);

  return v9;
}

- (DAEASOAuthWebViewController)initWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  DAEASOAuthWebViewController *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DAEASOAuthWebViewController;
  v11 = -[DAEASOAuthWebViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  if (v11)
  {
    objc_msgSend(v8, "accountDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAEASOAuthWebViewController _commonInitializationWithAccount:accountStore:username:accountDescription:presentationBlock:](v11, "_commonInitializationWithAccount:accountStore:username:accountDescription:presentationBlock:", v8, v9, 0, v12, v10);

  }
  return v11;
}

- (DAEASOAuthWebViewController)initWithAccount:(id)a3 accountStore:(id)a4 authURI:(id)a5 accountType:(unint64_t)a6 userName:(id)a7 accountDescription:(id)a8 isFirstTimeSetup:(BOOL)a9 presentationBlock:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  DAEASOAuthWebViewController *v22;
  DAEASOAuthWebViewController *v23;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  v25.receiver = self;
  v25.super_class = (Class)DAEASOAuthWebViewController;
  v22 = -[DAEASOAuthWebViewController initWithNibName:bundle:](&v25, sel_initWithNibName_bundle_, 0, 0);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_authURI, a5);
    v23->_oauthType = a6;
    v23->_isFirstTimeSetup = a9;
    -[DAEASOAuthWebViewController _commonInitializationWithAccount:accountStore:username:accountDescription:presentationBlock:](v23, "_commonInitializationWithAccount:accountStore:username:accountDescription:presentationBlock:", v16, v17, v19, v20, v21);
  }

  return v23;
}

- (DAEASOAuthWebViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  DAEASOAuthWebViewController *v4;
  DAEASOAuthWebViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DAEASOAuthWebViewController;
  v4 = -[DAEASOAuthWebViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[DAEASOAuthWebViewController _commonInitializationWithAccount:accountStore:username:accountDescription:presentationBlock:](v4, "_commonInitializationWithAccount:accountStore:username:accountDescription:presentationBlock:", 0, 0, 0, 0, 0);
  return v5;
}

- (void)_commonInitializationWithAccount:(id)a3 accountStore:(id)a4 username:(id)a5 accountDescription:(id)a6 presentationBlock:(id)a7
{
  id v13;
  id v14;
  __CFString *v15;
  ACAccount **p_account;
  void *v17;
  id presentationBlock;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  NSExtension *v22;
  NSExtension *extension;
  NSObject *v24;
  os_log_type_t v25;
  NSExtension *v26;
  uint64_t v27;
  __CFString *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  unint64_t oauthType;
  void *v37;
  void *v38;
  void *v39;
  _BOOL8 v40;
  NSString *authURI;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSExtension *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[5];
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  id location;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v50 = a4;
  v14 = a5;
  v15 = (__CFString *)a6;
  v51 = a7;
  p_account = &self->_account;
  objc_storeStrong((id *)&self->_account, a3);
  objc_storeStrong((id *)&self->_accountStore, a4);
  v17 = (void *)MEMORY[0x2207BAC80](v51);
  presentationBlock = self->_presentationBlock;
  self->_presentationBlock = v17;

  v19 = MEMORY[0x24BE2AD38];
  if (!self->_presentationBlock)
  {
    DALoggingwithCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_BYTE *)(v19 + 3);
    if (os_log_type_enabled(v20, v21))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EC86000, v20, v21, "DAEASOAuthWebViewController Client did not pass a presentationBlock to the init method. Your presentation animation will probably look horrible. Please pass a presentationBlock.", buf, 2u);
    }

  }
  -[DAEASOAuthWebViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 0);
  v58 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", CFSTR("com.apple.exchangesyncexpress.framework.EASOAuthService"), &v58);
  v22 = (NSExtension *)objc_claimAutoreleasedReturnValue();
  v49 = v58;
  extension = self->_extension;
  self->_extension = v22;

  DALoggingwithCategory();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = *(_BYTE *)(v19 + 7);
  if (os_log_type_enabled(v24, v25))
  {
    v26 = self->_extension;
    *(_DWORD *)buf = 138412290;
    v61 = v26;
    _os_log_impl(&dword_21EC86000, v24, v25, "DAEASOAuthWebViewController got extension %@", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke;
  v55[3] = &unk_24E3707C8;
  objc_copyWeak(&v56, &location);
  -[NSExtension setRequestCancellationBlock:](self->_extension, "setRequestCancellationBlock:", v55);
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_7;
  v53[3] = &unk_24E370818;
  objc_copyWeak(&v54, &location);
  -[NSExtension set_requestPostCompletionBlockWithItems:](self->_extension, "set_requestPostCompletionBlockWithItems:", v53);
  if (v13)
  {
    objc_msgSend(v13, "accountDescription");
    v27 = objc_claimAutoreleasedReturnValue();

    v15 = (__CFString *)v27;
  }
  if (v15)
    v28 = v15;
  else
    v28 = CFSTR("Outlook");
  DALoggingwithCategory();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, v25))
  {
    *(_DWORD *)buf = 138412546;
    v61 = v28;
    v62 = 2112;
    v63 = v14;
    _os_log_impl(&dword_21EC86000, v29, v25, "DAEASOAuthWebViewController initializing for description %@ username %@", buf, 0x16u);
  }

  v30 = objc_alloc_init(MEMORY[0x24BDD1560]);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v28, CFSTR("description"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v13, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32 == 0;

    if (!v33)
    {
      objc_msgSend(v13, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v34, "copy");
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v35, CFSTR("accountId"));

    }
  }
  oauthType = self->_oauthType;
  if (oauthType)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_oauthType);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = &unk_24E374D50;
  }
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v37, CFSTR("oauthAccountType"));
  if (oauthType)

  v38 = v14;
  if (!v14)
  {
    objc_msgSend(v13, "username");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39 == 0;

    if (v40)
      goto LABEL_27;
    objc_msgSend(v13, "username");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v38, CFSTR("username"));
  if (!v14)

LABEL_27:
  authURI = self->_authURI;
  if (authURI)
    objc_msgSend(v31, "setObject:forKeyedSubscript:", authURI, CFSTR("authURI"));
  -[ACAccount objectForKeyedSubscript:](*p_account, "objectForKeyedSubscript:", *MEMORY[0x24BE2AB88]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[ACAccount objectForKeyedSubscript:](*p_account, "objectForKeyedSubscript:", *MEMORY[0x24BE2FD38]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v43, CFSTR("easEndPoint"));

  }
  v44 = *MEMORY[0x24BE2FDD8];
  -[ACAccount objectForKeyedSubscript:](*p_account, "objectForKeyedSubscript:", *MEMORY[0x24BE2FDD8]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[ACAccount objectForKeyedSubscript:](*p_account, "objectForKeyedSubscript:", v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v46, CFSTR("claimsChallenge"));

  }
  objc_msgSend(v30, "setUserInfo:", v31);
  v47 = self->_extension;
  v59 = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_31;
  v52[3] = &unk_24E370840;
  v52[4] = self;
  -[NSExtension instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:](v47, "instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:", v48, 0, v52);

  objc_destroyWeak(&v54);
  objc_destroyWeak(&v56);
  objc_destroyWeak(&location);

}

void __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_2;
  block[3] = &unk_24E3707A0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    DALoggingwithCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (os_log_type_enabled(v3, v4))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_21EC86000, v3, v4, "DAEASOAuthWebViewController extension requestCancellationBlock requestIdentifier %@ error %@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(WeakRetained, "_extensionRequestDidCancelWithError:", *(_QWORD *)(a1 + 40));
  }

}

void __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_2_8;
  v13[3] = &unk_24E3707F0;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

  objc_destroyWeak(&v17);
}

void __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_2_8(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    DALoggingwithCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (os_log_type_enabled(v3, v4))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_21EC86000, v3, v4, "DAEASOAuthWebViewController extension _requestPostCompletionBlockWithItems requestIdentifier %@ items %@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(WeakRetained, "_extensionRequestDidCompleteWithTokens:extensionCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

void __123__DAEASOAuthWebViewController__commonInitializationWithAccount_accountStore_username_accountDescription_presentationBlock___block_invoke_31(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  DALoggingwithCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v10, v11))
  {
    v15 = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_21EC86000, v10, v11, "DAEASOAuthWebViewController finished instantiate remote view controller %@ error %@ extension request identifier %@", (uint8_t *)&v15, 0x20u);
  }

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 992);
  *(_QWORD *)(v12 + 992) = v8;
  v14 = v8;

  objc_msgSend(*(id *)(a1 + 32), "_didInstantiateRemoteViewController");
}

- (void)_didInstantiateRemoteViewController
{
  UIViewController *serviceViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**presentationBlock)(id, DAEASOAuthWebViewController *);
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __66__DAEASOAuthWebViewController__didInstantiateRemoteViewController__block_invoke;
    v21[3] = &unk_24E370868;
    objc_copyWeak(&v22, &location);
    -[UIViewController setViewServiceTerminationBlock:](self->_serviceViewController, "setViewServiceTerminationBlock:", v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  serviceViewController = self->_serviceViewController;
  if (serviceViewController && !self->_extensionCancellationError)
  {
    -[UIViewController willMoveToParentViewController:](serviceViewController, "willMoveToParentViewController:", self);
    -[DAEASOAuthWebViewController addChildViewController:](self, "addChildViewController:", self->_serviceViewController);
    -[DAEASOAuthWebViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_serviceViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v5);

    -[DAEASOAuthWebViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_serviceViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bringSubviewToFront:", v7);

    -[UIViewController didMoveToParentViewController:](self->_serviceViewController, "didMoveToParentViewController:", self);
    -[UIViewController view](self->_serviceViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v10 = (void *)MEMORY[0x24BDD1628];
    v26 = CFSTR("serviceView");
    -[UIViewController view](self->_serviceViewController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[serviceView]|"), 0, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v13);

    v14 = (void *)MEMORY[0x24BDD1628];
    v24 = CFSTR("serviceView");
    -[UIViewController view](self->_serviceViewController, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[serviceView]|"), 0, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v17);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v9);
    -[DAEASOAuthWebViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNeedsLayout");

    presentationBlock = (void (**)(id, DAEASOAuthWebViewController *))self->_presentationBlock;
    if (presentationBlock)
      presentationBlock[2](presentationBlock, self);

  }
  v20 = self->_presentationBlock;
  self->_presentationBlock = 0;

}

void __66__DAEASOAuthWebViewController__didInstantiateRemoteViewController__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[1016])
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_extensionRequestDidCompleteWithTokens:extensionCompletion:", 0, 0);
    WeakRetained = v2;
  }

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DAEASOAuthWebViewController;
  -[DAEASOAuthWebViewController loadView](&v6, sel_loadView);
  -[DAEASOAuthWebViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAEASOAuthWebViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)_extensionRequestDidCancelWithError:(id)a3
{
  objc_storeStrong((id *)&self->_extensionCancellationError, a3);
}

- (void)_extensionRequestDidCompleteWithTokens:(id)a3 extensionCompletion:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  DAEASOAuthWebViewController *v16;
  id v17;
  SEL v18;
  _QWORD block[5];
  id v20;

  v7 = a4;
  v8 = v7;
  self->_extensionRequestDidComplete = 1;
  if (a3)
  {
    objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attachments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(25, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_2;
    v14[3] = &unk_24E370908;
    v15 = v11;
    v16 = self;
    v18 = a2;
    v17 = v8;
    v13 = v11;
    dispatch_async(v12, v14);

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke;
    block[3] = &unk_24E3706A0;
    block[4] = self;
    v20 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 1008);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 1008))
  {
    objc_msgSend(*(id *)(v2 + 1008), "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD1308]) & 1) != 0)
    {
      v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "code");

      v2 = *(_QWORD *)(a1 + 32);
      if (v4 == -1009)
      {
        objc_msgSend((id)objc_opt_class(), "presentInternetOfflineError");
        goto LABEL_9;
      }
    }
    else
    {

      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  v5 = *(void **)(v2 + 1008);
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB4200]))
    {
LABEL_10:

      goto LABEL_11;
    }
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "code");

    if (v7 == 1)
    {
LABEL_9:
      v6 = v8;
      v8 = 0;
      goto LABEL_10;
    }
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "_dismissAndCompleteWithIdentity:error:extensionCompletion:", 0, v8, *(_QWORD *)(a1 + 40));

}

void __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_2(_QWORD *a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD block[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t *v67;
  _QWORD *v68;
  _QWORD v69[4];
  NSObject *v70;
  _QWORD *v71;
  uint64_t *v72;
  uint8_t buf[8];
  _QWORD v74[5];
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  _QWORD v82[4];
  NSObject *v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;

  v2 = dispatch_semaphore_create(0);
  v85 = 0;
  v86 = &v85;
  v87 = 0x3032000000;
  v88 = __Block_byref_object_copy__0;
  v89 = __Block_byref_object_dispose__0;
  v90 = 0;
  v3 = (void *)a1[4];
  v4 = *MEMORY[0x24BDC1748];
  v82[0] = MEMORY[0x24BDAC760];
  v82[1] = 3221225472;
  v82[2] = __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_46;
  v82[3] = &unk_24E370890;
  v84 = &v85;
  v5 = v2;
  v83 = v5;
  objc_msgSend(v3, "loadItemForTypeIdentifier:options:completionHandler:", v4, 0, v82);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__0;
  v80 = __Block_byref_object_dispose__0;
  objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("accessToken"));
  v81 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("refreshToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("username"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("displayName"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("oauthURI"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("tokenRequestURI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("jwksURI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)v9;
  v55 = (void *)v8;
  objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("issuer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("jwksData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = __Block_byref_object_copy__0;
  v74[4] = __Block_byref_object_dispose__0;
  v75 = 0;
  v14 = a1[5];
  if (!*(_BYTE *)(v14 + 1040))
  {
    v25 = *(void **)(v14 + 968);
    if (v25)
    {
      if (v77[5] && v6 && v7)
      {
        objc_msgSend(v25, "username");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "compare:options:", v7, 1);

        if (v27)
        {
          objc_msgSend((id)objc_opt_class(), "presentUsernameMismatchAlert");
          v28 = (void *)v77[5];
          v77[5] = 0;
LABEL_18:

          goto LABEL_2;
        }
        objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("oauthURI"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v52)
          goto LABEL_14;
        objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("tokenRequestURI"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("jwksURI"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50)
          {
            objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("issuer"));
            v30 = objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              v31 = (void *)v30;
              objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("jwksData"));
              v49 = v29;
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (v32)
              {
LABEL_15:
                objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("oauthURI"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1[5] + 968), "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BE2FDC0]);

                objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("tokenRequestURI"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1[5] + 968), "setObject:forKeyedSubscript:", v35, *MEMORY[0x24BE2FDE0]);

                objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("jwksURI"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1[5] + 968), "setObject:forKeyedSubscript:", v36, *MEMORY[0x24BE2FDA0]);

                objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("issuer"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1[5] + 968), "setObject:forKeyedSubscript:", v37, *MEMORY[0x24BE2FDB8]);

                objc_msgSend((id)v86[5], "objectForKeyedSubscript:", CFSTR("jwksData"));
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1[5] + 968), "setObject:forKeyedSubscript:", v38, *MEMORY[0x24BE2FD88]);

                v39 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(MEMORY[0x24BDBCE60], "date");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "timeIntervalSince1970");
                objc_msgSend(v39, "numberWithDouble:");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1[5] + 968), "setObject:forKeyedSubscript:", v41, *MEMORY[0x24BE2FD98]);

                objc_msgSend(*(id *)(a1[5] + 968), "setObject:forKeyedSubscript:", CFSTR("2"), *MEMORY[0x24BE2FDC8]);
                objc_msgSend(*(id *)(a1[5] + 968), "setObject:forKeyedSubscript:", &stru_24E370C58, *MEMORY[0x24BE2FDD0]);
                objc_msgSend(*(id *)(a1[5] + 968), "setObject:forKeyedSubscript:", &stru_24E370C58, *MEMORY[0x24BE2FDD8]);
                v42 = objc_alloc(MEMORY[0x24BDB4388]);
                v43 = objc_msgSend(v42, "initWithOAuth2Token:refreshToken:expiryDate:", v77[5], v6, 0);
                objc_msgSend(*(id *)(a1[5] + 968), "setCredential:", v43);
                DALoggingwithCategory();
                v44 = objc_claimAutoreleasedReturnValue();
                v53 = (void *)v43;
                v45 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
                if (os_log_type_enabled(v44, v45))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21EC86000, v44, v45, "DAEASOAuthWebViewController will save account with new credential", buf, 2u);
                }

                v46 = a1[5];
                v51 = *(void **)(v46 + 976);
                v47 = *(_QWORD *)(v46 + 968);
                v69[0] = MEMORY[0x24BDAC760];
                v69[1] = 3221225472;
                v69[2] = __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_79;
                v69[3] = &unk_24E3708B8;
                v71 = v74;
                v72 = &v76;
                v48 = v5;
                v70 = v48;
                objc_msgSend(v51, "saveAccount:withCompletionHandler:", v47, v69);
                v28 = v53;
                dispatch_semaphore_wait(v48, 0xFFFFFFFFFFFFFFFFLL);

                goto LABEL_18;
              }
LABEL_14:
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[5], CFSTR("DAEASOAuthWebViewController.m"), 279, CFSTR("We have used these objects to fetch and verify the tokens, neither of these should be empty"));

              goto LABEL_15;
            }

          }
        }

        goto LABEL_14;
      }
    }
  }
LABEL_2:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_81;
  block[3] = &unk_24E3708E0;
  v57 = v6;
  v58 = v55;
  v59 = v7;
  v60 = v54;
  v61 = v10;
  v62 = v11;
  v63 = v12;
  v64 = v13;
  v15 = a1[5];
  v16 = (void *)a1[6];
  v67 = &v76;
  v65 = v15;
  v68 = v74;
  v66 = v16;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  v21 = v54;
  v22 = v7;
  v23 = v55;
  v24 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v74, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v85, 8);
}

void __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  void *v21;
  os_log_type_t v22;
  id v23;
  uint8_t buf[4];
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    DALoggingwithCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_impl(&dword_21EC86000, v7, v8, "DAEASOAuthWebViewController did loadItemForTypeIdentifier for response, got error %@", buf, 0xCu);
    }
  }
  else
  {
    v7 = v5;
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = (void *)MEMORY[0x24BDD1620];
      v10 = (void *)MEMORY[0x24BDBCF20];
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v13, v7, &v23);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v23;
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v14;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        DALoggingwithCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
        if (os_log_type_enabled(v18, v19))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v15;
          _os_log_impl(&dword_21EC86000, v18, v19, "Unable to decode response: %@", buf, 0xCu);
        }

        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = 0;

      }
    }
    else
    {
      DALoggingwithCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      v22 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
      if (os_log_type_enabled(v15, v22))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v7;
        _os_log_impl(&dword_21EC86000, v15, v22, "DAEASOAuthWebViewController did loadItemForTypeIdentifier for response, got invalid response %@", buf, 0xCu);
      }
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_79(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  DALoggingwithCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v12[0] = 67109378;
    v12[1] = a2;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_21EC86000, v7, v8, "DAEASOAuthWebViewController did save account with success %d error %@", (uint8_t *)v12, 0x12u);
  }

  if ((a2 & 1) == 0)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __90__DAEASOAuthWebViewController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_81(uint64_t a1)
{
  DAEASOAuthIdentity *v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40) && *(_QWORD *)(a1 + 32))
  {
    v2 = objc_alloc_init(DAEASOAuthIdentity);
    -[DAEASOAuthIdentity setDisplayName:](v2, "setDisplayName:", *(_QWORD *)(a1 + 40));
    -[DAEASOAuthIdentity setUsername:](v2, "setUsername:", *(_QWORD *)(a1 + 48));
    -[DAEASOAuthIdentity setAccessToken:](v2, "setAccessToken:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40));
    -[DAEASOAuthIdentity setRefreshToken:](v2, "setRefreshToken:", *(_QWORD *)(a1 + 32));
    -[DAEASOAuthIdentity setOauthURI:](v2, "setOauthURI:", *(_QWORD *)(a1 + 56));
    -[DAEASOAuthIdentity setTokenRequestURI:](v2, "setTokenRequestURI:", *(_QWORD *)(a1 + 64));
    -[DAEASOAuthIdentity setJwksURI:](v2, "setJwksURI:", *(_QWORD *)(a1 + 72));
    -[DAEASOAuthIdentity setIssuer:](v2, "setIssuer:", *(_QWORD *)(a1 + 80));
    -[DAEASOAuthIdentity setJwksData:](v2, "setJwksData:", *(_QWORD *)(a1 + 88));
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    v2 = objc_alloc_init(DAEASOAuthIdentity);
    -[DAEASOAuthIdentity setUsername:](v2, "setUsername:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(*(id *)(a1 + 96), "_dismissAndCompleteWithIdentity:error:extensionCompletion:", v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), *(_QWORD *)(a1 + 104));

}

- (void)_dismissAndCompleteWithIdentity:(id)a3 error:(id)a4 extensionCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  DALoggingwithCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v11, v12))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EC86000, v11, v12, "DAEASOAuthWebViewController will dismiss", buf, 2u);
  }

  -[DAEASOAuthWebViewController presentingViewController](self, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__DAEASOAuthWebViewController__dismissAndCompleteWithIdentity_error_extensionCompletion___block_invoke;
  v17[3] = &unk_24E370930;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v9;
  v15 = v8;
  v16 = v10;
  objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, v17);

}

void __89__DAEASOAuthWebViewController__dismissAndCompleteWithIdentity_error_extensionCompletion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21EC86000, v2, v3, "DAEASOAuthWebViewController did dismiss", v8, 2u);
  }

  v4 = a1[7];
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  v5 = *(_QWORD *)(a1[4] + 1048);
  if (v5)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, a1[5], a1[6]);
    v6 = a1[4];
    v7 = *(void **)(v6 + 1048);
    *(_QWORD *)(v6 + 1048) = 0;

  }
}

+ (void)presentUsernameMismatchAlert
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v11;
  id v12;

  v11 = (id)MEMORY[0x24BDBCED8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HOTMAIL_EMAIL_MISMATCH_TITLE"), &stru_24E370C58, CFSTR("EASOAuthSupport"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDBD6D8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HOTMAIL_EMAIL_MISMATCH_MESSAGE"), &stru_24E370C58, CFSTR("EASOAuthSupport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDBD6E0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("HOTMAIL_EMAIL_MISMATCH_OK"), &stru_24E370C58, CFSTR("EASOAuthSupport"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v3, v4, v6, v7, v9, *MEMORY[0x24BDBD6F8], 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_presentAlertWithAlertParameters:", v12);
}

+ (void)presentInternetOfflineError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = *MEMORY[0x24BDBD6D8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_TITLE"), &stru_24E370C58, CFSTR("EASOAuthSupport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = *MEMORY[0x24BDBD6E0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_MESSAGE_NO_CONNECTION"), &stru_24E370C58, CFSTR("EASOAuthSupport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = *MEMORY[0x24BDBD6F8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_OK"), &stru_24E370C58, CFSTR("EASOAuthSupport"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_presentAlertWithAlertParameters:", v9);
}

+ (void)presentSSLError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = *MEMORY[0x24BDBD6D8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_TITLE"), &stru_24E370C58, CFSTR("EASOAuthSupport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = *MEMORY[0x24BDBD6E0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_MESSAGE_SSL_ERROR"), &stru_24E370C58, CFSTR("EASOAuthSupport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = *MEMORY[0x24BDBD6F8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_OK"), &stru_24E370C58, CFSTR("EASOAuthSupport"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_presentAlertWithAlertParameters:", v9);
}

+ (void)_presentAlertWithAlertParameters:(id)a3
{
  NSObject *v3;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  CFUserNotificationRef v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v8 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, 0, (CFDictionaryRef)a3);
  if (v6[3])
  {
    dispatch_get_global_queue(25, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__DAEASOAuthWebViewController__presentAlertWithAlertParameters___block_invoke;
    block[3] = &unk_24E370958;
    block[4] = &v5;
    dispatch_async(v3, block);

  }
  _Block_object_dispose(&v5, 8);
}

void __64__DAEASOAuthWebViewController__presentAlertWithAlertParameters___block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_authURI, 0);
  objc_storeStrong((id *)&self->_extensionCancellationError, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_serviceViewController, 0);
  objc_storeStrong(&self->_presentationBlock, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
