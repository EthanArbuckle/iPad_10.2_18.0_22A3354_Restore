@implementation ENStoreClient

- (ENStoreClient)init
{
  ENStoreClient *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  dispatch_queue_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ENStoreClient;
  v2 = -[ENStoreClient init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("com.evernote.sdk.%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_retainAutorelease(v6);
    v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "cStringUsingEncoding:", 1), 0);
    -[ENStoreClient setQueue:](v2, "setQueue:", v8);

  }
  return v2;
}

- (void)invokeAsyncBoolBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ENStoreClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ENStoreClient_invokeAsyncBoolBlock_completion___block_invoke;
  block[3] = &unk_24F8BB5B8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)invokeAsyncInt32Block:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ENStoreClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ENStoreClient_invokeAsyncInt32Block_completion___block_invoke;
  block[3] = &unk_24F8BB5B8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)invokeAsyncObjectBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ENStoreClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ENStoreClient_invokeAsyncObjectBlock_completion___block_invoke;
  block[3] = &unk_24F8BB5B8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)invokeAsyncBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ENStoreClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__ENStoreClient_invokeAsyncBlock_completion___block_invoke;
  block[3] = &unk_24F8BB5B8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)handleError:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EDAMErrorCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if ((int)v6 >= 1 && (v6 & 0xFFFFFFFE) == 8)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ENStoreClient got authentication EDAM error %u"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "evernoteLogErrorString:", v10);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__ENStoreClient_handleError___block_invoke;
    block[3] = &unk_24F8BB638;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __29__ENStoreClient_handleError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", ENStoreClientDidFailWithAuthenticationErrorNotification, *(_QWORD *)(a1 + 32));

}

void __45__ENStoreClient_invokeAsyncBlock_completion___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__ENStoreClient_invokeAsyncBlock_completion___block_invoke_2;
  block[3] = &unk_24F8BB608;
  v3 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __45__ENStoreClient_invokeAsyncBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__ENStoreClient_invokeAsyncObjectBlock_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__ENStoreClient_invokeAsyncObjectBlock_completion___block_invoke_2;
  v5[3] = &unk_24F8BB5E0;
  v3 = *(id *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __51__ENStoreClient_invokeAsyncObjectBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __50__ENStoreClient_invokeAsyncInt32Block_completion___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -1;
  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = MEMORY[0x24BDAC760];
  *((_DWORD *)v8 + 6) = v2;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __50__ENStoreClient_invokeAsyncInt32Block_completion___block_invoke_2;
  v4[3] = &unk_24F8BB590;
  v5 = *(id *)(a1 + 48);
  v6 = &v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

  _Block_object_dispose(&v7, 8);
}

uint64_t __50__ENStoreClient_invokeAsyncInt32Block_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0);
}

void __49__ENStoreClient_invokeAsyncBoolBlock_completion___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = MEMORY[0x24BDAC760];
  *((_BYTE *)v8 + 24) = v2;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __49__ENStoreClient_invokeAsyncBoolBlock_completion___block_invoke_2;
  v4[3] = &unk_24F8BB590;
  v5 = *(id *)(a1 + 48);
  v6 = &v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

  _Block_object_dispose(&v7, 8);
}

uint64_t __49__ENStoreClient_invokeAsyncBoolBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0);
}

@end
