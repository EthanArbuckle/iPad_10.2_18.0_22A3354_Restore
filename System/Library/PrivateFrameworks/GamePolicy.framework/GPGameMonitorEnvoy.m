@implementation GPGameMonitorEnvoy

- (void)gameDidLaunch:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (+[GPGameMonitorEnvoy deviceSupportsGamePolicy](GPGameMonitorEnvoy, "deviceSupportsGamePolicy"))
  {
    if (gp_isInternalBuild())
    {
      getGPLogger();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = 138412290;
        v6 = v3;
        _os_log_impl(&dword_23C95F000, v4, OS_LOG_TYPE_INFO, "[GPGameMonitorEnvoy] gameDidLaunch: %@", (uint8_t *)&v5, 0xCu);
      }

    }
    notify_post((const char *)objc_msgSend(CFSTR("com.apple.gamepolicy.daemon.launch"), "UTF8String"));
  }

}

+ (BOOL)deviceSupportsGamePolicy
{
  if (deviceSupportsGamePolicy_onceToken != -1)
    dispatch_once(&deviceSupportsGamePolicy_onceToken, &__block_literal_global_2_0);
  return deviceSupportsGamePolicy__deviceSupportsGamePolicy;
}

+ (id)sharedInstance
{
  if (sharedInstance__onceToken != -1)
    dispatch_once(&sharedInstance__onceToken, &__block_literal_global_2);
  return (id)sharedInstance__sharedMonitor;
}

+ (id)shared
{
  return +[GPGameMonitorEnvoy sharedInstance](GPGameMonitorEnvoy, "sharedInstance");
}

void __36__GPGameMonitorEnvoy_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance__sharedMonitor;
  sharedInstance__sharedMonitor = v0;

}

uint64_t __46__GPGameMonitorEnvoy_deviceSupportsGamePolicy__block_invoke()
{
  uint64_t result;

  if ((_os_feature_enabled_impl() & 1) != 0)
    result = 1;
  else
    result = MGIsDeviceOneOfType();
  deviceSupportsGamePolicy__deviceSupportsGamePolicy = result;
  return result;
}

+ (id)gameCategories
{
  if (gameCategories_onceToken != -1)
    dispatch_once(&gameCategories_onceToken, &__block_literal_global_26);
  return (id)gameCategories__gameCategories;
}

void __36__GPGameMonitorEnvoy_gameCategories__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[21];

  v12[20] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDC1670];
  v12[0] = *MEMORY[0x24BDC16B8];
  v12[1] = v0;
  v1 = *MEMORY[0x24BDC1680];
  v12[2] = *MEMORY[0x24BDC1678];
  v12[3] = v1;
  v2 = *MEMORY[0x24BDC1690];
  v12[4] = *MEMORY[0x24BDC1688];
  v12[5] = v2;
  v3 = *MEMORY[0x24BDC16A0];
  v12[6] = *MEMORY[0x24BDC1698];
  v12[7] = v3;
  v4 = *MEMORY[0x24BDC16B0];
  v12[8] = *MEMORY[0x24BDC16A8];
  v12[9] = v4;
  v5 = *MEMORY[0x24BDC16C8];
  v12[10] = *MEMORY[0x24BDC16C0];
  v12[11] = v5;
  v6 = *MEMORY[0x24BDC16D8];
  v12[12] = *MEMORY[0x24BDC16D0];
  v12[13] = v6;
  v7 = *MEMORY[0x24BDC16E8];
  v12[14] = *MEMORY[0x24BDC16E0];
  v12[15] = v7;
  v8 = *MEMORY[0x24BDC16F8];
  v12[16] = *MEMORY[0x24BDC16F0];
  v12[17] = v8;
  v9 = *MEMORY[0x24BDC1708];
  v12[18] = *MEMORY[0x24BDC1700];
  v12[19] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 20);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)gameCategories__gameCategories;
  gameCategories__gameCategories = v10;

}

+ (id)gameModeBundleIdentifierAllowList
{
  if (gameModeBundleIdentifierAllowList_onceToken != -1)
    dispatch_once(&gameModeBundleIdentifierAllowList_onceToken, &__block_literal_global_28);
  return (id)gameModeBundleIdentifierAllowList__gameModeBundleIdentifierAllowList;
}

void __55__GPGameMonitorEnvoy_gameModeBundleIdentifierAllowList__block_invoke()
{
  void *v0;

  v0 = (void *)gameModeBundleIdentifierAllowList__gameModeBundleIdentifierAllowList;
  gameModeBundleIdentifierAllowList__gameModeBundleIdentifierAllowList = (uint64_t)&unk_250D990C0;

}

+ (BOOL)applicationIsIdentifiedGame:(id)a3 info:(id)a4 entitlements:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "genreID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntValue");

  v11 = 1;
  if (v10 != 6014 && (v10 - 7001) >= 0x11)
  {
    objc_msgSend(v7, "correspondingApplicationRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(a1, "gameModeBundleIdentifierAllowList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v57;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v57 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v12, "bundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v18) = objc_msgSend(v19, "isEqual:", v18);

          if ((v18 & 1) != 0)
          {

            goto LABEL_20;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        if (v15)
          continue;
        break;
      }
    }

    if (!v10)
    {
      v55 = 0;
      objc_msgSend(v12, "categoryTypesWithError:", &v55);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v55;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v28 = v27;
      v43 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      if (v43)
      {
        v29 = *(_QWORD *)v52;
        v30 = 0x250D96000uLL;
        v45 = v28;
        v42 = *(_QWORD *)v52;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v52 != v29)
              objc_enumerationMutation(v28);
            v44 = v31;
            v32 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v31);
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            objc_msgSend(*(id *)(v30 + 1696), "gameCategories");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
            if (v34)
            {
              v35 = v34;
              v36 = *(_QWORD *)v48;
              while (2)
              {
                for (j = 0; j != v35; ++j)
                {
                  if (*(_QWORD *)v48 != v36)
                    objc_enumerationMutation(v33);
                  v38 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
                  objc_msgSend(v32, "identifier");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v38) = objc_msgSend(v39, "isEqual:", v38);

                  if ((v38 & 1) != 0)
                  {

                    goto LABEL_20;
                  }
                }
                v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
                if (v35)
                  continue;
                break;
              }
            }

            v31 = v44 + 1;
            v28 = v45;
            v29 = v42;
            v30 = 0x250D96000;
          }
          while (v44 + 1 != v43);
          v43 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        }
        while (v43);
      }

    }
    if ((objc_msgSend(v8, "BOOLForKey:", CFSTR("com.apple.developer.sustained-execution")) & 1) != 0)
      goto LABEL_20;
    if ((objc_msgSend(v8, "BOOLForKey:", CFSTR("com.apple.developer.kernel.increased-memory-limit")) & 1) != 0)
      goto LABEL_20;
    if ((objc_msgSend(v8, "BOOLForKey:", CFSTR("com.apple.developer.kernel.increased-debugging-memory-limit")) & 1) != 0)
      goto LABEL_20;
    objc_msgSend(v7, "requiredDeviceCapabilities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsObject:", CFSTR("iphone-performance-gaming-tier"));

    if ((v21 & 1) != 0)
      goto LABEL_20;
    objc_msgSend(v12, "infoDictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:ofClass:", CFSTR("GCSupportsGameMode"), objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      goto LABEL_20;
    objc_msgSend(v7, "sdkVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "compare:options:", CFSTR("18.0"), 64);

    if (v25 != -1)
      goto LABEL_18;
    objc_msgSend(v12, "infoDictionary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKey:ofClass:", CFSTR("GCSupportsControllerUserInteraction"), objc_opt_class());
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
LABEL_20:
      v11 = 1;
    else
LABEL_18:
      v11 = 0;

  }
  return v11;
}

- (GPGameMonitorEnvoy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GPGameMonitorEnvoy;
  return -[GPGameMonitorEnvoy init](&v3, sel_init);
}

@end
