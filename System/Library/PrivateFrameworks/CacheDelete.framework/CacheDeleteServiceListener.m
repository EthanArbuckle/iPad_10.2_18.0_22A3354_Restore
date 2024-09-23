@implementation CacheDeleteServiceListener

- (void)servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  dispatch_qos_class_t v15;
  void *v16;
  char v17;
  dispatch_block_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  CacheDeleteServiceListener *v24;
  id v25;
  id v26;
  int v27;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume validateVolumeAtPath:](CacheDeleteVolume, "validateVolumeAtPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_8;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("CACHE_DELETE_VOLUME"));
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_NO_CACHE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = evaluateBoolProperty(v13);

  v15 = v14 ? QOS_CLASS_UTILITY : QOS_CLASS_BACKGROUND;
  if (!-[CacheDeleteServiceListener legacyCallbacks](self, "legacyCallbacks")
    || (getRootVolume(),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v12, "isEqualToString:", v16),
        v16,
        (v17 & 1) != 0))
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __63__CacheDeleteServiceListener_servicePurgeable_info_replyBlock___block_invoke;
    v23 = &unk_1E4A330A8;
    v24 = self;
    v25 = v10;
    v27 = a3;
    v26 = v9;
    v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, &v20);
    -[CacheDeleteServiceListener queue](self, "queue", v20, v21, v22, v23, v24);
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v19, v18);

  }
  else
  {
LABEL_8:
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)legacyCallbacks
{
  return self->_legacyCallbacks;
}

uint64_t __94__CacheDeleteServiceListener_setPurgeable_purge_cancel_periodic_notify_callback_entitlements___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "requiredEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "setPurgeable:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setPurge:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setCancel:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setPeriodic:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setNotify:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "setCallback:", *(_QWORD *)(a1 + 88));
  return objc_msgSend(*(id *)(a1 + 32), "addRequiredEntitlement:", *(_QWORD *)(a1 + 40));
}

- (void)setPurgeable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setPurge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setPeriodic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setNotify:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setCancel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

void __63__CacheDeleteServiceListener_servicePurgeable_info_replyBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[8];
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "purgeable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "purgeable");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)(*((uint64_t (**)(id, _QWORD, _QWORD))v14 + 2))(v14, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "callback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, CFSTR("CACHE_DELETE_URGENCY"));

      v16 = CFSTR("CACHE_DELETE_PURGEABLE_OPERATION");
      v17 = *(_QWORD *)(a1 + 40);
      v18 = CFSTR("CACHE_DELETE_OPERATIONS");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "callback");
      v9 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v10 = (void *)((uint64_t (**)(_QWORD, void *))v9)[2](v9, v8);

      v11 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_PURGEABLE_OPERATION"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    }
    else
    {
      CDGetLogHandle((uint64_t)"client");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3662000, v13, OS_LOG_TYPE_INFO, "purgeable callback is NULL", buf, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
}

- (id)purgeable
{
  return self->_purgeable;
}

- (id)callback
{
  return self->_callback;
}

- (CacheDeleteServiceInfo)serviceInfo
{
  return self->_serviceInfo;
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 72, 1);
}

+ (id)cacheDeleteServiceListener:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  CacheDeleteServiceListener *v7;
  void *v8;

  if (a3)
  {
    v5 = a4;
    v6 = a3;
    v7 = -[CacheDeleteServiceListener initWithName:options:]([CacheDeleteServiceListener alloc], "initWithName:options:", v6, v5);

    v8 = (void *)cacheDeleteServiceListener_options__listener;
    cacheDeleteServiceListener_options__listener = (uint64_t)v7;

  }
  return (id)cacheDeleteServiceListener_options__listener;
}

- (void)setPurgeable:(id)a3 purge:(id)a4 cancel:(id)a5 periodic:(id)a6 notify:(id)a7 callback:(id)a8 entitlements:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD block[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  -[CacheDeleteServiceListener queue](self, "queue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__CacheDeleteServiceListener_setPurgeable_purge_cancel_periodic_notify_callback_entitlements___block_invoke;
  block[3] = &unk_1E4A33080;
  v32 = v15;
  v33 = v16;
  v34 = v17;
  v35 = v18;
  v36 = v19;
  v37 = v20;
  block[4] = self;
  v31 = v21;
  v23 = v21;
  v24 = v20;
  v25 = v19;
  v26 = v18;
  v27 = v17;
  v28 = v16;
  v29 = v15;
  dispatch_sync(v22, block);

}

- (CacheDeleteServiceListener)initWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CacheDeleteServiceInfo *v10;
  CacheDeleteServiceInfo *serviceInfo;
  void *v12;
  void *v13;
  char isKindOfClass;
  NSObject *v15;
  void *v16;
  CacheDeleteServiceListener *v17;
  CacheDeleteServiceListener *v18;
  const char *v19;
  uint64_t v20;
  NSXPCListenerEndpoint *endpoint;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  CacheDeleteServiceListener *v26;
  objc_super v28;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_LEGACY_CALLBACK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ANON"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_SERVICE_INFO"));
  v10 = (CacheDeleteServiceInfo *)objc_claimAutoreleasedReturnValue();

  serviceInfo = self->_serviceInfo;
  self->_serviceInfo = v10;

  if (self->_serviceInfo)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CacheDeleteServiceInfo extensionContext](self->_serviceInfo, "extensionContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[CacheDeleteServiceInfo extensionContext](self->_serviceInfo, "extensionContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

LABEL_16:
        v16 = 0;
        goto LABEL_17;
      }
    }
  }
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      self->_anonymous = objc_msgSend(v9, "BOOLValue");
  }
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      self->_legacyCallbacks = objc_msgSend(v8, "BOOLValue");
  }
  if (!self->_anonymous)
  {
    isKindOfClass = 0;
    goto LABEL_16;
  }
  CDGetLogHandle((uint64_t)"client");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3662000, v15, OS_LOG_TYPE_DEFAULT, "USING ANON Listener", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = 0;
LABEL_17:
  v28.receiver = self;
  v28.super_class = (Class)CacheDeleteServiceListener;
  v17 = -[CacheDeleteListener initWithName:listener:protocol:exportedObj:isExtension:](&v28, sel_initWithName_listener_protocol_exportedObj_isExtension_, v6, v16, &unk_1EE6C7F08, self, isKindOfClass & 1);
  v18 = v17;
  if (v17)
  {
    v19 = "";
    if (v17->_anonymous)
    {
      objc_msgSend(v16, "endpoint");
      v20 = objc_claimAutoreleasedReturnValue();
      endpoint = v18->_endpoint;
      v18->_endpoint = (NSXPCListenerEndpoint *)v20;

      if (v18->_anonymous)
        v19 = "_ANON";
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cache_delete.listener.%@%s"), v6, v19);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = (const char *)-[NSObject UTF8String](v22, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create(v23, v24);
    -[CacheDeleteServiceListener setQueue:](v18, "setQueue:", v25);

    v26 = v18;
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A3662000, v22, OS_LOG_TYPE_ERROR, "super initWithName failed.", buf, 2u);
    }
  }

  return v18;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)servicePing:(id)a3
{
  void (**v3)(_QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(_QWORD))a3;
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "PING", v5, 2u);
  }

  v3[2](v3);
}

- (void)servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  dispatch_qos_class_t v16;
  NSObject *v17;
  dispatch_block_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  CacheDeleteServiceListener *v24;
  id v25;
  id v26;
  int v27;
  uint8_t buf[4];
  dispatch_qos_class_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume validateVolumeAtPath:](CacheDeleteVolume, "validateVolumeAtPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_QOS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  evaluateNumberProperty(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && ((objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("CACHE_DELETE_VOLUME")),
         !-[CacheDeleteServiceListener legacyCallbacks](self, "legacyCallbacks"))
     || (getRootVolume(),
         v14 = (void *)objc_claimAutoreleasedReturnValue(),
         v15 = objc_msgSend(v11, "isEqualToString:", v14),
         v14,
         (v15 & 1) != 0)))
  {
    if (v13)
      v16 = objc_msgSend(v13, "unsignedIntValue");
    else
      v16 = QOS_CLASS_UTILITY;
    CDGetLogHandle((uint64_t)"client");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v29 = v16;
      _os_log_impl(&dword_1A3662000, v17, OS_LOG_TYPE_DEFAULT, "servicePurge QOS: %u", buf, 8u);
    }

    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __59__CacheDeleteServiceListener_servicePurge_info_replyBlock___block_invoke;
    v23 = &unk_1E4A330A8;
    v24 = self;
    v25 = v9;
    v27 = a3;
    v26 = v8;
    v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v16, 0, &v20);
    -[CacheDeleteServiceListener queue](self, "queue", v20, v21, v22, v23, v24);
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v19, v18);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __59__CacheDeleteServiceListener_servicePurge_info_replyBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[8];
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "purge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "purge");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)(*((uint64_t (**)(id, _QWORD, _QWORD))v14 + 2))(v14, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "callback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, CFSTR("CACHE_DELETE_URGENCY"));

      v16 = CFSTR("CACHE_DELETE_PURGE_OPERATION");
      v17 = *(_QWORD *)(a1 + 40);
      v18 = CFSTR("CACHE_DELETE_OPERATIONS");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "callback");
      v9 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v10 = (void *)((uint64_t (**)(_QWORD, void *))v9)[2](v9, v8);

      v11 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_PURGE_OPERATION"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    }
    else
    {
      CDGetLogHandle((uint64_t)"client");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3662000, v13, OS_LOG_TYPE_INFO, "purge callback is NULL", buf, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
}

- (void)serviceCancelPurge:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void (**cancel)(void);
  void (**callback)(id, void *);
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = (void (**)(_QWORD))a3;
  CDGetLogHandle((uint64_t)"client");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3662000, v5, OS_LOG_TYPE_DEFAULT, "serviceCancelPurge", buf, 2u);
  }

  cancel = (void (**)(void))self->_cancel;
  if (cancel)
  {
    cancel[2]();
  }
  else
  {
    callback = (void (**)(id, void *))self->_callback;
    if (callback)
    {
      callback[2](callback, &unk_1E4A38F78);
    }
    else
    {
      CDGetLogHandle((uint64_t)"client");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_error_impl(&dword_1A3662000, v8, OS_LOG_TYPE_ERROR, "cancel callback is NULL", v11, 2u);
      }

    }
  }
  v4[2](v4);

  CDGetLogHandle((uint64_t)"client");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A3662000, v9, OS_LOG_TYPE_DEFAULT, "serviceCancelPurge end", v10, 2u);
  }

}

- (void)servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  dispatch_block_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  CacheDeleteServiceListener *v18;
  id v19;
  id v20;
  int v21;

  v8 = a4;
  v9 = a5;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __62__CacheDeleteServiceListener_servicePeriodic_info_replyBlock___block_invoke;
  v17 = &unk_1E4A330A8;
  v18 = self;
  v19 = v8;
  v21 = a3;
  v20 = v9;
  v10 = v9;
  v11 = v8;
  v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, &v14);
  -[CacheDeleteServiceListener queue](self, "queue", v14, v15, v16, v17, v18);
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v13, v12);

}

void __62__CacheDeleteServiceListener_servicePeriodic_info_replyBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t (**v4)(_QWORD, _QWORD, _QWORD);
  const void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t (**v12)(_QWORD, _QWORD);
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _DWORD v17[2];
  __int16 v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "periodic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "periodic");
    v4 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5 = (const void *)v4[2](v4, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));

    if (v5)
      CFRelease(v5);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    objc_msgSend(v3, "callback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("CACHE_DELETE_URGENCY"));

      v21 = v7;
      v22 = CFSTR("CACHE_DELETE_OPERATIONS");
      v20 = CFSTR("CACHE_DELETE_PERIODIC_OPERATION");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      CDGetLogHandle((uint64_t)"client");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v17[0] = 67109378;
        v17[1] = 229;
        v18 = 2112;
        v19 = v10;
        _os_log_debug_impl(&dword_1A3662000, v11, OS_LOG_TYPE_DEBUG, "[%d] FRAMEWORK operation: %@", (uint8_t *)v17, 0x12u);
      }

      objc_msgSend(*(id *)(a1 + 32), "callback");
      v12 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13 = (void *)((uint64_t (**)(_QWORD, void *))v12)[2](v12, v10);

      v14 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_PERIODIC_OPERATION"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

    }
    else
    {
      CDGetLogHandle((uint64_t)"client");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17[0]) = 0;
        _os_log_impl(&dword_1A3662000, v16, OS_LOG_TYPE_INFO, "periodic callback is NULL", (uint8_t *)v17, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
}

- (void)serviceNotify:(id)a3 replyBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_initially_inactive(v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_queue_create("com.apple.cache_delete_notify", v9);

  -[CacheDeleteServiceListener queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v10, v11);

  dispatch_activate(v10);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CacheDeleteServiceListener_serviceNotify_replyBlock___block_invoke;
  block[3] = &unk_1E4A330D0;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(v10, block);

}

uint64_t __55__CacheDeleteServiceListener_serviceNotify_replyBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v10;
  int v11;
  _QWORD v12[2];
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "notify");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "notify");
    v4 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v3, "callback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v13 = CFSTR("CACHE_DELETE_NOTIFICATION_OPERATION");
      v14 = *(_QWORD *)(a1 + 40);
      v15 = CFSTR("CACHE_DELETE_OPERATIONS");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v4 = objc_claimAutoreleasedReturnValue();

      CDGetLogHandle((uint64_t)"client");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v11 = 67109378;
        LODWORD(v12[0]) = 263;
        WORD2(v12[0]) = 2112;
        *(_QWORD *)((char *)v12 + 6) = v4;
        _os_log_debug_impl(&dword_1A3662000, v7, OS_LOG_TYPE_DEBUG, "[%d] FRAMEWORK operation: %@", (uint8_t *)&v11, 0x12u);
      }

      objc_msgSend(*(id *)(a1 + 32), "callback");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8[2](v8, v4);

    }
    else
    {
      CDGetLogHandle((uint64_t)"client");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      {
        v10 = *(_QWORD *)(a1 + 40);
        v11 = 138412290;
        v12[0] = v10;
        _os_log_error_impl(&dword_1A3662000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "notify callback is NULL for %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)setNotifyCallback:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CacheDeleteServiceListener queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CacheDeleteServiceListener_setNotifyCallback___block_invoke;
  block[3] = &unk_1E4A32800;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __48__CacheDeleteServiceListener_setNotifyCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNotify:", *(_QWORD *)(a1 + 40));
}

- (void)serviceCallback:(id)a3 replyBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_qos_class_t v11;
  uint64_t v12;
  dispatch_block_t v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[CacheDeleteServiceListener callback](self, "callback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_QOS"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    evaluateNumberProperty(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v11 = objc_msgSend(v10, "unsignedIntValue");
    else
      v11 = QOS_CLASS_BACKGROUND;
    v12 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__CacheDeleteServiceListener_serviceCallback_replyBlock___block_invoke;
    block[3] = &unk_1E4A330D0;
    v20 = v7;
    block[4] = self;
    v19 = v6;
    v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v11, 0, block);
    -[CacheDeleteServiceListener queue](self, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __57__CacheDeleteServiceListener_serviceCallback_replyBlock___block_invoke_2;
    v16[3] = &unk_1E4A330F8;
    v17 = v13;
    v15 = v13;
    dispatch_async(v14, v16);

  }
}

void __57__CacheDeleteServiceListener_serviceCallback_replyBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t (**v4)(id, _QWORD);

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "callback");
  v4 = (uint64_t (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v3 = (void *)v4[2](v4, *(_QWORD *)(a1 + 40));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

uint64_t __57__CacheDeleteServiceListener_serviceCallback_replyBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (id)purge
{
  return self->_purge;
}

- (id)periodic
{
  return self->_periodic;
}

- (id)cancel
{
  return self->_cancel;
}

- (id)notify
{
  return self->_notify;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong(&self->_notify, 0);
  objc_storeStrong(&self->_cancel, 0);
  objc_storeStrong(&self->_periodic, 0);
  objc_storeStrong(&self->_purge, 0);
  objc_storeStrong(&self->_purgeable, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_serviceInfo, 0);
}

@end
