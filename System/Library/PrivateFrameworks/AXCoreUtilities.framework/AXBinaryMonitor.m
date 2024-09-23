@implementation AXBinaryMonitor

+ (void)initialize
{
  id v2;

  v2 = +[AXBinaryMonitor sharedInstance](AXBinaryMonitor, "sharedInstance");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_18);
  return (id)sharedInstance__shared;
}

void __33__AXBinaryMonitor_sharedInstance__block_invoke()
{
  AXBinaryMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(AXBinaryMonitor);
  v1 = (void *)sharedInstance__shared;
  sharedInstance__shared = (uint64_t)v0;

}

- (AXBinaryMonitor)init
{
  AXBinaryMonitor *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  AXBinaryMonitor *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AXBinaryMonitor;
  v2 = -[AXBinaryMonitor init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXBinaryMonitor setBundleHandlerMap:](v2, "setBundleHandlerMap:", v3);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXBinaryMonitor setFrameworkHandlerMap:](v2, "setFrameworkHandlerMap:", v4);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXBinaryMonitor setDylibHandlerMap:](v2, "setDylibHandlerMap:", v5);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXBinaryMonitor setAppHandlerMap:](v2, "setAppHandlerMap:", v6);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXBinaryMonitor setAppExtensionHandlerMap:](v2, "setAppExtensionHandlerMap:", v7);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = dispatch_queue_create("AXBinaryMonitorQueue", v9);
    -[AXBinaryMonitor setBinaryMonitorQueue:](v2, "setBinaryMonitorQueue:", v10);

    AXPerformBlockAsynchronouslyOnMainThread(&__block_literal_global_3_1);
    v11 = v2;

  }
  return v2;
}

void __23__AXBinaryMonitor_init__block_invoke()
{
  _dyld_register_func_for_add_image((void (__cdecl *)(const mach_header *, intptr_t))_axmonitor_dyld_image_callback);
}

- (void)evaluateExistingBinaries
{
  NSObject *v2;

  -[AXBinaryMonitor binaryMonitorQueue](self, "binaryMonitorQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_4_0);

}

void __43__AXBinaryMonitor_evaluateExistingBinaries__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(MEMORY[0x1E0CB34D0], "allFrameworks");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "allBundles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayByAddingObjectsFromArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "safeStringForKey:", CFSTR("_resolvedPath"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          objc_msgSend(v8, "bundlePath");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v0, "axSafelyAddObject:", v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AXBinaryMonitor_evaluateExistingBinaries__block_invoke_2;
  block[3] = &unk_1E28C1C88;
  v12 = v0;
  v10 = v0;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __43__AXBinaryMonitor_evaluateExistingBinaries__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_9);
}

void __43__AXBinaryMonitor_evaluateExistingBinaries__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[AXBinaryMonitor sharedInstance](AXBinaryMonitor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_handleLoadedImagePath:", v2);

}

- (void)addHandler:(id)a3 forBundleID:(id)a4
{
  -[AXBinaryMonitor _addHandler:withName:toMap:](self, "_addHandler:withName:toMap:", a3, a4, &self->_bundleHandlerMap);
}

- (void)addHandler:(id)a3 forBundleName:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.bundle"), v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }
  -[AXBinaryMonitor _addHandler:withName:toMap:](self, "_addHandler:withName:toMap:", v10, v6, &self->_bundleHandlerMap);

}

- (void)addHandler:(id)a3 forFramework:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "hasSuffix:", CFSTR(".bundle")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.framework"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  -[AXBinaryMonitor _addHandler:withName:toMap:](self, "_addHandler:withName:toMap:", v8, v6, &self->_frameworkHandlerMap);

}

- (void)addHandler:(id)a3 forDylib:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "hasSuffix:", CFSTR(".dylib")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.dylib"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  -[AXBinaryMonitor _addHandler:withName:toMap:](self, "_addHandler:withName:toMap:", v8, v6, &self->_dylibHandlerMap);

}

- (void)addHandler:(id)a3 forAppExtension:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "hasSuffix:", CFSTR(".appex")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.appex"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  -[AXBinaryMonitor _addHandler:withName:toMap:](self, "_addHandler:withName:toMap:", v8, v6, &self->_appExtensionHandlerMap);

}

- (void)addHandler:(id)a3 forApp:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "hasSuffix:", CFSTR(".app")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.app"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  -[AXBinaryMonitor _addHandler:withName:toMap:](self, "_addHandler:withName:toMap:", v8, v6, &self->_appHandlerMap);

}

- (void)_addHandler:(id)a3 withName:(id)a4 toMap:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  _QWORD block[4];
  id v17;
  AXBinaryMonitor *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v8 = a4;
  v9 = (void *)objc_msgSend(a3, "copy");
  v10 = *a5;
  v11 = v10;
  if (!a3)
  {
    v15 = CFSTR("not adding handler, block was null");
LABEL_6:
    _AXLogWithFacility(0, 0, 1, 0, 0, 0, 0, 0.0, 0, 1, v15);
    goto LABEL_7;
  }
  if (!v8)
  {
    v15 = CFSTR("not adding handler, binary name was nil");
    goto LABEL_6;
  }
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __46__AXBinaryMonitor__addHandler_withName_toMap___block_invoke;
  v19[3] = &unk_1E28C3740;
  v20 = v10;
  v13 = v8;
  v21 = v13;
  v22 = v9;
  AXPerformBlockSynchronouslyOnMainThread(v19);
  -[AXBinaryMonitor binaryMonitorQueue](self, "binaryMonitorQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __46__AXBinaryMonitor__addHandler_withName_toMap___block_invoke_2;
  block[3] = &unk_1E28C2E80;
  v17 = v13;
  v18 = self;
  dispatch_async(v14, block);

LABEL_7:
}

void __46__AXBinaryMonitor__addHandler_withName_toMap___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "mutableCopy");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v4, "addObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));
}

void __46__AXBinaryMonitor__addHandler_withName_toMap___block_invoke_2(uint64_t a1)
{
  uint32_t v2;
  uint32_t v3;
  uint32_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *image_name;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v2 = _dyld_image_count();
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = MEMORY[0x1E0C809B0];
    v6 = MEMORY[0x1E0C80D38];
    do
    {
      image_name = _dyld_get_image_name(v4);
      if (image_name)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", image_name);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          if (objc_msgSend(v8, "rangeOfString:", *(_QWORD *)(a1 + 32)) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v10[0] = v5;
            v10[1] = 3221225472;
            v10[2] = __46__AXBinaryMonitor__addHandler_withName_toMap___block_invoke_3;
            v10[3] = &unk_1E28C2E80;
            v10[4] = *(_QWORD *)(a1 + 40);
            v11 = v9;
            dispatch_async(v6, v10);

          }
        }

      }
      ++v4;
    }
    while (v3 != v4);
  }
}

uint64_t __46__AXBinaryMonitor__addHandler_withName_toMap___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLoadedImagePath:", *(_QWORD *)(a1 + 40));
}

- (id)_bundleNameAndType:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_loadImageIsFramework:(id)a3
{
  void *v3;
  char v4;

  -[AXBinaryMonitor _bundleNameAndType:](self, "_bundleNameAndType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(".framework"));

  return v4;
}

- (BOOL)_loadImageIsBundle:(id)a3
{
  void *v3;
  char v4;

  -[AXBinaryMonitor _bundleNameAndType:](self, "_bundleNameAndType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR("bundle")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("Bundle"));

  return v4;
}

- (BOOL)_loadImageIsDylib:(id)a3
{
  void *v3;
  char v4;

  -[AXBinaryMonitor _bundleNameAndType:](self, "_bundleNameAndType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(".dylib"));

  return v4;
}

- (BOOL)_loadImageIsApp:(id)a3
{
  void *v3;
  char v4;

  -[AXBinaryMonitor _bundleNameAndType:](self, "_bundleNameAndType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(".app"));

  return v4;
}

- (BOOL)_loadImageIsAppExtension:(id)a3
{
  void *v3;
  char v4;

  -[AXBinaryMonitor _bundleNameAndType:](self, "_bundleNameAndType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(".appex"));

  return v4;
}

- (id)_frameworkNameForImage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "pathComponents", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasSuffix:", CFSTR("framework")) & 1) != 0)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)_bundleNameForImage:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "pathComponents", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "lowercaseString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "hasSuffix:", CFSTR("bundle"));

        if ((v10 & 1) != 0)
        {
          v11 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)_appExtensionNameForImage:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "pathComponents", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "hasSuffix:", CFSTR("appex")) & 1) != 0)
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)_appNameForImage:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "pathComponents", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "hasSuffix:", CFSTR("app")) & 1) != 0)
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)_dylibNameForImage:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "pathComponents", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "hasSuffix:", CFSTR("dylib")) & 1) != 0)
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)_applyHandlerBlocks:(id)a3 handlerMap:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v6, "objectForKey:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++) + 16))();
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "removeObjectForKey:", v5);
}

- (void)_handleLoadedImagePath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    if (-[AXBinaryMonitor _loadImageIsFramework:](self, "_loadImageIsFramework:", v4))
    {
      -[AXBinaryMonitor _frameworkNameForImage:](self, "_frameworkNameForImage:", v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXBinaryMonitor frameworkHandlerMap](self, "frameworkHandlerMap");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v8 = (void *)v6;
      -[AXBinaryMonitor _applyHandlerBlocks:handlerMap:](self, "_applyHandlerBlocks:handlerMap:", v5, v6);

      v4 = v9;
      goto LABEL_13;
    }
    if (-[AXBinaryMonitor _loadImageIsBundle:](self, "_loadImageIsBundle:", v9))
    {
      -[AXBinaryMonitor _bundleNameForImage:](self, "_bundleNameForImage:", v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXBinaryMonitor bundleHandlerMap](self, "bundleHandlerMap");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (-[AXBinaryMonitor _loadImageIsDylib:](self, "_loadImageIsDylib:", v9))
    {
      -[AXBinaryMonitor _dylibNameForImage:](self, "_dylibNameForImage:", v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXBinaryMonitor dylibHandlerMap](self, "dylibHandlerMap");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (-[AXBinaryMonitor _loadImageIsAppExtension:](self, "_loadImageIsAppExtension:", v9))
    {
      -[AXBinaryMonitor _appExtensionNameForImage:](self, "_appExtensionNameForImage:", v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXBinaryMonitor appExtensionHandlerMap](self, "appExtensionHandlerMap");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v7 = -[AXBinaryMonitor _loadImageIsApp:](self, "_loadImageIsApp:", v9);
    v4 = v9;
    if (v7)
    {
      -[AXBinaryMonitor _appNameForImage:](self, "_appNameForImage:", v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXBinaryMonitor appHandlerMap](self, "appHandlerMap");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (NSMutableDictionary)bundleHandlerMap
{
  return self->_bundleHandlerMap;
}

- (void)setBundleHandlerMap:(id)a3
{
  objc_storeStrong((id *)&self->_bundleHandlerMap, a3);
}

- (NSMutableDictionary)frameworkHandlerMap
{
  return self->_frameworkHandlerMap;
}

- (void)setFrameworkHandlerMap:(id)a3
{
  objc_storeStrong((id *)&self->_frameworkHandlerMap, a3);
}

- (NSMutableDictionary)dylibHandlerMap
{
  return self->_dylibHandlerMap;
}

- (void)setDylibHandlerMap:(id)a3
{
  objc_storeStrong((id *)&self->_dylibHandlerMap, a3);
}

- (NSMutableDictionary)appHandlerMap
{
  return self->_appHandlerMap;
}

- (void)setAppHandlerMap:(id)a3
{
  objc_storeStrong((id *)&self->_appHandlerMap, a3);
}

- (NSMutableDictionary)appExtensionHandlerMap
{
  return self->_appExtensionHandlerMap;
}

- (void)setAppExtensionHandlerMap:(id)a3
{
  objc_storeStrong((id *)&self->_appExtensionHandlerMap, a3);
}

- (OS_dispatch_queue)binaryMonitorQueue
{
  return self->_binaryMonitorQueue;
}

- (void)setBinaryMonitorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_binaryMonitorQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryMonitorQueue, 0);
  objc_storeStrong((id *)&self->_appExtensionHandlerMap, 0);
  objc_storeStrong((id *)&self->_appHandlerMap, 0);
  objc_storeStrong((id *)&self->_dylibHandlerMap, 0);
  objc_storeStrong((id *)&self->_frameworkHandlerMap, 0);
  objc_storeStrong((id *)&self->_bundleHandlerMap, 0);
}

@end
