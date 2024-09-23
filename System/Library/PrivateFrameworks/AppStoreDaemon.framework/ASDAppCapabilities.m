@implementation ASDAppCapabilities

+ (id)interface
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3922B0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_isCapable_withCompletionHandler_, 0, 0);

  return v2;
}

+ (id)defaultInstance
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ASDAppCapabilities_defaultInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1ECFFAA78 != -1)
    dispatch_once(&qword_1ECFFAA78, block);
  return (id)_MergedGlobals_36;
}

void __37__ASDAppCapabilities_defaultInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_36;
  _MergedGlobals_36 = (uint64_t)v1;

}

- (ASDAppCapabilities)init
{
  ASDAppCapabilities *v2;
  uint64_t v3;
  NSMutableDictionary *cachedValues;
  NSObject *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ASDAppCapabilities;
  v2 = -[ASDAppCapabilities init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cachedValues = v2->_cachedValues;
    v2->_cachedValues = (NSMutableDictionary *)v3;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v2);
    v2->_eligibilityChangedNotificationToken = -1;
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __26__ASDAppCapabilities_init__block_invoke;
    v7[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v8, &location);
    notify_register_dispatch("com.apple.os-eligibility-domain.change", &v2->_eligibilityChangedNotificationToken, v5, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__ASDAppCapabilities_init__block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  id WeakRetained;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ASDLogHandleForCategory(1);
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19A03B000, v1, OS_LOG_TYPE_DEBUG, "Clearing cache after receiving notification", buf, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
    objc_msgSend(*((id *)WeakRetained + 1), "removeAllObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ASDAppCapabilitiesDidChangeNotification"), WeakRetained);

}

+ (BOOL)isCapable:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[ASDAppCapabilities defaultInstance]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ASDAppCapabilities _isCapable:method:]((uint64_t)v4, v3, (uint64_t)"+[ASDAppCapabilities isCapable:]");

  return v5;
}

- (uint64_t)_isCapable:(uint64_t)a3 method:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[5];
  _QWORD v20[2];
  void (*v21)(uint64_t, void *);
  void *v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _BYTE v28[12];
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld-%ld"), objc_msgSend(v5, "features"), objc_msgSend(v5, "action"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    if (v8)
    {
      ASDLogHandleForCategory(1);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 1026;
        *(_DWORD *)&buf[14] = objc_msgSend(v8, "BOOLValue");
        _os_log_debug_impl(&dword_19A03B000, v9, OS_LOG_TYPE_DEBUG, "Cached value found for %{public}@ - %{public}d", buf, 0x12u);
      }

      a1 = objc_msgSend(v8, "BOOLValue");
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v34 = __Block_byref_object_copy__5;
      v35 = __Block_byref_object_dispose__5;
      v36 = 0;
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 0;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v21 = __40__ASDAppCapabilities__isCapable_method___block_invoke;
      v22 = &unk_1E37BDFB0;
      v23 = buf;
      v10 = v20;
      +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v28 = 0;
      objc_msgSend(v11, "getCapabilitiesServiceWithError:", v28);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(id *)v28;

      if (v12)
      {
        objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21((uint64_t)v10, v13);
        v14 = 0;
      }

      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        ASDLogHandleForCategory(1);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v18 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v28 = 136446722;
          *(_QWORD *)&v28[4] = a3;
          v29 = 2114;
          v30 = v6;
          v31 = 2114;
          v32 = v18;
          _os_log_error_impl(&dword_19A03B000, v15, OS_LOG_TYPE_ERROR, "Error in %{public}s: %{public}@ - %{public}@", v28, 0x20u);
        }

        a1 = 0;
      }
      else
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __40__ASDAppCapabilities__isCapable_method___block_invoke_59;
        v19[3] = &unk_1E37BE510;
        v19[4] = &v24;
        objc_msgSend(v14, "isCapable:withCompletionHandler:", v6, v19);
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v25 + 24));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 8), "setObject:forKeyedSubscript:", v16, v7);

        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
        a1 = *((_BYTE *)v25 + 24) != 0;
      }

      _Block_object_dispose(&v24, 8);
      _Block_object_dispose(buf, 8);

    }
  }

  return a1;
}

+ (BOOL)isCapableOfAction:(int64_t)a3 capability:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  objc_msgSend(v5, "arrayWithObjects:count:", &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDAppCapabilityMetadata metadataWithAction:bundleID:capabilities:](ASDAppCapabilityMetadata, "metadataWithAction:bundleID:capabilities:", a3, &stru_1E37C1320, v7, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[ASDAppCapabilities defaultInstance]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[ASDAppCapabilities _isCapable:method:]((uint64_t)v9, v8, (uint64_t)"+[ASDAppCapabilities isCapableOfAction:capability:]");

  return a3;
}

+ (BOOL)isCapableOfAction:(int64_t)a3 capabilities:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  +[ASDAppCapabilityMetadata metadataWithAction:bundleID:capabilities:](ASDAppCapabilityMetadata, "metadataWithAction:bundleID:capabilities:", a3, &stru_1E37C1320, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDAppCapabilities defaultInstance]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASDAppCapabilities _isCapable:method:]((uint64_t)v5, v4, (uint64_t)"+[ASDAppCapabilities isCapableOfAction:capabilities:]");

  return v6;
}

void __40__ASDAppCapabilities__isCapable_method___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __40__ASDAppCapabilities__isCapable_method___block_invoke_59(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedValues, 0);
}

@end
