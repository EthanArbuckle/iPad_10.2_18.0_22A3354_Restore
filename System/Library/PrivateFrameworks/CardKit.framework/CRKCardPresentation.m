@implementation CRKCardPresentation

+ (void)initialize
{
  _CRKBuiltInProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CRKCardPresentation;
  objc_msgSendSuper2(&v8, sel_initialize);
  CRLogInitIfNeeded();
  v2 = objc_alloc_init(_CRKBuiltInProvider);
  +[CRKIdentifiedProviderRegistry sharedInstance](CRKIdentifiedProviderRegistry, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerIdentifiedProvider:", v2);

  objc_msgSend(MEMORY[0x24BE15480], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "registerIdentifiedService:", v5);

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CRKImageLoader sharedInstanceWithInitialDelegate:](_CRKImageLoader, "sharedInstanceWithInitialDelegate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "active") & 1) == 0)
    objc_msgSend(v7, "setActive:", 1);

}

- (CRKCardPresentation)init
{
  CRKCardPresentation *v2;
  _CRKCardSectionViewLoader *v3;
  _CRKCardSectionViewLoader *cardSectionViewLoader;
  CRProtocolRestrictedInvocationChain *v5;
  CRProtocolRestrictedInvocationChain *cardViewControllerDelegateChain;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKCardPresentation;
  v2 = -[CRKCardPresentation init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_CRKCardSectionViewLoader);
    cardSectionViewLoader = v2->_cardSectionViewLoader;
    v2->_cardSectionViewLoader = v3;

    -[_CRKCardSectionViewLoader setDelegate:](v2->_cardSectionViewLoader, "setDelegate:", v2);
    v5 = (CRProtocolRestrictedInvocationChain *)objc_alloc_init(MEMORY[0x24BE15500]);
    cardViewControllerDelegateChain = v2->_cardViewControllerDelegateChain;
    v2->_cardViewControllerDelegateChain = v5;

    -[CRProtocolRestrictedInvocationChain setRestrictingProtocol:](v2->_cardViewControllerDelegateChain, "setRestrictingProtocol:", &unk_25503C9C8);
    -[CRProtocolRestrictedInvocationChain addChainedObject:](v2->_cardViewControllerDelegateChain, "addChainedObject:", v2);
  }
  return v2;
}

- (void)dealloc
{
  CRKCardViewControlling *cardViewController;
  void (**v4)(_QWORD);
  objc_super v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id from;
  id location;

  cardViewController = self->_cardViewController;
  if (cardViewController && self->_loadedCardViewControllerProvider)
  {
    objc_initWeak(&location, cardViewController);
    objc_initWeak(&from, self->_loadedCardViewControllerProvider);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __30__CRKCardPresentation_dealloc__block_invoke;
    v6[3] = &unk_24DA4CD40;
    objc_copyWeak(&v7, &location);
    objc_copyWeak(&v8, &from);
    v4 = (void (**)(_QWORD))MEMORY[0x219A28084](v6);
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      v4[2](v4);
    else
      dispatch_sync(MEMORY[0x24BDAC9B8], v4);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  v5.receiver = self;
  v5.super_class = (Class)CRKCardPresentation;
  -[CRKCardPresentation dealloc](&v5, sel_dealloc);
}

void __30__CRKCardPresentation_dealloc__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "unregisterCardViewController:", v4);

    WeakRetained = v4;
  }

}

- (void)setConfiguration:(id)a3
{
  -[CRKCardPresentation setConfiguration:animated:completion:](self, "setConfiguration:animated:completion:", a3, 0, 0);
}

- (void)setConfiguration:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke;
  v12[3] = &unk_24DA4CDE0;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v9;
  v11 = v8;
  -[CRKCardPresentation _establishParsecSessionIfNeeded:](self, "_establishParsecSessionIfNeeded:", v12);

}

void __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  char v15;
  id buf[2];

  v3 = a2;
  v4 = *MEMORY[0x24BE15490];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_218FCB000, v4, OS_LOG_TYPE_INFO, "Parsec session is established", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, *(id *)(a1 + 32));
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_135;
  v11[3] = &unk_24DA4CDB8;
  objc_copyWeak(&v14, buf);
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v15 = *(_BYTE *)(a1 + 56);
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);

}

void __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_135(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained[6], "isEqual:", *(_QWORD *)(a1 + 32)))
    {
      v5 = *MEMORY[0x24BE15490];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl(&dword_218FCB000, v5, OS_LOG_TYPE_DEFAULT, "Input configuration %@ matches current configuration. Returning early.", buf, 0xCu);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_storeStrong(v4 + 6, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "cardRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_136;
      v9[3] = &unk_24DA4CD90;
      objc_copyWeak(&v11, v2);
      v12 = *(_BYTE *)(a1 + 56);
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v8, "startWithReply:", v9);

      objc_destroyWeak(&v11);
    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, 0);
  }

}

void __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_2;
  block[3] = &unk_24DA4CD68;
  v11 = v5;
  v7 = v5;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v15 = *(_BYTE *)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v8;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v14);
}

void __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "card");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_fullyConfigureWithRequestedCard:animated:completion:", v2, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      v5 = (void *)MEMORY[0x24BDD1540];
      v6 = *MEMORY[0x24BE15488];
      v7 = *(_QWORD *)(a1 + 40);
      if (v7)
      {
        v10 = *MEMORY[0x24BDD1398];
        v11[0] = v7;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 401, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, 1, v9);

      if (v7)
    }
  }

}

- (CRCard)card
{
  void *v2;
  void *v3;

  -[CRKCardPresentation cardViewController](self, "cardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "card");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRCard *)v3;
}

- (void)configureWithContent:(id)a3 completion:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x24BE15478];
  v7 = a4;
  v8 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithContent:format:", v8, 0);

  -[CRKCardPresentation configureWithCardRequest:completion:](self, "configureWithCardRequest:completion:", v9, v7);
}

- (void)configureWithCardRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CRKCardPresentationConfiguration *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = -[CRKCardPresentationConfiguration initWithCardRequest:]([CRKCardPresentationConfiguration alloc], "initWithCardRequest:", v7);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__CRKCardPresentation_configureWithCardRequest_completion___block_invoke;
  v10[3] = &unk_24DA4CE08;
  v11 = v6;
  v9 = v6;
  -[CRKCardPresentation setConfiguration:animated:completion:](self, "setConfiguration:animated:completion:", v8, 0, v10);

}

uint64_t __59__CRKCardPresentation_configureWithCardRequest_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

+ (void)registerProvider:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CRKIdentifiedProviderRegistry sharedInstance](CRKIdentifiedProviderRegistry, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerIdentifiedProvider:", v3);

}

+ (void)unregisterProvider:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CRKIdentifiedProviderRegistry sharedInstance](CRKIdentifiedProviderRegistry, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterIdentifiedProvider:", v3);

}

- (void)setDebugModeEnabled:(BOOL)a3
{
  if (self->_debugModeEnabled != a3)
  {
    self->_debugModeEnabled = a3;
    -[CRKCardPresentation _updateViewConfigurationsDebugMode:](self, "_updateViewConfigurationsDebugMode:");
  }
}

- (void)_updateViewConfigurationsDebugMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_CRKCardSectionViewLoader _allViewConfigurations](self->_cardSectionViewLoader, "_allViewConfigurations", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_setDebugModeEnabled:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)_cardSectionViewControllerForCardSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  NSObject *v10;
  _CRKCardSectionViewLoader *cardSectionViewLoader;
  int v13;
  CRKCardPresentation *v14;
  __int16 v15;
  _CRKCardSectionViewLoader *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[_CRKCardSectionViewLoader cardSectionShouldBeDisplayed:](self->_cardSectionViewLoader, "cardSectionShouldBeDisplayed:", v4))
  {
    v10 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT))
    {
      cardSectionViewLoader = self->_cardSectionViewLoader;
      v13 = 138412802;
      v14 = self;
      v15 = 2112;
      v16 = cardSectionViewLoader;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_218FCB000, v10, OS_LOG_TYPE_DEFAULT, "%@ not returning card section view controller because provider manager %@ marked card section %@ ineligble for display", (uint8_t *)&v13, 0x20u);
    }
    goto LABEL_7;
  }
  -[_CRKCardSectionViewLoader viewConfigurationForCardSection:](self->_cardSectionViewLoader, "viewConfigurationForCardSection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cardKitCardSectionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CRKCardPresentation cardViewController](self, "cardViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CRKCardPresentation cardViewController](self, "cardViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_cardSectionViewControllerForCardSection:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
LABEL_7:
    v6 = 0;
  }
LABEL_8:

  return v6;
}

- (void)_loadAndRegisterBundleProviders:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  CRKCardPresentation *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl(&dword_218FCB000, v5, OS_LOG_TYPE_INFO, "Loading and registering bundle providers if necessary: %@", buf, 0xCu);
  }
  +[_CRKProviderBundleManager sharedInstance](_CRKProviderBundleManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__CRKCardPresentation__loadAndRegisterBundleProviders___block_invoke;
  v8[3] = &unk_24DA4CE30;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getProviderBundlesWithCompletion:", v8);

}

void __55__CRKCardPresentation__loadAndRegisterBundleProviders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_13:
      v8();
    }
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v5);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          +[CRKIdentifiedProviderRegistry sharedInstance](CRKIdentifiedProviderRegistry, "sharedInstance");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "registerIdentifiedProvider:", v13);

        }
        v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
    {
      v8 = *(void (**)(void))(v15 + 16);
      goto LABEL_13;
    }
  }

}

- (void)_fullyConfigureWithRequestedCard:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  int v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[CRKCardPresentation configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "loadsBundleProviders");

  if (v11)
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __76__CRKCardPresentation__fullyConfigureWithRequestedCard_animated_completion___block_invoke;
    v12[3] = &unk_24DA4CE80;
    v14 = v9;
    objc_copyWeak(&v15, &location);
    v13 = v8;
    v16 = v6;
    -[CRKCardPresentation _loadAndRegisterBundleProviders:](self, "_loadAndRegisterBundleProviders:", v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    -[CRKCardPresentation _configureWithRequestedCard:animated:completion:](self, "_configureWithRequestedCard:animated:completion:", v8, v6, v9);
  }

}

void __76__CRKCardPresentation__fullyConfigureWithRequestedCard_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__CRKCardPresentation__fullyConfigureWithRequestedCard_animated_completion___block_invoke_2;
  block[3] = &unk_24DA4CE58;
  v6 = v3;
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 56);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __76__CRKCardPresentation__fullyConfigureWithRequestedCard_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  if (!*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      v6 = WeakRetained;
      objc_msgSend(WeakRetained, "_configureWithRequestedCard:animated:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 48);
      if (!v5)
      {
LABEL_10:

        return;
      }
      v6 = 0;
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0);
    }
    v4 = v6;
    goto LABEL_10;
  }
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
}

- (void)_configureWithRequestedCard:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  CRKCardViewControlling *v14;
  id v15;
  void *v16;
  CRKCardViewControlling *v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  void *v21;
  int v22;
  _CRKCardSectionViewLoader *cardSectionViewLoader;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  void (**v31)(_QWORD, _QWORD);
  id v32;
  id v33;
  _QWORD v34[4];
  CRKCardViewControlling *v35;
  id v36;
  id v37;
  BOOL v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  CRKCardPresentation *v43;
  id v44;
  _QWORD v45[5];
  id v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "cardIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKIdentifiedProviderRegistry sharedInstance](CRKIdentifiedProviderRegistry, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifiedProviders");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke;
  v45[3] = &unk_24DA4CEA8;
  v45[4] = self;
  v12 = v8;
  v46 = v12;
  objc_msgSend(v27, "sortedArrayUsingComparator:", v45);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v28;
    _os_log_impl(&dword_218FCB000, v13, OS_LOG_TYPE_DEFAULT, "Sorted providers by card display priority\n    Providers: %@", buf, 0xCu);
  }
  v14 = self->_cardViewController;
  objc_initWeak((id *)buf, self);
  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_152;
  v41[3] = &unk_24DA4CED0;
  v15 = v12;
  v42 = v15;
  objc_copyWeak(&v44, (id *)buf);
  v43 = self;
  objc_msgSend(v28, "enumerateObjectsWithOptions:usingBlock:", 2, v41);
  v39[0] = v11;
  v39[1] = 3221225472;
  v39[2] = __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_190;
  v39[3] = &unk_24DA4CEF8;
  v25 = v9;
  v40 = v25;
  v16 = (void *)MEMORY[0x219A28084](v39);
  v34[0] = v11;
  v34[1] = 3221225472;
  v34[2] = __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_2;
  v34[3] = &unk_24DA4CF48;
  objc_copyWeak(&v37, (id *)buf);
  v17 = v14;
  v35 = v17;
  v38 = a4;
  v18 = v16;
  v36 = v18;
  v19 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A28084](v34);
  -[CRKCardViewControlling card](self->_cardViewController, "card");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cardIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", v26);

  if (v22)
  {
    cardSectionViewLoader = self->_cardSectionViewLoader;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v11;
    v29[1] = 3221225472;
    v29[2] = __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_4;
    v29[3] = &unk_24DA4CF70;
    v30 = v15;
    objc_copyWeak(&v33, (id *)buf);
    v31 = v19;
    v32 = v18;
    -[_CRKCardSectionViewLoader _loadIdentifiedCardSectionViewProvidersFromCard:identifiedProviders:delegate:completion:](cardSectionViewLoader, "_loadIdentifiedCardSectionViewProvidersFromCard:identifiedProviders:delegate:completion:", v30, v24, self, v29);

    objc_destroyWeak(&v33);
  }
  else
  {
    v19[2](v19, 1);
  }

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v44);

  objc_destroyWeak((id *)buf);
}

uint64_t __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "cardPresentation:compareCardViewControllerProviderOne:providerTwo:", *(_QWORD *)(a1 + 32), v5, v6);

    if (v9)
      goto LABEL_16;
  }
  else
  {

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(v5, "displayPriorityForCard:", *(_QWORD *)(a1 + 40));
  else
    v10 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend(v6, "displayPriorityForCard:", *(_QWORD *)(a1 + 40));
  else
    v11 = 0;
  v12 = 1;
  if (v10 <= v11)
    v12 = -1;
  if (v10 == v11)
    v9 = 0;
  else
    v9 = v12;
LABEL_16:

  return v9;
}

void __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_152(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id *WeakRetained;
  NSObject *v10;
  void *v11;
  void *v12;
  id *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _BOOL4 v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  int v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "cardViewControllerForCard:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
      if (WeakRetained)
      {
        v10 = *MEMORY[0x24BE15490];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT))
        {
          v28 = 138412546;
          v29 = v8;
          v30 = 2112;
          v31 = v7;
          _os_log_impl(&dword_218FCB000, v10, OS_LOG_TYPE_DEFAULT, "Succesfully loaded card view controller from provider\n    Card view controller: %@\n    Provider: %@", (uint8_t *)&v28, 0x16u);
        }
        objc_storeStrong(WeakRetained + 7, v8);
        objc_storeStrong(WeakRetained + 2, a2);
        objc_msgSend(WeakRetained, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "cardViewControllerDelegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = WeakRetained + 4;
          objc_storeWeak(WeakRetained + 4, v12);

        }
        else
        {
          v13 = WeakRetained + 4;
          objc_storeWeak(WeakRetained + 4, 0);
        }
        v22 = objc_loadWeakRetained(v13);
        v23 = v22 == 0;

        if (v23)
        {
          if (objc_msgSend(v11, "conformsToProtocol:", &unk_25504E218))
            v24 = v11;
          else
            v24 = 0;
          objc_storeWeak(v13, v24);
        }
        objc_copyWeak((id *)&v28, v13);
        v25 = objc_loadWeakRetained((id *)&v28);

        if (v25)
        {
          v26 = WeakRetained[3];
          v27 = objc_loadWeakRetained((id *)&v28);
          objc_msgSend(v26, "addChainedObject:", v27);

        }
        objc_msgSend(WeakRetained[3], "addChainedObject:", *(_QWORD *)(a1 + 40));
        if ((objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(WeakRetained[3], "conformsToProtocol:", &unk_25503C9C8))
        {
          objc_msgSend(WeakRetained[7], "setCardViewControllerDelegate:", WeakRetained[3]);
        }
        *a4 = 1;
        objc_destroyWeak((id *)&v28);

      }
    }
    else
    {
      v15 = *MEMORY[0x24BE15490];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
        __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_152_cold_1((uint64_t)v7, v15, v16, v17, v18, v19, v20, v21);
    }

  }
  else
  {
    v14 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = v7;
      _os_log_impl(&dword_218FCB000, v14, OS_LOG_TYPE_DEFAULT, "Unable to load card view controller from provider (provider does not provide card view controllers)\n    Provider: %@", (uint8_t *)&v28, 0xCu);
    }
  }

}

void __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_190(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    if (a3)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), a2, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE15488], 300, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v5);

    }
  }
}

void __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = *(void **)(a1 + 32);
  if (v5
    && (objc_msgSend(v5, "parentViewController"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    +[_CRKCardViewControllerTransitionAnimator sectionShuffleTransitionAnimator](_CRKCardViewControllerTransitionAnimator, "sectionShuffleTransitionAnimator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", WeakRetained);
    objc_initWeak(&location, WeakRetained);
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "cardViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(unsigned __int8 *)(a1 + 56);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_3;
    v11[3] = &unk_24DA4CF20;
    objc_copyWeak(&v13, &location);
    v12 = *(id *)(a1 + 40);
    v14 = a2;
    objc_msgSend(v7, "transitionFromCardViewController:toCardViewController:animated:completion:", v8, v9, v10, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(WeakRetained, "_updateViewConfigurationsDebugMode:", objc_msgSend(WeakRetained, "debugModeEnabled"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateViewConfigurationsDebugMode:", objc_msgSend(WeakRetained, "debugModeEnabled"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_4(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *WeakRetained;
  id *v11;

  if ((a2 & 1) == 0)
  {
    v3 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_4_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[7], "setCardSectionViewSource:", WeakRetained[1]);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11[2], "presentation:didApplyCardSectionViewSource:toCardViewController:", v11, v11[1], v11[7]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)_establishParsecSessionIfNeeded:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(33, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CRKCardPresentation__establishParsecSessionIfNeeded___block_invoke;
  block[3] = &unk_24DA4CF98;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __55__CRKCardPresentation__establishParsecSessionIfNeeded___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t result;

  v2 = (id)objc_msgSend(MEMORY[0x24BE1FA70], "sharedSession");
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (id)defaultFeedbackDelegateForProvider:(id)a3
{
  return self->_cardViewController;
}

- (BOOL)cardSectionDisplayRequiresUserConsentForProvider:(id)a3
{
  void *v3;
  char v4;

  -[CRKCardPresentation configuration](self, "configuration", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "respectsUserConsent");

  return v4;
}

- (double)boundingWidthForProvider:(id)a3
{
  void *v4;
  double v5;
  double Width;
  void *v7;
  void *v8;
  CGRect v10;

  -[CRKCardPresentation delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "boundingWidthForPresentation:", self);
    Width = v5;
  }
  else
  {
    objc_opt_class();
    Width = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CRKCardPresentation delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      Width = CGRectGetWidth(v10);

    }
  }

  return Width;
}

- (int64_t)semanticContentAttributeForCardFactory:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[CRKCardPresentation delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CRKCardPresentation delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "semanticContentAttributeForCardPresentation:", self);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)cardSectionViewLoader:(id)a3 compareCardSectionViewProviderOne:(id)a4 providerTwo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  int64_t v12;

  v7 = a4;
  v8 = a5;
  -[CRKCardPresentation delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CRKCardPresentation delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "cardPresentation:compareCardSectionViewProviderOne:providerTwo:", self, v7, v8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)transitionAnimator:(id)a3 willTransitionFromCardViewController:(id)a4 toCardViewController:(id)a5 withAnimationCoordinator:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v9 = a5;
  v10 = a6;
  -[CRKCardPresentation delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "cardPresentation:willTransitionFromCardViewController:toCardViewController:withAnimationCoordinator:", self, v12, v9, v10);

}

- (void)cardViewController:(id)a3 requestCardSectionViewSourceForCard:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _CRKCardSectionViewLoader *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _CRKCardSectionViewLoader *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _CRKCardSectionViewLoader *v20;
  _QWORD v21[4];
  _CRKCardSectionViewLoader *v22;
  id v23;
  void (**v24)(id, _CRKCardSectionViewLoader *, _QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _CRKCardSectionViewLoader *, _QWORD))a5;
  if (v10)
  {
    -[_CRKCardSectionViewLoader loadedCard](self->_cardSectionViewLoader, "loadedCard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cardIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (v14)
    {
      v10[2](v10, self->_cardSectionViewLoader, 0);
    }
    else
    {
      v15 = objc_alloc_init(_CRKCardSectionViewLoader);
      v16 = (void *)MEMORY[0x24BDBCF20];
      +[CRKIdentifiedProviderRegistry sharedInstance](CRKIdentifiedProviderRegistry, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifiedProviders");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __84__CRKCardPresentation_cardViewController_requestCardSectionViewSourceForCard_reply___block_invoke;
      v21[3] = &unk_24DA4CFC0;
      v24 = v10;
      v22 = v15;
      v23 = v9;
      v20 = v15;
      -[_CRKCardSectionViewLoader _loadIdentifiedCardSectionViewProvidersFromCard:identifiedProviders:delegate:completion:](v20, "_loadIdentifiedCardSectionViewProvidersFromCard:identifiedProviders:delegate:completion:", v23, v19, self, v21);

    }
  }

}

void __84__CRKCardPresentation_cardViewController_requestCardSectionViewSourceForCard_reply___block_invoke(_QWORD *a1, int a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = a1[6];
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(a1[6], a1[4], 0);
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD1540];
    v4 = *MEMORY[0x24BE15488];
    v8 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to load card section view controllers from card: %@"), a1[5], 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 300, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v7);

  }
}

- (CRKCardPresentationConfiguration)configuration
{
  return self->_configuration;
}

- (CRKCardViewControlling)cardViewController
{
  return self->_cardViewController;
}

- (CRKCardPresentationDelegate)delegate
{
  return (CRKCardPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)debugModeEnabled
{
  return self->_debugModeEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cardViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_externalCardViewControllerDelegate);
  objc_storeStrong((id *)&self->_cardViewControllerDelegateChain, 0);
  objc_storeStrong((id *)&self->_loadedCardViewControllerProvider, 0);
  objc_storeStrong((id *)&self->_cardSectionViewLoader, 0);
}

void __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218FCB000, a2, a3, "Failed to establish Parsec session: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_152_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218FCB000, a2, a3, "Failed to load card view controller from provider\n    Provider: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218FCB000, a2, a3, "Failed to load card section view providers from card: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
