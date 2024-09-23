@implementation MSDLanguageAndRegionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  return (id)sharedInstance_shared;
}

void __45__MSDLanguageAndRegionManager_sharedInstance__block_invoke()
{
  MSDLanguageAndRegionManager *v0;
  void *v1;

  v0 = objc_alloc_init(MSDLanguageAndRegionManager);
  v1 = (void *)sharedInstance_shared;
  sharedInstance_shared = (uint64_t)v0;

}

- (MSDLanguageAndRegionManager)init
{
  MSDLanguageAndRegionManager *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDLanguageAndRegionManager;
  v2 = -[MSDLanguageAndRegionManager init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.msd_language_and_region", 0);
    -[MSDLanguageAndRegionManager setQueue:](v2, "setQueue:", v3);

  }
  return v2;
}

- (BOOL)setDeviceLanguage:(id)a3 andRegion:(id)a4 sbRestartNeeded:(BOOL *)a5 sbRestartHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  dispatch_time_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  int *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  _QWORD handler[5];
  id v39;
  uint64_t *v40;
  _QWORD block[5];
  id v42;
  uint64_t *v43;
  uint64_t v44;
  int *v45;
  uint64_t v46;
  int v47;

  v10 = a3;
  v11 = a4;
  v37 = a6;
  v44 = 0;
  v45 = (int *)&v44;
  v46 = 0x2020000000;
  v47 = -1;
  +[MSDLanguageAndRegionHelper sharedInstance](MSDLanguageAndRegionHelper, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "setDeviceLanguage:andRegion:", v10, v11);

  if (v13 != 2)
  {
    v14 = dispatch_time(0, 60000000000);
    -[MSDLanguageAndRegionManager queue](self, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __92__MSDLanguageAndRegionManager_setDeviceLanguage_andRegion_sbRestartNeeded_sbRestartHandler___block_invoke;
    block[3] = &unk_24F47D1D0;
    v43 = &v44;
    block[4] = self;
    v17 = v37;
    v42 = v17;
    dispatch_after(v14, v15, block);

    v18 = v45;
    -[MSDLanguageAndRegionManager queue](self, "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    handler[0] = v16;
    handler[1] = 3221225472;
    handler[2] = __92__MSDLanguageAndRegionManager_setDeviceLanguage_andRegion_sbRestartNeeded_sbRestartHandler___block_invoke_4;
    handler[3] = &unk_24F47D1F8;
    handler[4] = self;
    v40 = &v44;
    v39 = v17;
    notify_register_dispatch("com.apple.springboard.finishedstartup", v18 + 6, v19, handler);

  }
  if (!-[MSDLanguageAndRegionManager saveDeviceLanguageIdentifier:](self, "saveDeviceLanguageIdentifier:", v10))
  {
    defaultLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MSDLanguageAndRegionManager setDeviceLanguage:andRegion:sbRestartNeeded:sbRestartHandler:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
LABEL_12:

    -[MSDLanguageAndRegionManager cancelNotifyToken:](self, "cancelNotifyToken:", v45[6]);
    v20 = 0;
    if (!a5)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (!-[MSDLanguageAndRegionManager saveDeviceRegionCode:](self, "saveDeviceRegionCode:", v11))
  {
    defaultLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MSDLanguageAndRegionManager setDeviceLanguage:andRegion:sbRestartNeeded:sbRestartHandler:].cold.1(v22, v30, v31, v32, v33, v34, v35, v36);
    goto LABEL_12;
  }
  v20 = 1;
  if (a5)
LABEL_6:
    *a5 = v13 != 2;
LABEL_7:
  _Block_object_dispose(&v44, 8);

  return v20;
}

uint64_t __92__MSDLanguageAndRegionManager_setDeviceLanguage_andRegion_sbRestartNeeded_sbRestartHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) != -1)
  {
    v1 = result;
    defaultLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_22A6E6000, v2, OS_LOG_TYPE_DEFAULT, "Deadline for Springboard restart passed.", v3, 2u);
    }

    objc_msgSend(*(id *)(v1 + 32), "cancelNotifyToken:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24));
    result = *(_QWORD *)(v1 + 40);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __92__MSDLanguageAndRegionManager_setDeviceLanguage_andRegion_sbRestartNeeded_sbRestartHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];
  uint64_t state64;
  int out_token;

  out_token = 0;
  notify_register_check("com.apple.springboard.finishedstartup", &out_token);
  result = out_token;
  if (out_token != -1)
  {
    state64 = 0;
    result = notify_get_state(out_token, &state64);
    if (state64)
    {
      defaultLogHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_22A6E6000, v3, OS_LOG_TYPE_DEFAULT, "Springboard restarted.", v4, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "cancelNotifyToken:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      result = *(_QWORD *)(a1 + 40);
      if (result)
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
    }
  }
  return result;
}

- (void)restoreDeviceLanguageAndRegionIfNeeded
{
  OUTLINED_FUNCTION_0_0(&dword_22A6E6000, a1, a3, "Failed to set device language and region.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (id)getCurrentDeviceLanguage
{
  void *v2;
  void *v3;

  +[MSDLanguageAndRegionHelper sharedInstance](MSDLanguageAndRegionHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getCurrentDeviceLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getCurrentDevicePreferredLanguage
{
  void *v2;
  void *v3;

  +[MSDLanguageAndRegionHelper sharedInstance](MSDLanguageAndRegionHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getCurrentDevicePreferredLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getCurrentDeviceRegion
{
  void *v2;
  void *v3;

  +[MSDLanguageAndRegionHelper sharedInstance](MSDLanguageAndRegionHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getCurrentDeviceRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getCurrentDeviceLocaleCode
{
  void *v2;
  void *v3;

  +[MSDLanguageAndRegionHelper sharedInstance](MSDLanguageAndRegionHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getCurrentLocaleCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)saveCurrentDeviceLanguageIdentifier
{
  MSDLanguageAndRegionManager *v2;
  void *v3;

  v2 = self;
  -[MSDLanguageAndRegionManager getCurrentDeviceLanguage](self, "getCurrentDeviceLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[MSDLanguageAndRegionManager saveDeviceLanguageIdentifier:](v2, "saveDeviceLanguageIdentifier:", v3);

  return (char)v2;
}

- (BOOL)saveCuurentDeviceRegionCode
{
  MSDLanguageAndRegionManager *v2;
  void *v3;

  v2 = self;
  -[MSDLanguageAndRegionManager getCurrentDeviceRegion](self, "getCurrentDeviceRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[MSDLanguageAndRegionManager saveDeviceRegionCode:](v2, "saveDeviceRegionCode:", v3);

  return (char)v2;
}

- (BOOL)saveDeviceLanguageIdentifier:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("DeviceLanguageIdentifier"));

  return v5;
}

- (id)deviceLanguageIdentifier
{
  void *v2;
  void *v3;

  +[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DeviceLanguageIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)saveDeviceRegionCode:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("DeviceRegionCode"));

  return v5;
}

- (id)deviceRegionCode
{
  void *v2;
  void *v3;

  +[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DeviceRegionCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)cancelNotifyToken:(int)a3
{
  if (a3 != -1)
    notify_cancel(a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDeviceLanguage:(uint64_t)a3 andRegion:(uint64_t)a4 sbRestartNeeded:(uint64_t)a5 sbRestartHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22A6E6000, a1, a3, "Failed to save device region.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)setDeviceLanguage:(uint64_t)a3 andRegion:(uint64_t)a4 sbRestartNeeded:(uint64_t)a5 sbRestartHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22A6E6000, a1, a3, "Failed to save device language.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
