@implementation COCoordinationServiceClientSet

- (COCoordinationServiceClientSet)init
{
  COCoordinationServiceClientSet *v2;
  NSMutableSet *v3;
  NSMutableSet *clients;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COCoordinationServiceClientSet;
  v2 = -[COCoordinationServiceClientSet init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    clients = v2->_clients;
    v2->_clients = v3;

  }
  return v2;
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

- (id)serviceClientForXPCConnection:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__22;
  v15 = __Block_byref_object_dispose__22;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__COCoordinationServiceClientSet_serviceClientForXPCConnection___block_invoke;
  v8[3] = &unk_24D4B08A8;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[COCoordinationServiceClientSet _withLock:](self, "_withLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __64__COCoordinationServiceClientSet_serviceClientForXPCConnection___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "clients");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__COCoordinationServiceClientSet_serviceClientForXPCConnection___block_invoke_2;
  v5[3] = &unk_24D4B3790;
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __64__COCoordinationServiceClientSet_serviceClientForXPCConnection___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));
  *a3 = v7;

  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

- (id)serviceClients
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
  v8 = __Block_byref_object_copy__22;
  v9 = __Block_byref_object_dispose__22;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__COCoordinationServiceClientSet_serviceClients__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCoordinationServiceClientSet _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __48__COCoordinationServiceClientSet_serviceClients__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "clients");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addServiceClient:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__COCoordinationServiceClientSet_addServiceClient___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCoordinationServiceClientSet _withLock:](self, "_withLock:", v6);

}

void __51__COCoordinationServiceClientSet_addServiceClient___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "clients");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)removeServiceClient:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__COCoordinationServiceClientSet_removeServiceClient___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCoordinationServiceClientSet _withLock:](self, "_withLock:", v6);

}

void __54__COCoordinationServiceClientSet_removeServiceClient___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "clients");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
