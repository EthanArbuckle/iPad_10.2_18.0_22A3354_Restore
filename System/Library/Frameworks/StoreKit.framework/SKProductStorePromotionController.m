@implementation SKProductStorePromotionController

+ (SKProductStorePromotionController)defaultController
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)defaultController_defaultController;
  if (!defaultController_defaultController)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)defaultController_defaultController;
    defaultController_defaultController = (uint64_t)v4;

    v3 = (void *)defaultController_defaultController;
  }
  return (SKProductStorePromotionController *)v3;
}

- (void)fetchStorePromotionVisibilityForProduct:(SKProduct *)product completionHandler:(void *)completionHandler
{
  SKProduct *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = product;
  v6 = completionHandler;
  if (v6)
  {
    -[SKProduct productIdentifier](v5, "productIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __95__SKProductStorePromotionController_fetchStorePromotionVisibilityForProduct_completionHandler___block_invoke;
      v17[3] = &unk_1E5B26C08;
      v10 = v6;
      v18 = v10;
      objc_msgSend(v8, "storeKitServiceWithErrorHandler:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0C99E60];
      -[SKProduct productIdentifier](v5, "productIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __95__SKProductStorePromotionController_fetchStorePromotionVisibilityForProduct_completionHandler___block_invoke_2;
      v15[3] = &unk_1E5B26C80;
      v16 = v10;
      objc_msgSend(v11, "promotionInfoForProductIdentifiers:client:reply:", v14, 0, v15);

    }
  }

}

void __95__SKProductStorePromotionController_fetchStorePromotionVisibilityForProduct_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  _SKErrorFromNSError(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

}

void __95__SKProductStorePromotionController_fetchStorePromotionVisibilityForProduct_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = v5;
    _SKErrorFromNSError(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  else
  {
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C9AA70];
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", 0x1E5B2E6E0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    if (v10 < 0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", 0x1E5B2E6E0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (int)objc_msgSend(v11, "intValue");

    }
    v7 = 0;
  }

  v12 = *(_QWORD *)(a1 + 32);
  _SKErrorFromNSError(v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v8, v13);

}

- (void)updateStorePromotionVisibility:(SKProductStorePromotionVisibility)promotionVisibility forProduct:(SKProduct *)product completionHandler:(void *)completionHandler
{
  SKProduct *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  void *v23;
  void *v24;
  __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = product;
  v8 = completionHandler;
  -[SKProduct productIdentifier](v7, "productIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __97__SKProductStorePromotionController_updateStorePromotionVisibility_forProduct_completionHandler___block_invoke;
    v21[3] = &unk_1E5B26C08;
    v12 = v8;
    v22 = v12;
    objc_msgSend(v10, "storeKitServiceWithErrorHandler:", v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = CFSTR("vis");
    -[SKProduct productIdentifier](v7, "productIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", promotionVisibility);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __97__SKProductStorePromotionController_updateStorePromotionVisibility_forProduct_completionHandler___block_invoke_2;
    v19[3] = &unk_1E5B26C08;
    v20 = v12;
    objc_msgSend(v13, "setPromotionInfo:forClient:reply:", v17, 0, v19);

    v18 = v22;
LABEL_7:

    goto LABEL_8;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SKProductStorePromotionController updateStorePromotionVisibility:forProduct:completionHandler:].cold.1();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v8 + 2))(v8, v18);
    goto LABEL_7;
  }
LABEL_8:

}

void __97__SKProductStorePromotionController_updateStorePromotionVisibility_forProduct_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    _SKErrorFromNSError(a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __97__SKProductStorePromotionController_updateStorePromotionVisibility_forProduct_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    _SKErrorFromNSError(a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void)fetchStorePromotionOrderWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = completionHandler;
  if (v4)
  {
    +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__SKProductStorePromotionController_fetchStorePromotionOrderWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E5B26C08;
    v7 = v4;
    v12 = v7;
    objc_msgSend(v5, "storeKitServiceWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __83__SKProductStorePromotionController_fetchStorePromotionOrderWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E5B26CA8;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "promotionInfoForProductIdentifiers:client:reply:", 0, 0, v9);

  }
}

void __83__SKProductStorePromotionController_fetchStorePromotionOrderWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  _SKErrorFromNSError(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, MEMORY[0x1E0C9AA60], v3);

}

void __83__SKProductStorePromotionController_fetchStorePromotionOrderWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[4];
  id v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__SKProductStorePromotionController_fetchStorePromotionOrderWithCompletionHandler___block_invoke_3;
    block[3] = &unk_1E5B26970;
    v23 = *(id *)(a1 + 40);
    v22 = v6;
    dispatch_async(v7, block);

    v8 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", SKPaymentOptionLegacyOfferName);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", 0x1E5B2E6C0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v16, "integerValue") & 0x8000000000000000) == 0
            && objc_msgSend(v15, "length"))
          {
            objc_msgSend(v8, "addObject:", v15);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
      }
      while (v11);
    }

    objc_msgSend(*(id *)(a1 + 32), "_fetchProductsForPromotionOrder:completionHandler:", v8, *(_QWORD *)(a1 + 40));
    v6 = 0;
  }

}

void __83__SKProductStorePromotionController_fetchStorePromotionOrderWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  _SKErrorFromNSError(*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, MEMORY[0x1E0C9AA60], v2);

}

- (void)updateStorePromotionOrder:(NSArray *)promotionOrder completionHandler:(void *)completionHandler
{
  NSArray *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __CFString *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = promotionOrder;
  v6 = completionHandler;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v5;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v13, "productIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "productIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v10);
  }

  v30 = CFSTR("ord");
  v31 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __81__SKProductStorePromotionController_updateStorePromotionOrder_completionHandler___block_invoke;
  v24[3] = &unk_1E5B26C08;
  v19 = v6;
  v25 = v19;
  objc_msgSend(v17, "storeKitServiceWithErrorHandler:", v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v18;
  v22[1] = 3221225472;
  v22[2] = __81__SKProductStorePromotionController_updateStorePromotionOrder_completionHandler___block_invoke_2;
  v22[3] = &unk_1E5B26C08;
  v23 = v19;
  v21 = v19;
  objc_msgSend(v20, "setPromotionInfo:forClient:reply:", v16, 0, v22);

}

void __81__SKProductStorePromotionController_updateStorePromotionOrder_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    _SKErrorFromNSError(a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __81__SKProductStorePromotionController_updateStorePromotionOrder_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    _SKErrorFromNSError(a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void)_fetchProductsForPromotionOrder:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  SKProductsRequest *v7;
  void *v8;
  SKProductsRequest *v9;
  void *v10;
  id v11;
  SKProductsRequest *v12;
  NSObject *v13;
  _QWORD v14[4];
  SKProductsRequest *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  uint8_t buf[4];
  SKProductsRequest *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = [SKProductsRequest alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SKProductsRequest initWithProductIdentifiers:](v7, "initWithProductIdentifiers:", v8);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v9;
      v22 = 2114;
      v23 = v10;
      _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Starting products request %{public}@ for promotion order %{public}@", buf, 0x16u);

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_10;
    v14[3] = &unk_1E5B26CF8;
    v15 = v9;
    v17 = v6;
    v16 = v5;
    v11 = v6;
    v12 = v9;
    -[SKProductsRequest _startWithCompletionHandler:](v12, "_startWithCompletionHandler:", v14);

  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke;
    block[3] = &unk_1E5B26758;
    v19 = v6;
    v12 = (SKProductsRequest *)v6;
    dispatch_async(v13, block);

    v11 = v19;
  }

}

uint64_t __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id obj;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD block[4];
  id v36;
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v40 = v7;
    v41 = 2114;
    v42 = v5;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Finished products request %{public}@ with response %{public}@", buf, 0x16u);
  }
  if (v6
    || (objc_msgSend(v5, "products"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        !v11))
  {
    dispatch_get_global_queue(21, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_11;
    block[3] = &unk_1E5B26970;
    v37 = *(id *)(a1 + 48);
    v36 = v6;
    dispatch_async(v8, block);

    v9 = v37;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v24 = a1;
    obj = *(id *)(a1 + 40);
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      v15 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v5, "products");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = v15;
          v30[1] = 3221225472;
          v30[2] = __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_2;
          v30[3] = &unk_1E5B26CD0;
          v30[4] = v17;
          v19 = objc_msgSend(v18, "indexOfObjectPassingTest:", v30);

          if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v5, "products");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v21);

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v13);
    }

    dispatch_get_global_queue(21, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_3;
    v27[3] = &unk_1E5B26970;
    v23 = *(id *)(v24 + 48);
    v28 = v25;
    v29 = v23;
    v9 = v25;
    dispatch_async(v22, v27);

  }
}

void __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_11(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  _SKErrorFromNSError(*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, MEMORY[0x1E0C9AA60], v2);

}

uint64_t __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "productIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)_clearPromotionInfo
{
  void *v2;
  id v3;

  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeKitSynchronousServiceWithErrorHandler:", &__block_literal_global_4);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setPromotionInfo:forClient:reply:", 0, 0, &__block_literal_global_23);
}

void __65__SKProductStorePromotionController_Private___clearPromotionInfo__block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __65__SKProductStorePromotionController_Private___clearPromotionInfo__block_invoke_cold_1(a2);
}

- (void)updateStorePromotionVisibility:forProduct:completionHandler:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Product ID not provided.", v0, 2u);
}

void __65__SKProductStorePromotionController_Private___clearPromotionInfo__block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Finished with error %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
