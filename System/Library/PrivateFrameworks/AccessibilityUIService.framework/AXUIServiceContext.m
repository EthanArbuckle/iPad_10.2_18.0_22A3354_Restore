@implementation AXUIServiceContext

- (AXUIServiceContext)initWithService:(id)a3 serviceIdentifier:(id)a4
{
  id v6;
  id v7;
  AXUIServiceContext *v8;
  AXUIServiceContext *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXUIServiceContext;
  v8 = -[AXUIServiceContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AXUIServiceContext setService:](v8, "setService:", v6);
    -[AXUIServiceContext setServiceIdentifier:](v9, "setServiceIdentifier:", v7);
  }

  return v9;
}

- (unint64_t)clientsCount
{
  void *v2;
  unint64_t v3;

  -[AXUIServiceContext clientMessengers](self, "clientMessengers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSArray)clientMessengerList
{
  void *v2;
  void *v3;

  -[AXUIServiceContext clientMessengers](self, "clientMessengers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addClientWithIdentifier:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  AXUIClientMessenger *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[AXUIServiceContext clientMessengers](self, "clientMessengers");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = (id)objc_opt_new();
    -[AXUIServiceContext setClientMessengers:](self, "setClientMessengers:");
  }
  v8 = -[AXUIClientMessenger initWithClientIdentifier:connection:]([AXUIClientMessenger alloc], "initWithClientIdentifier:connection:", v7, v6);

  objc_msgSend(v9, "addObject:", v8);
}

- (unint64_t)_indexOfClientWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    -[AXUIServiceContext clientMessengers](self, "clientMessengers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__AXUIServiceContext__indexOfClientWithIdentifier___block_invoke;
    v8[3] = &unk_24D49CA70;
    v9 = v4;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v8);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

uint64_t __51__AXUIServiceContext__indexOfClientWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)removeClientWithIdentifier:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;

  v4 = -[AXUIServiceContext _indexOfClientWithIdentifier:](self, "_indexOfClientWithIdentifier:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[AXUIServiceContext clientMessengers](self, "clientMessengers");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConnection:", 0);
    objc_msgSend(v7, "removeObjectAtIndex:", v5);
    if (!objc_msgSend(v7, "count"))
      -[AXUIServiceContext setClientMessengers:](self, "setClientMessengers:", 0);

  }
}

- (BOOL)hasClientWithIdentifier:(id)a3
{
  return -[AXUIServiceContext _indexOfClientWithIdentifier:](self, "_indexOfClientWithIdentifier:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)clientMessengerWithIdentifier:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = -[AXUIServiceContext _indexOfClientWithIdentifier:](self, "_indexOfClientWithIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = v4;
    -[AXUIServiceContext clientMessengers](self, "clientMessengers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)enumerateClientsUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  -[AXUIServiceContext clientMessengers](self, "clientMessengers");
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "clientIdentifier", (_QWORD)v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "connection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v11, v12, &v17);

      if (v17)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (int)pidForClientWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__AXUIServiceContext_pidForClientWithIdentifier___block_invoke;
  v7[3] = &unk_24D49CDE8;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[AXUIServiceContext enumerateClientsUsingBlock:](self, "enumerateClientsUsingBlock:", v7);
  LODWORD(self) = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return (int)self;
}

void __49__AXUIServiceContext_pidForClientWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "pid");
    *a4 = 1;
  }

}

- (AXUIService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (NSObject)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)clientMessengers
{
  return self->_clientMessengers;
}

- (void)setClientMessengers:(id)a3
{
  objc_storeStrong((id *)&self->_clientMessengers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientMessengers, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
