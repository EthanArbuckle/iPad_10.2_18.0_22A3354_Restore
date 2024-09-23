@implementation MLRExtensionRemoteContext

- (MLRExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  return -[MLRExtensionRemoteContext initWithInputItems:listenerEndpoint:contextUUID:plugin:](self, "initWithInputItems:listenerEndpoint:contextUUID:plugin:", a3, a4, a5, 0);
}

- (MLRExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5 plugin:(id)a6
{
  id v11;
  MLRExtensionRemoteContext *v12;
  MLRExtensionRemoteContext *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const char *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *taskExecutionQueue;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  const char *v32;
  NSObject *v33;
  dispatch_queue_t v34;
  OS_dispatch_queue *stopQueue;
  objc_super v37;

  v11 = a6;
  v37.receiver = self;
  v37.super_class = (Class)MLRExtensionRemoteContext;
  v12 = -[MLRExtensionRemoteContext initWithInputItems:listenerEndpoint:contextUUID:](&v37, sel_initWithInputItems_listenerEndpoint_contextUUID_, a3, a4, a5);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_plugin, a6);
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%@.execution"), v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_retainAutorelease(v19);
    v21 = (const char *)objc_msgSend(v20, "cStringUsingEncoding:", 4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create(v21, v22);
    taskExecutionQueue = v13->_taskExecutionQueue;
    v13->_taskExecutionQueue = (OS_dispatch_queue *)v23;

    v25 = (void *)MEMORY[0x24BDD17C8];
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bundleIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@.%@.stop"), v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_retainAutorelease(v30);
    v32 = (const char *)objc_msgSend(v31, "cStringUsingEncoding:", 4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = dispatch_queue_create(v32, v33);
    stopQueue = v13->_stopQueue;
    v13->_stopQueue = (OS_dispatch_queue *)v34;

  }
  return v13;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_2);
  return (id)_extensionAuxiliaryHostProtocol___interface;
}

void __60__MLRExtensionRemoteContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AAF7E0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface;
  _extensionAuxiliaryHostProtocol___interface = v0;

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_65);
  return (id)_extensionAuxiliaryVendorProtocol___interface;
}

void __62__MLRExtensionRemoteContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AAC228);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_performTask_sandBoxExtensions_completion_, 0, 0);

}

- (BOOL)loadPluginIfNecessaryWithError:(id *)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  -[MLRExtensionRemoteContext plugin](self, "plugin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 1;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "infoDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MLRuntimeTaskPrincipalClass"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    NSClassFromString(v9);
    v10 = (void *)objc_opt_new();
    if (v10)
    {
      -[MLRExtensionRemoteContext setPlugin:](self, "setPlugin:", v10);
      v11 = 0;
      v6 = 1;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLRExtensionRemoteContext loadPluginIfNecessaryWithError:].cold.2();

    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BE2D188];
    v20 = *MEMORY[0x24BDD0FC8];
    v21 = CFSTR("Cannot initiate MLRuntimeTaskPrincipalClass");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 8002, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MLRExtensionRemoteContext loadPluginIfNecessaryWithError:].cold.1();

    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BE2D188];
    v22 = *MEMORY[0x24BDD0FC8];
    v23[0] = CFSTR("No MLRuntimeTaskPrincipalClass Class found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 8001, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = 0;
LABEL_13:

  if (a3 && !v6)
    *a3 = objc_retainAutorelease(v11);

  return v6;
}

- (id)processTaskResult:(id)a3 forTask:(id)a4 duration:(double)a5 error:(id *)a6
{
  DESLogAndSetSunsetError();
  return 0;
}

- (id)createMLRTrialTaskWithTask:(id)a3
{
  id v3;
  MLRTrialTask *v4;

  v3 = a3;
  v4 = -[MLRTrialTask initWithTrialTask:]([MLRTrialTask alloc], "initWithTrialTask:", v3);

  return v4;
}

- (void)performSynchronouslyTrialTask:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  OS_os_transaction *v8;
  OS_os_transaction *taskTransaction;
  NSObject *v10;
  uint64_t v11;
  id *v12;
  BOOL v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  MLRInternalTrialTaskResult *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  dispatch_semaphore_t v34;
  void *v35;
  void *v36;
  OS_os_transaction *v37;
  NSObject *v38;
  void *v39;
  id *v40;
  char v41;
  MLRInternalTrialTaskResult *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  _QWORD v55[4];
  NSObject *v56;
  uint64_t *v57;
  uint64_t *v58;
  id v59;
  id obj;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;
  const __CFString *v78;
  uint64_t v79;
  _QWORD v80[4];

  v80[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = (OS_os_transaction *)os_transaction_create();
  taskTransaction = self->_taskTransaction;
  self->_taskTransaction = v8;

  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__1;
  v71 = __Block_byref_object_dispose__1;
  v72 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__1;
  v65 = __Block_byref_object_dispose__1;
  v66 = 0;
  objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[MLRExtensionRemoteContext performSynchronouslyTrialTask:completion:].cold.1((uint64_t)v6, v10, v11);

  v12 = (id *)(v68 + 5);
  obj = (id)v68[5];
  v13 = -[MLRExtensionRemoteContext loadPluginIfNecessaryWithError:](self, "loadPluginIfNecessaryWithError:", &obj);
  objc_storeStrong(v12, obj);
  if (v13)
  {
    -[MLRExtensionRemoteContext plugin](self, "plugin");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    -[MLRExtensionRemoteContext plugin](self, "plugin");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if (((v15 | v17) & 1) != 0)
    {
      v18 = (void *)MEMORY[0x212BD80FC]();
      -[MLRExtensionRemoteContext createMLRTrialTaskWithTask:](self, "createMLRTrialTaskWithTask:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        if ((v15 & 1) != 0)
        {
          -[MLRExtensionRemoteContext plugin](self, "plugin");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (id *)(v68 + 5);
          v59 = (id)v68[5];
          -[NSObject performTrialTask:outError:](v20, "performTrialTask:outError:", v19, &v59);
          v22 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v21, v59);
          v23 = v62[5];
          v62[5] = v22;
        }
        else
        {
          v34 = dispatch_semaphore_create(0);
          -[MLRExtensionRemoteContext plugin](self, "plugin");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v55[0] = MEMORY[0x24BDAC760];
          v55[1] = 3221225472;
          v55[2] = __70__MLRExtensionRemoteContext_performSynchronouslyTrialTask_completion___block_invoke;
          v55[3] = &unk_24CB926C0;
          v57 = &v61;
          v58 = &v67;
          v20 = v34;
          v56 = v20;
          objc_msgSend(v35, "performAsyncTrialTask:completionHandler:", v19, v55);

          dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
          v23 = v56;
        }

        if (v68[5])
        {
          objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            -[MLRExtensionRemoteContext plugin](self, "plugin");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_opt_class();
            v48 = v68[5];
            *(_DWORD *)buf = 138412546;
            v74 = v47;
            v75 = 2112;
            v76 = v48;
            _os_log_error_impl(&dword_2112F5000, v31, OS_LOG_TYPE_ERROR, "Plugin=%@ return error=%@", buf, 0x16u);

          }
        }
        else
        {
          if (!v62[5])
          {
            v28 = 0;
            goto LABEL_19;
          }
          objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            -[MLRExtensionRemoteContext plugin](self, "plugin");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_opt_class();
            v53 = v62[5];
            *(_DWORD *)buf = 138412546;
            v74 = v52;
            v75 = 2112;
            v76 = v53;
            _os_log_debug_impl(&dword_2112F5000, v38, OS_LOG_TYPE_DEBUG, "Plugin=%@ return result=%@", buf, 0x16u);

          }
          v39 = (void *)v62[5];
          v40 = (id *)(v68 + 5);
          v54 = (id)v68[5];
          v41 = objc_msgSend(v39, "submitForTask:error:", v19, &v54);
          objc_storeStrong(v40, v54);
          if ((v41 & 1) != 0)
          {
            v42 = [MLRInternalTrialTaskResult alloc];
            objc_msgSend((id)v62[5], "JSONResult");
            v31 = objc_claimAutoreleasedReturnValue();
            v28 = -[MLRInternalTrialTaskResult initWithJSONResult:](v42, "initWithJSONResult:", v31);
            goto LABEL_18;
          }
          objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            -[MLRExtensionRemoteContext plugin](self, "plugin");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_opt_class();
            v45 = v68[5];
            *(_DWORD *)buf = 138412546;
            v74 = v44;
            v75 = 2112;
            v76 = v45;
            _os_log_error_impl(&dword_2112F5000, v31, OS_LOG_TYPE_ERROR, "Fail to submit results for plugin=%@, error=%@", buf, 0x16u);

          }
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          -[MLRExtensionRemoteContext plugin](self, "plugin");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v74 = v50;
          _os_log_error_impl(&dword_2112F5000, v29, OS_LOG_TYPE_ERROR, "Cannot create MLRTrialTask for %@, missing entitlement?", buf, 0xCu);

        }
        v30 = (void *)MEMORY[0x24BDD1540];
        v77 = *MEMORY[0x24BDD0FC8];
        v78 = CFSTR("fail to create MLRTrialTask.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
        v31 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2D188], 8010, v31);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v68[5];
        v68[5] = v32;

      }
      v28 = 0;
LABEL_18:

LABEL_19:
      objc_autoreleasePoolPop(v18);
      goto LABEL_20;
    }
    v24 = (void *)MEMORY[0x24BDD1540];
    v79 = *MEMORY[0x24BDD0FC8];
    v80[0] = CFSTR("performTrialTask:outError: not implemented");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2D188], 8008, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v68[5];
    v68[5] = v26;

  }
  v28 = 0;
LABEL_20:
  MLRSanitizeError((void *)v68[5]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v28, v36);

  v37 = self->_taskTransaction;
  self->_taskTransaction = 0;

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

}

void __70__MLRExtensionRemoteContext_performSynchronouslyTrialTask_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)performTrialTask:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *taskExecutionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  taskExecutionQueue = self->_taskExecutionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__MLRExtensionRemoteContext_performTrialTask_completion___block_invoke;
  block[3] = &unk_24CB926E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(taskExecutionQueue, block);

}

uint64_t __57__MLRExtensionRemoteContext_performTrialTask_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSynchronouslyTrialTask:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)performSynchronouslyTask:(id)a3 sandBoxExtensions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  OS_os_transaction *v10;
  OS_os_transaction *taskTransaction;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  OS_os_transaction *v23;
  id *v25;
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = (OS_os_transaction *)os_transaction_create();
  taskTransaction = self->_taskTransaction;
  self->_taskTransaction = v10;

  objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[MLRExtensionRemoteContext performSynchronouslyTask:sandBoxExtensions:error:].cold.2(v8, v12);

  v28 = 0;
  v13 = -[MLRExtensionRemoteContext loadPluginIfNecessaryWithError:](self, "loadPluginIfNecessaryWithError:", &v28);
  v14 = v28;
  v15 = v14;
  if (!v13)
  {
    v16 = 0;
    v19 = 0;
    v18 = v14;
    if (!a5)
      goto LABEL_17;
    goto LABEL_15;
  }
  if (!objc_msgSend(v9, "count"))
  {
    v25 = a5;
    v16 = 0;
LABEL_10:
    v20 = (void *)MEMORY[0x212BD80FC]();
    -[MLRExtensionRemoteContext plugin](self, "plugin");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v15;
    objc_msgSend(v8, "performOnPlugin:error:", v21, &v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v26;

    objc_autoreleasePoolPop(v20);
    a5 = v25;
    if (!v25)
      goto LABEL_17;
    goto LABEL_15;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2D170]), "initWithExtensions:", v9);
  v27 = v15;
  v17 = objc_msgSend(v16, "consumeExtensionsWithError:", &v27);
  v18 = v27;

  if ((v17 & 1) != 0)
  {
    v25 = a5;
    v15 = v18;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[MLRExtensionRemoteContext performSynchronouslyTask:sandBoxExtensions:error:].cold.1((uint64_t)v9, (uint64_t)v18, v22);

  v19 = 0;
  if (a5)
  {
LABEL_15:
    if (v18)
      *a5 = objc_retainAutorelease(v18);
  }
LABEL_17:
  v23 = self->_taskTransaction;
  self->_taskTransaction = 0;

  return v19;
}

- (void)performTask:(id)a3 sandBoxExtensions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *taskExecutionQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  taskExecutionQueue = self->_taskExecutionQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __70__MLRExtensionRemoteContext_performTask_sandBoxExtensions_completion___block_invoke;
  v15[3] = &unk_24CB92710;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(taskExecutionQueue, v15);

}

void __70__MLRExtensionRemoteContext_performTask_sandBoxExtensions_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v9 = 0;
  objc_msgSend(v2, "performSynchronouslyTask:sandBoxExtensions:error:", v3, v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = a1[7];
  MLRSanitizeError(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v5, v8);

}

- (void)stopSynchronously
{
  OS_os_transaction *v3;
  OS_os_transaction *stopTransaction;
  NSObject *v5;
  void *v6;
  OS_os_transaction *v7;
  uint8_t v8[16];

  v3 = (OS_os_transaction *)os_transaction_create();
  stopTransaction = self->_stopTransaction;
  self->_stopTransaction = v3;

  objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2112F5000, v5, OS_LOG_TYPE_DEFAULT, "Request plugin to stop", v8, 2u);
  }

  -[MLRExtensionRemoteContext plugin](self, "plugin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stop");

  v7 = self->_stopTransaction;
  self->_stopTransaction = 0;

}

- (void)stop
{
  NSObject *stopQueue;
  _QWORD block[5];

  stopQueue = self->_stopQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__MLRExtensionRemoteContext_stop__block_invoke;
  block[3] = &unk_24CB92578;
  block[4] = self;
  dispatch_async(stopQueue, block);
}

uint64_t __33__MLRExtensionRemoteContext_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopSynchronously");
}

- (void)simulateCrash
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2112F5000, log, OS_LOG_TYPE_FAULT, "Plugin did not terminate in timely fashion when asked to stop. The plugin should exit on request", v1, 2u);
}

- (OS_os_transaction)taskTransaction
{
  return self->_taskTransaction;
}

- (void)setTaskTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_taskTransaction, a3);
}

- (OS_os_transaction)stopTransaction
{
  return self->_stopTransaction;
}

- (void)setStopTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_stopTransaction, a3);
}

- (MLRTaskPerforming)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
  objc_storeStrong((id *)&self->_plugin, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_stopTransaction, 0);
  objc_storeStrong((id *)&self->_taskTransaction, 0);
  objc_storeStrong((id *)&self->_stopQueue, 0);
  objc_storeStrong((id *)&self->_taskExecutionQueue, 0);
}

- (void)loadPluginIfNecessaryWithError:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_2112F5000, v1, v2, "No class (%@) found for bundle=%@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)loadPluginIfNecessaryWithError:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_2112F5000, v1, v2, "Cannot initiate class=%@ for bundle=%@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)performSynchronouslyTrialTask:(uint64_t)a3 completion:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_2_0(&dword_2112F5000, a2, a3, "Request plugin to start Trial task %@.", (uint8_t *)&v3);
}

- (void)performSynchronouslyTask:(uint64_t)a1 sandBoxExtensions:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_2112F5000, log, OS_LOG_TYPE_ERROR, "Fail to consume extensions for %@ with error=%@", (uint8_t *)&v3, 0x16u);
}

- (void)performSynchronouslyTask:(void *)a1 sandBoxExtensions:(NSObject *)a2 error:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "taskID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_2_0(&dword_2112F5000, a2, v4, "Request plugin to start task %@.", (uint8_t *)&v5);

}

@end
