@implementation MDMPushServiceManager

- (MDMPushServiceManager)initWithChannel:(unint64_t)a3
{
  MDMPushServiceManager *v4;
  MDMPushServiceManager *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *notificationQueue;
  uint64_t v8;
  NSMutableArray *observers;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MDMPushServiceManager;
  v4 = -[MDMPushServiceManager init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_channel = a3;
    v6 = dispatch_queue_create("com.apple.MDMPushServiceManager.worker-queue", 0);
    notificationQueue = v5->_notificationQueue;
    v5->_notificationQueue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new();
    observers = v5->_observers;
    v5->_observers = (NSMutableArray *)v8;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[MDMPushServiceManager _stopProdConnectionForEnvironmentIfNeeded:](self, "_stopProdConnectionForEnvironmentIfNeeded:", 0);
  -[MDMPushServiceManager _stopProdConnectionForEnvironmentIfNeeded:](self, "_stopProdConnectionForEnvironmentIfNeeded:", 1);
  v3.receiver = self;
  v3.super_class = (Class)MDMPushServiceManager;
  -[MDMPushServiceManager dealloc](&v3, sel_dealloc);
}

- (void)addPushServiceObserver:(id)a3
{
  NSMutableArray *observers;
  id v4;

  observers = self->_observers;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](observers, "addObject:", v4);

}

- (void)requestPublicTokenWithEnvironment:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[MDMPushServiceManager notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__MDMPushServiceManager_requestPublicTokenWithEnvironment___block_invoke;
  v6[3] = &unk_24EB690B8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __59__MDMPushServiceManager_requestPublicTokenWithEnvironment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "_setupConnectionForEnvironmentIfNeeded:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_connectionForEnvironment:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publicToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __59__MDMPushServiceManager_requestPublicTokenWithEnvironment___block_invoke_2;
    v8[3] = &unk_24EB69090;
    v8[4] = v5;
    v6 = v3;
    v7 = *(_QWORD *)(a1 + 40);
    v9 = v6;
    v10 = v7;
    objc_msgSend(v5, "_notifyObserversWithBlock:", v8);

  }
}

uint64_t __59__MDMPushServiceManager_requestPublicTokenWithEnvironment___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "pushServiceManager:didReceivePublicToken:forEnvironment:", a1[4], a1[5], a1[6]);
}

- (void)requestAppTokenForTopic:(id)a3 environment:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  -[MDMPushServiceManager notificationQueue](self, "notificationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__MDMPushServiceManager_requestAppTokenForTopic_environment___block_invoke;
  block[3] = &unk_24EB690E0;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __61__MDMPushServiceManager_requestAppTokenForTopic_environment___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setupConnectionForEnvironmentIfNeeded:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_connectionForEnvironment:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestAppTokenForTopic:", *(_QWORD *)(a1 + 40));

}

- (void)stopListeningForAllMDMPushMessagesWithEnvironment:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __75__MDMPushServiceManager_stopListeningForAllMDMPushMessagesWithEnvironment___block_invoke;
  v3[3] = &unk_24EB69108;
  v3[4] = self;
  -[MDMPushServiceManager _trimEnabledPushTopicsForEnvironment:filterBlock:](self, "_trimEnabledPushTopicsForEnvironment:filterBlock:", a3, v3);
}

uint64_t __75__MDMPushServiceManager_stopListeningForAllMDMPushMessagesWithEnvironment___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_staticTopics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (void)startListeningForDEPPushMessage
{
  -[MDMPushServiceManager _startListeningForPushMessageWithTopic:environment:](self, "_startListeningForPushMessageWithTopic:environment:", CFSTR("com.apple.dep.apns"), 0);
}

- (void)stopListeningForDEPPushMessage
{
  -[MDMPushServiceManager _stopListeningForPushMessageWithTopic:environment:](self, "_stopListeningForPushMessageWithTopic:environment:", CFSTR("com.apple.dep.apns"), 0);
}

- (id)_staticTopics
{
  if (_staticTopics_onceToken != -1)
    dispatch_once(&_staticTopics_onceToken, &__block_literal_global_3);
  return (id)_staticTopics_set;
}

void __38__MDMPushServiceManager__staticTopics__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("com.apple.dep.apns");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_staticTopics_set;
  _staticTopics_set = v2;

}

- (void)_setupConnectionForEnvironmentIfNeeded:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;

  -[MDMPushServiceManager _connectionForEnvironment:](self, "_connectionForEnvironment:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[MDMPushServiceManager channel](self, "channel");
    -[MDMPushServiceManager notificationQueue](self, "notificationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MDMPushServiceConnection connectionWithEnvironment:channel:queue:](MDMPushServiceConnection, "connectionWithEnvironment:channel:queue:", a3, v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setDelegate:", self);
    if (a3)
      -[MDMPushServiceManager setDevAPSConnection:](self, "setDevAPSConnection:", v8);
    else
      -[MDMPushServiceManager setProdAPSConnection:](self, "setProdAPSConnection:", v8);

  }
}

- (void)_stopProdConnectionForEnvironmentIfNeeded:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[MDMPushServiceManager _connectionForEnvironment:](self, "_connectionForEnvironment:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10 = v5;
    objc_msgSend(v5, "shutdown");
    if (a3 == 1)
    {
      -[MDMPushServiceManager devAPSConnection](self, "devAPSConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v10;
      if (v8)
      {
        -[MDMPushServiceManager devAPSConnection](self, "devAPSConnection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "shutdown");

        -[MDMPushServiceManager setDevAPSConnection:](self, "setDevAPSConnection:", 0);
        goto LABEL_8;
      }
    }
    else
    {
      v5 = v10;
      if (!a3)
      {
        -[MDMPushServiceManager prodAPSConnection](self, "prodAPSConnection");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v10;
        if (v6)
        {
          -[MDMPushServiceManager prodAPSConnection](self, "prodAPSConnection");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "shutdown");

          -[MDMPushServiceManager setProdAPSConnection:](self, "setProdAPSConnection:", 0);
LABEL_8:
          v5 = v10;
        }
      }
    }
  }

}

- (id)_connectionForEnvironment:(unint64_t)a3
{
  if (a3)
    -[MDMPushServiceManager devAPSConnection](self, "devAPSConnection");
  else
    -[MDMPushServiceManager prodAPSConnection](self, "prodAPSConnection");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)_environmentForConnection:(id)a3
{
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  v4 = a3;
  -[MDMPushServiceManager prodAPSConnection](self, "prodAPSConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v7 = 0;
  }
  else
  {
    -[MDMPushServiceManager devAPSConnection](self, "devAPSConnection");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6 == v4;

  }
  return v7;
}

- (void)_startListeningForPushMessageWithTopic:(id)a3 environment:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  -[MDMPushServiceManager notificationQueue](self, "notificationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__MDMPushServiceManager__startListeningForPushMessageWithTopic_environment___block_invoke;
  block[3] = &unk_24EB690E0;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __76__MDMPushServiceManager__startListeningForPushMessageWithTopic_environment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_setupConnectionForEnvironmentIfNeeded:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_connectionForEnvironment:", *(_QWORD *)(a1 + 48));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enabledTopics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;

  if ((objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v7, "_setEnabledTopics:", v6);
  }

}

- (void)_stopListeningForPushMessageWithTopic:(id)a3 environment:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__MDMPushServiceManager__stopListeningForPushMessageWithTopic_environment___block_invoke;
  v8[3] = &unk_24EB69108;
  v9 = v6;
  v7 = v6;
  -[MDMPushServiceManager _trimEnabledPushTopicsForEnvironment:filterBlock:](self, "_trimEnabledPushTopicsForEnvironment:filterBlock:", a4, v8);

}

uint64_t __75__MDMPushServiceManager__stopListeningForPushMessageWithTopic_environment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;
}

- (void)_trimEnabledPushTopicsForEnvironment:(unint64_t)a3 filterBlock:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  -[MDMPushServiceManager notificationQueue](self, "notificationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__MDMPushServiceManager__trimEnabledPushTopicsForEnvironment_filterBlock___block_invoke;
  block[3] = &unk_24EB69178;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __74__MDMPushServiceManager__trimEnabledPushTopicsForEnvironment_filterBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_connectionForEnvironment:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "enabledTopics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    v6 = (void *)MEMORY[0x24BDD1758];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __74__MDMPushServiceManager__trimEnabledPushTopicsForEnvironment_filterBlock___block_invoke_2;
    v8[3] = &unk_24EB69150;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v6, "predicateWithBlock:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filterUsingPredicate:", v7);

    objc_msgSend(v3, "_setEnabledTopics:", v5);
  }

}

uint64_t __74__MDMPushServiceManager__trimEnabledPushTopicsForEnvironment_filterBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_notifyObserversWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  -[MDMPushServiceManager observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "nonretainedObjectValue", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v4[2](v4, v13);
        }
        else
        {
          -[MDMPushServiceManager observers](self, "observers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObject:", v12);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[MDMPushServiceManager connection:didReceivePublicToken:]";
    _os_log_impl(&dword_222CB9000, v8, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  -[MDMPushServiceManager notificationQueue](self, "notificationQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = -[MDMPushServiceManager _environmentForConnection:](self, "_environmentForConnection:", v7);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__MDMPushServiceManager_connection_didReceivePublicToken___block_invoke;
  v12[3] = &unk_24EB69090;
  v12[4] = self;
  v13 = v6;
  v14 = v10;
  v11 = v6;
  -[MDMPushServiceManager _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v12);

}

uint64_t __58__MDMPushServiceManager_connection_didReceivePublicToken___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "pushServiceManager:didReceivePublicToken:forEnvironment:", a1[4], a1[5], a1[6]);
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[MDMPushServiceManager connection:didReceiveToken:forTopic:identifier:]";
    _os_log_impl(&dword_222CB9000, v12, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  -[MDMPushServiceManager notificationQueue](self, "notificationQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v14 = -[MDMPushServiceManager _environmentForConnection:](self, "_environmentForConnection:", v11);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __72__MDMPushServiceManager_connection_didReceiveToken_forTopic_identifier___block_invoke;
  v17[3] = &unk_24EB691A0;
  v17[4] = self;
  v18 = v9;
  v19 = v10;
  v20 = v14;
  v15 = v10;
  v16 = v9;
  -[MDMPushServiceManager _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v17);

}

void __72__MDMPushServiceManager_connection_didReceiveToken_forTopic_identifier___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "pushServiceManager:didReceiveAppToken:forTopic:environment:", a1[4], a1[5], a1[6], a1[7]);

}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[MDMPushServiceManager connection:didReceiveMessageForTopic:userInfo:]";
    _os_log_impl(&dword_222CB9000, v11, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  -[MDMPushServiceManager notificationQueue](self, "notificationQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  v13 = -[MDMPushServiceManager _environmentForConnection:](self, "_environmentForConnection:", v10);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __71__MDMPushServiceManager_connection_didReceiveMessageForTopic_userInfo___block_invoke;
  v16[3] = &unk_24EB691A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v13;
  v14 = v9;
  v15 = v8;
  -[MDMPushServiceManager _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v16);

}

uint64_t __71__MDMPushServiceManager_connection_didReceiveMessageForTopic_userInfo___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "pushServiceManager:didReceiveMessageForTopic:userInfo:environment:", a1[4], a1[5], a1[6], a1[7]);
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (unint64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(unint64_t)a3
{
  self->_channel = a3;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (MDMPushServiceConnection)prodAPSConnection
{
  return self->_prodAPSConnection;
}

- (void)setProdAPSConnection:(id)a3
{
  objc_storeStrong((id *)&self->_prodAPSConnection, a3);
}

- (MDMPushServiceConnection)devAPSConnection
{
  return self->_devAPSConnection;
}

- (void)setDevAPSConnection:(id)a3
{
  objc_storeStrong((id *)&self->_devAPSConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devAPSConnection, 0);
  objc_storeStrong((id *)&self->_prodAPSConnection, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
