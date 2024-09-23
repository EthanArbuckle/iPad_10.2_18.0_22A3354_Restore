@implementation BBDataProviderProxy

uint64_t __42__BBDataProviderProxy__makeServerRequest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

uint64_t __42__BBDataProviderProxy_invalidateBulletins__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateBulletins");
}

uint64_t __77__BBDataProviderProxy_bulletinsWithRequestParameters_lastCleared_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __42__BBDataProviderProxy__makeClientRequest___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  return result;
}

void __38__BBDataProviderProxy_updateIdentity___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  +[BBDataProviderIdentity identityForRemoteDataProvider:](BBDataProviderIdentity, "identityForRemoteDataProvider:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIdentity:");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)setIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

void __47__BBDataProviderProxy_reloadDefaultSectionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__BBDataProviderProxy_reloadDefaultSectionInfo__block_invoke_2;
  v6[3] = &unk_24C564E90;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_makeServerRequest:", v6);

}

void __77__BBDataProviderProxy_bulletinsWithRequestParameters_lastCleared_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "traits") & 4) != 0)
  {
    objc_msgSend(v3, "bulletinsWithRequestParameters:lastCleared:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v6 = (void *)v7;
    goto LABEL_9;
  }
  if ((objc_msgSend(v4, "traits") & 0x10) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "enabledSectionIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bulletinsFilteredBy:enabledSectionIDs:count:lastCleared:", 0, v8, objc_msgSend(*(id *)(a1 + 40), "maximumCount"), *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if ((objc_msgSend(v4, "traits") & 8) != 0)
  {
    objc_msgSend(v3, "bulletinsFilteredBy:count:lastCleared:", 0, objc_msgSend(*(id *)(a1 + 40), "maximumCount"), *(_QWORD *)(a1 + 48));
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v5 = objc_opt_class();
  NSLog(CFSTR("%@: Data provider does not respond to any bulletin request methods: %@"), v5, v3);
  v6 = 0;
LABEL_9:
  v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__BBDataProviderProxy_bulletinsWithRequestParameters_lastCleared_completion___block_invoke_2;
  v12[3] = &unk_24C565068;
  v10 = *(id *)(a1 + 56);
  v13 = v6;
  v14 = v10;
  v11 = v6;
  objc_msgSend(v9, "_makeServerRequest:", v12);

}

- (void)_makeServerRequest:(id)a3
{
  id v4;
  NSObject *proxyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  proxyQueue = self->_proxyQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__BBDataProviderProxy__makeServerRequest___block_invoke;
  v7[3] = &unk_24C5631E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(proxyQueue, v7);

}

- (BBDataProviderIdentity)identity
{
  return (BBDataProviderIdentity *)objc_getProperty(self, a2, 24, 1);
}

uint64_t __47__BBDataProviderProxy_reloadDefaultSectionInfo__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadDefaultSectionInfo:", *(_QWORD *)(a1 + 32));
}

- (void)invalidateBulletins
{
  -[BBDataProviderProxy _makeServerRequest:](self, "_makeServerRequest:", &__block_literal_global_22);
}

- (void)reloadDefaultSectionInfo
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __47__BBDataProviderProxy_reloadDefaultSectionInfo__block_invoke;
  v2[3] = &unk_24C564EE0;
  v2[4] = self;
  -[BBDataProviderProxy updateIdentity:](self, "updateIdentity:", v2);
}

- (void)updateIdentity:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__BBDataProviderProxy_updateIdentity___block_invoke;
  v6[3] = &unk_24C564E20;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BBDataProviderProxy _makeClientRequest:](self, "_makeClientRequest:", v6);

}

- (void)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__BBDataProviderProxy_bulletinsWithRequestParameters_lastCleared_completion___block_invoke;
  v14[3] = &unk_24C565090;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[BBDataProviderProxy _makeClientRequest:](self, "_makeClientRequest:", v14);

}

- (void)_makeClientRequest:(id)a3
{
  id v4;
  NSObject *clientCalloutQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientCalloutQueue = self->_clientCalloutQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__BBDataProviderProxy__makeClientRequest___block_invoke;
  v7[3] = &unk_24C5631E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientCalloutQueue, v7);

}

- (BBDataProviderProxy)initWithDataProvider:(id)a3 clientReplyQueue:(id)a4
{
  id v7;
  id v8;
  BBDataProviderProxy *v9;
  BBDataProviderProxy *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  dispatch_queue_t v14;
  OS_dispatch_queue *proxyQueue;

  v7 = a3;
  v8 = a4;
  v9 = -[BBDataProviderProxy init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientCalloutQueue, a4);
    objc_storeStrong((id *)&v10->_dataProvider, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.bulletinboard.BBDataProviderProxy.queue", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_create("com.apple.bulletinboard.BBDataProviderProxy.proxyQueue", 0);
    proxyQueue = v10->_proxyQueue;
    v10->_proxyQueue = (OS_dispatch_queue *)v14;

    dispatch_suspend((dispatch_object_t)v10->_proxyQueue);
    dispatch_set_target_queue((dispatch_object_t)v10->_proxyQueue, (dispatch_queue_t)v10->_queue);
    v10->_connected = 0;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_connected)
    dispatch_resume((dispatch_object_t)self->_proxyQueue);
  v3.receiver = self;
  v3.super_class = (Class)BBDataProviderProxy;
  -[BBDataProviderProxy dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  -[BBRemoteDataProvider sectionIdentifier](self->_dataProvider, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; dataProvider: %@ (%@)>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setServerProxy:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  NSObject *queue;
  id v10;
  _QWORD v11[4];
  id v12;
  BBDataProviderProxy *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting server proxy: %{public}@", buf, 0x16u);

  }
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__BBDataProviderProxy_setServerProxy___block_invoke;
  v11[3] = &unk_24C562E50;
  v12 = v4;
  v13 = self;
  v10 = v4;
  dispatch_async(queue, v11);

}

void __38__BBDataProviderProxy_setServerProxy___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v2 + 48);
  v4 = (id *)(v2 + 48);
  v5 = v6;
  if (v3 != v6)
  {
    if (v3)
      v7 = 1;
    else
      v7 = v5 == 0;
    if (v7)
    {
      if (v3)
        v8 = v5 == 0;
      else
        v8 = 0;
      if (v8)
      {
        v16 = (void *)BBLogConnection;
        if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v16;
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543362;
          v21 = v19;
          _os_log_impl(&dword_20CCB9000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming proxy queue", (uint8_t *)&v20, 0xCu);

        }
        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 56) = 1;
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 48), *(id *)(a1 + 32));
        dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 40));
      }
      else
      {
        objc_storeStrong(v4, v3);
      }
    }
    else
    {
      v9 = (void *)BBLogConnection;
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v9;
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v13;
        _os_log_impl(&dword_20CCB9000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ suspending proxy queue", (uint8_t *)&v20, 0xCu);

      }
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 56) = 0;
      dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 40));
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(void **)(v14 + 48);
      *(_QWORD *)(v14 + 48) = 0;

    }
  }
}

- (void)addBulletin:(id)a3 interrupt:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 78;
  else
    v4 = 2;
  -[BBDataProviderProxy addBulletin:forDestinations:](self, "addBulletin:forDestinations:", a3, v4);
}

- (void)addBulletin:(id)a3 forDestinations:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)BBLogBulletinLife;
  if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[BBDataProviderProxy identity](self, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sectionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v10;
    _os_log_impl(&dword_20CCB9000, v8, OS_LOG_TYPE_DEFAULT, "BBDataProviderProxy %{public}@ has enqueued a bulletin request", buf, 0xCu);

  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__BBDataProviderProxy_addBulletin_forDestinations___block_invoke;
  v12[3] = &unk_24C564E68;
  v12[4] = self;
  v13 = v6;
  v14 = a4;
  v11 = v6;
  -[BBDataProviderProxy _makeServerRequest:](self, "_makeServerRequest:", v12);

}

void __51__BBDataProviderProxy_addBulletin_forDestinations___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)BBLogBulletinLife;
  if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)a1[4];
    v6 = v4;
    objc_msgSend(v5, "identity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "BBDataProviderProxy %{public}@ is now sending enqueued bulletin request to BBServer", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(v3, "addBulletin:forDestinations:", a1[5], a1[6]);

}

- (void)modifyBulletin:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__BBDataProviderProxy_modifyBulletin___block_invoke;
  v6[3] = &unk_24C564E90;
  v7 = v4;
  v5 = v4;
  -[BBDataProviderProxy _makeServerRequest:](self, "_makeServerRequest:", v6);

}

uint64_t __38__BBDataProviderProxy_modifyBulletin___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modifyBulletin:", *(_QWORD *)(a1 + 32));
}

- (void)withdrawBulletinsWithRecordID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__BBDataProviderProxy_withdrawBulletinsWithRecordID___block_invoke;
  v6[3] = &unk_24C564E90;
  v7 = v4;
  v5 = v4;
  -[BBDataProviderProxy _makeServerRequest:](self, "_makeServerRequest:", v6);

}

uint64_t __53__BBDataProviderProxy_withdrawBulletinsWithRecordID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "withdrawBulletinsWithRecordID:", *(_QWORD *)(a1 + 32));
}

- (void)withdrawBulletinWithPublisherBulletinID:(id)a3
{
  -[BBDataProviderProxy withdrawBulletinWithPublisherBulletinID:shouldSync:](self, "withdrawBulletinWithPublisherBulletinID:shouldSync:", a3, 1);
}

- (void)withdrawBulletinWithPublisherBulletinID:(id)a3 shouldSync:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__BBDataProviderProxy_withdrawBulletinWithPublisherBulletinID_shouldSync___block_invoke;
  v8[3] = &unk_24C564EB8;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[BBDataProviderProxy _makeServerRequest:](self, "_makeServerRequest:", v8);

}

uint64_t __74__BBDataProviderProxy_withdrawBulletinWithPublisherBulletinID_shouldSync___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "withdrawBulletinWithPublisherBulletinID:shouldSync:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)reloadSectionParameters
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __46__BBDataProviderProxy_reloadSectionParameters__block_invoke;
  v2[3] = &unk_24C564EE0;
  v2[4] = self;
  -[BBDataProviderProxy updateIdentity:](self, "updateIdentity:", v2);
}

void __46__BBDataProviderProxy_reloadSectionParameters__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__BBDataProviderProxy_reloadSectionParameters__block_invoke_2;
  v6[3] = &unk_24C564E90;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_makeServerRequest:", v6);

}

uint64_t __46__BBDataProviderProxy_reloadSectionParameters__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadSectionParameters:", *(_QWORD *)(a1 + 32));
}

- (void)updateClearedInfoWithHandler:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBRemoteDataProvider.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke;
  v8[3] = &unk_24C564F58;
  v8[4] = self;
  v9 = v5;
  v6 = v5;
  -[BBDataProviderProxy _makeServerRequest:](self, "_makeServerRequest:", v8);

}

void __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke_2;
  v4[3] = &unk_24C564F30;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "getClearedInfoWithCompletion:", v4);

}

void __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v5 = a2;
  if (!a3)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke_3;
    v9[3] = &unk_24C564F08;
    v6 = *(void **)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = v8;
    objc_msgSend(v6, "_makeClientRequest:", v9);

  }
}

void __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  (*(void (**)(void))(a1[6] + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 != (void *)a1[4])
  {
    v4 = (void *)a1[5];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke_4;
    v5[3] = &unk_24C564E90;
    v6 = v2;
    objc_msgSend(v4, "_makeServerRequest:", v5);

  }
}

uint64_t __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setClearedInfo:", *(_QWORD *)(a1 + 32));
}

- (void)updateSectionInfoWithHandler:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBRemoteDataProvider.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke;
  v12[3] = &unk_24C565020;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  -[BBDataProviderProxy _makeServerRequest:](self, "_makeServerRequest:", v12);

}

void __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_2;
  v5[3] = &unk_24C564FF8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "getSectionInfoWithCompletion:", v5);

}

void __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_3;
    v15[3] = &unk_24C564FD0;
    v9 = &v18;
    v10 = *(void **)(a1 + 32);
    v18 = *(id *)(a1 + 40);
    v11 = v5;
    v12 = *(_QWORD *)(a1 + 32);
    v16 = v11;
    v17 = v12;
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v10, "_makeClientRequest:", v15);

    goto LABEL_5;
  }
  v7 = *(void **)(a1 + 48);
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_7;
    v13[3] = &unk_24C564F80;
    v9 = &v14;
    v14 = v7;
    objc_msgSend(v8, "_makeClientRequest:", v13);
LABEL_5:

  }
}

void __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  _QWORD v12[2];
  id v13;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_4;
    v11[3] = &unk_24C564FA8;
    v5 = (id *)v12;
    v12[0] = v2;
    v6 = *(id *)(a1 + 56);
    v12[1] = *(_QWORD *)(a1 + 40);
    v13 = v6;
    objc_msgSend(v4, "_makeServerRequest:", v11);

LABEL_5:
    goto LABEL_6;
  }
  v7 = *(void **)(a1 + 56);
  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_6;
    v9[3] = &unk_24C564F80;
    v5 = &v10;
    v10 = v7;
    objc_msgSend(v8, "_makeClientRequest:", v9);
    goto LABEL_5;
  }
LABEL_6:

}

void __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a2, "setSectionInfo:", a1[4]);
  v3 = (void *)a1[6];
  if (v3)
  {
    v4 = (void *)a1[5];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_5;
    v5[3] = &unk_24C564F80;
    v6 = v3;
    objc_msgSend(v4, "_makeClientRequest:", v5);

  }
}

uint64_t __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateSectionInfoWithHandler:(id)a3
{
  -[BBDataProviderProxy updateSectionInfoWithHandler:completion:](self, "updateSectionInfoWithHandler:completion:", a3, 0);
}

- (void)dataProviderDidLoad
{
  void *v3;
  char v4;

  if (!self->_dataProviderDidLoad)
  {
    self->_dataProviderDidLoad = 1;
    -[BBDataProviderProxy identity](self, "identity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "traits");

    if ((v4 & 2) != 0)
      -[BBDataProviderProxy _makeClientRequest:](self, "_makeClientRequest:", &__block_literal_global_19);
  }
}

uint64_t __42__BBDataProviderProxy_dataProviderDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dataProviderDidLoad");
}

- (void)clearedInfoForClearingAllBulletinsWithLastClearedInfo:(id)a3 completion:(id)a4
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
  v10[2] = __88__BBDataProviderProxy_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke;
  v10[3] = &unk_24C5650B8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[BBDataProviderProxy _makeClientRequest:](self, "_makeClientRequest:", v10);

}

void __88__BBDataProviderProxy_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "traits");

  if ((v5 & 0x40) != 0)
  {
    objc_msgSend(v3, "clearedInfoForClearingAllBulletinsWithLastClearedInfo:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_class();
    NSLog(CFSTR("%@: Data provider does not respond to clearedInfoForClearingAllBulletinsWithLastClearedInfo: %@"), v6, v3);
    v7 = 0;
  }
  v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__BBDataProviderProxy_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_2;
  v11[3] = &unk_24C565068;
  v9 = *(id *)(a1 + 48);
  v12 = v7;
  v13 = v9;
  v10 = v7;
  objc_msgSend(v8, "_makeServerRequest:", v11);

}

uint64_t __88__BBDataProviderProxy_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)clearedInfoForClearingBulletinsFromDate:(id)a3 toDate:(id)a4 lastClearedInfo:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __97__BBDataProviderProxy_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke;
  v18[3] = &unk_24C5650E0;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[BBDataProviderProxy _makeClientRequest:](self, "_makeClientRequest:", v18);

}

void __97__BBDataProviderProxy_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "traits");

  if (v5 < 0)
  {
    objc_msgSend(v3, "clearedInfoForClearingBulletinsFromDate:toDate:lastClearedInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_class();
    NSLog(CFSTR("%@: Data provider does not respond to clearedInfoForClearingAllBulletinsWithLastClearedInfo: %@"), v6, v3);
    v7 = 0;
  }
  v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __97__BBDataProviderProxy_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_2;
  v11[3] = &unk_24C565068;
  v9 = *(id *)(a1 + 64);
  v12 = v7;
  v13 = v9;
  v10 = v7;
  objc_msgSend(v8, "_makeServerRequest:", v11);

}

uint64_t __97__BBDataProviderProxy_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  BBDataProviderProxy *v20;
  id v21;
  char v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BBDataProviderProxy identity](self, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "traits") & 0x20;
  if (v12)
    LOBYTE(v13) = 0;
  else
    v13 = (objc_msgSend(v11, "traits") >> 8) & 1;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __74__BBDataProviderProxy_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke;
  v17[3] = &unk_24C565108;
  v22 = v12 >> 5;
  v18 = v8;
  v19 = v9;
  v23 = v13;
  v20 = self;
  v21 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  -[BBDataProviderProxy _makeClientRequest:](self, "_makeClientRequest:", v17);

}

void __74__BBDataProviderProxy_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v3, "clearedInfoForBulletins:lastClearedInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!*(_BYTE *)(a1 + 65))
    {
      v10 = objc_opt_class();
      NSLog(CFSTR("%@: Data provider does not respond to clearedInfoForBulletins: %@"), v10, v4);
      v6 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v3, "clearedInfoForBulletins:", *(_QWORD *)(a1 + 32));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_6:
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__BBDataProviderProxy_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_2;
  v11[3] = &unk_24C565068;
  v7 = *(void **)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v12 = v6;
  v13 = v8;
  v9 = v6;
  objc_msgSend(v7, "_makeServerRequest:", v11);

}

uint64_t __74__BBDataProviderProxy_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)noteSectionInfoDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__BBDataProviderProxy_noteSectionInfoDidChange___block_invoke;
  v6[3] = &unk_24C565130;
  v7 = v4;
  v5 = v4;
  -[BBDataProviderProxy _makeClientRequest:](self, "_makeClientRequest:", v6);

}

uint64_t __48__BBDataProviderProxy_noteSectionInfoDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "noteSectionInfoDidChange:", *(_QWORD *)(a1 + 32));
}

- (void)deliverMessageWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__BBDataProviderProxy_deliverMessageWithName_userInfo___block_invoke;
  v10[3] = &unk_24C565158;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[BBDataProviderProxy _makeClientRequest:](self, "_makeClientRequest:", v10);

}

uint64_t __55__BBDataProviderProxy_deliverMessageWithName_userInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "receiveMessageWithName:userInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)deliverBulletinActionResponse:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__BBDataProviderProxy_deliverBulletinActionResponse_withCompletion___block_invoke;
  v10[3] = &unk_24C564E20;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[BBDataProviderProxy _makeClientRequest:](self, "_makeClientRequest:", v10);

}

void __68__BBDataProviderProxy_deliverBulletinActionResponse_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
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
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ handling bulletin action response %{public}@", buf, 0x16u);
  }
  v6 = objc_opt_respondsToSelector();
  v7 = *(_QWORD *)(a1 + 32);
  if ((v6 & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__BBDataProviderProxy_deliverBulletinActionResponse_withCompletion___block_invoke_28;
    v9[3] = &unk_24C565180;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v3, "handleBulletinActionResponse:withCompletion:", v7, v9);

  }
  else
  {
    objc_msgSend(v3, "handleBulletinActionResponse:", *(_QWORD *)(a1 + 32));
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
  }

}

uint64_t __68__BBDataProviderProxy_deliverBulletinActionResponse_withCompletion___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_proxyQueue, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_clientCalloutQueue, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
