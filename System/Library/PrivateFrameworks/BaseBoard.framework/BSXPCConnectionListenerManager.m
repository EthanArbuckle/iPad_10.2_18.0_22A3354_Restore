@implementation BSXPCConnectionListenerManager

+ (id)sharedInstance
{
  objc_opt_self();
  if (qword_1ECD39870 != -1)
    dispatch_once(&qword_1ECD39870, &__block_literal_global_9);
  return (id)_MergedGlobals_11;
}

void __48__BSXPCConnectionListenerManager_sharedInstance__block_invoke()
{
  BSXPCConnectionListenerManager *v0;
  _QWORD *v1;
  dispatch_queue_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  dispatch_queue_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v0 = [BSXPCConnectionListenerManager alloc];
  if (v0)
  {
    v11.receiver = v0;
    v11.super_class = (Class)BSXPCConnectionListenerManager;
    v1 = objc_msgSendSuper2(&v11, sel_init);
    if (v1)
    {
      v2 = BSDispatchQueueCreateWithQualityOfService("com.apple.baseboard.xpc.connectionListening", 0, QOS_CLASS_USER_INTERACTIVE, 0);
      v3 = (void *)v1[1];
      v1[1] = v2;

      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v5 = (void *)v1[2];
      v1[2] = v4;

      v6 = objc_alloc_init(MEMORY[0x1E0CB3740]);
      v7 = (void *)v1[3];
      v1[3] = v6;

      v8 = BSDispatchQueueCreateWithQualityOfService("com.apple.baseboard.xpc.connectionListening", 0, QOS_CLASS_USER_INITIATED, 0);
      v9 = (void *)v1[4];
      v1[4] = v8;

    }
  }
  else
  {
    v1 = 0;
  }
  v10 = (void *)_MergedGlobals_11;
  _MergedGlobals_11 = (uint64_t)v1;

}

- (BSXPCConnectionListenerManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSXPCConnectionListenerManager.m"), 114, CFSTR("init is not allowed"));

  return 0;
}

- (void)dealloc
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_services;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_services, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6));
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        if (v7)
        {
          v9 = *(void **)(v7 + 8);
          *(_QWORD *)(v7 + 8) = 0;

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  v10.receiver = self;
  v10.super_class = (Class)BSXPCConnectionListenerManager;
  -[BSXPCConnectionListenerManager dealloc](&v10, sel_dealloc);
}

void __66__BSXPCConnectionListenerManager__addService_withHandler_onQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  Class Class;
  const char *v5;
  void *v6;
  NSObject *Property;
  void *v8;
  id xdict;
  _QWORD block[4];
  id v11;
  id v12;

  xdict = a2;
  v3 = (void *)MEMORY[0x18D769AE0]();
  Class = object_getClass(xdict);
  if (Class == (Class)MEMORY[0x1E0C81310])
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error on %@: %s"), *(_QWORD *)(a1 + 32), xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]));
  }
  else if (Class == (Class)MEMORY[0x1E0C812E0])
  {
    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      Property = objc_getProperty(v6, v5, 32, 1);
      v8 = *(void **)(a1 + 32);
    }
    else
    {
      v8 = 0;
      Property = 0;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__BSXPCConnectionListenerManager__addService_withHandler_onQueue___block_invoke_2;
    block[3] = &unk_1E1EBE700;
    v11 = v8;
    v12 = xdict;
    dispatch_sync(Property, block);

  }
  objc_autoreleasePoolPop(v3);

}

void __66__BSXPCConnectionListenerManager__addService_withHandler_onQueue___block_invoke_2(uint64_t a1, const char *a2)
{
  id Property;
  const char *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 16, 1);
  v8 = Property;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (v5)
    v7 = objc_getProperty(v5, v4, 24, 1);
  else
    v7 = 0;
  objc_msgSend(v8, "handleIncomingConnection:forService:", v6, v7);

}

+ (id)defaultHandlerQueue
{
  uint64_t v2;
  void *v3;
  id v4;

  +[BSXPCConnectionListenerManager sharedInstance]();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = *(id *)(v2 + 32);
  else
    v4 = 0;

  return v4;
}

+ (void)listenForService:(id)a3 onQueue:(id)a4 withHandler:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  BSXPCConnectionListener *v14;
  _xpc_connection_s *v15;
  id v16;
  id v17;
  id v18;
  id *v19;
  id *v20;
  uint64_t v21;
  id v22;
  id *v23;
  const char *v24;
  void *v25;
  id Property;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  xpc_connection_t obj;
  id v38;
  id v39;
  objc_super handler;
  void (*v41)(uint64_t, void *);
  void *v42;
  id *v43;

  v7 = a3;
  v35 = a4;
  v34 = a5;
  +[BSXPCConnectionListenerManager sharedInstance]();
  v8 = objc_claimAutoreleasedReturnValue();
  v39 = v7;
  v9 = v34;
  v10 = v35;
  if (!v8)
    goto LABEL_19;
  v11 = (void *)MEMORY[0x18D769AE0]();
  v38 = v10;
  objc_msgSend(*(id *)(v8 + 24), "lock");
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__addService_withHandler_onQueue_, v8, CFSTR("BSXPCConnectionListenerManager.m"), 148, CFSTR("cannot add a nil handler -> service = %@"), v39);

  }
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel__addService_withHandler_onQueue_, v8, CFSTR("BSXPCConnectionListenerManager.m"), 149, CFSTR("cannot add a handler for a nil service -> handler = %@"), v9);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__addService_withHandler_onQueue_, v8, CFSTR("BSXPCConnectionListenerManager.m"), 150, CFSTR("cannot add a handler without a queue -> service = %@ : handler = %@"), 0, v9);

  }
  objc_msgSend(*(id *)(v8 + 16), "objectForKey:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", sel__addService_withHandler_onQueue_, v8, CFSTR("BSXPCConnectionListenerManager.m"), 151, CFSTR("cannot add a service twice -> service = %@ : handler = %@"), v39, v9);

  }
  v36 = a4;
  v13 = objc_retainAutorelease(v39);
  obj = xpc_connection_create_mach_service((const char *)objc_msgSend(v13, "UTF8String"), *(dispatch_queue_t *)(v8 + 8), 1uLL);
  v14 = [BSXPCConnectionListener alloc];
  v15 = obj;
  v16 = v13;
  v17 = v9;
  v18 = v10;
  if (v14)
  {
    if (v15)
    {
      if (v9)
      {
LABEL_11:
        if (!v39)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithConnection_forService_withHandler_onQueue_, v14, CFSTR("BSXPCConnectionListenerManager.m"), 43, CFSTR("cannot initialize without a service"));

        }
        handler.receiver = v14;
        handler.super_class = (Class)BSXPCConnectionListener;
        v19 = objc_msgSendSuper2(&handler, sel_init);
        v20 = v19;
        if (v19)
        {
          objc_storeStrong(v19 + 1, obj);
          objc_storeStrong(v20 + 2, a5);
          v21 = objc_msgSend(v16, "copy");
          v22 = v20[3];
          v20[3] = (id)v21;

          if (v18)
            objc_storeStrong(v20 + 4, v36);
        }
        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithConnection_forService_withHandler_onQueue_, v14, CFSTR("BSXPCConnectionListenerManager.m"), 41, CFSTR("cannot initialize with a NULL connection"));

      if (v9)
        goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithConnection_forService_withHandler_onQueue_, v14, CFSTR("BSXPCConnectionListenerManager.m"), 42, CFSTR("cannot initialize without a handler"));

    goto LABEL_11;
  }
  v20 = 0;
LABEL_16:

  handler.receiver = (id)MEMORY[0x1E0C809B0];
  handler.super_class = (Class)3221225472;
  v41 = __66__BSXPCConnectionListenerManager__addService_withHandler_onQueue___block_invoke;
  v42 = &unk_1E1EBEF28;
  v23 = v20;
  v43 = v23;
  xpc_connection_set_event_handler(v15, &handler);
  v25 = *(void **)(v8 + 16);
  v10 = v38;
  if (v23)
    Property = objc_getProperty(v23, v24, 24, 1);
  else
    Property = 0;
  objc_msgSend(v25, "setObject:forKey:", v23, Property);
  xpc_connection_resume(v15);
  objc_msgSend(*(id *)(v8 + 24), "unlock");

  objc_autoreleasePoolPop(v11);
LABEL_19:

}

+ (void)stopListeningForService:(id)a3
{
  id v3;
  id *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  +[BSXPCConnectionListenerManager sharedInstance]();
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x18D769AE0]();
    objc_msgSend(v4[3], "lock");
    objc_msgSend(v4[2], "objectForKey:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v8 = *(void **)(v6 + 8);
      *(_QWORD *)(v6 + 8) = 0;

    }
    objc_msgSend(v4[2], "removeObjectForKey:", v9);
    objc_msgSend(v4[3], "unlock");

    objc_autoreleasePoolPop(v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultHandlerQueue, 0);
  objc_storeStrong((id *)&self->_servicesLock, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_listeningQueue, 0);
}

@end
