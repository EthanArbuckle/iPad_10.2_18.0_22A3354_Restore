@implementation BPSFollowUpController

+ (id)baseDomainIdentifier
{
  return CFSTR("com.apple.Bridge");
}

+ (id)skippedSetupPaneClassesForCurrentDevice
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "skippedSetupPaneClassesForDevice:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)skippedSetupPaneClassesForDevice:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_domainAccessorForDevice:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("BridgeSkippedSetupPanes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  bps_setup_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "+[BPSFollowUpController skippedSetupPaneClassesForDevice:]";
    v9 = 2050;
    v10 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_21147E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s found %{public}lu panes", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

+ (id)_domainAccessorForDevice:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE6B2C0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDomain:pairedDevice:", CFSTR("com.apple.Bridge"), v4);

  return v5;
}

+ (id)_currentDevice
{
  return (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "activeWatch");
}

+ (void)addFollowUpForIdentifier:(id)a3 withAttributes:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[8];
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && v9 && objc_msgSend(v8, "length"))
  {
    objc_msgSend(a1, "baseDomainIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x24BE1B3B0]);
    objc_msgSend(v12, "setUniqueIdentifier:", v8);
    objc_msgSend(v12, "setGroupIdentifier:", v11);
    objc_msgSend(v9, "localizedTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v13);

    objc_msgSend(v9, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInformativeText:", v14);

    objc_msgSend(v12, "setTargetBundleIdentifier:", v11);
    v40 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v9, "followUpActions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v37 = v12;
      v38 = v10;
      v39 = v8;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend(v9, "followUpActions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v45 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            v23 = (void *)MEMORY[0x24BE1B3A0];
            objc_msgSend(v9, "followUpActions");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v22);
            v25 = v9;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "actionWithLabel:url:", v22, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = v25;
            objc_msgSend(v40, "addObject:", v27);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v19);
      }

      v10 = v38;
      v8 = v39;
      v12 = v37;
    }
    objc_msgSend(v12, "setActions:", v40);
    if (objc_msgSend(v9, "wantNotification"))
    {
      v28 = objc_alloc_init(MEMORY[0x24BE1B3B8]);
      objc_msgSend(v9, "localizedNotificationTitle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTitle:", v29);

      objc_msgSend(v9, "localizedNotificationDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setInformativeText:", v30);

      objc_msgSend(v28, "options");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setByAddingObject:", *MEMORY[0x24BE1B338]);
      v32 = v9;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setOptions:", v33);

      objc_msgSend(v28, "options");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setByAddingObject:", *MEMORY[0x24BE1B350]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setOptions:", v35);

      v9 = v32;
      objc_msgSend(v12, "setNotification:", v28);

    }
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", v11);
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __80__BPSFollowUpController_addFollowUpForIdentifier_withAttributes_withCompletion___block_invoke;
    v42[3] = &unk_24CBE4B20;
    v43 = v10;
    objc_msgSend(v36, "postFollowUpItem:completion:", v12, v42);

  }
  else
  {
    bps_setup_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21147E000, v11, OS_LOG_TYPE_DEFAULT, "Error!! Issuing a FollowUp requires dictating an identifier!", buf, 2u);
    }
  }

}

uint64_t __80__BPSFollowUpController_addFollowUpForIdentifier_withAttributes_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)removeFollowUpForIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[8];
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "baseDomainIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(v6, "length"))
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", v8);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v8, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __68__BPSFollowUpController_removeFollowUpForIdentifier_withCompletion___block_invoke;
    v13[3] = &unk_24CBE4B20;
    v14 = v7;
    -[NSObject clearPendingFollowUpItemsWithUniqueIdentifiers:completion:](v9, "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:", v11, v13);

  }
  else
  {
    bps_setup_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21147E000, v9, OS_LOG_TYPE_DEFAULT, "Error!! Issuing a FollowUp requires dictating an identifier!", buf, 2u);
    }
  }

}

uint64_t __68__BPSFollowUpController_removeFollowUpForIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)markSkippedSetupPaneClassForCurrentDevice:(Class)a3
{
  id v5;

  objc_msgSend(a1, "_currentDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "markSkippedSetupPaneClass:forDevice:", a3, v5);

}

+ (void)removeSkippedPaneClassForCurrentDevice:(Class)a3
{
  id v5;

  objc_msgSend(a1, "_currentDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeSkippedPaneClass:forDevice:", a3, v5);

}

+ (void)markSkippedSetupPaneClass:(Class)a3 forDevice:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  const char *v16;
  __int16 v17;
  Class v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  bps_setup_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136446466;
    v16 = "+[BPSFollowUpController markSkippedSetupPaneClass:forDevice:]";
    v17 = 2114;
    v18 = a3;
    _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
    a3 = (Class)objc_msgSend(v8, "principalClass");
  NSStringFromClass(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_domainAccessorForDevice:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", CFSTR("BridgeSkippedSetupPanes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v12 = (void *)MEMORY[0x24BDBD1A8];
  }
  if ((objc_msgSend(v12, "containsObject:", v10) & 1) == 0)
  {
    objc_msgSend(v12, "arrayByAddingObject:", v10);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("BridgeSkippedSetupPanes"));
  v14 = (id)objc_msgSend(v11, "synchronize");

}

+ (void)removeSkippedPaneClass:(Class)a3 forDevice:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  int v13;
  Class v14;
  __int16 v15;
  Class v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  bps_setup_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136446466;
    v14 = (Class)"+[BPSFollowUpController removeSkippedPaneClass:forDevice:]";
    v15 = 2114;
    v16 = a3;
    _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", (uint8_t *)&v13, 0x16u);
  }

  NSStringFromClass(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_domainAccessorForDevice:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("BridgeSkippedSetupPanes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = objc_msgSend(v10, "mutableCopy");
    -[NSObject removeObject:](v11, "removeObject:", v8);
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("BridgeSkippedSetupPanes"));
    v12 = (id)objc_msgSend(v9, "synchronize");
  }
  else
  {
    bps_setup_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = a3;
      _os_log_impl(&dword_21147E000, v11, OS_LOG_TYPE_DEFAULT, "Error: tried to remove skipped pane '%@' but none was found", (uint8_t *)&v13, 0xCu);
    }
  }

}

@end
