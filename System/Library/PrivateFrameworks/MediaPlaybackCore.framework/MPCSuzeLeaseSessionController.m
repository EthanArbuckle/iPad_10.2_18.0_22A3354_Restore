@implementation MPCSuzeLeaseSessionController

- (id)_init
{
  MPCSuzeLeaseSessionController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *calloutQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPCSuzeLeaseSessionController;
  v2 = -[MPCSuzeLeaseSessionController init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCSuzeLeaseSessionController.accessQueue", MEMORY[0x24BDAC9C0]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCSuzeLeaseSessionController.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)startLeaseSessionWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MPCSuzeLeaseSessionController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke;
  block[3] = &unk_24CAB98A8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(accessQueue, block);

}

- (void)stopLeaseSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke;
  block[3] = &unk_24CAB98A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_after(v8, MEMORY[0x24BDAC9B8], block);

}

- (void)suzeLeaseSession:(id)a3 leaseRenewalDidFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__MPCSuzeLeaseSessionController_suzeLeaseSession_leaseRenewalDidFailWithError___block_invoke;
  block[3] = &unk_24CABAA28;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaseIDToLeaseSessionInfo, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __79__MPCSuzeLeaseSessionController_suzeLeaseSession_leaseRenewalDidFailWithError___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v5)
        objc_enumerationMutation(v2);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v6));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "icLeaseSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 40);

      if (v8 == v9)
        break;

      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_12;
      }
    }

    if (!v7)
      return;
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__MPCSuzeLeaseSessionController_suzeLeaseSession_leaseRenewalDidFailWithError___block_invoke_2;
    block[3] = &unk_24CABAA28;
    v14 = v7;
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    v15 = v11;
    v16 = v12;
    v2 = v7;
    dispatch_async(v10, block);

  }
LABEL_12:

}

void __79__MPCSuzeLeaseSessionController_suzeLeaseSession_leaseRenewalDidFailWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(*(id *)(a1 + 32), "mpcLeaseSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v2, CFSTR("MPCSuzeLeaseControllerUserInfoKeySession"));

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    objc_msgSend(v5, "setObject:forKey:", v3, CFSTR("MPCSuzeLeaseControllerUserInfoKeyError"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("MPCSuzeLeaseSessionControllerLeaseSessionRenewDidFailNotification"), *(_QWORD *)(a1 + 48), v5);

}

void __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_2;
  block[3] = &unk_24CAB98A8;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  dispatch_barrier_async(v3, block);

}

void __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[5];
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "icSuzeLeaseSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leaseID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", v4),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "clientCount");
    if (v7 <= 1)
      v8 = 1;
    else
      v8 = v7;
    objc_msgSend(v6, "setClientCount:", v8 - 1);
    if (objc_msgSend(v6, "clientCount") <= 0)
    {
      objc_msgSend(v6, "icLeaseSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObjectForKey:", v4);
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count"))
      {
        v14 = *(_QWORD *)(a1 + 40);
        v15 = *(void **)(v14 + 24);
        *(_QWORD *)(v14 + 24) = 0;

      }
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_3;
      v21[3] = &unk_24CAB95B8;
      v16 = *(id *)(a1 + 48);
      v21[4] = *(_QWORD *)(a1 + 40);
      v22 = v16;
      objc_msgSend(v11, "stopLeaseSessionWithCompletionHandler:", v21);

      goto LABEL_15;
    }
    v9 = *(void **)(a1 + 48);
    if (v9)
    {
      v10 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_5;
      block[3] = &unk_24CAB9720;
      v20 = v9;
      dispatch_async(v10, block);
      v11 = v20;
LABEL_15:

    }
  }
  else
  {
    v12 = *(void **)(a1 + 48);
    if (v12)
    {
      v13 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_6;
      v17[3] = &unk_24CAB9720;
      v18 = v12;
      dispatch_async(v13, v17);
      v6 = 0;
      v11 = v18;
      goto LABEL_15;
    }
    v6 = 0;
  }

}

void __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_4;
    block[3] = &unk_24CAB8848;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _MPCSuzeLeaseSessionInfo *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _MPCSuzeLeaseSessionInfo *v12;
  _QWORD v13[5];
  _MPCSuzeLeaseSessionInfo *v14;
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "leaseID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", v2);
  v3 = (_MPCSuzeLeaseSessionInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8A18]), "initWithConfiguration:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 40));
    v3 = -[_MPCSuzeLeaseSessionInfo initWithICLeaseSession:]([_MPCSuzeLeaseSessionInfo alloc], "initWithICLeaseSession:", v4);
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(v7 + 24);
      *(_QWORD *)(v7 + 24) = v6;

      v5 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    }
    objc_msgSend(v5, "setObject:forKey:", v3, v2);

  }
  -[_MPCSuzeLeaseSessionInfo setClientCount:](v3, "setClientCount:", -[_MPCSuzeLeaseSessionInfo clientCount](v3, "clientCount") + 1);
  -[_MPCSuzeLeaseSessionInfo icLeaseSession](v3, "icLeaseSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_2;
  v13[3] = &unk_24CAB8820;
  v10 = *(void **)(a1 + 48);
  v13[4] = *(_QWORD *)(a1 + 40);
  v15 = v2;
  v16 = v10;
  v14 = v3;
  v11 = v2;
  v12 = v3;
  objc_msgSend(v9, "startLeaseSessionWithCompletionHandler:", v13);

}

void __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v10 = *(NSObject **)(v9 + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_3;
    block[3] = &unk_24CAB98A8;
    v22 = *(id *)(a1 + 56);
    v20 = *(id *)(a1 + 40);
    v21 = v7;
    dispatch_async(v10, block);

    v11 = v22;
  }
  else
  {
    v12 = *(NSObject **)(v9 + 8);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_4;
    v13[3] = &unk_24CAB87F8;
    v13[4] = v9;
    v14 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 56);
    v16 = v7;
    v17 = v8;
    dispatch_barrier_async(v12, v13);

    v11 = v14;
  }

}

void __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "mpcLeaseSession");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40), 0);

}

void __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 24);
      *(_QWORD *)(v4 + 24) = 0;

    }
  }
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_5;
  block[3] = &unk_24CAB98A8;
  v10 = *(id *)(a1 + 72);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  dispatch_async(v6, block);

}

uint64_t __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 0, a1[4], a1[5]);
}

+ (MPCSuzeLeaseSessionController)sharedController
{
  if (sharedController_sOnceToken != -1)
    dispatch_once(&sharedController_sOnceToken, &__block_literal_global_24147);
  return (MPCSuzeLeaseSessionController *)(id)sharedController_sSharedController;
}

void __49__MPCSuzeLeaseSessionController_sharedController__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MPCSuzeLeaseSessionController _init]([MPCSuzeLeaseSessionController alloc], "_init");
  v1 = (void *)sharedController_sSharedController;
  sharedController_sSharedController = (uint64_t)v0;

}

@end
