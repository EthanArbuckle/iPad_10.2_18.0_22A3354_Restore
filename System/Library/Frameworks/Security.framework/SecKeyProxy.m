@implementation SecKeyProxy

- (SecKeyProxy)initWithKey:(__SecKey *)a3 certificate:(id)a4
{
  id v7;
  SecKeyProxy *v8;
  SecKeyProxy *v9;
  id key;
  uint64_t v11;
  NSXPCListener *listener;
  NSXPCListener *v13;
  dispatch_queue_t v14;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SecKeyProxy;
  v8 = -[SecKeyProxy init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    if (a3)
    {
      CFRetain(a3);
      key = v9->_key;
      v9->_key = a3;
    }
    else
    {
      key = v8->_key;
      v8->_key = 0;
    }

    objc_storeStrong((id *)&v9->_certificate, a4);
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v11 = objc_claimAutoreleasedReturnValue();
    listener = v9->_listener;
    v9->_listener = (NSXPCListener *)v11;

    -[NSXPCListener setDelegate:](v9->_listener, "setDelegate:", v9);
    v13 = v9->_listener;
    v14 = dispatch_queue_create("SecKeyProxy", 0);
    -[NSXPCListener _setQueue:](v13, "_setQueue:", v14);

    -[NSXPCListener resume](v9->_listener, "resume");
  }

  return v9;
}

- (SecKeyProxy)initWithKey:(__SecKey *)a3
{
  return -[SecKeyProxy initWithKey:certificate:](self, "initWithKey:certificate:", a3, 0);
}

- (SecKeyProxy)initWithIdentity:(__SecIdentity *)a3
{
  unint64_t v5;
  unint64_t v6;
  SecKeyProxy *v7;
  CFDataRef v8;

  v5 = *((_QWORD *)a3 + 3);
  CFRetain((CFTypeRef)v5);
  v6 = *((_QWORD *)a3 + 2);
  CFRetain((CFTypeRef)v6);
  if (v5 | v6)
  {
    v8 = SecCertificateCopyData((SecCertificateRef)v6);
    if (v8)
    {
      self = -[SecKeyProxy initWithKey:certificate:](self, "initWithKey:certificate:", v5, v8);
      v7 = self;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SecKeyProxyTarget *v9;
  void *v10;
  int64_t *p_clientCount;
  unint64_t v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF84DA0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  v9 = -[SecKeyProxyTarget initWithKey:certificate:]([SecKeyProxyTarget alloc], "initWithKey:certificate:", self->_key, self->_certificate);
  objc_msgSend(v7, "setExportedObject:", v9);

  -[NSXPCListener _queue](self->_listener, "_queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setQueue:", v10);

  p_clientCount = &self->_clientCount;
  do
    v12 = __ldaxr((unint64_t *)p_clientCount);
  while (__stlxr(v12 + 1, (unint64_t *)p_clientCount));
  -[SecKeyProxy clientConnectionHandler](self, "clientConnectionHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SecKeyProxy clientConnectionHandler](self, "clientConnectionHandler");
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL))v14)[2](v14, v12 == 0);

  }
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __50__SecKeyProxy_listener_shouldAcceptNewConnection___block_invoke;
  v19 = &unk_1E1FD8518;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v7, "setInvalidationHandler:", &v16);
  objc_msgSend(v7, "resume", v16, v17, v18, v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return 1;
}

- (void)invalidate
{
  -[NSXPCListener invalidate](self->_listener, "invalidate");
}

- (void)dealloc
{
  objc_super v3;

  -[SecKeyProxy invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SecKeyProxy;
  -[SecKeyProxy dealloc](&v3, sel_dealloc);
}

- (NSXPCListenerEndpoint)endpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

- (id)clientConnectionHandler
{
  return self->_clientConnectionHandler;
}

- (void)setClientConnectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)clientDisconnectionHandler
{
  return self->_clientDisconnectionHandler;
}

- (void)setClientDisconnectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientDisconnectionHandler, 0);
  objc_storeStrong(&self->_clientConnectionHandler, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong(&self->_key, 0);
}

void __50__SecKeyProxy_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  unint64_t *WeakRetained;
  unint64_t *v2;
  unint64_t v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  unint64_t *v6;

  WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 4;
    do
      v3 = __ldaxr(v2);
    while (__stlxr(v3 - 1, v2));
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "clientDisconnectionHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v6;
    if (v4)
    {
      objc_msgSend(v6, "clientDisconnectionHandler");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, BOOL))v5)[2](v5, v3 == 1);

      WeakRetained = v6;
    }
  }

}

+ (id)targetForKey:(__SecKey *)a3 error:(__CFError *)a4
{
  void *v4;
  _QWORD v6[5];

  v4 = (void *)*((_QWORD *)a3 + 3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__SecKeyProxy_targetForKey_error___block_invoke;
  v6[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v6[4] = a4;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (__SecKey)createItemFromEndpoint:(id)a3 certificate:(id *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __SecKey *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v7);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF84DA0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteObjectInterface:", v9);

  objc_msgSend(v8, "resume");
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__10135;
  v26 = __Block_byref_object_dispose__10136;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10135;
  v20 = __Block_byref_object_dispose__10136;
  v10 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__SecKeyProxy_createItemFromEndpoint_certificate_error___block_invoke;
  v15[3] = &unk_1E1FD8560;
  v15[4] = &v22;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __56__SecKeyProxy_createItemFromEndpoint_certificate_error___block_invoke_2;
  v14[3] = &unk_1E1FD8588;
  v14[4] = &v16;
  objc_msgSend(v11, "initializeWithReply:", v14);

  if (v23[5])
  {
    objc_msgSend(v8, "invalidate");
    v12 = 0;
    if (a5)
      *a5 = objc_retainAutorelease((id)v23[5]);
  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease((id)v17[5]);
    v12 = (__SecKey *)SecKeyCreate(*MEMORY[0x1E0C9AE00], (uint64_t)&SecRemoteKeyDescriptor, (uint64_t)v8, 0, 0);
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

+ (__SecKey)createKeyFromEndpoint:(id)a3 error:(id *)a4
{
  return (__SecKey *)objc_msgSend(a1, "createItemFromEndpoint:certificate:error:", a3, 0, a4);
}

+ (__SecIdentity)createIdentityFromEndpoint:(id)a3 error:(id *)a4
{
  void *v5;
  const __CFData *v6;
  const __CFData *v7;
  uint64_t v8;
  void *v9;
  __SecIdentity *v10;
  void *v11;
  uint64_t v12;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v5 = (void *)objc_msgSend(a1, "createItemFromEndpoint:certificate:error:", a3, &v14, a4);
  v6 = (const __CFData *)v14;
  v7 = v6;
  if (!v5)
    goto LABEL_7;
  if (!v6)
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0C9AFC8];
      v15 = *MEMORY[0x1E0CB2D50];
      v16[0] = CFSTR("Attempt to create remote identity from key-only proxy");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -50, v9);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v8 = *MEMORY[0x1E0C9AE00];
  v9 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6);
  v10 = (__SecIdentity *)SecIdentityCreate(v8, v9, v5);
LABEL_6:

LABEL_8:
  return v10;
}

void __56__SecKeyProxy_createItemFromEndpoint_certificate_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0C9AFC8];
  v11 = *MEMORY[0x1E0CB3388];
  v12[0] = a2;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a2;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -25300, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __56__SecKeyProxy_createItemFromEndpoint_certificate_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __34__SecKeyProxy_targetForKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = v3;
    **(_QWORD **)(a1 + 32) = v3;
    v3 = v4;
  }

}

@end
