@implementation BCSIdentityService

+ (id)sharedInstance
{
  void *v0;

  objc_opt_self();
  v0 = (void *)_MergedGlobals_37;
  if (!_MergedGlobals_37)
  {
    if (qword_253EC0A78 != -1)
      dispatch_once(&qword_253EC0A78, &__block_literal_global_6);
    v0 = (void *)_MergedGlobals_37;
  }
  return v0;
}

void __36__BCSIdentityService_sharedInstance__block_invoke()
{
  BCSIdentityService *v0;
  BCSIDSServiceFactory *v1;
  void *v2;
  id v3;
  BCSIdentityService *v4;
  void *v5;
  BCSIDSServiceFactory *v6;
  objc_super v7;

  v0 = [BCSIdentityService alloc];
  v1 = objc_alloc_init(BCSIDSServiceFactory);
  objc_msgSend(MEMORY[0x24BE4FC40], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v1;
  v3 = v2;
  if (v0)
  {
    v7.receiver = v0;
    v7.super_class = (Class)BCSIdentityService;
    v4 = (BCSIdentityService *)objc_msgSendSuper2(&v7, sel_init);
    v0 = v4;
    if (v4)
    {
      objc_storeStrong((id *)&v4->_IDSServiceFactory, v1);
      objc_storeStrong((id *)&v0->_IDSQueryController, v2);
    }
  }

  v5 = (void *)_MergedGlobals_37;
  _MergedGlobals_37 = (uint64_t)v0;

}

- (id)businessChatAccount
{
  BCSIdentityService *v2;
  BCSIDSServiceFactoryProtocol *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  BCSIdentityAccountProtocol *businessChatAccount;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_businessChatAccount)
  {
    v3 = v2->_IDSServiceFactory;
    -[BCSIDSServiceFactoryProtocol makeIDSService](v3, "makeIDSService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "accounts", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v11, "accountType") == 1)
          {
            v12 = v11;

            v7 = v12;
          }
          if (!objc_msgSend(v11, "accountType"))
          {
            v13 = v11;

            v8 = v13;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);

      if (v7)
      {
        v14 = v7;
        v15 = v14;
LABEL_17:
        businessChatAccount = v2->_businessChatAccount;
        v2->_businessChatAccount = (BCSIdentityAccountProtocol *)v14;

        goto LABEL_18;
      }
    }
    else
    {

      v8 = 0;
    }
    v14 = v8;
    v15 = 0;
    v8 = v14;
    goto LABEL_17;
  }
LABEL_18:
  objc_sync_exit(v2);

  return v2->_businessChatAccount;
}

- (void)refreshIDStatusForBizID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, BOOL);
  uint64_t v8;
  BCSIDSQueryControllerProtocol *IDSQueryController;
  uint64_t v10;
  NSObject *v11;
  BCSIDSQueryControllerProtocol *v12;
  BCSIDSQueryControllerProtocol *v13;
  void *v14;
  id v15;
  NSMutableDictionary *idStatusCompletionBlocks;
  id v17;
  NSMutableDictionary *v18;
  void *v19;
  BCSIDSQueryControllerProtocol *v20;
  BCSIDSQueryControllerProtocol *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  BCSIdentityService *v27;
  _BYTE buf[24];
  void *v29;
  BCSIdentityService *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, BOOL))a4;
  if (v7)
  {
    v8 = MEMORY[0x24BDAC760];
    if (self)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __54__BCSIdentityService__addIDSIDQueryControllerDelegate__block_invoke;
      v29 = &unk_24C39C268;
      v30 = self;
      if (_addIDSIDQueryControllerDelegate_onceToken != -1)
        dispatch_once(&_addIDSIDQueryControllerDelegate_onceToken, buf);
      IDSQueryController = self->_IDSQueryController;
    }
    else
    {
      IDSQueryController = 0;
    }
    v10 = -[BCSIDSQueryControllerProtocol _currentIDStatusForDestination:service:listenerID:](IDSQueryController, "_currentIDStatusForDestination:service:listenerID:", v6, CFSTR("com.apple.private.alloy.biz"), CFSTR("com.apple.businesschatservice.bizItemController"));
    ABSLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[BCSIdentityService refreshIDStatusForBizID:completion:]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      v29 = v6;
      _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s Cached IDSIDStatus result: %ld for destination: %@", buf, 0x20u);
    }

    if (v10)
    {
      if (self)
        v12 = self->_IDSQueryController;
      else
        v12 = 0;
      v13 = v12;
      -[BCSIdentityService serialDispatchQueue](self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v8;
      v23[1] = 3221225472;
      v23[2] = __57__BCSIdentityService_refreshIDStatusForBizID_completion___block_invoke_11;
      v23[3] = &unk_24C39CCE0;
      v24 = v6;
      -[BCSIDSQueryControllerProtocol refreshIDStatusForDestination:service:listenerID:queue:completionBlock:](v13, "refreshIDStatusForDestination:service:listenerID:queue:completionBlock:", v24, CFSTR("com.apple.private.alloy.biz"), CFSTR("com.apple.businesschatservice.bizItemController"), v14, v23);

      v7[2](v7, v10 == 1);
      v15 = v24;
    }
    else
    {
      if (self)
      {
        idStatusCompletionBlocks = self->_idStatusCompletionBlocks;
        if (!idStatusCompletionBlocks)
        {
          v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_storeStrong((id *)&self->_idStatusCompletionBlocks, v17);

          idStatusCompletionBlocks = self->_idStatusCompletionBlocks;
        }
      }
      else
      {

        idStatusCompletionBlocks = 0;
      }
      -[NSMutableDictionary objectForKey:](idStatusCompletionBlocks, "objectForKey:", v6);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v15 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        if (self)
          v18 = self->_idStatusCompletionBlocks;
        else
          v18 = 0;
        -[NSMutableDictionary setValue:forKey:](v18, "setValue:forKey:", v15, v6);
      }
      v19 = (void *)MEMORY[0x20BD30274](v7);
      objc_msgSend(v15, "addObject:", v19);

      if (self)
        v20 = self->_IDSQueryController;
      else
        v20 = 0;
      v21 = v20;
      -[BCSIdentityService serialDispatchQueue](self);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v8;
      v25[1] = 3221225472;
      v25[2] = __57__BCSIdentityService_refreshIDStatusForBizID_completion___block_invoke;
      v25[3] = &unk_24C39CCB8;
      v26 = v6;
      v27 = self;
      -[BCSIDSQueryControllerProtocol refreshIDStatusForDestination:service:listenerID:queue:completionBlock:](v21, "refreshIDStatusForDestination:service:listenerID:queue:completionBlock:", v26, CFSTR("com.apple.private.alloy.biz"), CFSTR("com.apple.businesschatservice.bizItemController"), v22, v25);

    }
  }

}

- (_QWORD)serialDispatchQueue
{
  _QWORD *v1;
  void *v2;
  dispatch_queue_t v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      v3 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.businesschatservice.bizItemController.serialqueue"), "UTF8String"), 0);
      v4 = (void *)v1[2];
      v1[2] = v3;

      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

void __57__BCSIdentityService_refreshIDStatusForBizID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  ABSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v21 = a2;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEFAULT, "IDSIDStatus result: %ld for destination: %@", buf, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    objc_msgSend(*(id *)(v6 + 24), "objectForKey:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, buf, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          if (a2)
          {
            v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
            (*(void (**)(uint64_t, BOOL))(v14 + 16))(v14, a2 == 1);
            v15 = (void *)MEMORY[0x20BD30274](v14);
            objc_msgSend(v8, "addObject:", v15, (_QWORD)v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, buf, 16);
      }
      while (v11);
    }

    objc_msgSend(v9, "minusSet:", v8);
  }
}

void __57__BCSIdentityService_refreshIDStatusForBizID_completion___block_invoke_11(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  ABSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = a2;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEFAULT, "Refreshed IDSIDStatus result: %ld for destination: %@", (uint8_t *)&v6, 0x16u);
  }

}

void __54__BCSIdentityService__addIDSIDQueryControllerDelegate__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;
  id v4;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v2 = (void *)v1[5];
  else
    v2 = 0;
  v3 = v2;
  -[BCSIdentityService serialDispatchQueue](v1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDelegate:forService:listenerID:queue:", v1, CFSTR("com.apple.private.alloy.biz"), CFSTR("com.apple.businesschatservice.bizItemController"), v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IDSQueryController, 0);
  objc_storeStrong((id *)&self->_IDSServiceFactory, 0);
  objc_storeStrong((id *)&self->_idStatusCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_businessChatAccount, 0);
}

@end
