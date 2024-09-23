@implementation CRSCardRequest

- (CRSCardRequest)init
{
  return -[CRSCardRequest initWithContent:format:](self, "initWithContent:format:", 0, 1);
}

- (CRSCardRequest)initWithContent:(id)a3 format:(unint64_t)a4
{
  id v7;
  CRSCardRequest *v8;
  CRSCardRequest *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRSCardRequest;
  v8 = -[CRSCardRequest init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_content, a3);
    v9->_format = a4;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.CardServices.CRSCardRequest.request-queue", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    v9->_loadsBundleServices = 1;
  }

  return v9;
}

- (void)startWithReply:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  uint64_t v6;
  OS_dispatch_queue *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  OS_dispatch_queue *v15;
  CRSCardRequest *v16;
  id v17;
  id v18;
  id location;

  v4 = a3;
  if (v4)
  {
    v5 = self->_queue;
    objc_initWeak(&location, self);
    v6 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __33__CRSCardRequest_startWithReply___block_invoke;
    v14[3] = &unk_24DB6FF90;
    v7 = v5;
    v15 = v7;
    objc_copyWeak(&v18, &location);
    v8 = v4;
    v16 = self;
    v17 = v8;
    v9 = MEMORY[0x219A341CC](v14);
    v10 = (void *)v9;
    if (self->_loadsBundleServices)
    {
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __33__CRSCardRequest_startWithReply___block_invoke_56;
      v11[3] = &unk_24DB6FFB8;
      v12 = v8;
      v13 = v10;
      -[CRSCardRequest _loadAndRegisterBundleServices:](self, "_loadAndRegisterBundleServices:", v11);

    }
    else
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
}

void __33__CRSCardRequest_startWithReply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  _QWORD block[5];
  id v5;
  id v6;

  v2 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CRSCardRequest_startWithReply___block_invoke_2;
  block[3] = &unk_24DB6FF68;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v3 = *(id *)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __33__CRSCardRequest_startWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v1 = a1;
  v38 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(v1 + 32);
      *(_DWORD *)buf = 138412290;
      v34 = v4;
      _os_log_impl(&dword_219849000, v3, OS_LOG_TYPE_INFO, "Starting card request: %@", buf, 0xCu);
    }
    +[CRSIdentifiedServiceRegistry sharedInstance](CRSIdentifiedServiceRegistry, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifiedServices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      do
      {
        v11 = 0;
        v27 = v9;
        do
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
          if (objc_msgSend(v12, "conformsToProtocol:", &unk_2550A1B30))
          {
            v13 = v12;
            if (objc_msgSend(v13, "canSatisfyCardRequest:", WeakRetained))
            {
              objc_msgSend(*(id *)(v1 + 32), "_excludedServiceIdentifiers");
              v14 = v10;
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "serviceIdentifier");
              v16 = v7;
              v17 = WeakRetained;
              v18 = v1;
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v15, "containsObject:", v19);

              v1 = v18;
              WeakRetained = v17;
              v7 = v16;

              v10 = v14;
              v9 = v27;
              if ((v20 & 1) == 0)
                objc_msgSend(v26, "addObject:", v13);
            }

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v9);
    }

    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __33__CRSCardRequest_startWithReply___block_invoke_52;
    v28[3] = &unk_24DB6FF40;
    v28[4] = WeakRetained;
    objc_msgSend(v26, "sortUsingComparator:", v28);
    v21 = (void *)*MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      v22 = *(_QWORD *)(v1 + 32);
      v23 = v21;
      objc_msgSend(v26, "reverseObjectEnumerator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "allObjects");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v22;
      v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_219849000, v23, OS_LOG_TYPE_INFO, "Sorted card services by priority for request %@: %@", buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "_tryRemainingCardServices:reply:", v26, *(_QWORD *)(v1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }

}

uint64_t __33__CRSCardRequest_startWithReply___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(a2, "servicePriorityForRequest:", v5);
  v8 = objc_msgSend(v6, "servicePriorityForRequest:", *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  return v11;
}

uint64_t __33__CRSCardRequest_startWithReply___block_invoke_56(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)initialize
{
  _CRSPassthroughService *v3;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CRSCardRequest;
  objc_msgSendSuper2(&v4, sel_initialize);
  CRLogInitIfNeeded();
  v3 = objc_alloc_init(_CRSPassthroughService);
  objc_msgSend(a1, "registerService:", v3);

}

- (void)_loadAndRegisterBundleServices:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__CRSCardRequest__loadAndRegisterBundleServices___block_invoke;
  v7[3] = &unk_24DB6FFE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __49__CRSCardRequest__loadAndRegisterBundleServices___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_219849000, v2, OS_LOG_TYPE_INFO, "Loading and registering bundle services if necessary: %@", buf, 0xCu);
  }
  +[_CRSServiceBundleManager sharedInstance](_CRSCardServiceBundleManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__CRSCardRequest__loadAndRegisterBundleServices___block_invoke_63;
  v5[3] = &unk_24DB6FF18;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "getServiceBundlesWithCompletion:", v5);

}

void __49__CRSCardRequest__loadAndRegisterBundleServices___block_invoke_63(uint64_t a1, void *a2, void *a3)
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
          +[CRSIdentifiedServiceRegistry sharedInstance](CRSIdentifiedServiceRegistry, "sharedInstance");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "registerIdentifiedService:", v13);

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

- (void)_tryRemainingCardServices:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  _QWORD block[4];
  id v10;
  CRSCardRequest *v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke;
    block[3] = &unk_24DB70080;
    objc_copyWeak(&v13, &location);
    v10 = v6;
    v11 = self;
    v12 = v7;
    dispatch_async(queue, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD *v23;
  id v24;
  id location;
  _QWORD v26[5];
  id v27;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v27 = 0;
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  objc_initWeak(&location, WeakRetained);
  v5 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_65;
  v19[3] = &unk_24DB70030;
  objc_copyWeak(&v24, &location);
  v19[4] = WeakRetained;
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 40);
  v20 = v6;
  v21 = v7;
  v23 = v26;
  v8 = v4;
  v22 = v8;
  objc_msgSend(v6, "requestCard:reply:", WeakRetained, v19);
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_67;
    block[3] = &unk_24DB70058;
    objc_copyWeak(&v18, &location);
    v13 = *(id *)(a1 + 32);
    v17 = v26;
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 40);
    v14 = 0;
    v15 = v11;
    v16 = v10;
    dispatch_group_notify(v8, v9, block);

    objc_destroyWeak(&v18);
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  _Block_object_dispose(v26, 8);
}

void __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  id to;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 72));
  v7 = objc_loadWeakRetained(&to);

  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_2;
    block[3] = &unk_24DB70008;
    v14 = v6;
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v15 = v9;
    v16 = v10;
    v17 = v5;
    v12 = *(_OWORD *)(a1 + 56);
    v11 = (id)v12;
    v18 = v12;
    dispatch_async(v8, block);

  }
  objc_destroyWeak(&to);

}

void __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_2_cold_1(a1, v2, v3);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *MEMORY[0x24BE15490];
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        v8 = *(_QWORD *)(a1 + 48);
        v7 = *(_QWORD *)(a1 + 56);
        v9 = *(_QWORD *)(a1 + 40);
        v12 = 138412802;
        v13 = v7;
        v14 = 2112;
        v15 = v9;
        v16 = 2112;
        v17 = v8;
        _os_log_impl(&dword_219849000, v5, OS_LOG_TYPE_INFO, "Retrieved card %@ from service %@ for request %@", (uint8_t *)&v12, 0x20u);
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 56));
    }
    else if (v6)
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_219849000, v5, OS_LOG_TYPE_INFO, "No card retrieved from service %@ for request %@", (uint8_t *)&v12, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_67(uint64_t a1)
{
  void *v2;
  CRSCardResponse *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id to;
  uint64_t v11;
  const __CFString *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_copyWeak(&to, (id *)(a1 + 72));
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v2, "removeLastObject");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v3 = objc_alloc_init(CRSCardResponse);
    -[CRSCardResponse setCard:](v3, "setCard:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v4 = objc_loadWeakRetained(&to);
    -[CRSCardResponse setRequest:](v3, "setRequest:", v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    if (objc_msgSend(v2, "count"))
    {
      v5 = *MEMORY[0x24BE15490];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v2;
        _os_log_impl(&dword_219849000, v5, OS_LOG_TYPE_INFO, "Found card, so not trying remaining services %@", buf, 0xCu);
      }
    }
    goto LABEL_10;
  }
  if (!objc_msgSend(v2, "count"))
  {
    v7 = *(_QWORD *)(a1 + 56);
    v8 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0BA0];
    v12 = CFSTR("No service produced a card");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v3 = (CRSCardResponse *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE15488], 401, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v9);

LABEL_10:
    goto LABEL_11;
  }
  v6 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v2;
    _os_log_impl(&dword_219849000, v6, OS_LOG_TYPE_INFO, "Trying remaining services %@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 48), "_tryRemainingCardServices:reply:", v2, *(_QWORD *)(a1 + 56));
LABEL_11:

  objc_destroyWeak(&to);
}

- (CRContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (BOOL)loadsBundleServices
{
  return self->_loadsBundleServices;
}

- (void)setLoadsBundleServices:(BOOL)a3
{
  self->_loadsBundleServices = a3;
}

- (NSSet)_excludedServiceIdentifiers
{
  return self->_excludedServiceIdentifiers;
}

- (void)_setExcludedServiceIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedServiceIdentifiers, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)registerService:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CRSIdentifiedServiceRegistry sharedInstance](CRSIdentifiedServiceRegistry, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerIdentifiedService:", v3);

}

void __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *a2;
  v6 = 138412802;
  v7 = v3;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_error_impl(&dword_219849000, log, OS_LOG_TYPE_ERROR, "Failed to retrieve card from service %@ for request %@ due to error: %@", (uint8_t *)&v6, 0x20u);
}

@end
