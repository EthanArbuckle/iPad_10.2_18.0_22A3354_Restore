@implementation ACDClient

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (ACDClient)initWithConnection:(id)a3
{
  id v5;
  ACDClient *v6;
  ACDClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACDClient;
  v6 = -[ACDClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_clientPropertyLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4;
  os_unfair_lock_s *p_clientPropertyLock;
  id v6;
  void *v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  ACDClient *v14;
  id v15;

  v4 = a3;
  p_clientPropertyLock = &self->_clientPropertyLock;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __28__ACDClient_hasEntitlement___block_invoke;
  v13 = &unk_24C7E31D8;
  v14 = self;
  v15 = v4;
  v6 = v4;
  ac_unfair_lock_perform_with_result_1(p_clientPropertyLock, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue", v10, v11, v12, v13, v14);

  return v8;
}

id __28__ACDClient_hasEntitlement___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    objc_msgSend(*(id *)(v1 + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = objc_msgSend(v3, "BOOLValue");
    }
    else
    {
      v6 = *(_QWORD **)(a1 + 32);
      if (!v6[8])
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(v8 + 64);
        *(_QWORD *)(v8 + 64) = v7;

        v6 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v6, "_rawValueForEntitlement:", *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        _ACDLogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          v19 = *(_QWORD *)(a1 + 40);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v21 = 138412802;
          v22 = v20;
          v23 = 2112;
          v24 = v19;
          v25 = 2112;
          v26 = v10;
          _os_log_fault_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_FAULT, "\"Connection '%@' has unsupported object type set for entitlement '%@': %@\", (uint8_t *)&v21, 0x20u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", MEMORY[0x24BDBD1C0], *(_QWORD *)(a1 + 40));
        v5 = 0;
      }
      else
      {
        v5 = objc_msgSend(v10, "BOOLValue");
        _ACDLogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v16 = *(_QWORD *)(a1 + 40);
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138412802;
          v22 = v16;
          v23 = 2112;
          v24 = v17;
          v25 = 2112;
          v26 = v18;
          _os_log_debug_impl(&dword_20D8CB000, v11, OS_LOG_TYPE_DEBUG, "\"Entitlement %@ verification for %@ result cached as: %@\", (uint8_t *)&v21, 0x20u);

        }
        v12 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v13, *(_QWORD *)(a1 + 40));

      }
    }

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_rawValueForEntitlement:(id)a3
{
  return (id)-[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", a3);
}

id __21__ACDClient_bundleID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    v3 = *(void **)(v2 + 8);
    if (v3)
    {
      +[ACDClient _bundleIDForPID:](ACDClient, "_bundleIDForPID:", objc_msgSend(v3, "processIdentifier"));
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    }
  }
  return v3;
}

id __17__ACDClient_name__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  if (!v3)
  {
    objc_msgSend(*(id *)(v2 + 8), "processIdentifier");
    ACDGetProcNameForPID();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }
  return v3;
}

- (void)dealloc
{
  __CFBundle *bundle;
  objc_super v4;

  bundle = self->_bundle;
  if (bundle)
    CFRelease(bundle);
  v4.receiver = self;
  v4.super_class = (Class)ACDClient;
  -[ACDClient dealloc](&v4, sel_dealloc);
}

- (NSString)bundleID
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __21__ACDClient_bundleID__block_invoke;
  v3[3] = &unk_24C7E3188;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_1(&self->_clientPropertyLock, v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)_bundleIDForPID:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BYTE buffer[4096];
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE72FB8], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containingAppForPlugInWithPid:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    +[ACDClient _bundleForNonPlugInPID:](ACDClient, "_bundleForNonPlugInPID:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", buffer, proc_pidpath(v3, buffer, 0x1000u), 4);
      objc_msgSend(v8, "lastPathComponent");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

+ (id)_bundleForNonPlugInPID:(int)a3
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE buffer[4096];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = proc_pidpath(a3, buffer, 0x1000u);
  v4 = (void *)MEMORY[0x24BDBCF48];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", buffer, v3, 4);
  objc_msgSend(v4, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_entitlementChecks, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_pid, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (NSString)name
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __17__ACDClient_name__block_invoke;
  v3[3] = &unk_24C7E3188;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_1(&self->_clientPropertyLock, v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setBundleID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_clientPropertyLock;
  id v6;
  _QWORD *v7;
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  ACDClient *v12;

  v4 = a3;
  p_clientPropertyLock = &self->_clientPropertyLock;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v9 = __25__ACDClient_setBundleID___block_invoke;
  v10 = &unk_24C7E2180;
  v6 = v4;
  v11 = v6;
  v12 = self;
  v7 = v8;
  os_unfair_lock_lock(p_clientPropertyLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_clientPropertyLock);

}

void __25__ACDClient_setBundleID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;
  v5 = v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 32) = v5 != 0;
}

+ (ACDClient)clientWithBundleID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setBundleID:", v3);

  return (ACDClient *)v4;
}

- (ACDClient)init
{
  return -[ACDClient initWithConnection:](self, "initWithConnection:", 0);
}

- (NSNumber)pid
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __16__ACDClient_pid__block_invoke;
  v3[3] = &unk_24C7E3160;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_1(&self->_clientPropertyLock, v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

id __16__ACDClient_pid__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  if (!v3)
  {
    v3 = *(void **)(v2 + 8);
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v3, "processIdentifier"));
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    }
  }
  return v3;
}

+ (id)_bundleForPID:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BE72FB8], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containingAppForPlugInWithPid:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0);
    v8 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v7, "bundleContainerURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleWithURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_bundleForNonPlugInPID:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (NSString)localizedAppName
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __29__ACDClient_localizedAppName__block_invoke;
  v3[3] = &unk_24C7E3188;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_1(&self->_clientPropertyLock, v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __29__ACDClient_localizedAppName__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[6];
  if (!v3)
  {
    v3 = (void *)v2[1];
    if (v3)
    {
      objc_msgSend(v2, "_displayNameFromLaunchServicesForPID:", objc_msgSend(v3, "processIdentifier"));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 48);
      *(_QWORD *)(v6 + 48) = v5;

      v8 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(v8 + 48);
      if (!v3)
      {
        objc_msgSend((id)v8, "_displayNameFromBundleInfoDictionaryForPID:", objc_msgSend(*(id *)(v8 + 8), "processIdentifier"));
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(v10 + 48);
        *(_QWORD *)(v10 + 48) = v9;

        v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        if (!v3)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0, 0);
          objc_msgSend(v12, "localizedName");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(a1 + 32);
          v15 = *(void **)(v14 + 48);
          *(_QWORD *)(v14 + 48) = v13;

          v16 = *(_QWORD *)(a1 + 32);
          v3 = *(void **)(v16 + 48);
          if (!v3)
          {
            objc_msgSend(*(id *)(v16 + 8), "processIdentifier");
            ACDGetProcNameForPID();
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = *(_QWORD *)(a1 + 32);
            v19 = *(void **)(v18 + 48);
            *(_QWORD *)(v18 + 48) = v17;

            v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
          }
        }
      }
    }
  }
  return v3;
}

- (id)_displayNameFromLaunchServicesForPID:(int)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  +[ACDClient _bundleForPID:](ACDClient, "_bundleForPID:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDC1540]);
    objc_msgSend(v3, "bundleURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithURL:allowPlaceholder:error:", v5, 0, 0);

    objc_msgSend(v6, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_displayNameFromBundleInfoDictionaryForPID:(int)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[ACDClient _bundleForPID:](ACDClient, "_bundleForPID:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "localizedInfoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDBD1D0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)adamOrDisplayID
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __28__ACDClient_adamOrDisplayID__block_invoke;
  v3[3] = &unk_24C7E3188;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_1(&self->_clientPropertyLock, v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __28__ACDClient_adamOrDisplayID__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v1)
  {
    objc_msgSend(v1, "processIdentifier");
    ACDGetAdamOrDisplayIDForPID();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (__CFBundle)bundle
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __19__ACDClient_bundle__block_invoke;
  v3[3] = &unk_24C7E31B0;
  v3[4] = self;
  return (__CFBundle *)ac_unfair_lock_perform_with_result_1(&self->_clientPropertyLock, v3);
}

id __19__ACDClient_bundle__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v1 = (id *)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDC1540]);
    objc_msgSend(*v1, "bundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

    objc_msgSend(v5, "bundleContainerURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      CFRetain(v6);
      *((_QWORD *)*v1 + 2) = CFBundleCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFURLRef)v6);
      if (!*((_QWORD *)*v1 + 2))
      {
        _ACDLogSystem();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __19__ACDClient_bundle__block_invoke_cold_1((uint64_t *)v1, (uint64_t)v6, v7);

      }
      CFRelease(v6);
    }

    v2 = (void *)*((_QWORD *)*v1 + 2);
  }
  return v2;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[ACDClient name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (ACDAccountStoreFilter)filter
{
  return self->_filter;
}

void __19__ACDClient_bundle__block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_20D8CB000, log, OS_LOG_TYPE_ERROR, "\"CFBundleCreate failed: %@, %@\", (uint8_t *)&v4, 0x16u);
}

@end
