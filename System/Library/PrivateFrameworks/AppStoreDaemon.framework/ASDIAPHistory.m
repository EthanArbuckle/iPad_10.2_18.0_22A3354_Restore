@implementation ASDIAPHistory

+ (id)interface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392550);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getAllIAPsForActiveAccountWithReplyHandler_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getIAPsForActiveAccountWithAdamIDs_withReplyHandler_, 0, 1);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withReplyHandler_, 0, 1);

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_getCachedSubscriptionEntitlementsForSegment_withReplyHandler_, 0, 1);

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withReplyHandler_, 3, 1);

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_getCachedSubscriptionEntitlementsForSegment_withReplyHandler_, 2, 1);

  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__ASDIAPHistory_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFAB28 != -1)
    dispatch_once(&qword_1ECFFAB28, block);
  return (id)_MergedGlobals_46;
}

void __31__ASDIAPHistory_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_46;
  _MergedGlobals_46 = (uint64_t)v1;

}

- (ASDIAPHistory)init
{
  void *v3;
  id v4;
  ASDIAPHistory *v5;
  objc_super v7;

  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDIAPHistory;
    v5 = -[ASDIAPHistory init](&v7, sel_init);
    self = v5;
    if (v5)
      objc_storeStrong((id *)&v5->_serviceBroker, v3);
  }

  return self;
}

- (void)getAllIAPsForActiveAccountWithResultHandler:(id)a3
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
  v7[2] = __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke;
  v7[3] = &unk_1E37BE768;
  v8 = v4;
  v6 = v4;
  -[ASDServiceBroker getIAPHistoryServiceWithCompletionHandler:](serviceBroker, "getIAPHistoryServiceWithCompletionHandler:", v7);

}

void __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  NSObject *v8;
  id *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_2;
    v15[3] = &unk_1E37BDB60;
    v7 = &v16;
    v16 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v15);
    v8 = objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_4;
    v13[3] = &unk_1E37BDBD8;
    v9 = &v14;
    v14 = *(id *)(a1 + 32);
    -[NSObject getAllIAPsForActiveAccountWithReplyHandler:](v8, "getAllIAPsForActiveAccountWithReplyHandler:", v13);
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_6;
    v10[3] = &unk_1E37BDCC0;
    v7 = &v12;
    v12 = *(id *)(a1 + 32);
    v9 = &v11;
    v11 = v5;
    dispatch_async(v8, v10);
  }

}

void __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_5;
  block[3] = &unk_1E37BDF10;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)getIAPsForActiveAccountWithAdamIDs:(id)a3 withResultHandler:(id)a4
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
  v11[2] = __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke;
  v11[3] = &unk_1E37BF598;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[ASDServiceBroker getIAPHistoryServiceWithCompletionHandler:](serviceBroker, "getIAPHistoryServiceWithCompletionHandler:", v11);

}

void __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  NSObject *v8;
  id *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_2;
    v16[3] = &unk_1E37BDB60;
    v7 = &v17;
    v17 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v16);
    v8 = objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_4;
    v14[3] = &unk_1E37BDBD8;
    v9 = &v15;
    v10 = *(_QWORD *)(a1 + 32);
    v15 = *(id *)(a1 + 40);
    -[NSObject getIAPsForActiveAccountWithAdamIDs:withReplyHandler:](v8, "getIAPsForActiveAccountWithAdamIDs:withReplyHandler:", v10, v14);
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_6;
    v11[3] = &unk_1E37BDCC0;
    v7 = &v13;
    v13 = *(id *)(a1 + 40);
    v9 = &v12;
    v12 = v5;
    dispatch_async(v8, v11);
  }

}

void __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_5;
  block[3] = &unk_1E37BDF10;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)refreshIAPsForActiveAccountWithCompletionHandler:(id)a3
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
  v7[2] = __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BE768;
  v8 = v4;
  v6 = v4;
  -[ASDServiceBroker getIAPHistoryServiceWithCompletionHandler:](serviceBroker, "getIAPHistoryServiceWithCompletionHandler:", v7);

}

void __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  NSObject *v9;
  id *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_2;
    v17[3] = &unk_1E37BDB60;
    v8 = &v18;
    v18 = *(id *)(a1 + 32);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v17);
    v9 = objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_4;
    v15[3] = &unk_1E37BDB60;
    v10 = &v16;
    v16 = *(id *)(a1 + 32);
    -[NSObject refreshIAPsForActiveAccountWithReplyHandler:](v9, "refreshIAPsForActiveAccountWithReplyHandler:", v15);
LABEL_5:

    goto LABEL_6;
  }
  v11 = *(void **)(a1 + 32);
  if (v11)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_6;
    v12[3] = &unk_1E37BDCC0;
    v8 = &v14;
    v14 = v11;
    v10 = &v13;
    v13 = v6;
    dispatch_async(v9, v12);
    goto LABEL_5;
  }
LABEL_6:

}

void __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E37BDCC0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_5;
    v6[3] = &unk_1E37BDCC0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
