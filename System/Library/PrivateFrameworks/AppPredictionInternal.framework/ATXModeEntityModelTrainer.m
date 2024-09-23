@implementation ATXModeEntityModelTrainer

- (ATXModeEntityModelTrainer)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXModeEntityModelTrainer *v8;

  objc_msgSend(MEMORY[0x1E0CF94D8], "modeCachesRootDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  +[ATXGlobalAppModeAffinityModel modelWithAllInstalledAppsKnownToSpringBoard](ATXGlobalAppModeAffinityModel, "modelWithAllInstalledAppsKnownToSpringBoard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXGlobalInterruptingAppModel modelWithAllInstalledAppsKnownToSpringBoard](ATXGlobalInterruptingAppModel, "modelWithAllInstalledAppsKnownToSpringBoard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXGlobalWidgetPopularityModel modelWithAllAvailableWidgets](ATXGlobalWidgetPopularityModel, "modelWithAllAvailableWidgets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXModeEntityModelTrainer initWithCacheBasePath:modeEntityStore:globalAppModeAffinityModel:globalInterruptingAppModel:globalWidgetPopularityModel:](self, "initWithCacheBasePath:modeEntityStore:globalAppModeAffinityModel:globalInterruptingAppModel:globalWidgetPopularityModel:", v3, v4, v5, v6, v7);

  return v8;
}

- (ATXModeEntityModelTrainer)initWithCacheBasePath:(id)a3 modeEntityStore:(id)a4 globalAppModeAffinityModel:(id)a5 globalInterruptingAppModel:(id)a6 globalWidgetPopularityModel:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ATXModeEntityModelTrainer *v17;
  uint64_t v18;
  NSString *cacheBasePath;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXModeEntityModelTrainer;
  v17 = -[ATXModeEntityModelTrainer init](&v21, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    cacheBasePath = v17->_cacheBasePath;
    v17->_cacheBasePath = (NSString *)v18;

    objc_storeStrong((id *)&v17->_modeEntityStore, a4);
    objc_storeStrong((id *)&v17->_globalAppModeAffinityModel, a5);
    objc_storeStrong((id *)&v17->_globalInterruptingAppModel, a6);
    objc_storeStrong((id *)&v17->_globalWidgetPopularityModel, a7);
  }

  return v17;
}

- (void)trainWithShouldDeferTrainingOnBackupRestoreOrUpgrade:(BOOL)a3
{
  -[ATXModeEntityModelTrainer trainWithXPCActivity:shouldSkipRetrainingIfTrainedRecently:shouldDeferTrainingOnRestoreOrUpgrade:](self, "trainWithXPCActivity:shouldSkipRetrainingIfTrainedRecently:shouldDeferTrainingOnRestoreOrUpgrade:", 0, 0, a3);
}

- (void)train
{
  -[ATXModeEntityModelTrainer trainWithXPCActivity:shouldSkipRetrainingIfTrainedRecently:shouldDeferTrainingOnRestoreOrUpgrade:](self, "trainWithXPCActivity:shouldSkipRetrainingIfTrainedRecently:shouldDeferTrainingOnRestoreOrUpgrade:", 0, 0, 1);
}

- (void)trainWithXPCActivity:(id)a3
{
  -[ATXModeEntityModelTrainer trainWithXPCActivity:shouldSkipRetrainingIfTrainedRecently:shouldDeferTrainingOnRestoreOrUpgrade:](self, "trainWithXPCActivity:shouldSkipRetrainingIfTrainedRecently:shouldDeferTrainingOnRestoreOrUpgrade:", a3, 1, 1);
}

- (void)trainWithXPCActivity:(id)a3 shouldSkipRetrainingIfTrainedRecently:(BOOL)a4 shouldDeferTrainingOnRestoreOrUpgrade:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  ATXAppModeModel *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  ATXAppModeDenyListModel *v28;
  void *v29;
  void *v30;
  ATXAppModeModel *v31;
  ATXContactModeModel *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *p_super;
  ATXAppModeModel *v38;
  void *v39;
  int v40;
  ATXContactModeModel *v41;
  void *v42;
  ATXAppModeDenyListModel *v43;
  void *v44;
  ATXModeEntityModelTrainer *v45;
  ATXContactModeDenyListModel *v46;
  void *v47;
  ATXContactModeDenyListModel *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  void *v57;
  ATXWidgetModeModel *v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  ATXWidgetModeModel *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  ATXAppModeModel *v71;
  void *v72;
  ATXWidgetModeModel *v73;
  void *v74;
  NSObject *obj;
  void *v76;
  ATXContactModeDenyListModel *v77;
  ATXNotificationModeModel *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  _BOOL4 v83;
  ATXContactModeModel *v84;
  void *v85;
  ATXAppModeDenyListModel *v86;
  void *context;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t buf[4];
  uint64_t v94;
  __int16 v95;
  double v96;
  _BYTE v97[128];
  uint64_t v98;

  v5 = a5;
  v83 = a4;
  v98 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v5
    || !-[ATXModeEntityModelTrainer shouldDeferTrainingDueToRestoredBackup](self, "shouldDeferTrainingDueToRestoredBackup")&& !-[ATXModeEntityModelTrainer shouldDeferTrainingDueToUpgrade](self, "shouldDeferTrainingDueToUpgrade"))
  {
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Started training Mode Entity Models...", buf, 2u);
    }

    v9 = (void *)objc_opt_new();
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    allModesForTraining();
    v10 = objc_claimAutoreleasedReturnValue();
    v82 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
    if (v82)
    {
      v81 = *(_QWORD *)v90;
      v80 = v7;
      v88 = v9;
      obj = v10;
LABEL_8:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v90 != v81)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1CAA48B6C]();
        v14 = objc_msgSend(v12, "unsignedIntegerValue");
        __atxlog_handle_notification_management();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          ATXModeToString();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v94 = (uint64_t)v16;
          _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "Training Mode Entity Models for Mode %@...", buf, 0xCu);

        }
        if (v83)
        {
          objc_msgSend(v12, "unsignedIntegerValue");
          ATXModeToString();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXModeEntityModelTrainer pathForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "pathForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", CFSTR("apps"), v17, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CF94D8], "modificationDateOfFileAtPath:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "timeIntervalSinceNow");
          v21 = v20;

          if (v21 < 0.0 && v21 > -21600.0)
          {
            __atxlog_handle_notification_management();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v12, "unsignedIntegerValue");
              ATXModeToString();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v94 = (uint64_t)v23;
              v95 = 2048;
              v96 = -v21;
              _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "Skipping training of apps, contacts, and notification scores in Mode Entity Scorer for mode %@ since it was trained recently. Cache age: %.2f", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v13);
            v9 = v88;
            goto LABEL_45;
          }

        }
        v24 = -[ATXAppModeModel initWithMode:modeEntityStore:globalAppModeAffinityModel:]([ATXAppModeModel alloc], "initWithMode:modeEntityStore:globalAppModeAffinityModel:", objc_msgSend(v12, "unsignedIntegerValue"), self->_modeEntityStore, self->_globalAppModeAffinityModel);
        -[ATXAppModeModel scoredEntities](v24, "scoredEntities");
        v25 = objc_claimAutoreleasedReturnValue();
        ATXModeToString();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)v25;
        -[ATXModeEntityModelTrainer persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", v25, CFSTR("apps"), v26, 0);

        if (objc_msgSend(v7, "didDefer"))
        {
          __atxlog_handle_notification_management();
          v28 = (ATXAppModeDenyListModel *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v28->super, OS_LOG_TYPE_DEFAULT))
          {
            ATXModeToString();
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v94 = (uint64_t)v68;
            _os_log_impl(&dword_1C9A3B000, &v28->super, OS_LOG_TYPE_DEFAULT, "(Allow List) Finished training of app scores in Mode Entity Scorer for mode %@, but deferring training because XPC activity asked for deferral.", buf, 0xCu);

          }
          v67 = obj;
          goto LABEL_55;
        }
        context = v13;
        v28 = -[ATXAppModeDenyListModel initWithMode:modeEntityStore:globalInterruptingAppModel:]([ATXAppModeDenyListModel alloc], "initWithMode:modeEntityStore:globalInterruptingAppModel:", v14, self->_modeEntityStore, self->_globalInterruptingAppModel);
        -[ATXAppModeDenyListModel scoredEntities](v28, "scoredEntities");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        ATXModeToString();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXModeEntityModelTrainer persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", v29, CFSTR("apps"), v30, 1);

        if (objc_msgSend(v7, "didDefer"))
        {
          __atxlog_handle_notification_management();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            ATXModeToString();
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v94 = (uint64_t)v70;
            _os_log_impl(&dword_1C9A3B000, v69, OS_LOG_TYPE_DEFAULT, "(Deny List) Finished training of app scores in Mode Entity Scorer for mode %@, but deferring training because XPC activity asked for deferral.", buf, 0xCu);

          }
          v67 = obj;
          v13 = context;
LABEL_55:
          v9 = v88;

          objc_autoreleasePoolPop(v13);
          goto LABEL_57;
        }
        v85 = v29;
        v86 = v28;
        v31 = v24;
        v32 = -[ATXContactModeModel initWithMode:contactStore:]([ATXContactModeModel alloc], "initWithMode:contactStore:", v14, v88);
        -[ATXContactModeModel scoredEntities](v32, "scoredEntities");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v32;
        -[ATXContactModeModel purgeDeletedContacts:](v32, "purgeDeletedContacts:", v33);
        v34 = objc_claimAutoreleasedReturnValue();

        ATXModeToString();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)v34;
        -[ATXModeEntityModelTrainer persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", v34, CFSTR("contacts"), v35, 0);

        if (objc_msgSend(v7, "didDefer"))
        {
          __atxlog_handle_notification_management();
          p_super = objc_claimAutoreleasedReturnValue();
          v38 = v31;
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            ATXModeToString();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v94 = (uint64_t)v39;
            _os_log_impl(&dword_1C9A3B000, p_super, OS_LOG_TYPE_DEFAULT, "(Allow List) Finished training of contact scores in Mode Entity Scorer for mode %@, but deferring training because XPC activity asked for deferral.", buf, 0xCu);

          }
          v40 = 1;
          v41 = v84;
          v42 = v36;
          v44 = v85;
          v43 = v86;
        }
        else
        {
          v45 = self;
          v46 = -[ATXContactModeDenyListModel initWithMode:contactStore:]([ATXContactModeDenyListModel alloc], "initWithMode:contactStore:", v14, v88);
          -[ATXContactModeDenyListModel scoredEntities](v46, "scoredEntities");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = v46;
          v48 = v46;
          self = v45;
          -[ATXContactModeDenyListModel purgeDeletedContacts:](v48, "purgeDeletedContacts:", v47);
          v49 = objc_claimAutoreleasedReturnValue();

          ATXModeToString();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = (void *)v49;
          -[ATXModeEntityModelTrainer persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", v49, CFSTR("contacts"), v50, 1);

          v79 = (void *)v34;
          if (objc_msgSend(v7, "didDefer"))
          {
            __atxlog_handle_notification_management();
            v51 = objc_claimAutoreleasedReturnValue();
            v38 = v31;
            v78 = (ATXNotificationModeModel *)v51;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              ATXModeToString();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v94 = (uint64_t)v52;
              _os_log_impl(&dword_1C9A3B000, v51, OS_LOG_TYPE_DEFAULT, "(Deny List) Finished training of contact scores in Mode Entity Scorer for mode %@, but deferring training because XPC activity asked for deferral.", buf, 0xCu);

            }
            v40 = 1;
            v44 = v85;
            v43 = v86;
            v41 = v84;
            v53 = v76;
            p_super = &v77->super;
          }
          else
          {
            v78 = -[ATXNotificationModeModel initWithMode:contactStore:]([ATXNotificationModeModel alloc], "initWithMode:contactStore:", v14, v88);
            -[ATXNotificationModeModel scoredEntitiesWithScoredAppEntities:scoredContactEntities:](v78, "scoredEntitiesWithScoredAppEntities:scoredContactEntities:", v27, v34);
            v54 = objc_claimAutoreleasedReturnValue();
            ATXModeToString();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATXModeEntityModelTrainer persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", v54, CFSTR("notifications"), v55, 0);

            v74 = (void *)v54;
            if (objc_msgSend(v7, "didDefer"))
            {
              v38 = v31;
              __atxlog_handle_notification_management();
              v56 = objc_claimAutoreleasedReturnValue();
              v44 = v85;
              v43 = v86;
              v73 = (ATXWidgetModeModel *)v56;
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
              {
                ATXModeToString();
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v94 = (uint64_t)v57;
                _os_log_impl(&dword_1C9A3B000, v56, OS_LOG_TYPE_DEFAULT, "Finished training of notification scores in Mode Entity Scorer for mode %@, but deferring training because XPC activity asked for deferral.", buf, 0xCu);

              }
              v40 = 1;
            }
            else
            {
              v58 = -[ATXWidgetModeModel initWithMode:globalWidgetPopularityModel:]([ATXWidgetModeModel alloc], "initWithMode:globalWidgetPopularityModel:", v14, self->_globalWidgetPopularityModel);
              -[ATXWidgetModeModel scoredEntitiesWithScoredAppEntities:](v58, "scoredEntitiesWithScoredAppEntities:", v27);
              v59 = objc_claimAutoreleasedReturnValue();
              ATXModeToString();
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = (void *)v59;
              -[ATXModeEntityModelTrainer persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", v59, CFSTR("widgets"), v60, 0);

              __atxlog_handle_notification_management();
              v61 = objc_claimAutoreleasedReturnValue();
              v44 = v85;
              v43 = v86;
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                ATXModeToString();
                v62 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v94 = v62;
                v71 = v31;
                v63 = v58;
                v64 = (void *)v62;
                _os_log_impl(&dword_1C9A3B000, v61, OS_LOG_TYPE_DEFAULT, "Finished training of widget scores in Mode Entity Scorer for mode %@.", buf, 0xCu);

                v58 = v63;
                v31 = v71;
              }

              v73 = v58;
              if (objc_msgSend(v80, "didDefer"))
              {
                __atxlog_handle_notification_management();
                v65 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  ATXModeToString();
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v94 = (uint64_t)v66;
                  _os_log_impl(&dword_1C9A3B000, v65, OS_LOG_TYPE_DEFAULT, "Finished training of all entities for mode %@, but deferring training because XPC activity asked for deferral.", buf, 0xCu);

                }
                v38 = v31;

                v40 = 1;
              }
              else
              {
                v38 = v31;
                v40 = 0;
              }

            }
            v41 = v84;
            v53 = v76;
            p_super = &v77->super;

          }
          v42 = v79;
        }

        objc_autoreleasePoolPop(context);
        v7 = v80;
        v9 = v88;
        if (v40)
        {
          v67 = obj;
          goto LABEL_57;
        }
LABEL_45:
        if (v82 == ++v11)
        {
          v10 = obj;
          v82 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
          if (v82)
            goto LABEL_8;
          break;
        }
      }
    }

    __atxlog_handle_notification_management();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v67, OS_LOG_TYPE_DEFAULT, "Finished training Mode Entity Models for all modes.", buf, 2u);
    }
LABEL_57:

  }
}

- (BOOL)shouldDeferTrainingDueToRestoredBackup
{
  id v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  uint8_t v11[16];

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0D80ED8]);
  v4 = *MEMORY[0x1E0D80EB0];
  objc_msgSend(v3, "doubleForKey:", *MEMORY[0x1E0D80EB0]);
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8 = v7 - v6;
  if (v7 - v6 >= 604800.0)
  {
    if (v6 > 0.0)
      objc_msgSend(v3, "removeObjectForKey:", v4);
  }
  else
  {
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Skipping retraining because backup was recently restored", v11, 2u);
    }

  }
  return v8 < 604800.0;
}

- (BOOL)shouldDeferTrainingDueToUpgrade
{
  id v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  uint8_t v12[16];

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0D80ED8]);
  v4 = *MEMORY[0x1E0D80EB8];
  objc_msgSend(v3, "doubleForKey:", *MEMORY[0x1E0D80EB8]);
  if (v5 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = v6;
    objc_msgSend(v3, "setDouble:forKey:", v4);
  }
  else
  {
    v7 = v5;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9 = v8 - v7;
  if (v9 < 604800.0)
  {
    __atxlog_handle_notification_management();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "Skipping retraining because of recent upgrade", v12, 2u);
    }

  }
  return v9 < 604800.0;
}

- (id)pathForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5
{
  NSString *cacheBasePath;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;

  cacheBasePath = self->_cacheBasePath;
  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithFormat:", CFSTR("%@_%@"), v10, v9);

  -[NSString stringByAppendingPathComponent:](cacheBasePath, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 == 1)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringForATXModeConfigurationType();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithFormat:", CFSTR("%@_%@"), v12, v14);

    v12 = (void *)v15;
  }
  return v12;
}

- (BOOL)persistModeEntityScores:(id)a3 modeEntityTypeIdentifier:(id)a4 modeIdentifier:(id)a5 modeConfigurationType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  char v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "scoreThresholdGivenModeEntityScores:modeEntityTypeIdentifier:", v12, v10);
  objc_msgSend((id)objc_opt_class(), "thresholdedModeEntityScores:modeEntityTypeIdentifier:threshold:", v12, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1CAA48B6C]();
  v16 = (void *)MEMORY[0x1CAA48B6C]();
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v26;
  objc_autoreleasePoolPop(v16);
  if (v17 || !v18)
  {
    -[ATXModeEntityModelTrainer pathForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "pathForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", v10, v11, a6);
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v20 = objc_msgSend(v17, "writeToFile:options:error:", v19, 1073741825, &v25);
    v21 = v25;
    __atxlog_handle_notification_management();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if ((v20 & 1) != 0)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v10;
        _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "SUCCESS: Finished writing mode entity scores for mode entity type: %@.", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      -[ATXModeEntityModelTrainer persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:].cold.2();
    }

  }
  else
  {
    __atxlog_handle_notification_management();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[ATXModeEntityModelTrainer persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:].cold.1();
    v20 = 0;
  }

  objc_autoreleasePoolPop(v15);
  return v20;
}

+ (id)thresholdedModeEntityScores:(id)a3 modeEntityTypeIdentifier:(id)a4 threshold:(double)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  double v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("apps")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("contacts")))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", v15, (_QWORD)v25);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "scoreMetadata");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "score");
          v19 = v18;

          if (v19 >= a5)
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v12);
    }

    __atxlog_handle_notification_management();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v10, "count");
      v22 = v21 - objc_msgSend(v9, "count");
      v23 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 136315906;
      v30 = "+[ATXModeEntityModelTrainer thresholdedModeEntityScores:modeEntityTypeIdentifier:threshold:]";
      v31 = 2048;
      v32 = v22;
      v33 = 2048;
      v34 = v23;
      v35 = 2048;
      v36 = a5;
      _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "%s Filtered out %ld/%ld entities because their scores were < %f", buf, 0x2Au);
    }

  }
  else
  {
    v9 = v7;
  }

  return v9;
}

+ (double)scoreThresholdGivenModeEntityScores:(id)a3 modeEntityTypeIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v6 = a3;
  v7 = a4;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scoreThresholdForSavingAppsToModeFiles");
  v10 = v9;
  objc_msgSend(v8, "scoreThresholdForSavingContactsToModeFiles");
  v12 = v11;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("apps")))
  {
    objc_msgSend(a1, "maxScoreWithThresholdGivenModeEntityScores:", v6);
    if (v13 >= v10)
      v10 = v13;
  }
  else
  {
    v10 = 1.0;
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("contacts")))
    {
      objc_msgSend(a1, "maxScoreWithThresholdGivenModeEntityScores:", v6);
      if (v14 >= v12)
        v10 = v14;
      else
        v10 = v12;
    }
  }

  return v10;
}

+ (double)maxScoreWithThresholdGivenModeEntityScores:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  double v20;
  double v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9), (_QWORD)v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc(MEMORY[0x1E0CB37E8]);
        objc_msgSend(v10, "scoreMetadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "score");
        v13 = (void *)objc_msgSend(v11, "initWithDouble:");

        objc_msgSend(v4, "addObject:", v13);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "maxElementsToPerisistPerEntityForModeBackup");
  if (objc_msgSend(v16, "count") <= v18)
  {
    if (!objc_msgSend(v16, "count"))
    {
LABEL_14:
      v21 = 0.0;
      goto LABEL_15;
    }
    v18 = objc_msgSend(v16, "count");
  }
  else if (!v18)
  {
    goto LABEL_14;
  }
  objc_msgSend(v16, "objectAtIndexedSubscript:", v18 - 1, (_QWORD)v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

LABEL_15:
  return v21;
}

+ (id)eventProviderForScorableTime:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "eventProviderForMode:", objc_msgSend(v4, "atxMode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_notification_management();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[ATXModeEntityModelTrainer eventProviderForScorableTime:].cold.1((uint64_t)v4, v6);

    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99768];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Received invalid scorable time class %@"), v10);

    v5 = 0;
  }

  return v5;
}

+ (id)eventProviderForMode:(unint64_t)a3
{
  NSObject *v3;
  ATXUnifiedModeStreamModeEventProvider *v4;
  ATXUnifiedModeStreamModeEventProvider *v6;
  unint64_t v7;

  if (a3 - 8 >= 4)
  {
    if (a3 == 12)
    {
      v6 = (ATXUnifiedModeStreamModeEventProvider *)objc_opt_new();
      v7 = 12;
    }
    else
    {
      v6 = [ATXUnifiedModeStreamModeEventProvider alloc];
      v7 = a3;
    }
    v4 = -[ATXModeTransitionModeEventProvider initWithMode:](v6, "initWithMode:", v7);
  }
  else
  {
    __atxlog_handle_notification_management();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      +[ATXModeEntityModelTrainer eventProviderForMode:].cold.1(v3);

    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalWidgetPopularityModel, 0);
  objc_storeStrong((id *)&self->_globalInterruptingAppModel, 0);
  objc_storeStrong((id *)&self->_globalAppModeAffinityModel, 0);
  objc_storeStrong((id *)&self->_modeEntityStore, 0);
  objc_storeStrong((id *)&self->_cacheBasePath, 0);
}

- (void)persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "FAILURE: Unable to archive mode entity scores for mode entity type: %@. Error: %@");
}

- (void)persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "FAILURE: Unable to write mode entity scores for mode entity type: %@. Error: %@");
}

+ (void)eventProviderForScorableTime:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Received invalid scorable time class %@", (uint8_t *)&v5, 0xCu);

}

+ (void)eventProviderForMode:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Attempted to fetch event provider for digest mode", v1, 2u);
}

@end
