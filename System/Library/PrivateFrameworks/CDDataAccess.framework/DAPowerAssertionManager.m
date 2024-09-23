@implementation DAPowerAssertionManager

- (DAPowerAssertionManager)init
{
  DAPowerAssertionManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DAPowerAssertionManager;
  v2 = -[DAPowerAssertionManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[DAPowerAssertionManager setContexts:](v2, "setContexts:", v3);

    v4 = (void *)objc_opt_new();
    -[DAPowerAssertionManager setGroupIdentifierToContexts:](v2, "setGroupIdentifierToContexts:", v4);

    v5 = (void *)objc_opt_new();
    -[DAPowerAssertionManager setContextToGroupIdentifier:](v2, "setContextToGroupIdentifier:", v5);

    v6 = (void *)objc_opt_new();
    -[DAPowerAssertionManager setHeldAsideContexts:](v2, "setHeldAsideContexts:", v6);

    v7 = (void *)objc_opt_new();
    -[DAPowerAssertionManager setHeldAsideGroupIdentifiers:](v2, "setHeldAsideGroupIdentifiers:", v7);

    v8 = (void *)objc_opt_new();
    -[DAPowerAssertionManager setContextToPowerAssertionRef:](v2, "setContextToPowerAssertionRef:", v8);

  }
  return v2;
}

+ (void)vendDaemons:(Class)a3
{
  _sVendDaemonManagerType = (uint64_t)a3;
}

+ (id)sharedPowerAssertionManager
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!sharedPowerAssertionManager_obj)
  {
    v3 = objc_opt_new();
    v4 = (void *)sharedPowerAssertionManager_obj;
    sharedPowerAssertionManager_obj = v3;

  }
  objc_sync_exit(v2);

  return (id)sharedPowerAssertionManager_obj;
}

- (unint64_t)powerAssertionRetainCount:(id)a3
{
  id v5;
  DAPowerAssertionManager *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAPowerAssertionManager.m"), 61, CFSTR("%s must have a non-nil context"), sel_getName(a2));

  }
  v6 = self;
  objc_sync_enter(v6);
  -[DAPowerAssertionManager contexts](v6, "contexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countForObject:", v5);

  -[DAPowerAssertionManager heldAsideContexts](v6, "heldAsideContexts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countForObject:", v5) + v8;

  objc_sync_exit(v6);
  return v10;
}

- (void)retainPowerAssertion:(id)a3 withGroupIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  os_log_type_t v12;
  DAPowerAssertionManager *v13;
  void *v14;
  int v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAPowerAssertionManager.m"), 71, CFSTR("%s must have a non-nil context"), sel_getName(a2));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAPowerAssertionManager.m"), 72, CFSTR("%s must have a non-nil group identifier"), sel_getName(a2));

LABEL_3:
  DALoggingwithCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0D03918];
  v12 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v10, v12))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v7;
    v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_1C1CD1000, v10, v12, "Context %@ retaining power assertion with group identifier %@", buf, 0x16u);
  }

  v13 = self;
  objc_sync_enter(v13);
  if (v9
    && (-[DAPowerAssertionManager heldAsideGroupIdentifiers](v13, "heldAsideGroupIdentifiers"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "containsObject:", v9),
        v14,
        v15))
  {
    DALoggingwithCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_BYTE *)(v11 + 7);
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v7;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1C1CD1000, v16, v17, "Context %@ getting added to our held aside contexts, as group %@ is currently dropped", buf, 0x16u);
    }

    -[DAPowerAssertionManager heldAsideContexts](v13, "heldAsideContexts");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v7);
    v19 = 0;
    v20 = 0;
  }
  else
  {
    -[DAPowerAssertionManager contexts](v13, "contexts");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v21, "countForObject:", v7);

    -[DAPowerAssertionManager contexts](v13, "contexts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v7);

    -[DAPowerAssertionManager contexts](v13, "contexts");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "countForObject:", v7);
  }

  -[DAPowerAssertionManager groupIdentifierToContexts](v13, "groupIdentifierToContexts");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    v24 = (void *)objc_opt_new();
    -[DAPowerAssertionManager groupIdentifierToContexts](v13, "groupIdentifierToContexts");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v24, v9);

  }
  objc_msgSend(v24, "addObject:", v7);
  -[DAPowerAssertionManager contextToGroupIdentifier](v13, "contextToGroupIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v9, v7);

  if (!v19 && v20 == 1)
    -[DAPowerAssertionManager _retainAssertionForContext:](v13, "_retainAssertionForContext:", v7);

  objc_sync_exit(v13);
}

- (void)releasePowerAssertion:(id)a3
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  DAPowerAssertionManager *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAPowerAssertionManager.m"), 101, CFSTR("%s must have a non-nil context"), sel_getName(a2));

  }
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v6, v7))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v5;
    _os_log_impl(&dword_1C1CD1000, v6, v7, "Context %@ releasing power assertion", buf, 0xCu);
  }

  v8 = self;
  objc_sync_enter(v8);
  -[DAPowerAssertionManager heldAsideContexts](v8, "heldAsideContexts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countForObject:", v5) == 0;

  if (!v10)
  {
    -[DAPowerAssertionManager heldAsideContexts](v8, "heldAsideContexts");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObject:](v11, "removeObject:", v5);
LABEL_7:
    v12 = 0;
    v13 = 0;
    goto LABEL_10;
  }
  -[DAPowerAssertionManager contexts](v8, "contexts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countForObject:", v5) == 0;

  if (v15)
  {
    DALoggingwithCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, v7))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_impl(&dword_1C1CD1000, v11, v7, "Context object %@ attempting to release power assertion without first retaining it", buf, 0xCu);
    }
    goto LABEL_7;
  }
  -[DAPowerAssertionManager contexts](v8, "contexts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v16, "countForObject:", v5);

  -[DAPowerAssertionManager contexts](v8, "contexts");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObject:", v5);

  -[DAPowerAssertionManager contexts](v8, "contexts");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = -[NSObject countForObject:](v11, "countForObject:", v5);
LABEL_10:

  -[DAPowerAssertionManager contextToGroupIdentifier](v8, "contextToGroupIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[DAPowerAssertionManager groupIdentifierToContexts](v8, "groupIdentifierToContexts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "removeObject:", v5);
      if (!objc_msgSend(v21, "count"))
      {
        -[DAPowerAssertionManager groupIdentifierToContexts](v8, "groupIdentifierToContexts");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeObjectForKey:", v19);

      }
    }
    -[DAPowerAssertionManager contextToGroupIdentifier](v8, "contextToGroupIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeObjectForKey:", v5);

  }
  if (v13 == 1 && !v12)
    -[DAPowerAssertionManager _releaseAssertionForContext:](v8, "_releaseAssertionForContext:", v5);

  objc_sync_exit(v8);
}

- (id)stateString
{
  DAPowerAssertionManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[DAPowerAssertionManager contexts](v2, "contexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAPowerAssertionManager heldAsideContexts](v2, "heldAsideContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAPowerAssertionManager contextToPowerAssertionRef](v2, "contextToPowerAssertionRef");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Shared DAPowerAssertionManager object %@:\nContexts asserting power: %@\nContexts held aside: %@\nActive Assertions: %@\n"), v2, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v7;
}

- (void)dropPowerAssertionsForGroupIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  DAPowerAssertionManager *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v4;
    _os_log_impl(&dword_1C1CD1000, v5, v6, "Dropping power assertion for group identifier %@", buf, 0xCu);
  }

  v7 = self;
  objc_sync_enter(v7);
  -[DAPowerAssertionManager heldAsideGroupIdentifiers](v7, "heldAsideGroupIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[DAPowerAssertionManager heldAsideGroupIdentifiers](v7, "heldAsideGroupIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v4);

    -[DAPowerAssertionManager groupIdentifierToContexts](v7, "groupIdentifierToContexts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = v13;
    v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v10);
          v17 = 0;
          v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          while (1)
          {
            -[DAPowerAssertionManager contexts](v7, "contexts");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "countForObject:", v18) > (unint64_t)v17;

            if (!v20)
              break;
            -[DAPowerAssertionManager heldAsideContexts](v7, "heldAsideContexts");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v18);

            -[DAPowerAssertionManager contexts](v7, "contexts");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "removeObject:", v18);

            ++v17;
          }
        }
        v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v14);
    }

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v23 = (id)objc_msgSend(v10, "copy");
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v23);
        -[DAPowerAssertionManager _releaseAssertionForContext:](v7, "_releaseAssertionForContext:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j), (_QWORD)v27);
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v24);
  }

  objc_sync_exit(v7);
}

- (void)reattainPowerAssertionsForGroupIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  DAPowerAssertionManager *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v4;
    _os_log_impl(&dword_1C1CD1000, v5, v6, "Reattaining power assertion for group identifier %@", buf, 0xCu);
  }

  v7 = self;
  objc_sync_enter(v7);
  -[DAPowerAssertionManager heldAsideGroupIdentifiers](v7, "heldAsideGroupIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if (v9)
  {
    -[DAPowerAssertionManager heldAsideGroupIdentifiers](v7, "heldAsideGroupIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v4);

    -[DAPowerAssertionManager groupIdentifierToContexts](v7, "groupIdentifierToContexts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v13);
          v17 = 0;
          v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          while (1)
          {
            -[DAPowerAssertionManager heldAsideContexts](v7, "heldAsideContexts");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "countForObject:", v18) > (unint64_t)v17;

            if (!v20)
              break;
            -[DAPowerAssertionManager contexts](v7, "contexts");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v18);

            -[DAPowerAssertionManager heldAsideContexts](v7, "heldAsideContexts");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "removeObject:", v18);

            ++v17;
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v14);
    }

  }
  else
  {
    v13 = 0;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v23 = (id)objc_msgSend(v13, "copy");
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v23);
        -[DAPowerAssertionManager _retainAssertionForContext:](v7, "_retainAssertionForContext:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j), (_QWORD)v27);
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v24);
  }

  objc_sync_exit(v7);
}

- (BOOL)_retainAssertionForContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_retainAssertionForContext__onceToken != -1)
    dispatch_once(&_retainAssertionForContext__onceToken, &__block_literal_global_3);
  objc_msgSend(MEMORY[0x1E0D03908], "isAppleInternalInstall");
  -[DAPowerAssertionManager contextToPowerAssertionRef](self, "contextToPowerAssertionRef");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.DataAccess:%d-%p"), _retainAssertionForContext__pid, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (const void *)CPPowerAssertionCreate();
  -[DAPowerAssertionManager contextToPowerAssertionRef](self, "contextToPowerAssertionRef");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v4);

  CFRelease(v8);
  DALoggingwithCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v10, v11))
  {
    -[DAPowerAssertionManager contextToPowerAssertionRef](self, "contextToPowerAssertionRef");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = v7;
    v16 = 2048;
    v17 = v4;
    v18 = 2048;
    v19 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_1C1CD1000, v10, v11, "DAPowerAssertionManager retained power assertion %@ for context %p, outstanding assertion count %lu", buf, 0x20u);

  }
  return v6 == 0;
}

uint64_t __54__DAPowerAssertionManager__retainAssertionForContext___block_invoke()
{
  uint64_t result;

  result = getpid();
  _retainAssertionForContext__pid = result;
  return result;
}

- (BOOL)_releaseAssertionForContext:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  int v12;
  id v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    -[DAPowerAssertionManager contextToPowerAssertionRef](self, "contextToPowerAssertionRef");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218240;
    v13 = v4;
    v14 = 1024;
    v15 = objc_msgSend(v7, "count") - 1;
    _os_log_impl(&dword_1C1CD1000, v5, v6, "DAPowerAssertionManager releasing power assertion for context %p, outstanding assertion count %u ontext", (uint8_t *)&v12, 0x12u);

  }
  -[DAPowerAssertionManager contextToPowerAssertionRef](self, "contextToPowerAssertionRef");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v4);

  -[DAPowerAssertionManager contextToPowerAssertionRef](self, "contextToPowerAssertionRef");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") == 0;

  return v10;
}

- (NSCountedSet)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
  objc_storeStrong((id *)&self->_contexts, a3);
}

- (NSMapTable)groupIdentifierToContexts
{
  return self->_groupIdentifierToContexts;
}

- (void)setGroupIdentifierToContexts:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifierToContexts, a3);
}

- (NSMapTable)contextToGroupIdentifier
{
  return self->_contextToGroupIdentifier;
}

- (void)setContextToGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contextToGroupIdentifier, a3);
}

- (NSMutableSet)heldAsideGroupIdentifiers
{
  return self->_heldAsideGroupIdentifiers;
}

- (void)setHeldAsideGroupIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_heldAsideGroupIdentifiers, a3);
}

- (NSCountedSet)heldAsideContexts
{
  return self->_heldAsideContexts;
}

- (void)setHeldAsideContexts:(id)a3
{
  objc_storeStrong((id *)&self->_heldAsideContexts, a3);
}

- (NSMapTable)contextToPowerAssertionRef
{
  return self->_contextToPowerAssertionRef;
}

- (void)setContextToPowerAssertionRef:(id)a3
{
  objc_storeStrong((id *)&self->_contextToPowerAssertionRef, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextToPowerAssertionRef, 0);
  objc_storeStrong((id *)&self->_heldAsideContexts, 0);
  objc_storeStrong((id *)&self->_heldAsideGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_contextToGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifierToContexts, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
}

@end
