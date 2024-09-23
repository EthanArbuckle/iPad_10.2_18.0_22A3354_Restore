@implementation DMCRFMBDeviceEnvironment

- (id)installedAppBundleIdentifiers
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint8_t v17[16];
  _QWORD v18[4];
  NSObject *v19;
  DMCRFMBDeviceEnvironment *v20;
  id v21;
  _QWORD *v22;
  uint8_t *v23;
  _QWORD block[5];
  _QWORD v25[3];
  char v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v3 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216358000, v3, OS_LOG_TYPE_DEFAULT, "managed restore, installedAppBundleIdentifiers begin", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v28 = buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = (id)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setType:", 2);
  v33[0] = CFSTR("Identifier");
  v33[1] = CFSTR("Installing");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertyKeys:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 1);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v7 = dispatch_queue_create("installed_app_bundle_id_queue", 0);
  v8 = dispatch_time(0, 30000000000);
  v9 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__DMCRFMBDeviceEnvironment_installedAppBundleIdentifiers__block_invoke;
  block[3] = &unk_24D52E928;
  block[4] = v25;
  dispatch_after(v8, v7, block);
  objc_msgSend(MEMORY[0x24BE2C7E0], "currentUserConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __57__DMCRFMBDeviceEnvironment_installedAppBundleIdentifiers__block_invoke_15;
  v18[3] = &unk_24D52EE38;
  v11 = v7;
  v19 = v11;
  v20 = self;
  v22 = v25;
  v23 = buf;
  v12 = v6;
  v21 = v12;
  objc_msgSend(v10, "performRequest:completion:", v4, v18);

  v13 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_216358000, v13, OS_LOG_TYPE_DEFAULT, "managed restore, installedAppBundleIdentifiers waiting on main lock", v17, 2u);
  }
  objc_msgSend(v12, "lockWhenCondition:", 0);
  objc_msgSend(v12, "unlock");
  v14 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_216358000, v14, OS_LOG_TYPE_DEFAULT, "managed restore, installedAppBundleIdentifiers waiting on main lock - DONE", v17, 2u);
  }
  v15 = (void *)objc_msgSend(*((id *)v28 + 5), "copy");

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(buf, 8);

  return v15;
}

void __57__DMCRFMBDeviceEnvironment_installedAppBundleIdentifiers__block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v1 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "installed_app_bundle_id";
      v7 = 2048;
      v8 = 0x403E000000000000;
      _os_log_impl(&dword_216358000, v1, OS_LOG_TYPE_ERROR, "Task %s hasn't finished within %.1f seconds", (uint8_t *)&v5, 0x16u);
    }
    objc_msgSend(CFSTR("installed_app_bundle_id"), "stringByAppendingString:", CFSTR("_stackshot.ips"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BE2A7C8];
    DMCHangTracerDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dumpStackshotToPath:fileName:", v4, v2);

  }
}

void __57__DMCRFMBDeviceEnvironment_installedAppBundleIdentifiers__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[5];
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__DMCRFMBDeviceEnvironment_installedAppBundleIdentifiers__block_invoke_2;
  block[3] = &unk_24D52E928;
  block[4] = *(_QWORD *)(a1 + 56);
  dispatch_async(v7, block);
  v8 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216358000, v8, OS_LOG_TYPE_DEFAULT, "managed restore, installedAppBundleIdentifiers completion", buf, 2u);
  }
  if (v6)
  {
    v9 = *(NSObject **)(DMCLogObjects() + 32);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v6;
      _os_log_impl(&dword_216358000, v9, OS_LOG_TYPE_ERROR, "Error retrieving the list of apps on this device: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v5, "appsByBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(a1 + 40), "_shouldIncludeApp:", v16))
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

  }
  v17 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216358000, v17, OS_LOG_TYPE_DEFAULT, "managed restore, installedAppBundleIdentifiers waiting on completion lock", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 48), "lock");
  objc_msgSend(*(id *)(a1 + 48), "unlockWithCondition:", 0);
  v18 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216358000, v18, OS_LOG_TYPE_DEFAULT, "managed restore, installedAppBundleIdentifiers waiting on completion lock - DONE", buf, 2u);
  }

}

uint64_t __57__DMCRFMBDeviceEnvironment_installedAppBundleIdentifiers__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (BOOL)_shouldIncludeApp:(id)a3
{
  return 1;
}

@end
