@implementation NTKBundleComplicationManager

void __45__NTKBundleComplicationManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedManager_manager_1;
  sharedManager_manager_1 = (uint64_t)v0;

}

- (NTKBundleComplicationDataSourceLoader)loader
{
  return self->_loader;
}

- (NTKBundleComplicationManager)init
{
  NTKBundleComplicationManager *v2;
  NTKBundleComplicationManager *v3;
  void *v4;
  NTKBundleComplicationDataSourceLoader *v5;
  NTKBundleComplicationDataSourceLoader *loader;
  NTKBundleComplicationDataSourceLoader *v7;
  uint64_t v8;
  NTKCompanionBundleComplicationSyncCoordinator *syncCoordinator;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NTKBundleComplicationManager;
  v2 = -[NTKBundleComplicationManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    NTKBundleComplicationDirectoryURLs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKBundleComplicationDataSourceLoader complicationDataSourceLoaderWithDirectories:](NTKBundleComplicationDataSourceLoader, "complicationDataSourceLoaderWithDirectories:", v4);
    v5 = (NTKBundleComplicationDataSourceLoader *)objc_claimAutoreleasedReturnValue();
    loader = v3->_loader;
    v3->_loader = v5;
    v7 = v5;

    +[NTKCompanionBundleComplicationSyncCoordinator sharedInstance](NTKCompanionBundleComplicationSyncCoordinator, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    syncCoordinator = v3->_syncCoordinator;
    v3->_syncCoordinator = (NTKCompanionBundleComplicationSyncCoordinator *)v8;

  }
  return v3;
}

- (void)enumerateBundlesForComplicationFamily:(int64_t)a3 device:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  char v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  int64_t v18;
  char v19;
  _QWORD v20[3];
  char v21;

  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "supportsWidgetMigration");
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  -[NTKBundleComplicationManager loader](self, "loader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__NTKBundleComplicationManager_enumerateBundlesForComplicationFamily_device_withBlock___block_invoke;
  v14[3] = &unk_1E6BD6C50;
  v17 = v20;
  v18 = a3;
  v12 = v8;
  v15 = v12;
  v19 = v10;
  v13 = v9;
  v16 = v13;
  objc_msgSend(v11, "enumerateComplicationClassesWithBlock:", v14);

  _Block_object_dispose(v20, 8);
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NTKBundleComplicationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_2 != -1)
    dispatch_once(&sharedManager_onceToken_2, block);
  return (id)sharedManager_manager_1;
}

- (BOOL)bundleComplicationExistsForAppBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__NTKBundleComplicationManager_bundleComplicationExistsForAppBundleIdentifier___block_invoke;
  v7[3] = &unk_1E6BD6C00;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[NTKBundleComplicationManager _enumerateBundleInfo:](self, "_enumerateBundleInfo:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __79__NTKBundleComplicationManager_bundleComplicationExistsForAppBundleIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "appIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (Class)dataSourceClassForBundleComplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v18 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "complication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v4, "complicationType");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__NTKBundleComplicationManager_dataSourceClassForBundleComplication___block_invoke;
  v11[3] = &unk_1E6BD6C28;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = v7;
  -[NTKBundleComplicationManager _enumerateBundleInfo:](self, "_enumerateBundleInfo:", v11);
  v9 = (id)v16[3];

  _Block_object_dispose(&v15, 8);
  return (Class)v9;
}

void __69__NTKBundleComplicationManager_dataSourceClassForBundleComplication___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = (void *)MEMORY[0x1BCCA7FA8]();
  v6 = (void *)a1[4];
  objc_msgSend(v9, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqualToString:", v7);

  if ((_DWORD)v6)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v9, "dataSourceClass");
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v9, "legacyNTKComplicationType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "unsignedIntegerValue") == a1[6])
    {
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v9, "dataSourceClass");
      *a3 = 1;
    }

  }
  objc_autoreleasePoolPop(v5);

}

- (Class)dataSourceClassForBundleComplication:(id)a3 withFamily:(int64_t)a4 andDevice:(id)a5 factorInMigration:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  objc_class *v11;
  objc_class *v12;

  v6 = a6;
  v10 = a5;
  v11 = -[NTKBundleComplicationManager dataSourceClassForBundleComplication:](self, "dataSourceClassForBundleComplication:", a3);
  if (!-[objc_class acceptsComplicationFamily:forDevice:](v11, "acceptsComplicationFamily:forDevice:", a4, v10)|| objc_msgSend(v10, "supportsWidgetMigration")&& v6&& (-[objc_class hasMigratedToWidgetForFamily:device:](v11, "hasMigratedToWidgetForFamily:device:", a4, v10) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v12 = v11;
  }

  return v12;
}

- (BOOL)bundleExistsWithIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a4;
  -[NTKBundleComplicationManager _infoForBundleIdentifier:](self, "_infoForBundleIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "appIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v6);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)localizedAppNameForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NTKBundleComplicationManager _infoForBundleIdentifier:](self, "_infoForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedAppName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sectionIdentifierForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NTKBundleComplicationManager _infoForBundleIdentifier:](self, "_infoForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)groupIdentifierForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NTKBundleComplicationManager _infoForBundleIdentifier:](self, "_infoForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appGroupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedComplicationNameForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[NTKBundleComplicationManager _infoForBundleIdentifier:](self, "_infoForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedComplicationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "localizedAppName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

void __87__NTKBundleComplicationManager_enumerateBundlesForComplicationFamily_device_withBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *a3 = 1;
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 56);
    while (!objc_msgSend(a2, "acceptsComplicationFamily:forDevice:", v9, *(_QWORD *)(a1 + 32))
         || *(_BYTE *)(a1 + 64)
         && (objc_msgSend(a2, "hasMigratedToWidgetForFamily:device:", v9, *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      if ((NTKFallbackComplicationFamilyForFamily(v9, &v9) & 1) == 0)
        return;
    }
    v5 = (void *)MEMORY[0x1BCCA7FA8]();
    objc_msgSend(a2, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2, "appIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2, "legacyNTKComplicationType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    objc_autoreleasePoolPop(v5);
  }
}

- (id)allComplicationAppBundleIDs
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__NTKBundleComplicationManager_allComplicationAppBundleIDs__block_invoke;
  v6[3] = &unk_1E6BD6C78;
  v4 = v3;
  v7 = v4;
  -[NTKBundleComplicationManager _enumerateBundleInfo:](self, "_enumerateBundleInfo:", v6);

  return v4;
}

void __59__NTKBundleComplicationManager_allComplicationAppBundleIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "appIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

- (id)bundleComplicationsForBundleIdentifier:(id)a3
{
  id v4;
  objc_class *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NTKBundleComplicationManager _dataSourceClassForBundleIdentifier:](self, "_dataSourceClassForBundleIdentifier:", v4);
  if (v5)
  {
    v6 = v5;
    -[objc_class appIdentifier](v5, "appIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[objc_class useComplicationDescriptorsOnCompanion](v6, "useComplicationDescriptorsOnCompanion"))
    {
      v8 = (void *)MEMORY[0x1E0C99E40];
      -[NTKCompanionBundleComplicationSyncCoordinator descriptorsForBundleIdentifier:](self->_syncCoordinator, "descriptorsForBundleIdentifier:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "orderedSetWithArray:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[objc_class complicationDescriptors](v6, "complicationDescriptors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
    }
    v12 = (void *)v10;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(MEMORY[0x1E0D10860], "complicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", v4, v7, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v13, "addObject:", v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v16);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D10860], "complicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", v4, v7, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v13, "addObject:", v14);
    }

    v11 = (void *)objc_msgSend(v13, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (Class)_dataSourceClassForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NTKBundleComplicationManager _infoForBundleIdentifier:](self, "_infoForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (id)_infoForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTKBundleComplicationManager _infoByBundleIdentifierLookup](self, "_infoByBundleIdentifierLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_enumerateBundleInfo:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NTKBundleComplicationManager _infoByBundleIdentifierLookup](self, "_infoByBundleIdentifierLookup");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__NTKBundleComplicationManager__enumerateBundleInfo___block_invoke;
  v7[3] = &unk_1E6BD6CA0;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __53__NTKBundleComplicationManager__enumerateBundleInfo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_buildDataSourceInfoLookup
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_opt_new();
  -[NTKBundleComplicationManager loader](self, "loader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__NTKBundleComplicationManager__buildDataSourceInfoLookup__block_invoke;
  v8[3] = &unk_1E6BD6CC8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateComplicationClassesWithBlock:", v8);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

void __58__NTKBundleComplicationManager__buildDataSourceInfoLookup__block_invoke(uint64_t a1, void *a2)
{
  NTKBundleComplicationDataSourceInfo *v4;
  id v5;

  objc_msgSend(a2, "bundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKBundleComplicationDataSourceInfo initWithDataSourceClass:]([NTKBundleComplicationDataSourceInfo alloc], "initWithDataSourceClass:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v5);

}

- (id)_infoByBundleIdentifierLookup
{
  os_unfair_lock_s *p_lock;
  NSDictionary *lock_infoByBundleIdentifierLookup;
  NSDictionary *v5;
  NSDictionary *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_infoByBundleIdentifierLookup = self->_lock_infoByBundleIdentifierLookup;
  if (!lock_infoByBundleIdentifierLookup)
  {
    -[NTKBundleComplicationManager _buildDataSourceInfoLookup](self, "_buildDataSourceInfoLookup");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_lock_infoByBundleIdentifierLookup;
    self->_lock_infoByBundleIdentifierLookup = v5;

    lock_infoByBundleIdentifierLookup = self->_lock_infoByBundleIdentifierLookup;
  }
  v7 = (void *)-[NSDictionary copy](lock_infoByBundleIdentifierLookup, "copy");
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NTKCompanionBundleComplicationSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_lock_infoByBundleIdentifierLookup, 0);
}

@end
