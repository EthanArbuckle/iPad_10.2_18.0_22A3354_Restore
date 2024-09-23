@implementation MOEffectiveSettingsStore

- (MOEffectiveSettingsStore)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOEffectiveSettingsStore;
  return (MOEffectiveSettingsStore *)-[MOSettingsStore initStore](&v3, sel_initStore);
}

- (id)valueForSetting:(id)a3 inGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  +[MOLocations effectiveSettingsPath](MOLocations, "effectiveSettingsPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOSettingsStore loadSettingsAtURL:](MOSettingsStore, "loadSettingsAtURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (-[MOSettingsStore settingKeyFromSetting:group:](self, "settingKeyFromSetting:group:", v6, v7),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "objectForKeyedSubscript:", v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    -[MOEffectiveSettingsStore valueForKey:](self, "valueForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "metadataForSetting:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "defaultValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "persistableValueFromValue:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MOEffectiveSettingsStore;
  -[MOEffectiveSettingsStore dealloc](&v2, sel_dealloc);
}

+ (id)publisherForGroups:(id)a3
{
  id v3;
  MOEffectivePublisher *v4;

  v3 = a3;
  v4 = -[MOEffectivePublisher initWithInterestedGroups:]([MOEffectivePublisher alloc], "initWithInterestedGroups:", v3);

  return v4;
}

+ (id)setOfActiveRestrictionUUIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  +[MOLocations effectiveSettingsPath](MOLocations, "effectiveSettingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOSettingsStore loadSettingsAtURL:](MOSettingsStore, "loadSettingsAtURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v15 = v4;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "componentsSeparatedByString:", CFSTR("."));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.ManagedConfiguration.ManagedSettingsExtension"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v2, "copy");
  return v13;
}

@end
