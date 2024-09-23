@implementation _GCGenericDeviceDB

- (void)hasModelForDevice:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, BOOL, _QWORD);
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = (void (**)(id, BOOL, _QWORD))a4;
  v8 = _os_activity_create(&dword_1DC79E000, "[_GCGenericDeviceDB/XPC] Has Model For Device", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[_GCGenericDeviceDB modelForDevice:](self, "modelForDevice:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v9 != 0, 0);

  os_activity_scope_leave(&v10);
}

- (void)preparedModelForDevice:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = _os_activity_create(&dword_1DC79E000, "[_GCGenericDeviceDB/XPC] Model For Device", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v12 = 0;
  -[_GCGenericDeviceDB preparedModelForDevice:error:](self, "preparedModelForDevice:error:", v6, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;
  v11 = v10;
  if (!v9 && v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[_GCGenericDeviceDB(XPC) preparedModelForDevice:reply:].cold.1((uint64_t)v11);
  v7[2](v7, v9, v11);

  os_activity_scope_leave(&state);
}

- (_GCGenericDeviceDB)initWithProvider:(id)a3
{
  id v4;
  id v5;
  dispatch_workloop_t v6;
  void *v7;
  dispatch_queue_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  dispatch_source_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  dispatch_block_t v23;
  _QWORD block[4];
  id v26;
  _QWORD handler[4];
  id v28;
  id location;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_GCGenericDeviceDB;
  v5 = -[_GCGenericDeviceDB init](&v30, sel_init);
  v6 = dispatch_workloop_create("Workloop.GenericDeviceDB");
  v7 = (void *)*((_QWORD *)v5 + 1);
  *((_QWORD *)v5 + 1) = v6;

  v8 = dispatch_queue_create("GenericDevice.DB", 0);
  v9 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v8;

  v10 = objc_opt_new();
  v11 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v10;

  objc_initWeak(&location, v5);
  +[NSNotificationCenter defaultCenter](&off_1F03AABE0, "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v4;
  v14 = (objc_class *)objc_opt_class();
  GCLookupService(v13, v14, 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "configurationBundleLocatorForType:", 0x1EA4D51A8);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v16;

  v18 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, *((dispatch_queue_t *)v5 + 1));
  v19 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = v18;

  v20 = *((_QWORD *)v5 + 4);
  v21 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __39___GCGenericDeviceDB_initWithProvider___block_invoke;
  handler[3] = &unk_1EA4D3BF8;
  objc_copyWeak(&v28, &location);
  dispatch_source_set_event_handler(v20, handler);
  dispatch_activate(*((dispatch_object_t *)v5 + 4));
  objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel__configurationBundlesDidChange_, 0x1EA4D8268, *((_QWORD *)v5 + 3));
  objc_destroyWeak(&v28);

  v22 = *((_QWORD *)v5 + 1);
  block[0] = v21;
  block[1] = 3221225472;
  block[2] = __39___GCGenericDeviceDB_initWithProvider___block_invoke_3;
  block[3] = &unk_1EA4D3BF8;
  objc_copyWeak(&v26, &location);
  v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_UTILITY, -10, block);
  dispatch_async(v22, v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return (_GCGenericDeviceDB *)v5;
}

- (_GCGenericDeviceDB)init
{
  -[_GCGenericDeviceDB doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[NSNotificationCenter defaultCenter](&off_1F03AABE0, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1EA4D8268, self->_configurationBundleLocator);

  dispatch_source_cancel((dispatch_source_t)self->_configurationBundleLocatorUpdatedSource);
  v4.receiver = self;
  v4.super_class = (Class)_GCGenericDeviceDB;
  -[_GCGenericDeviceDB dealloc](&v4, sel_dealloc);
}

- (id)configurationBundles
{
  void *v2;
  void *v3;

  objc_getProperty(self, a2, 40, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationBundles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_onqueue_loadConfigurationBundlesIfNeeded
{
  void *v2;
  uint64_t v3;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 40), "configurationBundles");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    if (!v3)
      objc_msgSend((id)a1, "_onqueue_updateConfigurationBundles");
  }
}

- (BOOL)_onqueue_updateConfigurationBundles
{
  void *v4;
  NSObject *v5;
  char v6;
  void *v7;
  char v8;
  _GCDeviceOnDiskDB *v9;
  NSObject *v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[_GCConfigurationBundleLocator fetchBundles](self->_configurationBundleLocator, "fetchBundles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "waitUntilFinished") == 1)
  {
    _gc_log_devicedb();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_GCGenericDeviceDB _onqueue_updateConfigurationBundles].cold.1(v4, v5);
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "result");
    v5 = objc_claimAutoreleasedReturnValue();
    -[_GCDeviceOnDiskDB configurationBundles](self->_onDiskDB, "configurationBundles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v5);

    if ((v8 & 1) == 0)
    {
      v9 = -[_GCDeviceOnDiskDB initWithBundles:]([_GCDeviceOnDiskDB alloc], "initWithBundles:", v5);
      _gc_log_devicedb();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[_GCGenericDeviceDB _onqueue_updateConfigurationBundles].cold.2((uint64_t)v9, v10);

      objc_setProperty_atomic(self, a2, v9, 40);
    }
    v6 = v8 ^ 1;
  }

  return v6;
}

- (void)_configurationBundlesDidChange:(id)a3
{
  dispatch_source_merge_data((dispatch_source_t)self->_configurationBundleLocatorUpdatedSource, 1uLL);
}

- (id)modelForDevice:(id)a3
{
  NSObject *queue;
  id v6;
  void *v7;
  void *v8;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37___GCGenericDeviceDB_modelForDevice___block_invoke;
  block[3] = &unk_1EA4D2DB8;
  block[4] = self;
  v6 = a3;
  dispatch_async_and_wait(queue, block);
  objc_getProperty(self, a2, 40, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bestModelMatchingDevice:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)preparedModelForDevice:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_GCGenericDeviceDB modelForDevice:](self, "modelForDevice:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "elements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__17;
    v23 = __Block_byref_object_dispose__17;
    v24 = 0;
    objc_msgSend(v7, "driver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "elements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51___GCGenericDeviceDB_preparedModelForDevice_error___block_invoke;
    v16[3] = &unk_1EA4D4850;
    v11 = v8;
    v17 = v11;
    v18 = &v19;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v16);

    v12 = (void *)v20[5];
    if (v12)
    {
      v13 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      v13 = v7;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    if (!a4)
    {
      v13 = 0;
      goto LABEL_10;
    }
    v14 = *MEMORY[0x1E0CB2D68];
    v25[0] = *MEMORY[0x1E0CB2D50];
    v25[1] = v14;
    v26[0] = CFSTR("Error retrieving model for device.");
    v26[1] = CFSTR("No compatible model found.");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 2, v11);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v13;
}

- (id)hasModelForDevice:(id)a3
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  -[_GCGenericDeviceDB modelForDevice:](self, "modelForDevice:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  +[NSNumber numberWithBool:](&off_1F03A9E90, "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GCFuture futureWithResult:](GCFuture, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)preparedModelForDevice:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v7;

  v7 = 0;
  -[_GCGenericDeviceDB preparedModelForDevice:error:](self, "preparedModelForDevice:error:", a3, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v3)
    +[GCFuture futureWithResult:](GCFuture, "futureWithResult:", v3);
  else
    +[GCFuture futureWithError:](GCFuture, "futureWithError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDiskDB, 0);
  objc_storeStrong((id *)&self->_configurationBundleLocatorUpdatedSource, 0);
  objc_storeStrong((id *)&self->_configurationBundleLocator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
}

- (void)_onqueue_updateConfigurationBundles
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DC79E000, a2, OS_LOG_TYPE_DEBUG, "New DB: %@.", (uint8_t *)&v2, 0xCu);
}

@end
