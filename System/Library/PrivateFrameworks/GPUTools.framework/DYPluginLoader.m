@implementation DYPluginLoader

+ (id)sharedPluginLoader
{
  if (sharedPluginLoader_registry_once != -1)
    dispatch_once(&sharedPluginLoader_registry_once, &__block_literal_global_3);
  return (id)sharedPluginLoader_loader;
}

uint64_t __36__DYPluginLoader_sharedPluginLoader__block_invoke()
{
  uint64_t result;

  result = objc_opt_new();
  sharedPluginLoader_loader = result;
  return result;
}

+ (id)loadGPUToolsPlugins
{
  return (id)objc_msgSend(a1, "loadGPUToolsPluginsInMainBundleOnly:", 0);
}

+ (id)loadGPUToolsPluginsInMainBundleOnly:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  DYStandardPluginDirectoryProvider *v8;
  void *v9;

  v3 = a3;
  v5 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if (!v5)
    +[DYPluginLoader loadGPUToolsPluginsInMainBundleOnly:].cold.1(0, v6, v7);
  v8 = -[DYStandardPluginDirectoryProvider initWithBundle:includeDeveloperDirectory:includeBundleDirectory:]([DYStandardPluginDirectoryProvider alloc], "initWithBundle:includeDeveloperDirectory:includeBundleDirectory:", v5, !v3, 0);
  v9 = (void *)objc_msgSend(a1, "loadPluginsWithProvider:pathExtension:", v8, CFSTR("gtplugin"));

  return v9;
}

+ (BOOL)loadPluginWithBundle:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a1, "sharedPluginLoader"), "_loadBundle:", a3);
}

+ (id)loadPluginsWithProvider:(id)a3 pathExtension:(id)a4
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "sharedPluginLoader"), "_loadPluginsWithProvider:pathExtension:matchingRegex:", a3, a4, 0);
}

+ (id)loadLatestPlatformSupportPlugInWithProvider:(id)a3 baseExtension:(id)a4
{
  const __CFString *v7;

  if (getenv("GT_DEVELOPER_DIR"))
    v7 = CFSTR("_osx");
  else
    v7 = CFSTR("_ios");
  return (id)objc_msgSend((id)objc_msgSend(a1, "sharedPluginLoader"), "loadLatestPlatformSupportPlugInWithProvider:baseExtension:preferredPluginExtension:", a3, a4, objc_msgSend(a4, "stringByAppendingString:", v7));
}

- (id)loadLatestPlatformSupportPlugInWithProvider:(id)a3 baseExtension:(id)a4 preferredPluginExtension:(id)a5
{
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[10];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;

  v9 = objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __101__DYPluginLoader_loadLatestPlatformSupportPlugInWithProvider_baseExtension_preferredPluginExtension___block_invoke;
  v15[3] = &unk_250D59200;
  v15[4] = v9;
  v15[5] = a4;
  v15[8] = &v16;
  v15[9] = &v22;
  v15[6] = CFSTR("GPUToolsPlatformSupport-");
  v15[7] = a5;
  objc_msgSend(a3, "enumerateDirectories:", v15);
  v10 = (void *)v17[5];
  if (v10
    && (v11 = (void *)objc_msgSend(v10, "lastPathComponent")) != 0
    && (-[NSMutableSet containsObject:](self->_loadedPluginNames, "containsObject:", v11) & 1) == 0
    && (v12 = objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v17[5])) != 0
    && -[DYPluginLoader _loadBundle:](self, "_loadBundle:", v12))
  {
    v13 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "stringByDeletingPathExtension"), "substringFromIndex:", objc_msgSend(CFSTR("GPUToolsPlatformSupport-"), "length")), "copy");
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend((id)v17[5], "fileSystemRepresentation");
  objc_msgSend((id)v23[5], "UTF8String");
  DYLog();

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v13;
}

void __101__DYPluginLoader_loadLatestPlatformSupportPlugInWithProvider_baseExtension_preferredPluginExtension___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  v5 = *MEMORY[0x24BDBCC60];
  v15 = v4;
  v6 = (void *)objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a2, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", *MEMORY[0x24BDBCCD0], *MEMORY[0x24BDBCC60], 0), 0, 0);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v16 = *MEMORY[0x24BDBD2A0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        v17 = 0;
        objc_msgSend(v11, "getResourceValue:forKey:error:", &v17, v5, 0);
        v12 = (void *)objc_msgSend(v11, "lastPathComponent");
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v12) & 1) == 0
          && objc_msgSend((id)objc_msgSend(v12, "pathExtension"), "hasPrefix:", *(_QWORD *)(a1 + 40))
          && objc_msgSend(v12, "hasPrefix:", *(_QWORD *)(a1 + 48))
          && objc_msgSend(v17, "BOOLValue"))
        {
          v13 = (void *)-[__CFDictionary objectForKeyedSubscript:](CFBundleCopyInfoDictionaryForURL((CFURLRef)v11), "objectForKeyedSubscript:", v16);
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
          {
            v28 = 0u;
            v29 = 0u;
            _LSGetVersionFromString();
            v26 = 0u;
            v27 = 0u;
            _LSGetVersionFromString();
            v24 = v28;
            v25 = v29;
            v22 = v26;
            v23 = v27;
            v14 = _LSVersionNumberCompare();
            if (v14 == 1
              || !v14
              && objc_msgSend((id)objc_msgSend(v12, "pathExtension"), "isEqualToString:", *(_QWORD *)(a1 + 56)))
            {

              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v11;
              goto LABEL_16;
            }
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v11;
LABEL_16:
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(v13, "copy");
          }
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    }
    while (v8);
  }

}

+ (id)loadPluginsWithProvider:(id)a3 pathExtension:(id)a4 matchingRegex:(id)a5
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "sharedPluginLoader"), "_loadPluginsWithProvider:pathExtension:matchingRegex:", a3, a4, a5);
}

+ (id)loadPluginsInDirectory:(id)a3 pathExtension:(id)a4 matchingRegex:(id)a5
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "sharedPluginLoader"), "_loadPluginsInDirectory:pathExtension:matchingRegex:", a3, a4, a5);
}

+ (id)loadPluginsInDirectory:(id)a3 pathExtension:(id)a4
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "sharedPluginLoader"), "_loadPluginsInDirectory:pathExtension:matchingRegex:", a3, a4, 0);
}

+ (id)getLoadedPluginNames
{
  return *(id *)(objc_msgSend(a1, "sharedPluginLoader") + 8);
}

- (DYPluginLoader)init
{
  DYPluginLoader *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DYPluginLoader;
  v2 = -[DYPluginLoader init](&v4, sel_init);
  if (v2)
  {
    v2->_loadedPluginNames = (NSMutableSet *)objc_opt_new();
    v2->_loading = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYPluginLoader;
  -[DYPluginLoader dealloc](&v3, sel_dealloc);
}

- (BOOL)_loadBundle:(id)a3
{
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    -[DYPluginLoader _loadBundle:].cold.1((uint64_t)self, (uint64_t)a2, 0);
  v30 = 0;
  v5 = CFBundleCopyInfoDictionaryForURL((CFURLRef)objc_msgSend(a3, "bundleURL"));
  if (!v5)
    goto LABEL_33;
  v6 = v5;
  v7 = objc_msgSend(a3, "URLForResource:withExtension:", CFSTR("PlugIn"), CFSTR("plist"));
  if (!v7)
    goto LABEL_33;
  v8 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v7, 0, &v30);
  if (v8)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v8, 0, 0, &v30);
    if (!v9)
    {
      objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "UTF8String");
      objc_msgSend((id)objc_msgSend(v30, "localizedDescription"), "UTF8String");
LABEL_33:
      DYLog();
      return 0;
    }
  }
  else
  {
    v9 = 0;
  }
  if (_loadBundle__onceToken != -1)
    dispatch_once(&_loadBundle__onceToken, &__block_literal_global_30);
  if (_loadBundle__onceToken_37 != -1)
    dispatch_once(&_loadBundle__onceToken_37, &__block_literal_global_38);
  if ((objc_msgSend(a3, "loadAndReturnError:", &v30) & 1) == 0)
  {
    v22 = (void *)objc_msgSend(a3, "executablePath");
    if (v22)
    {
      v23 = dlopen_preflight((const char *)objc_msgSend(v22, "fileSystemRepresentation"));
      objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "UTF8String");
      objc_msgSend((id)objc_msgSend(v30, "localizedDescription"), "UTF8String");
      if (!v23)
        dlerror();
    }
    else
    {
      objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "UTF8String");
    }
    goto LABEL_33;
  }
  v10 = -[__CFDictionary objectForKey:](v6, "objectForKey:", CFSTR("NSPrincipalClass"));
  if (v10)
  {
    v11 = (void *)v10;
    if (!objc_msgSend(a3, "principalClass"))
    {
      v24 = objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "UTF8String");
      v25 = objc_msgSend(v11, "UTF8String");
      DYLog();
      objc_msgSend(a3, "unload", v24, v25);
      return 0;
    }

  }
  if (v9)
  {
    v12 = +[DYExtensionRegistry sharedExtensionRegistry](DYExtensionRegistry, "sharedExtensionRegistry");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = (void *)objc_msgSend(v9, "objectForKey:", CFSTR("extensions"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v19 = -[DYExtension _initWithDictionary:bundle:]([DYExtension alloc], "_initWithDictionary:bundle:", v18, a3);
          if (!v19)
          {
            objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
            goto LABEL_33;
          }
          v20 = v19;
          objc_msgSend(v12, "registerExtension:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v15)
          continue;
        break;
      }
    }
  }
  -[NSMutableSet addObject:](self->_loadedPluginNames, "addObject:", objc_msgSend((id)objc_msgSend(a3, "bundleURL"), "lastPathComponent"));
  return 1;
}

uint64_t __30__DYPluginLoader__loadBundle___block_invoke()
{
  char *v0;
  uint64_t XcodeSelectDeveloperPath;
  void *v2;
  uint64_t v4;

  v0 = getenv("LD_LIBRARY_PATH");
  XcodeSelectDeveloperPath = GetXcodeSelectDeveloperPath();
  if (v0 && *v0)
    v2 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%@/../SharedFrameworks/"), v0, XcodeSelectDeveloperPath);
  else
    v2 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/../SharedFrameworks/"), XcodeSelectDeveloperPath, v4);
  return setenv("LD_LIBRARY_PATH", (const char *)objc_msgSend(v2, "UTF8String"), 1);
}

void *__30__DYPluginLoader__loadBundle___block_invoke_2()
{
  const char *v0;

  v0 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/../SharedFrameworks/LLDB.framework/LLDB"), GetXcodeSelectDeveloperPath()), "UTF8String");
  return dlopen(v0, 1);
}

- (id)_loadPluginsInDirectory:(id)a3 pathExtension:(id)a4 matchingRegex:(id)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v22 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_opt_new();
  v10 = *MEMORY[0x24BDBCC60];
  v21 = v9;
  v11 = (void *)objc_msgSend(v9, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a3, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", *MEMORY[0x24BDBCCD0], *MEMORY[0x24BDBCC60], 0), 0, 0);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v15);
        v23 = 0;
        objc_msgSend(v16, "getResourceValue:forKey:error:", &v23, v10, 0, v20);
        if (objc_msgSend((id)objc_msgSend(v16, "pathExtension"), "isEqualToString:", a4)
          && objc_msgSend(v23, "BOOLValue")
          && (!a5
           || objc_msgSend(a5, "numberOfMatchesInString:options:range:", objc_msgSend(v16, "lastPathComponent"), 0, 0, objc_msgSend((id)objc_msgSend(v16, "lastPathComponent"), "length")))&& (-[NSMutableSet containsObject:](self->_loadedPluginNames, "containsObject:", objc_msgSend(v16, "lastPathComponent")) & 1) == 0)
        {
          v17 = objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v16);
          if (v17)
          {
            v18 = (void *)v17;
            if (-[DYPluginLoader _loadBundle:](self, "_loadBundle:", v17))
              objc_msgSend(v22, "addObject:", objc_msgSend((id)objc_msgSend(v18, "bundleURL"), "lastPathComponent"));
          }
          else
          {
            v20 = objc_msgSend((id)objc_msgSend(v16, "path"), "UTF8String");
            DYLog();
          }
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  return v22;
}

- (id)_loadPluginsWithProvider:(id)a3 pathExtension:(id)a4
{
  return -[DYPluginLoader _loadPluginsWithProvider:pathExtension:matchingRegex:](self, "_loadPluginsWithProvider:pathExtension:matchingRegex:", a3, a4, 0);
}

- (id)_loadPluginsWithProvider:(id)a3 pathExtension:(id)a4 matchingRegex:(id)a5
{
  uint64_t v9;
  void *v10;
  _QWORD v12[8];

  if (!a3)
    -[DYPluginLoader _loadPluginsWithProvider:pathExtension:matchingRegex:].cold.1((uint64_t)self, (uint64_t)a2, 0);
  if (!a4)
    -[DYPluginLoader _loadPluginsWithProvider:pathExtension:matchingRegex:].cold.2((uint64_t)self, (uint64_t)a2, (uint64_t)a3);
  v9 = objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = (void *)v9;
  if (!self->_loading)
  {
    self->_loading = 1;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__DYPluginLoader__loadPluginsWithProvider_pathExtension_matchingRegex___block_invoke;
    v12[3] = &unk_250D59268;
    v12[4] = v9;
    v12[5] = self;
    v12[6] = a4;
    v12[7] = a5;
    objc_msgSend(a3, "enumerateDirectories:", v12);
    self->_loading = 0;
  }
  return v10;
}

uint64_t __71__DYPluginLoader__loadPluginsWithProvider_pathExtension_matchingRegex___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:", objc_msgSend(*(id *)(a1 + 40), "_loadPluginsInDirectory:pathExtension:matchingRegex:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)));
}

+ (void)loadGPUToolsPluginsInMainBundleOnly:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("+[DYPluginLoader loadGPUToolsPluginsInMainBundleOnly:]", ", a3, "gputools");
}

- (void)_loadBundle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("-[DYPluginLoader _loadBundle:]", ", a3, "bundle");
}

- (void)_loadPluginsWithProvider:(uint64_t)a1 pathExtension:(uint64_t)a2 matchingRegex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("-[DYPluginLoader _loadPluginsWithProvider:pathExtension:matchingRegex:]", ", a3, "provider");
}

- (void)_loadPluginsWithProvider:(uint64_t)a1 pathExtension:(uint64_t)a2 matchingRegex:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("-[DYPluginLoader _loadPluginsWithProvider:pathExtension:matchingRegex:]", ", a3, "pathExtension");
}

@end
