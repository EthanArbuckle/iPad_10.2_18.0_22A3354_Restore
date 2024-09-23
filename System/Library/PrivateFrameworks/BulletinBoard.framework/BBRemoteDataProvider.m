@implementation BBRemoteDataProvider

void __78__BBRemoteDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__BBRemoteDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke_2;
  v7[3] = &unk_24C5651C8;
  v6 = *(_OWORD *)(a1 + 48);
  v5 = (id)v6;
  v8 = v6;
  objc_msgSend(a2, "bulletinsWithRequestParameters:lastCleared:completion:", v3, v4, v7);

}

- (id)sectionIdentifier
{
  return self->_sectionID;
}

- (void)reloadIdentityWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

uint64_t __40__BBRemoteDataProvider_calloutToServer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__BBRemoteDataProvider_reloadDefaultSectionInfo___block_invoke_2(uint64_t a1)
{
  BBDataProviderReloadDefaultSectionInfo(*(void **)(a1 + 32));
}

void __43__BBRemoteDataProvider_invalidateBulletins__block_invoke(uint64_t a1)
{
  BBDataProviderInvalidateBulletins(*(void **)(a1 + 32));
}

uint64_t __78__BBRemoteDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __43__BBRemoteDataProvider__sendClientRequest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)invalidateBulletins
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __43__BBRemoteDataProvider_invalidateBulletins__block_invoke;
  v2[3] = &unk_24C562E28;
  v2[4] = self;
  -[BBRemoteDataProvider calloutToServer:](self, "calloutToServer:", v2);
}

void __49__BBRemoteDataProvider_reloadDefaultSectionInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIdentity:", *(_QWORD *)(a1 + 40));
    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __49__BBRemoteDataProvider_reloadDefaultSectionInfo___block_invoke_2;
    v7[3] = &unk_24C562E28;
    v7[4] = v6;
    objc_msgSend(v6, "calloutToServer:", v7);
  }
}

- (void)calloutToServer:(id)a3
{
  id v4;
  NSObject *serverControlQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  serverControlQueue = self->_serverControlQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__BBRemoteDataProvider_calloutToServer___block_invoke;
  block[3] = &unk_24C5632A8;
  v8 = v4;
  v6 = v4;
  dispatch_async(serverControlQueue, block);

}

- (void)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *replyQueue;
  id v18;
  void *v19;
  _QWORD block[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  NSObject *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBRemoteDataProvider.m"), 496, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = dispatch_group_create();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__13;
  v28[4] = __Block_byref_object_dispose__13;
  v29 = 0;
  -[BBDataProvider identity](self, "identity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "traits") & 4) != 0 || (objc_msgSend(v13, "traits") & 8) != 0)
    v14 = 1;
  else
    v14 = (objc_msgSend(v13, "traits") >> 4) & 1;
  v15 = -[BBRemoteDataProvider checkResponds:forSelector:](self, "checkResponds:forSelector:", v14, sel_bulletinsWithRequestParameters_lastCleared_completion_);
  v16 = MEMORY[0x24BDAC760];
  if (v15 && objc_msgSend(v9, "publisherDestination") == 2)
  {
    dispatch_group_enter(v12);
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __78__BBRemoteDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke;
    v23[3] = &unk_24C5651F0;
    v24 = v9;
    v25 = v10;
    v27 = v28;
    v26 = v12;
    -[BBRemoteDataProvider _sendClientRequest:](self, "_sendClientRequest:", v23);

  }
  replyQueue = self->_replyQueue;
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __78__BBRemoteDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke_3;
  block[3] = &unk_24C565218;
  v21 = v11;
  v22 = v28;
  v18 = v11;
  dispatch_group_notify(v12, replyQueue, block);

  _Block_object_dispose(v28, 8);
}

- (BOOL)checkResponds:(BOOL)a3 forSelector:(SEL)a4
{
  if (!a3)
    -[BBRemoteDataProvider _logDoesNotRespond:](self, "_logDoesNotRespond:", a4);
  return a3;
}

- (void)_sendClientRequest:(id)a3
{
  id v4;
  NSObject *proxyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (!self->_connected)
    -[BBRemoteDataProviderDelegate remoteDataProviderNeedsToWakeClient:](self->_delegate, "remoteDataProviderNeedsToWakeClient:", self);
  proxyQueue = self->_proxyQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__BBRemoteDataProvider__sendClientRequest___block_invoke;
  v7[3] = &unk_24C5631E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(proxyQueue, v7);

}

void __78__BBRemoteDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)reloadDefaultSectionInfo:(id)a3
{
  id v4;
  NSObject *replyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  replyQueue = self->_replyQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__BBRemoteDataProvider_reloadDefaultSectionInfo___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(replyQueue, v7);

}

- (void)noteSectionInfoDidChange:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[BBDataProvider identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BBRemoteDataProvider checkResponds:forSelector:](self, "checkResponds:forSelector:", (objc_msgSend(v5, "traits") >> 18) & 1, sel_noteSectionInfoDidChange_))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__BBRemoteDataProvider_noteSectionInfoDidChange___block_invoke;
    v6[3] = &unk_24C5652E0;
    v7 = v4;
    -[BBRemoteDataProvider _sendClientRequest:](self, "_sendClientRequest:", v6);

  }
}

- (void)_logDoesNotRespond:(const char *)a3 .cold.1(void *a1, void *a2, const char *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = a1;
  objc_msgSend(a2, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_20CCB9000, v7, v8, "BBRemoteDataProvider: %{public}@ does not respond to %{public}@", v9, v10, v11, v12, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_logDoesNotRespond:(SEL)a3
{
  void *v5;

  v5 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
    -[BBRemoteDataProvider _logDoesNotRespond:].cold.1(v5, self, a3);
}

- (BBRemoteDataProvider)initWithSectionID:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  BBRemoteDataProvider *v8;
  uint64_t v9;
  NSString *sectionID;
  dispatch_queue_t v11;
  OS_dispatch_queue *proxyQueue;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  dispatch_queue_t v16;
  OS_dispatch_queue *serverControlQueue;

  v6 = a3;
  v7 = a4;
  v8 = -[BBRemoteDataProvider init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    sectionID = v8->_sectionID;
    v8->_sectionID = (NSString *)v9;

    objc_storeStrong((id *)&v8->_replyQueue, (id)__BBServerQueue);
    v11 = dispatch_queue_create("com.apple.bulletinboard.BBRemoteDataProvider.proxyQueue", 0);
    proxyQueue = v8->_proxyQueue;
    v8->_proxyQueue = (OS_dispatch_queue *)v11;

    dispatch_suspend((dispatch_object_t)v8->_proxyQueue);
    v8->_connected = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.bulletinboard.BBRemoteDataProvider", v13);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v14;

    dispatch_set_target_queue((dispatch_object_t)v8->_proxyQueue, (dispatch_queue_t)v8->_queue);
    v16 = dispatch_queue_create("com.apple.bulletinboard.BBRemoteDataProvider.serverControlQueue", 0);
    serverControlQueue = v8->_serverControlQueue;
    v8->_serverControlQueue = (OS_dispatch_queue *)v16;

    dispatch_suspend((dispatch_object_t)v8->_serverControlQueue);
    dispatch_set_target_queue((dispatch_object_t)v8->_serverControlQueue, (dispatch_queue_t)__BBServerQueue);
    objc_storeStrong((id *)&v8->_delegate, a4);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_connected)
    dispatch_resume((dispatch_object_t)self->_proxyQueue);
  if (!self->_serverIsReady)
    dispatch_resume((dispatch_object_t)self->_serverControlQueue);
  v3.receiver = self;
  v3.super_class = (Class)BBRemoteDataProvider;
  -[BBRemoteDataProvider dealloc](&v3, sel_dealloc);
}

- (id)debugDescriptionWithChildren:(unint64_t)a3
{
  void *i;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24C5686F0);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
    objc_msgSend(i, "appendString:", CFSTR("    "));
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@<%@: %p> %@"), i, v8, self, self->_sectionID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)debugDescription
{
  return (NSString *)-[BBRemoteDataProvider debugDescriptionWithChildren:](self, "debugDescriptionWithChildren:", 0);
}

- (void)setServerIsReady:(BOOL)a3
{
  NSObject *serverControlQueue;

  if (self->_serverIsReady != a3)
  {
    self->_serverIsReady = a3;
    serverControlQueue = self->_serverControlQueue;
    if (a3)
      dispatch_resume(serverControlQueue);
    else
      dispatch_suspend(serverControlQueue);
  }
}

- (void)setClientProxy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__BBRemoteDataProvider_setClientProxy_completion___block_invoke;
  block[3] = &unk_24C563280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __50__BBRemoteDataProvider_setClientProxy_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(void **)(v3 + 48);
  if (v4 != v2)
  {
    if (v4)
      v5 = 1;
    else
      v5 = v2 == 0;
    if (v5)
    {
      if (v4)
        v6 = v2 == 0;
      else
        v6 = 0;
      if (v6)
      {
        *(_BYTE *)(v3 + 56) = 0;
        dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(void **)(v7 + 48);
        *(_QWORD *)(v7 + 48) = 0;

      }
      else
      {
        objc_storeStrong((id *)(v3 + 48), v2);
      }
    }
    else
    {
      *(_BYTE *)(v3 + 56) = 1;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
    }
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dataProviderDidLoad
{
  -[BBRemoteDataProvider _sendClientRequest:](self, "_sendClientRequest:", &__block_literal_global_146_0);
}

uint64_t __43__BBRemoteDataProvider_dataProviderDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dataProviderDidLoad");
}

- (void)clearedInfoForClearingAllBulletinsWithLastClearedInfo:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  NSObject *replyQueue;
  id v14;
  void *v15;
  _QWORD block[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBRemoteDataProvider.m"), 521, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = dispatch_group_create();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__13;
  v23[4] = __Block_byref_object_dispose__13;
  v24 = 0;
  -[BBDataProvider identity](self, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BBRemoteDataProvider checkResponds:forSelector:](self, "checkResponds:forSelector:", (objc_msgSend(v10, "traits") >> 6) & 1, sel_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion_);
  v12 = MEMORY[0x24BDAC760];
  if (v11)
  {
    dispatch_group_enter(v9);
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __89__BBRemoteDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke;
    v19[3] = &unk_24C565268;
    v20 = v7;
    v22 = v23;
    v21 = v9;
    -[BBRemoteDataProvider _sendClientRequest:](self, "_sendClientRequest:", v19);

  }
  replyQueue = self->_replyQueue;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __89__BBRemoteDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_3;
  block[3] = &unk_24C565218;
  v17 = v8;
  v18 = v23;
  v14 = v8;
  dispatch_group_notify(v9, replyQueue, block);

  _Block_object_dispose(v23, 8);
}

void __89__BBRemoteDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __89__BBRemoteDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_2;
  v6[3] = &unk_24C565240;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(a2, "clearedInfoForClearingAllBulletinsWithLastClearedInfo:completion:", v3, v6);

}

void __89__BBRemoteDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __89__BBRemoteDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)clearedInfoForClearingBulletinsFromDate:(id)a3 toDate:(id)a4 lastClearedInfo:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  NSObject *replyQueue;
  id v20;
  void *v21;
  _QWORD block[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBRemoteDataProvider.m"), 545, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v15 = dispatch_group_create();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__13;
  v31[4] = __Block_byref_object_dispose__13;
  v32 = 0;
  -[BBDataProvider identity](self, "identity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[BBRemoteDataProvider checkResponds:forSelector:](self, "checkResponds:forSelector:", (objc_msgSend(v16, "traits") >> 6) & 1, sel_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion_);
  v18 = MEMORY[0x24BDAC760];
  if (v17)
  {
    dispatch_group_enter(v15);
    v25[0] = v18;
    v25[1] = 3221225472;
    v25[2] = __98__BBRemoteDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke;
    v25[3] = &unk_24C565290;
    v26 = v11;
    v27 = v12;
    v28 = v13;
    v30 = v31;
    v29 = v15;
    -[BBRemoteDataProvider _sendClientRequest:](self, "_sendClientRequest:", v25);

  }
  replyQueue = self->_replyQueue;
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __98__BBRemoteDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_3;
  block[3] = &unk_24C565218;
  v23 = v14;
  v24 = v31;
  v20 = v14;
  dispatch_group_notify(v15, replyQueue, block);

  _Block_object_dispose(v31, 8);
}

void __98__BBRemoteDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __98__BBRemoteDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_2;
  v8[3] = &unk_24C565240;
  v7 = *(_OWORD *)(a1 + 56);
  v6 = (id)v7;
  v9 = v7;
  objc_msgSend(a2, "clearedInfoForClearingBulletinsFromDate:toDate:lastClearedInfo:completion:", v3, v4, v5, v8);

}

void __98__BBRemoteDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __98__BBRemoteDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *replyQueue;
  id v18;
  void *v19;
  _QWORD block[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  NSObject *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBRemoteDataProvider.m"), 569, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = dispatch_group_create();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__13;
  v28[4] = __Block_byref_object_dispose__13;
  v29 = 0;
  -[BBDataProvider identity](self, "identity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "traits") & 0x20) != 0)
    v14 = 1;
  else
    v14 = (objc_msgSend(v13, "traits") >> 8) & 1;
  v15 = -[BBRemoteDataProvider checkResponds:forSelector:](self, "checkResponds:forSelector:", v14, sel_clearedInfoForBulletins_lastClearedInfo_);
  v16 = MEMORY[0x24BDAC760];
  if (v15)
  {
    dispatch_group_enter(v12);
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __75__BBRemoteDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke;
    v23[3] = &unk_24C5651F0;
    v24 = v9;
    v25 = v10;
    v27 = v28;
    v26 = v12;
    -[BBRemoteDataProvider _sendClientRequest:](self, "_sendClientRequest:", v23);

  }
  replyQueue = self->_replyQueue;
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __75__BBRemoteDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_3;
  block[3] = &unk_24C565218;
  v21 = v11;
  v22 = v28;
  v18 = v11;
  dispatch_group_notify(v12, replyQueue, block);

  _Block_object_dispose(v28, 8);
}

void __75__BBRemoteDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__BBRemoteDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_2;
  v7[3] = &unk_24C565240;
  v6 = *(_OWORD *)(a1 + 48);
  v5 = (id)v6;
  v8 = v6;
  objc_msgSend(a2, "clearedInfoForBulletins:lastClearedInfo:completion:", v3, v4, v7);

}

void __75__BBRemoteDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __75__BBRemoteDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)deliverResponse:(id)a3 forBulletinRequest:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  void (**v20)(id, _QWORD);
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  -[BBDataProvider identity](self, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "traits") & 0x100000) != 0)
    v12 = 1;
  else
    v12 = (objc_msgSend(v11, "traits") >> 21) & 1;
  v13 = -[BBRemoteDataProvider checkResponds:forSelector:](self, "checkResponds:forSelector:", v12, sel_handleBulletinActionResponse_withCompletion_);
  v14 = (void *)BBLogGeneral;
  if (!v13)
  {
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
    {
      -[BBRemoteDataProvider deliverResponse:forBulletinRequest:withCompletion:].cold.1(v14);
      if (!v10)
        goto LABEL_11;
    }
    else if (!v10)
    {
      goto LABEL_11;
    }
    v10[2](v10, 0);
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    *(_DWORD *)buf = 138543618;
    v22 = (id)objc_opt_class();
    v23 = 2114;
    v24 = v8;
    v16 = v22;
    _os_log_impl(&dword_20CCB9000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ sending client request for response %{public}@", buf, 0x16u);

  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __74__BBRemoteDataProvider_deliverResponse_forBulletinRequest_withCompletion___block_invoke;
  v17[3] = &unk_24C5652B8;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  -[BBRemoteDataProvider _sendClientRequest:](self, "_sendClientRequest:", v17);

LABEL_11:
}

void __74__BBRemoteDataProvider_deliverResponse_forBulletinRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v3;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ delivering bulletin action for response %{public}@", buf, 0x16u);
  }
  +[BBActionResponse actionResponseForResponse:bulletinRequest:](BBActionResponse, "actionResponseForResponse:bulletinRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__BBRemoteDataProvider_deliverResponse_forBulletinRequest_withCompletion___block_invoke_156;
  v8[3] = &unk_24C563398;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v7 = v3;
  objc_msgSend(v7, "deliverBulletinActionResponse:withCompletion:", v6, v8);

}

uint64_t __74__BBRemoteDataProvider_deliverResponse_forBulletinRequest_withCompletion___block_invoke_156(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v5;
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ completed action delivery with success=%d", (uint8_t *)&v7, 0x12u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __49__BBRemoteDataProvider_noteSectionInfoDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "noteSectionInfoDidChange:", *(_QWORD *)(a1 + 32));
}

- (void)updateClearedInfoWithClearedInfo:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  v9 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBRemoteDataProvider.m"), 626, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    v7 = 0;
  }
  (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);

}

- (void)updateSectionInfoWithSectionInfo:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  v9 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBRemoteDataProvider.m"), 632, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    v7 = 0;
  }
  (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);

}

- (BOOL)canPerformMigration
{
  return 0;
}

- (BOOL)migrateSectionInfo:(id)a3 oldSectionInfo:(id)a4
{
  return 0;
}

- (void)deliverMessageWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  -[BBDataProvider identity](self, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BBRemoteDataProvider checkResponds:forSelector:](self, "checkResponds:forSelector:", (objc_msgSend(v8, "traits") >> 17) & 1, sel_receiveMessageWithName_userInfo_))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __56__BBRemoteDataProvider_deliverMessageWithName_userInfo___block_invoke;
    v9[3] = &unk_24C565308;
    v10 = v6;
    v11 = v7;
    -[BBRemoteDataProvider _sendClientRequest:](self, "_sendClientRequest:", v9);

  }
}

uint64_t __56__BBRemoteDataProvider_deliverMessageWithName_userInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deliverMessageWithName:userInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)addBulletin:(id)a3 forDestinations:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__BBRemoteDataProvider_addBulletin_forDestinations___block_invoke;
  v8[3] = &unk_24C5632D0;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[BBRemoteDataProvider calloutToServer:](self, "calloutToServer:", v8);

}

uint64_t __52__BBRemoteDataProvider_addBulletin_forDestinations___block_invoke(_QWORD *a1)
{
  return BBDataProviderAddBulletinForDestinations(a1[4], a1[5], a1[6]);
}

- (void)modifyBulletin:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__BBRemoteDataProvider_modifyBulletin___block_invoke;
  v6[3] = &unk_24C562E50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BBRemoteDataProvider calloutToServer:](self, "calloutToServer:", v6);

}

void __39__BBRemoteDataProvider_modifyBulletin___block_invoke(uint64_t a1)
{
  BBDataProviderModifyBulletin(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)withdrawBulletinsWithRecordID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__BBRemoteDataProvider_withdrawBulletinsWithRecordID___block_invoke;
  v6[3] = &unk_24C562E50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BBRemoteDataProvider calloutToServer:](self, "calloutToServer:", v6);

}

void __54__BBRemoteDataProvider_withdrawBulletinsWithRecordID___block_invoke(uint64_t a1)
{
  BBDataProviderWithdrawBulletinsWithRecordID(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)withdrawBulletinWithPublisherBulletinID:(id)a3
{
  -[BBRemoteDataProvider withdrawBulletinWithPublisherBulletinID:shouldSync:](self, "withdrawBulletinWithPublisherBulletinID:shouldSync:", a3, 1);
}

- (void)withdrawBulletinWithPublisherBulletinID:(id)a3 shouldSync:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__BBRemoteDataProvider_withdrawBulletinWithPublisherBulletinID_shouldSync___block_invoke;
  v8[3] = &unk_24C5632F8;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[BBRemoteDataProvider calloutToServer:](self, "calloutToServer:", v8);

}

void __75__BBRemoteDataProvider_withdrawBulletinWithPublisherBulletinID_shouldSync___block_invoke(uint64_t a1)
{
  BBDataProviderWithdrawBulletinWithPublisherBulletinIDShouldSync(*(void **)(a1 + 32), *(void **)(a1 + 40), *(_BYTE *)(a1 + 48));
}

- (void)reloadSectionParameters:(id)a3
{
  id v4;
  NSObject *replyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  replyQueue = self->_replyQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__BBRemoteDataProvider_reloadSectionParameters___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(replyQueue, v7);

}

void __48__BBRemoteDataProvider_reloadSectionParameters___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIdentity:", *(_QWORD *)(a1 + 40));
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __48__BBRemoteDataProvider_reloadSectionParameters___block_invoke_2;
    v6[3] = &unk_24C562E28;
    v6[4] = v5;
    objc_msgSend(v5, "calloutToServer:", v6);
  }
}

void __48__BBRemoteDataProvider_reloadSectionParameters___block_invoke_2(uint64_t a1)
{
  BBDataProviderInvalidateSectionParameters(*(void **)(a1 + 32));
}

- (void)getClearedInfoWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__BBRemoteDataProvider_getClearedInfoWithCompletion___block_invoke;
  v6[3] = &unk_24C563518;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BBRemoteDataProvider calloutToServer:](self, "calloutToServer:", v6);

}

void __53__BBRemoteDataProvider_getClearedInfoWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __53__BBRemoteDataProvider_getClearedInfoWithCompletion___block_invoke_2;
  v2[3] = &unk_24C565330;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  _BBDataProviderGetClearedInfoWithCompletion(v1, v2);

}

uint64_t __53__BBRemoteDataProvider_getClearedInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setClearedInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__BBRemoteDataProvider_setClearedInfo___block_invoke;
  v6[3] = &unk_24C562E50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BBRemoteDataProvider calloutToServer:](self, "calloutToServer:", v6);

}

void __39__BBRemoteDataProvider_setClearedInfo___block_invoke(uint64_t a1)
{
  _BBDataProviderSetClearedInfo(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)getSectionInfoWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__BBRemoteDataProvider_getSectionInfoWithCompletion___block_invoke;
  v6[3] = &unk_24C563518;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BBRemoteDataProvider calloutToServer:](self, "calloutToServer:", v6);

}

void __53__BBRemoteDataProvider_getSectionInfoWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __53__BBRemoteDataProvider_getSectionInfoWithCompletion___block_invoke_2;
  v2[3] = &unk_24C565358;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  _BBDataProviderGetSectionInfoWithCompletion(v1, v2);

}

uint64_t __53__BBRemoteDataProvider_getSectionInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setSectionInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__BBRemoteDataProvider_setSectionInfo___block_invoke;
  v6[3] = &unk_24C562E50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BBRemoteDataProvider calloutToServer:](self, "calloutToServer:", v6);

}

void __39__BBRemoteDataProvider_setSectionInfo___block_invoke(uint64_t a1)
{
  _BBDataProviderSetSectionInfo(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_serverControlQueue, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_proxyQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

- (void)deliverResponse:(void *)a1 forBulletinRequest:withCompletion:.cold.1(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_1_0(&dword_20CCB9000, v3, v4, "%{public}@ could not deliver response %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
