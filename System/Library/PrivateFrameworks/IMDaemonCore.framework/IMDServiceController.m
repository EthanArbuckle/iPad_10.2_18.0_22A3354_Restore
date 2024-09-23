@implementation IMDServiceController

- (id)serviceWithName:(id)a3
{
  NSMutableDictionary *services;
  void *v4;
  void *v5;

  if (a3)
  {
    services = self->_services;
    objc_msgSend(a3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](services, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSArray)allServices
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_services, "allValues");
}

+ (IMDServiceController)sharedController
{
  if (qword_1ED936068 != -1)
    dispatch_once(&qword_1ED936068, &unk_1E922BDD8);
  return (IMDServiceController *)(id)qword_1ED936050;
}

- (IMDServiceController)init
{
  IMDServiceController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *services;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDServiceController;
  v2 = -[IMDServiceController init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    services = v2->_services;
    v2->_services = v3;

  }
  return v2;
}

- (BOOL)_bundleAllowedToLoadWithProperties:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D36228]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Satellite")) & 1) != 0)
    goto LABEL_6;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D38F70]))
    goto LABEL_3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Lazuli")) & 1) != 0)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D38F50]))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLazuliEnabled");
    goto LABEL_4;
  }
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D38F60]))
  {
    v6 = 1;
    goto LABEL_7;
  }
LABEL_3:
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCarrierPigeonEnabled");
LABEL_4:
  v6 = v5;

LABEL_7:
  return v6;
}

- (void)registerSessionClassWithBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSMutableDictionary *services;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v4, "pathForResource:ofType:", CFSTR("ServiceProperties"), CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[IMDServiceController _bundleAllowedToLoadWithProperties:](self, "_bundleAllowedToLoadWithProperties:", v7);
  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D36228]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D362B0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D36210]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    v14 = IMOSLoggingEnabled(v13);
    if ((_DWORD)v14)
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v26 = 138412290;
        v27 = v4;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Registering bundle: %@", (uint8_t *)&v26, 0xCu);
      }

    }
    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v26 = 138412290;
        v27 = v9;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "   => Internal service with name: %@", (uint8_t *)&v26, 0xCu);
      }

    }
    if (v9)
    {
      services = self->_services;
      objc_msgSend(v9, "lowercaseString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](services, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(services) = v19 == 0;

      if ((_DWORD)services)
      {
        if (v12)
          v20 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBundle:subServiceName:", v4, v10);
        else
          v20 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBundle:", v4);
        v23 = (void *)v20;
        if (v20)
        {
          v24 = self->_services;
          objc_msgSend(v9, "lowercaseString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v23, v25);

          -[NSMutableDictionary removeAllObjects](self->_serviceCapabilityCache, "removeAllObjects");
          -[NSMutableDictionary removeAllObjects](self->_serviceNameCapabilityCache, "removeAllObjects");
        }

      }
    }

  }
  else if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "bundlePath");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v22;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Refusing to register service %@, not allowed", (uint8_t *)&v26, 0xCu);

    }
  }

}

- (id)serviceWithReplicationSourceID:(int64_t)a3
{
  NSMutableDictionary *services;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!a3)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1D14E4090;
  v11 = sub_1D14E40A0;
  v12 = 0;
  services = self->_services;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D14E40A8;
  v6[3] = &unk_1E922BE00;
  v6[4] = &v7;
  v6[5] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](services, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)servicesSupportingCapability:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSMutableDictionary *services;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_serviceCapabilityCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    services = self->_services;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = sub_1D14E4214;
    v16 = &unk_1E922BE28;
    v9 = v4;
    v17 = v9;
    v18 = v7;
    v10 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](services, "enumerateKeysAndObjectsUsingBlock:", &v13);
    v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);
    -[NSMutableDictionary setObject:forKey:](self->_serviceCapabilityCache, "setObject:forKey:", v11, v9);
    v6 = v11;

  }
  return v6;
}

- (id)serviceNamesSupportingCapability:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_serviceNameCapabilityCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[IMDServiceController servicesSupportingCapability:](self, "servicesSupportingCapability:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "internalName", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    v15 = (void *)objc_msgSend(v8, "copy");
    -[NSMutableDictionary setObject:forKey:](self->_serviceNameCapabilityCache, "setObject:forKey:", v15, v4);
    v6 = v15;

  }
  return v6;
}

- (NSMutableDictionary)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_storeStrong((id *)&self->_services, a3);
}

- (NSMutableDictionary)serviceCapabilityCache
{
  return self->_serviceCapabilityCache;
}

- (void)setServiceCapabilityCache:(id)a3
{
  objc_storeStrong((id *)&self->_serviceCapabilityCache, a3);
}

- (NSMutableDictionary)serviceNameCapabilityCache
{
  return self->_serviceNameCapabilityCache;
}

- (void)setServiceNameCapabilityCache:(id)a3
{
  objc_storeStrong((id *)&self->_serviceNameCapabilityCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceNameCapabilityCache, 0);
  objc_storeStrong((id *)&self->_serviceCapabilityCache, 0);
  objc_storeStrong((id *)&self->_services, 0);
}

@end
