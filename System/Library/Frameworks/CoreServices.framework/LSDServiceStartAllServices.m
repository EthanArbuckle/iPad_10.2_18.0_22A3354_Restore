@implementation LSDServiceStartAllServices

void ___LSDServiceStartAllServices_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *SharedInstance;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  __int128 buf;
  Class v22;
  Class v23;
  Class v24;
  Class v25;
  Class v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)_LSDServiceStartAllServices::services;
  _LSDServiceStartAllServices::services = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = (void *)_LSDServiceStartAllServices::listeners;
  _LSDServiceStartAllServices::listeners = (uint64_t)v2;

  *(_QWORD *)&buf = NSClassFromString(CFSTR("_LSDReadService"));
  *((_QWORD *)&buf + 1) = NSClassFromString(CFSTR("_LSDModifyService"));
  v22 = NSClassFromString(CFSTR("_LSDOpenService"));
  v23 = NSClassFromString(CFSTR("_LSDDeviceIdentifierService"));
  v24 = NSClassFromString(CFSTR("_LSDIconService"));
  v25 = NSClassFromString(CFSTR("_LSDRebuildService"));
  v26 = NSClassFromString(CFSTR("_LSDAppProtectionService"));
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _LSDServiceStartAllServices()_block_invoke");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("LSDService.mm"), 334, CFSTR("Failed to get LSDService subclass list for process %lu"), getpid());

  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "XPCConnectionIsAlwaysPrivileged"))
        {
          SharedInstance = (void *)__LSDefaultsGetSharedInstance();
          if (objc_msgSend(SharedInstance, "proxyUIDForUID:", getuid()))
            continue;
        }
        if (objc_msgSend(v10, "isEnabled"))
          objc_msgSend(v5, "addObject:", v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  _LSDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_DEFAULT, "Starting services: %@", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_29);

}

void ___LSDServiceStartAllServices_block_invoke_27(uint64_t a1, void *a2)
{
  void *SharedInstance;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  SharedInstance = (void *)__LSDefaultsGetSharedInstance();
  objc_msgSend(SharedInstance, "serviceNameForConnectionType:lightweightSystemService:", objc_msgSend(a2, "connectionType"), objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _LSDServiceStartAllServices()_block_invoke");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("LSDService.mm"), 356, CFSTR("Failed to create XPC service name for class %@"), a2);

  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v11);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc((Class)a2), "initWithXPCListener:", v4);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _LSDServiceStartAllServices()_block_invoke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("LSDService.mm"), 365, CFSTR("Failed to create XPC service object of class %@"), a2);

    }
    objc_msgSend(v4, "setDelegate:", v5);
    objc_msgSend(v4, "resume");
    objc_msgSend((id)_LSDServiceStartAllServices::services, "addObject:", v5);
    objc_msgSend((id)_LSDServiceStartAllServices::listeners, "addObject:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _LSDServiceStartAllServices()_block_invoke");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("LSDService.mm"), 361, CFSTR("Failed to create XPC listener for class %@"), a2);

  }
}

@end
