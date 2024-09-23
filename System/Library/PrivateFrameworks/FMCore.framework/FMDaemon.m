@implementation FMDaemon

- (void)run
{
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __15__FMDaemon_run__block_invoke;
  v3[3] = &unk_1E82AA5A8;
  v3[4] = self;
  -[FMDaemon startupWithCompletion:](self, "startupWithCompletion:", v3);
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "run");

}

uint64_t __15__FMDaemon_run__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerXPCEventHandlers");
}

- (void)initialize
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __22__FMDaemon_initialize__block_invoke;
  v2[3] = &unk_1E82AA5A8;
  v2[4] = self;
  -[FMDaemon startupWithCompletion:](self, "startupWithCompletion:", v2);
}

uint64_t __22__FMDaemon_initialize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerXPCEventHandlers");
}

- (void)startupWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FMDaemon startup](self, "startup");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (id)xpcDarwinEventHandlers
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)xpcDistributedEventHandlers
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (void)registerXPCEventHandlers
{
  void *v3;
  id v4;

  -[FMDaemon xpcDarwinEventHandlers](self, "xpcDarwinEventHandlers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    +[FMXPCNotificationsUtil handleDarwinNotificationsWithHandlers:](FMXPCNotificationsUtil, "handleDarwinNotificationsWithHandlers:", v4);
  -[FMDaemon xpcDistributedEventHandlers](self, "xpcDistributedEventHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    +[FMXPCNotificationsUtil handleDistributedNotificationsWithHandlers:](FMXPCNotificationsUtil, "handleDistributedNotificationsWithHandlers:", v3);

}

- (id)verifyLaunchEventsConfiguration:(id)a3 withExclusions:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  FMDaemon *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v50 = self;
    v52 = v8;
    v53 = v7;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LaunchEvents"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("com.apple.notifyd.matching"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v64;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v64 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(v12, "addObject:", v18);
          objc_msgSend(v13, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Notification"));
          v20 = (id)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v18, "isEqualToString:", v20))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Darwin event key %@ does not match with its notification name %@"), v18, v20);
            v26 = (id)objc_claimAutoreleasedReturnValue();
            v21 = v13;
            v9 = v52;
            v7 = v53;
            goto LABEL_37;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
        if (v15)
          continue;
        break;
      }
    }

    v7 = v53;
    objc_msgSend(v12, "minusSet:", v53);
    -[FMDaemon xpcDarwinEventHandlers](v50, "xpcDarwinEventHandlers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __59__FMDaemon_verifyLaunchEventsConfiguration_withExclusions___block_invoke;
    v61[3] = &unk_1E82AA5D0;
    v20 = v22;
    v62 = v20;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v61);
    objc_msgSend(v20, "minusSet:", v53);
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v24, "minusSet:", v20);
    if (objc_msgSend(v24, "count"))
      objc_msgSend(v23, "appendFormat:", CFSTR("launchd plist has these darwin notifications that don't have a handler defined in code: %@\n"), v24);
    v25 = (void *)objc_msgSend(v20, "mutableCopy");
    objc_msgSend(v25, "minusSet:", v12);
    if (objc_msgSend(v25, "count"))
      objc_msgSend(v23, "appendFormat:", CFSTR("launchd plist does not have these darwin notifications but, they have a handler defined in code: %@\n"), v25);
    v49 = v25;
    v9 = v52;
    if (objc_msgSend(v23, "length"))
    {
      v26 = v23;
    }
    else
    {
      v45 = v24;
      v46 = v23;
      v47 = v21;
      v48 = v6;
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("LaunchEvents"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("com.apple.distnoted.matching"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v29 = v28;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v58;
        while (2)
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v58 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
            objc_msgSend(v54, "addObject:", v34);
            objc_msgSend(v29, "objectForKeyedSubscript:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Name"));
            v36 = (id)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend(v34, "isEqualToString:", v36))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Distributed event key %@ does not match with its notification name %@"), v34, v36);
              v26 = (id)objc_claimAutoreleasedReturnValue();
              v42 = v29;
              v9 = v52;
              v7 = v53;
              goto LABEL_35;
            }

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
          if (v31)
            continue;
          break;
        }
      }

      v7 = v53;
      objc_msgSend(v54, "minusSet:", v53);
      -[FMDaemon xpcDistributedEventHandlers](v50, "xpcDistributedEventHandlers");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __59__FMDaemon_verifyLaunchEventsConfiguration_withExclusions___block_invoke_2;
      v55[3] = &unk_1E82AA5D0;
      v36 = v38;
      v56 = v36;
      v51 = v37;
      objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v55);
      objc_msgSend(v36, "minusSet:", v53);
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v54, "mutableCopy");
      objc_msgSend(v40, "minusSet:", v36);
      if (objc_msgSend(v40, "count"))
        objc_msgSend(v39, "appendFormat:", CFSTR("launchd plist has these distributed notifications that don't have a handler defined in code: %@\n"), v40);
      v44 = v40;
      v41 = (void *)objc_msgSend(v36, "mutableCopy");
      objc_msgSend(v41, "minusSet:", v54);
      if (objc_msgSend(v41, "count"))
        objc_msgSend(v39, "appendFormat:", CFSTR("launchd plist does not have these distributed notifications but, they have a handler defined in code: %@\n"), v41);
      if (objc_msgSend(v39, "length"))
        v26 = v39;
      else
        v26 = 0;
      v9 = v52;

      v42 = v51;
LABEL_35:

      v21 = v47;
      v6 = v48;
      v24 = v45;
      v23 = v46;
    }

LABEL_37:
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not load %@"), 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

void __59__FMDaemon_verifyLaunchEventsConfiguration_withExclusions___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);
  }

}

void __59__FMDaemon_verifyLaunchEventsConfiguration_withExclusions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);
  }

}

@end
