@implementation ASDPurchaseHistory

+ (id)interface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3923D0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_executeQuery_withReplyHandler_, 0, 1);

  return v2;
}

uint64_t __62__ASDPurchaseHistory_updateWithContext_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateWithContext:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__ASDPurchaseHistory_updateWithContext_withCompletionHandler___block_invoke;
  v9[3] = &unk_1E37BF410;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[ASDServiceBroker getPurchaseHistoryServiceWithCompletionHandler:](serviceBroker, "getPurchaseHistoryServiceWithCompletionHandler:", v9);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ASDPurchaseHistory_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFAAE8 != -1)
    dispatch_once(&qword_1ECFFAAE8, block);
  return (id)_MergedGlobals_42;
}

void __62__ASDPurchaseHistory_updateWithContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__ASDPurchaseHistory_updateWithContext_withCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E37BDB60;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __62__ASDPurchaseHistory_updateWithContext_withCompletionHandler___block_invoke_3;
    v11[3] = &unk_1E37BDB60;
    v9 = *(_QWORD *)(a1 + 40);
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v8, "updateWithContext:withReplyHandler:", v9, v11);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
  }

}

void __36__ASDPurchaseHistory_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_42;
  _MergedGlobals_42 = (uint64_t)v1;

}

- (ASDPurchaseHistory)init
{
  void *v3;
  id v4;
  ASDPurchaseHistory *v5;
  ASDPurchaseHistory *v6;
  NSObject *v7;
  _QWORD handler[4];
  id v10;
  objc_super v11;

  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self
    && (v11.receiver = self,
        v11.super_class = (Class)ASDPurchaseHistory,
        (v5 = -[ASDPurchaseHistory init](&v11, sel_init)) != 0))
  {
    v6 = v5;
    objc_storeStrong((id *)&v5->_serviceBroker, v3);

    objc_initWeak(&v11.receiver, v6);
    v6->_databaseChangedNotificationToken = -1;
    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __26__ASDPurchaseHistory_init__block_invoke;
    handler[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v10, &v11.receiver);
    notify_register_dispatch("com.apple.appstored.PurchaseHistoryDatabaseUpdated", &v6->_databaseChangedNotificationToken, v7, handler);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v11.receiver);
  }
  else
  {

    return 0;
  }
  return v6;
}

void __26__ASDPurchaseHistory_init__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASDPurchaseHistoryDidChangeNotification"), WeakRetained);

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_databaseChangedNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)ASDPurchaseHistory;
  -[ASDPurchaseHistory dealloc](&v3, sel_dealloc);
}

- (void)executeQuery:(id)a3 withResultHandler:(id)a4
{
  id v6;
  id v7;
  ASDServiceBroker *serviceBroker;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__ASDPurchaseHistory_executeQuery_withResultHandler___block_invoke;
  v11[3] = &unk_1E37BF370;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[ASDServiceBroker getPurchaseHistoryServiceWithCompletionHandler:](serviceBroker, "getPurchaseHistoryServiceWithCompletionHandler:", v11);

}

void __53__ASDPurchaseHistory_executeQuery_withResultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__ASDPurchaseHistory_executeQuery_withResultHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __53__ASDPurchaseHistory_executeQuery_withResultHandler___block_invoke_3;
    v7[3] = &unk_1E37BDBD8;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "executeQuery:withReplyHandler:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __53__ASDPurchaseHistory_executeQuery_withResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__ASDPurchaseHistory_executeQuery_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setHidden:(BOOL)a3 forStoreItemID:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  ASDServiceBroker *serviceBroker;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;
  BOOL v14;

  v8 = a5;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__ASDPurchaseHistory_setHidden_forStoreItemID_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E37BF398;
  v14 = a3;
  v12 = v8;
  v13 = a4;
  v10 = v8;
  -[ASDServiceBroker getPurchaseHistoryServiceWithCompletionHandler:](serviceBroker, "getPurchaseHistoryServiceWithCompletionHandler:", v11);

}

void __69__ASDPurchaseHistory_setHidden_forStoreItemID_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__ASDPurchaseHistory_setHidden_forStoreItemID_withCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E37BDB60;
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned __int8 *)(a1 + 48);
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __69__ASDPurchaseHistory_setHidden_forStoreItemID_withCompletionHandler___block_invoke_3;
    v12[3] = &unk_1E37BDB60;
    v10 = *(_QWORD *)(a1 + 40);
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v8, "setHidden:forStoreItemID:withReplyHandler:", v9, v10, v12);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
  }

}

uint64_t __69__ASDPurchaseHistory_setHidden_forStoreItemID_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __69__ASDPurchaseHistory_setHidden_forStoreItemID_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)showAllWithCompletionHandler:(id)a3
{
  id v4;
  ASDServiceBroker *serviceBroker;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  serviceBroker = self->_serviceBroker;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__ASDPurchaseHistory_showAllWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BF3C0;
  v8 = v4;
  v6 = v4;
  -[ASDServiceBroker getPurchaseHistoryServiceWithCompletionHandler:](serviceBroker, "getPurchaseHistoryServiceWithCompletionHandler:", v7);

}

void __51__ASDPurchaseHistory_showAllWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__ASDPurchaseHistory_showAllWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E37BDB60;
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __51__ASDPurchaseHistory_showAllWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E37BDB60;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v8, "showAllWithReplyHandler:", v10);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
  }

}

uint64_t __51__ASDPurchaseHistory_showAllWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __51__ASDPurchaseHistory_showAllWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateForAccountID:(int64_t)a3 withCompletionHandler:(id)a4
{
  -[ASDPurchaseHistory updateForAccountID:withContext:withCompletionHandler:](self, "updateForAccountID:withContext:withCompletionHandler:", a3, 0, a4);
}

- (void)updateForAccountID:(int64_t)a3 withContext:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  ASDServiceBroker *serviceBroker;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;
  unint64_t v14;

  v8 = a5;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__ASDPurchaseHistory_updateForAccountID_withContext_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E37BF3E8;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v10 = v8;
  -[ASDServiceBroker getPurchaseHistoryServiceWithCompletionHandler:](serviceBroker, "getPurchaseHistoryServiceWithCompletionHandler:", v11);

}

void __75__ASDPurchaseHistory_updateForAccountID_withContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__ASDPurchaseHistory_updateForAccountID_withContext_withCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E37BDB60;
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __75__ASDPurchaseHistory_updateForAccountID_withContext_withCompletionHandler___block_invoke_3;
    v12[3] = &unk_1E37BDB60;
    v10 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v8, "updateForAccountID:withContext:withReplyHandler:", v10, v9, v12);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
  }

}

uint64_t __75__ASDPurchaseHistory_updateForAccountID_withContext_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __75__ASDPurchaseHistory_updateForAccountID_withContext_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateWithCompletionHandler:(id)a3
{
  -[ASDPurchaseHistory updateWithContext:withCompletionHandler:](self, "updateWithContext:withCompletionHandler:", 0, a3);
}

uint64_t __62__ASDPurchaseHistory_updateWithContext_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
