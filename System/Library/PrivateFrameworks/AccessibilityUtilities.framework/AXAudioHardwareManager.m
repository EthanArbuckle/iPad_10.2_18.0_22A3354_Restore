@implementation AXAudioHardwareManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_24);
  return (id)sharedManager_Manager;
}

void __39__AXAudioHardwareManager_sharedManager__block_invoke()
{
  AXAudioHardwareManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXAudioHardwareManager);
  v1 = (void *)sharedManager_Manager;
  sharedManager_Manager = (uint64_t)v0;

}

- (AXAudioHardwareManager)init
{
  AXAudioHardwareManager *v2;
  AXAudioHardwareManager *v3;
  AXAudioHardwareManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXAudioHardwareManager;
  v2 = -[AXAudioHardwareManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (BOOL)channelsAreAirplay:(id)a3 route:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  if (objc_msgSend(a3, "count") == 2)
  {
    objc_msgSend(v5, "outputs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "portType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C897C0]);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)channelsAreWiredHeadphones:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count") == 2)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "owningPortUID", (_QWORD)v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Wired Headphones"));

          if (!v10)
          {
            v11 = 0;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
    v11 = 1;
LABEL_13:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (void)enableMultiroute
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "category");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)ExistingCategory;
  ExistingCategory = v3;

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C89680];
  v9 = 0;
  v7 = objc_msgSend(v5, "setCategory:withOptions:error:", v6, 0, &v9);
  v8 = v9;

  if ((v7 & 1) == 0)
  {
    NSLog(CFSTR("Error: %@"), v8);
    NSLog(CFSTR("Error: %@"), v8);
  }

}

+ (void)disableMultiroute
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  id v6;

  v2 = (void *)ExistingCategory;
  if (ExistingCategory)
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v4 = objc_msgSend(v3, "setCategory:withOptions:error:", ExistingCategory, 0, &v6);
    v5 = v6;

    if ((v4 & 1) == 0)
    {
      NSLog(CFSTR("Error: %@"), v5);
      NSLog(CFSTR("Error: %@"), v5);
    }

    v2 = (void *)ExistingCategory;
  }
  ExistingCategory = 0;

}

+ (void)setDefaultPortChannels:(id)a3
{
  objc_storeStrong((id *)&TestingChannels, a3);
}

+ (void)setDefaultRouteDescription:(id)a3
{
  objc_storeStrong((id *)&DefaultRouteDescription, a3);
}

+ (id)defaultRouteDescription
{
  id v2;
  void *v3;

  if (DefaultRouteDescription)
  {
    v2 = (id)DefaultRouteDescription;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentRoute");
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (BOOL)isDolbyAtmosConfigured
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  BOOL v9;
  int v10;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioFormats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "intValue");
        if (v8 > 1836344106)
        {
          if (v8 > 1902324530)
          {
            if (v8 == 1902324531 || v8 == 2053319475)
            {
LABEL_30:
              v14 = 1;
              goto LABEL_32;
            }
          }
          else if (v8 == 1836344107 || v8 == 1885547315)
          {
            goto LABEL_30;
          }
        }
        else
        {
          if (v8 > 1835103274)
          {
            v9 = v8 == 1835103275;
            v10 = 1836343851;
          }
          else
          {
            v9 = v8 == 1667443507;
            v10 = 1700997939;
          }
          if (v9 || v8 == v10)
            goto LABEL_30;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_32:

  return v14;
}

+ (void)updateTestingChannels
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)TestingChannels;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "channel", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
    v10 = v2;
  else
    v10 = 0;
  objc_storeStrong((id *)&TestingChannels, v10);

}

+ (id)channelsForPort:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "updateTestingChannels");
  if (TestingChannels)
  {
    v5 = (id)TestingChannels;
  }
  else
  {
    if (AXProcessIsPreferences())
      objc_msgSend(a1, "enableMultiroute");
    if (AXProcessIsPreferences())
      objc_msgSend(a1, "disableMultiroute");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "channels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(MEMORY[0x1E0DBEF20], "channelWithChannel:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return v5;
}

+ (id)defaultPortChannels
{
  void *v3;
  void *v4;

  +[AXAudioHardwareManager defaultPort](AXAudioHardwareManager, "defaultPort");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "channelsForPort:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setDefaultPort:(id)a3
{
  objc_storeStrong((id *)&TestingPort, a3);
}

+ (id)defaultPort
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (TestingPort)
    return (id)TestingPort;
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF39A8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ignoreLogging");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39A8], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v10, v11))
    {
      AXColorizeFormatLog();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "outputs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v13;
        _os_log_impl(&dword_18C62B000, v10, v11, "%{public}@", buf, 0xCu);
      }

    }
  }

  return v6;
}

- (id)_savedIdForRouteDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "outputs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "UID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_11);
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("_"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __54__AXAudioHardwareManager__savedIdForRouteDescription___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)savedChannelsForOutput:(id)a3 forSource:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  char v32;
  void *v33;
  NSObject *v34;
  os_log_type_t v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  char v40;
  void *v41;
  NSObject *v42;
  os_log_type_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id obj;
  uint64_t v59;
  int v60;
  AXAudioHardwareManager *v61;
  int64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[4];
  void *v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_audioHardwareChannelLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = self;
  -[AXAudioHardwareManager _savedIdForRouteDescription:](self, "_savedIdForRouteDescription:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v12);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend(v6, "outputs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0x1E0CF3000uLL;
  v70 = v11;
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
  if (v63)
  {
    v54 = v12;
    v55 = v10;
    v56 = v8;
    v57 = v6;
    v59 = *(_QWORD *)v82;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v82 != v59)
          objc_enumerationMutation(obj);
        v64 = v14;
        v15 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v14);
        objc_msgSend(v15, "UID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v16, "isEqualToString:", CFSTR("Wired Headphones"));

        v71 = v15;
        objc_msgSend(v15, "channels");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v65 = v17;
        v68 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
        if (v68)
        {
          v67 = *(_QWORD *)v78;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v78 != v67)
                objc_enumerationMutation(v65);
              v69 = v18;
              v72 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v18);
              v73 = 0u;
              v74 = 0u;
              v75 = 0u;
              v76 = 0u;
              v19 = v66;
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
              if (v20)
              {
                v21 = v20;
                v22 = *(_QWORD *)v74;
                do
                {
                  for (i = 0; i != v21; ++i)
                  {
                    if (*(_QWORD *)v74 != v22)
                      objc_enumerationMutation(v19);
                    v24 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v24, "objectForKey:", CFSTR("portUID"));
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v71, "UID");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(v25, "isEqualToString:", v26) & 1) != 0)
                      {
                        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("channelNumber"));
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        v28 = objc_msgSend(v27, "intValue");
                        v29 = objc_msgSend(v72, "channelNumber");

                        v13 = 0x1E0CF3000;
                        v30 = v29 == v28;
                        v11 = v70;
                        if (!v30)
                        {
LABEL_23:
                          objc_msgSend(*(id *)(v13 + 2472), "sharedInstance", v51, v52, v53);
                          v31 = (void *)objc_claimAutoreleasedReturnValue();
                          v32 = objc_msgSend(v31, "ignoreLogging");

                          if ((v32 & 1) == 0)
                          {
                            objc_msgSend(*(id *)(v13 + 2472), "identifier");
                            v33 = (void *)objc_claimAutoreleasedReturnValue();
                            AXLoggerForFacility();
                            v34 = objc_claimAutoreleasedReturnValue();

                            v35 = AXOSLogLevelFromAXLogLevel();
                            if (os_log_type_enabled(v34, v35))
                            {
                              AXColorizeFormatLog();
                              v36 = (void *)objc_claimAutoreleasedReturnValue();
                              v52 = v72;
                              v53 = v11;
                              v51 = v24;
                              _AXStringForArgs();
                              v37 = (void *)objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v34, v35))
                              {
                                *(_DWORD *)buf = 138543362;
                                v86 = v37;
                                _os_log_impl(&dword_18C62B000, v34, v35, "%{public}@", buf, 0xCu);
                              }

                            }
                            v13 = 0x1E0CF3000;
                          }
                          continue;
                        }
                        objc_msgSend(MEMORY[0x1E0DBEF20], "channelWithChannel:", v72);
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v70, "addObject:", v25);
                      }
                      else
                      {

                      }
                      goto LABEL_23;
                    }
                  }
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
                }
                while (v21);
              }

              v18 = v69 + 1;
            }
            while (v69 + 1 != v68);
            v68 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
          }
          while (v68);
        }
        -[AXAudioHardwareManager _handleSurroundSoundDefaults:returnedChannels:port:source:](v61, "_handleSurroundSoundDefaults:returnedChannels:port:source:", v65, v11, v71, v62, v51);

        v14 = v64 + 1;
      }
      while (v64 + 1 != v63);
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
      if (!v63)
      {
        v8 = v56;
        v6 = v57;
        v12 = v54;
        v10 = v55;
        v38 = v60;
        goto LABEL_37;
      }
    }
  }
  v38 = 0;
LABEL_37:

  objc_msgSend(*(id *)(v13 + 2472), "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "ignoreLogging");

  if ((v40 & 1) == 0)
  {
    objc_msgSend(*(id *)(v13 + 2472), "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v42 = objc_claimAutoreleasedReturnValue();

    v43 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v42, v43))
    {
      AXColorizeFormatLog();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v66;
      v52 = v11;
      _AXStringForArgs();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, v43))
      {
        *(_DWORD *)buf = 138543362;
        v86 = v45;
        _os_log_impl(&dword_18C62B000, v42, v43, "%{public}@", buf, 0xCu);
      }

      v11 = v70;
    }

  }
  if (v38)
  {
    objc_msgSend(v6, "outputs");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "count") == 1)
    {
      v47 = objc_msgSend(v11, "count");

      if (v47 == 2)
      {
        v48 = 0;
        goto LABEL_52;
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v11, "count", v51, v52))
    v49 = v11;
  else
    v49 = 0;
  v48 = v49;
LABEL_52:

  return v48;
}

- (void)_handleSurroundSoundDefaults:(id)a3 returnedChannels:(id)a4 port:(id)a5 source:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "count") == 5 && !objc_msgSend(v10, "count"))
  {
    objc_msgSend(v11, "portType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C89838]);

    if (v13)
    {
      if (a6 == 2)
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v21 = v9;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v29 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              if (objc_msgSend(v26, "channelLabel", (_QWORD)v28) == 1
                || objc_msgSend(v26, "channelLabel") == 2
                || objc_msgSend(v26, "channelLabel") == 5
                || objc_msgSend(v26, "channelLabel") == 6)
              {
                objc_msgSend(MEMORY[0x1E0DBEF20], "channelWithChannel:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "addObject:", v27);

              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v23);
        }
        goto LABEL_29;
      }
      if (a6 == 1)
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v14 = v9;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v33;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v33 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
              if (objc_msgSend(v19, "channelLabel") == 3
                || objc_msgSend(v19, "channelLabel") == 9)
              {
                objc_msgSend(MEMORY[0x1E0DBEF20], "channelWithChannel:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "addObject:", v20);

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          }
          while (v16);
        }
LABEL_29:

      }
    }
  }

}

- (void)setSavedChannels:(id)a3 forOutput:(id)a4 forSource:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v31 = a4;
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_audioHardwareChannelLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  if (!v10)
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "mutableCopy");

  if (!v13)
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v10;
  v28 = v13;
  objc_msgSend(v10, "setObject:forKey:", v13, v14);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v36[0] = CFSTR("portUID");
        objc_msgSend(v21, "owningPortUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = CFSTR("channelNumber");
        v37[0] = v22;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "channelNumber"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v24);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v18);
  }

  -[AXAudioHardwareManager _savedIdForRouteDescription:](self, "_savedIdForRouteDescription:", v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogSpeechAssetDownload();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[AXAudioHardwareManager setSavedChannels:forOutput:forSource:].cold.1((uint64_t)v25, (uint64_t)v15, v26);

  objc_msgSend(v28, "setObject:forKey:", v15, v25);
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_setAudioHardwareChannelLayout:", v30);

}

- (void)setSavedChannels:(uint64_t)a1 forOutput:(uint64_t)a2 forSource:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_18C62B000, log, OS_LOG_TYPE_DEBUG, "saving channels: %{public}@ %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
