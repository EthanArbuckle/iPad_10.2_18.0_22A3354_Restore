@implementation DiagCollectionClient

- (DiagCollectionClient)init
{
  void *v3;
  DiagCollectionClient *v4;

  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DiagCollectionClient initWithDestinationDirectory:](self, "initWithDestinationDirectory:", v3);

  return v4;
}

- (DiagCollectionClient)initWithDestinationDirectory:(id)a3
{
  id v5;
  DiagCollectionClient *v6;
  DiagCollectionClient *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DiagCollectionClient;
  v6 = -[DiagCollectionClient init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->destinationDirectory, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.autobugcapture.diagcollectionclient.queue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (id)setupXPCInterface
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[16];
  uint8_t buf[16];

  v2 = -[DiagCollectionClient currentLoginUserID](self, "currentLoginUserID");
  if ((_DWORD)v2)
  {
    v3 = v2;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.symptom_diagnostics_collection"), 0);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F031BD18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v5);

    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_collectPayloadsWithIdentifier_diagnosticExtensions_reply_, 0, 1);

    objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_7);
    objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_64);
    objc_msgSend(v4, "_setTargetUserIdentifier:", v3);
    objc_msgSend(v4, "resume");
    diagcollectLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEFAULT, "DiagCollectionClient: XPC interface ready.", buf, 2u);
    }

  }
  else
  {
    diagcollectLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_ERROR, "DiagCollectionClient: Could not ready the XPC interface (missing target user id)", v15, 2u);
    }
    v4 = 0;
  }

  return v4;
}

void __41__DiagCollectionClient_setupXPCInterface__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  diagcollectLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DBAE1000, v0, OS_LOG_TYPE_INFO, "DiagCollectionClient: Connection invalidated.", v1, 2u);
  }

}

void __41__DiagCollectionClient_setupXPCInterface__block_invoke_63()
{
  NSObject *v0;
  uint8_t v1[16];

  diagcollectLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DBAE1000, v0, OS_LOG_TYPE_INFO, "DiagCollectionClient: Connection interrupted.", v1, 2u);
  }

}

- (unsigned)currentLoginUserID
{
  return 0;
}

- (void)moveDiagnosticFilesToDestination:(id)a3 reply:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint8_t v14[8];
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = (void (**)(id, id))a4;
  v7 = (void *)MEMORY[0x1E0CB3620];
  v8 = a3;
  objc_msgSend(v7, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__DiagCollectionClient_moveDiagnosticFilesToDestination_reply___block_invoke;
  v15[3] = &unk_1EA3B5688;
  v15[4] = self;
  v16 = v9;
  v11 = v10;
  v17 = v11;
  v12 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);

  diagcollectLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEBUG, "DiagCollectionClient: Finished moving all DiagnosticExtension files", v14, 2u);
  }

  if (v6)
    v6[2](v6, v11);

}

void __63__DiagCollectionClient_moveDiagnosticFilesToDestination_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  diagcollectLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v5;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "DiagCollectionClient: Processing files for %@", buf, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __63__DiagCollectionClient_moveDiagnosticFilesToDestination_reply___block_invoke_68;
    v19 = &unk_1EA3B5660;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v20 = v9;
    v21 = v10;
    v22 = v11;
    v23 = v8;
    v12 = v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v16);
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v12, v9, v16, v17, v18, v19);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v6, v5);
    }
    else
    {
      diagcollectLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v15;
        v26 = 2112;
        v27 = v6;
        _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_ERROR, "DiagCollectionClient: Found unexpected object %@ with value %@ in DE filepaths dictionary (expected NSArray)", buf, 0x16u);

      }
    }
  }

}

void __63__DiagCollectionClient_moveDiagnosticFilesToDestination_reply___block_invoke_68(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  objc_class *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  NSObject *v17;
  __int16 v18;
  NSObject *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSObject lastPathComponent](v3, "lastPathComponent");
    v4 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject containsString:](v4, "containsString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      diagcollectLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(NSObject **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v17 = v4;
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "DiagCollectionClient: WARNING - File %@ does not contain this DiagnosticExtention's identifier (%@) in the filename", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "stringByAppendingPathComponent:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 48);
    v15 = 0;
    v9 = objc_msgSend(v8, "moveItemAtPath:toPath:error:", v3, v7, &v15);
    v10 = v15;
    diagcollectLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v3;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_INFO, "DiagCollectionClient: Moved file from %@ to %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v17 = v3;
        v18 = 2112;
        v19 = v7;
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "DiagCollectionClient: Unable to move file at %@ to %@ (%@)", buf, 0x20u);
      }

    }
  }
  else
  {
    diagcollectLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_ERROR, "DiagCollectionClient: Found unexpected object %@ with value %@ in DE filepaths array (expected NSString)", buf, 0x16u);

    }
  }

}

- (void)collectDEPayloadsWithIdentifier:(id)a3 diagnosticExtensionsWithParameters:(id)a4 queue:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  dispatch_source_t v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  dispatch_time_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  id *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  _QWORD v34[2];
  NSObject *v35;
  id v36;
  uint8_t *v37;
  _QWORD handler[4];
  NSObject *v39;
  id v40;
  uint8_t *v41;
  _QWORD v42[4];
  NSObject *v43;
  NSObject *v44;
  id v45;
  uint8_t *v46;
  uint8_t v47[8];
  uint8_t *v48;
  uint64_t v49;
  char v50;
  _QWORD block[4];
  id v52;
  uint8_t buf[4];
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    if (objc_msgSend(v10, "length"))
    {
      -[DiagCollectionClient setupXPCInterface](self, "setupXPCInterface");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        *(_QWORD *)v47 = 0;
        v48 = v47;
        v49 = 0x2020000000;
        v50 = 0;
        objc_msgSend(v14, "_queue");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v16);

        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_2;
        v42[3] = &unk_1EA3B56D8;
        v18 = v17;
        v43 = v18;
        v46 = v47;
        v19 = v12;
        v44 = v19;
        v20 = v13;
        v45 = v20;
        objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v42);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          diagcollectLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            v54 = 600;
            _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_INFO, "DiagCollectionClient: calling remote service (collectPayloadsWithIdentifier:diagnosticExtensionsWithParameters:) with timeout = %d", buf, 8u);
          }

          if (v18)
          {
            v22 = dispatch_time(0, 600000000000);
            dispatch_source_set_timer(v18, v22, 0xFFFFFFFFFFFFFFFFLL, 0);
            handler[0] = MEMORY[0x1E0C809B0];
            handler[1] = 3221225472;
            handler[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_74;
            handler[3] = &unk_1EA3B5700;
            v41 = v47;
            v39 = v19;
            v40 = v20;
            dispatch_source_set_event_handler(v18, handler);
            diagcollectLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DBAE1000, v23, OS_LOG_TYPE_DEBUG, "DiagCollectionClient: Starting safeguard timer", buf, 2u);
            }

            dispatch_resume(v18);
            v24 = v39;
          }
          else
          {
            diagcollectLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_DEFAULT, "DiagCollectionClient: Failed to create a safeguard timer.", buf, 2u);
            }
          }

          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_76;
          v33[3] = &unk_1EA3B5750;
          v37 = v47;
          v34[0] = v18;
          v34[1] = self;
          v35 = v19;
          v36 = v20;
          objc_msgSend(v28, "collectPayloadsWithIdentifier:diagnosticExtensionsWithParameters:reply:", v10, v11, v33);

          v27 = (id *)v34;
        }
        else
        {
          diagcollectLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_INFO, "DiagCollectionClient: remote service not initialized", buf, 2u);
          }

          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_81;
          v31[3] = &unk_1EA3B56B0;
          v27 = &v32;
          v32 = v20;
          dispatch_async(v19, v31);
        }

        _Block_object_dispose(v47, 8);
      }
      else
      {
        diagcollectLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v47 = 0;
          _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_ERROR, "DiagCollectionClient: Unable to establish XPC connection to DiagnosticExtension collection service", v47, 2u);
        }

        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_82;
        v29[3] = &unk_1EA3B56B0;
        v30 = v13;
        dispatch_async(v12, v29);

      }
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke;
      block[3] = &unk_1EA3B56B0;
      v52 = v13;
      dispatch_async(v12, block);
      v15 = v52;
    }

  }
}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  diagcollectLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "description");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315138;
    v14 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_INFO, "DiagCollectionClient: remote object proxy error %s", buf, 0xCu);

  }
  v6 = *(NSObject **)(a1 + 32);
  if (v6)
    dispatch_source_cancel(v6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_72;
  v10[3] = &unk_1EA3B4A28;
  v7 = *(NSObject **)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v11 = v3;
  v12 = v8;
  v9 = v3;
  dispatch_async(v7, v10);

}

uint64_t __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_72(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_74(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[16];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    diagcollectLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_ERROR, "DiagCollectionClient: calling remote service (collectPayloadsWithIdentifier:diagnosticExtensionsWithParameters:) timedout", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_75;
    block[3] = &unk_1EA3B56B0;
    v3 = *(NSObject **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    dispatch_async(v3, block);

  }
}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_75(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 60, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_76(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int *v13;
  char *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(NSObject **)(a1 + 32);
  if (v10)
    dispatch_source_cancel(v10);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  if (!v9)
  {
    if (v8)
    {
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      v11 = sandbox_extension_consume();
      if (v11 != -1)
      {
LABEL_12:
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_77;
        v20[3] = &unk_1EA3B5728;
        v18 = *(void **)(a1 + 40);
        v21 = *(id *)(a1 + 48);
        v19 = *(id *)(a1 + 56);
        v22 = 0;
        v23 = v19;
        objc_msgSend(v18, "moveDiagnosticFilesToDestination:reply:", v7, v20);
        if (v11 != -1)
          sandbox_extension_release();

        goto LABEL_15;
      }
      diagcollectLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = __error();
        v14 = strerror(*v13);
        *(_DWORD *)buf = 136315138;
        v25 = v14;
        v15 = "Failed to consume sandbox extension due to error: %s";
        v16 = v12;
        v17 = 12;
LABEL_10:
        _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      }
    }
    else
    {
      diagcollectLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v15 = "No sandbox extension provided";
        v16 = v12;
        v17 = 2;
        goto LABEL_10;
      }
    }

    v11 = -1;
    goto LABEL_12;
  }
LABEL_15:

}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_77(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_2_78;
  block[3] = &unk_1EA3B4F90;
  v9 = *(id *)(a1 + 48);
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_2_78(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_81(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 57, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_82(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 57, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->destinationDirectory, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
