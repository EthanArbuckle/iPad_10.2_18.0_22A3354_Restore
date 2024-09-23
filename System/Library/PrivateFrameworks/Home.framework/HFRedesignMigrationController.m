@implementation HFRedesignMigrationController

- (HFRedesignMigrationController)initWithHome:(id)a3
{
  id v5;
  HFRedesignMigrationController *v6;
  HFRedesignMigrationController *v7;
  uint64_t v8;
  NSArray *legacyFavoriteTiles;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFRedesignMigrationController;
  v6 = -[HFRedesignMigrationController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    +[HFItemProviderUtilities _legacyFavoriteServicesForHome:withLimit:](HFItemProviderUtilities, "_legacyFavoriteServicesForHome:withLimit:", v5, -1);
    v8 = objc_claimAutoreleasedReturnValue();
    legacyFavoriteTiles = v7->_legacyFavoriteTiles;
    v7->_legacyFavoriteTiles = (NSArray *)v8;

  }
  return v7;
}

- (void)performMigrationSuccessTasks
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  -[HFRedesignMigrationController migrationFuture](self, "migrationFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __61__HFRedesignMigrationController_performMigrationSuccessTasks__block_invoke;
  v8 = &unk_1EA73AD38;
  objc_copyWeak(&v9, &location);
  v4 = (id)objc_msgSend(v3, "addSuccessBlock:", &v5);

  -[HFRedesignMigrationController setMigrationFuture:](self, "setMigrationFuture:", 0, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setMigrationFuture:(id)a3
{
  objc_storeStrong((id *)&self->_migrationFuture, a3);
}

- (NAFuture)migrationFuture
{
  return self->_migrationFuture;
}

- (void)performMigrationIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  _QWORD v26[5];
  _QWORD v27[6];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_class();
  -[HFRedesignMigrationController home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend((id)v3, "homeNeedsMigration:", v4);

  if ((v3 & 1) == 0)
  {
    HFLogForCategory(9uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    -[HFRedesignMigrationController home](self, "home");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v24;
    v25 = "HFRedesignMigrationController: Migration not needed for home: %@";
LABEL_12:
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);

    goto LABEL_13;
  }
  -[HFRedesignMigrationController home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRedesignMigrationController home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeAccessControlForUser:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAdministrator");

  HFLogForCategory(9uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) == 0)
  {
    if (!v11)
      goto LABEL_13;
    -[HFRedesignMigrationController home](self, "home");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v24;
    v25 = "HFRedesignMigrationController: User is not admin; skipping migration for home %@";
    goto LABEL_12;
  }
  if (v11)
  {
    -[HFRedesignMigrationController home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v12;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Performing migration for home %@", buf, 0xCu);

  }
  HFLogForCategory(9uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Legacy favorites:", buf, 2u);
  }

  -[HFRedesignMigrationController legacyFavoriteTiles](self, "legacyFavoriteTiles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_each:", &__block_literal_global_233);

  v15 = (void *)MEMORY[0x1E0D519C0];
  -[HFRedesignMigrationController _migrateFavorites](self, "_migrateFavorites");
  v10 = objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  -[HFRedesignMigrationController _migrateRoomOrder](self, "_migrateRoomOrder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v16;
  -[HFRedesignMigrationController _migrateServiceItemsOrderInRooms](self, "_migrateServiceItemsOrderInRooms");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v17;
  -[HFRedesignMigrationController _clearHomeDashboardSectionOrder](self, "_clearHomeDashboardSectionOrder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v18;
  -[HFRedesignMigrationController _migrateShowOnHomeDashboard](self, "_migrateShowOnHomeDashboard");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v19;
  -[HFRedesignMigrationController _migrateTileSize](self, "_migrateTileSize");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "chainFutures:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __57__HFRedesignMigrationController_performMigrationIfNeeded__block_invoke_4;
  v26[3] = &unk_1EA72ADB0;
  v26[4] = self;
  objc_msgSend(v22, "flatMap:", v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRedesignMigrationController setMigrationFuture:](self, "setMigrationFuture:", v23);

LABEL_13:
}

- (HMHome)home
{
  return self->_home;
}

+ (BOOL)homeNeedsMigration:(id)a3
{
  return objc_msgSend(a3, "hf_homeHasMigratedForRedesign") ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationFuture, 0);
  objc_storeStrong((id *)&self->_legacyFavoriteTiles, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

void __57__HFRedesignMigrationController_performMigrationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory(9uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v4, 0xCu);
  }

}

id __57__HFRedesignMigrationController_performMigrationIfNeeded__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(9uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Completed migration for home %@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "hf_setHomeHasMigratedForRedesign:", 1);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __61__HFRedesignMigrationController_performMigrationSuccessTasks__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("HFRedesignMigrationTileSizeHasUpdatedNotification"), WeakRetained);

}

- (id)_migrateFavorites
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[HFRedesignMigrationController legacyFavoriteTiles](self, "legacyFavoriteTiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[HFRedesignMigrationController home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_accessoryLikeObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (double)v4 / (double)v7;
    if (v8 >= 0.33 || fabsf(v8 + -0.33) < 0.00000011921)
    {
      v10 = 6;
      if (v4 < 6)
        v10 = v4;
      if (v7 <= 0x11)
        v9 = 0;
      else
        v9 = v10;
    }
    else if (v4 >= 0xC)
    {
      v9 = 12;
    }
    else
    {
      v9 = v4;
    }
  }
  else
  {
    v9 = 0;
  }
  HFLogForCategory(9uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v28 = v9;
    v29 = 2048;
    v30 = v4;
    v31 = 2048;
    v32 = v7;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Migrating %lu favorites (%lu previous favorites, %lu accessories total)", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v14 = 0;
    *(_QWORD *)&v13 = 138412290;
    v26 = v13;
    do
    {
      -[HFRedesignMigrationController legacyFavoriteTiles](self, "legacyFavoriteTiles", v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v14 >= v16)
        break;
      -[HFRedesignMigrationController legacyFavoriteTiles](self, "legacyFavoriteTiles");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = &unk_1F03F05E0;
      if (objc_msgSend(v18, "conformsToProtocol:", v19))
        v20 = v18;
      else
        v20 = 0;
      v21 = v20;

      HFLogForCategory(9uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v26;
        v28 = (uint64_t)v21;
        _os_log_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Migrating favorite: %@", buf, 0xCu);
      }

      objc_msgSend(v21, "hf_updateIsFavorite:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v23);

      ++v14;
    }
    while (v9 != v14);
  }
  if (objc_msgSend(v12, "count"))
    objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v12);
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_migrateShowOnHomeDashboard
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (id)_migrateRoomOrder
{
  void *v3;
  void *v4;
  void *v5;
  HFReorderableHomeKitItemList *v6;
  void *v7;
  HFReorderableHomeKitItemList *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  unint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  HFRedesignMigrationController *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  unint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[HFRedesignMigrationController home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_reorderableRoomsList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = [HFReorderableHomeKitItemList alloc];
  -[HFRedesignMigrationController home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:](v6, "initWithApplicationDataContainer:category:", v7, CFSTR("homeRooms_legacy"));
  v9 = (void *)-[HFReorderableHomeKitItemList mutableCopy](v8, "mutableCopy");

  HFLogForCategory(9uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "sortedHomeKitObjectIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = (unint64_t)v11;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Legacy room order: %@", buf, 0xCu);

  }
  if (objc_msgSend(v9, "isEmpty"))
  {
    objc_msgSend(v5, "sortedHomeKitObjectIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSortedHomeKitIdentifiers:", v12);

    v13 = (id)objc_msgSend(v9, "saveWithSender:", self);
  }
  v32 = v5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRedesignMigrationController legacyFavoriteTiles](self, "legacyFavoriteTiles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __50__HFRedesignMigrationController__migrateRoomOrder__block_invoke;
  v37[3] = &unk_1EA741348;
  v17 = v14;
  v38 = v17;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v37);

  -[HFRedesignMigrationController home](self, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hf_allRooms");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v16;
  v33[1] = 3221225472;
  v33[2] = __50__HFRedesignMigrationController__migrateRoomOrder__block_invoke_2;
  v33[3] = &unk_1EA741370;
  v31 = v17;
  v34 = v31;
  v35 = self;
  v30 = v9;
  v36 = v30;
  objc_msgSend(v19, "sortedArrayUsingComparator:", v33);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(9uLL);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Migrating to room order:", buf, 2u);
  }

  if (objc_msgSend(v20, "count"))
  {
    v22 = 0;
    do
    {
      HFLogForCategory(9uLL);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v20, "objectAtIndexedSubscript:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "uniqueIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v40 = v22;
        v41 = 2112;
        v42 = v25;
        v43 = 2112;
        v44 = v27;
        _os_log_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: %lu: %@ (%@)", buf, 0x20u);

      }
      ++v22;
    }
    while (v22 < objc_msgSend(v20, "count"));
  }
  objc_msgSend(v32, "setSortedHomeKitObjects:", v20);
  objc_msgSend(v32, "saveWithSender:", self);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

void __50__HFRedesignMigrationController__migrateRoomOrder__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  if (objc_msgSend(v17, "conformsToProtocol:", &unk_1F03F05E0))
    v5 = v17;
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "hf_safeRoom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

    v15 = *(void **)(a1 + 32);
    objc_msgSend(v7, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v16);

  }
}

uint64_t __50__HFRedesignMigrationController__migrateRoomOrder__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t (**v46)(_QWORD, _QWORD, _QWORD);

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKeyPath:", CFSTR("@avg.self"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "legacyFavoriteTiles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = *(void **)(a1 + 32);
  objc_msgSend(v6, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "valueForKeyPath:", CFSTR("@avg.self"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "legacyFavoriteTiles");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23 = objc_msgSend(v12, "compare:", v20);

  if (!v23)
  {
    v24 = *(void **)(a1 + 32);
    objc_msgSend(v5, "uniqueIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndex:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v29 = v27;
    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 40), "legacyFavoriteTiles");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v31, "count"));
      v29 = (id)objc_claimAutoreleasedReturnValue();

    }
    v32 = *(void **)(a1 + 32);
    objc_msgSend(v6, "uniqueIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndex:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      v37 = v35;
    }
    else
    {
      v38 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 40), "legacyFavoriteTiles");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "count"));
      v37 = (id)objc_claimAutoreleasedReturnValue();

    }
    v23 = objc_msgSend(v29, "compare:", v37);

    if (!v23)
    {
      v40 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "hf_accessoryLikeObjects");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "numberWithUnsignedInteger:", objc_msgSend(v41, "count"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "hf_accessoryLikeObjects");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "numberWithUnsignedInteger:", objc_msgSend(v44, "count"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v45, "compare:", v42);
      if (!v23)
      {
        objc_msgSend(*(id *)(a1 + 48), "sortedHomeKitObjectComparator");
        v46 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v23 = ((uint64_t (**)(_QWORD, id, id))v46)[2](v46, v5, v6);

      }
    }
  }

  return v23;
}

- (id)_clearHomeDashboardSectionOrder
{
  void *v3;
  void *v4;
  void *v5;

  -[HFRedesignMigrationController home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_reorderableDashboardSectionList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSortedItems:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v4, "saveWithSender:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_migrateServiceItemsOrderInRooms
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  HFReorderableHomeKitItemList *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  HFMutableReorderableHomeKitItemList *v39;
  void *v40;
  void *v41;
  id obj;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  void *v50;
  HFRedesignMigrationController *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  id v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  +[HFAccessoryListUtilities sortedAccessoryTypeGroups](HFAccessoryListUtilities, "sortedAccessoryTypeGroups");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v51 = self;
  -[HFRedesignMigrationController home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_allRooms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v45 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
  if (v45)
  {
    v44 = *(_QWORD *)v65;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v65 != v44)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v5);
        v7 = -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:]([HFReorderableHomeKitItemList alloc], "initWithApplicationDataContainer:category:", v6, CFSTR("roomServices_legacy"));
        v8 = (void *)-[HFReorderableHomeKitItemList mutableCopy](v7, "mutableCopy");

        HFLogForCategory(9uLL);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "sortedHomeKitObjectIdentifiers");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v71 = v10;
          v72 = 2112;
          v73 = v6;
          _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Legacy service item order: %@ for room %@", buf, 0x16u);

        }
        v47 = v5;

        if (objc_msgSend(v8, "isEmpty"))
        {
          objc_msgSend(v6, "hf_reorderableServicesList");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "sortedHomeKitObjectIdentifiers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setSortedHomeKitIdentifiers:", v12);

          v13 = (id)objc_msgSend(v8, "saveWithSender:", v51);
        }
        objc_msgSend(v6, "hf_accessoryLikeObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allObjects");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "na_filter:", &__block_literal_global_143);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __65__HFRedesignMigrationController__migrateServiceItemsOrderInRooms__block_invoke_2;
        v62[3] = &unk_1EA7413B8;
        v46 = v8;
        v63 = v46;
        objc_msgSend(v16, "sortedArrayUsingComparator:", v62);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v48 = v17;
        v19 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v59 != v21)
                objc_enumerationMutation(v48);
              v23 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
              objc_msgSend(v23, "accessoryType");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v56[0] = MEMORY[0x1E0C809B0];
              v56[1] = 3221225472;
              v56[2] = __65__HFRedesignMigrationController__migrateServiceItemsOrderInRooms__block_invoke_3;
              v56[3] = &unk_1EA729968;
              v25 = v24;
              v57 = v25;
              objc_msgSend(v50, "na_firstObjectPassingTest:", v56);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v26)
              {
                +[HFAccessoryTypeGroup otherAccessoryTypeGroup](HFAccessoryTypeGroup, "otherAccessoryTypeGroup");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v26, "uniqueIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "UUIDString");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                objc_msgSend(v18, "objectForKeyedSubscript:", v28);
                v29 = objc_claimAutoreleasedReturnValue();
                if (!v29)
                {
                  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  objc_msgSend(v18, "setValue:forKey:", v29, v28);
                }
                -[NSObject addObject:](v29, "addObject:", v23);
              }
              else
              {
                HFLogForCategory(9uLL);
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v71 = v25;
                  v72 = 2112;
                  v73 = v23;
                  _os_log_impl(&dword_1DD34E000, v29, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Couldn't find an accessory type group for this accessory, skipping. %@ %@", buf, 0x16u);
                }
              }

            }
            v20 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
          }
          while (v20);
        }

        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v30 = v18;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v53;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v53 != v33)
                objc_enumerationMutation(v30);
              v35 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
              objc_msgSend(v30, "objectForKeyedSubscript:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "na_map:", &__block_literal_global_165_2);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(CFSTR("roomServicesGroupedByType-"), "stringByAppendingString:", v35);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:]([HFMutableReorderableHomeKitItemList alloc], "initWithApplicationDataContainer:category:", v6, v38);
              -[HFMutableReorderableHomeKitItemList setSortedHomeKitObjects:](v39, "setSortedHomeKitObjects:", v37);
              -[HFMutableReorderableHomeKitItemList saveWithSender:](v39, "saveWithSender:", v51);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "addObject:", v40);

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
          }
          while (v32);
        }

        v5 = v47 + 1;
      }
      while (v47 + 1 != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    }
    while (v45);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v49);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

uint64_t __65__HFRedesignMigrationController__migrateServiceItemsOrderInRooms__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToProtocol:", &unk_1F04290B8);

  return v3;
}

uint64_t __65__HFRedesignMigrationController__migrateServiceItemsOrderInRooms__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "sortedHomeKitObjectComparator");
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeKitObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "homeKitObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = ((uint64_t (**)(_QWORD, void *, void *))v7)[2](v7, v8, v9);
  return v10;
}

uint64_t __65__HFRedesignMigrationController__migrateServiceItemsOrderInRooms__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsType:", *(_QWORD *)(a1 + 32));
}

uint64_t __65__HFRedesignMigrationController__migrateServiceItemsOrderInRooms__block_invoke_163(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "homeKitObject");
}

- (void)_updateScoreForAccessoriesInGroup:(id)a3 accessoryScores:(id)a4 incrementBy:(int64_t)a5 singleAccessoryIncrement:(int64_t)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");
        if (objc_msgSend(v9, "count") == 1)
          v18 = a6;
        else
          v18 = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17 + a5 + v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setObject:forKey:", v19, v15);
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

}

- (BOOL)_accessoryLikeItemIsHighValue:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CB9A28];
  v4 = a3;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A80], v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A30]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9AA8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v8;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9B00]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessoryType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v10, "containsObject:", v11);
  return (char)v4;
}

- (BOOL)_accessoryLikeObjectMustUseLargerSize:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CB9A30];
  v4 = a3;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9B00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessoryType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "containsObject:", v8);
  return (char)v5;
}

- (id)_sortAccessoriesInRoom:(id)a3 fromScoreMap:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  objc_msgSend(a3, "hf_reorderableServicesList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedHomeKitObjectComparator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "keyEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__HFRedesignMigrationController__sortAccessoriesInRoom_fromScoreMap___block_invoke;
  v13[3] = &unk_1EA741420;
  v14 = v7;
  v10 = v7;
  objc_msgSend(v9, "sortedArrayUsingComparator:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __69__HFRedesignMigrationController__sortAccessoriesInRoom_fromScoreMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeKitObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
  return v8;
}

- (double)_computeUsageThreshold:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "doubleValue");
          v12 = v11;

          v8 = v8 + v12;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    v13 = v8 / (double)(unint64_t)objc_msgSend(v4, "count") * 1.2;
  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (void)_reduceScoreForRepeatingPattern:(id)a3 accessoryScores:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  objc_msgSend(v5, "objectForKey:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 >= 1)
  {
    v8 = 5;
    if (v7 > 5)
      v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8 - 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, v10);

  }
}

- (id)_migrateTileSize
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__HFRedesignMigrationController__migrateTileSize__block_invoke;
  aBlock[3] = &unk_1EA741448;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  -[HFRedesignMigrationController home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_accessoryRepresentableUsageCountsByRoomWithFilter:", &__block_literal_global_172_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __49__HFRedesignMigrationController__migrateTileSize__block_invoke_3;
  v10[3] = &unk_1EA7414F8;
  v10[4] = self;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __49__HFRedesignMigrationController__migrateTileSize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "_accessoryLikeObjectMustUseLargerSize:", v5) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "legacyFavoriteTiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeKitObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsObject:", v9) & 1) != 0)
    {

    }
    else
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "_accessoryLikeItemIsHighValue:", v5);

      if ((v10 & 1) == 0)
      {
        v7 = 0;
        goto LABEL_8;
      }
    }
    objc_msgSend(v6, "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    v7 = v12 > 1;
  }
LABEL_8:

  return v7;
}

uint64_t __49__HFRedesignMigrationController__migrateTileSize__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_effectiveShowInHomeDashboard");
}

id __49__HFRedesignMigrationController__migrateTileSize__block_invoke_3(uint64_t a1, void *a2)
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  char v67;
  void *v68;
  uint64_t k;
  uint64_t v70;
  void *v71;
  void *v72;
  unint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  id v77;
  unint64_t v78;
  void *v79;
  void *v80;
  unint64_t v81;
  id v82;
  void *v83;
  id v84;
  NSObject *v85;
  void *v86;
  __int128 v88;
  id obj;
  void *v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[4];
  id v111;
  uint64_t v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  uint8_t v127[128];
  uint8_t buf[4];
  id v129;
  __int16 v130;
  void *v131;
  _BYTE v132[128];
  _BYTE v133[128];
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v92 = a2;
  v3 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithStrongToStrongObjects");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(9uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Starting Tile Size Migration", buf, 2u);
  }

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_allRooms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v93 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v122, v133, 16);
  if (v93)
  {
    v91 = *(_QWORD *)v123;
    *(_QWORD *)&v7 = 138412546;
    v88 = v7;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v123 != v91)
          objc_enumerationMutation(obj);
        v94 = v8;
        v9 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v8);
        objc_msgSend(v92, "objectForKey:", v9, v88);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_computeUsageThreshold:");
        v11 = v10;
        objc_msgSend(*(id *)(v3 + 1864), "mapTableWithStrongToStrongObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v101 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v99 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v96 = v9;
        objc_msgSend(v9, "hf_accessoryLikeObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "na_filter:", &__block_literal_global_176_3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v120 = 0u;
        v121 = 0u;
        v118 = 0u;
        v119 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v118, v132, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v119;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v119 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
              if (objc_msgSend(v20, "hf_effectiveShowInHomeDashboard"))
              {
                objc_msgSend(*(id *)(a1 + 32), "legacyFavoriteTiles");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "homeKitObject");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v21, "containsObject:", v22);

                if (v23)
                  objc_msgSend(v97, "addObject:", v20);
                if (objc_msgSend(*(id *)(a1 + 32), "_accessoryLikeItemIsHighValue:", v20))
                  objc_msgSend(v101, "addObject:", v20);
                objc_msgSend(v103, "objectForKey:", v20);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "doubleValue");
                v26 = v25;

                if (v26 > v11)
                  objc_msgSend(v99, "addObject:", v20);
                objc_msgSend(v20, "accessoryType");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "objectForKey:", v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = v28;
                if (v28)
                  v30 = v28;
                else
                  v30 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                v31 = v30;

                objc_msgSend(v31, "addObject:", v20);
                objc_msgSend(v20, "accessoryType");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKey:", v31, v32);

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v118, v132, 16);
          }
          while (v17);
        }

        v3 = 0x1E0CB3000uLL;
        objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithStrongToStrongObjects");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v15, "count") >= 2)
          objc_msgSend(*(id *)(a1 + 32), "_updateScoreForAccessoriesInGroup:accessoryScores:incrementBy:singleAccessoryIncrement:", v97, v33, 1, 3);
        objc_msgSend(*(id *)(a1 + 32), "_updateScoreForAccessoriesInGroup:accessoryScores:incrementBy:singleAccessoryIncrement:", v101, v33, 2, 2);
        objc_msgSend(*(id *)(a1 + 32), "_updateScoreForAccessoriesInGroup:accessoryScores:incrementBy:singleAccessoryIncrement:", v99, v33, 1, 1);
        HFLogForCategory(9uLL);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v96, "name");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v88;
          v129 = v96;
          v130 = 2112;
          v131 = v35;
          _os_log_impl(&dword_1DD34E000, v34, OS_LOG_TYPE_DEFAULT, "Tile Size Migration: Room: %@ %@", buf, 0x16u);

        }
        HFLogForCategory(9uLL);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v129 = v97;
          _os_log_impl(&dword_1DD34E000, v36, OS_LOG_TYPE_DEFAULT, "Tile Size Migration: favoriteAccessories: %@", buf, 0xCu);
        }

        HFLogForCategory(9uLL);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v129 = v101;
          _os_log_impl(&dword_1DD34E000, v37, OS_LOG_TYPE_DEFAULT, "Tile Size Migration: highValueAccessories: %@", buf, 0xCu);
        }

        HFLogForCategory(9uLL);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v129 = v99;
          _os_log_impl(&dword_1DD34E000, v38, OS_LOG_TYPE_DEFAULT, "Tile Size Migration: mostUsedAccessories: %@", buf, 0xCu);
        }

        HFLogForCategory(9uLL);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v129 = v12;
          _os_log_impl(&dword_1DD34E000, v39, OS_LOG_TYPE_DEFAULT, "Tile Size Migration: accessoriesByType: %@", buf, 0xCu);
        }

        if ((unint64_t)objc_msgSend(v12, "count") >= 2)
        {
          v116 = 0u;
          v117 = 0u;
          v114 = 0u;
          v115 = 0u;
          v40 = v12;
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v114, v127, 16);
          if (v41)
          {
            v42 = v41;
            v90 = v33;
            v43 = 0;
            v44 = 0;
            v45 = *(_QWORD *)v115;
            while (2)
            {
              for (j = 0; j != v42; ++j)
              {
                if (*(_QWORD *)v115 != v45)
                  objc_enumerationMutation(v40);
                objc_msgSend(v40, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * j));
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v47, "count") == 1)
                {
                  if (v44)
                  {

                    v44 = 0;
                    v33 = v90;
                    v3 = 0x1E0CB3000;
                    goto LABEL_56;
                  }
                  objc_msgSend(v47, "anyObject");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else if ((unint64_t)objc_msgSend(v47, "count") > 1)
                {
                  ++v43;
                }

              }
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v114, v127, 16);
              if (v42)
                continue;
              break;
            }

            v48 = v44;
            if (v44)
            {
              v33 = v90;
              v3 = 0x1E0CB3000;
              if (v43 < 1)
                goto LABEL_57;
              objc_msgSend(v90, "objectForKey:", v44);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v49, "integerValue") + 1);
              v40 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v90, "setObject:forKey:", v40, v44);
LABEL_56:

              v48 = v44;
            }
            else
            {
              v33 = v90;
              v3 = 0x1E0CB3000;
            }
LABEL_57:

            goto LABEL_58;
          }
          v44 = 0;
          goto LABEL_56;
        }
LABEL_58:
        v110[0] = MEMORY[0x1E0C809B0];
        v110[1] = 3221225472;
        v110[2] = __49__HFRedesignMigrationController__migrateTileSize__block_invoke_177;
        v110[3] = &unk_1EA7414D0;
        v50 = *(_QWORD *)(a1 + 32);
        v111 = v33;
        v112 = v50;
        v113 = v12;
        v51 = v12;
        v52 = v33;
        objc_msgSend(v15, "na_each:", v110);
        objc_msgSend(v95, "setObject:forKey:", v52, v96);

        v8 = v94 + 1;
      }
      while (v94 + 1 != v93);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v133, 16);
      v93 = v53;
    }
    while (v53);
  }

  objc_msgSend(*(id *)(a1 + 32), "home");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "hf_orderedRooms");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0;
  while (1)
  {
    v57 = objc_msgSend(v55, "count") ? objc_msgSend(v55, "count") - 1 : 0;
    if (v56 >= v57)
      break;
    objc_msgSend(v55, "objectAtIndexedSubscript:", v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectAtIndexedSubscript:", ++v56);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "objectForKey:", v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "objectForKey:", v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v60, "count") && objc_msgSend(v61, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_sortAccessoriesInRoom:fromScoreMap:", v58, v60);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_sortAccessoriesInRoom:fromScoreMap:", v59, v61);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = v62;
      objc_msgSend(v62, "firstObject");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "firstObject");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))()
        && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))()
        && (objc_msgSend(*(id *)(a1 + 32), "_accessoryLikeObjectMustUseLargerSize:", v65) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_reduceScoreForRepeatingPattern:accessoryScores:", v65, v61);
      }

    }
  }
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v66 = v55;
  v102 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v106, v126, 16);
  if (!v102)
  {

    v68 = 0;
LABEL_105:
    objc_msgSend(v68, "firstObject");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = (id)objc_msgSend(v83, "hf_setTileSize:", CFSTR("HFTileResizableSizeMedium"));

    goto LABEL_106;
  }
  v67 = 0;
  v68 = 0;
  v100 = *(_QWORD *)v107;
  v98 = v66;
  do
  {
    for (k = 0; k != v102; ++k)
    {
      v105 = v68;
      if (*(_QWORD *)v107 != v100)
        objc_enumerationMutation(v98);
      v70 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * k);
      objc_msgSend(v95, "objectForKey:", v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_sortAccessoriesInRoom:fromScoreMap:", v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v72, "count"))
      {
        v73 = 0;
        do
        {
          objc_msgSend(v72, "objectAtIndexedSubscript:", v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (v73 == objc_msgSend(v72, "count") - 2 && (unint64_t)objc_msgSend(v72, "count") >= 4)
            objc_msgSend(*(id *)(a1 + 32), "_reduceScoreForRepeatingPattern:accessoryScores:", v74, v71);
          if (v73 == objc_msgSend(v72, "count") - 1 && (unint64_t)objc_msgSend(v72, "count") >= 2)
          {
            v75 = *(_QWORD *)(a1 + 40);
            objc_msgSend(v72, "objectAtIndexedSubscript:", v73 - 1);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v75) = (*(uint64_t (**)(uint64_t, void *, void *))(v75 + 16))(v75, v76, v71);

            if ((v75 & 1) == 0)
              objc_msgSend(v71, "setObject:forKey:", &unk_1EA7CD780, v74);
          }
          if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) != 0)
          {
            v77 = (id)objc_msgSend(v74, "hf_setTileSize:", CFSTR("HFTileResizableSizeMedium"));
            v78 = v73 + 1;
            if (objc_msgSend(v72, "count") > v73 + 1)
            {
              objc_msgSend(v72, "objectAtIndexedSubscript:", v73 + 1);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "_reduceScoreForRepeatingPattern:accessoryScores:", v79, v71);

            }
            if (objc_msgSend(v72, "count") > v73 + 2)
            {
              objc_msgSend(v72, "objectAtIndexedSubscript:");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "_reduceScoreForRepeatingPattern:accessoryScores:", v80, v71);

            }
            v67 = 1;
          }
          else
          {
            v78 = v73 + 1;
          }

          v73 = v78;
        }
        while (v78 < objc_msgSend(v72, "count"));
      }
      v68 = v105;
      if (!v105 || (v81 = objc_msgSend(v72, "count"), v81 > objc_msgSend(v105, "count")))
      {
        v82 = v72;

        v68 = v82;
      }

    }
    v66 = v98;
    v102 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v106, v126, 16);
  }
  while (v102);

  if ((v67 & 1) == 0)
    goto LABEL_105;
LABEL_106:
  HFLogForCategory(9uLL);
  v85 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v129 = v95;
    _os_log_impl(&dword_1DD34E000, v85, OS_LOG_TYPE_DEFAULT, "Tile Size Migration: Room Scores: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  return v86;
}

uint64_t __49__HFRedesignMigrationController__migrateTileSize__block_invoke_175(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToProtocol:", &unk_1F04290B8);

  return v3;
}

void __49__HFRedesignMigrationController__migrateTileSize__block_invoke_177(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "accessoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(*(id *)(a1 + 40), "_accessoryLikeObjectMustUseLargerSize:", v12) & 1) != 0)
  {
    v6 = v12;
    v7 = &unk_1EA7CD798;
    goto LABEL_5;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_accessoryLikeItemIsHighValue:", v12))
  {
    v8 = *(void **)(a1 + 48);
    objc_msgSend(v12, "accessoryType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 >= 2)
    {
LABEL_2:
      v6 = v12;
      v7 = &unk_1EA7CD780;
LABEL_5:
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v6);
    }
  }

}

- (NSArray)legacyFavoriteTiles
{
  return self->_legacyFavoriteTiles;
}

@end
