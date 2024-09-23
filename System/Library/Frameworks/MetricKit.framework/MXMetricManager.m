@implementation MXMetricManager

void __32__MXMetricManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v1;

}

+ (MXMetricManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__MXMetricManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (MXMetricManager *)(id)sharedManager_sharedManager;
}

- (void)addSubscriber:(id)subscriber
{
  id v4;
  NSObject *iVarQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = subscriber;
  iVarQueue = self->_iVarQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__MXMetricManager_addSubscriber___block_invoke;
  v7[3] = &unk_24DDCFDC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(iVarQueue, v7);

}

- (void)_checkAndDeliverMetricReports
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21AC3F000, v0, v1, "Connected - calling retrieve metrics", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setCheckedMetrics:(BOOL)a3
{
  self->_checkedMetrics = a3;
}

- (BOOL)checkedMetrics
{
  return self->_checkedMetrics;
}

- (void)_checkAndDeliverDiagnosticReports
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21AC3F000, v0, v1, "Connected - calling retrieve diagnostics", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_os_log)managerLogHandle
{
  return self->_managerLogHandle;
}

void __33__MXMetricManager_addSubscriber___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "subscribers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "subscribers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    objc_msgSend(*(id *)(a1 + 32), "subscribers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));

    if (v5)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "pastPayloads");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
        {
          v9 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 32), "pastPayloads");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "didReceiveMetricPayloads:", v10);

        }
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "pastDiagnosticPayloads");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
        {
          v13 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 32), "pastDiagnosticPayloads");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "didReceiveDiagnosticPayloads:", v14);

        }
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_checkAndDeliverDiagnosticReports");
      objc_msgSend(*(id *)(a1 + 32), "_checkAndDeliverMetricReports");
    }
  }
}

- (NSHashTable)subscribers
{
  return self->_subscribers;
}

- (void)setCheckedDiagnostics:(BOOL)a3
{
  self->_checkedDiagnostics = a3;
}

- (BOOL)checkedDiagnostics
{
  return self->_checkedDiagnostics;
}

- (MXMetricManager)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD handler[4];
  id v22;
  id v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MXMetricManager;
  v2 = -[MXMetricManager init](&v25, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.metrickit.manager.queue", v3);
    v5 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v4;

    v6 = os_log_create("com.apple.metrickit.metricmanager", ");
    v7 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v6;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v8;

    v10 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    v11 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v10;

    v12 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    v13 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v12;

    *((_WORD *)v2 + 4) = 0;
    objc_msgSend(v2, "_createXPCConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v14;

    v16 = (void *)*((_QWORD *)v2 + 6);
    if (v16)
    {
      objc_msgSend(v16, "remoteObjectProxy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "registerClient");

      objc_msgSend(*((id *)v2 + 6), "invalidate");
      v18 = (void *)*((_QWORD *)v2 + 6);
      *((_QWORD *)v2 + 6) = 0;

    }
    objc_initWeak(&location, v2);
    v19 = *((_QWORD *)v2 + 4);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __23__MXMetricManager_init__block_invoke;
    handler[3] = &unk_24DDCFD78;
    v22 = v2;
    objc_copyWeak(&v23, &location);
    notify_register_dispatch("com.apple.metrickit.data", (int *)v2 + 3, v19, handler);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&location);
  }
  return (MXMetricManager *)v2;
}

- (id)_createXPCConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  connection = self->_connection;
  if (connection)
  {
    v3 = connection;
  }
  else
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.metrickit.xpc"), 4096);
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255117E78);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v3, "setRemoteObjectInterface:", v5);

      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255116EA0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v3, "setExportedInterface:", v6);

      v7 = (void *)MEMORY[0x24BDBCF20];
      v8 = objc_opt_class();
      objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDBCF20];
      v11 = objc_opt_class();
      objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection exportedInterface](v3, "exportedInterface");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_deliverMetricPayload_, 0, 0);

      -[NSXPCConnection exportedInterface](v3, "exportedInterface");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_deliverDiagnosticPayload_, 0, 0);

      -[NSXPCConnection setExportedObject:](v3, "setExportedObject:", self);
      -[NSXPCConnection resume](v3, "resume");

    }
  }
  return v3;
}

void __23__MXMetricManager_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "managerLogHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __23__MXMetricManager_init__block_invoke_cold_1();

  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setCheckedMetrics:", 0);

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "setCheckedDiagnostics:", 0);

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "_checkAndDeliverDiagnosticReports");

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "_checkAndDeliverMetricReports");

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_metricToken);
  v3.receiver = self;
  v3.super_class = (Class)MXMetricManager;
  -[MXMetricManager dealloc](&v3, sel_dealloc);
}

+ (os_log_t)makeLogHandleWithCategory:(NSString *)category
{
  return os_log_create("com.apple.metrickit.log", -[NSString UTF8String](objc_retainAutorelease(category), "UTF8String"));
}

- (void)removeSubscriber:(id)subscriber
{
  id v4;
  NSObject *iVarQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = subscriber;
  iVarQueue = self->_iVarQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__MXMetricManager_removeSubscriber___block_invoke;
  v7[3] = &unk_24DDCFDC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(iVarQueue, v7);

}

void __36__MXMetricManager_removeSubscriber___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "subscribers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

+ (BOOL)extendLaunchMeasurementForTaskID:(MXLaunchTaskID)taskID error:(NSError *)error
{
  int started;
  NSError *v6;
  uint64_t v7;

  started = alm_will_start_extended_launch_task();
  v6 = 0;
  v7 = 1;
  switch(started)
  {
    case 0:
      goto LABEL_11;
    case 1:
      v7 = 0;
      goto LABEL_7;
    case 2:
      goto LABEL_7;
    case 3:
      v7 = 2;
      goto LABEL_7;
    case 4:
      v7 = 3;
      goto LABEL_7;
    case 5:
      v7 = 4;
      goto LABEL_7;
    case 6:
      v7 = 5;
LABEL_7:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithMXErrorCode:", v7);
      v6 = (NSError *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  if (error)
  {
    v6 = objc_retainAutorelease(v6);
    LOBYTE(v7) = 0;
    *error = v6;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
LABEL_11:

  return v7;
}

+ (BOOL)finishExtendedLaunchMeasurementForTaskID:(MXLaunchTaskID)taskID error:(NSError *)error
{
  int v5;
  NSError *v6;
  uint64_t v7;

  v5 = alm_did_finish_extended_launch_task();
  v6 = 0;
  v7 = 1;
  switch(v5)
  {
    case 0:
      goto LABEL_11;
    case 1:
      v7 = 0;
      goto LABEL_7;
    case 2:
      goto LABEL_7;
    case 3:
      v7 = 2;
      goto LABEL_7;
    case 4:
      v7 = 3;
      goto LABEL_7;
    case 5:
      v7 = 4;
      goto LABEL_7;
    case 6:
      v7 = 5;
LABEL_7:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithMXErrorCode:", v7);
      v6 = (NSError *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  if (error)
  {
    v6 = objc_retainAutorelease(v6);
    LOBYTE(v7) = 0;
    *error = v6;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
LABEL_11:

  return v7;
}

- (BOOL)_cachedPayloadAvailable
{
  return 0;
}

- (id)mergeDiagnosticsAtLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  BOOL v26;
  NSObject *v27;
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
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  MXDiagnosticPayload *v49;
  void *v50;
  MXDiagnosticPayload *v51;
  void *v53;
  void *v54;
  MXMetricManager *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  NSObject *obj;
  void *v62;
  void *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v58 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v60 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v57 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v69 = 0;
  v62 = v5;
  v63 = v4;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, &v69);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v69;
  v59 = v7;
  if (v9)
  {
    v10 = (uint64_t)v9;
    -[MXMetricManager managerLogHandle](self, "managerLogHandle", v9, v8);
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[MXMetricManager mergeDiagnosticsAtLocation:].cold.1((uint64_t)v63, v10, obj);
    goto LABEL_4;
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v8;
  v14 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16, 0, v8);
  if (!v14)
  {
LABEL_4:
    v11 = 0;
    v12 = 0;
    v13 = v58;
    goto LABEL_37;
  }
  v15 = v14;
  v55 = self;
  v56 = v6;
  v11 = 0;
  v12 = 0;
  v16 = *(_QWORD *)v66;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v66 != v16)
        objc_enumerationMutation(obj);
      v18 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
      objc_msgSend(v63, "stringByAppendingPathComponent:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "contentsAtPath:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x24BDD1620];
      v22 = objc_opt_class();
      v64 = 0;
      objc_msgSend(v21, "unarchivedObjectOfClass:fromData:error:", v22, v20, &v64);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v64;
      v25 = v24;
      if (v23)
        v26 = v24 == 0;
      else
        v26 = 0;
      if (!v26)
      {
        if (!v24)
          goto LABEL_34;
        -[MXMetricManager managerLogHandle](v55, "managerLogHandle");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v71 = v18;
          v72 = 2112;
          v73 = v25;
          _os_log_error_impl(&dword_21AC3F000, v27, OS_LOG_TYPE_ERROR, "Error while reading Diagnostic Report :%@ with error: %@", buf, 0x16u);
        }
        goto LABEL_32;
      }
      objc_msgSend(v23, "hangDiagnostics");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v23, "hangDiagnostics");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addObjectsFromArray:", v29);

      }
      objc_msgSend(v23, "cpuExceptionDiagnostics");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend(v23, "cpuExceptionDiagnostics");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "addObjectsFromArray:", v31);

      }
      objc_msgSend(v23, "diskWriteExceptionDiagnostics");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        objc_msgSend(v23, "diskWriteExceptionDiagnostics");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "addObjectsFromArray:", v33);

      }
      objc_msgSend(v23, "crashDiagnostics");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v23, "crashDiagnostics");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "addObjectsFromArray:", v35);

      }
      objc_msgSend(v23, "appLaunchDiagnostics");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v23, "appLaunchDiagnostics");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addObjectsFromArray:", v37);

      }
      objc_msgSend(v23, "timeStampBegin");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v12)
      {
        objc_msgSend(v38, "earlierDate:", v12);
        v40 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v40;
      }
      else
      {
        v12 = v38;
      }
      objc_msgSend(v23, "timeStampEnd");
      v41 = objc_claimAutoreleasedReturnValue();
      v27 = v41;
      if (v11)
      {
        -[NSObject laterDate:](v41, "laterDate:", v11);
        v42 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v42;
LABEL_32:

        goto LABEL_34;
      }
      v11 = v41;
LABEL_34:

    }
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  }
  while (v15);
  v6 = v56;
  v13 = v58;
  v7 = v59;
LABEL_37:

  v43 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKey:", v44, CFSTR("diskWriteExceptionDiagnostics"));

  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKey:", v45, CFSTR("hangDiagnostics"));

  }
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v13);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKey:", v46, CFSTR("cpuExceptionDiagnostics"));

  }
  if (objc_msgSend(v60, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v60);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKey:", v47, CFSTR("crashDiagnostics"));

  }
  if (objc_msgSend(v57, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v57);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKey:", v48, CFSTR("appLaunchDiagnostics"));

  }
  v49 = [MXDiagnosticPayload alloc];
  v50 = (void *)objc_msgSend(v43, "copy");
  v51 = -[MXDiagnosticPayload initWithTimeStampBegin:withTimeStampEnd:withDiagnostics:](v49, "initWithTimeStampBegin:withTimeStampEnd:withDiagnostics:", v12, v11, v50);

  return v51;
}

- (void)deliverMetricPayload:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *iVarQueue;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[MXMetricManager managerLogHandle](self, "managerLogHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21AC3F000, v5, OS_LOG_TYPE_DEFAULT, "Delivering metric reports: %@", buf, 0xCu);
    }

    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[MXMetricManager pastPayloads](self, "pastPayloads");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(v6, "addObjectsFromArray:", v4);
    v8 = (void *)objc_msgSend(v6, "copy");
    -[MXMetricManager setPastPayloads:](self, "setPastPayloads:", v8);

    iVarQueue = self->_iVarQueue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __40__MXMetricManager_deliverMetricPayload___block_invoke;
    v10[3] = &unk_24DDCFDC0;
    v10[4] = self;
    v11 = v4;
    dispatch_async(iVarQueue, v10);

  }
}

void __40__MXMetricManager_deliverMetricPayload___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "subscribers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "didReceiveMetricPayloads:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)deliverDiagnosticPayload:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *iVarQueue;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[MXMetricManager managerLogHandle](self, "managerLogHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21AC3F000, v5, OS_LOG_TYPE_DEFAULT, "Delivering diagnostic reports: %@", buf, 0xCu);
    }

    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[MXMetricManager pastDiagnosticPayloads](self, "pastDiagnosticPayloads");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(v6, "addObjectsFromArray:", v4);
    v8 = (void *)objc_msgSend(v6, "copy");
    -[MXMetricManager setPastDiagnosticPayloads:](self, "setPastDiagnosticPayloads:", v8);

    iVarQueue = self->_iVarQueue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44__MXMetricManager_deliverDiagnosticPayload___block_invoke;
    v10[3] = &unk_24DDCFDC0;
    v10[4] = self;
    v11 = v4;
    dispatch_async(iVarQueue, v10);

  }
}

void __44__MXMetricManager_deliverDiagnosticPayload___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "subscribers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "didReceiveDiagnosticPayloads:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (NSArray)pastPayloads
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPastPayloads:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)pastDiagnosticPayloads
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPastDiagnosticPayloads:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)iVarQueue
{
  return self->_iVarQueue;
}

- (void)setIVarQueue:(id)a3
{
  objc_storeStrong((id *)&self->_iVarQueue, a3);
}

- (void)setManagerLogHandle:(id)a3
{
  objc_storeStrong((id *)&self->_managerLogHandle, a3);
}

- (int)metricToken
{
  return self->_metricToken;
}

- (void)setMetricToken:(int)a3
{
  self->_metricToken = a3;
}

- (void)setSubscribers:(id)a3
{
  objc_storeStrong((id *)&self->_subscribers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_managerLogHandle, 0);
  objc_storeStrong((id *)&self->_iVarQueue, 0);
  objc_storeStrong((id *)&self->_pastDiagnosticPayloads, 0);
  objc_storeStrong((id *)&self->_pastPayloads, 0);
}

void __23__MXMetricManager_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21AC3F000, v0, v1, "Calling check & deliver", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)mergeDiagnosticsAtLocation:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_21AC3F000, log, OS_LOG_TYPE_ERROR, "Failed to retrieve contents of directory %@ data on disk: %@", (uint8_t *)&v3, 0x16u);
}

@end
