@implementation BRCContainerScheduler

- (BRCContainerScheduler)initWithAccountSession:(id)a3 pushWorkloop:(id)a4
{
  BRCContainerScheduler *v7;
  void *v8;
  id *p_session;
  void *v10;
  BRCSyncBudgetThrottle *v11;
  BRCSyncBudgetThrottle *syncUpBudget;
  BRCSyncBudgetThrottle *v13;
  BRCSyncBudgetThrottle *v14;
  BRCSyncBudgetThrottle *v15;
  void *v16;
  BRCDeadlineScheduler *v17;
  void *v18;
  uint64_t v19;
  BRCDeadlineScheduler *syncScheduler;
  void *v21;
  uint64_t v22;
  BRCSyncBudgetThrottle *v23;
  id v24;
  uint64_t v25;
  BRCDeadlineSource *containerMetadataSyncSource;
  BRCDeadlineSource *v27;
  BRCSyncOperationThrottle *v28;
  void *v29;
  uint64_t v30;
  BRCSyncOperationThrottle *containerMetadataSyncDownThrottle;
  BRCSyncOperationThrottle *v32;
  void *v33;
  uint64_t v34;
  BRCSyncOperationThrottle *containerMetadataSyncUpThrottle;
  uint64_t v36;
  BRCDeadlineSource *sharedDatabaseSyncSource;
  BRCDeadlineSource *v38;
  BRCSyncOperationThrottle *v39;
  void *v40;
  uint64_t v41;
  BRCSyncOperationThrottle *sharedDatabaseSyncDownThrottle;
  uint64_t v43;
  BRCDeadlineSource *zoneHealthSyncSource;
  BRCDeadlineSource *v45;
  BRCSyncOperationThrottle *v46;
  void *v47;
  uint64_t v48;
  BRCSyncOperationThrottle *zoneHealthSyncUpThrottle;
  BRCSyncOperationThrottle *v50;
  void *v51;
  uint64_t v52;
  BRCSyncOperationThrottle *zoneHealthSyncDownThrottle;
  uint64_t v54;
  BRCDeadlineSource *migrateZonePCSSource;
  BRCDeadlineSource *v56;
  uint64_t v57;
  BRCDeadlineSource *sideCarSyncSource;
  BRCDeadlineSource *v59;
  BRCSyncOperationThrottle *v60;
  void *v61;
  uint64_t v62;
  BRCSyncOperationThrottle *sideCarSyncUpThrottle;
  BRCSyncOperationThrottle *v64;
  void *v65;
  uint64_t v66;
  BRCSyncOperationThrottle *sideCarSyncDownThrottle;
  void *v68;
  BRCFairSource *v69;
  void *v70;
  uint64_t v71;
  BRCFairSource *pushSource;
  void *v73;
  NSObject *v74;
  uint64_t v75;
  BRCContainerMetadataSyncPersistedState *containerMetadataPersistedState;
  uint64_t v77;
  BRCZoneHealthSyncPersistedState *zoneHealthPersistedState;
  uint64_t v79;
  BRCSideCarSyncPersistedState *sideCarSyncPersistedState;
  BRCPeriodicSyncScheduler *v81;
  BRCPeriodicSyncScheduler *periodicSyncScheduler;
  BRCSyncBudgetThrottle *v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  _QWORD v89[4];
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  id v96;
  _QWORD v97[4];
  id v98;
  _QWORD v99[4];
  id v100;
  _QWORD v101[4];
  BRCSyncBudgetThrottle *v102;
  id v103;
  id location;
  objc_super v105;

  v88 = a3;
  v87 = a4;
  v105.receiver = self;
  v105.super_class = (Class)BRCContainerScheduler;
  v7 = -[BRCContainerScheduler init](&v105, sel_init);
  if (v7)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v7);
    p_session = (id *)&v7->_session;
    objc_storeStrong((id *)&v7->_session, a3);
    -[BRCAccountSession clientState](v7->_session, "clientState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("syncUpBudget"));
    v11 = (BRCSyncBudgetThrottle *)objc_claimAutoreleasedReturnValue();
    syncUpBudget = v7->_syncUpBudget;
    v7->_syncUpBudget = v11;

    v13 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
    }
    else
    {
      v14 = objc_alloc_init(BRCSyncBudgetThrottle);

      objc_storeStrong((id *)&v7->_syncUpBudget, v14);
      v15 = v7->_syncUpBudget;
      objc_msgSend(*p_session, "clientState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("syncUpBudget"));

    }
    v17 = [BRCDeadlineScheduler alloc];
    objc_msgSend(*p_session, "fairClientDBScheduler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[BRCDeadlineScheduler initWithName:fairScheduler:](v17, "initWithName:fairScheduler:", CFSTR("com.apple.brc.sync"), v18);
    syncScheduler = v7->_syncScheduler;
    v7->_syncScheduler = (BRCDeadlineScheduler *)v19;

    objc_msgSend(v8, "syncUpThrottle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "minWait");
    -[BRCDeadlineScheduler setCoalescingLeeway:](v7->_syncScheduler, "setCoalescingLeeway:", brc_interval_to_nsec() / 10);

    v22 = MEMORY[0x1E0C809B0];
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke;
    v101[3] = &unk_1E8760E90;
    v23 = v14;
    v102 = v23;
    v24 = v8;
    v103 = v24;
    -[BRCDeadlineScheduler setComputeNextAdmissibleDateForScheduling:](v7->_syncScheduler, "setComputeNextAdmissibleDateForScheduling:", v101);
    v25 = -[BRCContainerScheduler _newSyncDeadlineSourceWithName:](v7, "_newSyncDeadlineSourceWithName:", CFSTR("metadata-sync"));
    v84 = v23;
    v86 = v24;
    containerMetadataSyncSource = v7->_containerMetadataSyncSource;
    v7->_containerMetadataSyncSource = (BRCDeadlineSource *)v25;

    v27 = v7->_containerMetadataSyncSource;
    v99[0] = v22;
    v99[1] = 3221225472;
    v99[2] = __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_8;
    v99[3] = &unk_1E875DC98;
    objc_copyWeak(&v100, &location);
    -[BRCDeadlineSource setEventHandler:](v27, "setEventHandler:", v99);
    v28 = [BRCSyncOperationThrottle alloc];
    objc_msgSend(MEMORY[0x1E0D10E88], "containerMetadataMangledID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[BRCSyncOperationThrottle initWithMangledID:isSyncDown:](v28, "initWithMangledID:isSyncDown:", v29, 1);
    containerMetadataSyncDownThrottle = v7->_containerMetadataSyncDownThrottle;
    v7->_containerMetadataSyncDownThrottle = (BRCSyncOperationThrottle *)v30;

    v32 = [BRCSyncOperationThrottle alloc];
    objc_msgSend(MEMORY[0x1E0D10E88], "containerMetadataMangledID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[BRCSyncOperationThrottle initWithMangledID:isSyncDown:](v32, "initWithMangledID:isSyncDown:", v33, 0);
    containerMetadataSyncUpThrottle = v7->_containerMetadataSyncUpThrottle;
    v7->_containerMetadataSyncUpThrottle = (BRCSyncOperationThrottle *)v34;

    v36 = -[BRCContainerScheduler _newSyncDeadlineSourceWithName:](v7, "_newSyncDeadlineSourceWithName:", CFSTR("shared-db-sync"));
    sharedDatabaseSyncSource = v7->_sharedDatabaseSyncSource;
    v7->_sharedDatabaseSyncSource = (BRCDeadlineSource *)v36;

    v38 = v7->_sharedDatabaseSyncSource;
    v97[0] = v22;
    v97[1] = 3221225472;
    v97[2] = __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_2;
    v97[3] = &unk_1E875DC98;
    objc_copyWeak(&v98, &location);
    -[BRCDeadlineSource setEventHandler:](v38, "setEventHandler:", v97);
    v39 = [BRCSyncOperationThrottle alloc];
    objc_msgSend(MEMORY[0x1E0D10E88], "sharedDatabaseMangledID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[BRCSyncOperationThrottle initWithMangledID:isSyncDown:](v39, "initWithMangledID:isSyncDown:", v40, 1);
    sharedDatabaseSyncDownThrottle = v7->_sharedDatabaseSyncDownThrottle;
    v7->_sharedDatabaseSyncDownThrottle = (BRCSyncOperationThrottle *)v41;

    v43 = -[BRCContainerScheduler _newSyncDeadlineSourceWithName:](v7, "_newSyncDeadlineSourceWithName:", CFSTR("zone-health-sync"));
    zoneHealthSyncSource = v7->_zoneHealthSyncSource;
    v7->_zoneHealthSyncSource = (BRCDeadlineSource *)v43;

    v45 = v7->_zoneHealthSyncSource;
    v95[0] = v22;
    v95[1] = 3221225472;
    v95[2] = __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_3;
    v95[3] = &unk_1E875DC98;
    objc_copyWeak(&v96, &location);
    -[BRCDeadlineSource setEventHandler:](v45, "setEventHandler:", v95);
    v46 = [BRCSyncOperationThrottle alloc];
    objc_msgSend(MEMORY[0x1E0D10E88], "zoneHealthMangledID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[BRCSyncOperationThrottle initWithMangledID:isSyncDown:](v46, "initWithMangledID:isSyncDown:", v47, 0);
    zoneHealthSyncUpThrottle = v7->_zoneHealthSyncUpThrottle;
    v7->_zoneHealthSyncUpThrottle = (BRCSyncOperationThrottle *)v48;

    v50 = [BRCSyncOperationThrottle alloc];
    objc_msgSend(MEMORY[0x1E0D10E88], "zoneHealthMangledID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[BRCSyncOperationThrottle initWithMangledID:isSyncDown:](v50, "initWithMangledID:isSyncDown:", v51, 1);
    zoneHealthSyncDownThrottle = v7->_zoneHealthSyncDownThrottle;
    v7->_zoneHealthSyncDownThrottle = (BRCSyncOperationThrottle *)v52;

    v54 = -[BRCContainerScheduler _newSyncDeadlineSourceWithName:](v7, "_newSyncDeadlineSourceWithName:", CFSTR("migrate-pcs-sync"));
    migrateZonePCSSource = v7->_migrateZonePCSSource;
    v7->_migrateZonePCSSource = (BRCDeadlineSource *)v54;

    v56 = v7->_migrateZonePCSSource;
    v93[0] = v22;
    v93[1] = 3221225472;
    v93[2] = __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_4;
    v93[3] = &unk_1E875DC98;
    objc_copyWeak(&v94, &location);
    -[BRCDeadlineSource setEventHandler:](v56, "setEventHandler:", v93);
    v57 = -[BRCContainerScheduler _newSyncDeadlineSourceWithName:](v7, "_newSyncDeadlineSourceWithName:", CFSTR("side-car-sync"));
    sideCarSyncSource = v7->_sideCarSyncSource;
    v7->_sideCarSyncSource = (BRCDeadlineSource *)v57;

    v59 = v7->_sideCarSyncSource;
    v91[0] = v22;
    v91[1] = 3221225472;
    v91[2] = __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_5;
    v91[3] = &unk_1E875DC98;
    objc_copyWeak(&v92, &location);
    -[BRCDeadlineSource setEventHandler:](v59, "setEventHandler:", v91);
    v60 = [BRCSyncOperationThrottle alloc];
    objc_msgSend(MEMORY[0x1E0D10E88], "sideCarMangledID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = -[BRCSyncOperationThrottle initWithMangledID:isSyncDown:](v60, "initWithMangledID:isSyncDown:", v61, 0);
    sideCarSyncUpThrottle = v7->_sideCarSyncUpThrottle;
    v7->_sideCarSyncUpThrottle = (BRCSyncOperationThrottle *)v62;

    v64 = [BRCSyncOperationThrottle alloc];
    objc_msgSend(MEMORY[0x1E0D10E88], "sideCarMangledID");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[BRCSyncOperationThrottle initWithMangledID:isSyncDown:](v64, "initWithMangledID:isSyncDown:", v65, 1);
    sideCarSyncDownThrottle = v7->_sideCarSyncDownThrottle;
    v7->_sideCarSyncDownThrottle = (BRCSyncOperationThrottle *)v66;

    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_isInSyncBubble = objc_msgSend(v68, "isInSyncBubble");

    LODWORD(v68) = v7->_isInSyncBubble;
    objc_storeStrong((id *)&v7->_pushWorkloop, a4);
    if (!(_DWORD)v68)
    {
      v69 = [BRCFairSource alloc];
      objc_msgSend(*p_session, "fairClientDBScheduler", v84, v86);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = -[BRCFairSource initWithName:scheduler:](v69, "initWithName:scheduler:", CFSTR("push"), v70);
      pushSource = v7->_pushSource;
      v7->_pushSource = (BRCFairSource *)v71;

      -[BRCFairSource setWorkloop:](v7->_pushSource, "setWorkloop:", v7->_pushWorkloop);
      v89[0] = v22;
      v89[1] = 3221225472;
      v89[2] = __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_6;
      v89[3] = &unk_1E875DC98;
      objc_copyWeak(&v90, &location);
      -[BRCFairSource setEventHandler:](v7->_pushSource, "setEventHandler:", v89);
      brc_bread_crumbs();
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
        -[BRCContainerScheduler initWithAccountSession:pushWorkloop:].cold.1();

      objc_destroyWeak(&v90);
    }
    +[BRCPersistedState loadFromClientStateInSession:](BRCContainerMetadataSyncPersistedState, "loadFromClientStateInSession:", *p_session, v84);
    v75 = objc_claimAutoreleasedReturnValue();
    containerMetadataPersistedState = v7->_containerMetadataPersistedState;
    v7->_containerMetadataPersistedState = (BRCContainerMetadataSyncPersistedState *)v75;

    +[BRCPersistedState loadFromClientStateInSession:](BRCZoneHealthSyncPersistedState, "loadFromClientStateInSession:", v7->_session);
    v77 = objc_claimAutoreleasedReturnValue();
    zoneHealthPersistedState = v7->_zoneHealthPersistedState;
    v7->_zoneHealthPersistedState = (BRCZoneHealthSyncPersistedState *)v77;

    +[BRCPersistedState loadFromClientStateInSession:](BRCSideCarSyncPersistedState, "loadFromClientStateInSession:", v7->_session);
    v79 = objc_claimAutoreleasedReturnValue();
    sideCarSyncPersistedState = v7->_sideCarSyncPersistedState;
    v7->_sideCarSyncPersistedState = (BRCSideCarSyncPersistedState *)v79;

    v81 = -[BRCPeriodicSyncScheduler initWithContainerScheduler:session:]([BRCPeriodicSyncScheduler alloc], "initWithContainerScheduler:session:", v7, v7->_session);
    periodicSyncScheduler = v7->_periodicSyncScheduler;
    v7->_periodicSyncScheduler = v81;

    objc_destroyWeak(&v92);
    objc_destroyWeak(&v94);
    objc_destroyWeak(&v96);
    objc_destroyWeak(&v98);
    objc_destroyWeak(&v100);

    objc_destroyWeak(&location);
  }

  return v7;
}

uint64_t __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  float v4;
  float v5;
  float v6;
  void *v7;
  NSObject *v8;

  v2 = (id *)(a1 + 32);
  v3 = *(void **)(a1 + 32);
  brc_interval_from_nsec();
  objc_msgSend(v3, "updateForTime:");
  objc_msgSend(*v2, "availableBudgetWithDefaults:", v2[1]);
  v5 = v4;
  objc_msgSend(v2[1], "syncUpMinimalBudget");
  if (v5 >= v6)
    return 0;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "nextDateWithBudgetWithDefaults:", *(_QWORD *)(a1 + 40));
  return brc_interval_to_nsec();
}

void __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_syncScheduleForContainersMetadata");

}

void __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_syncScheduleForSharedDatabase");

}

void __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_syncScheduleForZoneHealth");

}

void __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_scheduleCrossZoneMovePCSPrep");

}

void __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_syncScheduleForSideCar");

}

void __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePushTopicsRegistration");

}

- (void)enablePushNotifications
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Enabling push topics registration%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (id)_newSyncDeadlineSourceWithName:(id)a3
{
  id v4;
  BRCDeadlineSource *v5;
  void *v6;
  BRCDeadlineSource *v7;
  void *v8;

  v4 = a3;
  v5 = [BRCDeadlineSource alloc];
  -[BRCAccountSession defaultScheduler](self->_session, "defaultScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BRCDeadlineSource initWithScheduler:name:](v5, "initWithScheduler:name:", v6, v4);

  -[BRCDeadlineScheduler workloop](self->_syncScheduler, "workloop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCDeadlineSource setWorkloop:](v7, "setWorkloop:", v8);

  return v7;
}

- (void)_unscheduleClientZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setDelegate:", 0);
  objc_msgSend(v4, "syncDeadlineSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  if (objc_msgSend(v4, "isPrivateZone"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = v4;
    objc_msgSend(v4, "asPrivateClientZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appLibraries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
          brc_bread_crumbs();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v22 = v12;
            v23 = 2112;
            v24 = v13;
            _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] unscheduling app library %@%@", buf, 0x16u);
          }

          -[BRCAccountSession(LegacyAdditions) fsReader](self->_session, "fsReader");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "unscheduleAppLibraryForLostScan:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v9);
    }

    v4 = v16;
  }

}

- (void)closeContainers
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx shutting down periodic metadata sync%@");
  OUTLINED_FUNCTION_2();
}

void __40__BRCContainerScheduler_closeContainers__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cancel");
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  if (v2)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler closeContainers]_block_invoke", 320, &v17);
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __40__BRCContainerScheduler_closeContainers__block_invoke_cold_5();

    objc_msgSend(v2, "cancel");
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v2);
    __brc_leave_section(&v17);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cancel");
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 152);

  if (v5)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler closeContainers]_block_invoke", 327, &v17);
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __40__BRCContainerScheduler_closeContainers__block_invoke_cold_4();

    objc_msgSend(v5, "cancel");
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    __brc_leave_section(&v17);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "cancel");
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 192);

  if (v8)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler closeContainers]_block_invoke", 334, &v17);
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __40__BRCContainerScheduler_closeContainers__block_invoke_cold_3();

    objc_msgSend(v8, "cancel");
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    __brc_leave_section(&v17);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "cancel");
  v11 = *(id *)(*(_QWORD *)(a1 + 32) + 304);

  if (v11)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler closeContainers]_block_invoke", 341, &v17);
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __40__BRCContainerScheduler_closeContainers__block_invoke_cold_2();

    objc_msgSend(v11, "cancel");
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    __brc_leave_section(&v17);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "cancel");
  v14 = *(id *)(*(_QWORD *)(a1 + 32) + 248);

  if (v14)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler closeContainers]_block_invoke", 348, &v17);
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __40__BRCContainerScheduler_closeContainers__block_invoke_cold_1();

    objc_msgSend(v14, "cancel");
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
    __brc_leave_section(&v17);
  }

}

void __40__BRCContainerScheduler_closeContainers__block_invoke_30(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7[3];

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 296);
  if (v2)
  {
    memset(v7, 0, sizeof(v7));
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler closeContainers]_block_invoke", 358, v7);
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __40__BRCContainerScheduler_closeContainers__block_invoke_30_cold_1();

    objc_msgSend(v2, "cancel");
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v2);
    __brc_leave_section(v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__BRCContainerScheduler_closeContainers__block_invoke_31;
  v6[3] = &unk_1E875ECD0;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "enumerateClientZones:", v6);

}

uint64_t __40__BRCContainerScheduler_closeContainers__block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __40__BRCContainerScheduler_closeContainers__block_invoke_31_cold_1((uint64_t)v3);

  objc_msgSend(*(id *)(a1 + 32), "_unscheduleClientZone:", v3);
  return 1;
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_33(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setEnabledTopics:ignoredTopics:opportunisticTopics:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "shutdown");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  *(_QWORD *)(v2 + 72) = 0;

}

- (void)close
{
  NSObject *v3;
  BRCDeadlineScheduler *syncScheduler;
  _QWORD block[5];

  -[BRCDeadlineScheduler workloop](self->_syncScheduler, "workloop");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__BRCContainerScheduler_close__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async_and_wait(v3, block);

  syncScheduler = self->_syncScheduler;
  self->_syncScheduler = 0;

}

void __30__BRCContainerScheduler_close__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v2 + 8), "personaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BRPersonaSpecificName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeObserver:name:object:", v2, v4, 0);

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v5 + 8), "personaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BRPersonaSpecificName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeObserver:name:object:", v5, v7, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "close");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "_close");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = 0;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 32);
  *(_QWORD *)(v12 + 32) = 0;

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 312);
  *(_QWORD *)(v14 + 312) = 0;

  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = 0;

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 288);
  *(_QWORD *)(v18 + 288) = 0;

  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 8);
  *(_QWORD *)(v20 + 8) = 0;

}

- (void)setup
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx loading containers%@");
  OUTLINED_FUNCTION_2();
}

- (void)schedulePeriodicSyncInGroup:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BRCPeriodicSyncOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  BRCPeriodicSyncOperation *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[5];
  void (**v20)(id, void *);
  uint64_t v21[3];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertOnQueue");

  if (self->_periodicSyncOperation)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorOperationAlreadyRunning:", CFSTR("Periodic Sync"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);

  }
  else
  {
    memset(v21, 0, sizeof(v21));
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler schedulePeriodicSyncInGroup:completion:]", 458, v21);
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCContainerScheduler schedulePeriodicSyncInGroup:completion:].cold.1();

    v12 = [BRCPeriodicSyncOperation alloc];
    -[BRCContainerMetadataSyncPersistedState serverChangeToken](self->_containerMetadataPersistedState, "serverChangeToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCZoneHealthSyncPersistedState serverChangeToken](self->_zoneHealthPersistedState, "serverChangeToken");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSideCarSyncPersistedState serverChangeToken](self->_sideCarSyncPersistedState, "serverChangeToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[BRCPeriodicSyncOperation initWithContainerScheduler:metadataChangeToken:zoneHealthChangeToken:sideCarChangeToken:sessionContext:](v12, "initWithContainerScheduler:metadataChangeToken:zoneHealthChangeToken:sideCarChangeToken:sessionContext:", self, v13, v14, v15, self->_session);

    -[_BRCOperation callbackQueue](v16, "callbackQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v17, v18);

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__BRCContainerScheduler_schedulePeriodicSyncInGroup_completion___block_invoke;
    v19[3] = &unk_1E8760EB8;
    v19[4] = self;
    v20 = v7;
    -[_BRCOperation setFinishBlock:](v16, "setFinishBlock:", v19);
    -[_BRCOperation setGroup:](v16, "setGroup:", v6);
    objc_storeStrong((id *)&self->_periodicSyncOperation, v16);
    -[_BRCOperation schedule](v16, "schedule");
    -[BRCContainerScheduler scheduleSyncDownForSharedDatabaseImmediately:](self, "scheduleSyncDownForSharedDatabaseImmediately:", 0);

    __brc_leave_section(v21);
  }

}

void __64__BRCContainerScheduler_schedulePeriodicSyncInGroup_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      __64__BRCContainerScheduler_schedulePeriodicSyncInGroup_completion___block_invoke_cold_1((uint64_t)v4);

  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 296);
  *(_QWORD *)(v7 + 296) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)resume
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Sync: resuming sync%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __31__BRCContainerScheduler_resume__block_invoke(uint64_t a1, void *a2)
{
  int v3;

  v3 = objc_msgSend(a2, "containerMetadataNeedsSyncUp");
  if (v3)
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96) |= 1u;
  return v3 ^ 1u;
}

uint64_t __31__BRCContainerScheduler_resume__block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  v3 = objc_msgSend(a2, "zoneHealthNeedsSyncUp");
  if (v3)
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 184) |= 1u;
  return v3 ^ 1u;
}

- (void)didInitialSyncDownForClientZone:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8[3];

  v4 = a3;
  if (objc_msgSend(v4, "isCloudDocsZone"))
  {
    memset(v8, 0, sizeof(v8));
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler didInitialSyncDownForClientZone:]", 540, v8);
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCContainerScheduler didInitialSyncDownForClientZone:].cold.1();

    -[BRCContainerScheduler session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markAccountMigrationComplete");

    __brc_leave_section(v8);
  }

}

- (void)scheduleSyncDownForContainerMetadataWithGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BRCDeadlineScheduler workloop](self->_syncScheduler, "workloop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__BRCContainerScheduler_scheduleSyncDownForContainerMetadataWithGroup___block_invoke;
  v7[3] = &unk_1E875D470;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_with_logs_6(v5, v7);

}

uint64_t __71__BRCContainerScheduler_scheduleSyncDownForContainerMetadataWithGroup___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __71__BRCContainerScheduler_scheduleSyncDownForContainerMetadataWithGroup___block_invoke_cold_1();

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96) |= 2u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setNeedsContainerMetadataSyncDown:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setCkGroup:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceBatchStart");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "signal");
}

- (void)scheduleSyncDownForSharedDatabaseImmediately:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[BRCDeadlineScheduler workloop](self->_syncScheduler, "workloop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__BRCContainerScheduler_scheduleSyncDownForSharedDatabaseImmediately___block_invoke;
  v6[3] = &unk_1E8760EE0;
  v7 = a3;
  v6[4] = self;
  dispatch_async_with_logs_6(v5, v6);

}

uint64_t __70__BRCContainerScheduler_scheduleSyncDownForSharedDatabaseImmediately___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = 0;
  }
  else
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "sharedDbSyncDownCoalesceNanoseconds");

  }
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __70__BRCContainerScheduler_scheduleSyncDownForSharedDatabaseImmediately___block_invoke_cold_1();

  v6 = brc_current_date_nsec() + v2;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 144) |= 2u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setNeedsSharedDBSyncDown:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forceBatchStart");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "signalWithDeadline:", v6);
}

- (void)scheduleSyncDownForZoneHealthWithGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BRCDeadlineScheduler workloop](self->_syncScheduler, "workloop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__BRCContainerScheduler_scheduleSyncDownForZoneHealthWithGroup___block_invoke;
  v7[3] = &unk_1E875D470;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_with_logs_6(v5, v7);

}

uint64_t __64__BRCContainerScheduler_scheduleSyncDownForZoneHealthWithGroup___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __64__BRCContainerScheduler_scheduleSyncDownForZoneHealthWithGroup___block_invoke_cold_1();

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 184) |= 2u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setNeedsSyncDown:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setCkGroup:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceBatchStart");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "signal");
}

- (void)scheduleSyncDownForSideCarWithGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BRCDeadlineScheduler workloop](self->_syncScheduler, "workloop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__BRCContainerScheduler_scheduleSyncDownForSideCarWithGroup___block_invoke;
  v7[3] = &unk_1E875D470;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_with_logs_6(v5, v7);

}

uint64_t __61__BRCContainerScheduler_scheduleSyncDownForSideCarWithGroup___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __61__BRCContainerScheduler_scheduleSyncDownForSideCarWithGroup___block_invoke_cold_1();

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 240) |= 2u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "setNeedsSync:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "setCkGroup:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceBatchStart");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "signal");
}

- (void)redoZonePCSPreperation
{
  void *v3;
  _QWORD v4[5];

  -[BRCDeadlineScheduler workloop](self->_syncScheduler, "workloop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__BRCContainerScheduler_redoZonePCSPreperation__block_invoke;
  v4[3] = &unk_1E875D500;
  v4[4] = self;
  dispatch_async_with_logs_6(v3, v4);

}

uint64_t __47__BRCContainerScheduler_redoZonePCSPreperation__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __47__BRCContainerScheduler_redoZonePCSPreperation__block_invoke_cold_1();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setNeedsPCSMigration:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "signal");
}

- (void)scheduleSyncUpForSideCar
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] marking side-car needs-sync-up%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didChangeSyncStatusForZoneHealthForContainer:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[BRCDeadlineScheduler workloop](self->_syncScheduler, "workloop", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__BRCContainerScheduler_didChangeSyncStatusForZoneHealthForContainer___block_invoke;
  v5[3] = &unk_1E875D500;
  v5[4] = self;
  dispatch_async_with_logs_6(v4, v5);

}

uint64_t __70__BRCContainerScheduler_didChangeSyncStatusForZoneHealthForContainer___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __70__BRCContainerScheduler_didChangeSyncStatusForZoneHealthForContainer___block_invoke_cold_1();

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 184) |= 1u;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "signal");
}

- (void)didChangeSyncStatusForContainerMetadataForContainer:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[BRCDeadlineScheduler workloop](self->_syncScheduler, "workloop", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__BRCContainerScheduler_didChangeSyncStatusForContainerMetadataForContainer___block_invoke;
  v5[3] = &unk_1E875D500;
  v5[4] = self;
  dispatch_async_with_logs_6(v4, v5);

}

uint64_t __77__BRCContainerScheduler_didChangeSyncStatusForContainerMetadataForContainer___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __77__BRCContainerScheduler_didChangeSyncStatusForContainerMetadataForContainer___block_invoke_cold_1();

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96) |= 1u;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "signal");
}

- (void)_scheduleAfterFlush:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__BRCContainerScheduler__scheduleAfterFlush___block_invoke;
  v7[3] = &unk_1E875DD58;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "scheduleFlushWithCheckpoint:whenFlushed:", 0, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __45__BRCContainerScheduler__scheduleAfterFlush___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[43], "workloop");
    v4 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__BRCContainerScheduler__scheduleAfterFlush___block_invoke_2;
    v6[3] = &unk_1E875F7C0;
    v5 = *(id *)(a1 + 32);
    v6[4] = v3;
    v7 = v5;
    dispatch_async(v4, v6);

  }
}

uint64_t __45__BRCContainerScheduler__scheduleAfterFlush___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_syncScheduleForContainersMetadata
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx scheduling container-metadata sync%@");
  OUTLINED_FUNCTION_2();
}

void __59__BRCContainerScheduler__syncScheduleForContainersMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  unsigned int v22;
  id WeakRetained;
  char isKindOfClass;
  uint64_t v25;
  id v26;
  id v27;
  int v28;
  unsigned int v29;
  __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  __CFString *v33;
  __CFString *v34;
  id v35;
  uint64_t v36[3];
  id v37;
  uint8_t buf[4];
  __CFString *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v35 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = 0;

  v37 = 0;
  v8 = objc_msgSend(v5, "brc_containerResetErrorForSharedZone:resetReason:", 0, &v37);
  v9 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96);
  if (v8)
  {
    v10 = objc_alloc(MEMORY[0x1E0D10E88]);
    v11 = (void *)objc_msgSend(v10, "initWithZoneName:ownerName:", *MEMORY[0x1E0D10DA0], *MEMORY[0x1E0C94730]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientZoneByMangledID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "enhancedDrivePrivacyEnabled");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "lastSyncDownDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[AppTelemetryTimeSeriesEvent newZoneResetEventWithZoneMangledID:enhancedDrivePrivacyEnabled:lastSyncDate:error:errorDescription:](AppTelemetryTimeSeriesEvent, "newZoneResetEventWithZoneMangledID:enhancedDrivePrivacyEnabled:lastSyncDate:error:errorDescription:", v11, v13, v14, v5, v37);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "analyticsReporter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v15);

    memset(v36, 0, sizeof(v36));
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler _syncScheduleForContainersMetadata]_block_invoke", 723, v36);
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v31 = v36[0];
      v32 = BRCPrettyPrintEnum();
      *(_DWORD *)buf = 134218498;
      v39 = (__CFString *)v31;
      v40 = 2080;
      v41 = v32;
      v42 = 2112;
      v43 = v17;
      _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx resetting container-metadata: %s%@", buf, 0x20u);
    }

    if (v8 >= 2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateAppLibraries:", &__block_literal_global_20);
      v9 |= 1u;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "containerMetadataWasReset");
    __brc_leave_section(v36);

    v9 |= 2u;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v25 = *(_QWORD *)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*(id *)(v25 + 120), "updateForError:", v5);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), a3);
      v26 = objc_loadWeakRetained((id *)(a1 + 40));
      v11 = v26;
      v9 |= 0x12u;
      if (!v5 && !objc_msgSend(v26, "shouldPerformAnotherBatch"))
        v9 &= ~1u;
    }
    else
    {
      objc_msgSend(*(id *)(v25 + 112), "updateForError:", v5);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), a3);
      v27 = objc_loadWeakRetained((id *)(a1 + 40));
      v11 = v27;
      if (!v5)
      {
        v28 = objc_msgSend(v27, "shouldFetchAnotherBatch");
        v29 = v9 & 0xFFFFFFCD;
        if (v28)
          v29 = v9;
        v9 = v29 & 0xFFFFFFCF | 0x20;
      }
    }
  }

  if ((v9 & 2) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setNeedsContainerMetadataSyncDown:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setHasCaughtUpAtLeastOnce:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "forceBatchStart");

  }
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v9 & 0xFFFFFFF3;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 96))
    {
      BRCPrettyPrintBitmap();
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = CFSTR("idle");
    }
    v33 = v30;
    if (v22)
    {
      BRCPrettyPrintBitmap();
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = CFSTR("idle");
    }
    *(_DWORD *)buf = 138412802;
    v39 = v33;
    v40 = 2112;
    v41 = (uint64_t)v34;
    v42 = 2112;
    v43 = v20;
    _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Container metadata sync state (%@) -> (%@)%@", buf, 0x20u);

  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96) = v22;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "signal");

}

uint64_t __59__BRCContainerScheduler__syncScheduleForContainersMetadata__block_invoke_53(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "containerMetadataEtag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "setContainerMetadataEtag:", 0);
    objc_msgSend(v2, "setContainerMetadataNeedsSyncUp:", 1);
  }

  return 1;
}

uint64_t __59__BRCContainerScheduler__syncScheduleForContainersMetadata__block_invoke_55(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 104), *(id *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "schedule");
}

- (void)_syncScheduleForSharedDatabase
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx scheduling shared-db sync%@");
  OUTLINED_FUNCTION_2();
}

void __55__BRCContainerScheduler__syncScheduleForSharedDatabase__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  int v13;
  void *v14;
  const char *v15;
  _BYTE v16[12];
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 152);
  *(_QWORD *)(v7 + 152) = 0;

  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v15 = "NO";
    *(_DWORD *)v16 = 136315650;
    if (a2)
      v15 = "YES";
    *(_QWORD *)&v16[4] = v15;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v9;
    _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished sharedb sync down with more coming: %s, error %@%@", v16, 0x20u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "updateForError:", v6);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), a3);
  if (v6)
    v11 = 2;
  else
    v11 = 32;
  if (!v6 && a2)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 144) |= 2u;
    v11 = 32;
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 144) |= v11;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_DWORD *)(v12 + 144);
  if ((v13 & 2) == 0)
  {
    objc_msgSend(*(id *)(v12 + 88), "setNeedsSharedDBSyncDown:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "forceBatchStart");

    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_DWORD *)(v12 + 144);
  }
  *(_DWORD *)(v12 + 144) = v13 & 0xFFFFFFF3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "signal", *(_QWORD *)v16);

}

- (void)_syncScheduleForZoneHealth
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx scheduling zone-health sync%@");
  OUTLINED_FUNCTION_2();
}

void __51__BRCContainerScheduler__syncScheduleForZoneHealth__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  int v27;
  unsigned int v28;
  int v29;
  uint64_t v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "workloop");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 192);
  *(_QWORD *)(v7 + 192) = 0;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = *(id *)(*(_QWORD *)(a1 + 32) + 328);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14++) + 16))();
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v12);
    }

    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 328);
    *(_QWORD *)(v15 + 328) = 0;

  }
  v32 = 0;
  if (objc_msgSend(v5, "brc_containerResetErrorForSharedZone:resetReason:", 0, &v32))
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v17;
      _os_log_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Resetting zone health%@", buf, 0xCu);
    }

    v19 = objc_alloc(MEMORY[0x1E0D10E88]);
    v20 = (void *)objc_msgSend(v19, "initWithZoneName:ownerName:", *MEMORY[0x1E0D10E20], *MEMORY[0x1E0C94730]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientZoneByMangledID:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "enhancedDrivePrivacyEnabled");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "lastSyncDownDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = +[AppTelemetryTimeSeriesEvent newZoneResetEventWithZoneMangledID:enhancedDrivePrivacyEnabled:lastSyncDate:error:errorDescription:](AppTelemetryTimeSeriesEvent, "newZoneResetEventWithZoneMangledID:enhancedDrivePrivacyEnabled:lastSyncDate:error:errorDescription:", v20, v22, v23, v5, v32);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "analyticsReporter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v24);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumeratePrivateClientZones:", &__block_literal_global_68);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "zoneHealthWasReset");

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "updateForError:", v5);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 216), a3);
      v26 = *(_QWORD *)(a1 + 32);
      v27 = *(_DWORD *)(v26 + 184);
      if (v5)
      {
        v28 = v27 | 2;
      }
      else
      {
        *(_DWORD *)(v26 + 184) = v27 | 0x20;
        v26 = *(_QWORD *)(a1 + 32);
        v28 = *(_DWORD *)(v26 + 184) & 0xFFFFFFEF;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_24;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "updateForError:", v5);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 224), a3);
      v26 = *(_QWORD *)(a1 + 32);
      v29 = *(_DWORD *)(v26 + 184);
      if (v5)
      {
        v28 = v29 | 0x13;
      }
      else
      {
        *(_DWORD *)(v26 + 184) = v29 | 0x10;
        if (!objc_msgSend(WeakRetained, "shouldPerformAnotherBatch"))
          goto LABEL_24;
        v26 = *(_QWORD *)(a1 + 32);
        v28 = *(_DWORD *)(v26 + 184) | 1;
      }
    }
    *(_DWORD *)(v26 + 184) = v28;
  }
LABEL_24:
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 184) &= 0xFFFFFFF3;
  v30 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v30 + 184) & 2) == 0)
  {
    objc_msgSend(*(id *)(v30 + 176), "setNeedsSyncDown:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "forceBatchStart");

    v30 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v30 + 32), "signal");

}

uint64_t __51__BRCContainerScheduler__syncScheduleForZoneHealth__block_invoke_67(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "zoneHealthWasReset");
  return 1;
}

uint64_t __51__BRCContainerScheduler__syncScheduleForZoneHealth__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 192), *(id *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "schedule");
}

- (void)_syncScheduleForSideCar
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx scheduling side-car sync%@");
  OUTLINED_FUNCTION_2();
}

void __48__BRCContainerScheduler__syncScheduleForSideCar__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "workloop");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 248);
  *(_QWORD *)(v7 + 248) = 0;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v25 = 0;
  if (objc_msgSend(v5, "brc_containerResetErrorForSharedZone:resetReason:", 0, &v25))
  {
    v10 = objc_alloc(MEMORY[0x1E0D10E88]);
    v11 = (void *)objc_msgSend(v10, "initWithZoneName:ownerName:", *MEMORY[0x1E0D11150], *MEMORY[0x1E0C94730]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientZoneByMangledID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "enhancedDrivePrivacyEnabled");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "lastSyncDownDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[AppTelemetryTimeSeriesEvent newZoneResetEventWithZoneMangledID:enhancedDrivePrivacyEnabled:lastSyncDate:error:errorDescription:](AppTelemetryTimeSeriesEvent, "newZoneResetEventWithZoneMangledID:enhancedDrivePrivacyEnabled:lastSyncDate:error:errorDescription:", v11, v13, v14, v5, v25);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "analyticsReporter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v15);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "serverTruthWorkloop");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __48__BRCContainerScheduler__syncScheduleForSideCar__block_invoke_2;
    v24[3] = &unk_1E875D500;
    v24[4] = *(_QWORD *)(a1 + 32);
    dispatch_async_with_logs_6(v17, v24);

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "updateForError:", v5);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 272), a3);
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(_DWORD *)(v18 + 240);
    if (v5)
    {
      v20 = v19 | 2;
    }
    else
    {
      *(_DWORD *)(v18 + 240) = v19 | 0x20;
      v18 = *(_QWORD *)(a1 + 32);
      v20 = *(_DWORD *)(v18 + 240) & 0xFFFFFFEF;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_13;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "updateForError:", v5);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 280), a3);
    v18 = *(_QWORD *)(a1 + 32);
    v21 = *(_DWORD *)(v18 + 240);
    if (v5)
    {
      v20 = v21 | 0x13;
    }
    else
    {
      *(_DWORD *)(v18 + 240) = v21 | 0x10;
      if (!objc_msgSend(WeakRetained, "shouldPerformAnotherBatch"))
        goto LABEL_13;
      v18 = *(_QWORD *)(a1 + 32);
      v20 = *(_DWORD *)(v18 + 240) | 1;
    }
  }
  *(_DWORD *)(v18 + 240) = v20;
LABEL_13:
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 240) &= 0xFFFFFFF3;
  v22 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v22 + 240) & 3) == 0)
  {
    objc_msgSend(*(id *)(v22 + 232), "setNeedsSync:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "forceBatchStart");

    v22 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v22 + 40), "signal");

}

uint64_t __48__BRCContainerScheduler__syncScheduleForSideCar__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v2;
    _os_log_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Resetting side car zone%@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateSharedClientZones:", &__block_literal_global_75);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "serverDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "execute:", CFSTR("DELETE FROM side_car_lookahead"));

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "sideCarZoneWasReset");
}

uint64_t __48__BRCContainerScheduler__syncScheduleForSideCar__block_invoke_73(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "serverZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asSharedZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sideCarZoneWasReset");

  return 1;
}

uint64_t __48__BRCContainerScheduler__syncScheduleForSideCar__block_invoke_2_78(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 248), *(id *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "schedule");
}

- (void)_printSyncErrorIfNecessaryWithThrottle:(id)a3 context:(id)a4 error:(id)a5 now:(int64_t)a6
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  id v13;
  const __CFString *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v20, "nextTry");
  v11 = v10;
  brc_interval_from_nsec();
  if (v11 > v12)
  {
    objc_msgSend(v8, "pushIndentation");
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (objc_msgSend(v20, "isSyncDown"))
      v14 = CFSTR("down");
    else
      v14 = CFSTR("up");
    objc_msgSend(v20, "nextTry");
    v16 = v15;
    brc_interval_from_nsec();
    v18 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR(" [sync-%@ throttled (next-try:in %.01fs)] error: %@"), v14, v16 - v17, v9);
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v18, 3, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "writeLineWithFormat:", CFSTR("%@"), v19);
    objc_msgSend(v8, "popIndentation");

  }
}

- (void)dumpToContext:(id)a3 includeAllItems:(BOOL)a4 db:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  __CFString *v12;
  void *v13;
  char v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  BRCContainerScheduler *v25;
  NSString *environmentName;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  int v47;
  const __CFString *v48;
  uint64_t v49;
  __CFString *v50;
  uint64_t v51;
  void *v52;
  const __CFString *v53;
  __CFString *v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  __CFString *v58;
  uint64_t v59;
  void *v60;
  const __CFString *v61;
  __CFString *v62;
  uint64_t v63;
  void *v64;
  const __CFString *v65;
  BRCMigrateZonePCSOperation *migrateZonePCSOperation;
  void *v67;
  _BOOL4 v68;
  const __CFString *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _BOOL4 v79;
  NSString *v80;
  void *v81;
  __CFString *v82;
  __CFString *v83;
  __CFString *v84;
  void *v85;
  void *v86;
  char v87;

  v7 = a3;
  v8 = a5;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isNetworkReachable") & 1) != 0)
  {
    v84 = CFSTR("online");
  }
  else
  {
    +[BRCDumpContext stringFromErrorString:context:](BRCDumpContext, "stringFromErrorString:context:", CFSTR("offline"), v7);
    v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v9, "isPowerOK") & 1) != 0)
  {
    v83 = CFSTR("healthy");
  }
  else
  {
    +[BRCDumpContext stringFromErrorString:context:](BRCDumpContext, "stringFromErrorString:context:", CFSTR("low"), v7);
    v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[BRCAccountSession volume](self->_session, "volume");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "hasEnoughSpaceForDevice:", objc_msgSend(v10, "deviceID"));

  if ((v11 & 1) != 0)
  {
    v12 = CFSTR("healthy");
  }
  else
  {
    +[BRCDumpContext stringFromErrorString:context:](BRCDumpContext, "stringFromErrorString:context:", CFSTR("low disk"), v7);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  +[BRCContainerCellularSettings containerCellularSettings](BRCContainerCellularSettings, "containerCellularSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isCellularEnabled");

  if ((v14 & 1) != 0)
  {
    v82 = CFSTR("enabled");
  }
  else
  {
    +[BRCDumpContext stringFromErrorString:context:](BRCDumpContext, "stringFromErrorString:context:", CFSTR("disabled"), v7);
    v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v86 = (void *)objc_msgSend(v8, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT COUNT(*) from server_items"));
  v81 = (void *)objc_msgSend(v8, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT COUNT(*) from client_items"));
  v15 = (unint64_t)objc_msgSend(v81, "unsignedLongLongValue") > 0x3E8
     || (unint64_t)objc_msgSend(v86, "unsignedLongLongValue") >= 0x3E9;
  -[BRCAccountSession volume](self->_session, "volume");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "freeSize");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = v17;
  v79 = v15;
  if (v17)
  {
    +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", objc_msgSend(v17, "longLongValue"), 0, CFSTR(" available"), v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR(" %@"), v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v12 = (__CFString *)v19;
  }
  -[BRCAccountSession volume](self->_session, "volume");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fsTypeName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "uppercaseString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highlightedString:type:", v22, 7);
  v23 = objc_claimAutoreleasedReturnValue();

  v77 = (void *)v23;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v12, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = self;
  objc_sync_enter(v25);
  environmentName = v25->_environmentName;
  if (environmentName)
  {
    v80 = environmentName;
  }
  else
  {
    +[BRCDumpContext stringFromErrorString:context:](BRCDumpContext, "stringFromErrorString:context:", CFSTR("no environment"), v7);
    v80 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  -[NSData description](v25->_pushToken, "description");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  v75 = v8;
  v76 = v9;
  if (v27)
  {
    v29 = v27;
  }
  else
  {
    +[BRCDumpContext stringFromErrorString:context:](BRCDumpContext, "stringFromErrorString:context:", CFSTR("no token"), v7);
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;

  objc_sync_exit(v25);
  -[BRCAccountSession fsUploader](self->_session, "fsUploader");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "quotaAvailableForOwner:", *MEMORY[0x1E0C94730]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class currentDevice](getUIDeviceClass(), "currentDevice");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "name");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("system"));
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
  objc_msgSend(v7, "pushIndentation");
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ network: %@"), v84);
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ disk:    %@"), v24);
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ power:   %@"), v83);
  v35 = -[BRCAccountSession hasOptimizeStorageEnabled](self->_session, "hasOptimizeStorageEnabled");
  v36 = "disabled";
  if (v35)
    v36 = "enabled";
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ optimize storage: %s"), v36);
  objc_msgSend(v34, "fp_obfuscatedFilename");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ device name:   %@"), v37);

  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ cellular: %@"), v82);
  objc_msgSend(v7, "popIndentation");
  objc_msgSend(v7, "writeLineWithFormat:", &stru_1E8769030);
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("scheduler"));
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
  objc_msgSend(v7, "pushIndentation");
  +[BRCDumpContext stringFromCount:context:](BRCDumpContext, "stringFromCount:context:", objc_msgSend(v81, "unsignedLongLongValue"), v7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCDumpContext stringFromCount:context:](BRCDumpContext, "stringFromCount:context:", objc_msgSend(v86, "unsignedLongLongValue"), v7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ items:                 client:%@, server: %@"), v38, v39);

  if (v79)
  {
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", CFSTR("output may be truncated"), 3, v7);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("                         warning: %@"), v40);

  }
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ push environment:      %@"), v80);
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ push token:            %@"), v30);
  -[BRCSyncBudgetThrottle debugDescriptionWithDefaults:](v25->_syncUpBudget, "debugDescriptionWithDefaults:", v85);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ global sync up budget: %@"), v41);

  -[BRCOperationSubclass descriptionWithContext:](v25->_periodicSyncOperation, "descriptionWithContext:", v7);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v42;
  v44 = CFSTR("idle");
  if (v42)
    v44 = (const __CFString *)v42;
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ periodic sync:         %@"), v44);

  if (v32)
  {
    +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", objc_msgSend(v32, "longLongValue"), v7);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession fsUploader](self->_session, "fsUploader");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "isDefaultOwnerOutOfQuota");
    v48 = CFSTR(" [pending-quota]");
    if (!v47)
      v48 = &stru_1E8769030;
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ available quota:       %@%@"), v45, v48);

  }
  v49 = brc_current_date_nsec();
  if (v25->_containerMetadataSyncState)
  {
    BRCPrettyPrintBitmap();
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = CFSTR("idle");
  }
  -[BRCOperationSubclass descriptionWithContext:](v25->_containerMetadataSyncOperation, "descriptionWithContext:", v7);
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v51;
  if (v51)
    v53 = (const __CFString *)v51;
  else
    v53 = &stru_1E8769030;
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ container-metadata:    %@ %@"), v50, v53);

  -[BRCContainerScheduler _printSyncErrorIfNecessaryWithThrottle:context:error:now:](v25, "_printSyncErrorIfNecessaryWithThrottle:context:error:now:", v25->_containerMetadataSyncDownThrottle, v7, v25->_lastContainerMetadataSyncDownError, v49);
  -[BRCContainerScheduler _printSyncErrorIfNecessaryWithThrottle:context:error:now:](v25, "_printSyncErrorIfNecessaryWithThrottle:context:error:now:", v25->_containerMetadataSyncUpThrottle, v7, v25->_lastContainerMetadataSyncUpError, v49);
  if (v25->_sharedDBSyncState)
  {
    BRCPrettyPrintBitmap();
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = CFSTR("idle");
  }
  -[BRCOperationSubclass descriptionWithContext:](v25->_sharedDatabaseSyncOperation, "descriptionWithContext:", v7);
  v55 = objc_claimAutoreleasedReturnValue();
  v56 = (void *)v55;
  if (v55)
    v57 = (const __CFString *)v55;
  else
    v57 = &stru_1E8769030;
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ sharedb:               %@ %@"), v54, v57);

  -[BRCContainerScheduler _printSyncErrorIfNecessaryWithThrottle:context:error:now:](v25, "_printSyncErrorIfNecessaryWithThrottle:context:error:now:", v25->_sharedDatabaseSyncDownThrottle, v7, v25->_lastSharedDatabaseSyncDownError, v49);
  if (v25->_zoneHealthSyncState)
  {
    BRCPrettyPrintBitmap();
    v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v58 = CFSTR("idle");
  }
  -[BRCOperationSubclass descriptionWithContext:](v25->_zoneHealthSyncOperation, "descriptionWithContext:", v7);
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)v59;
  if (v59)
    v61 = (const __CFString *)v59;
  else
    v61 = &stru_1E8769030;
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ zone-health:           %@ %@"), v58, v61);

  -[BRCContainerScheduler _printSyncErrorIfNecessaryWithThrottle:context:error:now:](v25, "_printSyncErrorIfNecessaryWithThrottle:context:error:now:", v25->_zoneHealthSyncDownThrottle, v7, v25->_lastZoneHealthSyncDownError, v49);
  -[BRCContainerScheduler _printSyncErrorIfNecessaryWithThrottle:context:error:now:](v25, "_printSyncErrorIfNecessaryWithThrottle:context:error:now:", v25->_zoneHealthSyncUpThrottle, v7, v25->_lastZoneHealthSyncUpError, v49);
  if (v25->_sideCarSyncState)
  {
    BRCPrettyPrintBitmap();
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v62 = CFSTR("idle");
  }
  -[BRCOperationSubclass descriptionWithContext:](v25->_sideCarSyncOperation, "descriptionWithContext:", v7);
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)v63;
  if (v63)
    v65 = (const __CFString *)v63;
  else
    v65 = &stru_1E8769030;
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ side-car:              %@ %@"), v62, v65);

  -[BRCContainerScheduler _printSyncErrorIfNecessaryWithThrottle:context:error:now:](v25, "_printSyncErrorIfNecessaryWithThrottle:context:error:now:", v25->_sideCarSyncDownThrottle, v7, v25->_lastSideCarSyncDownError, v49);
  -[BRCContainerScheduler _printSyncErrorIfNecessaryWithThrottle:context:error:now:](v25, "_printSyncErrorIfNecessaryWithThrottle:context:error:now:", v25->_sideCarSyncUpThrottle, v7, v25->_lastSideCarSyncUpError, v49);
  migrateZonePCSOperation = v25->_migrateZonePCSOperation;
  if (migrateZonePCSOperation)
  {
    -[_BRCOperation descriptionWithContext:](migrateZonePCSOperation, "descriptionWithContext:", v7);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ pcs-migration:         %@"), v67);

  }
  else
  {
    v68 = -[BRCAccountSession PCSMigrationComplete](self->_session, "PCSMigrationComplete");
    v69 = CFSTR("unfinished");
    if (v68)
      v69 = CFSTR("complete");
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ pcs-migration:         %@"), v69);
  }
  v87 = 0;
  -[BRCAccountSession fetchAccountWaitOperationWithAccountReady:](self->_session, "fetchAccountWaitOperationWithAccountReady:", &v87);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v70;
  if (v70)
  {
    v72 = v77;
    if ((objc_msgSend(v70, "isFinished") & 1) == 0)
    {
      objc_msgSend(v71, "descriptionWithContext:", v7);
      v73 = objc_claimAutoreleasedReturnValue();
LABEL_69:
      v74 = (void *)v73;
      objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ account: %@"), v73);

    }
  }
  else
  {
    v72 = v77;
    if (!v87)
    {
      objc_msgSend(v7, "highlightedString:type:", CFSTR("not ready"), 3);
      v73 = objc_claimAutoreleasedReturnValue();
      goto LABEL_69;
    }
  }
  objc_msgSend(v7, "popIndentation");
  objc_msgSend(v7, "writeLineWithFormat:", &stru_1E8769030);

}

- (void)receivedUpdatedZoneHealthServerChangeToken:(id)a3 requestID:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "descriptionWithContext:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v9;
    v12 = 2048;
    v13 = a4;
    v14 = 2112;
    v15 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated zone health sync token:%@ requestID:%lld%@", (uint8_t *)&v10, 0x20u);

  }
  -[BRCZoneHealthSyncPersistedState updateWithServerChangeToken:requestID:](self->_zoneHealthPersistedState, "updateWithServerChangeToken:requestID:", v6, a4);

}

- (void)finishedZoneHealthSyncDownWithRequestID:(unint64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  BRCAccountSession *session;
  _QWORD v10[5];
  uint8_t buf[4];
  unint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v12 = a3;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Completed zone health sync requestID:%lld error:%@%@", buf, 0x20u);
  }

  if (!v6)
  {
    session = self->_session;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__BRCContainerScheduler_finishedZoneHealthSyncDownWithRequestID_error___block_invoke;
    v10[3] = &__block_descriptor_40_e30_B16__0__BRCPrivateClientZone_8l;
    v10[4] = a3;
    -[BRCAccountSession enumeratePrivateClientZones:](session, "enumeratePrivateClientZones:", v10);
    self->_zoneHealthSyncState &= ~2u;
  }

}

uint64_t __71__BRCContainerScheduler_finishedZoneHealthSyncDownWithRequestID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "syncedDownZoneHealthRequestID:", *(_QWORD *)(a1 + 32));
  return 1;
}

- (id)internalZoneSyncDownAnalyticsErrors
{
  id v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BRCErrorGrouping *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BRCErrorGrouping *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  BRCErrorGrouping *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  BRCErrorGrouping *v49;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[BRCSyncOperationThrottle delay](self->_sideCarSyncDownThrottle, "delay");
  v5 = v4;
  +[BRCUserDefaults defaultsForSideCar](BRCUserDefaults, "defaultsForSideCar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncDownDelayForFailure");
  v8 = v7;

  if (v5 <= v8)
  {
    v10 = 0;
  }
  else
  {
    -[NSError brc_telemetryReportableErrorWithRecordName:](self->_lastSideCarSyncDownError, "brc_telemetryReportableErrorWithRecordName:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D10E88], "sideCarMangledID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCContainerScheduler session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clientZoneByMangledID:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "enhancedDrivePrivacyEnabled");

    v14 = -[BRCErrorGrouping initWithError:pcsChained:enhancedDrivePrivacyEnabled:]([BRCErrorGrouping alloc], "initWithError:pcsChained:enhancedDrivePrivacyEnabled:", v9, 0, v13);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v10);

  }
  -[BRCSyncOperationThrottle delay](self->_zoneHealthSyncDownThrottle, "delay");
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0D10E88], "zoneHealthMangledID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "syncDownDelayForFailure");
  v20 = v19;

  if (v16 > v20)
  {
    -[NSError brc_telemetryReportableErrorWithRecordName:](self->_lastZoneHealthSyncDownError, "brc_telemetryReportableErrorWithRecordName:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D10E88], "zoneHealthMangledID");
    v22 = objc_claimAutoreleasedReturnValue();

    -[BRCContainerScheduler session](self, "session");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "clientZoneByMangledID:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "enhancedDrivePrivacyEnabled");

    v26 = -[BRCErrorGrouping initWithError:pcsChained:enhancedDrivePrivacyEnabled:]([BRCErrorGrouping alloc], "initWithError:pcsChained:enhancedDrivePrivacyEnabled:", v21, 0, v25);
    objc_msgSend(MEMORY[0x1E0D10E88], "zoneHealthMangledID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, v27);

    v10 = (void *)v22;
  }
  -[BRCSyncOperationThrottle delay](self->_containerMetadataSyncDownThrottle, "delay");
  v29 = v28;
  +[BRCUserDefaults defaultsForMetadataContainer](BRCUserDefaults, "defaultsForMetadataContainer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "syncDownDelayForFailure");
  v32 = v31;

  if (v29 > v32)
  {
    -[NSError brc_telemetryReportableErrorWithRecordName:](self->_lastContainerMetadataSyncDownError, "brc_telemetryReportableErrorWithRecordName:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D10E88], "containerMetadataMangledID");
    v34 = objc_claimAutoreleasedReturnValue();

    -[BRCContainerScheduler session](self, "session");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "clientZoneByMangledID:", v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "enhancedDrivePrivacyEnabled");

    v38 = -[BRCErrorGrouping initWithError:pcsChained:enhancedDrivePrivacyEnabled:]([BRCErrorGrouping alloc], "initWithError:pcsChained:enhancedDrivePrivacyEnabled:", v33, 0, v37);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, v34);

    v10 = (void *)v34;
  }
  -[BRCSyncOperationThrottle delay](self->_sharedDatabaseSyncDownThrottle, "delay");
  v40 = v39;
  +[BRCUserDefaults defaultsForSharedZone](BRCUserDefaults, "defaultsForSharedZone");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "syncDownDelayForFailure");
  v43 = v42;

  if (v40 > v43)
  {
    -[NSError brc_telemetryReportableErrorWithRecordName:](self->_lastSharedDatabaseSyncDownError, "brc_telemetryReportableErrorWithRecordName:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D10E88], "sharedDatabaseMangledID");
    v45 = objc_claimAutoreleasedReturnValue();

    -[BRCContainerScheduler session](self, "session");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "clientZoneByMangledID:", v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "enhancedDrivePrivacyEnabled");

    v49 = -[BRCErrorGrouping initWithError:pcsChained:enhancedDrivePrivacyEnabled:]([BRCErrorGrouping alloc], "initWithError:pcsChained:enhancedDrivePrivacyEnabled:", v44, 0, v48);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, v45);

    v10 = (void *)v45;
  }

  return v3;
}

- (id)internalZoneSyncUpAnalyticsErrors
{
  id v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BRCErrorGrouping *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BRCErrorGrouping *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  BRCErrorGrouping *v37;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[BRCSyncOperationThrottle delay](self->_sideCarSyncUpThrottle, "delay");
  v5 = v4;
  +[BRCUserDefaults defaultsForSideCar](BRCUserDefaults, "defaultsForSideCar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncUpDelayForFailure");
  v8 = v7;

  if (v5 <= v8)
  {
    v10 = 0;
  }
  else
  {
    -[NSError brc_telemetryReportableErrorWithRecordName:](self->_lastSideCarSyncUpError, "brc_telemetryReportableErrorWithRecordName:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D10E88], "sideCarMangledID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCContainerScheduler session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clientZoneByMangledID:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "enhancedDrivePrivacyEnabled");

    v14 = -[BRCErrorGrouping initWithError:pcsChained:enhancedDrivePrivacyEnabled:]([BRCErrorGrouping alloc], "initWithError:pcsChained:enhancedDrivePrivacyEnabled:", v9, 0, v13);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v10);

  }
  -[BRCSyncOperationThrottle delay](self->_zoneHealthSyncUpThrottle, "delay");
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0D10E88], "zoneHealthMangledID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "syncUpDelayForFailure");
  v20 = v19;

  if (v16 > v20)
  {
    -[NSError brc_telemetryReportableErrorWithRecordName:](self->_lastZoneHealthSyncUpError, "brc_telemetryReportableErrorWithRecordName:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D10E88], "zoneHealthMangledID");
    v22 = objc_claimAutoreleasedReturnValue();

    -[BRCContainerScheduler session](self, "session");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "clientZoneByMangledID:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "enhancedDrivePrivacyEnabled");

    v26 = -[BRCErrorGrouping initWithError:pcsChained:enhancedDrivePrivacyEnabled:]([BRCErrorGrouping alloc], "initWithError:pcsChained:enhancedDrivePrivacyEnabled:", v21, 0, v25);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, v22);

    v10 = (void *)v22;
  }
  -[BRCSyncOperationThrottle delay](self->_containerMetadataSyncUpThrottle, "delay");
  v28 = v27;
  +[BRCUserDefaults defaultsForMetadataContainer](BRCUserDefaults, "defaultsForMetadataContainer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "syncUpDelayForFailure");
  v31 = v30;

  if (v28 > v31)
  {
    -[NSError brc_telemetryReportableErrorWithRecordName:](self->_lastContainerMetadataSyncUpError, "brc_telemetryReportableErrorWithRecordName:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D10E88], "containerMetadataMangledID");
    v33 = objc_claimAutoreleasedReturnValue();

    -[BRCContainerScheduler session](self, "session");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "clientZoneByMangledID:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "enhancedDrivePrivacyEnabled");

    v37 = -[BRCErrorGrouping initWithError:pcsChained:enhancedDrivePrivacyEnabled:]([BRCErrorGrouping alloc], "initWithError:pcsChained:enhancedDrivePrivacyEnabled:", v32, 0, v36);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, v33);

    v10 = (void *)v33;
  }

  return v3;
}

- (void)receivedUpdatedSideCarServerChangeToken:(id)a3 requestID:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "descriptionWithContext:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v9;
    v12 = 2048;
    v13 = a4;
    v14 = 2112;
    v15 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated side car sync token:%@ requestID:%lld%@", (uint8_t *)&v10, 0x20u);

  }
  -[BRCSideCarSyncPersistedState updateWithServerChangeToken:requestID:](self->_sideCarSyncPersistedState, "updateWithServerChangeToken:requestID:", v6, a4);

}

- (void)_scheduleCrossZoneMovePCSPrep
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx starting cross zone move migration PCS prep%@");
  OUTLINED_FUNCTION_2();
}

void __54__BRCContainerScheduler__scheduleCrossZoneMovePCSPrep__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "workloop");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__BRCContainerScheduler__scheduleCrossZoneMovePCSPrep__block_invoke_2;
  block[3] = &unk_1E875D500;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async_and_wait(v2, block);

}

void __54__BRCContainerScheduler__scheduleCrossZoneMovePCSPrep__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "resume");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 304);
  *(_QWORD *)(v2 + 304) = 0;

}

- (void)syncContextDidBecomeForeground:(id)a3
{
  void *v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  -[BRCAccountSession personaIdentifier](self->_session, "personaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("__defaultPersonaID__")))
  {

  }
  else
  {
    -[BRCAccountSession personaIdentifier](self->_session, "personaIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = 0;
      goto LABEL_8;
    }
  }
  if (syncContextDidBecomeForeground____personaOnceToken != -1)
    dispatch_once(&syncContextDidBecomeForeground____personaOnceToken, &__block_literal_global_185);
  v5 = (id)syncContextDidBecomeForeground____personalPersona;
  v6 = 1;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  objc_msgSend(v8, "userPersonaUniqueString");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 == v5 || (objc_msgSend(v9, "isEqualToString:", v5) & 1) != 0)
  {
    v11 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v31 = 0;
    v20 = (void *)objc_msgSend(v8, "copyCurrentPersonaContextWithError:", &v31);
    v21 = v31;
    v22 = v32;
    v32 = v20;

    if (v21)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
        -[BRCContainerScheduler syncContextDidBecomeForeground:].cold.1((uint64_t)v21);

    }
    objc_msgSend(v8, "generateAndRestorePersonaContextWithPersonaUniqueString:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      {
        -[BRCAccountSession personaIdentifier](self->_session, "personaIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v27;
        v35 = 2112;
        v36 = v11;
        v37 = 2112;
        v38 = v25;
        _os_log_error_impl(&dword_1CBD43000, v26, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);

      }
LABEL_34:

    }
  }
  else
  {
    if (v6 && (objc_msgSend(v8, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation completedWithResult:error:].cold.3();
      v11 = 0;
      goto LABEL_34;
    }
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[_BRCOperation completedWithResult:error:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:
  objc_msgSend(v30, "object");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isShared") & 1) == 0)
  {
    objc_msgSend(v12, "contextIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession appLibraryByID:](self->_session, "appLibraryByID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "defaultClientZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isSyncBlockedBecauseAppNotInstalled");

    if (v16)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v17;
        _os_log_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Container became foreground that we didn't think was installed, forcing an apps list refresh%@", buf, 0xCu);
      }

      +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor](BRCCloudDocsAppsMonitor, "cloudDocsAppsMonitor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "forceRefetchAppList");

    }
  }
  -[BRCContainerScheduler _scheduleUpdatePushTopicsRegistration](self, "_scheduleUpdatePushTopicsRegistration");

  _BRRestorePersona();
}

void __56__BRCContainerScheduler_syncContextDidBecomeForeground___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)syncContextDidBecomeForeground____personalPersona;
  syncContextDidBecomeForeground____personalPersona = v0;

}

- (void)syncContextDidBecomeBackground:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCAccountSession personaIdentifier](self->_session, "personaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("__defaultPersonaID__")))
  {

  }
  else
  {
    -[BRCAccountSession personaIdentifier](self->_session, "personaIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = 0;
      goto LABEL_8;
    }
  }
  if (syncContextDidBecomeBackground____personaOnceToken != -1)
    dispatch_once(&syncContextDidBecomeBackground____personaOnceToken, &__block_literal_global_189);
  v6 = (id)syncContextDidBecomeBackground____personalPersona;
  v7 = 1;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPersona");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  objc_msgSend(v9, "userPersonaUniqueString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 == v6 || (objc_msgSend(v10, "isEqualToString:", v6) & 1) != 0)
  {
    v12 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v23 = 0;
    v13 = (void *)objc_msgSend(v9, "copyCurrentPersonaContextWithError:", &v23);
    v14 = v23;
    v15 = v24;
    v24 = v13;

    if (v14)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
        -[BRCContainerScheduler syncContextDidBecomeForeground:].cold.1((uint64_t)v14);

    }
    objc_msgSend(v9, "generateAndRestorePersonaContextWithPersonaUniqueString:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        -[BRCAccountSession personaIdentifier](self->_session, "personaIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v26 = v20;
        v27 = 2112;
        v28 = v12;
        v29 = 2112;
        v30 = v18;
        _os_log_error_impl(&dword_1CBD43000, v19, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);

      }
LABEL_28:

    }
  }
  else
  {
    if (v7 && (objc_msgSend(v9, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation completedWithResult:error:].cold.3();
      v12 = 0;
      goto LABEL_28;
    }
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[_BRCOperation completedWithResult:error:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:
  -[BRCContainerScheduler _scheduleUpdatePushTopicsRegistration](self, "_scheduleUpdatePushTopicsRegistration");

  _BRRestorePersona();
}

void __56__BRCContainerScheduler_syncContextDidBecomeBackground___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)syncContextDidBecomeBackground____personalPersona;
  syncContextDidBecomeBackground____personalPersona = v0;

}

- (void)_scheduleUpdatePushTopicsRegistration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] scheduling push topics registration%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updatePushTopicsRegistration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_isInSyncBubble%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __54__BRCContainerScheduler__updatePushTopicsRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(v3, "defaultClientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isSyncBlockedBecauseAppNotInstalled") & 1) == 0)
  {
    v5 = *MEMORY[0x1E0D10D30];
    objc_msgSend(v3, "appLibraryID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingFormat:", CFSTR("%@%@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "zoneName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingFormat:", CFSTR("%@%@"), v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "isForeground"))
      v10 = 32;
    else
      v10 = 40;
    objc_msgSend(*(id *)(a1 + v10), "addObject:", v7);
    if (objc_msgSend(v4, "isForeground"))
      v11 = 32;
    else
      v11 = 40;
    objc_msgSend(*(id *)(a1 + v11), "addObject:", v9);

  }
  return 1;
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSString *environmentName;
  int v15;
  NSString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    environmentName = self->_environmentName;
    v15 = 138413314;
    v16 = environmentName;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] received %@ push token %@ for %@:%@%@", (uint8_t *)&v15, 0x34u);
  }

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  NSData *v5;
  void *v6;
  NSObject *v7;
  BRCContainerScheduler *v8;
  NSData *pushToken;

  v5 = (NSData *)a4;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCContainerScheduler connection:didReceivePublicToken:].cold.1((uint64_t)v5);

  v8 = self;
  objc_sync_enter(v8);
  pushToken = v8->_pushToken;
  v8->_pushToken = v5;

  objc_sync_exit(v8);
}

- (void)_connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  BRCAccountSession *session;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  __CFString *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  __CFString *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  int v41;
  void *v42;
  NSObject *v43;
  void *v44;
  int v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  BRCAccountSession *v65;
  id v66;
  void *v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  const __CFString *v74;
  id v75;
  void *v76;
  BRCAccountSession *v77;
  BRCContainerScheduler *v78;
  id v79;
  _QWORD block[4];
  id v81;
  id v82;
  BRCContainerScheduler *v83;
  id v84;
  _BYTE *v85;
  uint64_t v86[3];
  uint8_t v87[4];
  id v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  _BYTE buf[24];
  uint64_t (*v94)(uint64_t, uint64_t);
  _BYTE v95[20];
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v75 = a3;
  v6 = a4;
  v78 = self;
  if (self->_isInSyncBubble)
  {
    brc_bread_crumbs();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
      -[BRCContainerScheduler _updatePushTopicsRegistration].cold.5();

  }
  v76 = (void *)os_transaction_create();
  session = v78->_session;
  v79 = v6;
  v77 = session;
  objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", *MEMORY[0x1E0D10D30]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "topic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(session) = objc_msgSend(v9, "hasPrefix:", v8);

  if ((session & 1) != 0)
  {
    objc_msgSend(v79, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ck"));
    v11 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      brc_bread_crumbs();
      v12 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        -[BRCContainerScheduler _connection:didReceiveIncomingMessage:].cold.5();
      v16 = 0;
      v17 = 0;
      v18 = 0;
      goto LABEL_34;
    }
    v12 = v11;
    -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("met"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("fet"));
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v11 = v15;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      brc_bread_crumbs();
      v28 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("met"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = CFSTR("fet");
        *(_DWORD *)buf = 138412802;
        if (v73)
          v74 = CFSTR("met");
        *(_QWORD *)&buf[4] = v74;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        v94 = (uint64_t (*)(uint64_t, uint64_t))v28;
        _os_log_fault_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid push payload[%@] %@%@", buf, 0x20u);

      }
      v16 = 0;
      v17 = 0;
      v18 = 0;
      goto LABEL_33;
    }
    -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("zid"));
    v19 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      brc_bread_crumbs();
      v23 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[BRCContainerScheduler _connection:didReceiveIncomingMessage:].cold.4();
      v16 = 0;
      v17 = 0;
      v18 = 0;
      goto LABEL_32;
    }
    -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("dbs"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = objc_msgSend(v20, "intValue");
      switch(v21)
      {
        case 1:
          v22 = 0;
          v17 = CFSTR("private");
          break;
        case 3:
          -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("zoid"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            brc_bread_crumbs();
            v22 = objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
              -[BRCContainerScheduler _connection:didReceiveIncomingMessage:].cold.2();

            v16 = 0;
            v18 = 0;
            v23 = v19;
            v19 = (uint64_t)v25;
            v17 = CFSTR("shared");
            goto LABEL_32;
          }
          v22 = v25;
          v17 = CFSTR("shared");
          v20 = v22;
          break;
        case 2:
          v22 = 0;
          v17 = CFSTR("public");
          break;
        default:
          objc_msgSend(v20, "description");
          v17 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          v22 = 0;
          break;
      }
      -[BRCAccountSession cachedCurrentUserRecordName](v77, "cachedCurrentUserRecordName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 && -[NSObject isEqualToString:](v22, "isEqualToString:", v26))
      {
        v27 = (id)*MEMORY[0x1E0C94730];

        v22 = v27;
      }
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithZoneName:ownerName:", v19, v22);
      v18 = v11;

    }
    else
    {
      brc_bread_crumbs();
      v22 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[BRCContainerScheduler _connection:didReceiveIncomingMessage:].cold.3();

      v16 = 0;
      v17 = 0;
      v18 = 0;
    }
    v23 = v19;
    v19 = (uint64_t)v20;
LABEL_32:

    v28 = v11;
    v11 = v19;
LABEL_33:

LABEL_34:
    goto LABEL_35;
  }
  brc_bread_crumbs();
  v11 = objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v79, "topic");
    v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = objc_msgSend(v56, "UTF8String");
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    *(_WORD *)&buf[22] = 2112;
    v94 = (uint64_t (*)(uint64_t, uint64_t))v11;
    _os_log_fault_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid push topic '%s' (expected prefix '%s')%@", buf, 0x20u);

  }
  v16 = 0;
  v17 = 0;
  v18 = 0;
LABEL_35:

  v29 = v16;
  v30 = v17;
  if (v18)
  {
    memset(v86, 0, sizeof(v86));
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler _connection:didReceiveIncomingMessage:]", 1737, v86);
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v52 = v86[0];
      objc_msgSend(v79, "topic");
      v53 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "publicToken");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v79, "priority");
      *(_DWORD *)buf = 134219522;
      *(_QWORD *)&buf[4] = v52;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2112;
      v94 = v53;
      *(_WORD *)v95 = 2112;
      *(_QWORD *)&v95[2] = v18;
      *(_WORD *)&v95[10] = 2112;
      *(_QWORD *)&v95[12] = v54;
      v96 = 2048;
      v97 = v55;
      v98 = 2112;
      v99 = v31;
      _os_log_debug_impl(&dword_1CBD43000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx received a push in the %@ database for topic:'%@' payload:%@ token:%@ priority:%ld%@", buf, 0x48u);

    }
    kdebug_trace();
    objc_msgSend(MEMORY[0x1E0C94F88], "br_syncDownPushTriggered");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "appLibraryOrZoneName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isEqualToString:", *MEMORY[0x1E0D10DA0]);

    if (v35)
    {
      brc_bread_crumbs();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v36;
        _os_log_impl(&dword_1CBD43000, v37, OS_LOG_TYPE_DEFAULT, "[NOTICE] received a push for the container-metadata zone%@", buf, 0xCu);
      }

      -[BRCContainerScheduler scheduleSyncDownForContainerMetadataWithGroup:](v78, "scheduleSyncDownForContainerMetadataWithGroup:", v33);
      goto LABEL_72;
    }
    objc_msgSend(v29, "appLibraryOrZoneName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isEqualToString:", *MEMORY[0x1E0D10E20]);

    if (v41)
    {
      brc_bread_crumbs();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v42;
        _os_log_impl(&dword_1CBD43000, v43, OS_LOG_TYPE_DEFAULT, "[NOTICE] received a push for the zone-health zone%@", buf, 0xCu);
      }

      -[BRCContainerScheduler scheduleSyncDownForZoneHealthWithGroup:](v78, "scheduleSyncDownForZoneHealthWithGroup:", v33);
      goto LABEL_72;
    }
    objc_msgSend(v29, "appLibraryOrZoneName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isEqualToString:", *MEMORY[0x1E0D11150]);

    if (v45)
    {
      brc_bread_crumbs();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v46;
        _os_log_impl(&dword_1CBD43000, v47, OS_LOG_TYPE_DEFAULT, "[NOTICE] received a push for the side-car zone%@", buf, 0xCu);
      }

      -[BRCContainerScheduler scheduleSyncDownForSideCarWithGroup:](v78, "scheduleSyncDownForSideCarWithGroup:", v33);
      goto LABEL_72;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v94 = __Block_byref_object_copy__17;
    *(_QWORD *)v95 = __Block_byref_object_dispose__17;
    -[BRCAccountSession clientZoneByMangledID:](v78->_session, "clientZoneByMangledID:", v29);
    *(_QWORD *)&v95[8] = objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession appLibraryByMangledID:](v78->_session, "appLibraryByMangledID:", v29);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      brc_bread_crumbs();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v87 = 138412546;
        v88 = v29;
        v89 = 2112;
        v90 = v50;
        _os_log_impl(&dword_1CBD43000, v51, OS_LOG_TYPE_DEFAULT, "[NOTICE] received a push for client zone %@%@", v87, 0x16u);
      }
    }
    else if (v48)
    {
      objc_msgSend(v48, "defaultClientZone");
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v57;

      brc_bread_crumbs();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v49, "defaultClientZone");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "mangledID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v87 = 138412802;
        v88 = v29;
        v89 = 2112;
        v90 = v60;
        v91 = 2112;
        v92 = v50;
        _os_log_impl(&dword_1CBD43000, v51, OS_LOG_TYPE_DEFAULT, "[NOTICE] received a push for app library %@ -> zone %@%@", v87, 0x20u);

      }
    }
    else
    {
      if ((objc_msgSend(v29, "isShared") & 1) != 0)
      {
        brc_bread_crumbs();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v87 = 138412546;
          v88 = v29;
          v89 = 2112;
          v90 = v62;
          _os_log_impl(&dword_1CBD43000, v63, OS_LOG_TYPE_DEFAULT, "[NOTICE] receiving a push for an unknown ID shared zone %@, creating the zone%@", v87, 0x16u);
        }

        -[BRCAccountSession getOrCreateSharedZones:](v78->_session, "getOrCreateSharedZones:", v29);
        v64 = objc_claimAutoreleasedReturnValue();
        v50 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v64;
        goto LABEL_71;
      }
      v65 = v78->_session;
      v66 = objc_alloc(MEMORY[0x1E0D10E88]);
      v67 = (void *)objc_msgSend(v66, "initWithZoneName:ownerName:", *MEMORY[0x1E0D10DB0], 0);
      -[BRCAccountSession clientZoneByMangledID:](v65, "clientZoneByMangledID:", v67);
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v68;

      brc_bread_crumbs();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v87 = 138412546;
        v88 = v29;
        v89 = 2112;
        v90 = v50;
        _os_log_impl(&dword_1CBD43000, v51, OS_LOG_TYPE_DEFAULT, "[NOTICE] receiving a push for an unknown ID %@ -> com.apple.CloudDocs%@", v87, 0x16u);
      }
    }

LABEL_71:
    -[BRCDeadlineScheduler workloop](v78->_syncScheduler, "workloop");
    v70 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__BRCContainerScheduler__connection_didReceiveIncomingMessage___block_invoke;
    block[3] = &unk_1E87610A8;
    v85 = buf;
    v81 = v33;
    v82 = v29;
    v83 = v78;
    v84 = v76;
    dispatch_async(v70, block);

    _Block_object_dispose(buf, 8);
LABEL_72:

    __brc_leave_section(v86);
    goto LABEL_73;
  }
  brc_bread_crumbs();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
    -[BRCContainerScheduler _connection:didReceiveIncomingMessage:].cold.1(v79, (uint64_t)v38, v39);

LABEL_73:
}

void __63__BRCContainerScheduler__connection_didReceiveIncomingMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15[3];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 64;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    memset(v15, 0, sizeof(v15));
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler _connection:didReceiveIncomingMessage:]_block_invoke", 1777, v15);
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40);
      *(_DWORD *)buf = 134218498;
      v17 = v15[0];
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v3;
      _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scheduling sync down for client zone %@ because of a push%@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "clearStateBits:", 0x200000);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "scheduleSyncDownWithGroup:", *(_QWORD *)(a1 + 32));
    __brc_leave_section(v15);
  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = (uint64_t)v5;
      _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] no zone found, dropping the push%@", buf, 0xCu);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 40), "isShared"))
    objc_msgSend(*(id *)(a1 + 48), "scheduleSyncDownForSharedDatabaseImmediately:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) == 0);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "isSharedZone"))
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 48) + 8);
    objc_msgSend(*(id *)(a1 + 40), "appLibraryOrZoneName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "privateClientZoneByID:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __63__BRCContainerScheduler__connection_didReceiveIncomingMessage___block_invoke_cold_1();

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "scheduleSyncDownWithGroup:", *(_QWORD *)(a1 + 32));
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[BRCAccountSession personaIdentifier](self->_session, "personaIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v9 = v7;
  v10 = v6;
  BRPerformWithPersonaAndError();

}

void __62__BRCContainerScheduler_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;

  if (a2)
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __62__BRCContainerScheduler_connection_didReceiveIncomingMessage___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_connection:didReceiveIncomingMessage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

- (void)notifyAfterNextZoneHealthSyncDown:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[BRCDeadlineScheduler workloop](self->_syncScheduler, "workloop");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__BRCContainerScheduler_notifyAfterNextZoneHealthSyncDown___block_invoke;
  block[3] = &unk_1E875EAA8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_and_wait(v5, block);

}

void __59__BRCContainerScheduler_notifyAfterNextZoneHealthSyncDown___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 328);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 328);
    *(_QWORD *)(v4 + 328) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 328);
  }
  v6 = (id)MEMORY[0x1D17A6DB0](*(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "addObject:", v6);

}

- (BRCSyncBudgetThrottle)syncUpBudget
{
  return self->_syncUpBudget;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (BRCDeadlineScheduler)syncScheduler
{
  return self->_syncScheduler;
}

- (BRCContainerMetadataSyncPersistedState)containerMetadataPersistedState
{
  return self->_containerMetadataPersistedState;
}

- (BRCZoneHealthSyncPersistedState)zoneHealthSyncPersistedState
{
  return self->_zoneHealthPersistedState;
}

- (BRCSideCarSyncPersistedState)sideCarSyncPersistedState
{
  return self->_sideCarSyncPersistedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncScheduler, 0);
  objc_storeStrong((id *)&self->_syncUpBudget, 0);
  objc_storeStrong((id *)&self->_nextZoneHealthSyncDownBarriers, 0);
  objc_storeStrong((id *)&self->_migrateZonePCSSource, 0);
  objc_storeStrong((id *)&self->_migrateZonePCSOperation, 0);
  objc_storeStrong((id *)&self->_periodicSyncOperation, 0);
  objc_storeStrong((id *)&self->_periodicSyncScheduler, 0);
  objc_storeStrong((id *)&self->_lastSideCarSyncUpError, 0);
  objc_storeStrong((id *)&self->_lastSideCarSyncDownError, 0);
  objc_storeStrong((id *)&self->_sideCarSyncUpThrottle, 0);
  objc_storeStrong((id *)&self->_sideCarSyncDownThrottle, 0);
  objc_storeStrong((id *)&self->_sideCarSyncOperation, 0);
  objc_storeStrong((id *)&self->_sideCarSyncPersistedState, 0);
  objc_storeStrong((id *)&self->_lastZoneHealthSyncUpError, 0);
  objc_storeStrong((id *)&self->_lastZoneHealthSyncDownError, 0);
  objc_storeStrong((id *)&self->_zoneHealthSyncUpThrottle, 0);
  objc_storeStrong((id *)&self->_zoneHealthSyncDownThrottle, 0);
  objc_storeStrong((id *)&self->_zoneHealthSyncOperation, 0);
  objc_storeStrong((id *)&self->_zoneHealthPersistedState, 0);
  objc_storeStrong((id *)&self->_lastSharedDatabaseSyncDownError, 0);
  objc_storeStrong((id *)&self->_sharedDatabaseSyncDownThrottle, 0);
  objc_storeStrong((id *)&self->_sharedDatabaseSyncOperation, 0);
  objc_storeStrong((id *)&self->_lastContainerMetadataSyncUpError, 0);
  objc_storeStrong((id *)&self->_lastContainerMetadataSyncDownError, 0);
  objc_storeStrong((id *)&self->_containerMetadataSyncUpThrottle, 0);
  objc_storeStrong((id *)&self->_containerMetadataSyncDownThrottle, 0);
  objc_storeStrong((id *)&self->_containerMetadataSyncOperation, 0);
  objc_storeStrong((id *)&self->_containerMetadataPersistedState, 0);
  objc_storeStrong((id *)&self->_pushWorkloop, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_pushSource, 0);
  objc_storeStrong((id *)&self->_sideCarSyncSource, 0);
  objc_storeStrong((id *)&self->_zoneHealthSyncSource, 0);
  objc_storeStrong((id *)&self->_sharedDatabaseSyncSource, 0);
  objc_storeStrong((id *)&self->_containerMetadataSyncSource, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)initWithAccountSession:pushWorkloop:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Push notification source created in a disabled state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Sync: no global budget anymore: %@%@");
  OUTLINED_FUNCTION_2();
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx cancelling sideCarSyncSource%@");
  OUTLINED_FUNCTION_2();
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx cancelling migrateZonePCSSource%@");
  OUTLINED_FUNCTION_2();
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx cancelling zoneHealthSyncSource%@");
  OUTLINED_FUNCTION_2();
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx cancelling sharedDatabaseSyncSource%@");
  OUTLINED_FUNCTION_2();
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx cancelling containerMetadataSyncSource...%@");
  OUTLINED_FUNCTION_2();
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_30_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx cancelling periodicSyncOperation%@");
  OUTLINED_FUNCTION_2();
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_31_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] unscheduling client zone %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)schedulePeriodicSyncInGroup:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx Considering containers needing forced sync down%@");
  OUTLINED_FUNCTION_2();
}

void __64__BRCContainerScheduler_schedulePeriodicSyncInGroup_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] periodic sync failed %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)didInitialSyncDownForClientZone:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx just synced down the default container%@");
  OUTLINED_FUNCTION_2();
}

void __71__BRCContainerScheduler_scheduleSyncDownForContainerMetadataWithGroup___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] marking container-metadata needs-sync-down%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __70__BRCContainerScheduler_scheduleSyncDownForSharedDatabaseImmediately___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] scheduling sync for sharedb in %llus%@");
  OUTLINED_FUNCTION_2();
}

void __64__BRCContainerScheduler_scheduleSyncDownForZoneHealthWithGroup___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] scheduling sync for zone-health%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__BRCContainerScheduler_scheduleSyncDownForSideCarWithGroup___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] scheduling sync for side-car%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__BRCContainerScheduler_redoZonePCSPreperation__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] scheduling sync for zone-pcs%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __70__BRCContainerScheduler_didChangeSyncStatusForZoneHealthForContainer___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] marking zone-health needs-sync-up%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __77__BRCContainerScheduler_didChangeSyncStatusForContainerMetadataForContainer___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] marking container-metadata needs-sync-up%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncContextDidBecomeForeground:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] won't restore persona: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)connection:(uint64_t)a1 didReceivePublicToken:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] received public push token %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_connection:(NSObject *)a3 didReceiveIncomingMessage:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "topic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_error_impl(&dword_1CBD43000, a3, (os_log_type_t)0x90u, "[ERROR] unable to parse push for topic:'%@' payload:%@%@", (uint8_t *)&v8, 0x20u);

}

- (void)_connection:didReceiveIncomingMessage:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 138412802;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_9_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: invalid push ZoneOwnerID at payload[%@] %@%@", v2);
  OUTLINED_FUNCTION_20();
}

- (void)_connection:didReceiveIncomingMessage:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 138412802;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_9_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: invalid push DatabaseScope at payload[%@] %@%@", v2);
  OUTLINED_FUNCTION_20();
}

- (void)_connection:didReceiveIncomingMessage:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 138412802;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_9_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: invalid push ZoneIdentifier at payload[%@] %@%@", v2);
  OUTLINED_FUNCTION_20();
}

- (void)_connection:didReceiveIncomingMessage:.cold.5()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 138412802;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_9_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: invalid push payload[%@] %@%@", v2);
  OUTLINED_FUNCTION_20();
}

void __63__BRCContainerScheduler__connection_didReceiveIncomingMessage___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Also scheduling a sync down on the private zone %@%@");
  OUTLINED_FUNCTION_2();
}

void __62__BRCContainerScheduler_connection_didReceiveIncomingMessage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: dropping push notification because we can't adopt persona%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
