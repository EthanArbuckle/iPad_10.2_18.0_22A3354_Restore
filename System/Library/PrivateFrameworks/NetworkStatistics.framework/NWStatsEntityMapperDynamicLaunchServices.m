@implementation NWStatsEntityMapperDynamicLaunchServices

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NWStatsEntityMapCache *v11;
  id v12;
  void *v13;
  int v14;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v10 = (void *)MEMORY[0x212BD9F2C]();
      v11 = self->_entityMap;
      objc_sync_enter(v11);
      -[NWStatsEntityMapCache entryForUUID:](self->_entityMap, "entryForUUID:", v7);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        -[NWStatsEntityMapperDynamicLaunchServices handleNewUUID:](self, "handleNewUUID:", v7);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 1;
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v12;
        v16 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithString:", v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = 2;
      }
      else
      {
LABEL_12:
        v14 = 0;
        v13 = 0;
      }
LABEL_13:

      objc_sync_exit(v11);
      objc_autoreleasePoolPop(v10);
      if (!a4)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  v14 = 0;
  v13 = 0;
  if (a4)
LABEL_8:
    *a4 = v14;
LABEL_9:

  return v13;
}

- (NWStatsEntityMapperDynamicLaunchServices)init
{
  NWStatsEntityMapperDynamicLaunchServices *v2;
  NWStatsEntityMapCache *v3;
  NWStatsEntityMapCache *entityMap;
  void *v5;
  Class Class;
  NSObject *v7;
  void *coreServicesDylibHandle;
  Class LSPlugInKitProxyClass;
  Class LSApplicationProxyClass;
  Class LSApplicationWorkspaceClass;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  Class v17;
  __int16 v18;
  Class v19;
  __int16 v20;
  Class v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)NWStatsEntityMapperDynamicLaunchServices;
  v2 = -[NWStatsEntityMapperDynamicLaunchServices init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NWStatsEntityMapCache);
    entityMap = v2->_entityMap;
    v2->_entityMap = v3;

    v5 = dlopen((const char *)gCoreServicesFrameworkPath, 4);
    v2->_coreServicesDylibHandle = v5;
    if (!v5
      || (v2->_LSPlugInKitProxyClass = objc_getClass("LSPlugInKitProxy"),
          v2->_LSApplicationProxyClass = objc_getClass("LSApplicationProxy"),
          Class = objc_getClass("LSApplicationWorkspace"),
          v2->_LSApplicationWorkspaceClass = Class,
          !v2->_coreServicesDylibHandle)
      || !v2->_LSPlugInKitProxyClass
      || !v2->_LSApplicationProxyClass
      || !Class)
    {
      NStatGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        coreServicesDylibHandle = v2->_coreServicesDylibHandle;
        LSPlugInKitProxyClass = v2->_LSPlugInKitProxyClass;
        LSApplicationProxyClass = v2->_LSApplicationProxyClass;
        LSApplicationWorkspaceClass = v2->_LSApplicationWorkspaceClass;
        *(_DWORD *)buf = 134218752;
        v15 = coreServicesDylibHandle;
        v16 = 2048;
        v17 = LSPlugInKitProxyClass;
        v18 = 2048;
        v19 = LSApplicationProxyClass;
        v20 = 2048;
        v21 = LSApplicationWorkspaceClass;
        _os_log_impl(&dword_211429000, v7, OS_LOG_TYPE_FAULT, "LS Mapping dylib failure handle %p plugin proxy class %p app proxy class %p app workspace class %p", buf, 0x2Au);
      }

    }
  }
  return v2;
}

- (void)dealloc
{
  void *coreServicesDylibHandle;
  objc_super v4;

  coreServicesDylibHandle = self->_coreServicesDylibHandle;
  if (coreServicesDylibHandle)
    dlclose(coreServicesDylibHandle);
  v4.receiver = self;
  v4.super_class = (Class)NWStatsEntityMapperDynamicLaunchServices;
  -[NWStatsEntityMapperDynamicLaunchServices dealloc](&v4, sel_dealloc);
}

- (id)_attemptConvertingPluginNameToContainingAppName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[objc_class pluginKitProxyForIdentifier:](self->_LSPlugInKitProxyClass, "pluginKitProxyForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "containingBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "applicationIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_identifierForUUID:(id)a3 fromSet:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "allObjects", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NWStatsEntityMapperDynamicLaunchServices _attemptConvertingPluginNameToContainingAppName:](self, "_attemptConvertingPluginNameToContainingAppName:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v12[0] = v7;
    v12[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v6;
  }
  v10 = v9;

  return v10;
}

- (id)handleNewUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x212BD9F2C]();
  -[objc_class defaultWorkspace](self->_LSApplicationWorkspaceClass, "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v6, "bundleIdentifiersForMachOUUIDs:error:", v7, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;

  if (!v9 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      -[NWStatsEntityMapperDynamicLaunchServices _identifierForUUID:fromSet:](self, "_identifierForUUID:fromSet:", v4, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v10 = v14;
        v11 = v10;
        goto LABEL_3;
      }
    }
    else
    {

    }
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = 0;
LABEL_3:
  -[NWStatsEntityMapCache setEntry:forUUID:](self->_entityMap, "setEntry:forUUID:", v10, v4);

  objc_autoreleasePoolPop(v5);
  return v10;
}

- (id)extensionNameForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NWStatsEntityMapCache *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "UUIDString"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v7))
  {
    v8 = (void *)MEMORY[0x212BD9F2C]();
    v9 = self->_entityMap;
    objc_sync_enter(v9);
    -[NWStatsEntityMapCache entryForUUID:](self->_entityMap, "entryForUUID:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v11 = v10;
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithString:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

    objc_sync_exit(v9);
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)stateDictionary
{
  id v3;
  NWStatsEntityMapCache *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = self->_entityMap;
  objc_sync_enter(v4);
  -[NWStatsEntityMapCache stateDictionary](self->_entityMap, "stateDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("EntityMapper"));

  objc_sync_exit(v4);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityMap, 0);
}

@end
