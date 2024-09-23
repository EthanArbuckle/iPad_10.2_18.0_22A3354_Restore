@implementation DTApplicationWorkspaceObserver

+ (id)sharedInstance
{
  if (qword_25576F928 != -1)
    dispatch_once(&qword_25576F928, &unk_24EB27610);
  return (id)qword_25576F930;
}

- (DTApplicationWorkspaceObserver)init
{
  DTApplicationWorkspaceObserver *v2;
  uint64_t v3;
  NSMutableDictionary *registrationsByToken;
  uint64_t v5;
  NSMutableDictionary *knownAppsByPath;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DTApplicationWorkspaceObserver;
  v2 = -[DTApplicationWorkspaceObserver init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    registrationsByToken = v2->_registrationsByToken;
    v2->_registrationsByToken = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    knownAppsByPath = v2->_knownAppsByPath;
    v2->_knownAppsByPath = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)_notifyWithApplicationProxy:(id)a3 addition:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "correspondingApplicationRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v4)
  {
    objc_msgSend(v6, "correspondingApplicationRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v7, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v12 = 0;
    goto LABEL_7;
  }
  v24 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v9, 0, &v24);
  v11 = v24;
  if (v10)
  {
    v12 = v10;

LABEL_7:
    v9 = v12;
LABEL_8:
    sub_222B1C470(v9, !v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTApplicationWorkspaceObserver _notifyWithDictionaryRepresentation:addition:](self, "_notifyWithDictionaryRepresentation:addition:", v13, v4);

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v9, "applicationExtensionRecords");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v14)
    {
      v15 = v14;
      v19 = v8;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v11);
          sub_222B1C7E8(*(void **)(*((_QWORD *)&v20 + 1) + 8 * i), !v4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[DTApplicationWorkspaceObserver _notifyWithDictionaryRepresentation:addition:](self, "_notifyWithDictionaryRepresentation:addition:", v18, v4);

        }
        v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v15);
      v8 = v19;
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    sub_222BC5838((uint64_t)v9, v11);
LABEL_16:

}

- (void)_notifyWithDictionaryRepresentation:(id)a3 addition:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  DTApplicationWorkspaceObserver *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *registrationsByToken;
  NSMutableDictionary *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  Boolean keyExistsAndHasValidFormat;

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CFBundleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(MEMORY[0x24BDD1760], "isAppleInternal");
    if (((objc_msgSend(v9, "isEqualToString:", CFSTR("System")) ^ 1 | v10) & 1) != 0)
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("Internal"))
        || v10
        && (keyExistsAndHasValidFormat = 0,
            CFPreferencesGetAppBooleanValue(CFSTR("SBShowInternalApps"), CFSTR("com.apple.springboard"), &keyExistsAndHasValidFormat))&& keyExistsAndHasValidFormat)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](v7->_knownAppsByPath, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = MEMORY[0x24BDAC760];
        if (v11)
        {
          registrationsByToken = v7->_registrationsByToken;
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 3221225472;
          v18[2] = sub_222B1CB94;
          v18[3] = &unk_24EB27F58;
          v19 = v11;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](registrationsByToken, "enumerateKeysAndObjectsUsingBlock:", v18);
          -[NSMutableDictionary removeObjectForKey:](v7->_knownAppsByPath, "removeObjectForKey:", v8);

        }
        if (v4)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_knownAppsByPath, "setObject:forKeyedSubscript:", v6, v8);
          v15 = v7->_registrationsByToken;
          v16[0] = v13;
          v16[1] = 3221225472;
          v16[2] = sub_222B1CBA8;
          v16[3] = &unk_24EB27F58;
          v17 = v6;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v15, "enumerateKeysAndObjectsUsingBlock:", v16);

        }
      }
    }

  }
  objc_sync_exit(v7);

}

- (id)registerNotificationToken:(id)a3 observer:(id)a4 query:(id)a5
{
  void *v5;
  id v9;
  DTApplicationWorkspaceObserver *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableDictionary *knownAppsByPath;
  id v36;
  void *v37;
  id v38;
  void *v40;
  uint64_t v41;
  void *v42;
  id val;
  id v44;
  void *v45;
  DTApplicationWorkspaceObserver *obj;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD aBlock[4];
  id v51;
  id v52;
  id location;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  val = a4;
  v44 = a5;
  v42 = v9;
  if (val)
  {
    v41 = objc_msgSend(v9, "length");
    v10 = self;
    objc_sync_enter(v10);
    obj = v10;
    if (!-[NSMutableDictionary count](v10->_registrationsByToken, "count"))
    {
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
        objc_msgSend(v40, "addObserver:", v10);
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("Type"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("PluginKit"));

      if ((v12 & 1) == 0)
      {
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v59 != v15)
                objc_enumerationMutation(v13);
              v17 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
              objc_msgSend(v17, "applicationState");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v5, "isRestricted");

              if ((v18 & 1) == 0)
              {
                objc_msgSend(v17, "bundleIdentifier");
                v5 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "addObject:", v5);

              }
              sub_222B1C470(v17, 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[DTApplicationWorkspaceObserver _notifyWithDictionaryRepresentation:addition:](v10, "_notifyWithDictionaryRepresentation:addition:", v19, 1);

            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
          }
          while (v14);
        }

      }
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend(MEMORY[0x24BDC1528], "enumeratorWithOptions:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v55;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v55 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
            sub_222B1C7E8(v24, 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "containingBundleRecord");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "bundleIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v27)
            {
              v28 = 1;
LABEL_25:
              v29 = objc_msgSend(MEMORY[0x24BDD1760], "isAppleInternal") ^ 1;
              if (!v27)
                goto LABEL_27;
              goto LABEL_26;
            }
            v28 = objc_msgSend(v45, "containsObject:", v27);
            objc_msgSend(v24, "bundleIdentifier");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.")))
              goto LABEL_25;
            v29 = 0;
LABEL_26:

LABEL_27:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v29 | v28 ^ 1u);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setObject:forKeyedSubscript:", v30, CFSTR("Restricted"));

            -[DTApplicationWorkspaceObserver _notifyWithDictionaryRepresentation:addition:](obj, "_notifyWithDictionaryRepresentation:addition:", v25, 1);
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        }
        while (v21);
      }

    }
    v31 = MEMORY[0x24BDAC760];
    if (v41)
    {
      objc_initWeak(&location, val);
      objc_msgSend(v42, "stringByAppendingFormat:", CFSTR(".%p"), val);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = v31;
      aBlock[1] = 3221225472;
      aBlock[2] = sub_222B1D140;
      aBlock[3] = &unk_24EB27F80;
      v51 = v44;
      objc_copyWeak(&v52, &location);
      v33 = _Block_copy(aBlock);
      -[NSMutableDictionary setObject:forKeyedSubscript:](obj->_registrationsByToken, "setObject:forKeyedSubscript:", v33, v32);

      objc_destroyWeak(&v52);
      objc_destroyWeak(&location);
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    knownAppsByPath = obj->_knownAppsByPath;
    v47[0] = v31;
    v47[1] = 3221225472;
    v47[2] = sub_222B1D290;
    v47[3] = &unk_24EB27FA8;
    v48 = v44;
    v36 = v34;
    v49 = v36;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](knownAppsByPath, "enumerateKeysAndObjectsUsingBlock:", v47);
    v37 = v49;
    v38 = v36;

    objc_sync_exit(obj);
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (void)_unregisterNotificationTokenInternal:(id)a3
{
  DTApplicationWorkspaceObserver *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NSMutableDictionary count](v4->_registrationsByToken, "count");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_registrationsByToken, "setObject:forKeyedSubscript:", 0, v7);
  if (v5 && !-[NSMutableDictionary count](v4->_registrationsByToken, "count"))
  {
    -[NSMutableDictionary removeAllObjects](v4->_knownAppsByPath, "removeAllObjects");
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", v4);

  }
  objc_sync_exit(v4);

}

- (void)unregisterNotificationToken:(id)a3 observer:(id)a4
{
  id v5;

  objc_msgSend(a3, "stringByAppendingFormat:", CFSTR(".%p"), a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DTApplicationWorkspaceObserver _unregisterNotificationTokenInternal:](self, "_unregisterNotificationTokenInternal:", v5);

}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[DTApplicationWorkspaceObserver _notifyWithApplicationProxy:addition:](self, "_notifyWithApplicationProxy:addition:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[DTApplicationWorkspaceObserver _notifyWithApplicationProxy:addition:](self, "_notifyWithApplicationProxy:addition:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownAppsByPath, 0);
  objc_storeStrong((id *)&self->_registrationsByToken, 0);
}

@end
