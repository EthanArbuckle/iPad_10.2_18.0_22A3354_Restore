@implementation CPSOpenClipCardPresenter

+ (id)sharedPresenter
{
  if (sharedPresenter_onceToken != -1)
    dispatch_once(&sharedPresenter_onceToken, &__block_literal_global_11);
  return (id)sharedPresenter_presenter;
}

void __43__CPSOpenClipCardPresenter_sharedPresenter__block_invoke()
{
  CPSOpenClipCardPresenter *v0;
  void *v1;

  v0 = objc_alloc_init(CPSOpenClipCardPresenter);
  v1 = (void *)sharedPresenter_presenter;
  sharedPresenter_presenter = (uint64_t)v0;

}

- (CPSOpenClipCardPresenter)init
{
  CPSOpenClipCardPresenter *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  CPSOpenClipCardPresenter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPSOpenClipCardPresenter;
  v2 = -[CPSOpenClipCardPresenter init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ClipServices.OpenClipCardPresenter", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)showCardWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__CPSOpenClipCardPresenter_showCardWithURL_completionHandler___block_invoke;
  v10[3] = &unk_24C3B9350;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CPSOpenClipCardPresenter _showCardWithOptions:activationHandler:completionHandler:](self, "_showCardWithOptions:activationHandler:completionHandler:", 119, v10, v8);

}

uint64_t __62__CPSOpenClipCardPresenter_showCardWithURL_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateAlertHandleWithURL:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)showLocationConfirmationSheetWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  NSObject *queue;
  id v13;
  _QWORD block[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke;
  v16[3] = &unk_24C3B9350;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (void *)MEMORY[0x20BD30A54](v16);
  queue = self->_queue;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_10;
  block[3] = &unk_24C3B93C8;
  block[4] = self;
  v15 = v11;
  v13 = v11;
  dispatch_async(queue, block);

}

void __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v2 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_2;
  v7[3] = &unk_24C3BA7A8;
  v3 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_8;
  v5[3] = &unk_24C3B9AD8;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_showCardWithOptions:activationHandler:completionHandler:", 33, v7, v5);

}

void __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v4)
  {
    v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_2_cold_1((uint64_t)v4, v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BE0BE40]);
    objc_msgSend(v6, "setObject:forSetting:", v3, 0);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_5;
    v8[3] = &unk_24C3BA780;
    v7 = *(void **)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v7, "_activateAlertHandleWithSettings:viewControllerClassName:repsonseHandler:", v6, CFSTR("CPSLocationAlertViewController"), v8);

  }
}

void __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a2, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v4, "integerValue"));
  }
  else
  {
    v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_5_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }

}

uint64_t __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_8(uint64_t result, char a2)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((a2 & 1) == 0)
  {
    v2 = result;
    v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_8_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
  }
  return result;
}

void __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8) || *(_QWORD *)(v2 + 16))
  {
    v3 = MEMORY[0x20BD30A54](*(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)_performStagedLocationConfirmationDisplayIfNeeded
{
  id stagedLocationConfirmationDisplay;
  void (**v4)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_stagedLocationConfirmationDisplay && !self->_alertHandle && !self->_sharingClient)
  {
    v4 = (void (**)(void))MEMORY[0x20BD30A54]();
    stagedLocationConfirmationDisplay = self->_stagedLocationConfirmationDisplay;
    self->_stagedLocationConfirmationDisplay = 0;

    v4[2]();
  }
}

- (void)_showCardWithOptions:(unint64_t)a3 activationHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke;
  v13[3] = &unk_24C3BA820;
  v13[4] = self;
  v14 = v9;
  v11 = v9;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  v15 = v8;
  v12 = v8;
  dispatch_async(queue, v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (*(_QWORD *)(v2 + 16))
  {
    v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BE900E8]);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 16);
    *(_QWORD *)(v12 + 16) = v11;

    v14 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_12;
    v21[3] = &unk_24C3B9950;
    objc_copyWeak(&v22, (id *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInvalidationHandler:", v21);
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v16 = *(_QWORD *)(a1 + 64);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_2;
    v17[3] = &unk_24C3BA7F8;
    objc_copyWeak(&v20, (id *)(a1 + 56));
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 40);
    objc_msgSend(v15, "startProxCardTransactionWithOptions:completion:", v16, v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
  }
}

void __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_12(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_sharingClientDidInvalidate");
    WeakRetained = v2;
  }

}

void __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_2(id *a1, char a2)
{
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[3];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_3;
    v8[3] = &unk_24C3BA7D0;
    v11 = a2;
    v7 = a1[4];
    v8[4] = v5;
    v9 = v7;
    v10 = a1[5];
    dispatch_async(v6, v8);

  }
}

uint64_t __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_invalidateSharingClient");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_activateAlertHandleWithSettings:(id)a3 viewControllerClassName:(id)a4 repsonseHandler:(id)a5
{
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  SBSRemoteAlertHandle *v15;
  SBSRemoteAlertHandle *alertHandle;
  id v17;
  id v18;

  queue = self->_queue;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  dispatch_assert_queue_V2(queue);
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB0AE8]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.ClipViewService"), v10);

  v12 = objc_alloc_init(MEMORY[0x24BEB0AD0]);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BD80]), "initWithInfo:timeout:forResponseOnQueue:withHandler:", v11, self->_queue, v9, 0.0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActions:", v14);

  v15 = (SBSRemoteAlertHandle *)objc_msgSend(MEMORY[0x24BEB0AF8], "newHandleWithDefinition:configurationContext:", v18, v12);
  alertHandle = self->_alertHandle;
  self->_alertHandle = v15;

  -[SBSRemoteAlertHandle addObserver:](self->_alertHandle, "addObserver:", self);
  v17 = objc_alloc_init(MEMORY[0x24BEB0AC8]);
  -[SBSRemoteAlertHandle activateWithContext:](self->_alertHandle, "activateWithContext:", v17);

}

- (void)_activateAlertHandleWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BE0BE40];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setObject:forSetting:", v8, 0);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__CPSOpenClipCardPresenter__activateAlertHandleWithURL_completionHandler___block_invoke;
  v11[3] = &unk_24C3BA780;
  v12 = v6;
  v10 = v6;
  -[CPSOpenClipCardPresenter _activateAlertHandleWithSettings:viewControllerClassName:repsonseHandler:](self, "_activateAlertHandleWithSettings:viewControllerClassName:repsonseHandler:", v9, CFSTR("CPSAlertViewController"), v11);

}

uint64_t __74__CPSOpenClipCardPresenter__activateAlertHandleWithURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flagForSetting:", 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)responseForOpenClipAction:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v4, "setFlag:forSetting:", v3, 0);
  objc_msgSend(MEMORY[0x24BE0BD90], "responseWithInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CPSOpenClipCardPresenter *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__CPSOpenClipCardPresenter_remoteAlertHandleDidDeactivate___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __59__CPSOpenClipCardPresenter_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateSharingClient");
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  CPSOpenClipCardPresenter *v10;

  v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__CPSOpenClipCardPresenter_remoteAlertHandle_didInvalidateWithError___block_invoke;
  v8[3] = &unk_24C3B94D0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __69__CPSOpenClipCardPresenter_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;

  result = objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 8);
  if (v4 == *(void **)(a1 + 32))
  {
    *(_QWORD *)(v3 + 8) = 0;

    objc_msgSend(*(id *)(a1 + 40), "_invalidateSharingClient");
    return objc_msgSend(*(id *)(a1 + 40), "_performStagedLocationConfirmationDisplayIfNeeded");
  }
  return result;
}

- (void)_invalidateSharingClient
{
  SFClient *sharingClient;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sharingClient = self->_sharingClient;
  if (sharingClient)
    -[SFClient invalidate](sharingClient, "invalidate");
}

- (void)_sharingClientDidInvalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CPSOpenClipCardPresenter__sharingClientDidInvalidate__block_invoke;
  block[3] = &unk_24C3B94A8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__CPSOpenClipCardPresenter__sharingClientDidInvalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_performStagedLocationConfirmationDisplayIfNeeded");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stagedLocationConfirmationDisplay, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sharingClient, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
}

void __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20AD44000, a2, OS_LOG_TYPE_ERROR, "Fail to encode location request with error: %@", (uint8_t *)&v2, 0xCu);
}

void __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_5_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, a1, a3, "Fail to parse the result from remote alert for location confirmation with error", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_8_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, a1, a3, "Unable to proceed with presentation of location confirmation UI.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, a1, a3, "There is already a sharing client on flight, bail out.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

@end
