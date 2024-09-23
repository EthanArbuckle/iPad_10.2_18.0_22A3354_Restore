@implementation ATXWatchFaceConfigurationCollector

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_17);
  return (id)sharedInstance_collector;
}

void __52__ATXWatchFaceConfigurationCollector_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_collector;
  sharedInstance_collector = v0;

}

- (ATXWatchFaceConfigurationCollector)init
{
  ATXWatchFaceConfigurationCollector *v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  ATXGenericFileBasedCache *fileCache;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *outputQueue;
  uint64_t v15;
  NSXPCConnection *connection;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)ATXWatchFaceConfigurationCollector;
  v2 = -[ATXWatchFaceConfigurationCollector init](&v18, sel_init);
  if (v2)
  {
    if ((objc_msgSend(MEMORY[0x1E0D81588], "isiPad") & 1) != 0)
    {
      __atxlog_handle_lock_screen();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[ATXWatchFaceConfigurationCollector init]";
        _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "%s: device is iPad, not initializing connection", buf, 0xCu);
      }
    }
    else
    {
      v4 = objc_alloc(MEMORY[0x1E0CF94C0]);
      objc_msgSend(MEMORY[0x1E0CF94D8], "watchFaceConfigurationCacheFilePath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_lock_screen();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "initWithCacheFilePath:loggingHandle:debugName:", v5, v6, CFSTR("watch faces"));
      fileCache = v2->_fileCache;
      v2->_fileCache = (ATXGenericFileBasedCache *)v7;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = dispatch_queue_create("com.apple.proactive.ATXWatchFaceConfigurationCollector", v9);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v10;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = dispatch_queue_create("com.apple.proactive.ATXWatchFaceConfigurationCollector.Output", v12);
      outputQueue = v2->_outputQueue;
      v2->_outputQueue = (OS_dispatch_queue *)v13;

      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nanotimekit.devicelibraryserver"), 4096);
      connection = v2->_connection;
      v2->_connection = (NSXPCConnection *)v15;

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7C79B0);
      v3 = objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v3);
      -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &__block_literal_global_140);
      -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global_142);
      -[NSXPCConnection resume](v2->_connection, "resume");
    }

  }
  return v2;
}

void __42__ATXWatchFaceConfigurationCollector_init__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  __int16 v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_lock_screen();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315394;
    v2 = "-[ATXWatchFaceConfigurationCollector init]_block_invoke";
    v3 = 2112;
    v4 = CFSTR("com.apple.nanotimekit.devicelibraryserver");
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "%s: connection to %@ invalidated", (uint8_t *)&v1, 0x16u);
  }

}

void __42__ATXWatchFaceConfigurationCollector_init__block_invoke_141()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_lock_screen();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __42__ATXWatchFaceConfigurationCollector_init__block_invoke_141_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)refreshWithCompletion:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    if (v4)
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }
  else
  {
    connection = self->_connection;
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke;
    v11[3] = &unk_1E4D571E0;
    v7 = v4;
    v12 = v7;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_144;
    v9[3] = &unk_1E4D587D0;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "fetchLibraryAsJSON:", v9);

  }
}

void __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    v38 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v38);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v38;
    if (v9 || !v8)
    {
      __atxlog_handle_lock_screen();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v8;
        __atxlog_handle_lock_screen();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v40 = "-[ATXWatchFaceConfigurationCollector refreshWithCompletion:]_block_invoke";
          v41 = 2112;
          v42 = v10;
          _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "%s: retrieved JSON array: %@", buf, 0x16u);
        }

        v12 = MEMORY[0x1E0C809B0];
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_153;
        v37[3] = &unk_1E4D58758;
        v37[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v10, "_pas_mappedArrayWithTransform:", v37);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(void **)(a1 + 40);
        v16 = *(NSObject **)(v14 + 24);
        v33[0] = v12;
        v33[1] = 3221225472;
        v33[2] = __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_2;
        v33[3] = &unk_1E4D587A8;
        v33[4] = v14;
        v34 = v13;
        v35 = v10;
        v36 = v15;
        v17 = v10;
        v18 = v13;
        dispatch_async(v16, v33);

        v9 = 0;
LABEL_21:

        goto LABEL_22;
      }
      __atxlog_handle_lock_screen();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_144_cold_2(v22, v23, v24, v25, v26, v27, v28, v29);

      v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v43 = *MEMORY[0x1E0CB2D50];
      v44[0] = CFSTR("JSON is not an array");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", CFSTR("ATXWatchFaceConfigurationCollector"), 1, v31);

      __atxlog_handle_lock_screen();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        v32 = *(_QWORD *)(a1 + 40);
        if (v32)
          (*(void (**)(uint64_t, _QWORD, id))(v32 + 16))(v32, 0, v9);
        goto LABEL_21;
      }
    }
    __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_144_cold_1();
    goto LABEL_19;
  }
  __atxlog_handle_lock_screen();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_144_cold_4();

  v20 = *(_QWORD *)(a1 + 40);
  if (v20)
    (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v7);
LABEL_22:

}

id __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_153(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "_watchFaceFromJSONObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_queue_writeWatchFacesToDisk:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_3;
    v4[3] = &unk_1E4D58780;
    v6 = v2;
    v5 = *(id *)(a1 + 48);
    dispatch_async(v3, v4);

  }
}

uint64_t __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (NSArray)watchFaces
{
  NSObject *queue;
  id v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if ((objc_msgSend(MEMORY[0x1E0D81588], "isiPad") & 1) != 0)
    return (NSArray *)0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__ATXWatchFaceConfigurationCollector_watchFaces__block_invoke;
  v6[3] = &unk_1E4D587F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v5 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v5;
}

void __48__ATXWatchFaceConfigurationCollector_watchFaces__block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(id **)(a1 + 32);
  if (v2[5])
  {
    v3 = objc_msgSend(v2[5], "copy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    __atxlog_handle_lock_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "-[ATXWatchFaceConfigurationCollector watchFaces]_block_invoke";
      _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "%s: returning in-memory watchfaces", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v2, "_queue_readWatchFacesFromDisk");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    __atxlog_handle_lock_screen();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v14 = 136315394;
      v15 = "-[ATXWatchFaceConfigurationCollector watchFaces]_block_invoke";
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "%s: read watch faces from disk: %@", (uint8_t *)&v14, 0x16u);
    }

    v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(NSObject **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;
  }

}

+ (id)_watchFaceFromJSONObject:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXWatchFace *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  ATXWatchFace *v24;
  void *v25;
  void *v27;
  unsigned int v28;
  void *v29;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("faceJSON"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("selected"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_lock_screen();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[ATXWatchFaceConfigurationCollector _watchFaceFromJSONObject:].cold.1();

      v14 = 0;
      goto LABEL_32;
    }
    v8 = v5;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("face type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bundle id"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("customization"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v28 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("customization"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("content"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("content"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("color"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("color"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }

    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("astronomy")) & 1) != 0)
    {
      v20 = 1;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("spectrum-analog")) & 1) != 0)
    {
      v20 = 2;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("color")) & 1) != 0
           || (objc_msgSend(v10, "isEqualToString:", CFSTR("color-rich")) & 1) != 0)
    {
      v20 = 10;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("photos")) & 1) != 0)
    {
      v20 = 3;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("pride")) & 1) != 0)
    {
      v20 = 4;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("pride analog")) & 1) != 0
           || (objc_msgSend(v10, "isEqualToString:", CFSTR("pride analog rich")) & 1) != 0)
    {
      v20 = 11;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("big-numerals-analog"))
           && (objc_msgSend(v19, "isEqualToString:", CFSTR("multicolor gradient 1")) & 1) != 0)
    {
      v20 = 14;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("big-numerals-digital"))
           && (objc_msgSend(v19, "isEqualToString:", CFSTR("multicolor gradient 1")) & 1) != 0)
    {
      v20 = 15;
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("california"))
        || (objc_msgSend(v19, "isEqualToString:", CFSTR("style 10")) & 1) == 0)
      {
        v27 = v29;
        if (objc_msgSend(v29, "length"))
        {
          if (objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.NTKAegirFaceBundle")))
          {
            if ((objc_msgSend(v17, "isEqualToString:", CFSTR("earth")) & 1) != 0)
            {
              v20 = 7;
              goto LABEL_25;
            }
            if ((objc_msgSend(v17, "isEqualToString:", CFSTR("luna")) & 1) != 0)
            {
              v20 = 8;
              goto LABEL_25;
            }
            if ((objc_msgSend(v17, "isEqualToString:", CFSTR("orrery")) & 1) != 0)
            {
              v20 = 9;
              goto LABEL_25;
            }
            v27 = v29;
            if ((objc_msgSend(v17, "isEqualToString:", CFSTR("random")) & 1) != 0)
            {
              v20 = 17;
              goto LABEL_25;
            }
          }
          if ((objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.NanoTimeKit.NTKPrideWeaveFaceBundle")) & 1) != 0)
          {
            v20 = 13;
            goto LABEL_25;
          }
          if ((objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.NTKLilypadFaceBundle")) & 1) != 0)
          {
            v20 = 12;
            goto LABEL_25;
          }
          if ((objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.NTKRenegadeFaceBundle")) & 1) != 0)
          {
            v20 = 5;
            goto LABEL_25;
          }
          if ((objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.NTKColtanFaceBundle")) & 1) != 0)
          {
            v20 = 6;
            goto LABEL_25;
          }
        }
        v20 = 0;
        goto LABEL_25;
      }
      v20 = 16;
    }
LABEL_25:

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("complications"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "allValues");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_pas_mappedArrayWithTransform:", &__block_literal_global_157);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }
    v24 = [ATXWatchFace alloc];
    if (v23)
      v25 = v23;
    else
      v25 = (void *)MEMORY[0x1E0C9AA60];
    v14 = -[ATXWatchFace initWithStyle:complications:selected:](v24, "initWithStyle:complications:selected:", v20, v25, v28);

LABEL_32:
    goto LABEL_33;
  }
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[ATXWatchFaceConfigurationCollector _watchFaceFromJSONObject:].cold.2();
  v14 = 0;
LABEL_33:

  return v14;
}

id __63__ATXWatchFaceConfigurationCollector__watchFaceFromJSONObject___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("app"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend(&unk_1E4DC2DF0, "objectForKeyedSubscript:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v5)
        v7 = (void *)v5;
      else
        v7 = v4;
      v8 = v7;

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

- (id)_queue_readWatchFacesFromDisk
{
  ATXGenericFileBasedCache *fileCache;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  fileCache = self->_fileCache;
  v4 = (void *)MEMORY[0x1A85A4F90]();
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v4);
  -[ATXGenericFileBasedCache readSecureCodedObjectWithMaxValidAge:allowableClasses:error:](fileCache, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v7, 0, -1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_queue_writeWatchFacesToDisk:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[ATXGenericFileBasedCache storeSecureCodedObject:error:](self->_fileCache, "storeSecureCodedObject:error:", v5, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_watchFaces, 0);
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_fileCache, 0);
}

void __42__ATXWatchFaceConfigurationCollector_init__block_invoke_141_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, a1, a3, "%s: connection to %@ interrupted", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "%s: unable to grab remote object proxy: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_144_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "%s: could not deserialize json: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_144_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, a1, a3, "%s: could not deserialize json: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_144_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "%s: error fetching library as JSON: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_watchFaceFromJSONObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "%s: faceJSON object is not a dictionary: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_watchFaceFromJSONObject:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "%s: watch face JSON object is not a dictionary: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
