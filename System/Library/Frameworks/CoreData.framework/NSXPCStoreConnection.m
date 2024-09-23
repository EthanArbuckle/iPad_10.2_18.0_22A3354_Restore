@implementation NSXPCStoreConnection

- (void)sendMessageWithContext:(uint64_t)a1
{
  id v3;
  SEL v4;
  SEL v5;
  id newValue;

  if (a1)
  {
    newValue = 0;
    if (a2)
    {
      v3 = -[NSXPCStoreConnection sendMessage:store:error:](a1, *(_QWORD *)(a2 + 16), *(void **)(a2 + 8), &newValue);
      objc_setProperty_nonatomic((id)a2, v4, v3, 24);
      objc_setProperty_nonatomic((id)a2, v5, newValue, 32);
    }
    else
    {
      -[NSXPCStoreConnection sendMessage:store:error:](a1, 0, 0, &newValue);
    }
  }
}

- (id)sendMessage:(void *)a3 store:(_QWORD *)a4 error:
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  _QWORD v26[8];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[7];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  uint64_t v43;

  if (!a1)
    return 0;
  if (!*(_QWORD *)(a1 + 16))
  {
    if (a4)
    {
      v16 = 0;
      *a4 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134070, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Connection is nil"), CFSTR("Reason")));
      return v16;
    }
    return 0;
  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x3052000000;
  v41 = __Block_byref_object_copy__2;
  v42 = __Block_byref_object_dispose__2;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3052000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  v37 = 0;
  v8 = objc_msgSend(a3, "URL");
  v9 = *(void **)(a1 + 16);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke;
  v31[3] = &unk_1E1EDD548;
  v31[5] = &v38;
  v31[6] = &v32;
  v31[4] = v8;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke_2;
  v26[3] = &unk_1E1EDD570;
  v26[6] = &v38;
  v26[7] = &v27;
  v26[4] = a3;
  v26[5] = a1;
  objc_msgSend((id)objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v31), "handleRequest:reply:", a2, v26);
  if (*((_BYTE *)v28 + 24))
  {
    if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault") >= 1)
      _NSCoreDataLog(8, (uint64_t)CFSTR("Returning reply dict %@"), v10, v11, v12, v13, v14, v15, v39[5]);
  }
  else
  {
    if (a4)
    {
      v17 = (void *)v33[5];
      if (v17)
      {
        *a4 = v17;
        v33[5] = 0;
      }
    }
    if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault") >= 1)
      _NSCoreDataLog(8, (uint64_t)CFSTR("Failed send (no reply dict)."), v18, v19, v20, v21, v22, v23, v25);
  }

  if (*((_BYTE *)v28 + 24))
    v16 = (id)v39[5];
  else
    v16 = 0;
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
  return v16;
}

- (_QWORD)reconnect
{
  _QWORD *v1;
  void *v2;

  if (result)
  {
    v1 = result;
    objc_sync_enter(result);
    if (!v1[2])
    {
      v2 = (void *)v1[1];
      if (v2)
        v1[2] = -[NSXPCStoreConnection createConnectionWithOptions:]((uint64_t)v1, (void *)objc_msgSend(v2, "options"));
    }
    return (_QWORD *)objc_sync_exit(v1);
  }
  return result;
}

void __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke_2(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  if (a3)
  {
    v6 = +[_NSXPCStoreUtilities classesForErrorArchive]();
    v3 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v3, a1[4], v6);
  }
  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  if (!a2)
    a2 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = objc_msgSend(v7, "initWithObjectsAndKeys:", a2, CFSTR("reply"), v3, CFSTR("error"), 0);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault") >= 1)
    _NSCoreDataLog(8, (uint64_t)CFSTR("Created reply dict: %@"), v8, v9, v10, v11, v12, v13, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (id)initForStore:(id)a3
{
  NSXPCStoreConnection *v4;
  NSXPCStoreConnection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSXPCStoreConnection;
  v4 = -[NSXPCStoreConnection init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_store = (NSXPCStore *)a3;
    v4->_connection = (NSXPCConnection *)-[NSXPCStoreConnection createConnectionWithOptions:]((uint64_t)v4, (void *)objc_msgSend(a3, "options"));
  }
  return v5;
}

- (void)createConnectionWithOptions:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const void *v24;
  __CFDictionary *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint32_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[5];
  id v77;
  CFDictionaryValueCallBacks valueCallBacks;
  uint64_t v79;
  _QWORD v80[2];

  v80[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = objc_msgSend(a2, "valueForKey:", CFSTR("serviceName"));
  if (v4 || (v4 = objc_msgSend(a2, "valueForKey:", CFSTR("NSXPCStoreServiceName"))) != 0)
  {
    v5 = (void *)objc_msgSend(a2, "valueForKey:", CFSTR("agentOrDaemon"));
    if (!v5)
      v5 = (void *)objc_msgSend(a2, "valueForKey:", CFSTR("NSXPCStoreDaemonize"));
    v6 = objc_msgSend(v5, "BOOLValue");
    v7 = objc_alloc(MEMORY[0x1E0CB3B38]);
    if ((v6 & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "initWithMachServiceName:options:", v4, 2);
      if (!v8)
      {
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unable to create mach service NSXPCConnection -initWithMachServiceName:%@ returned nil");
        _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, v4);
        v16 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          LODWORD(valueCallBacks.version) = 138412290;
          *(CFIndex *)((char *)&valueCallBacks.version + 4) = v4;
          v23 = "CoreData: Unable to create mach service NSXPCConnection -initWithMachServiceName:%@ returned nil";
LABEL_14:
          v33 = v16;
          v34 = 12;
LABEL_15:
          _os_log_fault_impl(&dword_18A253000, v33, OS_LOG_TYPE_FAULT, v23, (uint8_t *)&valueCallBacks, v34);
          goto LABEL_31;
        }
        goto LABEL_31;
      }
    }
    else
    {
      v8 = (void *)objc_msgSend(v7, "initWithServiceName:", v4);
      if (!v8)
      {
        v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unable to create service NSXPCConnection -initWithServiceName:%@ returned nil");
        _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, v4);
        v16 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          LODWORD(valueCallBacks.version) = 138412290;
          *(CFIndex *)((char *)&valueCallBacks.version + 4) = v4;
          v23 = "CoreData: Unable to create service NSXPCConnection -initWithServiceName:%@ returned nil";
          goto LABEL_14;
        }
LABEL_31:
        _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to create NSXPCConnection"), v17, v18, v19, v20, v21, v22, v75);
        return 0;
      }
    }
  }
  else
  {
    v35 = objc_msgSend(a2, "valueForKey:", CFSTR("NSXPCStoreServerEndpointFactory"));
    if (!v35)
    {
      v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unable to create NSXPCConnection; no service name or endpoint factory.");
      _NSCoreDataLog(17, v44, v45, v46, v47, v48, v49, v50, v74);
      v51 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        goto LABEL_31;
      LOWORD(valueCallBacks.version) = 0;
      v23 = "CoreData: Unable to create NSXPCConnection; no service name or endpoint factory.";
      v33 = v51;
      v34 = 2;
      goto LABEL_15;
    }
    v36 = (void *)v35;
    v77 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v37 = objc_msgSend(v36, "newEndpointWithError:", &v77);
    else
      v37 = objc_msgSend(v36, "newEndpoint");
    v52 = (void *)v37;
    if (!v37)
    {
      if (v77)
      {
        _NSCoreDataLog(1, (uint64_t)CFSTR("Unable to create token NSXPCConnection.  NSXPCStoreServerEndpointFactory %p -newEndpointWithError returned error %@"), v38, v39, v40, v41, v42, v43, (uint64_t)v36);
        v70 = *MEMORY[0x1E0CB2C80];
        v71 = objc_msgSend(v77, "code");
        v72 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSXPCStoreServerEndpointFactory failed to provide an endpoint"));
        v79 = *MEMORY[0x1E0CB3388];
        v80[0] = v77;
        v73 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v70, v71, v72, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1));
        -[_NSCoreDataException _setDomain:]((uint64_t)v73, (void *)objc_msgSend(v77, "domain"));
        objc_exception_throw(v73);
      }
      v54 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unable to create token NSXPCConnection.  NSXPCStoreServerEndpointFactory %p -newEndpoint returned nil");
      _NSCoreDataLog(17, v54, v55, v56, v57, v58, v59, v60, (uint64_t)v36);
      v16 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        goto LABEL_31;
      LODWORD(valueCallBacks.version) = 134217984;
      *(CFIndex *)((char *)&valueCallBacks.version + 4) = (CFIndex)v36;
      v23 = "CoreData: Unable to create token NSXPCConnection.  NSXPCStoreServerEndpointFactory %p -newEndpoint returned nil";
      goto LABEL_14;
    }
    v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v37);
    if (!v53)
    {
      v61 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unable to create token NSXPCConnection -initWithListenerEndpoint:%p returned nil");
      _NSCoreDataLog(17, v61, v62, v63, v64, v65, v66, v67, (uint64_t)v52);
      v68 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        LODWORD(valueCallBacks.version) = 134217984;
        *(CFIndex *)((char *)&valueCallBacks.version + 4) = (CFIndex)v52;
        _os_log_fault_impl(&dword_18A253000, v68, OS_LOG_TYPE_FAULT, "CoreData: Unable to create token NSXPCConnection -initWithListenerEndpoint:%p returned nil", (uint8_t *)&valueCallBacks, 0xCu);
      }

      goto LABEL_31;
    }
    v8 = (void *)v53;

  }
  objc_msgSend(v8, "setInterruptionHandler:", &__block_literal_global_1);
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __52__NSXPCStoreConnection_createConnectionWithOptions___block_invoke_2;
  v76[3] = &unk_1E1EDD520;
  v76[4] = a1;
  objc_msgSend(v8, "setInvalidationHandler:", v76);
  v24 = (const void *)objc_msgSend(*(id *)(a1 + 8), "_persistentStoreCoordinator");
  memset(&valueCallBacks, 0, 24);
  *(_OWORD *)&valueCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E0C9B3A0] + 24);
  v25 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], &valueCallBacks);
  CFDictionarySetValue(v25, CFSTR("PSCKey"), v24);
  objc_msgSend(*(id *)(a1 + 16), "setUserInfo:", v25);
  CFRelease(v25);
  objc_msgSend(v8, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF665A8));
  objc_msgSend(v8, "resume");
  return v8;
}

void __52__NSXPCStoreConnection_createConnectionWithOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault") >= 1)
    _NSCoreDataLog(8, (uint64_t)CFSTR("Connection interrupted."), v9, v10, v11, v12, v13, v14, a9);
}

void __52__NSXPCStoreConnection_createConnectionWithOptions___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t vars0;

  +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)CFSTR("XPC connection was invalidated"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a4, a5, a6, a7, a8, vars0);
  if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault") >= 1)
    _NSCoreDataLog(8, (uint64_t)CFSTR("Connection invalidated."), v9, v10, v11, v12, v13, v14, a9);
}

- (id)disconnect
{
  id *v1;
  id v2;

  if (result)
  {
    v1 = result;
    objc_sync_enter(result);
    v2 = v1[2];
    if (v2)
    {
      objc_msgSend(v2, "setInvalidationHandler:", 0);
      objc_msgSend(v1[2], "setInterruptionHandler:", 0);
      objc_msgSend(v1[2], "setUserInfo:", 0);
      objc_msgSend(v1[2], "invalidate");

      v1[2] = 0;
    }
    return (id *)objc_sync_exit(v1);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_store = 0;
  -[NSXPCStoreConnection disconnect]((id *)&self->super.isa);
  v3.receiver = self;
  v3.super_class = (Class)NSXPCStoreConnection;
  -[NSXPCStoreConnection dealloc](&v3, sel_dealloc);
}

void __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = 0;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = a2;
  _NSCoreDataLog(1, (uint64_t)CFSTR("XPC: synchronousRemoteObjectProxyWithErrorHandler: store '%@' encountered error: %@"), v3, v4, v5, v6, v7, v8, a1[4]);
}

@end
