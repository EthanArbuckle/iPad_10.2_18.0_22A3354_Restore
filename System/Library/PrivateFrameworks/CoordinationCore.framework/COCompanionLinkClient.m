@implementation COCompanionLinkClient

- (COCompanionLinkClient)initWithCompanionLinkClient:(id)a3
{
  id v5;
  COCompanionLinkClient *v6;
  COCompanionLinkClient *v7;
  uint64_t v8;
  NSMutableSet *registeredEventIDs;
  uint64_t v10;
  NSMutableSet *registeredRequestIDs;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  COCompanionLinkClient *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)COCompanionLinkClient;
  v6 = -[COCompanionLinkClient init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_isInvalidated = 0;
    objc_storeStrong((id *)&v6->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    objc_storeStrong((id *)&v7->_rapport, a3);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    registeredEventIDs = v7->_registeredEventIDs;
    v7->_registeredEventIDs = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    registeredRequestIDs = v7->_registeredRequestIDs;
    v7->_registeredRequestIDs = (NSMutableSet *)v10;

    COCoreLogForCategory(18);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v7;
      _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%p new link created", buf, 0xCu);
    }

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_super v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[4];
  COCompanionLinkClient *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[COCompanionLinkClient registeredRequestIDs](self, "registeredRequestIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __32__COCompanionLinkClient_dealloc__block_invoke;
  v10[3] = &unk_24D4B1CD8;
  v10[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);

  -[COCompanionLinkClient registeredEventIDs](self, "registeredEventIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __32__COCompanionLinkClient_dealloc__block_invoke_2;
  v9[3] = &unk_24D4B1CD8;
  v9[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  -[COCompanionLinkClient factory](self, "factory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeClient:", self);

  COCoreLogForCategory(18);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = self;
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p link destroyed", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)COCompanionLinkClient;
  -[COCompanionLinkClient dealloc](&v8, sel_dealloc);
}

uint64_t __32__COCompanionLinkClient_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deregisterRequestID:", a2);
}

uint64_t __32__COCompanionLinkClient_dealloc__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deregisterEventID:", a2);
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isInvalidated
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isInvalidated);
  return v2 & 1;
}

- (void)didActivateWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__COCompanionLinkClient_didActivateWithError___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v6);

}

void __46__COCompanionLinkClient_didActivateWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_QWORD *)(v2 + 24) & 3) == 1)
  {
    *(_QWORD *)(v2 + 24) |= 2uLL;
    objc_msgSend(*(id *)(a1 + 32), "activationHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setActivationHandler:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setActivationError:", *(_QWORD *)(a1 + 40));
    v4 = MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    v5 = (void *)v4;
    if (!*(_QWORD *)(a1 + 40)
      && v4
      && (objc_msgSend(*(id *)(a1 + 32), "rapport"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "activeDevices"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v7))
    {
      COCoreLogForCategory(18);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218240;
        v23 = v9;
        v24 = 2048;
        v25 = objc_msgSend(v7, "count");
        _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p did activate with %ld devices", buf, 0x16u);
      }
    }
    else
    {
      COCoreLogForCategory(18);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        v23 = v12;
        _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p did activate", buf, 0xCu);
      }
      v7 = 0;
    }

    v13 = *(void **)(a1 + 40);
    v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __46__COCompanionLinkClient_didActivateWithError___block_invoke_3;
    v17[3] = &unk_24D4B37E0;
    v20 = v3;
    v18 = v13;
    v19 = v7;
    v21 = v5;
    v15 = v5;
    v16 = v7;
    v10 = v3;
    dispatch_async(v14, v17);

  }
  else
  {
    COCoreLogForCategory(18);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v23 = v11;
      _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "%p not activated yet so ignoring underlying activation", buf, 0xCu);
    }
  }

}

void __46__COCompanionLinkClient_didActivateWithError___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__COCompanionLinkClient_didActivateWithError___block_invoke_2;
  v3[3] = &unk_24D4B37B8;
  v4 = *(id *)(a1 + 56);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

uint64_t __46__COCompanionLinkClient_didActivateWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didInterrupt
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __37__COCompanionLinkClient_didInterrupt__block_invoke;
  v2[3] = &unk_24D4B0C80;
  v2[4] = self;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v2);
}

void __37__COCompanionLinkClient_didInterrupt__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  if (v2)
  {
    v3 = v2;
    dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16), v2);
    v2 = v3;
  }

}

- (void)didUpdateState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __39__COCompanionLinkClient_didUpdateState__block_invoke;
  v2[3] = &unk_24D4B0C80;
  v2[4] = self;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v2);
}

void __39__COCompanionLinkClient_didUpdateState__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 24) & 8) == 0)
  {
    v3 = (void *)MEMORY[0x2199F3D40](*(_QWORD *)(v1 + 40));
    if (v3)
    {
      v4 = v3;
      dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16), v3);
      v3 = v4;
    }

  }
}

- (void)didChangeErrorFlags
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __44__COCompanionLinkClient_didChangeErrorFlags__block_invoke;
  v2[3] = &unk_24D4B0C80;
  v2[4] = self;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v2);
}

void __44__COCompanionLinkClient_didChangeErrorFlags__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 24) & 8) == 0)
  {
    v3 = (void *)MEMORY[0x2199F3D40](*(_QWORD *)(v1 + 48));
    if (v3)
    {
      v4 = v3;
      dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16), v3);
      v3 = v4;
    }

  }
}

- (void)didDisconnect
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __38__COCompanionLinkClient_didDisconnect__block_invoke;
  v2[3] = &unk_24D4B0C80;
  v2[4] = self;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v2);
}

void __38__COCompanionLinkClient_didDisconnect__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 24);
  if ((v2 & 0xC) == 0)
  {
    *(_QWORD *)(v1 + 24) = v2 | 4;
    v4 = (void *)MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    if (v4)
    {
      v5 = v4;
      dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16), v4);
      v4 = v5;
    }

  }
}

- (void)didInvalidate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __38__COCompanionLinkClient_didInvalidate__block_invoke;
  v2[3] = &unk_24D4B0C80;
  v2[4] = self;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v2);
}

void __38__COCompanionLinkClient_didInvalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v2 + 24) & 8) != 0)
  {
    COCoreLogForCategory(18);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v15 = v11;
      _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "%p did secondary invalidation", buf, 0xCu);
    }
  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)(v2 + 12));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) |= 0xFuLL;
    objc_msgSend(*(id *)(a1 + 32), "registeredRequestIDs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __38__COCompanionLinkClient_didInvalidate__block_invoke_2;
    v13[3] = &unk_24D4B1CD8;
    v13[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v13);

    objc_msgSend(*(id *)(a1 + 32), "registeredEventIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __38__COCompanionLinkClient_didInvalidate__block_invoke_3;
    v12[3] = &unk_24D4B1CD8;
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);

    objc_msgSend(*(id *)(a1 + 32), "registeredEventIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "registeredRequestIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

    COCoreLogForCategory(18);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v15 = v9;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p did invalidate", buf, 0xCu);
    }

    v10 = MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    if (v10)
      dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16), v10);
  }

}

uint64_t __38__COCompanionLinkClient_didInvalidate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deregisterRequestID:", a2);
}

uint64_t __38__COCompanionLinkClient_didInvalidate__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deregisterEventID:", a2);
}

- (unint64_t)flags
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__COCompanionLinkClient_flags__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__COCompanionLinkClient_flags__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__23;
  v9 = __Block_byref_object_dispose__23;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__COCompanionLinkClient_dispatchQueue__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (OS_dispatch_queue *)v2;
}

void __38__COCompanionLinkClient_dispatchQueue__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)setDispatchQueue:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__COCompanionLinkClient_setDispatchQueue___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v6);

}

void __42__COCompanionLinkClient_setDispatchQueue___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (id)interruptionHandler
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__COCompanionLinkClient_interruptionHandler__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v4);
  v2 = (void *)MEMORY[0x2199F3D40](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __44__COCompanionLinkClient_interruptionHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setInterruptionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__COCompanionLinkClient_setInterruptionHandler___block_invoke;
  v6[3] = &unk_24D4B1428;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v6);

}

void __48__COCompanionLinkClient_setInterruptionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (id)stateUpdatedHandler
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__COCompanionLinkClient_stateUpdatedHandler__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v4);
  v2 = (void *)MEMORY[0x2199F3D40](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __44__COCompanionLinkClient_stateUpdatedHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setStateUpdatedHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__COCompanionLinkClient_setStateUpdatedHandler___block_invoke;
  v6[3] = &unk_24D4B1428;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v6);

}

void __48__COCompanionLinkClient_setStateUpdatedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)errorFlagsChangedHandler
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__COCompanionLinkClient_errorFlagsChangedHandler__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v4);
  v2 = (void *)MEMORY[0x2199F3D40](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __49__COCompanionLinkClient_errorFlagsChangedHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setErrorFlagsChangedHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__COCompanionLinkClient_setErrorFlagsChangedHandler___block_invoke;
  v6[3] = &unk_24D4B1428;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v6);

}

void __53__COCompanionLinkClient_setErrorFlagsChangedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

- (id)disconnectHandler
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__COCompanionLinkClient_disconnectHandler__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v4);
  v2 = (void *)MEMORY[0x2199F3D40](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__COCompanionLinkClient_disconnectHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setDisconnectHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__COCompanionLinkClient_setDisconnectHandler___block_invoke;
  v6[3] = &unk_24D4B1428;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v6);

}

void __46__COCompanionLinkClient_setDisconnectHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

- (id)invalidationHandler
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__COCompanionLinkClient_invalidationHandler__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v4);
  v2 = (void *)MEMORY[0x2199F3D40](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __44__COCompanionLinkClient_invalidationHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setInvalidationHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__COCompanionLinkClient_setInvalidationHandler___block_invoke;
  v6[3] = &unk_24D4B1428;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v6);

}

void __48__COCompanionLinkClient_setInvalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

}

- (id)deviceFoundHandler
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__COCompanionLinkClient_deviceFoundHandler__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v4);
  v2 = (void *)MEMORY[0x2199F3D40](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __43__COCompanionLinkClient_deviceFoundHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setDeviceFoundHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__COCompanionLinkClient_setDeviceFoundHandler___block_invoke;
  v6[3] = &unk_24D4B1428;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v6);

}

void __47__COCompanionLinkClient_setDeviceFoundHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

}

- (id)deviceLostHandler
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__COCompanionLinkClient_deviceLostHandler__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v4);
  v2 = (void *)MEMORY[0x2199F3D40](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__COCompanionLinkClient_deviceLostHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setDeviceLostHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__COCompanionLinkClient_setDeviceLostHandler___block_invoke;
  v6[3] = &unk_24D4B1428;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v6);

}

void __46__COCompanionLinkClient_setDeviceLostHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

}

- (id)localDeviceUpdatedHandler
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__COCompanionLinkClient_localDeviceUpdatedHandler__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v4);
  v2 = (void *)MEMORY[0x2199F3D40](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__COCompanionLinkClient_localDeviceUpdatedHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setLocalDeviceUpdatedHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__COCompanionLinkClient_setLocalDeviceUpdatedHandler___block_invoke;
  v6[3] = &unk_24D4B1428;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v6);

}

void __54__COCompanionLinkClient_setLocalDeviceUpdatedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = v2;

}

- (id)deviceChangedHandler
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__COCompanionLinkClient_deviceChangedHandler__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v4);
  v2 = (void *)MEMORY[0x2199F3D40](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __45__COCompanionLinkClient_deviceChangedHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setDeviceChangedHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__COCompanionLinkClient_setDeviceChangedHandler___block_invoke;
  v6[3] = &unk_24D4B1428;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v6);

}

void __49__COCompanionLinkClient_setDeviceChangedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

}

- (void)setRequestIDRegistrationCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__COCompanionLinkClient_setRequestIDRegistrationCompletion___block_invoke;
  v6[3] = &unk_24D4B3830;
  v6[4] = self;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __60__COCompanionLinkClient_setRequestIDRegistrationCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__COCompanionLinkClient_setRequestIDRegistrationCompletion___block_invoke_2;
  v5[3] = &unk_24D4B3808;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 40);
  v2 = MEMORY[0x2199F3D40](v5);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  *(_QWORD *)(v3 + 104) = v2;

  objc_destroyWeak(&v7);
}

void __60__COCompanionLinkClient_setRequestIDRegistrationCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__COCompanionLinkClient_setRequestIDRegistrationCompletion___block_invoke_3;
    v6[3] = &unk_24D4B0BE0;
    v8 = &v9;
    v6[4] = WeakRetained;
    v7 = v3;
    objc_msgSend(v5, "_withLock:", v6);
    if (*((_BYTE *)v10 + 24))
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    _Block_object_dispose(&v9, 8);
  }

}

void __60__COCompanionLinkClient_setRequestIDRegistrationCompletion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "registeredRequestIDs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (id)requestIDRegistrationCompletion
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__COCompanionLinkClient_requestIDRegistrationCompletion__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v4);
  v2 = (void *)MEMORY[0x2199F3D40](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __56__COCompanionLinkClient_requestIDRegistrationCompletion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setEventIDRegistrationCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__COCompanionLinkClient_setEventIDRegistrationCompletion___block_invoke;
  v6[3] = &unk_24D4B3830;
  v6[4] = self;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __58__COCompanionLinkClient_setEventIDRegistrationCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__COCompanionLinkClient_setEventIDRegistrationCompletion___block_invoke_2;
  v5[3] = &unk_24D4B3808;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 40);
  v2 = MEMORY[0x2199F3D40](v5);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 112);
  *(_QWORD *)(v3 + 112) = v2;

  objc_destroyWeak(&v7);
}

void __58__COCompanionLinkClient_setEventIDRegistrationCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __58__COCompanionLinkClient_setEventIDRegistrationCompletion___block_invoke_3;
    v6[3] = &unk_24D4B0BE0;
    v8 = &v9;
    v6[4] = WeakRetained;
    v7 = v3;
    objc_msgSend(v5, "_withLock:", v6);
    if (*((_BYTE *)v10 + 24))
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    _Block_object_dispose(&v9, 8);
  }

}

void __58__COCompanionLinkClient_setEventIDRegistrationCompletion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "registeredEventIDs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (id)eventIDRegistrationCompletion
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__COCompanionLinkClient_eventIDRegistrationCompletion__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v4);
  v2 = (void *)MEMORY[0x2199F3D40](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __54__COCompanionLinkClient_eventIDRegistrationCompletion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x2199F3D40](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)localDevice
{
  void *v2;
  void *v3;

  -[COCompanionLinkClient rapport](self, "rapport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)destinationDevice
{
  void *v2;
  void *v3;

  -[COCompanionLinkClient rapport](self, "rapport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destinationDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activeDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[COCompanionLinkClient factory](self, "factory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "activeDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[COCompanionLinkClient rapport](self, "rapport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (unint64_t)controlFlags
{
  void *v2;
  unint64_t v3;

  -[COCompanionLinkClient rapport](self, "rapport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "controlFlags");

  return v3;
}

- (void)setControlFlags:(unint64_t)a3
{
  id v5;

  if ((-[COCompanionLinkClient flags](self, "flags") & 3) == 0)
  {
    -[COCompanionLinkClient rapport](self, "rapport");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setControlFlags:", a3);

  }
}

- (BOOL)usingOnDemandConnection
{
  void *v2;
  char v3;

  -[COCompanionLinkClient rapport](self, "rapport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usingOnDemandConnection");

  return v3;
}

- (unint64_t)errorFlags
{
  void *v2;
  unint64_t v3;

  -[COCompanionLinkClient rapport](self, "rapport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "errorFlags");

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__COCompanionLinkClient_activateWithCompletion___block_invoke;
  v6[3] = &unk_24D4B1428;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v6);

}

void __48__COCompanionLinkClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 1) != 0)
  {
    if (!*(_QWORD *)(a1 + 40))
      return;
    COCoreLogForCategory(18);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v14 = v6;
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p activating already activated link", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "activationError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 40);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__COCompanionLinkClient_activateWithCompletion___block_invoke_9;
    v10[3] = &unk_24D4B0B68;
    v11 = v7;
    v12 = v8;
    v4 = v7;
    dispatch_async(v9, v10);

  }
  else
  {
    COCoreLogForCategory(18);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v14 = v3;
      _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p activating", buf, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) |= 1uLL;
    objc_msgSend(*(id *)(a1 + 32), "setActivationHandler:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "factory");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateCompanionLinkClient:", *(_QWORD *)(a1 + 32));
  }

}

uint64_t __48__COCompanionLinkClient_activateWithCompletion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)invalidate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __35__COCompanionLinkClient_invalidate__block_invoke;
  v2[3] = &unk_24D4B0C80;
  v2[4] = self;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v2);
}

void __35__COCompanionLinkClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  COCoreLogForCategory(18);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 8) != 0)
  {
    if (v4)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 134217984;
      v8 = v6;
      _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "%p ignoring attempt to invalidate", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 134217984;
      v8 = v5;
      _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "%p invalidating", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "factory");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject invalidateCompanionLinkClient:](v3, "invalidateCompanionLinkClient:", *(_QWORD *)(a1 + 32));
  }

}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __57__COCompanionLinkClient_registerEventID_options_handler___block_invoke;
  v18[3] = &unk_24D4B0858;
  v18[4] = self;
  v12 = v8;
  v19 = v12;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v18);
  -[COCompanionLinkClient rapport](self, "rapport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __57__COCompanionLinkClient_registerEventID_options_handler___block_invoke_2;
  v15[3] = &unk_24D4B3880;
  objc_copyWeak(&v17, &location);
  v14 = v10;
  v16 = v14;
  objc_msgSend(v13, "registerEventID:options:handler:", v12, v9, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __57__COCompanionLinkClient_registerEventID_options_handler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "registeredEventIDs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

void __57__COCompanionLinkClient_registerEventID_options_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__COCompanionLinkClient_registerEventID_options_handler___block_invoke_3;
    block[3] = &unk_24D4B3858;
    v13 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __57__COCompanionLinkClient_registerEventID_options_handler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)deregisterEventID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[COCompanionLinkClient rapport](self, "rapport");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterEventID:", v4);

}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __59__COCompanionLinkClient_registerRequestID_options_handler___block_invoke;
  v18[3] = &unk_24D4B0858;
  v18[4] = self;
  v12 = v8;
  v19 = v12;
  -[COCompanionLinkClient _withLock:](self, "_withLock:", v18);
  -[COCompanionLinkClient rapport](self, "rapport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __59__COCompanionLinkClient_registerRequestID_options_handler___block_invoke_2;
  v15[3] = &unk_24D4B38A8;
  objc_copyWeak(&v17, &location);
  v14 = v10;
  v16 = v14;
  objc_msgSend(v13, "registerRequestID:options:handler:", v12, v9, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __59__COCompanionLinkClient_registerRequestID_options_handler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "registeredRequestIDs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

void __59__COCompanionLinkClient_registerRequestID_options_handler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59__COCompanionLinkClient_registerRequestID_options_handler___block_invoke_3;
    v13[3] = &unk_24D4B37E0;
    v16 = *(id *)(a1 + 32);
    v14 = v7;
    v15 = v8;
    v17 = v9;
    dispatch_async(v12, v13);

  }
}

uint64_t __59__COCompanionLinkClient_registerRequestID_options_handler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], a1[7]);
}

- (void)deregisterRequestID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[COCompanionLinkClient rapport](self, "rapport");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterRequestID:", v4);

}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[COCompanionLinkClient rapport](self, "rapport");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__COCompanionLinkClient_sendEventID_event_options_completion___block_invoke;
  v16[3] = &unk_24D4B0DD8;
  objc_copyWeak(&v18, &location);
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "sendEventID:event:options:completion:", v10, v11, v12, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __62__COCompanionLinkClient_sendEventID_event_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__COCompanionLinkClient_sendEventID_event_options_completion___block_invoke_2;
    v7[3] = &unk_24D4B0B68;
    v9 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __62__COCompanionLinkClient_sendEventID_event_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[COCompanionLinkClient rapport](self, "rapport");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __71__COCompanionLinkClient_sendRequestID_request_options_responseHandler___block_invoke;
  v16[3] = &unk_24D4B38D0;
  objc_copyWeak(&v18, &location);
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "sendRequestID:request:options:responseHandler:", v10, v11, v12, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __71__COCompanionLinkClient_sendRequestID_request_options_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__COCompanionLinkClient_sendRequestID_request_options_responseHandler___block_invoke_2;
    v13[3] = &unk_24D4B0F18;
    v17 = *(id *)(a1 + 32);
    v14 = v7;
    v15 = v8;
    v16 = v9;
    dispatch_async(v12, v13);

  }
}

uint64_t __71__COCompanionLinkClient_sendRequestID_request_options_responseHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (COCompanionLinkClientFactory)factory
{
  return (COCompanionLinkClientFactory *)objc_loadWeakRetained((id *)&self->_factory);
}

- (void)setFactory:(id)a3
{
  objc_storeWeak((id *)&self->_factory, a3);
}

- (RPCompanionLinkClient)rapport
{
  return self->_rapport;
}

- (NSError)activationError
{
  return self->_activationError;
}

- (void)setActivationError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)activationHandler
{
  return self->_activationHandler;
}

- (void)setActivationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSMutableSet)registeredEventIDs
{
  return self->_registeredEventIDs;
}

- (NSMutableSet)registeredRequestIDs
{
  return self->_registeredRequestIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredRequestIDs, 0);
  objc_storeStrong((id *)&self->_registeredEventIDs, 0);
  objc_storeStrong(&self->_activationHandler, 0);
  objc_storeStrong((id *)&self->_activationError, 0);
  objc_storeStrong((id *)&self->_rapport, 0);
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong(&self->_eventIDRegistrationCompletion, 0);
  objc_storeStrong(&self->_requestIDRegistrationCompletion, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_localDeviceUpdatedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong(&self->_errorFlagsChangedHandler, 0);
  objc_storeStrong(&self->_stateUpdatedHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
