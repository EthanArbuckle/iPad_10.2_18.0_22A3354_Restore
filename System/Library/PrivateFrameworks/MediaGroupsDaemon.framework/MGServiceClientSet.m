@implementation MGServiceClientSet

- (MGServiceClientSet)init
{
  MGServiceClientSet *v2;
  MGServiceClientSet *v3;
  NSMapTable *v4;
  NSMapTable *clients;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MGServiceClientSet;
  v2 = -[MGServiceClientSet init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMapTable *)objc_alloc_init(MEMORY[0x24BDD1650]);
    clients = v3->_clients;
    v3->_clients = v4;

  }
  return v3;
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
  v14 = __Block_byref_object_copy__7;
  v15 = __Block_byref_object_dispose__7;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__MGServiceClientSet_serviceClientForXPCConnection___block_invoke;
  v8[3] = &unk_24E0AA660;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__MGServiceClientSet_serviceClientForXPCConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "clients");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addClientService:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__MGServiceClientSet_addClientService___block_invoke;
  v6[3] = &unk_24E0AA5E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v6);

}

void __39__MGServiceClientSet_addClientService___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "clients");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v2, v3);

}

- (void)removeClientService:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__MGServiceClientSet_removeClientService___block_invoke;
  v6[3] = &unk_24E0AA5E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v6);

}

void __42__MGServiceClientSet_removeClientService___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "clients");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

- (void)enumerateClientsUsingBlock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[6];
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
  v14 = __Block_byref_object_copy__7;
  v15 = __Block_byref_object_dispose__7;
  v16 = (id)MEMORY[0x24BDBD1A8];
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__MGServiceClientSet_enumerateClientsUsingBlock___block_invoke;
  v10[3] = &unk_24E0AA728;
  v10[4] = self;
  v10[5] = &v11;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v10);
  v6 = (void *)v12[5];
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __49__MGServiceClientSet_enumerateClientsUsingBlock___block_invoke_2;
  v8[3] = &unk_24E0AB260;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  _Block_object_dispose(&v11, 8);
}

void __49__MGServiceClientSet_enumerateClientsUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "clients");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __49__MGServiceClientSet_enumerateClientsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSMapTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
