@implementation NetDiagnosticsShim

- (NetDiagnosticsShim)initWithTaskName:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  NetDiagnosticsShim *v9;
  NetDiagnosticsShim *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NetDiagnosticsShim *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *netDiagMsgQueue;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *netDiagConnQueue;
  NSObject *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  objc_super v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NetDiagnosticsShim;
  v9 = -[NetDiagnosticsShim init](&v27, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_24;
  objc_storeStrong((id *)&v9->_taskName, a3);
  if (!v8)
  {
    symptomsLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_ERROR, "Passing in a nil queue to NetDiagnosticsShim is NOT recommended!!!", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.symptoms.%@.netdiag.msg.queue"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.symptoms.%@.netdiag.msg.queue"), v7);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = objc_retainAutorelease(v14);
    v17 = dispatch_queue_create((const char *)-[NetDiagnosticsShim UTF8String](v16, "UTF8String"), v15);
    netDiagMsgQueue = v10->_netDiagMsgQueue;
    v10->_netDiagMsgQueue = (OS_dispatch_queue *)v17;

    if (v10->_netDiagMsgQueue)
    {
      v19 = objc_retainAutorelease(v11);
      v20 = dispatch_queue_create((const char *)-[NSObject UTF8String](v19, "UTF8String"), v15);
      netDiagConnQueue = v10->_netDiagConnQueue;
      v10->_netDiagConnQueue = (OS_dispatch_queue *)v20;

      if (v10->_netDiagConnQueue)
      {

        v11 = v19;
LABEL_23:

        goto LABEL_24;
      }
      symptomsLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      v25 = -[NSObject UTF8String](objc_retainAutorelease(v19), "UTF8String");
      *(_DWORD *)buf = 136315138;
      v29 = v25;
      v24 = "Couldn't create _netDiagConnQueue %s";
    }
    else
    {
      symptomsLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_21:

        goto LABEL_22;
      }
      v23 = -[NetDiagnosticsShim UTF8String](objc_retainAutorelease(v16), "UTF8String");
      *(_DWORD *)buf = 136315138;
      v29 = v23;
      v24 = "Couldn't create _netDiagMsgQueue for %s";
    }
    _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
    goto LABEL_21;
  }
  objc_storeStrong((id *)&v10->_netDiagMsgQueue, a4);
  if (!v10->_netDiagMsgQueue)
  {
    symptomsLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "require non-nil _netDiagMsgQueue";
      goto LABEL_14;
    }
LABEL_15:
    v16 = v10;
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  objc_storeStrong((id *)&v10->_netDiagConnQueue, a4);
  if (!v10->_netDiagConnQueue)
  {
    symptomsLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "require non-nil _netDiagConnQueue";
LABEL_14:
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
LABEL_24:

  return v10;
}

- (void)connectToNetDiagnosticsd
{
  OS_dispatch_queue *netDiagConnQueue;
  OS_xpc_object *v4;
  OS_xpc_object *netDiagServiceConnection;
  OS_xpc_object *v6;
  OS_xpc_object *netDiagNotificationListener;
  NSObject *v8;
  void *v9;
  const char *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_netDiagServiceConnection)
  {
    if (self->_netDiagMsgQueue)
    {
      netDiagConnQueue = self->_netDiagConnQueue;
      if (netDiagConnQueue)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __46__NetDiagnosticsShim_connectToNetDiagnosticsd__block_invoke;
        v11[3] = &unk_1EA3B4960;
        v11[4] = self;
        -[NetDiagnosticsShim _connectionForServiceNamed:queue:connectionInvalidHandler:](self, "_connectionForServiceNamed:queue:connectionInvalidHandler:", kNetDiagXPCService[0], netDiagConnQueue, v11);
        v4 = (OS_xpc_object *)objc_claimAutoreleasedReturnValue();
        netDiagServiceConnection = self->_netDiagServiceConnection;
        self->_netDiagServiceConnection = v4;

        if (self->_netDiagServiceConnection)
        {
          -[NetDiagnosticsShim createNotificationListener](self, "createNotificationListener");
          v6 = (OS_xpc_object *)objc_claimAutoreleasedReturnValue();
          netDiagNotificationListener = self->_netDiagNotificationListener;
          self->_netDiagNotificationListener = v6;

          if (self->_netDiagNotificationListener)
          {
            -[NetDiagnosticsShim sendNotificationListener](self, "sendNotificationListener");
            return;
          }
          symptomsLogHandle();
          v8 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          -[NetDiagnosticsShim taskName](self, "taskName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v13 = v9;
          v10 = "Can't create a listener for notifications for %@";
        }
        else
        {
          symptomsLogHandle();
          v8 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
LABEL_13:

            return;
          }
          -[NetDiagnosticsShim taskName](self, "taskName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v13 = v9;
          v10 = "Can't connect to XPC service for %@";
        }
        _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);

        goto LABEL_13;
      }
    }
  }
}

void __46__NetDiagnosticsShim_connectToNetDiagnosticsd__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[NetDiagnosticsShim invalidateConnections](self, "invalidateConnections");
  v3.receiver = self;
  v3.super_class = (Class)NetDiagnosticsShim;
  -[NetDiagnosticsShim dealloc](&v3, sel_dealloc);
}

- (void)invalidateConnections
{
  NSObject *v3;
  void *v4;
  OS_xpc_object *netDiagServiceConnection;
  OS_xpc_object *v6;
  OS_xpc_object *netDiagNotificationConnection;
  OS_xpc_object *v8;
  OS_xpc_object *netDiagNotificationListener;
  OS_xpc_object *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  symptomsLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[NetDiagnosticsShim taskName](self, "taskName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_INFO, "Invalidating connections (%@)", (uint8_t *)&v11, 0xCu);

  }
  netDiagServiceConnection = self->_netDiagServiceConnection;
  if (netDiagServiceConnection)
  {
    xpc_connection_cancel(netDiagServiceConnection);
    v6 = self->_netDiagServiceConnection;
    self->_netDiagServiceConnection = 0;

  }
  netDiagNotificationConnection = self->_netDiagNotificationConnection;
  if (netDiagNotificationConnection)
  {
    xpc_connection_cancel(netDiagNotificationConnection);
    v8 = self->_netDiagNotificationConnection;
    self->_netDiagNotificationConnection = 0;

  }
  netDiagNotificationListener = self->_netDiagNotificationListener;
  if (netDiagNotificationListener)
  {
    xpc_connection_cancel(netDiagNotificationListener);
    v10 = self->_netDiagNotificationListener;
    self->_netDiagNotificationListener = 0;

  }
}

- (BOOL)startNetDiagnosticTaskWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  OS_xpc_object *netDiagServiceConnection;
  NSObject *netDiagMsgQueue;
  BOOL v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  _QWORD handler[4];
  id v51;
  id v52;

  v6 = a3;
  v7 = a4;
  v8 = xpc_dictionary_create(0, 0, 0);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskName"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (objc_msgSend(v9, "UTF8String") && (v10 = objc_retainAutorelease(v9), *(_BYTE *)objc_msgSend(v10, "UTF8String")))
    {
      xpc_dictionary_set_string(v8, kNetDiagCommand[0], kNetDiagCmdTaskRun[0]);
      v11 = kNetDiagKey[0];
      v47 = objc_retainAutorelease(v10);
      xpc_dictionary_set_string(v8, v11, (const char *)objc_msgSend(v47, "UTF8String"));
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskFileAge"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
        xpc_dictionary_set_uint64(v8, kNetDiagTaskFileAge[0], objc_msgSend(v12, "unsignedLongLongValue"));
      v49 = v13;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("filename"));
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      if (objc_msgSend(v14, "UTF8String"))
      {
        v15 = objc_retainAutorelease(v14);
        if (*(_BYTE *)objc_msgSend(v15, "UTF8String"))
          xpc_dictionary_set_string(v8, kNetDiagTaskFilePath[0], (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskFileUserID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
        xpc_dictionary_set_int64(v8, kNetDiagTaskFileUserID[0], objc_msgSend(v16, "longLongValue"));
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskFileGroupID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
        xpc_dictionary_set_int64(v8, kNetDiagTaskFileGroupID[0], objc_msgSend(v18, "longLongValue"));
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskFileMode"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
        xpc_dictionary_set_int64(v8, kNetDiagTaskFileMode[0], objc_msgSend(v20, "longLongValue"));
      v44 = v21;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskFileDicts"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22 && objc_msgSend(v22, "count"))
      {
        v24 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        if (v24)
          xpc_dictionary_set_value(v8, kNetDiagTaskFilePaths[0], v24);

      }
      v48 = v14;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskGNISensitive"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
        xpc_dictionary_set_BOOL(v8, kNetDiagTaskGNISensitive[0], objc_msgSend(v25, "BOOLValue"));
      v45 = v19;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskGNISysConfig"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
        xpc_dictionary_set_BOOL(v8, kNetDiagTaskGNISysConfig[0], objc_msgSend(v27, "BOOLValue"));
      v46 = v17;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskGNINDFInfo"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
        xpc_dictionary_set_BOOL(v8, kNetDiagTaskGNINDFInfo[0], objc_msgSend(v29, "BOOLValue"));
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskArchiveBaseSize"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
        xpc_dictionary_set_uint64(v8, kNetDiagTaskLogArchiveBaseSize[0], objc_msgSend(v31, "unsignedIntegerValue"));
      v43 = v23;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskArchiveBaseDuration"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        xpc_dictionary_set_uint64(v8, kNetDiagTaskLogArchiveBaseDuration[0], objc_msgSend(v33, "unsignedIntegerValue"));
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskArchiveTTLSize"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
        xpc_dictionary_set_uint64(v8, kNetDiagTaskLogArchiveTTLSize[0], objc_msgSend(v34, "unsignedIntegerValue"));
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskArchiveTTLDuration"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
        xpc_dictionary_set_uint64(v8, kNetDiagTaskLogArchiveTTLDuration[0], objc_msgSend(v35, "unsignedIntegerValue"));
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskArchiveHVSize"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
        xpc_dictionary_set_uint64(v8, kNetDiagTaskLogArchiveHVSize[0], objc_msgSend(v36, "unsignedIntegerValue"));
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskArchiveHVDuration"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
        xpc_dictionary_set_uint64(v8, kNetDiagTaskLogArchiveHVDuration[0], objc_msgSend(v37, "integerValue"));
      -[NetDiagnosticsShim connectToNetDiagnosticsd](self, "connectToNetDiagnosticsd");
      netDiagServiceConnection = self->_netDiagServiceConnection;
      netDiagMsgQueue = self->_netDiagMsgQueue;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __62__NetDiagnosticsShim_startNetDiagnosticTaskWithOptions_reply___block_invoke;
      handler[3] = &unk_1EA3B61E0;
      v52 = v7;
      v51 = v47;
      xpc_connection_send_message_with_reply(netDiagServiceConnection, v8, netDiagMsgQueue, handler);

      v40 = 1;
    }
    else
    {
      v40 = 0;
    }

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

void __62__NetDiagnosticsShim_startNetDiagnosticTaskWithOptions_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[8];
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1DF0B686C]();
  if (v4 == MEMORY[0x1E0C81310])
  {
    symptomsLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_INFO, "kNetDiagCmdTaskRun failed!", buf, 2u);
    }

    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB2FE0];
      v14 = CFSTR("error");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("An XPC error occurred while processing task: %@. (kNetDiagCmdTaskRun failure)"), *(_QWORD *)(a1 + 32));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 5, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v12);

    }
  }
  else if (v4 == MEMORY[0x1E0C812F8] && *(_QWORD *)(a1 + 40))
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (BOOL)stopNetDiagnosticTaskWithReply:(id)a3
{
  id v4;
  xpc_object_t v5;
  void *v6;
  OS_xpc_object *netDiagServiceConnection;
  NSObject *netDiagMsgQueue;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  v6 = v5;
  if (v5)
  {
    xpc_dictionary_set_string(v5, kNetDiagCommand[0], kNetDiagCmdTaskStop[0]);
    xpc_dictionary_set_string(v6, kNetDiagKey[0], -[NSString UTF8String](self->_taskName, "UTF8String"));
    -[NetDiagnosticsShim connectToNetDiagnosticsd](self, "connectToNetDiagnosticsd");
    netDiagServiceConnection = self->_netDiagServiceConnection;
    netDiagMsgQueue = self->_netDiagMsgQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__NetDiagnosticsShim_stopNetDiagnosticTaskWithReply___block_invoke;
    v10[3] = &unk_1EA3B61E0;
    v10[4] = self;
    v11 = v4;
    xpc_connection_send_message_with_reply(netDiagServiceConnection, v6, netDiagMsgQueue, v10);

  }
  return v6 != 0;
}

void __53__NetDiagnosticsShim_stopNetDiagnosticTaskWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[8];
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1DF0B686C]();
  if (v4 == MEMORY[0x1E0C81310])
  {
    symptomsLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_INFO, "kNetDiagCmdTaskStop failed!", buf, 2u);
    }

    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB2FE0];
      v14 = CFSTR("error");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stopping %@ failed!"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 5, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v12);

    }
  }
  else if (v4 == MEMORY[0x1E0C812F8] && *(_QWORD *)(a1 + 40))
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (BOOL)netDiagnosticTaskStatusWithReply:(id)a3
{
  id v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  BOOL v8;
  OS_xpc_object *netDiagServiceConnection;
  NSObject *netDiagMsgQueue;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    v6 = xpc_array_create(0, 0);
    if (v6)
    {
      v7 = xpc_string_create(-[NSString UTF8String](self->_taskName, "UTF8String"));
      v8 = v7 != 0;
      if (v7)
      {
        xpc_array_append_value(v6, v7);
        xpc_dictionary_set_value(v5, kNetDiagKeyArray[0], v6);
        xpc_dictionary_set_string(v5, kNetDiagCommand[0], kNetDiagCmdTasksStatus[0]);
        -[NetDiagnosticsShim connectToNetDiagnosticsd](self, "connectToNetDiagnosticsd");
        netDiagServiceConnection = self->_netDiagServiceConnection;
        netDiagMsgQueue = self->_netDiagMsgQueue;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __55__NetDiagnosticsShim_netDiagnosticTaskStatusWithReply___block_invoke;
        v12[3] = &unk_1EA3B61E0;
        v12[4] = self;
        v13 = v4;
        xpc_connection_send_message_with_reply(netDiagServiceConnection, v5, netDiagMsgQueue, v12);

      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __55__NetDiagnosticsShim_netDiagnosticTaskStatusWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[8];
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1DF0B686C]();
  if (v4 == MEMORY[0x1E0C81310])
  {
    symptomsLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_INFO, "kNetDiagCmdTasksStatus failed!", buf, 2u);
    }

    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB2FE0];
      v14 = CFSTR("error");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stopping %@ failed!"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 5, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v12);

    }
  }
  else if (v4 == MEMORY[0x1E0C812F8] && *(_QWORD *)(a1 + 40))
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (id)createNotificationListener
{
  _xpc_connection_s *v3;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  _QWORD handler[5];
  uint8_t buf[16];

  v3 = xpc_connection_create(0, (dispatch_queue_t)self->_netDiagConnQueue);
  v4 = v3;
  if (v3)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __48__NetDiagnosticsShim_createNotificationListener__block_invoke;
    handler[3] = &unk_1EA3B6208;
    handler[4] = self;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_resume(v4);
    v5 = v4;
  }
  else
  {
    symptomsLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_ERROR, "Couldn't create progress connection", buf, 2u);
    }

  }
  return v4;
}

void __48__NetDiagnosticsShim_createNotificationListener__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  _xpc_connection_s *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _xpc_connection_s *v17;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = MEMORY[0x1DF0B686C]();
  v6 = (void *)MEMORY[0x1DF0B67DC](v4);
  if (v6)
    free(v6);
  if (v5 == MEMORY[0x1E0C81310])
  {
    if (v4 == (id)MEMORY[0x1E0C81288])
    {
      symptomsLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_18;
      objc_msgSend(*(id *)(a1 + 32), "taskName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      v9 = "received XPC_ERROR_TERMINATION_IMMINENT for %@";
    }
    else
    {
      if (v4 != (id)MEMORY[0x1E0C81260])
        goto LABEL_19;
      symptomsLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_18;
      objc_msgSend(*(id *)(a1 + 32), "taskName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      v9 = "progress connection is closed for %@";
    }
    v10 = v7;
    v11 = OS_LOG_TYPE_DEBUG;
    goto LABEL_17;
  }
  if (v5 != MEMORY[0x1E0C812E0])
  {
    symptomsLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "taskName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      v9 = "unknown xpc_type_t for %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_INFO;
LABEL_17:
      _os_log_impl(&dword_1DBAE1000, v10, v11, v9, buf, 0xCu);

    }
LABEL_18:

    goto LABEL_19;
  }
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_xpc_connection_s **)(v12 + 24);
  if (v13)
  {
    xpc_connection_cancel(v13);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 24);
    *(_QWORD *)(v14 + 24) = 0;

    v12 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v12 + 24), a2);
  xpc_connection_set_target_queue(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 24), *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_xpc_connection_s **)(v16 + 24);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __48__NetDiagnosticsShim_createNotificationListener__block_invoke_45;
  handler[3] = &unk_1EA3B6208;
  handler[4] = v16;
  xpc_connection_set_event_handler(v17, handler);
  xpc_connection_resume(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 24));
LABEL_19:

}

void __48__NetDiagnosticsShim_createNotificationListener__block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  const char *string;
  int64_t int64;
  int64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1DF0B686C]();
  if (v4 == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(v3, kNetDiagNotifTaskStatusChanged[0]);
    int64 = xpc_dictionary_get_int64(v3, kNetDiagValue[0]);
    if (!string)
    {
      v11 = MEMORY[0x1DF0B67DC](v3);
      if (v11)
      {
        v12 = (void *)v11;
        symptomsLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = 136315138;
          v15 = v12;
          _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_INFO, "task_name seems to be NULL. dict: %s", (uint8_t *)&v14, 0xCu);
        }

        free(v12);
      }
      v5 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      goto LABEL_22;
    }
    v8 = int64;
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject netDiagnosticTaskStatusChangedFor:toStatus:](v5, "netDiagnosticTaskStatusChangedFor:toStatus:", v9, v8);
LABEL_21:

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if (v4 != MEMORY[0x1E0C81310])
  {
    symptomsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "unknown message type", (uint8_t *)&v14, 2u);
    }
    goto LABEL_22;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      symptomsLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "taskName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v9;
        v10 = "Interrupted connection to XPC service (%@)";
        goto LABEL_20;
      }
LABEL_22:

      goto LABEL_23;
    }
    if (v3 == (id)MEMORY[0x1E0C81260])
    {
      symptomsLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "taskName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v9;
        v10 = "Connection Invalid error for XPC service (%@)";
LABEL_20:
        _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v14, 0xCu);
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
LABEL_23:

}

- (void)sendNotificationListener
{
  xpc_object_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_string(v3, kNetDiagCommand[0], kNetDiagCmdNotifier[0]);
    xpc_dictionary_set_connection(v4, kNetDiagConnection[0], self->_netDiagNotificationListener);
    xpc_connection_send_message_with_reply(self->_netDiagServiceConnection, v4, (dispatch_queue_t)self->_netDiagMsgQueue, &__block_literal_global_14);
  }
  else
  {
    symptomsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_ERROR, "xpc_dictionary_create", v6, 2u);
    }

  }
}

BOOL __46__NetDiagnosticsShim_sendNotificationListener__block_invoke(int a1, xpc_object_t xdict)
{
  return xpc_dictionary_apply(xdict, &__block_literal_global_49);
}

uint64_t __46__NetDiagnosticsShim_sendNotificationListener__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = (void *)MEMORY[0x1DF0B67DC](a3);
  if (v3)
    free(v3);
  return 1;
}

- (id)_connectionForServiceNamed:(const char *)a3 queue:(id)a4 connectionInvalidHandler:(id)a5
{
  id v8;
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v10;
  NSObject *v11;
  _QWORD handler[5];
  id v14;
  const char *v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  mach_service = xpc_connection_create_mach_service(a3, (dispatch_queue_t)a4, 2uLL);
  if (mach_service)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __80__NetDiagnosticsShim__connectionForServiceNamed_queue_connectionInvalidHandler___block_invoke;
    handler[3] = &unk_1EA3B62B0;
    handler[4] = self;
    v15 = a3;
    v14 = v8;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(mach_service);
    v10 = mach_service;

  }
  else
  {
    symptomsLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = a3;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_ERROR, "Can't connect to XPC service: %s", buf, 0xCu);
    }

  }
  return mach_service;
}

void __80__NetDiagnosticsShim__connectionForServiceNamed_queue_connectionInvalidHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1DF0B686C]();
  v5 = (void *)MEMORY[0x1DF0B67DC](v3);

  if (v5)
    free(v5);
  if (v4 != MEMORY[0x1E0C81310])
  {
    v6 = MEMORY[0x1E0C812F8];
    symptomsLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v4 == v6)
    {
      if (v8)
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "Received XPC_TYPE_DICTIONARY", (uint8_t *)&v21, 2u);
      }
      goto LABEL_17;
    }
    if (!v8)
    {
LABEL_17:

      return;
    }
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "taskName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315394;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    v11 = "Received unexpected event for XPC service %s (%@)";
    v12 = v7;
    v13 = OS_LOG_TYPE_INFO;
LABEL_7:
    _os_log_impl(&dword_1DBAE1000, v12, v13, v11, (uint8_t *)&v21, 0x16u);

    goto LABEL_17;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    return;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    symptomsLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v17 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "taskName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315394;
    v22 = v17;
    v23 = 2112;
    v24 = v10;
    v11 = "Interrupted connection to XPC service %s (%@)";
    v12 = v7;
    v13 = OS_LOG_TYPE_DEBUG;
    goto LABEL_7;
  }
  v14 = (id)MEMORY[0x1E0C81260];
  symptomsLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (v3 != v14)
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "taskName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315394;
    v22 = v16;
    v23 = 2112;
    v24 = v10;
    v11 = "Unexpected error for XPC service %s (%@)";
    v12 = v7;
    v13 = OS_LOG_TYPE_ERROR;
    goto LABEL_7;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v18 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "taskName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315394;
    v22 = v18;
    v23 = 2112;
    v24 = v19;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEBUG, "Connection Invalid error for XPC service %s (%@)", (uint8_t *)&v21, 0x16u);

  }
  v20 = *(_QWORD *)(a1 + 40);
  if (v20)
    (*(void (**)(void))(v20 + 16))();
}

- (NetDiagnosticsShimDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setTaskName:(id)a3
{
  objc_storeStrong((id *)&self->_taskName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_netDiagMsgQueue, 0);
  objc_storeStrong((id *)&self->_netDiagConnQueue, 0);
  objc_storeStrong((id *)&self->_netDiagNotificationConnection, 0);
  objc_storeStrong((id *)&self->_netDiagNotificationListener, 0);
  objc_storeStrong((id *)&self->_netDiagServiceConnection, 0);
}

@end
