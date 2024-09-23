@implementation __CFN_ConnectionContextManager

- (void)registerSession:(uint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  void (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v5 = (void *)-[__CFN_ConnectionContextManager keyForSession:]((id *)a3);
    os_unfair_lock_lock((os_unfair_lock_t)&_lock);
    if (!objc_msgSend((id)_registeredSessions, "objectForKeyedSubscript:", v5))
    {
      objc_msgSend(v5, "UTF8String");
      v6 = nw_context_create();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v23 = __50____CFN_ConnectionContextManager_registerSession___block_invoke_2;
      v24 = &unk_1E14FE118;
      v25 = v6;
      nw_context_set_isolate_protocol_cache();
      if (a3)
        v7 = *(void **)(a3 + 112);
      else
        v7 = 0;
      objc_msgSend(v7, "_loggingPrivacyLevel");
      nw_context_set_privacy_level();
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      if (a3)
        v8 = *(void **)(a3 + 112);
      else
        v8 = 0;
      v9 = (void *)objc_msgSend(v8, "_proxyConfigurations", v18);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v9);
            nw_context_add_proxy();
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v10);
      }
      nw_context_activate();
      objc_msgSend((id)_nwContexts, "setObject:forKeyedSubscript:", v6, v5);
      v13 = objc_msgSend(MEMORY[0x1E0C99E20], "set");
      objc_msgSend((id)_registeredSessions, "setObject:forKeyedSubscript:", v13, v5);
      v23((uint64_t)v22);
    }
    v14 = (void *)objc_msgSend((id)_registeredSessions, "objectForKeyedSubscript:", v5);
    if (a3)
      v15 = *(_QWORD *)(a3 + 128);
    else
      v15 = 0;
    objc_msgSend(v14, "addObject:", v15);
    v16 = (id)objc_msgSend((id)_nwContexts, "objectForKeyedSubscript:", v5);
    *a1 = v16;
    v17 = (_QWORD *)operator new();
    *v17 = &off_1E14F1B70;
    v17[1] = 0;
    v17[2] = 0;
    v17[3] = v16;
    a1[1] = v17;
    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
}

- (uint64_t)keyForSession:(id *)a1
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_msgSend(a1, "_tlsSessionCachePrefix");
  if (a1)
  {
    v4 = objc_msgSend(a1[14], "_tlsTrustPinningPolicyName");
    if (objc_msgSend(a1[14], "_allowsTLSFallback"))
      v5 = 89;
    else
      v5 = 78;
    v6 = objc_msgSend(a1[14], "_loggingPrivacyLevel");
    v7 = a1[14];
  }
  else
  {
    v4 = objc_msgSend(0, "_tlsTrustPinningPolicyName");
    if (objc_msgSend(0, "_allowsTLSFallback"))
      v5 = 89;
    else
      v5 = 78;
    v6 = objc_msgSend(0, "_loggingPrivacyLevel");
    v7 = 0;
  }
  return objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.CFNetwork.NSURLSession.{%@}{%@}{%c}{%d}{%p}"), v3, v4, v5, v6, objc_msgSend(v7, "_proxyConfigurations"));
}

- (void)unregisterSession:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    v3 = -[__CFN_ConnectionContextManager keyForSession:]((id *)a2);
    os_unfair_lock_lock((os_unfair_lock_t)&_lock);
    if (objc_msgSend((id)_registeredSessions, "objectForKeyedSubscript:", v3))
    {
      v4 = (void *)objc_msgSend((id)_registeredSessions, "objectForKeyedSubscript:", v3);
      if (a2)
        v5 = *(_QWORD *)(a2 + 128);
      else
        v5 = 0;
      objc_msgSend(v4, "removeObject:", v5);
      if (!objc_msgSend((id)objc_msgSend((id)_registeredSessions, "objectForKeyedSubscript:", v3), "count"))
      {
        objc_msgSend((id)_nwContexts, "removeObjectForKey:", v3);
        objc_msgSend((id)_registeredSessions, "removeObjectForKey:", v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  }
}

- (__CFN_ConnectionContextManager)init
{
  __CFN_ConnectionContextManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)__CFN_ConnectionContextManager;
  v2 = -[__CFN_ConnectionContextManager init](&v4, sel_init);
  if (v2)
  {
    _lock = 0;
    _nwContexts = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
    _registeredSessions = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)__CFN_ConnectionContextManager;
  -[__CFN_ConnectionContextManager dealloc](&v3, sel_dealloc);
}

@end
