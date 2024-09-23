@implementation GCConfigXPCServiceServiceConnection

+ (Protocol)serviceProtocol
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)connection:(id)a3 withClient:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("GCConfigXPCServiceServiceConnection.m"), 35, CFSTR("Invalid parameter not satisfying: %s"), "rootConnection != nil");

  }
  objc_msgSend(a1, "serviceProtocol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectToService:withClient:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__GCConfigXPCServiceServiceConnection_connection_withClient___block_invoke;
  v15[3] = &unk_1EA4D3EC8;
  v16 = v7;
  v17 = a1;
  v11 = v7;
  objc_msgSend(v10, "thenSynchronouslyWithResult:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __61__GCConfigXPCServiceServiceConnection_connection_withClient___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  if (a2)
  {
    v3 = *(objc_class **)(a1 + 40);
    v4 = a2;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithConnection:serviceVendor:", *(_QWORD *)(a1 + 32), v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (GCConfigXPCServiceServiceConnection)initWithConnection:(id)a3 serviceVendor:(id)a4
{
  id v8;
  id v9;
  GCConfigXPCServiceServiceConnection *v10;
  uint64_t v11;
  NSArray *invalidationHandlers;
  GCConfigXPCServiceServiceConnection *v13;
  GCConfigXPCServiceServiceConnection *v14;
  void (**v15)(_QWORD);
  uint64_t v16;
  id rootConnectionInterruptionObserver;
  uint64_t v18;
  id rootConnectionInvalidationObserver;
  GCConfigXPCServiceServiceConnection *v20;
  void *v22;
  void *v23;
  _QWORD aBlock[4];
  GCConfigXPCServiceServiceConnection *v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)GCConfigXPCServiceServiceConnection;
  v10 = -[GCConfigXPCServiceServiceConnection init](&v26, sel_init);
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("GCConfigXPCServiceServiceConnection.m"), 51, CFSTR("Invalid parameter not satisfying: %s"), "rootConnection != nil");

    if (v9)
      goto LABEL_3;
LABEL_8:
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("GCConfigXPCServiceServiceConnection.m"), 52, CFSTR("Invalid parameter not satisfying: %s"), "serviceVendor != nil");

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_8;
LABEL_3:
  objc_storeStrong((id *)&v10->_rootConnection, a3);
  objc_storeStrong(&v10->_serviceVendor, a4);
  v11 = objc_opt_new();
  invalidationHandlers = v10->_invalidationHandlers;
  v10->_invalidationHandlers = (NSArray *)v11;

  atomic_store(0, (unsigned __int8 *)&v10->_invalid);
  v13 = v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__GCConfigXPCServiceServiceConnection_initWithConnection_serviceVendor___block_invoke;
  aBlock[3] = &unk_1EA4D2DB8;
  v14 = v13;
  v25 = v14;
  v15 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[GCIPCRemoteConnection addInterruptionHandler:](v10->_rootConnection, "addInterruptionHandler:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  rootConnectionInterruptionObserver = v14->_rootConnectionInterruptionObserver;
  v14->_rootConnectionInterruptionObserver = (id)v16;

  -[GCIPCRemoteConnection addInvalidationHandler:](v10->_rootConnection, "addInvalidationHandler:", v15);
  v18 = objc_claimAutoreleasedReturnValue();
  rootConnectionInvalidationObserver = v14->_rootConnectionInvalidationObserver;
  v14->_rootConnectionInvalidationObserver = (id)v18;

  if (!v14->_rootConnectionInterruptionObserver || !v14->_rootConnectionInvalidationObserver)
    v15[2](v15);
  v20 = v14;

  return v20;
}

void __72__GCConfigXPCServiceServiceConnection_initWithConnection_serviceVendor___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  const char *v5;
  unsigned __int8 v6;
  id Property;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _QWORD v33[2];
  _QWORD v34[2];
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  _gc_log_ipc();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v36 = v3;
    _os_log_impl(&dword_1DC79E000, v2, OS_LOG_TYPE_INFO, "%@: Invalidating", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v6 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
  if ((v6 & 1) != 0)
  {
    objc_sync_exit(v4);
  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v5, 48, 1);
    v8 = Property;
    v10 = *(_QWORD *)(a1 + 32);
    v9 = a1 + 32;
    v11 = *(void **)(v10 + 16);
    *(_QWORD *)(v10 + 16) = 0;

    v12 = *(void **)(*(_QWORD *)v9 + 24);
    *(_QWORD *)(*(_QWORD *)v9 + 24) = 0;

    objc_sync_exit(v4);
    v13 = *MEMORY[0x1E0CB2D68];
    v33[0] = *MEMORY[0x1E0CB2D50];
    v33[1] = v13;
    v34[0] = CFSTR("Request failed.");
    v34[1] = CFSTR("Service connection invalidated.");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_IPCError:userInfo:](&off_1F03A6B68, "gc_IPCError:userInfo:", 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = objc_msgSend(0, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v28;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(0);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v18++), "failWithError:", v15);
        }
        while (v16 != v18);
        v16 = objc_msgSend(0, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v16);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v8, "reverseObjectEnumerator", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v24;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v19);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22++) + 16))();
        }
        while (v20 != v22);
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v20);
    }

    v4 = v8;
  }

}

- (id)invalidationHandlers
{
  if (result)
    return objc_getProperty(result, a2, 48, 1);
  return result;
}

- (BOOL)isInvalid
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_invalid);
  return v2 & 1;
}

- (id)addInvalidationHandler:(id)a3
{
  void *v4;
  GCConfigXPCServiceServiceConnection *v5;
  const char *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  SEL v11;
  _GCDisposable *v12;
  _GCDisposable *v13;
  _QWORD v15[5];
  id v16;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = self;
  objc_sync_enter(v5);
  v7 = atomic_load((unsigned __int8 *)&v5->_invalid);
  if ((v7 & 1) != 0)
  {
    objc_sync_exit(v5);

    v13 = 0;
  }
  else
  {
    v8 = objc_getProperty(v5, v6, 48, 1);
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v10 = _Block_copy(v4);
    objc_msgSend(v9, "addObject:", v10);

    objc_setProperty_atomic_copy(v5, v11, v9, 48);
    objc_sync_exit(v5);

    v12 = [_GCDisposable alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__GCConfigXPCServiceServiceConnection_addInvalidationHandler___block_invoke;
    v15[3] = &unk_1EA4D3408;
    v15[4] = v5;
    v16 = v4;
    v13 = -[_GCDisposable initWithCleanupHandler:](v12, "initWithCleanupHandler:", v15);

  }
  return v13;
}

- (void)setInvalidationHandlers:(void *)a1
{
  if (a1)
    objc_setProperty_atomic_copy(a1, newValue, newValue, 48);
}

void __62__GCConfigXPCServiceServiceConnection_addInvalidationHandler___block_invoke(uint64_t a1)
{
  const char *v2;
  id Property;
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v2, 48, 1);
  v4 = Property;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v5, "removeObject:", v6);

  v8 = *(void **)(a1 + 32);
  if (v8)
    objc_setProperty_atomic_copy(v8, v7, v5, 48);

  objc_sync_exit(obj);
}

- (void)scheduleSendBarrierBlock:(id)a3
{
  -[GCIPCRemoteConnection scheduleSendBarrierBlock:](self->_rootConnection, "scheduleSendBarrierBlock:", a3);
}

- (id)serviceVendorRequestWithLabel:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  GCConfigXPCServiceServiceConnection *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = -[GCOperation initOnQueue:withOptions:]([GCOperation alloc], "initOnQueue:withOptions:", 0, 0);
  objc_msgSend(v8, "setLabel:", v7);

  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke;
  v20[3] = &unk_1EA4D3480;
  v20[4] = self;
  v10 = v6;
  v21 = v10;
  objc_msgSend(v8, "setSyncBlock:", v20);
  v14 = v9;
  v15 = 3221225472;
  v16 = __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_3;
  v17 = &unk_1EA4D34F8;
  v18 = self;
  v19 = v10;
  v11 = v10;
  objc_msgSend(v8, "setAsyncBlock:", &v14);
  objc_msgSend(v8, "activate", v14, v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  v6 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
  if ((v6 & 1) != 0)
  {
    v15 = *MEMORY[0x1E0CB2D68];
    v34[0] = *MEMORY[0x1E0CB2D50];
    v34[1] = v15;
    v35[0] = CFSTR("Request failed.");
    v35[1] = CFSTR("Service connection is invalid.");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_IPCError:userInfo:](&off_1F03A6B68, "gc_IPCError:userInfo:", 1, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_retainAutorelease(v17);
    *a3 = v18;

    objc_sync_exit(v5);
    v14 = 0;
  }
  else
  {
    objc_sync_exit(v5);

    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__7;
    v32 = __Block_byref_object_dispose__7;
    v33 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__7;
    v26 = __Block_byref_object_dispose__7;
    v27 = 0;
    v7 = MEMORY[0x1E0C809B0];
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_18;
    v21[3] = &unk_1EA4D3430;
    v21[4] = &v22;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_2;
    v20[3] = &unk_1EA4D3458;
    v20[4] = &v28;
    v20[5] = &v22;
    (*(void (**)(uint64_t, void *, _QWORD *, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v9, v20, v11, v12, v13);
    *a3 = objc_retainAutorelease((id)v23[5]);
    v14 = (id)v29[5];

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);

  }
  return v14;
}

void __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_18(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = CFSTR("The request failed, but an error was not provided.");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_IPCError:userInfo:](&off_1F03A6B68, "gc_IPCError:userInfo:", 0, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v6)
  {
    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = a2;
  }
  else
  {
    if (!v7)
    {
      v15 = *MEMORY[0x1E0CB2D50];
      v16[0] = CFSTR("The request did not return a result, but an error was not provided.");
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_IPCError:userInfo:](&off_1F03A6B68, "gc_IPCError:userInfo:", 0, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      goto LABEL_6;
    }
    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = a3;
  }
  objc_storeStrong(v9, v10);
LABEL_6:

}

void __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
  if ((v5 & 1) != 0)
  {
    v11 = *MEMORY[0x1E0CB2D68];
    v18[0] = *MEMORY[0x1E0CB2D50];
    v18[1] = v11;
    v19[0] = CFSTR("Request failed.");
    v19[1] = CFSTR("Service connection is invalid.");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_IPCError:userInfo:](&off_1F03A6B68, "gc_IPCError:userInfo:", 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "failWithError:", v13);
    objc_sync_exit(v4);
  }
  else
  {
    objc_sync_exit(v4);

    v6 = MEMORY[0x1E0C809B0];
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_4;
    v16[3] = &unk_1EA4D34A8;
    v8 = v3;
    v17 = v8;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_5;
    v14[3] = &unk_1EA4D34D0;
    v15 = v8;
    (*(void (**)(uint64_t, void *, _QWORD *))(v10 + 16))(v10, v9, v14);

    v4 = v17;
  }

}

void __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    v5 = *MEMORY[0x1E0CB2D50];
    v6[0] = CFSTR("The request failed, but an error was not provided.");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_IPCError:userInfo:](&off_1F03A6B68, "gc_IPCError:userInfo:", 0, v4);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "failWithError:", v3);

}

void __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "succeedWithResult:", v5);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v8, "failWithError:", v6);
    }
    else
    {
      v11 = *MEMORY[0x1E0CB2D50];
      v12[0] = CFSTR("The request did not return a result, but an error was not provided.");
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_IPCError:userInfo:](&off_1F03A6B68, "gc_IPCError:userInfo:", 0, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "failWithError:", v10);

    }
  }

}

- (id)serviceVendorRequestWithHandler:(id)a3
{
  return -[GCConfigXPCServiceServiceConnection serviceVendorRequestWithLabel:handler:](self, "serviceVendorRequestWithLabel:handler:", 0, a3);
}

- (id)serviceVendor
{
  if (result)
    return objc_getProperty(result, a2, 32, 1);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationHandlers, 0);
  objc_storeStrong(&self->_serviceVendor, 0);
  objc_storeStrong(&self->_rootConnectionInvalidationObserver, 0);
  objc_storeStrong(&self->_rootConnectionInterruptionObserver, 0);
  objc_storeStrong((id *)&self->_rootConnection, 0);
}

@end
