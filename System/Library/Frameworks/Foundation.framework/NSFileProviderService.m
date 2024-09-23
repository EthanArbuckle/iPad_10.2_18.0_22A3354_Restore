@implementation NSFileProviderService

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  dispatch_group_leave((dispatch_group_t)self->_requestFinishedGroup);
  dispatch_release((dispatch_object_t)self->_requestFinishedGroup);
  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderService;
  -[NSFileProviderService dealloc](&v3, sel_dealloc);
}

- (NSFileProviderService)initWithName:(id)a3 endpointCreatingProxy:(id)a4 requestFinishedGroup:(id)a5
{
  id v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSFileProviderService;
  v8 = -[NSFileProviderService init](&v10, sel_init);
  if (v8)
  {
    *((_QWORD *)v8 + 1) = objc_msgSend(a3, "copy");
    *((_QWORD *)v8 + 2) = a4;
    *((_QWORD *)v8 + 3) = a5;
    dispatch_retain((dispatch_object_t)a5);
    dispatch_group_enter(*((dispatch_group_t *)v8 + 3));
  }
  return (NSFileProviderService *)v8;
}

- (void)getFileProviderConnectionWithCompletionHandler:(void *)completionHandler
{
  uint64_t v5;
  id endpointCreatingProxy;
  void *v7;
  NSString *name;
  _QWORD v9[6];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1E0C809B0];
  endpointCreatingProxy = self->_endpointCreatingProxy;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E0F4E088;
  v10[4] = completionHandler;
  v7 = (void *)objc_msgSend(endpointCreatingProxy, "remoteObjectProxyWithErrorHandler:", v10);
  name = self->_name;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E0F4E0D8;
  v9[4] = self;
  v9[5] = completionHandler;
  objc_msgSend(v7, "getListenerEndpointForServiceName:completionHandler:", name, v9);
}

void __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  qos_class_t v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v4 = qos_class_self();
  global_queue = dispatch_get_global_queue(v4, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E0F4E060;
  v6 = *(_QWORD *)(a1 + 32);
  block[4] = a2;
  block[5] = v6;
  dispatch_async(global_queue, block);
}

uint64_t __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  qos_class_t v6;
  NSObject *global_queue;
  _QWORD block[6];
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = qos_class_self();
  global_queue = dispatch_get_global_queue(v6, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_4;
  block[3] = &unk_1E0F4E0B0;
  block[4] = a3;
  block[5] = a2;
  v9 = *(_OWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

void __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_4(_QWORD *a1)
{
  NSXPCConnection *v2;
  NSObject *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    (*(void (**)(_QWORD, _QWORD))(a1[7] + 16))(a1[7], 0);
  }
  else
  {
    v2 = -[NSXPCConnection initWithListenerEndpoint:]([NSXPCConnection alloc], "initWithListenerEndpoint:", a1[5]);
    v3 = *(NSObject **)(a1[6] + 24);
    dispatch_group_enter(v3);
    dispatch_retain(v3);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_5;
    v4[3] = &unk_1E0F4D2D8;
    v4[4] = v3;
    -[NSXPCConnection set_additionalInvalidationHandler:](v2, "set_additionalInvalidationHandler:", v4);
    (*(void (**)(void))(a1[7] + 16))();

  }
}

void __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (id)fetchFileProviderConnectionAndReturnError:(id *)a3
{
  uint64_t v5;
  id endpointCreatingProxy;
  void *v7;
  NSString *name;
  uint64_t *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v5 = MEMORY[0x1E0C809B0];
  endpointCreatingProxy = self->_endpointCreatingProxy;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__NSFileProviderService_fetchFileProviderConnectionAndReturnError___block_invoke;
  v21[3] = &unk_1E0F4E100;
  v21[4] = &v22;
  v7 = (void *)objc_msgSend(endpointCreatingProxy, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  name = self->_name;
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __67__NSFileProviderService_fetchFileProviderConnectionAndReturnError___block_invoke_2;
  v14[3] = &unk_1E0F4E128;
  v14[5] = &v22;
  v14[6] = &v15;
  v14[4] = self;
  objc_msgSend(v7, "getListenerEndpointForServiceName:completionHandler:", name, v14);
  v9 = v23;
  v10 = (void *)v23[5];
  if (v10)
  {
    if (a3)
    {
      *a3 = v10;
      v10 = (void *)v9[5];
    }
    v11 = v10;
    v12 = 0;
  }
  else
  {
    v12 = (id)v16[5];
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v22, 8);
  return v12;
}

id __67__NSFileProviderService_fetchFileProviderConnectionAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __67__NSFileProviderService_fetchFileProviderConnectionAndReturnError___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  id result;
  NSObject *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    result = a3;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = result;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = -[NSXPCConnection initWithListenerEndpoint:]([NSXPCConnection alloc], "initWithListenerEndpoint:", a2);
    v5 = *(NSObject **)(a1[4] + 24);
    dispatch_group_enter(v5);
    dispatch_retain(v5);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__NSFileProviderService_fetchFileProviderConnectionAndReturnError___block_invoke_3;
    v6[3] = &unk_1E0F4D2D8;
    v6[4] = v5;
    return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "set_additionalInvalidationHandler:", v6);
  }
  return result;
}

void __67__NSFileProviderService_fetchFileProviderConnectionAndReturnError___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (NSFileProviderServiceName)name
{
  return (NSFileProviderServiceName)objc_getProperty(self, a2, 8, 1);
}

@end
