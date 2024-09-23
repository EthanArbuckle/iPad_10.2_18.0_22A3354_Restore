@implementation _ANEClient

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (id)connectionForLoadingModel:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  id *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *, void *, _BYTE *);
  void *v41;
  id v42;
  _ANEClient *v43;
  uint64_t *v44;
  uint64_t v45;
  id *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (self->_isRootDaemon)
  {
    v45 = 0;
    v46 = (id *)&v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__2;
    v49 = __Block_byref_object_dispose__2;
    v50 = 0;
    objc_msgSend(v7, "getUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_lock);
    -[_ANEClient connectionsUsedForLoadingModels](self, "connectionsUsedForLoadingModels");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = MEMORY[0x1E0C809B0];
    v39 = 3221225472;
    v40 = __48___ANEClient_connectionForLoadingModel_options___block_invoke;
    v41 = &unk_1E9516510;
    v11 = v9;
    v43 = self;
    v44 = &v45;
    v42 = v11;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &v38);

    if (!v46[5])
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", kANEFModelTypeKey[0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", kANEFModelPreCompiledValue[0]);

      if (v13)
        -[_ANEClient fastConnWithoutLock](self, "fastConnWithoutLock");
      else
        -[_ANEClient conn](self, "conn");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v46 + 5, v16);

      v17 = v46;
      v18 = v46[5];
      if (v18)
      {
        v19 = v18;
        v20 = v17[5];
        v17[5] = v19;
      }
      else
      {
        -[_ANEClient conn](self, "conn");
        v21 = objc_claimAutoreleasedReturnValue();
        v20 = v46[5];
        v46[5] = (id)v21;
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v46[5], v38, v39, v40, v41);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ANEClient connections](self, "connections");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 == 0;

      if (v25)
      {
        v26 = v46[5];
        -[_ANEClient connections](self, "connections");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v22);

      }
      -[_ANEClient connectionsUsedForLoadingModels](self, "connectionsUsedForLoadingModels");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", v22);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ANEClient connectionsUsedForLoadingModels](self, "connectionsUsedForLoadingModels");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v22);

      }
      objc_msgSend(v29, "addObject:", v11);

    }
    os_unfair_lock_unlock(&self->_lock);
    v31 = v46[5];
    -[_ANEClient conn](self, "conn");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v31) = v31 == v32;

    v33 = (id)gLogger_1;
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);
    if ((_DWORD)v31)
    {
      if (v34)
      {
        NSStringFromSelector(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v52 = v36;
        v53 = 2112;
        v54 = v11;
        _os_log_impl(&dword_1D3352000, v33, OS_LOG_TYPE_INFO, "%@: Using default connection for loading modelUUID=%@", buf, 0x16u);

      }
    }
    else if (v34)
    {
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v52 = v35;
      v53 = 2112;
      v54 = v11;
      _os_log_impl(&dword_1D3352000, v33, OS_LOG_TYPE_INFO, "%@: Using fast connection for loading modelUUID=%@", buf, 0x16u);

    }
    v15 = v46[5];

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    v14 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
      -[_ANEClient connectionForLoadingModel:options:].cold.1(v14, a2);
    -[_ANEClient conn](self, "conn");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (NSMutableDictionary)connectionsUsedForLoadingModels
{
  return self->_connectionsUsedForLoadingModels;
}

- (_ANEDaemonConnection)conn
{
  return self->_conn;
}

- (BOOL)doLoadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  int v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  _ANEClient *v32;
  uint64_t *v33;
  uint64_t *v34;
  SEL v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;

  v7 = *(_QWORD *)&a5;
  v11 = a3;
  v12 = a4;
  if (!v11)
  {
    v15 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient doLoadModel:options:qos:error:].cold.1(v15, a2);
LABEL_6:
    LOBYTE(a6) = 0;
    goto LABEL_19;
  }
  -[_ANEClient virtualClient](self, "virtualClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_ANEClient virtualClient](self, "virtualClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a6) = objc_msgSend(v14, "loadModel:options:qos:error:", v11, v12, v7, a6);

    goto LABEL_19;
  }
  v16 = +[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine");
  v17 = (void *)gLogger_1;
  if (v16)
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient doLoadModel:options:qos:error:].cold.2(v17, a2);
      if (!a6)
        goto LABEL_19;
    }
    else if (!a6)
    {
      goto LABEL_19;
    }
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors hostTooOld:](_ANEErrors, "hostTooOld:", v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
    -[_ANEClient doLoadModel:options:qos:error:].cold.3();
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2;
  v41 = __Block_byref_object_dispose__2;
  v42 = 0;
  objc_msgSend(v11, "string_id");
  kdebug_trace();
  v19 = +[_ANEQoSMapper queueIndexForQoS:](_ANEQoSMapper, "queueIndexForQoS:", v7);
  -[_ANEClient priorityQ](self, "priorityQ");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
  v21 = objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __44___ANEClient_doLoadModel_options_qos_error___block_invoke;
  v29 = &unk_1E95166A0;
  v30 = v12;
  v22 = v11;
  v31 = v22;
  v32 = self;
  v36 = v7;
  v33 = &v37;
  v34 = &v43;
  v35 = a2;
  dispatch_sync(v21, &v26);

  objc_msgSend(v22, "string_id", v26, v27, v28, v29);
  objc_msgSend(v22, "programHandle");
  kdebug_trace();
  v23 = *((unsigned __int8 *)v44 + 24);
  if (a6 && !*((_BYTE *)v44 + 24))
  {
    v24 = (void *)v38[5];
    if (v24)
    {
      *a6 = objc_retainAutorelease(v24);
      v23 = *((unsigned __int8 *)v44 + 24);
    }
    else
    {
      v23 = 0;
    }
  }
  LOBYTE(a6) = v23 != 0;

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
LABEL_19:

  return (char)a6;
}

- (_ANEVirtualClient)virtualClient
{
  return self->_virtualClient;
}

- (NSArray)priorityQ
{
  return self->_priorityQ;
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_6);
  return (id)sharedConnection_client;
}

- (BOOL)doEvaluateDirectWithModel:(id)a3 options:(id)a4 request:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  id v38;
  NSObject *v39;
  dispatch_time_t v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  SEL aSelector;
  const char *aSelectora;
  char *aSelectorb;
  id v51;
  void *v52;
  void *v53;
  unint64_t v54;
  id v55;
  unsigned int v56;

  v8 = *(_QWORD *)&a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (!v13)
  {
    v19 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:].cold.1(v19);
    goto LABEL_6;
  }
  -[_ANEClient virtualClient](self, "virtualClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_ANEClient virtualClient](self, "virtualClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = objc_msgSend(v17, "evaluateWithModel:options:request:qos:error:", v13, v14, v15, v8, a7);

    goto LABEL_7;
  }
  if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    v21 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient doEnqueueSetsWithModel:outputSet:options:qos:error:].cold.1(v21);
      if (!a7)
        goto LABEL_6;
    }
    else if (!a7)
    {
LABEL_6:
      LOBYTE(v18) = 0;
      goto LABEL_7;
    }
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors hostTooOld:](_ANEErrors, "hostTooOld:", v22);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v54 = +[_ANEQoSMapper queueIndexForQoS:](_ANEQoSMapper, "queueIndexForQoS:", v8);
  v23 = v13;
  v24 = v15;
  if (kdebug_is_enabled())
  {
    objc_msgSend(v24, "inputArray");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v23;
    aSelector = (SEL)objc_msgSend(v52, "count");
    v45 = v24;
    if (aSelector)
    {
      objc_msgSend(v52, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v25, "ioSurface"));

      if (aSelector != (SEL)1)
      {
        objc_msgSend(v52, "objectAtIndexedSubscript:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v26, "ioSurface"));

        if ((unint64_t)aSelector >= 3)
        {
          objc_msgSend(v52, "objectAtIndexedSubscript:", 2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v27, "ioSurface"));

          if (aSelector != (SEL)3)
          {
            objc_msgSend(v52, "objectAtIndexedSubscript:", 3);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v35, "ioSurface"));

          }
        }
      }
    }
    v23 = v46;
    objc_msgSend(v46, "string_id");
    kdebug_trace();

    v24 = v45;
  }
  aSelectora = a2;

  v28 = v23;
  v29 = v24;
  if (kdebug_is_enabled())
  {
    objc_msgSend(v29, "outputArray");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");
    v51 = v29;
    v53 = v28;
    v47 = v30;
    if (v31)
    {
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v32, "ioSurface"));

      if (v31 != 1)
      {
        objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v33, "ioSurface"));

        if (v31 >= 3)
        {
          objc_msgSend(v30, "objectAtIndexedSubscript:", 2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v34, "ioSurface"));

          if (v31 != 3)
          {
            objc_msgSend(v30, "objectAtIndexedSubscript:", 3);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v36, "ioSurface"));

          }
        }
      }
    }
    v28 = v53;
    objc_msgSend(v53, "string_id");
    kdebug_trace();

    v29 = v51;
  }

  v37 = v54;
  objc_msgSend((id)gSema, "objectAtIndexedSubscript:", v54);
  v38 = v29;
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v39, v40))
  {
    if (a7)
    {
      NSStringFromSelector(aSelectora);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v54;
      +[_ANEErrors timeoutErrorForMethod:](_ANEErrors, "timeoutErrorForMethod:", v41);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[_ANEClient reportEvaluateFailure:failureReason:qIdx:](self, "reportEvaluateFailure:failureReason:qIdx:", v28, 15, v37);
    v42 = v28;
    if (kdebug_is_enabled())
    {
      objc_msgSend(v42, "string_id");
      kdebug_trace();
    }

    LOBYTE(v18) = 0;
  }
  else
  {
    objc_msgSend(v28, "program");
    v56 = 0;
    v55 = 0;
    aSelectorb = (char *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(aSelectorb, "processRequest:model:qos:qIndex:modelStringID:options:returnValue:error:", v38, v28, v8, v54, objc_msgSend(v28, "string_id"), v14, &v56, &v55);
    v43 = v55;
    dispatch_semaphore_signal(v39);
    if (a7 && !v18 && v43)
    {
      *a7 = objc_retainAutorelease(v43);
      -[_ANEClient reportEvaluateFailure:failureReason:qIdx:](self, "reportEvaluateFailure:failureReason:qIdx:", v28, v56, v54);
    }
    v44 = v28;
    if (kdebug_is_enabled())
    {
      objc_msgSend(v44, "string_id");
      kdebug_trace();
    }

  }
LABEL_7:

  return v18;
}

- (id)fastConnWithoutLock
{
  _ANEDaemonConnection *fastConn;
  _ANEDaemonConnection *v5;
  _ANEDaemonConnection *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[5];

  fastConn = self->_fastConn;
  if (!fastConn)
  {
    if (-[_ANEClient allowRestrictedAccess](self, "allowRestrictedAccess"))
      +[_ANEDaemonConnection daemonConnectionRestricted](_ANEDaemonConnection, "daemonConnectionRestricted");
    else
      +[_ANEDaemonConnection daemonConnection](_ANEDaemonConnection, "daemonConnection");
    v5 = (_ANEDaemonConnection *)objc_claimAutoreleasedReturnValue();
    v6 = self->_fastConn;
    self->_fastConn = v5;

    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __33___ANEClient_fastConnWithoutLock__block_invoke;
    v12[3] = &__block_descriptor_40_e5_v8__0l;
    v12[4] = a2;
    -[_ANEDaemonConnection daemonConnection](self->_fastConn, "daemonConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInterruptionHandler:", v12);

    -[_ANEDaemonConnection daemonConnection](self->_fastConn, "daemonConnection", v7, 3221225472, __33___ANEClient_fastConnWithoutLock__block_invoke_10, &__block_descriptor_40_e5_v8__0l, a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInvalidationHandler:", &v11);

    fastConn = self->_fastConn;
  }
  return fastConn;
}

- (_ANEClient)initWithRestrictedAccessAllowed:(BOOL)a3
{
  _ANEClient *v5;
  _ANEClient *v6;
  uint64_t v7;
  _ANEVirtualClient *virtualClient;
  void *v9;
  uint64_t v10;
  _ANEDaemonConnection *conn;
  uint64_t v12;
  NSArray *priorityQ;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *connectionsUsedForLoadingModels;
  uint64_t v19;
  NSMutableDictionary *connections;
  uint64_t v22;
  _QWORD v23[5];
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_ANEClient;
  v5 = -[_ANEClient init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_allowRestrictedAccess = a3;
    +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
    v7 = objc_claimAutoreleasedReturnValue();
    virtualClient = v6->_virtualClient;
    v6->_virtualClient = (_ANEVirtualClient *)v7;

    if (!v6->_virtualClient)
    {
      v9 = (void *)gLogger_1;
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
        -[_ANEClient initWithRestrictedAccessAllowed:].cold.1(v9);
    }
    if (a3)
      +[_ANEDaemonConnection daemonConnectionRestricted](_ANEDaemonConnection, "daemonConnectionRestricted");
    else
      +[_ANEDaemonConnection daemonConnection](_ANEDaemonConnection, "daemonConnection");
    v10 = objc_claimAutoreleasedReturnValue();
    conn = v6->_conn;
    v6->_conn = (_ANEDaemonConnection *)v10;

    v6->_isRootDaemon = 1;
    +[_ANEQoSMapper dispatchQueueArrayByMappingPrioritiesWithTag:](_ANEQoSMapper, "dispatchQueueArrayByMappingPrioritiesWithTag:", CFSTR("com.apple.anef"));
    v12 = objc_claimAutoreleasedReturnValue();
    priorityQ = v6->_priorityQ;
    v6->_priorityQ = (NSArray *)v12;

    v14 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke;
    v23[3] = &__block_descriptor_40_e5_v8__0l;
    v23[4] = a2;
    -[_ANEDaemonConnection daemonConnection](v6->_conn, "daemonConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setInterruptionHandler:", v23);

    -[_ANEDaemonConnection daemonConnection](v6->_conn, "daemonConnection", v14, 3221225472, __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_6, &__block_descriptor_40_e5_v8__0l, a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInvalidationHandler:", &v22);

    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    connectionsUsedForLoadingModels = v6->_connectionsUsedForLoadingModels;
    v6->_connectionsUsedForLoadingModels = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    connections = v6->_connections;
    v6->_connections = (NSMutableDictionary *)v19;

  }
  return v6;
}

- (BOOL)allowRestrictedAccess
{
  return self->_allowRestrictedAccess;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  dispatch_semaphore_t v7;
  dispatch_semaphore_t v8;
  dispatch_semaphore_t v9;
  dispatch_semaphore_t v10;
  dispatch_semaphore_t v11;
  dispatch_semaphore_t v12;
  dispatch_semaphore_t v13;
  uint64_t v14;
  void *v15;

  +[_ANELog framework](_ANELog, "framework");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)gLogger_1;
  gLogger_1 = v2;

  v4 = (void *)MEMORY[0x1D824DB90]();
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v6 = dispatch_semaphore_create(2);
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v6, 0);

  v7 = dispatch_semaphore_create(2);
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v7, 1);

  v8 = dispatch_semaphore_create(2);
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v8, 2);

  v9 = dispatch_semaphore_create(2);
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v9, 3);

  v10 = dispatch_semaphore_create(2);
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v10, 4);

  v11 = dispatch_semaphore_create(2);
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v11, 5);

  v12 = dispatch_semaphore_create(2);
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v12, 6);

  v13 = dispatch_semaphore_create(2);
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v13, 7);

  v14 = objc_msgSend(v5, "copy");
  v15 = (void *)gSema;
  gSema = v14;

  objc_autoreleasePoolPop(v4);
}

+ (id)sharedPrivateConnection
{
  if (sharedPrivateConnection_onceToken != -1)
    dispatch_once(&sharedPrivateConnection_onceToken, &__block_literal_global_22);
  return (id)sharedPrivateConnection_client;
}

+ (_ANEClient)new
{
  return 0;
}

- (_ANEClient)init
{

  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[_ANEClient conn](self, "conn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "daemonConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[_ANEClient fastConn](self, "fastConn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemonConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  v7.receiver = self;
  v7.super_class = (Class)_ANEClient;
  -[_ANEClient dealloc](&v7, sel_dealloc);
}

- (_ANEDaemonConnection)fastConn
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_ANEClient fastConnWithoutLock](self, "fastConnWithoutLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v6 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1D3352000, v7, OS_LOG_TYPE_INFO, "%@: Using fast connection", (uint8_t *)&v10, 0xCu);

  }
  return (_ANEDaemonConnection *)v5;
}

- (id)connectionUsedForLoadingModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _ANEClient *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  objc_msgSend(v4, "getUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[_ANEClient connectionsUsedForLoadingModels](self, "connectionsUsedForLoadingModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44___ANEClient_connectionUsedForLoadingModel___block_invoke;
  v10[3] = &unk_1E9516510;
  v7 = v5;
  v12 = self;
  v13 = &v14;
  v11 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  os_unfair_lock_unlock(&self->_lock);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (BOOL)compileModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  int v23;
  int v24;
  void *v25;
  _QWORD block[4];
  id v28;
  _ANEClient *v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  SEL v33;
  int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v7 = *(_QWORD *)&a5;
  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (!v11)
  {
    v15 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient compileModel:options:qos:error:].cold.1(v15, a2);
    goto LABEL_11;
  }
  -[_ANEClient virtualClient](self, "virtualClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_ANEClient virtualClient](self, "virtualClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a6) = objc_msgSend(v14, "compileModel:options:qos:error:", v11, v12, v7, a6);

    goto LABEL_20;
  }
  if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    v16 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient compileModel:options:qos:error:].cold.2(v16, a2);
    if (a6)
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ANEErrors hostTooOld:](_ANEErrors, "hostTooOld:", v17);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
      LOBYTE(a6) = 0;
    }
  }
  else
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__2;
    v39 = __Block_byref_object_dispose__2;
    v40 = 0;
    objc_msgSend(v11, "string_id");
    kdebug_trace();
    -[_ANEClient priorityQ](self, "priorityQ");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", +[_ANEQoSMapper queueIndexForQoS:](_ANEQoSMapper, "queueIndexForQoS:", v7));
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45___ANEClient_compileModel_options_qos_error___block_invoke;
    block[3] = &unk_1E9516560;
    v20 = v11;
    v31 = &v35;
    v28 = v20;
    v29 = self;
    v34 = v7;
    v30 = v12;
    v32 = &v41;
    v33 = a2;
    dispatch_sync(v19, block);

    v21 = (id)gLogger_1;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v20, "perfStatsMask");
      *(_DWORD *)buf = 138412546;
      v46 = v22;
      v47 = 1024;
      v48 = v23;
      _os_log_impl(&dword_1D3352000, v21, OS_LOG_TYPE_INFO, "%@: Model stats mask: %d", buf, 0x12u);

    }
    objc_msgSend(v20, "string_id");
    objc_msgSend(v20, "perfStatsMask");
    kdebug_trace();
    v24 = *((unsigned __int8 *)v42 + 24);
    if (a6 && !*((_BYTE *)v42 + 24))
    {
      v25 = (void *)v36[5];
      if (v25)
      {
        *a6 = objc_retainAutorelease(v25);
        v24 = *((unsigned __int8 *)v42 + 24);
      }
      else
      {
        v24 = 0;
      }
    }
    LOBYTE(a6) = v24 != 0;

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);
  }
LABEL_20:

  return (char)a6;
}

- (BOOL)doUnloadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  int v27;
  void *v28;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  SEL v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _BYTE v48[32];
  uint64_t v49;

  v7 = *(_QWORD *)&a5;
  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (!v11)
  {
    v15 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient doUnloadModel:options:qos:error:].cold.1(v15, a2);
    goto LABEL_11;
  }
  -[_ANEClient virtualClient](self, "virtualClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_ANEClient virtualClient](self, "virtualClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a6) = objc_msgSend(v14, "unloadModel:options:qos:error:", v11, v12, v7, a6);

    goto LABEL_24;
  }
  v16 = +[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine");
  v17 = (void *)gLogger_1;
  if (v16)
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient doUnloadModel:options:qos:error:].cold.2(v17, a2);
    if (a6)
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ANEErrors hostTooOld:](_ANEErrors, "hostTooOld:", v18);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
      LOBYTE(a6) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
      -[_ANEClient doUnloadModel:options:qos:error:].cold.4();
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__2;
    v42 = __Block_byref_object_dispose__2;
    v43 = 0;
    objc_msgSend(v11, "string_id");
    kdebug_trace();
    -[_ANEClient connectionUsedForLoadingModel:](self, "connectionUsedForLoadingModel:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v20 = (id)gLogger_1;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ANEClient doUnloadModel:options:qos:error:].cold.3(v21, (uint64_t)v11, (uint64_t)v48);
      }

      -[_ANEClient conn](self, "conn");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = +[_ANEQoSMapper queueIndexForQoS:](_ANEQoSMapper, "queueIndexForQoS:", v7);
    -[_ANEClient priorityQ](self, "priorityQ");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", v22);
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46___ANEClient_doUnloadModel_options_qos_error___block_invoke;
    block[3] = &unk_1E95165B0;
    v25 = v19;
    v31 = v25;
    v26 = v11;
    v32 = v26;
    v37 = v7;
    v33 = v12;
    v34 = &v44;
    v35 = &v38;
    v36 = a2;
    dispatch_sync(v24, block);

    objc_msgSend(v26, "resetOnUnload");
    objc_msgSend(v26, "string_id");
    kdebug_trace();
    v27 = *((unsigned __int8 *)v45 + 24);
    if (a6 && !*((_BYTE *)v45 + 24))
    {
      v28 = (void *)v39[5];
      if (v28)
      {
        *a6 = objc_retainAutorelease(v28);
        v27 = *((unsigned __int8 *)v45 + 24);
      }
      else
      {
        v27 = 0;
      }
    }
    LOBYTE(a6) = v27 != 0;

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v44, 8);
  }
LABEL_24:

  return (char)a6;
}

- (BOOL)compiledModelExistsFor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, int, void *, void *);
  void *v21;
  id v22;
  uint64_t *v23;
  _QWORD *v24;
  SEL v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v5 = a3;
  -[_ANEClient virtualClient](self, "virtualClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_ANEClient virtualClient](self, "virtualClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "compiledModelExistsFor:", v5);

  }
  else if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    v9 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient compiledModelExistsFor:].cold.1(v9, a2);
    v8 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1D824DB90]();
    v11 = (void *)gLogger_1;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
        -[_ANEClient compiledModelExistsFor:].cold.3();
      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      v31 = 0;
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x3032000000;
      v26[3] = __Block_byref_object_copy__2;
      v26[4] = __Block_byref_object_dispose__2;
      v27 = 0;
      objc_msgSend(v5, "string_id");
      kdebug_trace();
      -[_ANEClient fastConn](self, "fastConn");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        -[_ANEClient conn](self, "conn");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;

      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __37___ANEClient_compiledModelExistsFor___block_invoke;
      v21 = &unk_1E95165D8;
      v25 = a2;
      v16 = v5;
      v22 = v16;
      v23 = &v28;
      v24 = v26;
      objc_msgSend(v15, "compiledModelExistsFor:withReply:", v16, &v18);
      objc_msgSend(v16, "string_id", v18, v19, v20, v21);
      kdebug_trace();
      v8 = *((_BYTE *)v29 + 24) != 0;

      _Block_object_dispose(v26, 8);
      _Block_object_dispose(&v28, 8);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
        -[_ANEClient compiledModelExistsFor:].cold.2(v11, a2);
      v8 = 0;
    }
    objc_autoreleasePoolPop(v10);
  }

  return v8;
}

- (void)purgeCompiledModel:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, int, void *);
  void *v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  SEL v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[3];
  char v23;

  v5 = a3;
  -[_ANEClient virtualClient](self, "virtualClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_ANEClient virtualClient](self, "virtualClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "purgeCompiledModel:", v5);

  }
  else if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    v8 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient purgeCompiledModel:].cold.1(v8, a2);
  }
  else
  {
    v9 = (void *)gLogger_1;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
        -[_ANEClient purgeCompiledModel:].cold.3();
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x2020000000;
      v23 = 0;
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x3032000000;
      v20[3] = __Block_byref_object_copy__2;
      v20[4] = __Block_byref_object_dispose__2;
      v21 = 0;
      objc_msgSend(v5, "string_id");
      kdebug_trace();
      -[_ANEClient conn](self, "conn");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __33___ANEClient_purgeCompiledModel___block_invoke;
      v15 = &unk_1E9516600;
      v17 = v22;
      v18 = v20;
      v19 = a2;
      v11 = v5;
      v16 = v11;
      objc_msgSend(v10, "purgeCompiledModel:withReply:", v11, &v12);

      objc_msgSend(v11, "string_id", v12, v13, v14, v15);
      kdebug_trace();

      _Block_object_dispose(v20, 8);
      _Block_object_dispose(v22, 8);
    }
    else if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient purgeCompiledModel:].cold.2(v9, a2);
    }
  }

}

- (BOOL)compiledModelExistsMatchingHash:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[7];
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v5 = a3;
  -[_ANEClient virtualClient](self, "virtualClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_ANEClient virtualClient](self, "virtualClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "compiledModelExistsMatchingHash:", v5);

    goto LABEL_16;
  }
  if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    v9 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient compiledModelExistsMatchingHash:].cold.1(v9, a2);
LABEL_13:
    v8 = 0;
    goto LABEL_16;
  }
  v10 = (void *)gLogger_1;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient compiledModelExistsMatchingHash:].cold.2(v10, a2);
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
    -[_ANEClient compiledModelExistsMatchingHash:].cold.3();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__2;
  v17[4] = __Block_byref_object_dispose__2;
  v18 = 0;
  kdebug_trace();
  -[_ANEClient fastConn](self, "fastConn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[_ANEClient conn](self, "conn");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46___ANEClient_compiledModelExistsMatchingHash___block_invoke;
  v16[3] = &unk_1E9516628;
  v16[4] = &v19;
  v16[5] = v17;
  v16[6] = a2;
  objc_msgSend(v14, "compiledModelExistsMatchingHash:withReply:", v5, v16);
  kdebug_trace();
  v8 = *((_BYTE *)v20 + 24) != 0;

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);
LABEL_16:

  return v8;
}

- (void)purgeCompiledModelMatchingHash:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[7];
  _QWORD v12[5];
  id v13;
  _QWORD v14[3];
  char v15;

  v5 = a3;
  -[_ANEClient virtualClient](self, "virtualClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_ANEClient virtualClient](self, "virtualClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "purgeCompiledModelMatchingHash:", v5);

  }
  else if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    v8 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient purgeCompiledModelMatchingHash:].cold.1(v8, a2);
  }
  else
  {
    v9 = (void *)gLogger_1;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
        -[_ANEClient purgeCompiledModelMatchingHash:].cold.3();
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x2020000000;
      v15 = 0;
      v12[0] = 0;
      v12[1] = v12;
      v12[2] = 0x3032000000;
      v12[3] = __Block_byref_object_copy__2;
      v12[4] = __Block_byref_object_dispose__2;
      v13 = 0;
      kdebug_trace();
      -[_ANEClient conn](self, "conn");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __45___ANEClient_purgeCompiledModelMatchingHash___block_invoke;
      v11[3] = &unk_1E9516628;
      v11[4] = v14;
      v11[5] = v12;
      v11[6] = a2;
      objc_msgSend(v10, "purgeCompiledModelMatchingHash:withReply:", v5, v11);

      kdebug_trace();
      _Block_object_dispose(v12, 8);

      _Block_object_dispose(v14, 8);
    }
    else if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient purgeCompiledModelMatchingHash:].cold.2(v9, a2);
    }
  }

}

- (BOOL)mapIOSurfacesWithModel:(id)a3 request:(id)a4 cacheInference:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  -[_ANEClient virtualClient](self, "virtualClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 || +[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    v13 = 1;
    goto LABEL_4;
  }
  if (!v10)
  {
    v18 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:].cold.1(v18);
    goto LABEL_17;
  }
  if (!v11)
  {
    v19 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:].cold.2(v19);
LABEL_17:
    v13 = 0;
    goto LABEL_4;
  }
  objc_msgSend(v10, "mapper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)gLogger_1;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
      -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:].cold.5();
    objc_msgSend(v10, "string_id");
    kdebug_trace();
    v13 = objc_msgSend(v15, "mapIOSurfacesWithModel:request:cacheInference:error:", v10, v11, v7, a6);
    v17 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
      -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:].cold.4(v17);
    objc_msgSend(v10, "string_id");
    kdebug_trace();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:].cold.3(v16);
    v13 = 0;
  }

LABEL_4:
  return v13;
}

- (void)unmapIOSurfacesWithModel:(id)a3 request:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[_ANEClient virtualClient](self, "virtualClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
LABEL_3:
      -[_ANEClient unmapIOSurfacesWithModel:request:].cold.1(v10);
  }
  else
  {
    if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
    {
      v10 = (void *)gLogger_1;
      if (!os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      goto LABEL_3;
    }
    if (v7)
    {
      if (v8)
      {
        objc_msgSend(v7, "mapper");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)gLogger_1;
        if (v11)
        {
          if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
            -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:].cold.5();
          objc_msgSend(v7, "string_id");
          kdebug_trace();
          v20 = 0;
          v13 = objc_msgSend(v11, "unmapIOSurfacesWithModel:request:error:", v7, v8, &v20);
          v14 = v20;
          v15 = (void *)gLogger_1;
          if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
          {
            v18 = v15;
            NSStringFromSelector(a2);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v22 = v19;
            v23 = 1024;
            v24 = v13;
            v25 = 2112;
            v26 = v14;
            _os_log_debug_impl(&dword_1D3352000, v18, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", buf, 0x1Cu);

          }
          objc_msgSend(v7, "string_id");
          kdebug_trace();

        }
        else if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
        {
          -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:].cold.3(v12);
        }

      }
      else
      {
        v17 = (void *)gLogger_1;
        if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
          -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:].cold.2(v17);
      }
    }
    else
    {
      v16 = (void *)gLogger_1;
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
        -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:].cold.1(v16);
    }
  }
LABEL_22:

}

- (BOOL)beginRealTimeTask
{
  void *v4;
  void *v5;
  char v6;
  void *v8;
  BOOL v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  -[_ANEClient virtualClient](self, "virtualClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_ANEClient virtualClient](self, "virtualClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "beginRealTimeTask");

    return v6;
  }
  else
  {
    if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
    {
      v8 = (void *)gLogger_1;
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
        -[_ANEClient beginRealTimeTask].cold.1(v8, a2);
      return 0;
    }
    else
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      -[_ANEClient conn](self, "conn");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __31___ANEClient_beginRealTimeTask__block_invoke;
      v11[3] = &unk_1E9516650;
      v11[4] = &v12;
      v11[5] = a2;
      objc_msgSend(v10, "beginRealTimeTaskWithReply:", v11);

      v9 = *((_BYTE *)v13 + 24) != 0;
      _Block_object_dispose(&v12, 8);
    }
    return v9;
  }
}

- (BOOL)endRealTimeTask
{
  void *v4;
  void *v5;
  char v6;
  void *v8;
  BOOL v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  -[_ANEClient virtualClient](self, "virtualClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_ANEClient virtualClient](self, "virtualClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "endRealTimeTask");

    return v6;
  }
  else
  {
    if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
    {
      v8 = (void *)gLogger_1;
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
        -[_ANEClient endRealTimeTask].cold.1(v8, a2);
      return 0;
    }
    else
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      -[_ANEClient conn](self, "conn");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __29___ANEClient_endRealTimeTask__block_invoke;
      v11[3] = &unk_1E9516650;
      v11[4] = &v12;
      v11[5] = a2;
      objc_msgSend(v10, "endRealTimeTaskWithReply:", v11);

      v9 = *((_BYTE *)v13 + 24) != 0;
      _Block_object_dispose(&v12, 8);
    }
    return v9;
  }
}

- (BOOL)doLoadModelNewInstance:(id)a3 options:(id)a4 modelInstParams:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  unint64_t v23;
  void *v24;
  NSObject *v25;
  int v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  _ANEClient *v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  SEL v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;

  v8 = *(_QWORD *)&a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (!v13)
  {
    v18 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient doLoadModelNewInstance:options:modelInstParams:qos:error:].cold.1(v18, a2);
      if (!a7)
        goto LABEL_22;
    }
    else if (!a7)
    {
      goto LABEL_22;
    }
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors invalidModelInstanceErrorForMethod:](_ANEErrors, "invalidModelInstanceErrorForMethod:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    *a7 = v20;

    LOBYTE(a7) = 0;
    goto LABEL_22;
  }
  -[_ANEClient virtualClient](self, "virtualClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_ANEClient virtualClient](self, "virtualClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a7) = objc_msgSend(v17, "loadModelNewInstance:options:modelInstParams:qos:error:", v13, v14, v15, v8, a7);

    goto LABEL_22;
  }
  v21 = +[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine");
  v22 = (void *)gLogger_1;
  if (v21)
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient doLoadModelNewInstance:options:modelInstParams:qos:error:].cold.2(v22, a2);
      if (!a7)
        goto LABEL_22;
    }
    else if (!a7)
    {
      goto LABEL_22;
    }
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors hostTooOld:](_ANEErrors, "hostTooOld:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
    -[_ANEClient doLoadModelNewInstance:options:modelInstParams:qos:error:].cold.3();
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__2;
  v42 = __Block_byref_object_dispose__2;
  v43 = 0;
  v23 = +[_ANEQoSMapper queueIndexForQoS:](_ANEQoSMapper, "queueIndexForQoS:", v8);
  -[_ANEClient priorityQ](self, "priorityQ");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", v23);
  v25 = objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke;
  v29[3] = &unk_1E95166C8;
  v30 = v14;
  v34 = &v38;
  v36 = a2;
  v31 = v15;
  v32 = self;
  v37 = v8;
  v33 = v13;
  v35 = &v44;
  dispatch_sync(v25, v29);

  v26 = *((unsigned __int8 *)v45 + 24);
  if (a7 && !*((_BYTE *)v45 + 24))
  {
    v27 = (void *)v39[5];
    if (v27)
    {
      *a7 = objc_retainAutorelease(v27);
      v26 = *((unsigned __int8 *)v45 + 24);
    }
    else
    {
      v26 = 0;
    }
  }
  LOBYTE(a7) = v26 != 0;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
LABEL_22:

  return (char)a7;
}

- (BOOL)doPrepareChainingWithModel:(id)a3 options:(id)a4 chainingReq:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  NSObject *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  NSObject *v27;
  id v28;
  int v29;
  void *v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  SEL v38;
  int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  _BYTE v50[32];
  uint64_t v51;

  v8 = *(_QWORD *)&a6;
  v51 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (!v13)
  {
    v18 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient doPrepareChainingWithModel:options:chainingReq:qos:error:].cold.1(v18, a2);
    goto LABEL_12;
  }
  -[_ANEClient virtualClient](self, "virtualClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient doPrepareChainingWithModel:options:chainingReq:qos:error:].cold.4(v17, a2);
    goto LABEL_12;
  }
  if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    v19 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient doPrepareChainingWithModel:options:chainingReq:qos:error:].cold.2(v19, a2);
    if (a7)
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ANEErrors hostTooOld:](_ANEErrors, "hostTooOld:", v20);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
      LOBYTE(a7) = 0;
    }
  }
  else
  {
    objc_msgSend(v13, "string_id");
    kdebug_trace();
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    v49 = objc_msgSend(v15, "validate");
    if (*((_BYTE *)v47 + 24))
    {
      v40 = 0;
      v41 = &v40;
      v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__2;
      v44 = __Block_byref_object_dispose__2;
      v45 = 0;
      -[_ANEClient connectionUsedForLoadingModel:](self, "connectionUsedForLoadingModel:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v23 = (id)gLogger_1;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ANEClient doUnloadModel:options:qos:error:].cold.3(v24, (uint64_t)v13, (uint64_t)v50);
        }

        -[_ANEClient conn](self, "conn");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v25 = +[_ANEQoSMapper queueIndexForQoS:](_ANEQoSMapper, "queueIndexForQoS:", v8);
      -[_ANEClient priorityQ](self, "priorityQ");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", v25);
      v27 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71___ANEClient_doPrepareChainingWithModel_options_chainingReq_qos_error___block_invoke;
      block[3] = &unk_1E95166F0;
      v28 = v22;
      v32 = v28;
      v33 = v13;
      v34 = v14;
      v39 = v8;
      v35 = v15;
      v36 = &v46;
      v37 = &v40;
      v38 = a2;
      dispatch_sync(v27, block);

      kdebug_trace();
      v29 = *((unsigned __int8 *)v47 + 24);
      if (a7 && !*((_BYTE *)v47 + 24))
      {
        v30 = (void *)v41[5];
        if (v30)
        {
          *a7 = objc_retainAutorelease(v30);
          v29 = *((unsigned __int8 *)v47 + 24);
        }
        else
        {
          v29 = 0;
        }
      }
      LOBYTE(a7) = v29 != 0;

      _Block_object_dispose(&v40, 8);
    }
    else
    {
      LOBYTE(a7) = 0;
    }
    _Block_object_dispose(&v46, 8);
  }

  return (char)a7;
}

- (BOOL)doEnqueueSetsWithModel:(id)a3 outputSet:(id)a4 options:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  dispatch_time_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  v8 = *(_QWORD *)&a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  -[_ANEClient virtualClient](self, "virtualClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient doEnqueueSetsWithModel:outputSet:options:qos:error:].cold.3(v17);
    goto LABEL_4;
  }
  if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    v20 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient doEnqueueSetsWithModel:outputSet:options:qos:error:].cold.1(v20);
      if (!a7)
        goto LABEL_4;
    }
    else if (!a7)
    {
LABEL_4:
      LOBYTE(v18) = 0;
      goto LABEL_5;
    }
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors hostTooOld:](_ANEErrors, "hostTooOld:", v21);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }
  objc_msgSend(v13, "string_id");
  kdebug_trace();
  v22 = +[_ANEQoSMapper queueIndexForQoS:](_ANEQoSMapper, "queueIndexForQoS:", v8);
  objc_msgSend((id)gSema, "objectAtIndexedSubscript:", v22);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v23, v24))
  {
    if (a7)
    {
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ANEErrors timeoutErrorForMethod:](_ANEErrors, "timeoutErrorForMethod:", v25);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v13, "string_id");
    kdebug_trace();
    LOBYTE(v18) = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
      -[_ANEClient doEnqueueSetsWithModel:outputSet:options:qos:error:].cold.2();
    objc_msgSend(v13, "program");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v18 = objc_msgSend(v26, "processOutputSet:model:options:error:", v14, v13, v15, &v28);
    v27 = v28;
    dispatch_semaphore_signal(v23);
    kdebug_trace();
    if (a7 && !v18 && v27)
      *a7 = objc_retainAutorelease(v27);

  }
LABEL_5:

  return v18;
}

- (BOOL)doBuffersReadyWithModel:(id)a3 inputBuffers:(id)a4 options:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  dispatch_time_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  v8 = *(_QWORD *)&a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  -[_ANEClient virtualClient](self, "virtualClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient doEnqueueSetsWithModel:outputSet:options:qos:error:].cold.3(v17);
    goto LABEL_4;
  }
  if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    v20 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient doEnqueueSetsWithModel:outputSet:options:qos:error:].cold.1(v20);
      if (!a7)
        goto LABEL_4;
    }
    else if (!a7)
    {
LABEL_4:
      LOBYTE(v18) = 0;
      goto LABEL_5;
    }
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors hostTooOld:](_ANEErrors, "hostTooOld:", v21);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }
  objc_msgSend(v13, "string_id");
  kdebug_trace();
  v22 = +[_ANEQoSMapper queueIndexForQoS:](_ANEQoSMapper, "queueIndexForQoS:", v8);
  objc_msgSend((id)gSema, "objectAtIndexedSubscript:", v22);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v23, v24))
  {
    if (a7)
    {
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ANEErrors timeoutErrorForMethod:](_ANEErrors, "timeoutErrorForMethod:", v25);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v13, "string_id");
    kdebug_trace();
    LOBYTE(v18) = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
      -[_ANEClient doBuffersReadyWithModel:inputBuffers:options:qos:error:].cold.2();
    objc_msgSend(v13, "program");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v18 = objc_msgSend(v26, "processInputBuffers:model:options:error:", v14, v13, v15, &v28);
    v27 = v28;
    dispatch_semaphore_signal(v23);
    kdebug_trace();
    if (a7 && !v18 && v27)
      *a7 = objc_retainAutorelease(v27);

  }
LABEL_5:

  return v18;
}

- (BOOL)evaluateRealTimeWithModel:(id)a3 options:(id)a4 request:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  LOBYTE(a6) = -[_ANEClient doEvaluateDirectWithModel:options:request:qos:error:](self, "doEvaluateDirectWithModel:options:request:qos:error:", v12, v11, v10, +[_ANEQoSMapper aneRealTimeTaskQoS](_ANEQoSMapper, "aneRealTimeTaskQoS"), a6);

  return (char)a6;
}

- (void)reportEvaluateFailure:(id)a3 failureReason:(unsigned int)a4 qIdx:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v22;
  __CFString *v23;
  id v24;
  __CFString *v25;
  _QWORD v26[4];
  _QWORD v27[5];

  v6 = *(_QWORD *)&a4;
  v27[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[_ANEClient connectionUsedForLoadingModel:](self, "connectionUsedForLoadingModel:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "modelURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v8, "modelURL");
    else
      objc_msgSend(v8, "sourceURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = &stru_1E9516758;
    v12 = +[_ANEStrings trimmedModelPath:trimmedPath:](_ANEStrings, "trimmedModelPath:trimmedPath:", v11, &v25);
    v13 = v25;

    v27[0] = v13;
    v26[0] = CFSTR("modelURL");
    v26[1] = CFSTR("privacy_score");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v14;
    v26[2] = CFSTR("programHandle");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "programHandle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v15;
    v26[3] = CFSTR("failureReason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ANEClient priorityQ](self, "priorityQ");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", a5);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55___ANEClient_reportEvaluateFailure_failureReason_qIdx___block_invoke;
    block[3] = &unk_1E9516718;
    v22 = v9;
    v23 = CFSTR("modelInference");
    v24 = v17;
    v20 = v17;
    dispatch_sync(v19, block);

  }
  else if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
  {
    -[_ANEClient reportEvaluateFailure:failureReason:qIdx:].cold.1();
  }

}

- (BOOL)isVirtualClient
{
  void *v2;
  BOOL v3;

  -[_ANEClient virtualClient](self, "virtualClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)echo:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  -[_ANEClient virtualClient](self, "virtualClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_ANEClient virtualClient](self, "virtualClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "echo:", v5);

  }
  else if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    v9 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      -[_ANEClient echo:].cold.1(v9, a2);
    v8 = 0;
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    -[_ANEClient conn](self, "conn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __19___ANEClient_echo___block_invoke;
    v12[3] = &unk_1E9516650;
    v12[4] = &v13;
    v12[5] = a2;
    objc_msgSend(v10, "echo:withReply:", v5, v12);

    v8 = *((_BYTE *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }

  return v8;
}

- (BOOL)isRootDaemon
{
  return self->_isRootDaemon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionsUsedForLoadingModels, 0);
  objc_storeStrong((id *)&self->_virtualClient, 0);
  objc_storeStrong((id *)&self->_priorityQ, 0);
  objc_storeStrong((id *)&self->_conn, 0);
  objc_storeStrong((id *)&self->_fastConn, 0);
}

- (void)initWithRestrictedAccessAllowed:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (const char *)OUTLINED_FUNCTION_8_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5_0(&dword_1D3352000, v4, v5, "%@: ANEVirtualClient Not available.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_2();
}

- (void)connectionForLoadingModel:(void *)a1 options:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  _os_log_debug_impl(&dword_1D3352000, v3, OS_LOG_TYPE_DEBUG, "%@: Non root daemon, using default connection for loading model", v5, 0xCu);

  OUTLINED_FUNCTION_2_2();
}

- (void)compileModel:(void *)a1 options:(const char *)a2 qos:error:.cold.1(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)compileModel:(void *)a1 options:(const char *)a2 qos:error:.cold.2(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)doUnloadModel:(void *)a1 options:(const char *)a2 qos:error:.cold.1(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)doUnloadModel:(void *)a1 options:(const char *)a2 qos:error:.cold.2(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)doUnloadModel:(uint64_t)a3 options:qos:error:.cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_2_5((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_4(&dword_1D3352000, v6, v4, "%@: model=%@ was not loaded by the client.", v5);

}

- (void)doUnloadModel:options:qos:error:.cold.4()
{
  const char *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_21_0();
  v2 = OUTLINED_FUNCTION_17_0(v1);
  NSStringFromSelector(v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_11(&dword_1D3352000, v4, v5, "%@: model[%p]=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_3();
}

- (void)compiledModelExistsFor:(void *)a1 .cold.1(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)compiledModelExistsFor:(void *)a1 .cold.2(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)compiledModelExistsFor:.cold.3()
{
  const char *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_21_0();
  v2 = OUTLINED_FUNCTION_17_0(v1);
  NSStringFromSelector(v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_11(&dword_1D3352000, v4, v5, "%@: model[%p]=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_3();
}

- (void)purgeCompiledModel:(void *)a1 .cold.1(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)purgeCompiledModel:(void *)a1 .cold.2(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)purgeCompiledModel:.cold.3()
{
  const char *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_21_0();
  v2 = OUTLINED_FUNCTION_17_0(v1);
  NSStringFromSelector(v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_11(&dword_1D3352000, v4, v5, "%@: model[%p]=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_3();
}

- (void)compiledModelExistsMatchingHash:(void *)a1 .cold.1(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)compiledModelExistsMatchingHash:(void *)a1 .cold.2(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: nil modelHash", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)compiledModelExistsMatchingHash:.cold.3()
{
  const char *v0;
  id v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_21_0();
  v2 = OUTLINED_FUNCTION_4_1(v1);
  NSStringFromSelector(v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_4_2(&dword_1D3352000, v2, v4, "%@: modelHash=%@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)purgeCompiledModelMatchingHash:(void *)a1 .cold.1(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)purgeCompiledModelMatchingHash:(void *)a1 .cold.2(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: nil modelHash", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)purgeCompiledModelMatchingHash:.cold.3()
{
  const char *v0;
  id v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_21_0();
  v2 = OUTLINED_FUNCTION_4_1(v1);
  NSStringFromSelector(v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_4_2(&dword_1D3352000, v2, v4, "%@: modelHash=%@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)mapIOSurfacesWithModel:(void *)a1 request:cacheInference:error:.cold.1(void *a1)
{
  NSObject *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (const char *)OUTLINED_FUNCTION_8_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, v1, v4, "%@: nil _ANEModel", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)mapIOSurfacesWithModel:(void *)a1 request:cacheInference:error:.cold.2(void *a1)
{
  NSObject *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (const char *)OUTLINED_FUNCTION_8_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, v1, v4, "%@: nil _ANERequest", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)mapIOSurfacesWithModel:(void *)a1 request:cacheInference:error:.cold.3(void *a1)
{
  NSObject *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (const char *)OUTLINED_FUNCTION_8_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, v1, v4, "%@: nil _ANEProgramIOSurfacesMapper", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)mapIOSurfacesWithModel:(void *)a1 request:cacheInference:error:.cold.4(void *a1)
{
  NSObject *v1;
  const char *v2;
  void *v3;
  int v4;
  uint8_t v5[12];
  __int16 v6;
  int v7;

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (const char *)OUTLINED_FUNCTION_9_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  v6 = 1024;
  v7 = v4;
  _os_log_debug_impl(&dword_1D3352000, v1, OS_LOG_TYPE_DEBUG, "%@: success=%d", v5, 0x12u);

  OUTLINED_FUNCTION_2();
}

- (void)mapIOSurfacesWithModel:request:cacheInference:error:.cold.5()
{
  NSObject *v0;
  id v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[40];

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_17_0(v1);
  v2 = (const char *)OUTLINED_FUNCTION_9_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_13_0(&dword_1D3352000, v0, v4, "%@: model[%p]=%@", v5);

  OUTLINED_FUNCTION_2_3();
}

- (void)unmapIOSurfacesWithModel:(void *)a1 request:.cold.1(void *a1)
{
  NSObject *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (const char *)OUTLINED_FUNCTION_8_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, v1, v4, "%@: No support in VM", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)beginRealTimeTask
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)endRealTimeTask
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)doLoadModel:(void *)a1 options:(const char *)a2 qos:error:.cold.1(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)doLoadModel:(void *)a1 options:(const char *)a2 qos:error:.cold.2(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)doLoadModel:options:qos:error:.cold.3()
{
  const char *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_21_0();
  v2 = OUTLINED_FUNCTION_17_0(v1);
  NSStringFromSelector(v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_11(&dword_1D3352000, v4, v5, "%@: model[%p]=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_3();
}

- (void)doLoadModelNewInstance:(void *)a1 options:(const char *)a2 modelInstParams:qos:error:.cold.1(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)doLoadModelNewInstance:(void *)a1 options:(const char *)a2 modelInstParams:qos:error:.cold.2(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)doLoadModelNewInstance:options:modelInstParams:qos:error:.cold.3()
{
  const char *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_21_0();
  v2 = OUTLINED_FUNCTION_17_0(v1);
  NSStringFromSelector(v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_11(&dword_1D3352000, v4, v5, "%@: model[%p]=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_3();
}

- (void)doPrepareChainingWithModel:(void *)a1 options:(const char *)a2 chainingReq:qos:error:.cold.1(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)doPrepareChainingWithModel:(void *)a1 options:(const char *)a2 chainingReq:qos:error:.cold.2(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)doPrepareChainingWithModel:(void *)a1 options:(const char *)a2 chainingReq:qos:error:.cold.4(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: does not support virtual client yet", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

- (void)doEnqueueSetsWithModel:(void *)a1 outputSet:options:qos:error:.cold.1(void *a1)
{
  NSObject *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (const char *)OUTLINED_FUNCTION_8_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, v1, v4, "%@: Virtual Machine environment detected but no virtualClient available.", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)doEnqueueSetsWithModel:outputSet:options:qos:error:.cold.2()
{
  void *v0;
  NSObject *v1;
  id v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(v2);
  v3 = (const char *)OUTLINED_FUNCTION_9_1();
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_1(), "program");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_4_2(&dword_1D3352000, v1, v5, "%@: doEnqueueSetsWithModel for program %@ ", v6);

  OUTLINED_FUNCTION_2();
}

- (void)doEnqueueSetsWithModel:(void *)a1 outputSet:options:qos:error:.cold.3(void *a1)
{
  NSObject *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (const char *)OUTLINED_FUNCTION_8_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, v1, v4, "%@: does not support virtual client yet", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)doBuffersReadyWithModel:inputBuffers:options:qos:error:.cold.2()
{
  void *v0;
  NSObject *v1;
  id v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(v2);
  v3 = (const char *)OUTLINED_FUNCTION_9_1();
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_1(), "program");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_4_2(&dword_1D3352000, v1, v5, "%@: doBuffersReadyWithModel for program %@ ", v6);

  OUTLINED_FUNCTION_2();
}

- (void)reportEvaluateFailure:failureReason:qIdx:.cold.1()
{
  void *v0;
  id v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(v1);
  v2 = (const char *)OUTLINED_FUNCTION_9_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0(&dword_1D3352000, v4, v5, "%@: model=%@ was not loaded by the client.", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)echo:(void *)a1 .cold.1(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

@end
