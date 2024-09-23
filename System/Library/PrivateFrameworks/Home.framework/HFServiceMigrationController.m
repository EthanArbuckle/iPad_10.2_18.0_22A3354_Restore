@implementation HFServiceMigrationController

BOOL __64__HFServiceMigrationController_primaryServicesToMigrateForHome___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "hf_visibleServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

void __64__HFServiceMigrationController_primaryServicesToMigrateForHome___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "hf_primaryService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hf_isCamera") & 1) == 0
    && (objc_msgSend(v5, "hf_isMediaAccessory") & 1) == 0
    && (objc_msgSend(v5, "hf_isProgrammableSwitch") & 1) == 0)
  {
    v4 = objc_msgSend(v5, "hf_isRemoteControl");
    if (v3)
    {
      if ((v4 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    }
  }

}

+ (BOOL)homeNeedsMigration:(id)a3
{
  id v3;
  int v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  int v12;
  char v13;
  _DWORD v15[2];
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "hf_homeHasMigratedServicesToAccessories");
  objc_msgSend((id)objc_opt_class(), "primaryServicesToMigrateForHome:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = HFForceAccessoryNamingMigration();
  objc_msgSend(v3, "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeAccessControlForUser:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "isAdministrator");
  HFLogForCategory(9uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v4 ^ 1;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109888;
    v15[1] = v12;
    v16 = 1024;
    v17 = v6 != 0;
    v18 = 1024;
    v19 = v7;
    v20 = 1024;
    v21 = v10;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "homeNeedsMigration %{BOOL}d homeHasVisibleServicesToMigrate %{BOOL}d forcedMigrationPref %{BOOL}d isAdmin %{BOOL}d", (uint8_t *)v15, 0x1Au);
  }

  if (v6)
    v13 = v12;
  else
    v13 = 0;
  return v13 & v10 | v7;
}

+ (id)primaryServicesToMigrateForHome:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "na_filter:", &__block_literal_global_22_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__HFServiceMigrationController_primaryServicesToMigrateForHome___block_invoke_2;
  v9[3] = &unk_1EA72A2D8;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "na_each:", v9);

  return v7;
}

- (HFServiceMigrationController)initWithHome:(id)a3
{
  id v4;
  HFServiceMigrationController *v5;
  HFServiceMigrationController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFServiceMigrationController;
  v5 = -[HFServiceMigrationController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HFServiceMigrationController setHome:](v5, "setHome:", v4);
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceMigrationController setDispatcher:](v6, "setDispatcher:", v7);

    -[HFServiceMigrationController setTimeoutOverride:](v6, "setTimeoutOverride:", 0);
  }

  return v6;
}

- (id)migrateServicesToAccessory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  unint64_t v21;
  int64_t v22;
  dispatch_time_t v23;
  id v24;
  NSObject *v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];
  _QWORD v30[5];
  id v31;
  id v32;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[HFServiceMigrationController home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceMigrationController home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeAccessControlForUser:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAdministrator");

  if (v7)
  {
    v8 = (void *)objc_opt_class();
    -[HFServiceMigrationController home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryServicesToMigrateForHome:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_opt_class();
    -[HFServiceMigrationController home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessoriesToMigrateFavoritesForHome:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(9uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v10, "count");
      _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Migrating %lu services", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v35 = 0x2020000000;
    v16 = MEMORY[0x1E0C809B0];
    v36 = 0;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke;
    v30[3] = &unk_1EA72D1F8;
    v30[4] = self;
    v17 = v13;
    v31 = v17;
    p_buf = &buf;
    v18 = v14;
    v32 = v18;
    objc_msgSend(v10, "na_each:", v30);
    objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v16;
    v29[1] = 3221225472;
    v29[2] = __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_16;
    v29[3] = &unk_1EA726338;
    v29[4] = self;
    v20 = (id)objc_msgSend(v19, "addSuccessBlock:", v29);
    v21 = -[HFServiceMigrationController timeoutOverride](self, "timeoutOverride");
    if (v21)
      v22 = 1000000000 * v21;
    else
      v22 = 30000000000;
    v23 = dispatch_time(0, v22);
    v27[0] = v16;
    v27[1] = 3221225472;
    v27[2] = __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_18;
    v27[3] = &unk_1EA727DD8;
    v24 = v19;
    v28 = v24;
    dispatch_after(v23, MEMORY[0x1E0C80D38], v27);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    HFLogForCategory(9uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_DEFAULT, "User is not an admin - skipping.", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v24;
}

void __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  HFAccessoryBuilder *v7;
  void *v8;
  HFAccessoryBuilder *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  id v35;
  HFAccessoryBuilder *v36;
  id v37;
  uint8_t buf[4];
  _DWORD v39[7];

  *(_QWORD *)&v39[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeManager");
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = [HFAccessoryBuilder alloc];
    objc_msgSend(*(id *)(a1 + 32), "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HFAccessoryBuilder initWithExistingObject:inHome:](v7, "initWithExistingObject:inHome:", v4, v8);

    -[HFAccessoryBuilder setSkipPropagateFavoriteToServices:](v9, "setSkipPropagateFavoriteToServices:", 1);
    if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v4))
    {
      objc_msgSend(v4, "services");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "na_any:", &__block_literal_global_54);

      HFLogForCategory(9uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        v39[0] = v11;
        LOWORD(v39[1]) = 2112;
        *(_QWORD *)((char *)&v39[1] + 2) = v13;
        _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Migrating showInHomeDashboard %{BOOL}d for %@", buf, 0x12u);

      }
      -[HFAccessoryBuilder setShowInHomeDashboard:](v9, "setShowInHomeDashboard:", v11);
    }
    +[HFNamingComponents namingComponentFromService:](HFNamingComponents, "namingComponentFromService:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hf_isPowerStrip"))
    {
      objc_msgSend(v4, "configuredName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v23 = *(void **)(a1 + 48);
        -[HFAccessoryBuilder commitItem](v9, "commitItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v24);
LABEL_16:

        goto LABEL_17;
      }
      if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) < 2uLL)
        _HFLocalizedStringWithDefaultValue(CFSTR("HFMigrationAccessoryNamePowerStripSingle"), CFSTR("HFMigrationAccessoryNamePowerStripSingle"), 1);
      else
        HFLocalizedStringWithFormat(CFSTR("HFMigrationAccessoryNamePowerStripMultiple"), CFSTR("%lu"), v17, v18, v19, v20, v21, v22, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v25 = objc_claimAutoreleasedReturnValue();

      v15 = (id)v25;
    }
    -[HFAccessoryBuilder setName:](v9, "setName:", v15);
    v26 = (void *)MEMORY[0x1E0D519C0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_11;
    v30[3] = &unk_1EA72D1D0;
    v15 = v15;
    v31 = v15;
    v27 = v6;
    v28 = *(_QWORD *)(a1 + 32);
    v32 = v27;
    v33 = v28;
    v34 = v4;
    v35 = *(id *)(a1 + 48);
    v36 = v9;
    v37 = v3;
    objc_msgSend(v26, "futureWithBlock:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v29);

    v24 = v31;
    goto LABEL_16;
  }
  HFLogForCategory(9uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v39 = v3;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Service cannot be migrated because it does not have an accessory: %@", buf, 0xCu);
  }
LABEL_17:

}

uint64_t __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_showInHomeDashboard");
}

void __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(9uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Checking name %@ with home manager", buf, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_12;
  v10[3] = &unk_1EA72D1A8;
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 64);
  v14 = *(id *)(a1 + 72);
  v15 = *(id *)(a1 + 80);
  v16 = v3;
  v9 = v3;
  objc_msgSend(v6, "checkName:inHome:withValidationOptions:completionHandler:", v7, v8, 1, v10);

}

void __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_12(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a2)
  {
    HFLogForCategory(9uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(a1 + 40);
      v16 = 138412546;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Valid - Renaming %@ to primary service name %@", (uint8_t *)&v16, 0x16u);
    }

    v13 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "commitItem");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);
LABEL_8:

    goto LABEL_9;
  }
  if (v8)
  {
    HFLogForCategory(9uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 64);
      v16 = 138412546;
      v17 = v15;
      v18 = 2112;
      v19 = v9;
      _os_log_error_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_ERROR, "Skip name migration on service %@ due to error %@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 72), "finishWithNoResult");

}

void __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint8_t v5[16];

  HFLogForCategory(9uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Name migration complete!", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "hf_setHomeHasMigratedServicesToAccessories:", 1);

}

uint64_t __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_18(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  result = objc_msgSend(*(id *)(a1 + 32), "isFinished");
  if ((result & 1) == 0)
  {
    HFLogForCategory(9uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "Name migration is taking too long to complete. Cancelling.", v4, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "cancel");
  }
  return result;
}

+ (id)accessoriesToMigrateFavoritesForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_24_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __69__HFServiceMigrationController_accessoriesToMigrateFavoritesForHome___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "hf_visibleServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_25);

  return v3;
}

uint64_t __69__HFServiceMigrationController_accessoriesToMigrateFavoritesForHome___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasSetShowInHomeDashboard");
}

+ (BOOL)homeNeedsToDisplayMigrationOnboardingUI
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__HFServiceMigrationController_homeNeedsToDisplayMigrationOnboardingUI__block_invoke;
  v7[3] = &__block_descriptor_40_e16_B16__0__HMHome_8l;
  v7[4] = a1;
  LOBYTE(a1) = objc_msgSend(v5, "na_any:", v7);

  return (char)a1;
}

BOOL __71__HFServiceMigrationController_homeNeedsToDisplayMigrationOnboardingUI__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "primaryServicesToMigrateForHome:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "na_filter:", &__block_literal_global_27_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

BOOL __71__HFServiceMigrationController_homeNeedsToDisplayMigrationOnboardingUI__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_visibleServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (HFHomeKitDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (unint64_t)timeoutOverride
{
  return self->_timeoutOverride;
}

- (void)setTimeoutOverride:(unint64_t)a3
{
  self->_timeoutOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
}

@end
