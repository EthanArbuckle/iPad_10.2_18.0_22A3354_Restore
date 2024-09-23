@implementation CacheDeleteRegister

void ___CacheDeleteRegister_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.cache_delete_registration_queue", 0);
  v1 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECE24218;
  qword_1ECE24218 = v2;

}

void ___CacheDeleteRegister_block_invoke_189(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint8_t buf[4];
  _BYTE v39[14];
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)qword_1ECE24218, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  if (v5)
  {
    if (*(_BYTE *)(a1 + 128) || objc_msgSend(v5, "anonymous"))
    {
      CDGetLogHandle((uint64_t)"client");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v30 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v39 = v30;
        _os_log_error_impl(&dword_1A3662000, v6, OS_LOG_TYPE_ERROR, "CacheDeleteRegistration of %s: new registration is or previous registration was anonymous.", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "suspend");
  }
  else
  {
    +[CacheDeleteServiceListener cacheDeleteServiceListener:options:](CacheDeleteServiceListener, "cacheDeleteServiceListener:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend((id)qword_1ECE24218, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
  {
    if (*(_BYTE *)(a1 + 128))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (*(_QWORD *)(a1 + 48))
      -[NSObject addObject:](v13, "addObject:", CFSTR("PURGEABLE_ENTITLEMENT"));
    if (*(_QWORD *)(a1 + 56))
    {
      -[NSObject addObject:](v14, "addObject:", CFSTR("PURGE_ENTITLEMENT"));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "addObject:", CFSTR("PURGE"));
    }
    if (*(_QWORD *)(a1 + 64))
      -[NSObject addObject:](v14, "addObject:", CFSTR("CANCEL_PURGE_ENTITLEMENT"));
    if (*(_QWORD *)(a1 + 72))
    {
      -[NSObject addObject:](v14, "addObject:", CFSTR("PERIODIC_ENTITLEMENT"));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "addObject:", CFSTR("PERIODIC"));
    }
    if (*(_QWORD *)(a1 + 80))
    {
      -[NSObject addObject:](v14, "addObject:", CFSTR("NOTIFICATION_ENTITLEMENT"));
      CDGetLogHandle((uint64_t)"client");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v17 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v39 = 155;
        *(_WORD *)&v39[4] = 2112;
        *(_QWORD *)&v39[6] = v16;
        v40 = 2112;
        v41 = v17;
        _os_log_impl(&dword_1A3662000, v15, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteRegister notify for %@ with options: %@", buf, 0x1Cu);
      }

      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_PURGE_NOTIFICATION"));
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_PURGE_NOTIFICATION"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v22 = *(void **)(a1 + 40);
          v36 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_PURGE_NOTIFICATION"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          CDGetLogHandle((uint64_t)"client");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v39 = 161;
            *(_WORD *)&v39[4] = 2112;
            *(_QWORD *)&v39[6] = v26;
            v40 = 2112;
            v41 = v24;
            _os_log_impl(&dword_1A3662000, v25, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteRegister calling deleted for %@ with: %@", buf, 0x1Cu);
          }

          v31 = MEMORY[0x1E0C809B0];
          v32 = 3221225472;
          v33 = ___CacheDeleteRegister_block_invoke_205;
          v34 = &unk_1E4A326A0;
          v35 = v24;
          v27 = v24;
          CallCacheD(&v31, &__block_literal_global_206);

        }
      }
    }
    if (*(_QWORD *)(a1 + 88))
    {
      objc_msgSend(*(id *)(a1 + 120), "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_REQUIRED_ENTITLEMENTS"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
        -[NSObject addObjectsFromArray:](v14, "addObjectsFromArray:", v28);

      v29 = *(_QWORD *)(a1 + 88);
    }
    else
    {
      v29 = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setPurgeable:purge:cancel:periodic:notify:callback:entitlements:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v29, v14, v31, v32, v33, v34);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "resume");
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A3662000, v14, OS_LOG_TYPE_ERROR, "unable to create listener", buf, 2u);
    }
  }

}

uint64_t ___CacheDeleteRegister_block_invoke_205(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clientSetState:key:", *(_QWORD *)(a1 + 32), CFSTR("CACHE_DELETE_PURGE_NOTIFICATION"));
}

void ___CacheDeleteRegister_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1A3662000, v3, OS_LOG_TYPE_ERROR, "CallCacheD failed: %@", (uint8_t *)&v4, 0xCu);
  }

}

void ___CacheDeleteRegister_block_invoke_210(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];

  v3 = a1[4];
  v4 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v5 = a2;
  objc_msgSend(v4, "endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[7];
  v8 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___CacheDeleteRegister_block_invoke_2_211;
  v9[3] = &unk_1E4A32A98;
  v9[4] = v7;
  objc_msgSend(v5, "clientCheckin:endpoint:info:reply:", v3, v6, v8, v9);

}

void ___CacheDeleteRegister_block_invoke_2_211(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    CDGetLogHandle((uint64_t)"client");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v5;
      _os_log_error_impl(&dword_1A3662000, v7, OS_LOG_TYPE_ERROR, "Proxy check-in error: %@, serviceInfo: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;

}

void ___CacheDeleteRegister_block_invoke_213(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1A3662000, v3, OS_LOG_TYPE_ERROR, "Failed to register: %@", (uint8_t *)&v4, 0xCu);
  }

}

@end
