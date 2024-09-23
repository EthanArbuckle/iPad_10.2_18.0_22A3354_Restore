@implementation NPKExpressModeSettingsCoordinator

- (NPKExpressModeSettingsCoordinator)initWithExpressPassController:(id)a3 workQueue:(id)a4 callbackQueue:(id)a5
{
  id v9;
  id v10;
  NPKExpressModeSettingsCoordinator *v11;
  NPKExpressModeSettingsCoordinator *v12;
  uint64_t v13;
  NSMutableDictionary *previousPassStates;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  NPKExpressState *v22;
  const char *v23;
  NSObject *workQueue;
  id v26;
  _QWORD handler[4];
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v26 = a4;
  v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)NPKExpressModeSettingsCoordinator;
  v11 = -[NPKExpressModeSettingsCoordinator init](&v34, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_expressPassController, a3);
    objc_storeStrong((id *)&v12->_workQueue, a4);
    objc_storeStrong((id *)&v12->_callbackQueue, a5);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    previousPassStates = v12->_previousPassStates;
    v12->_previousPassStates = (NSMutableDictionary *)v13;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v9, "enabledExpressPasses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v20, "passUniqueIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[NPKExpressState initWithExpressPassConfiguration:]([NPKExpressState alloc], "initWithExpressPassConfiguration:", v20);
          -[NSMutableDictionary setObject:forKey:](v12->_previousPassStates, "setObject:forKey:", v22, v21);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v17);
    }

    objc_initWeak(&location, v12);
    v23 = (const char *)objc_msgSend((id)*MEMORY[0x24BE6F268], "UTF8String");
    workQueue = v12->_workQueue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __91__NPKExpressModeSettingsCoordinator_initWithExpressPassController_workQueue_callbackQueue___block_invoke;
    handler[3] = &unk_24CFE78F0;
    objc_copyWeak(&v28, &location);
    notify_register_dispatch(v23, &v12->_notifyToken, workQueue, handler);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __91__NPKExpressModeSettingsCoordinator_initWithExpressPassController_workQueue_callbackQueue___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[8] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleExpressStateChange");
    WeakRetained = v2;
  }

}

- (BOOL)isExpressMode:(unint64_t)a3 supportedForPass:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  char v9;
  BOOL v10;

  v6 = a4;
  v7 = -[NPKExpressModeSettingsCoordinator _isNFCExpressModeSupportedForPass:](self, "_isNFCExpressModeSupportedForPass:", v6);
  objc_msgSend(v6, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "npkSupportsBluetooth");
  if (a3 == 2)
    v10 = v9;
  else
    v10 = v7;
  if (a3 == 3)
    return v7 | v9;
  else
    return v10;
}

- (BOOL)inSessionExpressEnabledForPass:(id)a3
{
  id v4;
  PKExpressPassController *expressPassController;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  expressPassController = self->_expressPassController;
  objc_msgSend(v4, "secureElementPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExpressPassController existingExpressPassConfigurationForPass:](expressPassController, "existingExpressPassConfigurationForPass:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v7, "passInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__NPKExpressModeSettingsCoordinator_inSessionExpressEnabledForPass___block_invoke;
  v10[3] = &unk_24CFECCB0;
  v10[4] = &v11;
  objc_msgSend(v8, "enumerateCredentialsWithHandler:", v10);

  LOBYTE(v8) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v8;
}

void __68__NPKExpressModeSettingsCoordinator_inSessionExpressEnabledForPass___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "supportsInSessionExpress"))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
          *a4 = 1;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)needUpgradeForPass:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(a3, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[PKExpressPassController hasEligibleExpressUpgradeRequestForPass:](self->_expressPassController, "hasEligibleExpressUpgradeRequestForPass:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)expressStateForPass:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  id location;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__22;
  v18 = __Block_byref_object_dispose__22;
  v19 = 0;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__NPKExpressModeSettingsCoordinator_expressStateForPass___block_invoke;
  v9[3] = &unk_24CFEBCD0;
  objc_copyWeak(&v12, &location);
  v10 = v4;
  v11 = &v14;
  v6 = v4;
  dispatch_sync(workQueue, v9);
  v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __57__NPKExpressModeSettingsCoordinator_expressStateForPass___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_expressStateForPassWithUniqueID:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)eligibleExpressUpgradeRequestsForPass:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKExpressPassController eligibleExpressUpgradeRequestsForPass:](self->_expressPassController, "eligibleExpressUpgradeRequestsForPass:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (id)expressAppletIdentifiersForPass:(id)a3
{
  PKExpressPassController *expressPassController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  expressPassController = self->_expressPassController;
  objc_msgSend(a3, "secureElementPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExpressPassController existingExpressPassConfigurationForPass:](expressPassController, "existingExpressPassConfigurationForPass:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "passInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "passInformation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "npk_expressAppletIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)enableExpressForPass:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  OS_dispatch_queue *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  OS_dispatch_queue *v20;
  id v21;
  id v22[2];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Received request to enable express for %@", buf, 0xCu);

    }
  }
  v14 = self->_workQueue;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__NPKExpressModeSettingsCoordinator_enableExpressForPass_mode_completionHandler___block_invoke;
  block[3] = &unk_24CFECD28;
  objc_copyWeak(v22, (id *)buf);
  v20 = v14;
  v21 = v9;
  v22[1] = (id)a4;
  v19 = v8;
  v15 = v14;
  v16 = v8;
  v17 = v9;
  dispatch_async(v15, block);

  objc_destroyWeak(v22);
  objc_destroyWeak((id *)buf);

}

void __81__NPKExpressModeSettingsCoordinator_enableExpressForPass_mode_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, char);
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = MEMORY[0x2199B6780](*(_QWORD *)(a1 + 48));
  v4 = (void *)*((_QWORD *)WeakRetained + 8);
  *((_QWORD *)WeakRetained + 8) = v3;

  objc_storeStrong((id *)WeakRetained + 5, *(id *)(a1 + 32));
  v5 = objc_msgSend(WeakRetained, "_newExpressStateForMode:pass:enable:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), 1);
  v6 = (void *)*((_QWORD *)WeakRetained + 6);
  *((_QWORD *)WeakRetained + 6) = v5;

  *((_BYTE *)WeakRetained + 8) = 1;
  objc_msgSend(*(id *)(a1 + 32), "paymentPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __81__NPKExpressModeSettingsCoordinator_enableExpressForPass_mode_completionHandler___block_invoke_2;
  v13 = &unk_24CFECD00;
  v14 = *(id *)(a1 + 40);
  v15 = WeakRetained;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 64);
  v16 = v8;
  v17 = v9;
  objc_msgSend(WeakRetained, "_checkForConflictsInEnablingExpressForPass:completion:", v7, &v10);

  objc_msgSend(WeakRetained, "_handleExpressStateChange", v10, v11, v12, v13);
}

void __81__NPKExpressModeSettingsCoordinator_enableExpressForPass_mode_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  char v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __81__NPKExpressModeSettingsCoordinator_enableExpressForPass_mode_completionHandler___block_invoke_3;
  v6[3] = &unk_24CFECCD8;
  v9 = a2;
  v3 = *(NSObject **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v4;
  v8 = v5;
  dispatch_async(v3, v6);

}

void __81__NPKExpressModeSettingsCoordinator_enableExpressForPass_mode_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v3;

  v1 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "paymentPass");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_requestUserAuthenticationForPass:withExpressMode:", v3, *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleUserCancelled");
  }
}

- (void)disableExpressForPass:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  OS_dispatch_queue *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  OS_dispatch_queue *v20;
  id v21;
  id v22[2];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Received request to disable express for %@", buf, 0xCu);

    }
  }
  v14 = self->_workQueue;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke;
  block[3] = &unk_24CFECD28;
  objc_copyWeak(v22, (id *)buf);
  v20 = v14;
  v21 = v9;
  v22[1] = (id)a4;
  v19 = v8;
  v15 = v14;
  v16 = v8;
  v17 = v9;
  dispatch_async(v15, block);

  objc_destroyWeak(v22);
  objc_destroyWeak((id *)buf);

}

void __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = MEMORY[0x2199B6780](*(_QWORD *)(a1 + 48));
  v4 = (void *)*((_QWORD *)WeakRetained + 8);
  *((_QWORD *)WeakRetained + 8) = v3;

  objc_storeStrong((id *)WeakRetained + 5, *(id *)(a1 + 32));
  v5 = (void *)objc_msgSend(WeakRetained, "_newExpressStateForMode:pass:enable:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), 0);
  objc_storeStrong((id *)WeakRetained + 6, v5);
  v6 = MEMORY[0x24BDAC760];
  *((_BYTE *)WeakRetained + 8) = 1;
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_2;
  v22[3] = &unk_24CFE7E40;
  v23 = *(id *)(a1 + 40);
  v24 = WeakRetained;
  v7 = (void *)MEMORY[0x2199B6780](v22);
  v8 = (void *)*((_QWORD *)WeakRetained + 2);
  objc_msgSend(*(id *)(a1 + 32), "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "expressModeSupportedForPass:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE6EAE8]), "initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:", v10, (unint64_t)objc_msgSend(v5, "nfcExpressState") < 2, (unint64_t)objc_msgSend(v5, "uwbExpressState") < 2)) != 0)
  {
    v12 = (id)v11;
    v13 = (void *)*((_QWORD *)WeakRetained + 2);
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_4;
    v20[3] = &unk_24CFEC088;
    v21 = v7;
    v14 = v7;
    objc_msgSend(v13, "setExpressModeWithPassConfiguration:credential:completion:", v12, 0, v20);

  }
  else
  {
    v15 = (void *)*((_QWORD *)WeakRetained + 2);
    objc_msgSend(*(id *)(a1 + 32), "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_5;
    v18[3] = &unk_24CFEC088;
    v19 = v7;
    v12 = v7;
    objc_msgSend(v15, "disableExpressModeForPassesWithUniqueIdentifiers:withCompletion:", v17, v18);

    v14 = v19;
  }

}

void __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_3;
  block[3] = &unk_24CFE7998;
  v1 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleExpressStateChange");
  return objc_msgSend(*(id *)(a1 + 32), "_invokeCompletionHandlerWithSuccess:", 1);
}

uint64_t __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_isNFCExpressModeSupportedForPass:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint8_t v11[16];

  objc_msgSend(a3, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKExpressPassController expressModeSupportedForPass:](self->_expressPassController, "expressModeSupportedForPass:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = 1;
    else
      v6 = -[PKExpressPassController hasEligibleExpressUpgradeRequestForPass:](self->_expressPassController, "hasEligibleExpressUpgradeRequestForPass:", v4);

  }
  else
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    v6 = 0;
    if (v8)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Warning: Cannot check _isNFCExpressModeSupportedForPass for nil pass", v11, 2u);
      }

      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_isExpressMode:(unint64_t)a3 supportedForPassWithUniqueID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[NPKExpressModeSettingsCoordinator passDataSource](self, "passDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passForUniqueID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = -[NPKExpressModeSettingsCoordinator isExpressMode:supportedForPass:](self, "isExpressMode:supportedForPass:", a3, v8);
  return a3;
}

- (id)_newExpressStateForMode:(unint64_t)a3 pass:(id)a4 enable:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *workQueue;
  id v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  unint64_t v15;
  PKExpressPassController *expressPassController;
  void *v17;
  void *v18;
  uint64_t v19;
  NPKExpressState *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a5;
  workQueue = self->_workQueue;
  v9 = a4;
  dispatch_assert_queue_V2(workQueue);
  v10 = -[NPKExpressModeSettingsCoordinator needUpgradeForPass:](self, "needUpgradeForPass:", v9);
  v11 = 2;
  if (v5)
    v12 = v10;
  else
    v12 = 2;
  objc_msgSend(v9, "secureElementPass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isCarKeyPass");

  if (((a3 == 2) & v14) != 0)
    v15 = 3;
  else
    v15 = a3;
  expressPassController = self->_expressPassController;
  objc_msgSend(v9, "secureElementPass");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKExpressPassController existingExpressPassConfigurationForPass:](expressPassController, "existingExpressPassConfigurationForPass:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 2;
  if (v18)
  {
    v19 = 2;
    if (objc_msgSend(v18, "isNFCExpressEnabled"))
      v11 = 0;
    else
      v11 = 2;
    if (objc_msgSend(v18, "isUWBExpressEnabled"))
      v19 = 0;
  }
  switch(v15)
  {
    case 3uLL:
      v20 = [NPKExpressState alloc];
      v21 = v12;
LABEL_19:
      v22 = v12;
      goto LABEL_20;
    case 2uLL:
      v20 = [NPKExpressState alloc];
      v21 = v11;
      goto LABEL_19;
    case 1uLL:
      v20 = [NPKExpressState alloc];
      v21 = v12;
      v22 = v19;
LABEL_20:
      v11 = -[NPKExpressState initWithNFCState:uwbState:](v20, "initWithNFCState:uwbState:", v21, v22);
      break;
  }

  return (id)v11;
}

- (void)_checkForConflictsInEnablingExpressForPass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  OS_dispatch_queue *v14;
  PKExpressPassController *expressPassController;
  OS_dispatch_queue *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  OS_dispatch_queue *v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Checking for conflicts when enabling express for %@", buf, 0xCu);

    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[PKExpressPassController existingExpressPassConfigurationForPass:](self->_expressPassController, "existingExpressPassConfigurationForPass:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[PKExpressPassController expressModeSupportedForPass:](self->_expressPassController, "expressModeSupportedForPass:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EAE8]), "initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:", v13, -[NPKExpressState nfcExpressState](self->_currentState, "nfcExpressState") < 2, -[NPKExpressState uwbExpressState](self->_currentState, "uwbExpressState") < 2);
    else
      v12 = 0;

  }
  v14 = self->_callbackQueue;
  objc_initWeak((id *)buf, self);
  expressPassController = self->_expressPassController;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __91__NPKExpressModeSettingsCoordinator__checkForConflictsInEnablingExpressForPass_completion___block_invoke;
  v19[3] = &unk_24CFECD50;
  v16 = v14;
  v20 = v16;
  objc_copyWeak(&v23, (id *)buf);
  v17 = v6;
  v21 = v17;
  v18 = v7;
  v22 = v18;
  -[PKExpressPassController conflictingExpressPassesWithPassConfiguration:completion:](expressPassController, "conflictingExpressPassesWithPassConfiguration:completion:", v12, v19);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

}

void __91__NPKExpressModeSettingsCoordinator__checkForConflictsInEnablingExpressForPass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __91__NPKExpressModeSettingsCoordinator__checkForConflictsInEnablingExpressForPass_completion___block_invoke_2;
  v6[3] = &unk_24CFE8628;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v10);
}

void __91__NPKExpressModeSettingsCoordinator__checkForConflictsInEnablingExpressForPass_completion___block_invoke_2(id *a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;
  id v8;
  void (**v9)(id, uint64_t);
  _QWORD v10[4];
  id v11;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v3 = objc_msgSend(a1[4], "count");
  if (objc_msgSend(a1[5], "hasImmediateAutomaticSelectionCriterion"))
    v4 = NPKIsGymKitEnabled();
  else
    v4 = 0;
  if (v3)
    v5 = 0;
  else
    v5 = (_DWORD)v4 == 0;
  if (v5)
  {
    v9 = (void (**)(id, uint64_t))a1[6];
    if (v9)
      v9[2](v9, 1);
  }
  else
  {
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[4];
    v7 = a1[5];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __91__NPKExpressModeSettingsCoordinator__checkForConflictsInEnablingExpressForPass_completion___block_invoke_3;
    v10[3] = &unk_24CFE9328;
    v11 = a1[6];
    objc_msgSend(v6, "expressModeSettingsCoordinator:didEncounterConflictWhenEnablingExpressForPass:conflictingExpressPasses:conflictsWithGymKit:completion:", WeakRetained, v7, v8, v4, v10);

  }
}

uint64_t __91__NPKExpressModeSettingsCoordinator__checkForConflictsInEnablingExpressForPass_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_requestUserAuthenticationForPass:(id)a3 withExpressMode:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  OS_dispatch_queue *v11;
  void *v12;
  OS_dispatch_queue *v13;
  id v14;
  _QWORD v15[4];
  OS_dispatch_queue *v16;
  id v17;
  id v18[2];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Requesting user authentication for %@", buf, 0xCu);

    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v11 = self->_workQueue;
  objc_initWeak((id *)buf, self);
  -[NPKExpressModeSettingsCoordinator delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __87__NPKExpressModeSettingsCoordinator__requestUserAuthenticationForPass_withExpressMode___block_invoke;
  v15[3] = &unk_24CFECDA0;
  v13 = v11;
  v16 = v13;
  objc_copyWeak(v18, (id *)buf);
  v14 = v6;
  v17 = v14;
  v18[1] = (id)a4;
  objc_msgSend(v12, "expressModeSettingsCoordinator:requestsAuthorizationToEnableExpressForPass:completion:", self, v14, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);

}

void __87__NPKExpressModeSettingsCoordinator__requestUserAuthenticationForPass_withExpressMode___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15[2];
  char v16;
  char v17;

  v7 = a4;
  v8 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__NPKExpressModeSettingsCoordinator__requestUserAuthenticationForPass_withExpressMode___block_invoke_2;
  block[3] = &unk_24CFECD78;
  objc_copyWeak(v15, (id *)(a1 + 48));
  v16 = a2;
  v13 = v7;
  v9 = *(id *)(a1 + 40);
  v10 = *(void **)(a1 + 56);
  v14 = v9;
  v15[1] = v10;
  v17 = a3;
  v11 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(v15);
}

void __87__NPKExpressModeSettingsCoordinator__requestUserAuthenticationForPass_withExpressMode___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_storeStrong(WeakRetained + 7, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "externalizedContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "paymentPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_handleSuccessfulUserAuthenticationWithCredential:forPass:withExpressMode:", v3, v4, *(_QWORD *)(a1 + 56));

  }
  else if (*(_BYTE *)(a1 + 65))
  {
    objc_msgSend(WeakRetained, "_handleUserCancelled");
  }
  else
  {
    objc_msgSend(WeakRetained, "_handleFailedUserAuthentication");
  }

}

- (void)_handleSuccessfulUserAuthenticationWithCredential:(id)a3 forPass:(id)a4 withExpressMode:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Handling successful user authentication for %@", (uint8_t *)&v14, 0xCu);

    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v9)
  {
    if (-[PKExpressPassController hasEligibleExpressUpgradeRequestForPass:](self->_expressPassController, "hasEligibleExpressUpgradeRequestForPass:", v9))-[NPKExpressModeSettingsCoordinator _upgradeExpressModeForPass:withCredential:](self, "_upgradeExpressModeForPass:withCredential:", v9, v8);
    else
      -[NPKExpressModeSettingsCoordinator _enableExpressForPass:mode:withCredential:](self, "_enableExpressForPass:mode:withCredential:", v9, a5, v8);
  }

}

- (void)_upgradeExpressModeForPass:(id)a3 withCredential:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  OS_dispatch_queue *v12;
  PKExpressPassController *expressPassController;
  OS_dispatch_queue *v14;
  _QWORD v15[4];
  OS_dispatch_queue *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Upgrading express for %@", buf, 0xCu);

    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v12 = self->_workQueue;
  objc_initWeak((id *)buf, self);
  expressPassController = self->_expressPassController;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__NPKExpressModeSettingsCoordinator__upgradeExpressModeForPass_withCredential___block_invoke;
  v15[3] = &unk_24CFECDC8;
  v14 = v12;
  v16 = v14;
  objc_copyWeak(&v17, (id *)buf);
  -[PKExpressPassController upgradeExpressModeForPass:withCredential:resultHandler:](expressPassController, "upgradeExpressModeForPass:withCredential:resultHandler:", v6, v7, v15);
  objc_destroyWeak(&v17);

  objc_destroyWeak((id *)buf);
}

void __79__NPKExpressModeSettingsCoordinator__upgradeExpressModeForPass_withCredential___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__NPKExpressModeSettingsCoordinator__upgradeExpressModeForPass_withCredential___block_invoke_2;
  block[3] = &unk_24CFE8650;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v13);
}

void __79__NPKExpressModeSettingsCoordinator__upgradeExpressModeForPass_withCredential___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
    objc_msgSend(WeakRetained, "_handleSuccessForPass:");
  else
    objc_msgSend(WeakRetained, "_handleFailedPassUpgrade");

}

- (void)_enableExpressForPass:(id)a3 mode:(unint64_t)a4 withCredential:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  PKExpressPassController *expressPassController;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  OS_dispatch_queue *v19;
  PKExpressPassController *v20;
  OS_dispatch_queue *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  OS_dispatch_queue *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Enabling express for %@", buf, 0xCu);

    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  expressPassController = self->_expressPassController;
  objc_msgSend(v8, "paymentPass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExpressPassController expressModeSupportedForPass:](expressPassController, "expressModeSupportedForPass:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[NPKExpressModeSettingsCoordinator _newExpressStateForMode:pass:enable:](self, "_newExpressStateForMode:pass:enable:", a4, v8, 1);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EAE8]), "initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:", v16, (unint64_t)objc_msgSend(v17, "nfcExpressState") < 2, (unint64_t)objc_msgSend(v17, "uwbExpressState") < 2);

  }
  else
  {
    v18 = 0;
  }
  v19 = self->_workQueue;
  objc_initWeak((id *)buf, self);
  v20 = self->_expressPassController;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __79__NPKExpressModeSettingsCoordinator__enableExpressForPass_mode_withCredential___block_invoke;
  v24[3] = &unk_24CFECDF0;
  v21 = v19;
  v25 = v21;
  objc_copyWeak(&v28, (id *)buf);
  v22 = v18;
  v26 = v22;
  v23 = v8;
  v27 = v23;
  -[PKExpressPassController setExpressModeWithPassConfiguration:credential:completion:](v20, "setExpressModeWithPassConfiguration:credential:completion:", v22, v9, v24);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

}

void __79__NPKExpressModeSettingsCoordinator__enableExpressForPass_mode_withCredential___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__NPKExpressModeSettingsCoordinator__enableExpressForPass_mode_withCredential___block_invoke_2;
  v6[3] = &unk_24CFE85B0;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v10);
}

void __79__NPKExpressModeSettingsCoordinator__enableExpressForPass_mode_withCredential___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(a1 + 40)))
      objc_msgSend(v3, "_handleSuccessForPass:", *(_QWORD *)(a1 + 48));
    else
      objc_msgSend(v3, "_handleFailedEnableExpress");
    WeakRetained = v3;
  }

}

- (void)_handleSuccessForPass:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "uniqueID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Operation completed successfully for %@", (uint8_t *)&v9, 0xCu);

    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[NPKExpressModeSettingsCoordinator _invokeCompletionHandlerWithSuccess:](self, "_invokeCompletionHandlerWithSuccess:", 1);

}

- (void)_handleFailedUserAuthentication
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  self->_expressStateUpdatePending = 0;
  -[NPKExpressModeSettingsCoordinator _invokeCompletionHandlerWithSuccess:](self, "_invokeCompletionHandlerWithSuccess:", 0);
}

- (void)_handleFailedPassUpgrade
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  self->_expressStateUpdatePending = 0;
  -[NPKExpressModeSettingsCoordinator _invokeCompletionHandlerWithSuccess:](self, "_invokeCompletionHandlerWithSuccess:", 0);
}

- (void)_handleFailedEnableExpress
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  self->_expressStateUpdatePending = 0;
  -[NPKExpressModeSettingsCoordinator _invokeCompletionHandlerWithSuccess:](self, "_invokeCompletionHandlerWithSuccess:", 0);
}

- (void)_handleUserCancelled
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  self->_expressStateUpdatePending = 0;
  -[NPKExpressModeSettingsCoordinator _invokeCompletionHandlerWithSuccess:](self, "_invokeCompletionHandlerWithSuccess:", 1);
}

- (void)_invokeCompletionHandlerWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  id completionHandler;
  PKPass *currentPass;
  NPKExpressState *currentState;
  NSObject *callbackQueue;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  BOOL v19;
  uint8_t buf[4];
  _BOOL4 v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v3;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Express mode operation completed with success: %d", buf, 8u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v8 = (void *)MEMORY[0x2199B6780](self->_completionHandler);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  currentPass = self->_currentPass;
  self->_currentPass = 0;

  currentState = self->_currentState;
  self->_currentState = 0;

  callbackQueue = self->_callbackQueue;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __73__NPKExpressModeSettingsCoordinator__invokeCompletionHandlerWithSuccess___block_invoke;
  v17 = &unk_24CFEA4B0;
  v13 = v8;
  v18 = v13;
  v19 = v3;
  dispatch_async(callbackQueue, &v14);
  if (!self->_expressStateUpdatePending)
    -[NPKExpressModeSettingsCoordinator _handleExpressStateChange](self, "_handleExpressStateChange", v14, v15, v16, v17);

}

uint64_t __73__NPKExpressModeSettingsCoordinator__invokeCompletionHandlerWithSuccess___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)_handleExpressStateChange
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  OS_dispatch_queue *v24;
  OS_dispatch_queue *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  OS_dispatch_queue *v35;
  OS_dispatch_queue *v36;
  id v37;
  id location;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = self->_workQueue;
  v4 = self->_callbackQueue;
  objc_initWeak(&location, self);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __62__NPKExpressModeSettingsCoordinator__handleExpressStateChange__block_invoke;
  v34[3] = &unk_24CFECE18;
  v25 = v3;
  v35 = v25;
  objc_copyWeak(&v37, &location);
  v24 = v4;
  v36 = v24;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199B6780](v34);
  -[PKExpressPassController enabledExpressPasses](self->_expressPassController, "enabledExpressPasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->_previousPassStates, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = (void *)MEMORY[0x24BDBCEF0];
  if (v8)
  {
    -[NSMutableDictionary allKeys](self->_previousPassStates, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v6, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v11, "removeObject:", v16);
        -[NPKExpressModeSettingsCoordinator _expressStateForPassWithUniqueID:fromControllerState:](self, "_expressStateForPassWithUniqueID:fromControllerState:", v16, v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, uint64_t, void *))v5)[2](v5, v16, v17);

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v13);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = v11;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v18);
        v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        -[NPKExpressModeSettingsCoordinator _expressStateForPassWithUniqueID:fromControllerState:](self, "_expressStateForPassWithUniqueID:fromControllerState:", v22, v6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, uint64_t, void *))v5)[2](v5, v22, v23);

      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    }
    while (v19);
  }

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

}

void __62__NPKExpressModeSettingsCoordinator__handleExpressStateChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id *WeakRetained;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  v7 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained[11], "setObject:forKey:", v6, v5);
  v9 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__NPKExpressModeSettingsCoordinator__handleExpressStateChange__block_invoke_2;
  block[3] = &unk_24CFE8650;
  objc_copyWeak(&v15, v7);
  v13 = v6;
  v14 = v5;
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
}

void __62__NPKExpressModeSettingsCoordinator__handleExpressStateChange__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expressModeSettingsCoordinator:didUpdateState:forPassWithUniqueID:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_expressStateForPassWithUniqueID:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  NPKExpressModeSettingsCoordinator *v11;
  uint64_t *v12;
  id v13;
  id location;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__22;
  v19 = __Block_byref_object_dispose__22;
  v20 = 0;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__NPKExpressModeSettingsCoordinator__expressStateForPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFEBD70;
  objc_copyWeak(&v13, &location);
  v11 = self;
  v12 = &v15;
  v10 = v4;
  v6 = v4;
  dispatch_sync(workQueue, block);
  v7 = (id)v16[5];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __70__NPKExpressModeSettingsCoordinator__expressStateForPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "enabledExpressPasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_expressStateForPassWithUniqueID:fromControllerState:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_expressStateForPassWithUniqueID:(id)a3 fromControllerState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NPKExpressState *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NPKExpressState *v15;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (self->_currentState
    && (-[PKPass uniqueID](self->_currentPass, "uniqueID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = PKEqualObjects(),
        v8,
        v9))
  {
    v10 = self->_currentState;
  }
  else
  {
    objc_msgSend(v7, "objectForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11
      && (objc_msgSend(v11, "passUniqueIdentifier"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = PKEqualObjects(),
          v13,
          v14))
    {
      v15 = -[NPKExpressState initWithExpressPassConfiguration:]([NPKExpressState alloc], "initWithExpressPassConfiguration:", v12);
    }
    else
    {
      v15 = -[NPKExpressState initWithNFCState:uwbState:]([NPKExpressState alloc], "initWithNFCState:uwbState:", 2, 2);
    }
    v10 = v15;

  }
  return v10;
}

- (PKExpressPassController)expressPassController
{
  return self->_expressPassController;
}

- (void)setExpressPassController:(id)a3
{
  objc_storeStrong((id *)&self->_expressPassController, a3);
}

- (NPKExpressModeSettingsCoordinatorDelegate)delegate
{
  return (NPKExpressModeSettingsCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NPKPassesDataSource)passDataSource
{
  return self->_passDataSource;
}

- (void)setPassDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_passDataSource, a3);
}

- (PKPass)currentPass
{
  return self->_currentPass;
}

- (void)setCurrentPass:(id)a3
{
  objc_storeStrong((id *)&self->_currentPass, a3);
}

- (NPKExpressState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (LAContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentContext, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (BOOL)expressStateUpdatePending
{
  return self->_expressStateUpdatePending;
}

- (void)setExpressStateUpdatePending:(BOOL)a3
{
  self->_expressStateUpdatePending = a3;
}

- (NSMutableDictionary)previousPassStates
{
  return self->_previousPassStates;
}

- (void)setPreviousPassStates:(id)a3
{
  objc_storeStrong((id *)&self->_previousPassStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousPassStates, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_currentPass, 0);
  objc_storeStrong((id *)&self->_passDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expressPassController, 0);
}

@end
