@implementation GEOTileServerRemoteProxy

- (void)generateRequestedFromTileLoaderBeginSignpost:(os_signpost_id_t)a3 tileKey:(uint64_t)a4 options:(char)a5
{
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v11;
  uint8_t buf[2];

  GEOGetTileLoadingLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((a5 & 0x40) != 0)
  {
    if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      v9 = "PreliminaryOnly=1";
      v10 = buf;
      goto LABEL_8;
    }
  }
  else if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v11 = 0;
    v9 = (const char *)&unk_189D97683;
    v10 = (uint8_t *)&v11;
LABEL_8:
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, a3, "TileLoaderRequest.client", v9, v10, 2u);
  }

}

void __40__GEOTileServerRemoteProxy__handleTile___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  __int128 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "proxy:loadedTile:forKey:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &v3, *(_QWORD *)(a1 + 48));

}

- (void)generateRequestedFromTileLoaderEndSignpost:(unint64_t)a3
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  GEOGetTileLoadingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v5, OS_SIGNPOST_INTERVAL_END, a3, "TileLoaderRequest.client", (const char *)&unk_189D97683, v6, 2u);
  }

}

- (void)loadTiles:(id)a3 batchID:(int)a4 priorities:(const unsigned int *)a5 hasAdditionalInfos:(const BOOL *)a6 additionalInfos:(const GEOTileLoaderAdditionalInfo *)a7 signpostIDs:(const unint64_t *)a8 createTimes:(const double *)a9 reason:(unsigned __int8)a10 options:(unint64_t)a11 auditToken:(id)a12
{
  __int16 v18;
  id v19;
  id v20;
  xpc_object_t v21;
  void *v22;
  void *v23;
  id v24;
  GEOTileServerRemoteProxy *v25;
  const unsigned int *v26;
  const BOOL *v27;
  const unint64_t *v28;
  id v29;
  uint64_t v30;
  void *v31;
  size_t v32;
  const void *v33;
  xpc_object_t v34;
  xpc_object_t v35;
  xpc_object_t v36;
  xpc_object_t v37;
  xpc_object_t v38;
  void *v39;
  NSObject *v40;
  OS_dispatch_queue *connectionIncomingQueue;
  uint64_t v42;
  const GEOTileLoaderAdditionalInfo *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v18 = a11;
  v49 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a12;
  v21 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v21, "message", "tiles.lt");
  v45 = v20;
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v19;
      v25 = self;
      v26 = a5;
      v27 = a6;
      v28 = a8;
      v29 = objc_retainAutorelease(v22);
      v43 = a7;
      v30 = objc_msgSend(v29, "bytes");
      v31 = v29;
      a8 = v28;
      a6 = v27;
      a5 = v26;
      self = v25;
      v19 = v24;
      v18 = a11;
      v32 = objc_msgSend(v31, "length");
      v33 = (const void *)v30;
      a7 = v43;
      xpc_dictionary_set_data(v21, "__audit_token", v33, v32);
    }

  }
  v44 = (void *)objc_msgSend(v19, "newXPCData");
  xpc_dictionary_set_value(v21, "list", v44);
  xpc_dictionary_set_int64(v21, "batch", a4);
  v34 = xpc_data_create(a5, 4 * objc_msgSend(v19, "count"));
  xpc_dictionary_set_value(v21, "priorities", v34);
  v35 = xpc_data_create(a6, objc_msgSend(v19, "count"));
  xpc_dictionary_set_value(v21, "has_additional_infos", v35);
  v36 = xpc_data_create(a7, 16 * objc_msgSend(v19, "count"));
  xpc_dictionary_set_value(v21, "additional_infos", v36);
  v37 = xpc_data_create(a8, 8 * objc_msgSend(v19, "count"));
  xpc_dictionary_set_value(v21, "signposts", v37);
  if (a9)
  {
    v38 = xpc_data_create(a9, 8 * objc_msgSend(v19, "count"));
    xpc_dictionary_set_value(v21, "ctime", v38);

  }
  xpc_dictionary_set_uint64(v21, "reason", a10);
  xpc_dictionary_set_BOOL(v21, "disk", v18 & 1);
  xpc_dictionary_set_BOOL(v21, "net", (v18 & 2) != 0);
  xpc_dictionary_set_BOOL(v21, "wifi", (v18 & 8) != 0);
  xpc_dictionary_set_BOOL(v21, "preload", (v18 & 4) != 0);
  if ((v18 & 0x100) != 0)
    xpc_dictionary_set_BOOL(v21, "proactively_load_on_failure", 1);
  setManifestConfiguration(v21, self->super._manifestConfiguration);
  setLocale(v21, self->super._locale);
  v39 = (void *)MEMORY[0x18D765864](v21);
  GEOGetTileServerRemoteProxyLog();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v48 = v39;
    _os_log_impl(&dword_1885A9000, v40, OS_LOG_TYPE_DEBUG, "load tiles: %s", buf, 0xCu);
  }

  free(v39);
  connectionIncomingQueue = self->_connectionIncomingQueue;
  v42 = *(_QWORD *)&self->_diskCacheDeletedExternalDataNotifyToken;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __142__GEOTileServerRemoteProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke;
  v46[3] = &unk_1E1C093A8;
  v46[4] = self;
  -[OS_dispatch_queue sendMessage:withReply:handler:](connectionIncomingQueue, "sendMessage:withReply:handler:", v21, v42, v46);

}

- (void)cancel:(const void *)a3 batchID:(int)a4
{
  xpc_object_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "message", "tiles.x");
  xpc_dictionary_set_data(v7, "key", a3, 0x10uLL);
  xpc_dictionary_set_int64(v7, "batch", a4);
  setManifestConfiguration(v7, a1[3]);
  setLocale(v7, a1[4]);
  v8 = (void *)MEMORY[0x18D765864](v7);
  GEOGetTileServerRemoteProxyLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315138;
    v11 = v8;
    _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEBUG, "cancel load: %s", (uint8_t *)&v10, 0xCu);
  }

  free(v8);
  objc_msgSend(a1[7], "sendMessage:", v7);

}

void __123__GEOTileServerRemoteProxy_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleEvent:", v3);

}

- (void)_handleEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  char *v8;
  NSObject *v9;
  uint64_t v10;
  const char *string;
  const char *v12;
  NSObject *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  NSObject *delegateQueue;
  id v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x18D764E2C]();
  GEOGetTileServerRemoteProxyLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

  if (v7)
  {
    v8 = (char *)MEMORY[0x18D765864](v4);
    GEOGetTileServerRemoteProxyLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v24 = v8;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEBUG, "event: %s", buf, 0xCu);
    }

    free(v8);
  }
  v10 = MEMORY[0x18D765A14](v4);
  if (v10 == MEMORY[0x1E0C81310])
  {
    xpc_dictionary_get_remote_connection(v4);
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    -[OS_dispatch_queue xpcConnection](self->_connectionIncomingQueue, "xpcConnection");
    v15 = (char *)objc_claimAutoreleasedReturnValue();

    if (v4 != (id)MEMORY[0x1E0C81260] || v14 && v14 == v15)
    {
      v16 = -15;
    }
    else
    {
      GEOGetTileServerRemoteProxyLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v24 = v14;
        _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_INFO, "Connection invalid from cancelled connection <%p>", buf, 0xCu);
      }

      v16 = -2;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    delegateQueue = self->super._delegateQueue;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __41__GEOTileServerRemoteProxy__handleEvent___block_invoke;
    v21[3] = &unk_1E1C00738;
    v21[4] = self;
    v22 = v17;
    v19 = v17;
    dispatch_async(delegateQueue, v21);

  }
  else if (v10 == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(v4, "event");
    if (string)
    {
      v12 = string;
      if (!strcmp("tiles.tile", string))
      {
        -[GEOTileServerRemoteProxy _handleTile:](self, "_handleTile:", v4);
      }
      else if (!strcmp("tiles.err", v12))
      {
        -[GEOTileServerRemoteProxy _handleError:](self, "_handleError:", v4);
      }
      else if (!strcmp("tiles.net", v12))
      {
        -[GEOTileServerRemoteProxy _handleNetworkBegan:](self, "_handleNetworkBegan:", v4);
      }
      else if (!strcmp("tiles.upgrade", v12))
      {
        -[GEOTileServerRemoteProxy _handleEditionUpgrade:](self, "_handleEditionUpgrade:", v4);
      }
      else if (strcmp("tiles.finished", v12))
      {
        GEOGetTileServerRemoteProxyLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v24 = v12;
          _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Unhandled event type %{public}s", buf, 0xCu);
        }

      }
    }
  }
  objc_autoreleasePoolPop(v5);

}

- (void)_handleTile:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  GEOTileData *v10;
  GEOTileData *v11;
  GEOTileKeyList *v12;
  NSObject *v13;
  GEOTileData *v14;
  const void *bytes_ptr;
  size_t length;
  NSObject *global_queue;
  id v18;
  void *v19;
  void *v20;
  NSObject *delegateQueue;
  id v22;
  _QWORD block[5];
  GEOTileKeyList *v24;
  GEOTileData *v25;
  id v26;
  _QWORD destructor[4];
  id v28;
  _QWORD v29[5];
  GEOTileData *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = 0uLL;
  if (getTileKeyFromXPCDictionary(&v33, v4))
  {
    xpc_dictionary_get_value(v4, "tileData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C812F8])
    {
      v26 = 0;
      v10 = -[GEOTileData initWithXPCDictionary:error:]([GEOTileData alloc], "initWithXPCDictionary:error:", v5, &v26);
      v11 = (GEOTileData *)v26;
      if (v10)
      {
LABEL_13:
        xpc_dictionary_get_value(v4, "tileInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0C99D80], "_geo_dictionaryFromXPCObject:", v19);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        delegateQueue = self->super._delegateQueue;
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __40__GEOTileServerRemoteProxy__handleTile___block_invoke_2;
        v29[3] = &unk_1E1C09380;
        v32 = v33;
        v29[4] = self;
        v30 = v10;
        v31 = v19;
        v22 = v19;
        v14 = v10;
        dispatch_async(delegateQueue, v29);

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, CFSTR("Failed to decode tile data over XPC"));
      v10 = (GEOTileData *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v12 = objc_alloc_init(GEOTileKeyList);
        -[GEOTileKeyList addKey:](v12, "addKey:", &v33);
        v13 = self->super._delegateQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __40__GEOTileServerRemoteProxy__handleTile___block_invoke;
        block[3] = &unk_1E1C01790;
        block[4] = self;
        v24 = v12;
        v25 = v10;
        v11 = v10;
        v14 = v12;
        dispatch_async(v13, block);

LABEL_16:
        goto LABEL_17;
      }
LABEL_12:
      v11 = 0;
      goto LABEL_13;
    }
    v6 = MEMORY[0x18D765A14](v5);
    v7 = MEMORY[0x1E0C812E8];
    if (v6 != MEMORY[0x1E0C812E8])
    {
LABEL_17:

      goto LABEL_18;
    }
    xpc_dictionary_get_value(v4, "tileData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x18D765A14]() == v7)
    {
      bytes_ptr = xpc_data_get_bytes_ptr(v8);
      length = xpc_data_get_length(v8);
      global_queue = geo_get_global_queue();
      destructor[0] = MEMORY[0x1E0C809B0];
      destructor[1] = 3221225472;
      destructor[2] = __dataFromXPCDictionary_block_invoke;
      destructor[3] = &unk_1E1BFF6F8;
      v28 = v8;
      v18 = v8;
      v9 = dispatch_data_create(bytes_ptr, length, global_queue, destructor);

      if (v9)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v10 = -[GEOTileData initWithData:]([GEOTileData alloc], "initWithData:", v9);

    goto LABEL_12;
  }
LABEL_18:

}

- (GEOTileServerRemoteProxy)initWithCacheDBLocation:(id)a3 cacheFilesLocation:(id)a4 manifestConfiguration:(id)a5 locale:(id)a6 delegateQueue:(id)a7 delegate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  id v29;
  _QWORD handler[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)GEOTileServerRemoteProxy;
  v20 = -[GEOTileServerProxy initWithCacheDBLocation:cacheFilesLocation:manifestConfiguration:locale:delegateQueue:delegate:](&v35, sel_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate_, v14, v15, v16, v17, v18, v19);
  if (v20)
  {
    v29 = v15;
    v21 = geo_dispatch_queue_create();
    v22 = (void *)*((_QWORD *)v20 + 6);
    *((_QWORD *)v20 + 6) = v21;

    objc_initWeak(&location, v20);
    v23 = *((_QWORD *)v20 + 6);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __123__GEOTileServerRemoteProxy_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate___block_invoke;
    v32[3] = &unk_1E1C07998;
    objc_copyWeak(&v33, &location);
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:queue:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:queue:eventHandler:", 16, CFSTR("TileServer"), v23, v32);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v20 + 7);
    *((_QWORD *)v20 + 7) = v24;

    objc_msgSend(*((id *)v20 + 7), "setReconnectAutomatically:", 1);
    v26 = _GEOTileLoaderDidDeleteExternalTileDataDarwinNotification;
    v27 = *((_QWORD *)v20 + 6);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __123__GEOTileServerRemoteProxy_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate___block_invoke_2;
    handler[3] = &unk_1E1C05280;
    objc_copyWeak(&v31, &location);
    notify_register_dispatch(v26, (int *)v20 + 11, v27, handler);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    v15 = v29;
  }

  return (GEOTileServerRemoteProxy *)v20;
}

uint64_t __142__GEOTileServerRemoteProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleEvent:", a2);
}

void __123__GEOTileServerRemoteProxy_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)WeakRetained + 1);
    v4 = v3;
    if (v3)
    {
      v5 = v2[2];
      if (v5)
      {
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __123__GEOTileServerRemoteProxy_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate___block_invoke_6;
        v6[3] = &unk_1E1C00738;
        v7 = v3;
        v8 = v2;
        dispatch_async(v5, v6);

      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: strongSelf->_delegateQueue != ((void *)0)", buf, 2u);
      }
    }

  }
}

uint64_t __123__GEOTileServerRemoteProxy_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "proxyDidDeleteExternalTileData:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  NSObject *v3;
  OS_dispatch_queue *connectionIncomingQueue;
  OS_dispatch_queue *v5;
  objc_super v6;
  uint8_t buf[4];
  OS_dispatch_queue *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  GEOGetTileServerRemoteProxyLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connectionIncomingQueue = self->_connectionIncomingQueue;
    *(_DWORD *)buf = 134217984;
    v8 = connectionIncomingQueue;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Closed open connection <%p>", buf, 0xCu);
  }

  v5 = self->_connectionIncomingQueue;
  self->_connectionIncomingQueue = 0;

  notify_cancel(*(&self->super._resourceNotificationToken + 1));
  v6.receiver = self;
  v6.super_class = (Class)GEOTileServerRemoteProxy;
  -[GEOTileServerProxy dealloc](&v6, sel_dealloc);
}

void __41__GEOTileServerRemoteProxy__handleEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "proxy:failedToLoadAllPendingTilesWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __40__GEOTileServerRemoteProxy__handleTile___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "proxy:failedToLoadTiles:error:", a1[4], a1[5], a1[6]);

}

- (void)_handleError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  GEOTileKeyList *v11;
  NSObject *delegateQueue;
  id v13;
  GEOTileKeyList *v14;
  _QWORD block[5];
  GEOTileKeyList *v16;
  id v17;
  uint8_t buf[8];
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0uLL;
  if (getTileKeyFromXPCDictionary(&v19, v4))
  {
    xpc_dictionary_get_value(v4, "err");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "_geo_errorFromXPCData:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "code") == -5)
      {
        objc_msgSend(v6, "domain");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        GEOErrorDomain();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToString:", v8);

        if (v9)
        {
          GEOGetTileLoadingLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_FAULT, "Process attempted to load a restricted tile without the corresponding entitlement", buf, 2u);
          }

        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_alloc_init(GEOTileKeyList);
    -[GEOTileKeyList addKey:](v11, "addKey:", &v19);
    delegateQueue = self->super._delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__GEOTileServerRemoteProxy__handleError___block_invoke;
    block[3] = &unk_1E1C01790;
    block[4] = self;
    v16 = v11;
    v17 = v6;
    v13 = v6;
    v14 = v11;
    dispatch_async(delegateQueue, block);

  }
}

void __41__GEOTileServerRemoteProxy__handleError___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "proxy:failedToLoadTiles:error:", a1[4], a1[5], a1[6]);

}

- (void)_handleNetworkBegan:(id)a3
{
  void *v4;
  void *v5;
  NSObject *delegateQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  xpc_dictionary_get_value(a3, "list");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOTileKeyList listFromXPCData:](GEOTileKeyList, "listFromXPCData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  delegateQueue = self->super._delegateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__GEOTileServerRemoteProxy__handleNetworkBegan___block_invoke;
  v8[3] = &unk_1E1C00738;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(delegateQueue, v8);

}

void __48__GEOTileServerRemoteProxy__handleNetworkBegan___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "proxy:willGoToNetworkForTiles:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_handleEditionUpgrade:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *delegateQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  xpc_dictionary_get_value(a3, "UserInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = 0;
  }
  GEOGetTileServerRemoteProxyLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "Edition upgrade: %@", buf, 0xCu);
  }

  delegateQueue = self->super._delegateQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__GEOTileServerRemoteProxy__handleEditionUpgrade___block_invoke;
  v9[3] = &unk_1E1C00738;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(delegateQueue, v9);

}

void __50__GEOTileServerRemoteProxy__handleEditionUpgrade___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("GEOTileDBEditionUpgradeNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)reprioritizeKey:(const void *)a3 newPriority:(unsigned int)a4 batchID:(int)a5
{
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "message", "tiles.reprioritize");
  xpc_dictionary_set_data(xdict, "key", a3, 0x10uLL);
  xpc_dictionary_set_uint64(xdict, "priority", a4);
  xpc_dictionary_set_int64(xdict, "batch", a5);
  setManifestConfiguration(xdict, a1[3]);
  setLocale(xdict, a1[4]);
  objc_msgSend(a1[7], "sendMessage:", xdict);

}

- (void)reportCorruptTile:(const void *)a3
{
  xpc_object_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "message", "tiles.corrupt");
  xpc_dictionary_set_data(v5, "key", a3, 0x10uLL);
  setManifestConfiguration(v5, a1[3]);
  setLocale(v5, a1[4]);
  v6 = (void *)MEMORY[0x18D765864](v5);
  GEOGetTileServerRemoteProxyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = v6;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "corrupt: %s", (uint8_t *)&v8, 0xCu);
  }

  free(v6);
  objc_msgSend(a1[7], "sendMessage:", v5);

}

- (void)calculateFreeableSize
{
  xpc_object_t v3;
  void *v4;
  NSObject *v5;
  OS_dispatch_queue *connectionIncomingQueue;
  uint64_t v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "message", "tiles.canshrink");
  setManifestConfiguration(v3, self->super._manifestConfiguration);
  setLocale(v3, self->super._locale);
  v4 = (void *)MEMORY[0x18D765864](v3);
  GEOGetTileServerRemoteProxyLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v10 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "getFreeableSize: %s", buf, 0xCu);
  }

  free(v4);
  connectionIncomingQueue = self->_connectionIncomingQueue;
  v7 = *(_QWORD *)&self->_diskCacheDeletedExternalDataNotifyToken;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__GEOTileServerRemoteProxy_calculateFreeableSize__block_invoke;
  v8[3] = &unk_1E1C093A8;
  v8[4] = self;
  -[OS_dispatch_queue sendMessage:withReply:handler:](connectionIncomingQueue, "sendMessage:withReply:handler:", v3, v7, v8);

}

void __49__GEOTileServerRemoteProxy_calculateFreeableSize__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[6];

  uint64 = xpc_dictionary_get_uint64(xdict, "sz");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__GEOTileServerRemoteProxy_calculateFreeableSize__block_invoke_2;
  v6[3] = &unk_1E1BFF6D0;
  v6[4] = v4;
  v6[5] = uint64;
  dispatch_async(v5, v6);
}

void __49__GEOTileServerRemoteProxy_calculateFreeableSize__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "proxy:canShrinkDiskCacheByAmount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (unint64_t)calculateFreeableSizeSync
{
  xpc_object_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t uint64;
  NSObject *delegateQueue;
  _QWORD v10[6];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "message", "tiles.canshrinkSync");
  setManifestConfiguration(v3, self->super._manifestConfiguration);
  setLocale(v3, self->super._locale);
  v4 = (void *)MEMORY[0x18D765864](v3);
  GEOGetTileServerRemoteProxyLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v12 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "getFreeableSize: %s", buf, 0xCu);
  }

  free(v4);
  -[OS_dispatch_queue sendMessageWithReplySync:](self->_connectionIncomingQueue, "sendMessageWithReplySync:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64 = xpc_dictionary_get_uint64(v6, "sz");
  delegateQueue = self->super._delegateQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__GEOTileServerRemoteProxy_calculateFreeableSizeSync__block_invoke;
  v10[3] = &unk_1E1BFF6D0;
  v10[4] = self;
  v10[5] = uint64;
  dispatch_async(delegateQueue, v10);

  return uint64;
}

void __53__GEOTileServerRemoteProxy_calculateFreeableSizeSync__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "proxy:canShrinkDiskCacheByAmount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)shrinkDiskCacheToSize:(unint64_t)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  xpc_object_t v10;
  void *v11;
  NSObject *v12;
  OS_dispatch_queue *connectionIncomingQueue;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "message", "tiles.shrink");
  xpc_dictionary_set_uint64(v10, "sz", a3);
  setManifestConfiguration(v10, self->super._manifestConfiguration);
  setLocale(v10, self->super._locale);
  v11 = (void *)MEMORY[0x18D765864](v10);
  GEOGetTileServerRemoteProxyLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v21 = v11;
    _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "shrinkDiskCacheToSize: %s", buf, 0xCu);
  }

  free(v11);
  connectionIncomingQueue = self->_connectionIncomingQueue;
  v14 = *(_QWORD *)&self->_diskCacheDeletedExternalDataNotifyToken;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__GEOTileServerRemoteProxy_shrinkDiskCacheToSize_callbackQueue_completionHandler___block_invoke;
  v17[3] = &unk_1E1C061F8;
  v18 = v8;
  v19 = v9;
  v15 = v8;
  v16 = v9;
  -[OS_dispatch_queue sendMessage:withReply:handler:](connectionIncomingQueue, "sendMessage:withReply:handler:", v10, v14, v17);

}

void __82__GEOTileServerRemoteProxy_shrinkDiskCacheToSize_callbackQueue_completionHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  uint64 = xpc_dictionary_get_uint64(xdict, "sz");
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = uint64;
    v6 = *(NSObject **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__GEOTileServerRemoteProxy_shrinkDiskCacheToSize_callbackQueue_completionHandler___block_invoke_2;
    v7[3] = &unk_1E1C009D8;
    v8 = v4;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

uint64_t __82__GEOTileServerRemoteProxy_shrinkDiskCacheToSize_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (unint64_t)shrinkDiskCacheToSizeSync:(unint64_t)a3
{
  xpc_object_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t uint64;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "message", "tiles.shrinkSync");
  xpc_dictionary_set_uint64(v5, "sz", a3);
  setManifestConfiguration(v5, self->super._manifestConfiguration);
  setLocale(v5, self->super._locale);
  v6 = (void *)MEMORY[0x18D765864](v5);
  GEOGetTileServerRemoteProxyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315138;
    v12 = v6;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "shrinkDiskCacheToSize: %s", (uint8_t *)&v11, 0xCu);
  }

  free(v6);
  -[OS_dispatch_queue sendMessageWithReplySync:](self->_connectionIncomingQueue, "sendMessageWithReplySync:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64 = xpc_dictionary_get_uint64(v8, "sz");

  return uint64;
}

- (void)beginPreloadSessionOfSize:(unint64_t)a3
{
  xpc_object_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "message", "tiles.bpld");
  xpc_dictionary_set_uint64(v5, "sz", a3);
  setManifestConfiguration(v5, self->super._manifestConfiguration);
  setLocale(v5, self->super._locale);
  v6 = (void *)MEMORY[0x18D765864](v5);
  GEOGetTileServerRemoteProxyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315138;
    v9 = v6;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "beginPreloadSessionOfSize: %s", (uint8_t *)&v8, 0xCu);
  }

  free(v6);
  -[OS_dispatch_queue sendMessage:](self->_connectionIncomingQueue, "sendMessage:", v5);

}

- (void)endPreloadSession
{
  xpc_object_t v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "message", "tiles.epld");
  setManifestConfiguration(v3, self->super._manifestConfiguration);
  setLocale(v3, self->super._locale);
  v4 = (void *)MEMORY[0x18D765864](v3);
  GEOGetTileServerRemoteProxyLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315138;
    v7 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "endPreloadSession: %s", (uint8_t *)&v6, 0xCu);
  }

  free(v4);
  -[OS_dispatch_queue sendMessage:](self->_connectionIncomingQueue, "sendMessage:", v3);

}

- (void)enumerateAllKeysIncludingData:(BOOL)a3 onQueue:(id)a4 group:(id)a5 dataHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  xpc_object_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD v19[4];
  id v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v13, "message", "tiles.enumerate");
  xpc_dictionary_set_BOOL(v13, "include_data", a3);
  setManifestConfiguration(v13, self->super._manifestConfiguration);
  setLocale(v13, self->super._locale);
  v14 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__GEOTileServerRemoteProxy_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke;
  v19[3] = &unk_1E1C093D0;
  v15 = v12;
  v20 = v15;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:queue:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:queue:eventHandler:", 16, CFSTR("TileEnumeration"), v10, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    dispatch_group_enter(v11);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __84__GEOTileServerRemoteProxy_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke_2;
    v17[3] = &unk_1E1C093A8;
    v18 = v11;
    objc_msgSend(v16, "sendMessage:withReply:handler:", v13, v10, v17);

  }
}

void __84__GEOTileServerRemoteProxy_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  GEOTileEnumeration *v4;
  GEOTileEnumeration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  xpc_object_t reply;
  void *v14;
  _xpc_connection_s *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C812F8])
  {
    v4 = -[GEOTileEnumeration initWithXPCDictionary:error:]([GEOTileEnumeration alloc], "initWithXPCDictionary:error:", v3, 0);
    v5 = v4;
    if (v4)
    {
      v16[0] = 0;
      v16[1] = 0;
      -[GEOTileEnumeration key](v4, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getBytes:length:", v16, 16);

      v7 = *(_QWORD *)(a1 + 32);
      -[GEOTileEnumeration data](v5, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[GEOTileEnumeration current](v5, "current");
      -[GEOTileEnumeration eTag](v5, "eTag");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[GEOTileEnumeration originalLoadReason](v5, "originalLoadReason");
      -[GEOTileEnumeration age](v5, "age");
      v12 = (*(uint64_t (**)(uint64_t, _QWORD *, void *, uint64_t, void *, uint64_t))(v7 + 16))(v7, v16, v8, v9, v10, v11);

      reply = xpc_dictionary_create_reply(v3);
      v14 = reply;
      if (reply)
      {
        xpc_dictionary_get_remote_connection(reply);
        v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          xpc_dictionary_set_BOOL(v14, "cont", v12);
          xpc_connection_send_message(v15, v14);
        }

      }
    }

  }
}

void __84__GEOTileServerRemoteProxy_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionIncomingQueue, 0);
  objc_storeStrong((id *)&self->_diskCacheDeletedExternalDataNotifyToken, 0);
}

@end
