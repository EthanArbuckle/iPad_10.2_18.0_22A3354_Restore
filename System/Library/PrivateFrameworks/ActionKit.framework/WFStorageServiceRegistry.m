@implementation WFStorageServiceRegistry

- (WFStorageServiceRegistry)init
{
  WFStorageServiceRegistry *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *registeredServices;
  WFStorageServiceRegistry *v12;
  objc_super v14;
  _QWORD v15[2];
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)WFStorageServiceRegistry;
  v2 = -[WFStorageServiceRegistry init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("WFStorageServicesAllowedServices");
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerDefaults:", v9);

    objc_msgSend((id)registeredStorageServiceClasses, "if_map:", &__block_literal_global_118);
    v10 = objc_claimAutoreleasedReturnValue();
    registeredServices = v2->_registeredServices;
    v2->_registeredServices = (NSArray *)v10;

    v12 = v2;
  }

  return v2;
}

- (NSArray)storageServices
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("WFStorageServicesAllowedServices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "WFEnforceClass";
      v19 = 2114;
      v20 = v6;
      v21 = 2114;
      v22 = (id)objc_opt_class();
      v23 = 2114;
      v24 = v5;
      v9 = v22;
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

    }
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  if (objc_msgSend(v7, "containsObject:", CFSTR("WFiCloudStorageService")))
  {
    objc_msgSend(v7, "arrayByAddingObject:", CFSTR("WFDefaultFileStorageService"));
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }
  -[WFStorageServiceRegistry registeredServices](self, "registeredServices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __43__WFStorageServiceRegistry_storageServices__block_invoke;
  v15[3] = &unk_24F8B6510;
  v16 = v7;
  v12 = v7;
  objc_msgSend(v11, "if_objectsPassingTest:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v13;
}

- (NSSet)objectRepresentationClasses
{
  void *v2;
  void *v3;
  void *v4;

  -[WFStorageServiceRegistry storageServices](self, "storageServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_125);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)storageServiceWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[WFStorageServiceRegistry registeredServices](self, "registeredServices", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend((id)objc_opt_class(), "serviceName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)registeredServices
{
  return self->_registeredServices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredServices, 0);
}

uint64_t __55__WFStorageServiceRegistry_objectRepresentationClasses__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectRepresentationClass");
}

uint64_t __43__WFStorageServiceRegistry_storageServices__block_invoke(uint64_t a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;

  v1 = *(void **)(a1 + 32);
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "containsObject:", v3);

  return v4;
}

id __32__WFStorageServiceRegistry_init__block_invoke()
{
  return (id)objc_opt_new();
}

+ (void)registerStorageServiceClass:(Class)a3
{
  if (registerStorageServiceClass__onceToken != -1)
    dispatch_once(&registerStorageServiceClass__onceToken, &__block_literal_global_19842);
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
    objc_msgSend((id)registeredStorageServiceClasses, "insertObject:atIndex:", a3, 0);
  else
    objc_msgSend((id)registeredStorageServiceClasses, "addObject:", a3);
}

+ (id)sharedRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__WFStorageServiceRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken != -1)
    dispatch_once(&sharedRegistry_onceToken, block);
  return (id)sharedRegistry_sharedRegistry;
}

void __42__WFStorageServiceRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "registerAllActionKitStorageServiceClasses");
  v1 = objc_opt_new();
  v2 = (void *)sharedRegistry_sharedRegistry;
  sharedRegistry_sharedRegistry = v1;

}

void __56__WFStorageServiceRegistry_registerStorageServiceClass___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)registeredStorageServiceClasses;
  registeredStorageServiceClasses = v0;

}

+ (void)registerAllActionKitStorageServiceClasses
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(a1, "registerStorageServiceClass:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

@end
