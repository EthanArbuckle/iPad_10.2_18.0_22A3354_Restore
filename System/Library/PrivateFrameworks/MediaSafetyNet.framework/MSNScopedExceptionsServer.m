@implementation MSNScopedExceptionsServer

- (MSNScopedExceptionsServer)initWithQueue:(id)a3
{
  id v5;
  MSNScopedExceptionsServer *v6;
  uint64_t v7;
  NSMutableArray *activeExceptions;
  __CFString *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSXPCListener *listener;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MSNScopedExceptionsServer;
  v6 = -[MSNScopedExceptionsServer init](&v20, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    activeExceptions = v6->_activeExceptions;
    v6->_activeExceptions = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_queue, a3);
    if (g_serverMode == 2)
    {
      objc_msgSend(CFSTR("com.apple.mediasafetynet.exceptions"), "stringByAppendingString:", CFSTR(".cam"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = CFSTR("com.apple.mediasafetynet.exceptions");
    }
    MSNLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[MSNScopedExceptionsServer initWithQueue:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v9);
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v17;

    -[NSXPCListener setDelegate:](v6->_listener, "setDelegate:", v6);
    -[NSXPCListener resume](v6->_listener, "resume");

  }
  return v6;
}

+ (id)validEntitlements
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MSNScopedExceptionsServer_validEntitlements__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (validEntitlements_onceToken != -1)
    dispatch_once(&validEntitlements_onceToken, block);
  return (id)validEntitlements_validEntitlements;
}

void __46__MSNScopedExceptionsServer_validEntitlements__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "validExceptions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(CFSTR("com.apple.private.mediasafetynet.exception."), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = objc_msgSend(v2, "copy");
  v10 = (void *)validEntitlements_validEntitlements;
  validEntitlements_validEntitlements = v9;

}

+ (id)validExceptions
{
  if (validExceptions_onceToken != -1)
    dispatch_once(&validExceptions_onceToken, &__block_literal_global_1);
  return (id)validExceptions_validExceptions;
}

void __44__MSNScopedExceptionsServer_validExceptions__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[14];

  v4[13] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("announcemessage");
  v4[1] = CFSTR("notificationappex");
  v4[2] = CFSTR("xctest");
  v4[3] = CFSTR("emergency");
  v4[4] = CFSTR("audiotesting");
  v4[5] = CFSTR("mediacontrol");
  v4[6] = CFSTR("shazam");
  v4[7] = CFSTR("keyboardcamera");
  v4[8] = CFSTR("callsam");
  v4[9] = CFSTR("magnifierangel");
  v4[10] = CFSTR("findingui");
  v4[11] = CFSTR("callbanner");
  v4[12] = CFSTR("continuitycapture");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 13);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)validExceptions_validExceptions;
  validExceptions_validExceptions = v2;

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  MSNScopedExceptionsServer *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  +[MSNScopedExceptionsServer validEntitlements](MSNScopedExceptionsServer, "validEntitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "valueForEntitlement:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLValue");

        if ((v12 & 1) != 0)
        {

          objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFE39D28);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setExportedInterface:", v14);

          objc_msgSend(v5, "setExportedObject:", self);
          v18 = MEMORY[0x1E0C809B0];
          v19 = 3221225472;
          v20 = __64__MSNScopedExceptionsServer_listener_shouldAcceptNewConnection___block_invoke;
          v21 = &unk_1E9775FA8;
          v22 = self;
          v15 = v5;
          v23 = v15;
          v16 = (void *)MEMORY[0x1D8258FB0](&v18);
          objc_msgSend(v15, "setInterruptionHandler:", v16, v18, v19, v20, v21, v22);
          objc_msgSend(v15, "setInvalidationHandler:", v16);
          objc_msgSend(v15, "resume");

          v13 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v8)
        continue;
      break;
    }
  }

  v13 = 0;
LABEL_11:

  return v13;
}

void __64__MSNScopedExceptionsServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  MSNLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __64__MSNScopedExceptionsServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v2);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 24);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__MSNScopedExceptionsServer_listener_shouldAcceptNewConnection___block_invoke_61;
  v6[3] = &unk_1E9775FA8;
  v6[4] = v3;
  v7 = v4;
  dispatch_async(v5, v6);

}

void __64__MSNScopedExceptionsServer_listener_shouldAcceptNewConnection___block_invoke_61(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  int v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 138543618;
    v15 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "connection", v15, (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 40);

        if (v10 == v11)
        {
          MSNLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v9, "exception");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(*(id *)(a1 + 40), "processIdentifier");
            *(_DWORD *)buf = v15;
            v21 = v13;
            v22 = 1024;
            v23 = v14;
            _os_log_impl(&dword_1D416F000, v12, OS_LOG_TYPE_INFO, "Expiring exception %{public}@ from pid %i due to invalidation.", buf, 0x12u);

          }
          objc_msgSend(v2, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectsInArray:", v2);
}

- (BOOL)isConnectionAllowedToAssertException:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.private.mediasafetynet.exception."), "stringByAppendingString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForEntitlement:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)beginException:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD block[4];
  id v15;
  id v16;
  MSNScopedExceptionsServer *v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MSNScopedExceptionsServer isConnectionAllowedToAssertException:](self, "isConnectionAllowedToAssertException:", v4))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__MSNScopedExceptionsServer_beginException___block_invoke;
    block[3] = &unk_1E9776070;
    v15 = v4;
    v16 = v5;
    v17 = self;
    dispatch_async(queue, block);

  }
  else
  {
    MSNLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MSNScopedExceptionsServer beginException:].cold.1((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(v5, "invalidate");
  }

}

void __44__MSNScopedExceptionsServer_beginException___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  MSNScopedException *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MSNLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "processIdentifier");
    v7 = 138543618;
    v8 = v3;
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_1D416F000, v2, OS_LOG_TYPE_INFO, "Beginning exception %{public}@ from pid %i.", (uint8_t *)&v7, 0x12u);
  }

  v5 = *(void **)(*(_QWORD *)(a1 + 48) + 16);
  v6 = -[MSNScopedException initWithConnection:exception:]([MSNScopedException alloc], "initWithConnection:exception:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "addObject:", v6);

}

- (void)endException:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MSNScopedExceptionsServer isConnectionAllowedToAssertException:](self, "isConnectionAllowedToAssertException:", v4))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__MSNScopedExceptionsServer_endException___block_invoke;
    block[3] = &unk_1E9776070;
    block[4] = self;
    v9 = v5;
    v10 = v4;
    dispatch_async(queue, block);

  }
  else
  {
    MSNLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MSNScopedExceptionsServer endException:].cold.1((uint64_t)v4, v5);

    objc_msgSend(v5, "invalidate");
  }

}

uint64_t __42__MSNScopedExceptionsServer_endException___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
    goto LABEL_9;
  v2 = 0;
  v3 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 == *(void **)(a1 + 40))
    {
      objc_msgSend(v4, "exception");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 48));

      if (v8)
        v3 = v2;
    }
    else
    {

    }
    ++v2;
  }
  while (v2 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    MSNLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 48);
      v13 = objc_msgSend(*(id *)(a1 + 40), "processIdentifier");
      v14 = 138543618;
      v15 = v12;
      v16 = 1024;
      v17 = v13;
      _os_log_impl(&dword_1D416F000, v11, OS_LOG_TYPE_INFO, "Ending exception %{public}@ from pid %i.", (uint8_t *)&v14, 0x12u);
    }

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectAtIndex:", v3);
  }
  else
  {
LABEL_9:
    MSNLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __42__MSNScopedExceptionsServer_endException___block_invoke_cold_1(a1);

    return objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }
}

- (BOOL)isExceptionInEffect:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_activeExceptions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "exception", (_QWORD)v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          MSNLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v26 = v4;
            _os_log_impl(&dword_1D416F000, v19, OS_LOG_TYPE_INFO, "Found exception %{public}@", buf, 0xCu);
          }

          v18 = 1;
          goto LABEL_15;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      if (v7)
        continue;
      break;
    }
  }

  MSNLog();
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_DEBUG))
    -[MSNScopedExceptionsServer isExceptionInEffect:].cold.1((uint64_t)v4, &v5->super.super, v12, v13, v14, v15, v16, v17);
  v18 = 0;
LABEL_15:

  return v18;
}

+ (id)proxyForMachServiceName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v3, 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFE39D28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__MSNScopedExceptionsServer_proxyForMachServiceName___block_invoke;
  v16[3] = &unk_1E9775FF8;
  v7 = v3;
  v17 = v7;
  objc_msgSend(v4, "setInterruptionHandler:", v16);
  v11 = v6;
  v12 = 3221225472;
  v13 = __53__MSNScopedExceptionsServer_proxyForMachServiceName___block_invoke_66;
  v14 = &unk_1E9775FF8;
  v15 = v7;
  v8 = v7;
  objc_msgSend(v4, "setInvalidationHandler:", &v11);
  objc_msgSend(v4, "resume", v11, v12, v13, v14);
  objc_msgSend(v4, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __53__MSNScopedExceptionsServer_proxyForMachServiceName___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MSNLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1D416F000, v2, OS_LOG_TYPE_INFO, "Interrupted (%@): If this happens at connection-time or when setting an exception, a required entitlement is likely missing.", (uint8_t *)&v4, 0xCu);
  }

}

void __53__MSNScopedExceptionsServer_proxyForMachServiceName___block_invoke_66(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MSNLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1D416F000, v2, OS_LOG_TYPE_INFO, "Invalidated (%@).", (uint8_t *)&v4, 0xCu);
  }

}

+ (id)sharedProxy
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MSNScopedExceptionsServer_sharedProxy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedProxy_onceToken != -1)
    dispatch_once(&sharedProxy_onceToken, block);
  return (id)sharedProxy_sharedProxy;
}

void __40__MSNScopedExceptionsServer_sharedProxy__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "proxyForMachServiceName:", CFSTR("com.apple.mediasafetynet.exceptions"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedProxy_sharedProxy;
  sharedProxy_sharedProxy = v1;

}

+ (id)sharedMicProxy
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MSNScopedExceptionsServer_sharedMicProxy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMicProxy_onceToken != -1)
    dispatch_once(&sharedMicProxy_onceToken, block);
  return (id)sharedMicProxy_sharedProxy;
}

void __43__MSNScopedExceptionsServer_sharedMicProxy__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "proxyForMachServiceName:", CFSTR("com.apple.mediasafetynet.exceptions"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedMicProxy_sharedProxy;
  sharedMicProxy_sharedProxy = v1;

}

+ (id)sharedCamProxy
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MSNScopedExceptionsServer_sharedCamProxy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCamProxy_onceToken != -1)
    dispatch_once(&sharedCamProxy_onceToken, block);
  return (id)sharedCamProxy_sharedProxy;
}

void __43__MSNScopedExceptionsServer_sharedCamProxy__block_invoke(uint64_t a1)
{
  void *v1;
  const __CFString *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = CFSTR(".cam");
  if ((_os_feature_enabled_impl() & 1) == 0 && !_os_feature_enabled_impl())
    v2 = &stru_1E9776A60;
  objc_msgSend(CFSTR("com.apple.mediasafetynet.exceptions"), "stringByAppendingString:", v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "proxyForMachServiceName:", v5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)sharedCamProxy_sharedProxy;
  sharedCamProxy_sharedProxy = v3;

}

+ (id)proxiesForException:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  char *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  char *v47;
  _QWORD v48[12];
  _QWORD v49[12];
  _BYTE v50[128];
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0 || (_os_feature_enabled_impl() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v48[0] = CFSTR("announcemessage");
    v48[1] = CFSTR("notificationappex");
    v49[0] = &unk_1E9778028;
    v49[1] = &unk_1E9778040;
    v48[2] = CFSTR("xctest");
    v48[3] = CFSTR("emergency");
    v49[2] = &unk_1E9778058;
    v49[3] = &unk_1E9778070;
    v48[4] = CFSTR("audiotesting");
    v48[5] = CFSTR("shazam");
    v49[4] = &unk_1E9778088;
    v49[5] = &unk_1E97780A0;
    v48[6] = CFSTR("mediacontrol");
    v48[7] = CFSTR("keyboardcamera");
    v49[6] = &unk_1E97780B8;
    v49[7] = &unk_1E97780D0;
    v48[8] = CFSTR("magnifierangel");
    v48[9] = CFSTR("findingui");
    v49[8] = &unk_1E97780E8;
    v49[9] = &unk_1E9778100;
    v48[10] = CFSTR("callbanner");
    v48[11] = CFSTR("continuitycapture");
    v49[10] = &unk_1E9778118;
    v49[11] = &unk_1E9778130;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v41;
      *(_QWORD *)&v10 = 138412546;
      v39 = v10;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v13);
          MSNLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v19 = objc_msgSend(v14, "integerValue");
            if (v19 >= 3)
            {
              qword_1EFE381E8 = (uint64_t)"Unknown mode";
              MSNLog();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                ServerModeDescription_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
LABEL_27:

              abort();
            }
            v20 = (&off_1E9776428)[v19];
            *(_DWORD *)buf = v39;
            v45 = v7;
            v46 = 2080;
            v47 = v20;
            _os_log_debug_impl(&dword_1D416F000, v15, OS_LOG_TYPE_DEBUG, "Exception %@ with uses server %s", buf, 0x16u);
          }

          v16 = objc_msgSend(v14, "integerValue");
          if (v16 == 1)
          {
            objc_msgSend(a1, "sharedMicProxy");
            v17 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v16 != 2)
            {
              qword_1EFE381E8 = (uint64_t)"Only Cam and Mic servers can be requested.";
              MSNLog();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                +[MSNScopedExceptionsServer proxiesForException:].cold.1(v24, v32, v33, v34, v35, v36, v37, v38);
              goto LABEL_27;
            }
            objc_msgSend(a1, "sharedCamProxy");
            v17 = objc_claimAutoreleasedReturnValue();
          }
          v18 = (void *)v17;
          objc_msgSend(v5, "addObject:", v17, v39);

          ++v13;
        }
        while (v11 != v13);
        v21 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        v11 = v21;
      }
      while (v21);
    }

    MSNLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v4 = v7;
      v45 = v7;
      v46 = 2112;
      v47 = (char *)v5;
      _os_log_impl(&dword_1D416F000, v22, OS_LOG_TYPE_INFO, "Asserting exception %@ with servers %@", buf, 0x16u);
    }
    else
    {
      v4 = v7;
    }
  }
  else
  {
    objc_msgSend(a1, "sharedProxy");
    v22 = objc_claimAutoreleasedReturnValue();
    v51[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeExceptions, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)initWithQueue:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1D416F000, a2, a3, "MSN exceptions listening to Mach service name '%@'.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __64__MSNScopedExceptionsServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D416F000, log, OS_LOG_TYPE_DEBUG, "Connection gone.", v1, 2u);
}

- (void)beginException:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D416F000, a2, a3, "Missing entitlement for exception %{public}@. Invalidating connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)endException:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a2, "processIdentifier");
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1D416F000, v2, v3, "Missing entitlement for exception %{public}@ from pid %i. Invalidating connection.", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

void __42__MSNScopedExceptionsServer_endException___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*(id *)(a1 + 40), "processIdentifier");
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1D416F000, v1, v2, "Ending nonexistent exception %{public}@ from pid %i.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)isExceptionInEffect:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1D416F000, a2, a3, "No exception %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)proxiesForException:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D416F000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
