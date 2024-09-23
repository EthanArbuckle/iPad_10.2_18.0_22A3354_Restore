@implementation MDMManagedMediaReader(DMCProfilesUI)

+ (id)managedAppsUninstalledOnMDMRemoval
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  DMCApplicationProxy *v10;
  void *v11;
  DMCApplicationProxy *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(MEMORY[0x24BE60DA0], "managedAppIDsWithFlags:excludeDDMApps:", 1, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v1, "applicationIsInstalled:", v7))
          objc_msgSend(v0, "addObject:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v0, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("MDMManagedMediaCountKey"));

  if (objc_msgSend(v0, "count") == 1)
  {
    v10 = [DMCApplicationProxy alloc];
    objc_msgSend(v0, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[DMCApplicationProxy initWithBundleID:dataSource:](v10, "initWithBundleID:dataSource:", v11, 0);

    -[DMCApplicationProxy name](v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("MDMManagedMediaNameKey"));

  }
  return v8;
}

@end
