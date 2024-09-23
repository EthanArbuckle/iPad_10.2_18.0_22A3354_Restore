@implementation _GCConfigurationBundleLocator

- (_GCConfigurationBundleLocator)initWithConfigurationType:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  dispatch_queue_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  dispatch_source_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  dispatch_source_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  dispatch_block_t v33;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD block[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD handler[4];
  id v56;
  id location;
  objc_super v58;

  v6 = a3;
  v7 = a4;
  v58.receiver = self;
  v58.super_class = (Class)_GCConfigurationBundleLocator;
  v8 = -[_GCConfigurationBundleLocator init](&v58, sel_init);
  v9 = objc_msgSend(v6, "copy");
  v10 = (void *)*((_QWORD *)v8 + 11);
  *((_QWORD *)v8 + 11) = v9;

  v11 = objc_retainAutorelease(v6);
  gc_log_create_configuration((char *)objc_msgSend(v11, "UTF8String"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)*((_QWORD *)v8 + 1);
  *((_QWORD *)v8 + 1) = v12;

  GCLookupDispatchWorkloop(v7, 1);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)*((_QWORD *)v8 + 2);
  *((_QWORD *)v8 + 2) = v14;

  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("ConfigBundleLocator:%@"), v11);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
  v18 = (void *)*((_QWORD *)v8 + 3);
  *((_QWORD *)v8 + 3) = v17;

  v19 = (void *)*((_QWORD *)v8 + 4);
  *((_QWORD *)v8 + 4) = MEMORY[0x1E0C9AA60];

  objc_initWeak(&location, v8);
  +[NSNotificationCenter defaultCenter](&off_1F03AABE0, "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  GCLookupService(v7, (objc_class *)&unk_1F03A10A0, 0, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)*((_QWORD *)v8 + 6);
  *((_QWORD *)v8 + 6) = v21;

  v23 = MEMORY[0x1E0C809B0];
  if (*((_QWORD *)v8 + 6))
  {
    v24 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, *((dispatch_queue_t *)v8 + 2));
    v25 = (void *)*((_QWORD *)v8 + 5);
    *((_QWORD *)v8 + 5) = v24;

    v26 = *((_QWORD *)v8 + 5);
    handler[0] = v23;
    handler[1] = 3221225472;
    handler[2] = __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke;
    handler[3] = &unk_1EA4D3BF8;
    objc_copyWeak(&v56, &location);
    dispatch_source_set_event_handler(v26, handler);
    dispatch_activate(*((dispatch_object_t *)v8 + 5));
    objc_msgSend(v20, "addObserver:selector:name:object:", v8, sel__filesystemDidChange_, CFSTR("GCConfigurationBundleSourceBundlesDidChangeNotification"), *((_QWORD *)v8 + 6));
    objc_destroyWeak(&v56);
  }
  else if (os_variant_has_internal_diagnostics())
  {
    v35 = *((_QWORD *)v8 + 1);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[_GCConfigurationBundleLocator initWithConfigurationType:provider:].cold.2(v35, v36, v37, v38, v39, v40, v41, v42);
  }
  GCLookupService(v7, (objc_class *)&unk_1F03A9870, 0, 0);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)*((_QWORD *)v8 + 9);
  *((_QWORD *)v8 + 9) = v27;

  if (*((_QWORD *)v8 + 9))
  {
    v29 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, *((dispatch_queue_t *)v8 + 2));
    v30 = (void *)*((_QWORD *)v8 + 8);
    *((_QWORD *)v8 + 8) = v29;

    v31 = *((_QWORD *)v8 + 8);
    v53[0] = v23;
    v53[1] = 3221225472;
    v53[2] = __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_8;
    v53[3] = &unk_1EA4D3BF8;
    objc_copyWeak(&v54, &location);
    dispatch_source_set_event_handler(v31, v53);
    dispatch_activate(*((dispatch_object_t *)v8 + 8));
    objc_msgSend(v20, "addObserver:selector:name:object:", v8, sel__assetDidChange_, CFSTR("GCConfigurationBundleSourceBundlesDidChangeNotification"), *((_QWORD *)v8 + 9));
    objc_destroyWeak(&v54);
  }
  else if (os_variant_has_internal_diagnostics())
  {
    v43 = *((_QWORD *)v8 + 1);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      -[_GCConfigurationBundleLocator initWithConfigurationType:provider:].cold.1(v43, v44, v45, v46, v47, v48, v49, v50);
  }
  v32 = *((_QWORD *)v8 + 2);
  block[0] = v23;
  block[1] = 3221225472;
  block[2] = __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_11;
  block[3] = &unk_1EA4D3BF8;
  objc_copyWeak(&v52, &location);
  v33 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_UTILITY, -10, block);
  dispatch_async(v32, v33);

  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);

  return (_GCConfigurationBundleLocator *)v8;
}

- (uint64_t)_onqueue_filesystem_updateBundles
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v1 = a1;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    v2 = *(id *)(v1 + 48);
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "configurationBundleURLsForType:", *(_QWORD *)(v1 + 88));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "waitUntilFinished") == 1)
      {
        v5 = *(NSObject **)(v1 + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          -[_GCConfigurationBundleLocator _onqueue_filesystem_updateBundles].cold.1(v5, v4);
        v1 = 0;
      }
      else
      {
        objc_msgSend(v4, "result");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke;
        v9[3] = &unk_1EA4D3C48;
        v9[4] = v1;
        objc_msgSend(v6, "gc_arrayByTransformingElementsWithOptions:usingBlock:", 1, v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(*(os_log_t *)(v1 + 8), OS_LOG_TYPE_DEBUG))
          -[_GCConfigurationBundleLocator _onqueue_filesystem_updateBundles].cold.2();
        if ((objc_msgSend(v7, "count") || objc_msgSend(*(id *)(v1 + 56), "count"))
          && (objc_msgSend(v7, "isEqual:", *(_QWORD *)(v1 + 56)) & 1) == 0)
        {
          objc_setProperty_atomic((id)v1, sel__onqueue_filesystem_updateBundles, v7, 56);
          v1 = 1;
        }
        else
        {
          v1 = 0;
        }

      }
    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (void)_onqueue_rebuildBundleCollection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_getProperty(a1, sel__onqueue_rebuildBundleCollection, 56, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getProperty(a1, sel__onqueue_rebuildBundleCollection, 80, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_opt_new();
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "addObjectsFromArray:", v3);
    if (v2)
      objc_msgSend(v5, "addObjectsFromArray:", v2);
    v6 = a1[1];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      *(_DWORD *)buf = 134217984;
      v11 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1DC79E000, v7, OS_LOG_TYPE_INFO, "Now tracking %llu bundles.", buf, 0xCu);

    }
    objc_setProperty_atomic(a1, sel__onqueue_rebuildBundleCollection, v5, 32);
    v8 = a1[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65___GCConfigurationBundleLocator__onqueue_rebuildBundleCollection__block_invoke;
    block[3] = &unk_1EA4D2DB8;
    block[4] = a1;
    dispatch_async(v8, block);

  }
}

- (uint64_t)_onqueue_asset_updateBundles
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v1 = a1;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    v2 = *(id *)(v1 + 72);
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "configurationBundleURLsForType:", *(_QWORD *)(v1 + 88));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "waitUntilFinished") == 1)
      {
        v5 = *(NSObject **)(v1 + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          -[_GCConfigurationBundleLocator _onqueue_asset_updateBundles].cold.1((uint64_t)v3, v5, v4);
        v1 = 0;
      }
      else
      {
        objc_msgSend(v4, "result");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __61___GCConfigurationBundleLocator__onqueue_asset_updateBundles__block_invoke;
        v9[3] = &unk_1EA4D3C48;
        v9[4] = v1;
        objc_msgSend(v6, "gc_arrayByTransformingElementsWithOptions:usingBlock:", 1, v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(*(os_log_t *)(v1 + 8), OS_LOG_TYPE_DEBUG))
          -[_GCConfigurationBundleLocator _onqueue_asset_updateBundles].cold.2();
        if ((objc_msgSend(v7, "count") || objc_msgSend(*(id *)(v1 + 80), "count"))
          && (objc_msgSend(v7, "isEqual:", *(_QWORD *)(v1 + 80)) & 1) == 0)
        {
          objc_setProperty_atomic((id)v1, sel__onqueue_asset_updateBundles, v7, 80);
          v1 = 1;
        }
        else
        {
          v1 = 0;
        }

      }
    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (void)_onqueue_loadBundlesIfNeeded
{
  int updated;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    if (*(_QWORD *)(a1 + 48) && !*(_QWORD *)(a1 + 56))
      updated = -[_GCConfigurationBundleLocator _onqueue_filesystem_updateBundles](a1);
    else
      updated = 0;
    if (!*(_QWORD *)(a1 + 72) || *(_QWORD *)(a1 + 80))
    {
      if (!updated)
        return;
      goto LABEL_9;
    }
    if (((updated | -[_GCConfigurationBundleLocator _onqueue_asset_updateBundles](a1)) & 1) != 0)
LABEL_9:
      -[_GCConfigurationBundleLocator _onqueue_rebuildBundleCollection]((_QWORD *)a1);
  }
}

- (_GCConfigurationBundleLocator)init
{
  -[_GCConfigurationBundleLocator doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[NSNotificationCenter defaultCenter](&off_1F03AABE0, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_filesystemSource)
  {
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("GCConfigurationBundleSourceBundlesDidChangeNotification"));
    dispatch_source_cancel((dispatch_source_t)self->_filesystemChangedEventSource);
  }
  if (self->_assetSource)
  {
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("GCConfigurationBundleSourceBundlesDidChangeNotification"));
    dispatch_source_cancel((dispatch_source_t)self->_assetsChangedEventSource);
  }

  v5.receiver = self;
  v5.super_class = (Class)_GCConfigurationBundleLocator;
  -[_GCConfigurationBundleLocator dealloc](&v5, sel_dealloc);
}

- (id)fetchBundles
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;
  _QWORD v12[5];

  objc_getProperty(self, a2, 56, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getProperty(self, a2, 80, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getProperty(self, a2, 32, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_filesystemSource)
    v8 = v4 == 0;
  else
    v8 = 0;
  if (v8 || self->_assetSource && !v5 || !objc_msgSend(v6, "count"))
  {
    v10 = -[GCOperation initOnQueue:withOptions:]([GCOperation alloc], "initOnQueue:withOptions:", self->_workloop, 256);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45___GCConfigurationBundleLocator_fetchBundles__block_invoke;
    v12[3] = &unk_1EA4D3C20;
    v12[4] = self;
    objc_msgSend(v10, "setSyncBlock:", v12);
    objc_msgSend(v10, "activate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[GCFuture futureWithResult:](GCFuture, "futureWithResult:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_filesystemDidChange:(id)a3
{
  dispatch_source_merge_data((dispatch_source_t)self->_filesystemChangedEventSource, 1uLL);
}

- (void)_assetDidChange:(id)a3
{
  dispatch_source_merge_data((dispatch_source_t)self->_assetsChangedEventSource, 1uLL);
}

- (NSString)configurationType
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationType, 0);
  objc_storeStrong((id *)&self->_assetBundles, 0);
  objc_storeStrong((id *)&self->_assetSource, 0);
  objc_storeStrong((id *)&self->_assetsChangedEventSource, 0);
  objc_storeStrong((id *)&self->_filesystemBundles, 0);
  objc_storeStrong((id *)&self->_filesystemSource, 0);
  objc_storeStrong((id *)&self->_filesystemChangedEventSource, 0);
  objc_storeStrong((id *)&self->_mergedBundles, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)initWithConfigurationType:(uint64_t)a3 provider:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1DC79E000, a1, a3, "No asset source.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)initWithConfigurationType:(uint64_t)a3 provider:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1DC79E000, a1, a3, "No file system source.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)_onqueue_filesystem_updateBundles
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_1DC79E000, v0, v1, "[Source/FS] New bundles: %@.", v2);
}

- (void)_onqueue_asset_updateBundles
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_1DC79E000, v0, v1, "[Source/Asset] New configuration bundles: %@.", v2);
}

@end
