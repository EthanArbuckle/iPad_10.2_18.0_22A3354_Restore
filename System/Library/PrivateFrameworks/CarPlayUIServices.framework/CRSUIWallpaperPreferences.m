@implementation CRSUIWallpaperPreferences

- (CRSUIWallpaperPreferences)initWithDataProvider:(id)a3
{
  id v5;
  CRSUIWallpaperPreferences *v6;
  CRPairedVehicleManager *v7;
  CRPairedVehicleManager *vehicleManager;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRSUIWallpaperPreferences;
  v6 = -[CRSUIWallpaperPreferences init](&v10, sel_init);
  if (v6)
  {
    v7 = (CRPairedVehicleManager *)objc_alloc_init(MEMORY[0x24BE15270]);
    vehicleManager = v6->_vehicleManager;
    v6->_vehicleManager = v7;

    objc_storeStrong((id *)&v6->_dataProvider, a3);
  }

  return v6;
}

- (void)setVehicle:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUIWallpaperPreferences dataProvider](self, "dataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wallpaperForDisplayWithID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRSUIWallpaperPreferences dataProvider](self, "dataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperForDisplayWithID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v12)
  {
    objc_storeStrong((id *)&self->_vehicle, a3);
  }
  else
  {
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    objc_storeStrong((id *)&self->_vehicle, a3);
    if ((v15 & 1) == 0)
    {
      CRSUILogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "wallpaperIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v17;
        _os_log_impl(&dword_20D6CC000, v16, OS_LOG_TYPE_DEFAULT, "[CRSUIWallpaperPreferences] Vehicle #wallpaper preference changed: %{public}@", (uint8_t *)&v19, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:", CFSTR("CRSUIWallpaperChangedNotification"), 0);

    }
  }

}

- (void)setStagedWallpaper:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUIWallpaperPreferences currentWallpaper](self, "currentWallpaper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
    objc_storeStrong((id *)&self->_stagedWallpaper, a3);

}

- (id)wallpaperFromThemeData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[CRSUIWallpaperPreferences dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v4, "objectForKeyedSubscript:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "currentWallpaper"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    -[CRSUIWallpaperPreferences dataProvider](self, "dataProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadWallpaperFromData:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)updateThemeData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  CRSUIWallpaperPreferences *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[16];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayThemeData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToDictionary:", v4);

  if (v7)
  {
    CRSUILogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D6CC000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring duplicated update to theme data", buf, 2u);
    }
    goto LABEL_26;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v37 = v4;
  v9 = v4;
  v39 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v45 != v38)
          objc_enumerationMutation(v9);
        v11 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = self;
        -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "displayThemeData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "currentWallpaper");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "currentWallpaper");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "isEqualToString:", v20);

        if (!v21)
        {
          v22 = 1;
          self = v13;
          goto LABEL_14;
        }
        self = v13;
      }
      v39 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (v39)
        continue;
      break;
    }
  }
  v22 = 0;
LABEL_14:

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = v9;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
    while (2)
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(v23, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRSUIWallpaperPreferences dataProvider](self, "dataProvider");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "currentWallpaper");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "loadWallpaperFromData:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "traits");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v30) = objc_msgSend(v32, "supportsDynamicAppearance");

        if (!(_DWORD)v30)
        {

          -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setDisplayThemeData:", v23);

          -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setAppearanceModePreference:", 2);
          goto LABEL_24;
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      if (v25)
        continue;
      break;
    }
  }

  -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDisplayThemeData:", v23);
LABEL_24:

  -[CRSUIWallpaperPreferences vehicleManager](self, "vehicleManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "saveVehicle:completion:", v36, &__block_literal_global_3);

  v4 = v37;
  if (v22)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v8, "postNotificationName:object:", CFSTR("CRSUIWallpaperChangedNotification"), 0);
LABEL_26:

  }
}

void __45__CRSUIWallpaperPreferences_updateThemeData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  if (v5)
  {
    CRSUILogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __45__CRSUIWallpaperPreferences_updateThemeData___block_invoke_cold_1();

  }
}

- (void)updateHasGaugeClusterScreen:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  _BOOL4 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hasGaugeClusterScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", v3);
  v8 = objc_msgSend(v6, "isEqualToNumber:", v7);

  if (v8)
  {
    CRSUILogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v15 = v3;
      _os_log_impl(&dword_20D6CC000, v9, OS_LOG_TYPE_DEFAULT, "Has gauge cluster screen already set with value: %d", buf, 8u);
    }

  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", v3);
    -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHasGaugeClusterScreen:", v10);

    -[CRSUIWallpaperPreferences vehicleManager](self, "vehicleManager");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveVehicle:completion:", v12, &__block_literal_global_22);

  }
}

void __57__CRSUIWallpaperPreferences_updateHasGaugeClusterScreen___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  if (v5)
  {
    CRSUILogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __45__CRSUIWallpaperPreferences_updateThemeData___block_invoke_cold_1();

  }
}

- (id)wallpaperForLayoutIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v4 = a3;
  -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayThemeData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayThemeData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSUIWallpaperPreferences dataProvider](self, "dataProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRSUIWallpaperPreferences dataProvider](self, "dataProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wallpaperForLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loadWallpaperFromData:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CRSUILogForCategory(6uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[CRSUIWallpaperPreferences wallpaperForLayoutIdentifier:].cold.1(self, v16);

    -[CRSUIWallpaperPreferences currentWallpaper](self, "currentWallpaper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (CRSUIWallpaper)currentWallpaper
{
  CRSUIWallpaper *stagedWallpaper;
  CRSUIWallpaper *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  stagedWallpaper = self->_stagedWallpaper;
  if (stagedWallpaper)
  {
    v3 = stagedWallpaper;
  }
  else
  {
    -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSUIWallpaperPreferences dataProvider](self, "dataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wallpaperForDisplayWithID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8
      || (-[CRSUIWallpaperPreferences dataProvider](self, "dataProvider"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "loadWallpaperFromData:", v8),
          v3 = (CRSUIWallpaper *)objc_claimAutoreleasedReturnValue(),
          v9,
          !v3))
    {
      -[CRSUIWallpaperPreferences dataProvider](self, "dataProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "defaultWallpapers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v3 = (CRSUIWallpaper *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (void)setCurrentWallpaper:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUIWallpaperPreferences dataProvider](self, "dataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperForDisplayWithID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  -[CRSUIWallpaperPreferences setStagedWallpaper:](self, "setStagedWallpaper:", 0);
  CRSUILogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      objc_msgSend(v4, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v15;
      _os_log_impl(&dword_20D6CC000, v13, OS_LOG_TYPE_DEFAULT, "[CRSUIWallpaperPreferences] Ignoring #wallpaper update to %{public}@ for vehicle", (uint8_t *)&v24, 0xCu);

    }
  }
  else
  {
    if (v14)
    {
      objc_msgSend(v4, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v16;
      _os_log_impl(&dword_20D6CC000, v13, OS_LOG_TYPE_DEFAULT, "[CRSUIWallpaperPreferences] Setting #wallpaper %{public}@ for vehicle", (uint8_t *)&v24, 0xCu);

    }
    -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSUIWallpaperPreferences dataProvider](self, "dataProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displayID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traits");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWallpaper:forDisplayWithID:requiresDarkAppearance:", v18, v20, objc_msgSend(v21, "supportsDynamicAppearance") ^ 1);

    -[CRSUIWallpaperPreferences vehicleManager](self, "vehicleManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "saveVehicle:completion:", v23, &__block_literal_global_23);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v13, "postNotificationName:object:", CFSTR("CRSUIWallpaperChangedNotification"), 0);
  }

}

void __49__CRSUIWallpaperPreferences_setCurrentWallpaper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  if (v5)
  {
    CRSUILogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __45__CRSUIWallpaperPreferences_updateThemeData___block_invoke_cold_1();

  }
}

- (BOOL)updateWallpaperToSupportDynamicAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  CRSUIWallpaperPreferences *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[4];
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[CRSUIWallpaperPreferences dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dynamicAppearanceWallpapersForVehicle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayThemeData");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[CRSUIWallpaperPreferences dataProvider](self, "dataProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v31 = self;
        -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "displayThemeData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "mutableCopy");

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v32 = v5;
        v14 = v5;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        if (v15)
        {
          v16 = v15;
          v17 = 0;
          v18 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v34 != v18)
                objc_enumerationMutation(v14);
              v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_opt_class();
              v21 = v20;
              if (v21 && (objc_opt_isKindOfClass() & 1) != 0)
                v22 = v21;
              else
                v22 = 0;

              if (v22)
              {
                objc_msgSend(v21, "displayID");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "objectForKey:", v23);
                v24 = objc_claimAutoreleasedReturnValue();

                if (v24)
                {
                  objc_msgSend(v21, "data");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject themeDataWithCurrentWallpaper:](v24, "themeDataWithCurrentWallpaper:", v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "displayID");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "setObject:forKey:", v26, v27);

                  v17 = 1;
                }
              }
              else
              {
                CRSUILogForCategory(6uLL);
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
                  -[CRSUIWallpaperPreferences updateWallpaperToSupportDynamicAppearance].cold.3(v37, (uint64_t)v21, &v38, v24);
              }

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
          }
          while (v16);
        }
        else
        {
          v17 = 0;
        }

        -[CRSUIWallpaperPreferences updateThemeData:](v31, "updateThemeData:", v13);
        v5 = v32;
        goto LABEL_31;
      }
    }
    else
    {

    }
    if (objc_msgSend(v5, "count") != 1)
      -[CRSUIWallpaperPreferences updateWallpaperToSupportDynamicAppearance].cold.2();
    objc_msgSend(v5, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v29 != 0;
    if (v29)
      -[CRSUIWallpaperPreferences setCurrentWallpaper:](self, "setCurrentWallpaper:", v29);

  }
  else
  {
    CRSUILogForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[CRSUIWallpaperPreferences updateWallpaperToSupportDynamicAppearance].cold.1(v28);

    v17 = 0;
  }
LABEL_31:

  return v17;
}

- (BOOL)_hasGaugeClusterScreen
{
  void *v2;
  void *v3;
  char v4;

  -[CRSUIWallpaperPreferences vehicle](self, "vehicle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hasGaugeClusterScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (CRVehicle)vehicle
{
  return self->_vehicle;
}

- (CRSUIWallpaperDataProviding)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (CRSUIWallpaper)stagedWallpaper
{
  return self->_stagedWallpaper;
}

- (CRPairedVehicleManager)vehicleManager
{
  return self->_vehicleManager;
}

- (void)setVehicleManager:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleManager, 0);
  objc_storeStrong((id *)&self->_stagedWallpaper, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
}

void __45__CRSUIWallpaperPreferences_updateThemeData___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20D6CC000, v0, v1, "Error saving vehicle: %@ error: %@");
  OUTLINED_FUNCTION_2();
}

- (void)wallpaperForLayoutIdentifier:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "vehicle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vehicle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wallpaperDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_fault_impl(&dword_20D6CC000, a2, OS_LOG_TYPE_FAULT, "Vehicle missing theme data. Asset: %@ Wallpaper: %@", (uint8_t *)&v8, 0x16u);

}

- (void)updateWallpaperToSupportDynamicAppearance
{
  objc_class *v7;
  void *v8;

  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v8;
  _os_log_fault_impl(&dword_20D6CC000, a4, OS_LOG_TYPE_FAULT, "Unsupported wallpaper type: %{public}@", a1, 0xCu);

}

@end
