@implementation SKProductRemoteViewTask

- (SKProductRemoteViewTask)initWithStoreController:(id)a3
{
  id v4;
  SKProductRemoteViewTask *v5;
  SKProductRemoteViewTask *v6;
  NSString *extensionID;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *logKey;
  NSDictionary *cachedParameters;
  NSDictionary *lookupResult;
  NSError *lookupError;
  NSMutableArray *v16;
  NSMutableArray *entitledConfigurationActions;
  NSMutableArray *v18;
  NSMutableArray *configurationActions;
  NSString *hostApplicationOverride;
  void *v21;
  NSString *v22;
  id v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  NSString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SKProductRemoteViewTask;
  v5 = -[SKProductRemoteViewTask init](&v25, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_storeController, v4);
    v6->_isAskToBuy = 0;
    extensionID = v6->_extensionID;
    v6->_extensionID = 0;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("-"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();
    logKey = v6->_logKey;
    v6->_logKey = (NSString *)v11;

    cachedParameters = v6->_cachedParameters;
    v6->_cachedParameters = 0;

    lookupResult = v6->_lookupResult;
    v6->_lookupResult = 0;

    lookupError = v6->_lookupError;
    v6->_lookupError = 0;

    v6->_isFetchingExtension = 0;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    entitledConfigurationActions = v6->_entitledConfigurationActions;
    v6->_entitledConfigurationActions = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    configurationActions = v6->_configurationActions;
    v6->_configurationActions = v18;

    hostApplicationOverride = v6->_hostApplicationOverride;
    v6->_hostApplicationOverride = 0;

    *(_WORD *)&v6->_isPreview = 0;
    v6->_visibleInClientWindow = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_opt_class();
      v22 = v6->_logKey;
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      v28 = 2114;
      v29 = v22;
      v23 = v21;
      _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Start.", buf, 0x16u);

    }
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  NSString *logKey;
  id v5;
  ServiceCardContainerViewController *extensionRemoteCardContainerViewController;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    logKey = self->_logKey;
    *(_DWORD *)buf = 138543618;
    v9 = v3;
    v10 = 2114;
    v11 = logKey;
    v5 = v3;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Dealloc", buf, 0x16u);

  }
  extensionRemoteCardContainerViewController = self->_extensionRemoteCardContainerViewController;
  self->_extensionRemoteCardContainerViewController = 0;

  -[SKProductRemoteViewTask _killExtensionIfNecessary](self, "_killExtensionIfNecessary");
  v7.receiver = self;
  v7.super_class = (Class)SKProductRemoteViewTask;
  -[SKProductRemoteViewTask dealloc](&v7, sel_dealloc);
}

- (void)_dismissProductViewControllerWithResult:(int64_t)a3
{
  NSString *logKey;
  id WeakRetained;
  _QWORD v7[6];
  uint8_t buf[4];
  SKProductRemoteViewTask *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    *(_DWORD *)buf = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = logKey;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Finishing controller.", buf, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_storeController);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SKProductRemoteViewTask__dismissProductViewControllerWithResult___block_invoke;
  v7[3] = &unk_1E5B27A60;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __67__SKProductRemoteViewTask__dismissProductViewControllerWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id WeakRetained;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 8);
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 144));
  v5 = WeakRetained;
  if (v3)
    objc_msgSend(WeakRetained, "_didFinishWithResult:", *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(WeakRetained, "_didFinish");

}

- (void)lookupProductWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *cachedParameters;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_storeController);
  v9 = objc_msgSend(WeakRetained, "_isInvalidSubclass");

  if (!v9)
  {
    -[SKProductRemoteViewTask _productIDFromParameters:](self, "_productIDFromParameters:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      self->_didLoad = 0;
      objc_initWeak(&location, self);
      v11 = (void *)-[NSString copy](self->_logKey, "copy");
      -[SKProductRemoteViewTask _keyProfileForProductLookup](self, "_keyProfileForProductLookup");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (NSDictionary *)objc_msgSend(v6, "copy");
      cachedParameters = self->_cachedParameters;
      self->_cachedParameters = v13;

      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke;
      v16[3] = &unk_1E5B27A88;
      objc_copyWeak(&v18, &location);
      v17 = v7;
      -[SKProductRemoteViewTask performLookupWithIdentifier:parameters:logKey:keyProfile:completionHandler:](self, "performLookupWithIdentifier:parameters:logKey:keyProfile:completionHandler:", v10, v6, v11, v12, v16);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 5, 0);
      if (v7)
        (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);

    }
    goto LABEL_9;
  }
  if (v7)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);
LABEL_9:

  }
}

void __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  id *v8;
  id v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void (*v23)(void);
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;

  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained(WeakRetained + 18);
    v10 = objc_msgSend(v9, "_isInvalidSubclass");

    if (!v10)
    {
      if (!v5 || v6)
      {
        objc_storeStrong(v8 + 8, a3);
        v33 = *(_QWORD *)(a1 + 32);
        if (v33)
        {
          v23 = *(void (**)(void))(v33 + 16);
          goto LABEL_15;
        }
      }
      else
      {
        objc_msgSend(v5, "deepLinkURL");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "deepLinkURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "canOpenURL:", v14);

          if ((v15 & 1) == 0)
          {
            v34 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v34)
              __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke_cold_2(v34, v35, v36, v37, v38, v39, v40, v41);
            +[SKProductRemoteViewTask _unknownErrorWithUserInfo:](SKProductRemoteViewTask, "_unknownErrorWithUserInfo:", 0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong(v8 + 8, v42);
            v43 = *(_QWORD *)(a1 + 32);
            if (v43)
              (*(void (**)(uint64_t, _QWORD, void *))(v43 + 16))(v43, 0, v42);

            goto LABEL_21;
          }
        }
        objc_msgSend(v5, "deepLinkURL");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v8[9];
        v8[9] = (id)v16;

        objc_msgSend(v5, "resultDictionary");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v8[7];
        v8[7] = (id)v18;

        *((_BYTE *)v8 + 8) = objc_msgSend(v5, "isEntitled");
        objc_msgSend(v5, "extensionBundleID");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v8[2];
        v8[2] = (id)v20;

        v22 = *(_QWORD *)(a1 + 32);
        if (v22)
        {
          v23 = *(void (**)(void))(v22 + 16);
LABEL_15:
          v23();
        }
      }
LABEL_21:
      objc_msgSend(v8, "_displayItemIfNeeded");
      goto LABEL_22;
    }
  }
  else
  {
    v24 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v24)
      __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
LABEL_22:

}

- (void)storeProductViewControllerWillDisappear
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSString *logKey;
  id v8;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("com.apple.Spotlight"), "isEqualToString:", v4);

  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_opt_class();
      logKey = self->_logKey;
      *(_DWORD *)v9 = 138543618;
      *(_QWORD *)&v9[4] = v6;
      *(_WORD *)&v9[12] = 2114;
      *(_QWORD *)&v9[14] = logKey;
      v8 = v6;
      _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Disappearing.", v9, 0x16u);

    }
    -[SKProductRemoteViewTask finishImmediately](self, "finishImmediately", *(_OWORD *)v9, *(_QWORD *)&v9[16]);
  }
}

- (void)storeProductViewControllerWillDismiss
{
  void *v3;
  NSString *logKey;
  id v5;
  void *v6;
  void *v7;
  int v8;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    logKey = self->_logKey;
    *(_DWORD *)v9 = 138543618;
    *(_QWORD *)&v9[4] = v3;
    *(_WORD *)&v9[12] = 2114;
    *(_QWORD *)&v9[14] = logKey;
    v5 = v3;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Will dismiss.", v9, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", *(_OWORD *)v9, *(_QWORD *)&v9[16], v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(CFSTR("com.apple.Spotlight"), "isEqualToString:", v7);

  if (v8)
    -[ServiceCardContainerViewController dismissViewControllerAnimated:completion:](self->_extensionRemoteCardContainerViewController, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_13);
}

void __64__SKProductRemoteViewTask_storeProductViewControllerWillDismiss__block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Did dismiss.", v0, 2u);
  }
}

- (void)setPresentationStyle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__SKProductRemoteViewTask_setPresentationStyle___block_invoke;
  v6[3] = &unk_1E5B27AB0;
  v7 = v4;
  v5 = v4;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v6, 0);

}

uint64_t __48__SKProductRemoteViewTask_setPresentationStyle___block_invoke(uint64_t result, uint64_t a2, void *a3)
{
  if (a3)
    return objc_msgSend(a3, "setPresentationStyle:", *(_QWORD *)(result + 32));
  return result;
}

- (void)setPreview:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)-[NSString copy](self->_logKey, "copy");
  self->_isPreview = objc_msgSend(v4, "BOOLValue");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SKProductRemoteViewTask_setPreview___block_invoke;
  v8[3] = &unk_1E5B27AD8;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v8, 0);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __38__SKProductRemoteViewTask_setPreview___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __38__SKProductRemoteViewTask_setPreview___block_invoke_cold_1();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = v6;
LABEL_7:
    objc_msgSend(v9, "setPreview:", v8);
  }

}

- (void)setVisibleInClientWindow:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "BOOLValue");
  v6 = MEMORY[0x1E0C809B0];
  self->_visibleInClientWindow = v5;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __52__SKProductRemoteViewTask_setVisibleInClientWindow___block_invoke;
  v8[3] = &unk_1E5B27AB0;
  v9 = v4;
  v7 = v4;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v8, 0);

}

void __52__SKProductRemoteViewTask_setVisibleInClientWindow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = v7;
  if (v7 || (v6 = v5) != 0)
    objc_msgSend(v6, "setVisibleInClientWindow:", *(_QWORD *)(a1 + 32));

}

- (void)_addConfigurationAction:(id)a3 needsEntitlement:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD *v6;
  _QWORD *v7;
  void (*v8)(void);
  void *v9;
  SKRemoteProductViewController *uiServiceRemoteViewController;
  id v11;
  void *v12;
  NSMutableArray *configurationActions;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (self->_extensionRemoteViewController)
  {
    if (v4 && !self->_isClientEntitled)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:].cold.2();
      v8 = (void (*)(void))v7[2];
    }
    else
    {
      v8 = (void (*)(void))v6[2];
    }
    v8();
  }
  else if (self->_uiServiceRemoteViewController)
  {
    v9 = (void *)-[NSString copy](self->_logKey, "copy");
    objc_initWeak(&location, self);
    uiServiceRemoteViewController = self->_uiServiceRemoteViewController;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__SKProductRemoteViewTask__addConfigurationAction_needsEntitlement___block_invoke;
    v16[3] = &unk_1E5B27B00;
    objc_copyWeak(&v18, &location);
    v11 = v9;
    v17 = v11;
    -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](uiServiceRemoteViewController, "serviceViewControllerProxyWithErrorHandler:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(_QWORD *, _QWORD, void *))v7[2])(v7, 0, v12);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  else
  {
    configurationActions = self->_configurationActions;
    if (configurationActions && !v4 || (configurationActions = self->_entitledConfigurationActions) != 0 && v4)
    {
      v14 = (void *)objc_msgSend(v6, "copy");
      v15 = _Block_copy(v14);
      -[NSMutableArray addObject:](configurationActions, "addObject:", v15);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:].cold.1();
    }
  }

}

void __68__SKProductRemoteViewTask__addConfigurationAction_needsEntitlement___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __68__SKProductRemoteViewTask__addConfigurationAction_needsEntitlement___block_invoke_cold_1();

}

- (void)_executeConfigurationActionsForUIService:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *entitledConfigurationActions;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *configurationActions;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_entitledConfigurationActions;
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  entitledConfigurationActions = self->_entitledConfigurationActions;
  self->_entitledConfigurationActions = v6;

  v8 = self->_configurationActions;
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  configurationActions = self->_configurationActions;
  self->_configurationActions = v9;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v5;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = v8;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20) + 16))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20));
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v18);
  }

}

- (void)_executeConfigurationActionsForExtension:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *entitledConfigurationActions;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *configurationActions;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_entitledConfigurationActions;
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  entitledConfigurationActions = self->_entitledConfigurationActions;
  self->_entitledConfigurationActions = v6;

  v8 = self->_configurationActions;
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  configurationActions = self->_configurationActions;
  self->_configurationActions = v9;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v5;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        if (self->_isClientEntitled)
          v16 = v4;
        else
          v16 = 0;
        (*(void (**)(_QWORD, id, _QWORD))(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), v16, 0);
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v13);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = v8;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j) + 16))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v19);
  }

}

- (void)_displayItemIfNeeded
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SKProductRemoteViewTask__displayItemIfNeeded__block_invoke;
  block[3] = &unk_1E5B267D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __47__SKProductRemoteViewTask__displayItemIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    objc_msgSend(v4, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(v6 + 24))
      {
        v7 = objc_loadWeakRetained((id *)(v6 + 144));
        v8 = objc_msgSend(v7, "_isInvalidSubclass");

        v9 = *(_QWORD *)(a1 + 32);
        if (v8)
        {
          objc_msgSend((id)v9, "_dismissProductViewControllerWithResult:", 0);
        }
        else if (*(_QWORD *)(v9 + 72))
        {
          v10 = (void *)objc_msgSend(*(id *)(v9 + 72), "copy");
          objc_initWeak(&location, *(id *)(a1 + 32));
          v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __47__SKProductRemoteViewTask__displayItemIfNeeded__block_invoke_2;
          v14[3] = &unk_1E5B27B28;
          v12 = v10;
          v15 = v12;
          objc_copyWeak(&v16, &location);
          objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v14);

          objc_destroyWeak(&v16);
          objc_destroyWeak(&location);

        }
        else if (*(_QWORD *)(v9 + 16))
        {
          objc_msgSend((id)v9, "_showExtensionWithID:");
        }
        else if (*(_QWORD *)(v9 + 64)
               && (v13 = objc_msgSend((id)v9, "_isProductUnavailableError:"), v9 = *(_QWORD *)(a1 + 32), !v13))
        {
          objc_msgSend((id)v9, "_showErrorController");
        }
        else
        {
          objc_msgSend((id)v9, "_showExtensionFromUIService");
        }
      }
    }
  }
}

void __47__SKProductRemoteViewTask__displayItemIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:options:completionHandler:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA70], &__block_literal_global_25);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishWithResult:", 3);

}

- (BOOL)_isViewControllerDescendant:(id)a3 ofViewController:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v7;
  v9 = v7;
  if (v7)
  {
    v9 = v7;
    if (v7 != v6)
    {
      v9 = v7;
      do
      {
        v10 = v9;
        objc_msgSend(v9, "parentViewController");
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      while (v9 && v9 != v6);
    }
  }

  return v9 == v6;
}

- (BOOL)_isProductUnavailableError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("ASDErrorDomain")))
      v6 = objc_msgSend(v4, "code") == 512;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_showErrorController
{
  _QWORD v3[4];
  id v4;
  id location;

  self->_isFetchingExtension = 1;
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__SKProductRemoteViewTask__showErrorController__block_invoke;
  v3[3] = &unk_1E5B27B78;
  objc_copyWeak(&v4, &location);
  -[SKProductRemoteViewTask _loadUIServiceIfNecessaryWithCompletion:](self, "_loadUIServiceIfNecessaryWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __47__SKProductRemoteViewTask__showErrorController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__SKProductRemoteViewTask__showErrorController__block_invoke_2;
    v7[3] = &unk_1E5B27B50;
    objc_copyWeak(&v8, v4);
    objc_msgSend(v3, "showErrorPageWithCompletion:", v7);
    objc_destroyWeak(&v8);
  }
  else if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 24) = 0;
  }

}

void __47__SKProductRemoteViewTask__showErrorController__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[24] = 0;

}

- (void)_loadUIServiceIfNecessaryWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  SKRemoteProductViewController *uiServiceRemoteViewController;
  id *v7;
  void *v8;
  id *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SKProductRemoteViewTask *v16;
  void (**v17)(id, void *);
  id v18;
  id location;

  v4 = (void (**)(id, void *))a3;
  objc_initWeak(&location, self);
  v5 = (void *)-[NSString copy](self->_logKey, "copy");
  uiServiceRemoteViewController = self->_uiServiceRemoteViewController;
  if (uiServiceRemoteViewController)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke_32;
    v11[3] = &unk_1E5B27B00;
    v7 = &v13;
    objc_copyWeak(&v13, &location);
    v12 = v5;
    -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](uiServiceRemoteViewController, "serviceViewControllerProxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);
    v9 = &v12;
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke;
    v14[3] = &unk_1E5B27BA0;
    v7 = &v18;
    objc_copyWeak(&v18, &location);
    v17 = v4;
    v15 = v5;
    v16 = self;
    v10 = +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](SKRemoteProductViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("ServiceProductPageViewController"), CFSTR("com.apple.ios.StoreKitUIService"), v14);
    v9 = (id *)&v17;
    v8 = v15;
  }

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);

}

void __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;

  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v9 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_10;
  }
  if (!v6 || v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke_cold_1();
    goto LABEL_9;
  }
  objc_storeStrong(WeakRetained + 17, a2);
  v10 = v9[17];
  v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 144));
  objc_msgSend(v10, "setProductViewController:", v11);

  v12 = v9[17];
  v13 = objc_loadWeakRetained(v9 + 18);
  objc_msgSend(v9, "_addChildController:toController:", v12, v13);

  v14 = *(void **)(*(_QWORD *)(a1 + 40) + 136);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke_30;
  v20 = &unk_1E5B27B00;
  objc_copyWeak(&v22, (id *)(a1 + 56));
  v21 = *(id *)(a1 + 32);
  objc_msgSend(v14, "serviceViewControllerProxyWithErrorHandler:", &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40))
    objc_msgSend(v15, "setHostBundleIdentifier:", v17, v18, v19, v20);
  objc_msgSend(v9, "_executeConfigurationActionsForUIService:", v16, v17, v18, v19, v20);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  objc_destroyWeak(&v22);
LABEL_10:

}

void __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __68__SKProductRemoteViewTask__addConfigurationAction_needsEntitlement___block_invoke_cold_1();

}

void __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __68__SKProductRemoteViewTask__addConfigurationAction_needsEntitlement___block_invoke_cold_1();

}

- (void)_addChildController:(id)a3 toController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "addChildViewController:", v6);
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  objc_msgSend(v6, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "setFrame:");

  objc_msgSend(v6, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAutoresizingMask:", 18);
}

- (void)_showExtensionWithID:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  SKProductPageRemoteViewController *extensionRemoteViewController;
  _UIResilientRemoteViewContainerViewController *extensionRemoteContainerViewController;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id location;
  id v19;

  v4 = a3;
  if (v4)
  {
    if (self->_didLoad)
    {
      if (!self->_isPreview)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_storeController);
        objc_msgSend(WeakRetained, "presentViewController:animated:completion:", self->_extensionRemoteCardContainerViewController, 1, &__block_literal_global_33);

      }
    }
    else
    {
      self->_isFetchingExtension = 1;
      if (self->_extensionRemoteContainerViewController)
      {
        -[SKProductRemoteViewTask _killExtensionIfNecessary](self, "_killExtensionIfNecessary");
        v6 = -[_UIRemoteViewController disconnect](self->_extensionRemoteViewController, "disconnect");
        extensionRemoteViewController = self->_extensionRemoteViewController;
        self->_extensionRemoteViewController = 0;

        -[_UIResilientRemoteViewContainerViewController invalidate](self->_extensionRemoteContainerViewController, "invalidate");
        extensionRemoteContainerViewController = self->_extensionRemoteContainerViewController;
        self->_extensionRemoteContainerViewController = 0;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_visibleInClientWindow);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKProductRemoteViewTask setVisibleInClientWindow:](self, "setVisibleInClientWindow:", v9);

      }
      v19 = 0;
      objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v4, &v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v19;
      if (v10)
      {
        objc_storeStrong((id *)&self->_productPageExtension, v10);
        objc_initWeak(&location, self);
        v12 = (void *)-[NSString copy](self->_logKey, "copy");
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_36;
        v14[3] = &unk_1E5B27C10;
        v14[4] = self;
        v15 = v10;
        objc_copyWeak(&v17, &location);
        v16 = v12;
        v13 = v12;
        dispatch_async(MEMORY[0x1E0C80D38], v14);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[SKProductRemoteViewTask _showExtensionWithID:].cold.2();
        -[SKProductRemoteViewTask _showErrorController](self, "_showErrorController");
        self->_isFetchingExtension = 0;
      }

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[SKProductRemoteViewTask _showExtensionWithID:].cold.1();
  }

}

void __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_36(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0DC42F0];
  v3 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_2;
  v7[3] = &unk_1E5B27BE8;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "instantiateWithExtension:completion:", v3, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v4;

  objc_destroyWeak(&v9);
}

void __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  _BYTE *v12;
  uint64_t v13;
  int v14;
  _BYTE *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong((id *)WeakRetained + 11, a2);
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_2_cold_2();
    }
    else if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v14 = 138543618;
        v15 = v12;
        v16 = 2114;
        v17 = v13;
        _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Completed loading extension.", (uint8_t *)&v14, 0x16u);
      }
      objc_msgSend(v12, "_didReceiveExtensionRemoteViewController:", v9);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_2_cold_1();
    }
    v12[24] = 0;
    v12[26] = 1;
  }

}

- (void)_didReceiveExtensionRemoteViewController:(id)a3
{
  id v5;
  ServiceCardContainerViewController *v6;
  ServiceCardContainerViewController *extensionRemoteCardContainerViewController;
  void *v8;
  void *v9;
  void *v10;
  ServiceCardContainerViewController *v11;
  id WeakRetained;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_extensionRemoteViewController, a3);
  v6 = objc_alloc_init(ServiceCardContainerViewController);
  extensionRemoteCardContainerViewController = self->_extensionRemoteCardContainerViewController;
  self->_extensionRemoteCardContainerViewController = v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ServiceCardContainerViewController view](self->_extensionRemoteCardContainerViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v8);

  -[ServiceCardContainerViewController setRemoteViewController:](self->_extensionRemoteCardContainerViewController, "setRemoteViewController:", v5);
  -[ServiceCardContainerViewController setChildViewController:](self->_extensionRemoteCardContainerViewController, "setChildViewController:", self->_extensionRemoteContainerViewController);
  -[ServiceCardContainerViewController presentationController](self->_extensionRemoteCardContainerViewController, "presentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  if (self->_isPreview)
  {
    v11 = self->_extensionRemoteCardContainerViewController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_storeController);
    -[SKProductRemoteViewTask _addChildController:toController:](self, "_addChildController:toController:", v11, WeakRetained);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_storeController);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", self->_extensionRemoteCardContainerViewController, 1, &__block_literal_global_41);
  }

  objc_msgSend(v5, "setDelegate:", self);
  -[SKProductRemoteViewTask _executeConfigurationActionsForExtension:](self, "_executeConfigurationActionsForExtension:", self->_extensionRemoteViewController);
  v13 = (void *)-[NSString copy](self->_logKey, "copy");
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __68__SKProductRemoteViewTask__didReceiveExtensionRemoteViewController___block_invoke_2;
  v19[3] = &unk_1E5B27B00;
  objc_copyWeak(&v21, &location);
  v14 = v13;
  v20 = v14;
  objc_msgSend(v5, "serviceViewControllerProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && self->_lookupResult && self->_cachedParameters)
  {
    -[SKProductRemoteViewTask _hostApplicationIdentifier](self, "_hostApplicationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      -[SKProductPageRemoteViewController setupWithClientBundleID:bagType:](self->_extensionRemoteViewController, "setupWithClientBundleID:bagType:", v16, 0);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB00]), "initWithLookupDictionary:", self->_lookupResult);
    v18 = (void *)-[NSDictionary mutableCopy](self->_cachedParameters, "mutableCopy");
    objc_msgSend(v18, "removeObjectForKey:", CFSTR("id"));
    objc_msgSend(v15, "clientLookupItemDidLoad:parameters:", v17, v18);

  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __68__SKProductRemoteViewTask__didReceiveExtensionRemoteViewController___block_invoke_2(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __68__SKProductRemoteViewTask__didReceiveExtensionRemoteViewController___block_invoke_2_cold_1(a1, a2);
}

- (void)_showExtensionFromUIService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id location;

  if (self->_cachedParameters && self->_lookupResult)
  {
    -[SKProductRemoteViewTask _productIDFromParameters:](self, "_productIDFromParameters:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      self->_isFetchingExtension = 1;
      v4 = (void *)-[NSDictionary copy](self->_cachedParameters, "copy");
      v5 = (void *)-[NSDictionary copy](self->_lookupResult, "copy");
      v6 = (void *)-[NSString copy](self->_logKey, "copy");
      objc_initWeak(&location, self);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __54__SKProductRemoteViewTask__showExtensionFromUIService__block_invoke;
      v10[3] = &unk_1E5B27C58;
      objc_copyWeak(&v15, &location);
      v7 = v5;
      v11 = v7;
      v12 = v3;
      v8 = v4;
      v13 = v8;
      v9 = v6;
      v14 = v9;
      -[SKProductRemoteViewTask _loadUIServiceIfNecessaryWithCompletion:](self, "_loadUIServiceIfNecessaryWithCompletion:", v10);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);

    }
    else
    {
      -[SKProductRemoteViewTask _dismissProductViewControllerWithResult:](self, "_dismissProductViewControllerWithResult:", 0);
    }

  }
}

void __54__SKProductRemoteViewTask__showExtensionFromUIService__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__SKProductRemoteViewTask__showExtensionFromUIService__block_invoke_2;
    v10[3] = &unk_1E5B27B50;
    objc_copyWeak(&v11, (id *)(a1 + 64));
    objc_msgSend(v3, "showPageForLookupResult:productID:parameters:logKey:completion:", v6, v7, v8, v9, v10);
    objc_destroyWeak(&v11);
  }
  else if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 24) = 0;
  }

}

void __54__SKProductRemoteViewTask__showExtensionFromUIService__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[24] = 0;

}

- (void)_killExtensionIfNecessary
{
  NSString *logKey;
  int v4;
  SKProductRemoteViewTask *v5;
  __int16 v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_productPageExtension)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      logKey = self->_logKey;
      v4 = 138543618;
      v5 = self;
      v6 = 2114;
      v7 = logKey;
      _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Killing extension.", (uint8_t *)&v4, 0x16u);
    }
    if (self->_extensionRequest)
      -[NSExtension cancelExtensionRequestWithIdentifier:](self->_productPageExtension, "cancelExtensionRequestWithIdentifier:");
    -[NSExtension _kill:](self->_productPageExtension, "_kill:", 9);
  }
}

- (id)_keyProfileForProductLookup
{
  if (self->_isAskToBuy)
    return CFSTR("product-dv");
  else
    return CFSTR("lockup-dv");
}

- (id)_productIDFromParameters:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v3, "length")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v3, "integerValue"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SKProductRemoteViewTask _productIDFromParameters:].cold.1();
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v3, "stringValue"), (v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SKProductRemoteViewTask _productIDFromParameters:].cold.2();
LABEL_10:
    v4 = 0;
  }
LABEL_11:

  return v4;
}

- (void)_finishWithResult:(int64_t)a3
{
  NSString *logKey;
  ServiceCardContainerViewController *extensionRemoteCardContainerViewController;
  _QWORD v7[4];
  id v8[2];
  uint8_t buf[4];
  SKProductRemoteViewTask *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = logKey;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Finishing.", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  extensionRemoteCardContainerViewController = self->_extensionRemoteCardContainerViewController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SKProductRemoteViewTask__finishWithResult___block_invoke;
  v7[3] = &unk_1E5B27C80;
  objc_copyWeak(v8, (id *)buf);
  v8[1] = (id)a3;
  -[ServiceCardContainerViewController dismissViewControllerAnimated:completion:](extensionRemoteCardContainerViewController, "dismissViewControllerAnimated:completion:", 1, v7);
  objc_destroyWeak(v8);
  objc_destroyWeak((id *)buf);
}

void __45__SKProductRemoteViewTask__finishWithResult___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  int v3;
  id v4;
  void *v5;
  uint8_t v6[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Remote controller dismissed.", v6, 2u);
  }
  if (WeakRetained)
  {
    v3 = *((unsigned __int8 *)WeakRetained + 8);
    v4 = objc_loadWeakRetained(WeakRetained + 18);
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "_didFinishWithResult:", *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v4, "_didFinish");

  }
}

- (void)productPageRemoteViewController:(id)a3 finishWithResult:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSString *logKey;
  uint64_t v11;
  int v12;
  SKProductRemoteViewTask *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = logKey;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Product page finished.", (uint8_t *)&v12, 0x16u);
  }
  if (a4 > 3)
    v11 = 1;
  else
    v11 = qword_1AC0FF1B8[a4];
  -[SKProductRemoteViewTask _finishWithResult:](self, "_finishWithResult:", v11);

}

- (void)productPageRemoteViewControllerLoadDidFinish:(id)a3
{
  id v4;
  NSString *logKey;
  void *v6;
  int v7;
  SKProductRemoteViewTask *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    logKey = self->_logKey;
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = logKey;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%{public}@][%{public}@]: Product page finished loading.", (uint8_t *)&v7, 0x16u);
  }
  -[_UIResilientRemoteViewContainerViewController remoteViewController](self->_extensionRemoteContainerViewController, "remoteViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ServiceCardContainerViewController setRemoteViewController:](self->_extensionRemoteCardContainerViewController, "setRemoteViewController:", v6);

  if (!-[SKProductRemoteViewTask _isViewControllerDescendant:ofViewController:](self, "_isViewControllerDescendant:ofViewController:", self->_extensionRemoteContainerViewController, self->_extensionRemoteCardContainerViewController))-[ServiceCardContainerViewController setChildViewController:](self->_extensionRemoteCardContainerViewController, "setChildViewController:", self->_extensionRemoteContainerViewController);
}

- (void)productPageRemoteViewController:(id)a3 userDidInteractWithProduct:(unint64_t)a4
{
  id v6;
  NSString *logKey;
  id WeakRetained;
  int v9;
  SKProductRemoteViewTask *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = logKey;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Product page user did interact with product.", (uint8_t *)&v9, 0x16u);
  }
  if (a4 >= 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SKProductRemoteViewTask productPageRemoteViewController:userDidInteractWithProduct:].cold.1();
  }
  else if (self->_isClientEntitled)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_storeController);
    objc_msgSend(WeakRetained, "_userDidInteractWithProduct:", a4);

  }
}

- (void)productPageRemoteViewController:(id)a3 didTerminateWithError:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SKProductRemoteViewTask productPageRemoteViewController:didTerminateWithError:].cold.1();
  -[_UIResilientRemoteViewContainerViewController remoteViewController](self->_extensionRemoteContainerViewController, "remoteViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
    -[SKProductRemoteViewTask _finishWithResult:](self, "_finishWithResult:", 1);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[SKProductRemoteViewTask _finishWithResult:](self, "_finishWithResult:", 1);
}

- (void)loadProductWithPageDictionary:(id)a3 completionBlock:(id)a4
{
  void (**v4)(id, _QWORD, void *);
  void *v5;

  v4 = (void (**)(id, _QWORD, void *))a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    -[SKProductRemoteViewTask loadProductWithPageDictionary:completionBlock:].cold.1();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
  v4[2](v4, 0, v5);

}

- (void)loadProductWithRequest:(id)a3 completionBlock:(id)a4
{
  void (**v4)(id, _QWORD, void *);
  void *v5;

  v4 = (void (**)(id, _QWORD, void *))a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    -[SKProductRemoteViewTask loadProductWithRequest:completionBlock:].cold.1();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
  v4[2](v4, 0, v5);

}

- (void)loadProductWithURL:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *logKey;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    -[SKProductRemoteViewTask _keyProfileForProductLookup](self, "_keyProfileForProductLookup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    logKey = self->_logKey;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__SKProductRemoteViewTask_loadProductWithURL_completionBlock___block_invoke;
    v11[3] = &unk_1E5B27A88;
    objc_copyWeak(&v13, &location);
    v12 = v7;
    -[SKProductRemoteViewTask performLookupWithURL:logKey:keyProfile:completionHandler:](self, "performLookupWithURL:logKey:keyProfile:completionHandler:", v6, logKey, v8, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SKProductRemoteViewTask loadProductWithURL:completionBlock:].cold.1();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 5, 0);
    if (v7)
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);

  }
}

void __62__SKProductRemoteViewTask_loadProductWithURL_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  id *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void (*v23)(void);
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;

  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      objc_storeStrong(WeakRetained + 8, a3);
      v33 = *(_QWORD *)(a1 + 32);
      if (v33)
      {
        v23 = *(void (**)(void))(v33 + 16);
        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v5, "deepLinkURL");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "deepLinkURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "canOpenURL:", v12);

        if ((v13 & 1) == 0)
        {
          v34 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v34)
            __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke_cold_2(v34, v35, v36, v37, v38, v39, v40, v41);
          +[SKProductRemoteViewTask _unknownErrorWithUserInfo:](SKProductRemoteViewTask, "_unknownErrorWithUserInfo:", 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v8 + 8, v42);
          v43 = *(_QWORD *)(a1 + 32);
          if (v43)
            (*(void (**)(uint64_t, _QWORD, void *))(v43 + 16))(v43, 0, v42);

          goto LABEL_20;
        }
      }
      objc_msgSend(v5, "deepLinkURL");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v8[9];
      v8[9] = (id)v14;

      objc_msgSend(v5, "resultDictionary");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v8[7];
      v8[7] = (id)v16;

      *((_BYTE *)v8 + 8) = objc_msgSend(v5, "isEntitled");
      objc_msgSend(v5, "extensionBundleID");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v8[2];
      v8[2] = (id)v18;

      objc_msgSend(v5, "parameters");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v8[6];
      v8[6] = (id)v20;

      v22 = *(_QWORD *)(a1 + 32);
      if (v22)
      {
        v23 = *(void (**)(void))(v22 + 16);
LABEL_14:
        v23();
      }
    }
LABEL_20:
    objc_msgSend(v8, "_displayItemIfNeeded");
    goto LABEL_21;
  }
  v24 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v24)
    __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
  if (*(_QWORD *)(a1 + 32))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
LABEL_21:

}

- (void)setAdditionalBuyParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)-[NSString copy](self->_logKey, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__SKProductRemoteViewTask_setAdditionalBuyParameters___block_invoke;
  v8[3] = &unk_1E5B27AD8;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v8, 1);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __54__SKProductRemoteViewTask_setAdditionalBuyParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __54__SKProductRemoteViewTask_setAdditionalBuyParameters___block_invoke_cold_1(a1);
    v8 = *(_QWORD *)(a1 + 40);
    v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 40);
LABEL_7:
    objc_msgSend(v6, "setAdditionalBuyParameters:", v8);
  }

}

- (void)setAffiliateIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)-[NSString copy](self->_logKey, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SKProductRemoteViewTask_setAffiliateIdentifier___block_invoke;
  v8[3] = &unk_1E5B27AD8;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v8, 1);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __50__SKProductRemoteViewTask_setAffiliateIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __50__SKProductRemoteViewTask_setAffiliateIdentifier___block_invoke_cold_1(a1);
    v8 = *(_QWORD *)(a1 + 40);
    v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 40);
LABEL_7:
    objc_msgSend(v6, "setAffiliateIdentifier:", v8);
  }

}

- (void)setClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)-[NSString copy](self->_logKey, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__SKProductRemoteViewTask_setClientIdentifier___block_invoke;
  v8[3] = &unk_1E5B27AD8;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v8, 1);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __47__SKProductRemoteViewTask_setClientIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __47__SKProductRemoteViewTask_setClientIdentifier___block_invoke_cold_1(a1);
    v8 = *(_QWORD *)(a1 + 40);
    v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 40);
LABEL_7:
    objc_msgSend(v6, "setClientIdentifier:", v8);
  }

}

- (void)setHostBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hostApplicationOverride, a3);
}

- (id)_hostApplicationIdentifier
{
  NSString *hostApplicationOverride;
  NSString *v3;
  void *v4;

  if (self->_isClientEntitled && (hostApplicationOverride = self->_hostApplicationOverride) != 0)
  {
    v3 = hostApplicationOverride;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setCancelButtonTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)-[NSString copy](self->_logKey, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__SKProductRemoteViewTask_setCancelButtonTitle___block_invoke;
  v8[3] = &unk_1E5B27AD8;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v8, 1);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __48__SKProductRemoteViewTask_setCancelButtonTitle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __48__SKProductRemoteViewTask_setCancelButtonTitle___block_invoke_cold_1(a1);
    v8 = *(_QWORD *)(a1 + 40);
    v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 40);
LABEL_7:
    objc_msgSend(v6, "setCancelButtonTitle:", v8);
  }

}

- (void)setRightBarButtonTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)-[NSString copy](self->_logKey, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SKProductRemoteViewTask_setRightBarButtonTitle___block_invoke;
  v8[3] = &unk_1E5B27AD8;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v8, 1);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __50__SKProductRemoteViewTask_setRightBarButtonTitle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __50__SKProductRemoteViewTask_setRightBarButtonTitle___block_invoke_cold_1(a1);
    v8 = *(_QWORD *)(a1 + 40);
    v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 40);
LABEL_7:
    objc_msgSend(v6, "setRightBarButtonTitle:", v8);
  }

}

- (void)setShowsRightBarButton:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  BOOL v10;
  id location;

  objc_initWeak(&location, self);
  v5 = (void *)-[NSString copy](self->_logKey, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SKProductRemoteViewTask_setShowsRightBarButton___block_invoke;
  v7[3] = &unk_1E5B27CA8;
  objc_copyWeak(&v9, &location);
  v6 = v5;
  v8 = v6;
  v10 = a3;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v7, 1);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__SKProductRemoteViewTask_setShowsRightBarButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __50__SKProductRemoteViewTask_setShowsRightBarButton___block_invoke_cold_1(a1);
    objc_msgSend(v5, "setShowsRightBarButton:", *(unsigned __int8 *)(a1 + 48));
  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowsRightBarButton:", v8);

  }
}

- (void)setPromptString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)-[NSString copy](self->_logKey, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__SKProductRemoteViewTask_setPromptString___block_invoke;
  v8[3] = &unk_1E5B27AD8;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v8, 1);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __43__SKProductRemoteViewTask_setPromptString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __43__SKProductRemoteViewTask_setPromptString___block_invoke_cold_1(a1);
    v8 = *(_QWORD *)(a1 + 40);
    v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 40);
LABEL_7:
    objc_msgSend(v6, "setPromptString:", v8);
  }

}

- (void)setProductPageStyle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)-[NSString copy](self->_logKey, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__SKProductRemoteViewTask_setProductPageStyle___block_invoke;
  v8[3] = &unk_1E5B27AD8;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v8, 1);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __47__SKProductRemoteViewTask_setProductPageStyle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __47__SKProductRemoteViewTask_setProductPageStyle___block_invoke_cold_1(a1);
    v8 = *(_QWORD *)(a1 + 40);
    v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 40);
LABEL_7:
    objc_msgSend(v6, "setProductPageStyle:", v8);
  }

}

- (void)setShowsStoreButton:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)-[NSString copy](self->_logKey, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__SKProductRemoteViewTask_setShowsStoreButton___block_invoke;
  v8[3] = &unk_1E5B27AD8;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v8, 1);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __47__SKProductRemoteViewTask_setShowsStoreButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __47__SKProductRemoteViewTask_setShowsStoreButton___block_invoke_cold_1(a1);
    objc_msgSend(v5, "setShowsStoreButton:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  }
  else if (v6)
  {
    objc_msgSend(v6, "setShowsStoreButton:", *(_QWORD *)(a1 + 40));
  }

}

- (void)setScriptContextDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)-[NSString copy](self->_logKey, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__SKProductRemoteViewTask_setScriptContextDictionary___block_invoke;
  v8[3] = &unk_1E5B27AD8;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v8, 1);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __54__SKProductRemoteViewTask_setScriptContextDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __54__SKProductRemoteViewTask_setScriptContextDictionary___block_invoke_cold_1(a1);
    v8 = *(_QWORD *)(a1 + 40);
    v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 40);
LABEL_7:
    objc_msgSend(v6, "setScriptContextDictionary:", v8);
  }

}

- (void)setUsageContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)-[NSString copy](self->_logKey, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__SKProductRemoteViewTask_setUsageContext___block_invoke;
  v8[3] = &unk_1E5B27AD8;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v8, 1);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __43__SKProductRemoteViewTask_setUsageContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __43__SKProductRemoteViewTask_setUsageContext___block_invoke_cold_1(a1);
    v8 = *(_QWORD *)(a1 + 40);
    v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 40);
LABEL_7:
    objc_msgSend(v6, "setUsageContext:", v8);
  }

}

- (void)setAskToBuy:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  BOOL v10;
  id location;

  self->_isAskToBuy = a3;
  objc_initWeak(&location, self);
  v5 = (void *)-[NSString copy](self->_logKey, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SKProductRemoteViewTask_setAskToBuy___block_invoke;
  v7[3] = &unk_1E5B27CA8;
  objc_copyWeak(&v9, &location);
  v6 = v5;
  v8 = v6;
  v10 = a3;
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", v7, 1);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __39__SKProductRemoteViewTask_setAskToBuy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __39__SKProductRemoteViewTask_setAskToBuy___block_invoke_cold_1(a1);
    objc_msgSend(v5, "setAskToBuy:", *(unsigned __int8 *)(a1 + 48));
  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAskToBuy:", v8);

  }
}

- (void)finishImmediately
{
  -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:](self, "_addConfigurationAction:needsEntitlement:", &__block_literal_global_44, 1);
}

void __44__SKProductRemoteViewTask_finishImmediately__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  v5 = v6;
  if (v6 || (v5 = v4) != 0)
    objc_msgSend(v5, "finishImmediately");

}

+ (id)_unavailableErrorWithUserInfo:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB35C8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 5, v4);

  return v5;
}

+ (id)_unknownErrorWithUserInfo:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB35C8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storeController);
  objc_storeStrong((id *)&self->_uiServiceRemoteViewController, 0);
  objc_storeStrong((id *)&self->_extensionRemoteCardContainerViewController, 0);
  objc_storeStrong((id *)&self->_extensionRemoteViewController, 0);
  objc_storeStrong((id *)&self->_extensionRemoteContainerViewController, 0);
  objc_storeStrong((id *)&self->_configurationActions, 0);
  objc_storeStrong((id *)&self->_entitledConfigurationActions, 0);
  objc_storeStrong((id *)&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_productPageExtension, 0);
  objc_storeStrong((id *)&self->_deepLinkURL, 0);
  objc_storeStrong((id *)&self->_lookupError, 0);
  objc_storeStrong((id *)&self->_lookupResult, 0);
  objc_storeStrong((id *)&self->_cachedParameters, 0);
  objc_storeStrong((id *)&self->_hostApplicationOverride, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_extensionID, 0);
}

- (void)performLookupWithIdentifier:(NSString *)a3 parameters:(NSDictionary *)a4 logKey:(NSString *)a5 keyProfile:(NSString *)a6 completionHandler:(id)a7
{
  void *v12;
  _QWORD *v13;
  NSString *v14;
  NSDictionary *v15;
  NSString *v16;
  NSString *v17;
  SKProductRemoteViewTask *v18;

  v12 = _Block_copy(a7);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = self;
  sub_1AC0845B0((uint64_t)&unk_1EEC66638, (uint64_t)v13);
}

- (void)performLookupWithURL:(NSURL *)a3 logKey:(NSString *)a4 keyProfile:(NSString *)a5 completionHandler:(id)a6
{
  void *v10;
  _QWORD *v11;
  NSURL *v12;
  NSString *v13;
  NSString *v14;
  SKProductRemoteViewTask *v15;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_1AC0845B0((uint64_t)&unk_1EEC665E8, (uint64_t)v11);
}

void __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1ABFBE000, MEMORY[0x1E0C81028], a3, "Product task deallocated.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_17_2();
}

void __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1ABFBE000, MEMORY[0x1E0C81028], a3, "Unable to display product ID.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_17_2();
}

void __38__SKProductRemoteViewTask_setPreview___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: Set preview: %{public}@.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_8_1();
}

- (void)_addConfigurationAction:needsEntitlement:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: Unable to add action.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

- (void)_addConfigurationAction:needsEntitlement:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: Rejecting action for unentitled client.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __68__SKProductRemoteViewTask__addConfigurationAction_needsEntitlement___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_16_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: Error retrieving view service: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_8_1();
}

void __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_16_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: Could not get remote view controller: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_8_1();
}

- (void)_showExtensionWithID:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: Extension not provided.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

- (void)_showExtensionWithID:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_3_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: Could not find extension: %{public}@.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_8_1();
}

void __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_16_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: Could not get remote view controller.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_2_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_16_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: Could not instantiate extension: %{public}@.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_8_1();
}

void __68__SKProductRemoteViewTask__didReceiveExtensionRemoteViewController___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (id *)(a1 + 40);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);

  OUTLINED_FUNCTION_3_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v5, "[%{public}@][%{public}@]: Could not get extension service proxy: %{public}@.", v6, v7, v8, v9, 2u);
}

- (void)_productIDFromParameters:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: No ID provided for product.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

- (void)_productIDFromParameters:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: Invalid format for product ID.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

- (void)productPageRemoteViewController:userDidInteractWithProduct:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: Invalid SKProductPageExtensionInteractionType: %lu", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_8_1();
}

- (void)productPageRemoteViewController:didTerminateWithError:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_3_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: Remote controller terminated with error: %{public}@.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_8_1();
}

- (void)loadProductWithPageDictionary:completionBlock:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_19_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: Deprecated method: %{public}s.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_8_1();
}

- (void)loadProductWithRequest:completionBlock:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_19_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: Deprecated method: %{public}s.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_8_1();
}

- (void)loadProductWithURL:completionBlock:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@][%{public}@]: No URL for product lookup.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __54__SKProductRemoteViewTask_setAdditionalBuyParameters___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v2, "[%{public}@][%{public}@]: Set additional buy params: %{public}@.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5_0();
}

void __50__SKProductRemoteViewTask_setAffiliateIdentifier___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v2, "[%{public}@][%{public}@]: Set affiliate identifier: %{public}@.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5_0();
}

void __47__SKProductRemoteViewTask_setClientIdentifier___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v2, "[%{public}@][%{public}@]: Set client identifier: %{public}@.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5_0();
}

void __48__SKProductRemoteViewTask_setCancelButtonTitle___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v2, "[%{public}@][%{public}@]: Set cancel button title: %{public}@.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5_0();
}

void __50__SKProductRemoteViewTask_setRightBarButtonTitle___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v2, "[%{public}@][%{public}@]: Set right bar button title: %{public}@.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5_0();
}

void __50__SKProductRemoteViewTask_setShowsRightBarButton___block_invoke_cold_1(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = OUTLINED_FUNCTION_20_2(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_18_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v2, "[%{public}@][%{public}@]: Set shows right bar button: %{BOOL}d.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5_0();
}

void __43__SKProductRemoteViewTask_setPromptString___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v2, "[%{public}@][%{public}@]: Set prompt string: %{public}@.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5_0();
}

void __47__SKProductRemoteViewTask_setProductPageStyle___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v2, "[%{public}@][%{public}@]: Set product page style: %{public}@.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5_0();
}

void __47__SKProductRemoteViewTask_setShowsStoreButton___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v2, "[%{public}@][%{public}@]: Set shows store: %{public}@.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5_0();
}

void __54__SKProductRemoteViewTask_setScriptContextDictionary___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v2, "[%{public}@][%{public}@]: Set context dictionary: %{public}@.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5_0();
}

void __43__SKProductRemoteViewTask_setUsageContext___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1ABFBE000, MEMORY[0x1E0C81028], v2, "[%{public}@][%{public}@]: Set usage context: %{public}@.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5_0();
}

void __39__SKProductRemoteViewTask_setAskToBuy___block_invoke_cold_1(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = OUTLINED_FUNCTION_20_2(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_18_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v2, "[%{public}@][%{public}@]: Set ATB: %{BOOL}d.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5_0();
}

@end
