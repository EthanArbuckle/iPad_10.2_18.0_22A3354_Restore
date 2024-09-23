@implementation ISRootMigrator

- (BOOL)performMigration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t i;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t j;
  __CFString *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  id v75;
  NSObject *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  NSObject *v82;
  objc_class *v83;
  void *v84;
  void *v85;
  ISRootMigrator *v86;
  NSObject *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  NSObject *v91;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  ISRootMigrator *v97;
  uint64_t v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  const __CFString *v102;
  void *v103;
  id obj;
  void *v105;
  void *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  _QWORD v120[5];
  _BYTE v121[128];
  _BYTE v122[128];
  _QWORD v123[2];
  _QWORD v124[3];
  _QWORD v125[3];
  uint8_t buf[4];
  const char *v127;
  __int16 v128;
  uint64_t v129;
  __int16 v130;
  id v131;
  __int16 v132;
  _BOOL4 v133;
  __int16 v134;
  _BOOL4 v135;
  __int16 v136;
  _BOOL4 v137;
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  MigrationLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ISMigrator previousVersion](self, "previousVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISMigrator currentVersion](self, "currentVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v127 = "-[ISRootMigrator performMigration]";
    v128 = 2114;
    v129 = (uint64_t)v4;
    v130 = 2114;
    v131 = v5;
    v132 = 1024;
    v133 = -[ISRootMigrator isErase](self, "isErase");
    v134 = 1024;
    v135 = -[ISRootMigrator isRestoreFromBackup](self, "isRestoreFromBackup");
    v136 = 1024;
    v137 = -[ISMigrator newUserAccount](self, "newUserAccount");
    _os_log_impl(&dword_1B96C1000, v3, OS_LOG_TYPE_DEFAULT, "%s: previousVersion='%{public}@', currentVersion='%{public}@', isErase=%d, isRestoreFromBackup=%d, isNewUserAccount=%d", buf, 0x32u);

  }
  -[ISMigrator previousVersion](self, "previousVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISMigrator currentVersion](self, "currentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    if (!objc_msgSend(v6, "length"))
    {
      v8 = v7;
      v9 = v7;

      MigrationLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v127 = "-[ISRootMigrator performMigration]";
        _os_log_impl(&dword_1B96C1000, v10, OS_LOG_TYPE_DEFAULT, "%s: failed to retrieve previousVersion. Setting it to currentVersion.", buf, 0xCu);
      }

      v6 = v9;
      v7 = v8;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ISMigrator platform](self, "platform") == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v105 = 0;
    }
    v11 = -[ISMigrator platform](self, "platform");
    v96 = v6;
    v97 = self;
    v95 = v7;
    if (v11 - 3 < 2)
    {
      v12 = (void *)MEMORY[0x1E0C99E20];
      v123[0] = CFSTR("AppleLanguages");
      v123[1] = CFSTR("AppleLocale");
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = v123;
      v16 = 2;
    }
    else
    {
      if (v11 == 2)
      {
        v12 = (void *)MEMORY[0x1E0C99E20];
        v124[0] = CFSTR("AppleLanguages");
        v124[1] = CFSTR("AppleLocale");
        v124[2] = CFSTR("PreferredLanguages");
        v13 = (void *)MEMORY[0x1E0C99D20];
        v14 = v124;
      }
      else
      {
        if (v11 != 1)
        {
          v18 = 0;
          goto LABEL_25;
        }
        v12 = (void *)MEMORY[0x1E0C99E20];
        v125[0] = CFSTR("AppleLanguages");
        v125[1] = CFSTR("AppleLocale");
        v125[2] = CFSTR("AppleUserLanguages");
        v13 = (void *)MEMORY[0x1E0C99D20];
        v14 = v125;
      }
      v16 = 3;
    }
    objc_msgSend(v13, "arrayWithObjects:count:", v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v115, v122, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v116;
      v23 = (const __CFString *)*MEMORY[0x1E0C9B228];
      v24 = (const __CFString *)*MEMORY[0x1E0C9B260];
      v25 = (const __CFString *)*MEMORY[0x1E0C9B230];
      v26 = (const __CFString *)*MEMORY[0x1E0C9B240];
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v116 != v22)
            objc_enumerationMutation(v19);
          v28 = *(const __CFString **)(*((_QWORD *)&v115 + 1) + 8 * i);
          v29 = (void *)CFPreferencesCopyValue(v28, v23, v24, v25);
          if (v29)
            objc_msgSend(v106, "setObject:forKeyedSubscript:", v29, v28);

          if (v105)
          {
            v30 = (void *)CFPreferencesCopyValue(v28, v23, v26, v25);
            if (v30)
              objc_msgSend(v105, "setObject:forKeyedSubscript:", v30, v28);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v115, v122, 16);
      }
      while (v21);
    }

    -[ISRootMigrator performMigrationForUserPreferences:systemPreferences:](v97, "performMigrationForUserPreferences:systemPreferences:", v106, v105);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    MigrationLogger();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v127 = "-[ISRootMigrator performMigration]";
      v128 = 2114;
      v129 = (uint64_t)v106;
      v130 = 2114;
      v131 = v31;
      _os_log_impl(&dword_1B96C1000, v32, OS_LOG_TYPE_DEFAULT, "%s: oldPreferences = %{public}@, migratedPreferences = %{public}@", buf, 0x20u);
    }

    objc_msgSend(v31, "allKeys");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObjectsFromArray:", v33);

    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    obj = v19;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v121, 16);
    v103 = v31;
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v112;
      v37 = (const __CFString *)*MEMORY[0x1E0C9B228];
      v102 = (const __CFString *)*MEMORY[0x1E0C9B260];
      v100 = (const __CFString *)*MEMORY[0x1E0C9B230];
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v112 != v36)
            objc_enumerationMutation(obj);
          v39 = *(__CFString **)(*((_QWORD *)&v111 + 1) + 8 * j);
          objc_msgSend(v106, "objectForKeyedSubscript:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v40 || (objc_msgSend(v40, "isEqual:", v41) & 1) == 0)
          {
            if (-[__CFString isEqualToString:](v39, "isEqualToString:", CFSTR("AppleLanguages")))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v41, "count"))
              {
                MigrationLogger();
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v41, "componentsJoinedByString:", CFSTR(", "));
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315394;
                  v127 = "-[ISRootMigrator performMigration]";
                  v128 = 2114;
                  v129 = (uint64_t)v43;
                  _os_log_impl(&dword_1B96C1000, v42, OS_LOG_TYPE_DEFAULT, "%s: [NSLocale setPreferredLanguages:@[ %{public}@ ]]", buf, 0x16u);

                  v31 = v103;
                }

                objc_msgSend(MEMORY[0x1E0C99DC8], "setPreferredLanguages:", v41);
              }
            }
            else if (-[__CFString isEqualToString:](v39, "isEqualToString:", CFSTR("AppleLocale")))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v41, "length"))
                objc_msgSend(MEMORY[0x1E0C99DC8], "setLocaleOnly:", v41);
            }
            else
            {
              MigrationLogger();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v127 = "-[ISRootMigrator performMigration]";
                v128 = 2114;
                v129 = (uint64_t)v39;
                v130 = 2114;
                v131 = v41;
                _os_log_impl(&dword_1B96C1000, v44, OS_LOG_TYPE_DEFAULT, "%s: CFPreferencesSetValue(%{public}@ → %{public}@)", buf, 0x20u);
              }

              CFPreferencesSetValue(v39, v41, v37, v102, v100);
              v31 = v103;
            }
          }

        }
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v121, 16);
      }
      while (v35);
    }

    v45 = objc_msgSend(v96, "compare:options:", CFSTR("17A450"), 64);
    if (-[ISMigrator platform](v97, "platform") == 2
      && (v45 == -1 || -[ISRootMigrator isRestoreFromBackup](v97, "isRestoreFromBackup")))
    {
      MigrationLogger();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v127 = "-[ISRootMigrator performMigration]";
        _os_log_impl(&dword_1B96C1000, v46, OS_LOG_TYPE_DEFAULT, "%s: Migrating to enable watch mirroring.", buf, 0xCu);
      }

      v47 = (void *)objc_opt_new();
      objc_msgSend(v47, "initializeMirrorSettings");

    }
    v48 = (const __CFString *)*MEMORY[0x1E0C9B228];
    v49 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v50 = (const __CFString *)*MEMORY[0x1E0C9B230];
    v51 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguagesSchemaVersion"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v52 = objc_msgSend(v51, "unsignedIntegerValue");

    MigrationLogger();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v127 = "-[ISRootMigrator performMigration]";
      v128 = 2048;
      v129 = v52;
      _os_log_impl(&dword_1B96C1000, v53, OS_LOG_TYPE_DEFAULT, "%s: AppleLanguagesSchemaVersion = %lu", buf, 0x16u);
    }

    v54 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), v48, v49, v50);
    v55 = (void *)CFPreferencesCopyValue(CFSTR("AppleLocale"), v48, v49, v50);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (v54)
      objc_msgSend(v56, "setObject:forKeyedSubscript:", v54, CFSTR("AppleLanguages"));
    if (v55)
      objc_msgSend(v57, "setObject:forKeyedSubscript:", v55, CFSTR("AppleLocale"));
    +[ISMigrator migratorFromSchemaVersion:](IP_emptyPreferences_migrator, "migratorFromSchemaVersion:", v52);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "performMigrationForPreferences:", v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v59, "mutableCopy");

    objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
    v61 = objc_claimAutoreleasedReturnValue();
    v101 = v60;
    if (v61
      && (v62 = (void *)v61,
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("AppleLocale")),
          v63 = (void *)objc_claimAutoreleasedReturnValue(),
          v63,
          v62,
          v63))
    {
      v93 = v58;
      v94 = v54;
      v99 = v55;
      -[ISMigrator previousVersion](v97, "previousVersion");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISMigrator currentVersion](v97, "currentVersion");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      +[ISMigrator migratorFromVersion:toVersion:](IP_pa_Arab_to_pa_Aran_migrator, "migratorFromVersion:toVersion:", v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v120[0] = v66;
      +[ISMigrator migratorFromSchemaVersion:](IP_HK_MO_yue_Hant_migrator, "migratorFromSchemaVersion:", v52);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v120[1] = v67;
      +[ISMigrator migratorFromSchemaVersion:](IP_Zawgyi_migrator, "migratorFromSchemaVersion:", v52);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v120[2] = v68;
      +[ISMigrator migratorFromSchemaVersion:](IP_unsupportedVariantsAddedByKeyboards_migrator, "migratorFromSchemaVersion:", v52);
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = v52;
      v71 = (void *)v69;
      v120[3] = v69;
      v98 = v70;
      +[ISMigrator migratorFromSchemaVersion:](IP_advancedSettings_migrator, "migratorFromSchemaVersion:");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v120[4] = v72;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 5);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      MigrationLogger();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v127 = "-[ISRootMigrator performMigration]";
        v128 = 2114;
        v129 = (uint64_t)v60;
        _os_log_impl(&dword_1B96C1000, v74, OS_LOG_TYPE_DEFAULT, "%s: Preferences before running preferences migrators: %{public}@", buf, 0x16u);
      }

      v75 = v60;
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      v76 = v73;
      v77 = -[NSObject countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
      if (v77)
      {
        v78 = v77;
        v79 = *(_QWORD *)v108;
        do
        {
          v80 = 0;
          v81 = v75;
          do
          {
            if (*(_QWORD *)v108 != v79)
              objc_enumerationMutation(v76);
            objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * v80), "performMigrationForPreferences:", v81);
            v75 = (id)objc_claimAutoreleasedReturnValue();

            MigrationLogger();
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              v83 = (objc_class *)objc_opt_class();
              NSStringFromClass(v83);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v127 = "-[ISRootMigrator performMigration]";
              v128 = 2114;
              v129 = (uint64_t)v84;
              v130 = 2114;
              v131 = v75;
              _os_log_impl(&dword_1B96C1000, v82, OS_LOG_TYPE_DEFAULT, "%s: Preferences after running <%{public}@>: %{public}@", buf, 0x20u);

            }
            ++v80;
            v81 = v75;
          }
          while (v78 != v80);
          v78 = -[NSObject countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
        }
        while (v78);
      }

      objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v7 = v95;
      v6 = v96;
      v86 = v97;
      v52 = v98;
      v54 = v94;
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend(v85, "count")
        && (objc_msgSend(v94, "isEqualToArray:", v85) & 1) == 0)
      {
        MigrationLogger();
        v87 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v127 = "-[ISRootMigrator performMigration]";
          v128 = 2114;
          v129 = (uint64_t)v85;
          _os_log_impl(&dword_1B96C1000, v87, OS_LOG_TYPE_DEFAULT, "%s: AppleLanguages changed to %{public}@. Writing to disk.", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0C99DC8], "setPreferredLanguages:", v85);
      }
      objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v55 = v99;
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend(v88, "length")
        && (objc_msgSend(v99, "isEqualToString:", v88) & 1) == 0)
      {
        MigrationLogger();
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v127 = "-[ISRootMigrator performMigration]";
          v128 = 2114;
          v129 = (uint64_t)v88;
          _os_log_impl(&dword_1B96C1000, v89, OS_LOG_TYPE_DEFAULT, "%s: AppleLocale changed to %{public}@. Writing to disk.", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0C99DC8], "setLocaleOnly:", v88);
        v55 = v99;
      }

      v31 = v103;
      v58 = v93;
    }
    else
    {
      MigrationLogger();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v127 = "-[ISRootMigrator performMigration]";
        v128 = 2114;
        v129 = (uint64_t)v54;
        v130 = 2114;
        v131 = v55;
        _os_log_impl(&dword_1B96C1000, v76, OS_LOG_TYPE_DEFAULT, "%s: AppleLanguages (%{public}@) or AppleLocale (%{public}@) is nil. Skipping preferences migrators.", buf, 0x20u);
      }
      v86 = v97;
      v7 = v95;
      v6 = v96;
    }

    +[ISMigrator migratorFromSchemaVersion:](IP_advancedSettings_migrator, "migratorFromSchemaVersion:", v52);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "migrateOtherSystemSettings");

    if (v52 == 4000)
    {
      MigrationLogger();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v127 = "-[ISRootMigrator performMigration]";
        _os_log_impl(&dword_1B96C1000, v91, OS_LOG_TYPE_DEFAULT, "%s: AppleLanguagesSchemaVersion is up to date.", buf, 0xCu);
      }

    }
    else
    {
      -[ISRootMigrator updateAppleLanguagesSchemaVersionToCurrent](v86, "updateAppleLanguagesSchemaVersionToCurrent");
    }

    goto LABEL_109;
  }
  if (-[ISMigrator platform](self, "platform") == 1 || !-[ISRootMigrator isErase](self, "isErase"))
  {
    MigrationLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[ISRootMigrator performMigration].cold.1(v15);

  }
  else
  {
    -[ISRootMigrator updateAppleLanguagesSchemaVersionToCurrent](self, "updateAppleLanguagesSchemaVersionToCurrent");
  }
LABEL_109:

  return 1;
}

- (void)updateAppleLanguagesSchemaVersionToCurrent
{
  NSObject *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MigrationLogger();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[ISRootMigrator updateAppleLanguagesSchemaVersionToCurrent]";
    v8 = 2048;
    v9 = 4000;
    _os_log_impl(&dword_1B96C1000, v2, OS_LOG_TYPE_DEFAULT, "%s: Updating AppleLanguagesSchemaVersion to %lu.", (uint8_t *)&v6, 0x16u);
  }

  v3 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v5 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(CFSTR("AppleLanguagesSchemaVersion"), &unk_1E706D928, (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  CFPreferencesSynchronize(v3, v4, v5);
}

- (id)performMigrationForUserPreferences:(id)a3 systemPreferences:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  uint64_t v66;
  NSObject *v67;
  _BOOL4 v68;
  void *v69;
  NSObject *log;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  NSObject *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  NSObject *v89;
  __int16 v90;
  __CFString *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ISMigrator previousVersion](self, "previousVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISMigrator currentVersion](self, "currentVersion");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "mutableCopy");
  if (-[ISMigrator platform](self, "platform") == 1 && -[ISMigrator newUserAccount](self, "newUserAccount"))
  {
    MigrationLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
      v86 = 2114;
      v87 = v8;
      v88 = 2114;
      v89 = v9;
      _os_log_impl(&dword_1B96C1000, v11, OS_LOG_TYPE_DEFAULT, "%s: (1) previousVersion=%{public}@, currentVersion=%{public}@ → Performing New User Account Migration", buf, 0x20u);
    }

    MigrationLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
      v86 = 2114;
      v87 = v14;
      _os_log_impl(&dword_1B96C1000, v12, OS_LOG_TYPE_DEFAULT, "%s: (1) System AppleLanguages= [ %{public}@ ]", buf, 0x16u);

    }
    MigrationLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
      v86 = 2114;
      v87 = v16;
      _os_log_impl(&dword_1B96C1000, v15, OS_LOG_TYPE_DEFAULT, "%s: (1) System AppleLocale= %{public}@", buf, 0x16u);

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("AppleLanguages"));

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("AppleLocale"));
    goto LABEL_69;
  }
  v19 = -[ISMigrator platform](self, "platform") - 1;
  if (v19 > 3)
    v20 = 0;
  else
    v20 = off_1E7068DC8[v19];
  MigrationLogger();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
    v86 = 2114;
    v87 = v8;
    v88 = 2114;
    v89 = v9;
    v90 = 2114;
    v91 = v20;
    _os_log_impl(&dword_1B96C1000, v21, OS_LOG_TYPE_DEFAULT, "%s: (1) previousVersion=%{public}@, currentVersion=%{public}@, upgradeThreshold=%{public}@", buf, 0x2Au);
  }

  v78 = v9;
  if (objc_msgSend(v8, "compare:options:", v20, 64) == -1
    && -[NSObject compare:options:](v9, "compare:options:", v20, 64) != -1)
  {
    MigrationLogger();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
      v86 = 2114;
      v87 = v8;
      v88 = 2114;
      v89 = v9;
      v90 = 2114;
      v91 = v20;
      _os_log_impl(&dword_1B96C1000, v22, OS_LOG_TYPE_DEFAULT, "%s: (1) { %{public}@, %{public}@, %{public}@ } qualifies for AppleLanguages migration", buf, 0x2Au);
    }

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v23, "count"))
    {
      MigrationLogger();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
        _os_log_impl(&dword_1B96C1000, v25, OS_LOG_TYPE_DEFAULT, "%s: (1) current AppleLanguages is nil/empty; skipping migration",
          buf,
          0xCu);
      }
      goto LABEL_33;
    }
    v24 = v8;
    -[ISRootMigrator importPreferredLanguagesForPreferences:](self, "importPreferredLanguagesForPreferences:", v10);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localeWithLocaleIdentifier:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[ISRootMigrator appendRegionalVariantsToLanguageIdentifiers:regionCode:](self, "appendRegionalVariantsToLanguageIdentifiers:regionCode:", v25, v29);
      v30 = v25;
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      MigrationLogger();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
          buf,
          0xCu);
      }
    }
    v8 = v24;

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, CFSTR("AppleLanguages"));
    if (-[ISMigrator platform](self, "platform") == 1)
    {
      v31 = CFSTR("AppleUserLanguages");
    }
    else
    {
      if (-[ISMigrator platform](self, "platform") != 2)
      {
LABEL_32:

        v9 = v78;
LABEL_33:

        goto LABEL_34;
      }
      v31 = CFSTR("PreferredLanguages");
    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v31);
    goto LABEL_32;
  }
LABEL_34:
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "count") == 1)
  {
    v72 = v10;
    v74 = v8;
    v75 = v7;
    v76 = v6;
    v33 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(v32, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localeWithLocaleIdentifier:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "languageCode");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v35;
    objc_msgSend(v35, "countryCode");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "baseSystemLanguages");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v37, "count"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v39 = v37;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v80 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "languageCode");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v45);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
      }
      while (v41);
    }

    v46 = v36;
    v47 = objc_msgSend(v36, "length");
    v10 = v72;
    v48 = v77;
    if (v47)
    {
      if ((objc_msgSend(v38, "containsObject:", v46) & 1) == 0)
      {
        if (objc_msgSend(v77, "length"))
        {
          v49 = (void *)MEMORY[0x1E0CB34D0];
          objc_msgSend(MEMORY[0x1E0C99DC8], "baseSystemLanguages");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "preferredLocalizationsFromArray:forPreferences:", v50, v32);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "firstObject");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("en"));

          v48 = v77;
          if (v53)
          {
            objc_msgSend(MEMORY[0x1E0C99DC8], "languageFromLanguage:byReplacingRegion:", CFSTR("en"), v77);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v54, "length"))
            {
              MigrationLogger();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v32, "componentsJoinedByString:", CFSTR(", "));
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
                v86 = 2114;
                v87 = v56;
                _os_log_impl(&dword_1B96C1000, v55, OS_LOG_TYPE_DEFAULT, "%s: (2) AppleLanguages = [ %{public}@ ] qualifies for AppleLanguages repair", buf, 0x16u);

              }
              objc_msgSend(v32, "arrayByAddingObject:", v54);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "setObject:forKeyedSubscript:", v57, CFSTR("AppleLanguages"));

              MigrationLogger();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                log = v58;
                objc_msgSend(v32, "componentsJoinedByString:", CFSTR(", "));
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "componentsJoinedByString:", CFSTR(", "));
                v61 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
                v86 = 2114;
                v87 = v59;
                v88 = 2114;
                v89 = v61;
                _os_log_impl(&dword_1B96C1000, log, OS_LOG_TYPE_DEFAULT, "%s: (2) AppleLanguages = [ %{public}@ ] → [ %{public}@ ]", buf, 0x20u);

                v58 = log;
              }

            }
          }
        }
      }
    }

    v7 = v75;
    v6 = v76;
    v8 = v74;
    v9 = v78;
  }

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length") && objc_msgSend(v63, "length"))
  {
    MigrationLogger();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
      v86 = 2114;
      v87 = v63;
      _os_log_impl(&dword_1B96C1000, v64, OS_LOG_TYPE_DEFAULT, "%s: (3) AppleLocale = %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifier:withNewLanguageIdentifier:", v63, v18);
    v65 = objc_claimAutoreleasedReturnValue();
    v66 = -[NSObject length](v65, "length");
    MigrationLogger();
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT);
    if (v66)
    {
      if (v68)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
        v86 = 2114;
        v87 = v69;
        v88 = 2114;
        v89 = v65;
        _os_log_impl(&dword_1B96C1000, v67, OS_LOG_TYPE_DEFAULT, "%s: (3) AppleLocale = %{public}@ → %{public}@", buf, 0x20u);

      }
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v65, CFSTR("AppleLocale"));
    }
    else
    {
      if (v68)
      {
        *(_DWORD *)buf = 136315138;
        v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
        _os_log_impl(&dword_1B96C1000, v67, OS_LOG_TYPE_DEFAULT, "%s: (3) new AppleLocale is nil/empty; skipping migration",
          buf,
          0xCu);
      }

    }
    v9 = v78;
  }
  else
  {
    MigrationLogger();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
      _os_log_impl(&dword_1B96C1000, v65, OS_LOG_TYPE_DEFAULT, "%s: (3) current AppleLanguages or AppleLocale is nil/empty; skipping migration",
        buf,
        0xCu);
    }
  }

LABEL_69:
  return v10;
}

- (id)performMigrationForPreferences:(id)a3
{
  return -[ISRootMigrator performMigrationForUserPreferences:systemPreferences:](self, "performMigrationForUserPreferences:systemPreferences:", a3, 0);
}

- (id)appendRegionalVariantsToLanguageIdentifiers:(id)a3 regionCode:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  id obj;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  void *v48;
  _QWORD v49[2];
  uint8_t v50[128];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v7 = objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v37 = v5;
    obj = v5;
    v40 = (void *)v7;
    v41 = v6;
    v8 = (void *)v7;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (!v43)
      goto LABEL_16;
    v9 = *(_QWORD *)v45;
    v10 = *MEMORY[0x1E0C997B0];
    v11 = 0x1E0C99000uLL;
    v38 = *MEMORY[0x1E0C997B0];
    v39 = *(_QWORD *)v45;
    while (1)
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(obj);
        v13 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(*(id *)(v11 + 3528), "componentsFromLocaleIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v6;
        objc_msgSend(*(id *)(v11 + 3528), "languageFromLanguage:byReplacingRegion:", v13, v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          v18 = v13;
          v13 = v16;
LABEL_13:
          v26 = v8;
          goto LABEL_14;
        }
        objc_msgSend(*(id *)(v11 + 3528), "baseLanguageFromLanguage:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v18, "length"))
          goto LABEL_13;
        v19 = (void *)MEMORY[0x1E0CB34D0];
        v49[0] = v18;
        v49[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "preferredLocalizationsFromArray:forPreferences:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", v13);

        if (v24)
        {
          v25 = v16;

          v13 = v25;
        }
        v26 = v40;
        v15 = v41;
        v10 = v38;
        v9 = v39;
LABEL_14:

        v8 = v26;
        objc_msgSend(v26, "addObject:", v13);

        v11 = 0x1E0C99000;
        v6 = v15;
      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (!v43)
      {
LABEL_16:

        MigrationLogger();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v8;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(obj, "componentsJoinedByString:", CFSTR(", "));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "array");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "componentsJoinedByString:", CFSTR(", "));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v52 = "-[ISRootMigrator appendRegionalVariantsToLanguageIdentifiers:regionCode:]";
          v53 = 2114;
          v54 = v41;
          v55 = 2114;
          v56 = v29;
          v57 = 2114;
          v58 = v31;
          _os_log_impl(&dword_1B96C1000, v27, OS_LOG_TYPE_DEFAULT, "%s: regionCode=%{public}@, preferredLanguages = [ %{public}@ ] → [ %{public}@ ]", buf, 0x2Au);

          v28 = v40;
          v6 = v41;
        }

        objc_msgSend(v28, "array");
        v32 = (id)objc_claimAutoreleasedReturnValue();

        v5 = v37;
        goto LABEL_22;
      }
    }
  }
  MigrationLogger();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v52 = "-[ISRootMigrator appendRegionalVariantsToLanguageIdentifiers:regionCode:]";
    v53 = 2114;
    v54 = 0;
    v55 = 2114;
    v56 = v34;
    v57 = 2114;
    v58 = v35;
    _os_log_impl(&dword_1B96C1000, v33, OS_LOG_TYPE_DEFAULT, "%s: regionCode=%{public}@, preferredLanguages = [ %{public}@ ] → [ %{public}@ ]", buf, 0x2Au);

  }
  v32 = v5;
LABEL_22:

  return v32;
}

- (id)importPreferredLanguagesForPreferences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ISMigrator previousVersion](self, "previousVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ISMigrator platform](self, "platform") == 1)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleUserLanguages"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      MigrationLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[ISRootMigrator importPreferredLanguagesForPreferences:]";
        _os_log_impl(&dword_1B96C1000, v8, OS_LOG_TYPE_DEFAULT, "%s: Possible upgrade from macOS 10.9", buf, 0xCu);
      }

      v9 = CFSTR("10.9");
      if (objc_msgSend(v5, "compare:options:", CFSTR("10.9"), 64) != -1
        && objc_msgSend(v5, "compare:options:", CFSTR("10.10"), 64) == -1)
      {
        MigrationLogger();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v27 = "-[ISRootMigrator importPreferredLanguagesForPreferences:]";
          _os_log_impl(&dword_1B96C1000, v10, OS_LOG_TYPE_DEFAULT, "%s: Upgrade from macOS 10.9", buf, 0xCu);
        }

        -[ISRootMigrator importPreferredLanguages_macOS_10_9_forPreferences:](self, "importPreferredLanguages_macOS_10_9_forPreferences:", v4);
        v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
        v16 = v11;
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      v9 = CFSTR("10.9");
    }
  }
  else
  {
    if (-[ISMigrator platform](self, "platform") != 2)
      goto LABEL_24;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PreferredLanguages"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7 || objc_msgSend(v6, "count") == 1)
    {
      MigrationLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[ISRootMigrator importPreferredLanguagesForPreferences:]";
        _os_log_impl(&dword_1B96C1000, v12, OS_LOG_TYPE_DEFAULT, "%s: Possible upgrade from iOS 8", buf, 0xCu);
      }

      v9 = CFSTR("12A");
      if (objc_msgSend(v5, "compare:options:", CFSTR("12A"), 64) != -1
        && objc_msgSend(v5, "compare:options:", CFSTR("13A"), 64) == -1)
      {
        MigrationLogger();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v27 = "-[ISRootMigrator importPreferredLanguagesForPreferences:]";
          v28 = 2114;
          v29 = v14;
          v30 = 2114;
          v31 = v15;
          _os_log_impl(&dword_1B96C1000, v13, OS_LOG_TYPE_DEFAULT, "%s: Upgrade from iOS 8; preferredLanguages = [ %{public}@ ] → [ %{public}@ ]",
            buf,
            0x20u);

        }
        v11 = v6;
        goto LABEL_20;
      }
    }
    else
    {
      v9 = CFSTR("12A");
    }
  }

  if (objc_msgSend(v5, "compare:options:", v9, 64) == -1 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[IntlUtility normalizedLanguageIDFromString:](IntlUtility, "normalizedLanguageIDFromString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    MigrationLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v27 = "-[ISRootMigrator importPreferredLanguagesForPreferences:]";
      v28 = 2114;
      v29 = v22;
      v30 = 2114;
      v31 = v23;
      _os_log_impl(&dword_1B96C1000, v7, OS_LOG_TYPE_DEFAULT, "%s: Upgrade from pre-{ macOS 10.9, iOS 8 }; preferredLanguages = [ %{public}@ ] → [ %{public}@ ]",
        buf,
        0x20u);

    }
    goto LABEL_30;
  }
LABEL_24:
  MigrationLogger();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v27 = "-[ISRootMigrator importPreferredLanguagesForPreferences:]";
    v28 = 2114;
    v29 = v18;
    v30 = 2114;
    v31 = v19;
    _os_log_impl(&dword_1B96C1000, v17, OS_LOG_TYPE_DEFAULT, "%s: Upgrade from post-{ macOS 10.9, iOS 8 }; preferredLanguages = [ %{public}@ ] → [ %{public}@ ]",
      buf,
      0x20u);

  }
  v16 = v6;
LABEL_31:

  return v16;
}

- (id)importPreferredLanguages_macOS_10_9_forPreferences:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AppleUserLanguages"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
    MigrationLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[ISRootMigrator importPreferredLanguages_macOS_10_9_forPreferences:]";
      v27 = 1024;
      LODWORD(v28) = v7;
      _os_log_impl(&dword_1B96C1000, v8, OS_LOG_TYPE_DEFAULT, "%s: preferredLanguagesIndex=%u", buf, 0x12u);
    }

    if (v7 && v7 <= objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "subarrayWithRange:", 0, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v9);

    }
  }
  if (!objc_msgSend(v4, "count") && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setArray:", v11);

  }
  v23 = v5;
  v12 = objc_msgSend(v4, "count");
  if (v12)
  {
    v13 = v12;
    for (i = 0; i != v13; ++i)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[IntlUtility normalizedLanguageIDFromString:](IntlUtility, "normalizedLanguageIDFromString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      MigrationLogger();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v26 = "-[ISRootMigrator importPreferredLanguages_macOS_10_9_forPreferences:]";
        v27 = 2114;
        v28 = v18;
        v29 = 2114;
        v30 = v16;
        _os_log_impl(&dword_1B96C1000, v17, OS_LOG_TYPE_DEFAULT, "%s: Normalizing %{public}@ → %{public}@", buf, 0x20u);

      }
      objc_msgSend(v4, "setObject:atIndexedSubscript:", v16, i);

    }
  }
  MigrationLogger();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v23, "componentsJoinedByString:", CFSTR(", "));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v26 = "-[ISRootMigrator importPreferredLanguages_macOS_10_9_forPreferences:]";
    v27 = 2114;
    v28 = v20;
    v29 = 2114;
    v30 = v21;
    _os_log_impl(&dword_1B96C1000, v19, OS_LOG_TYPE_DEFAULT, "%s: Upgrade from macOS 10.9; preferredLanguages = [ %{public}@ ] → [ %{public}@ ]",
      buf,
      0x20u);

  }
  return v4;
}

- (BOOL)isErase
{
  return self->_isErase;
}

- (void)setIsErase:(BOOL)a3
{
  self->_isErase = a3;
}

- (BOOL)isRestoreFromBackup
{
  return self->_isRestoreFromBackup;
}

- (void)setIsRestoreFromBackup:(BOOL)a3
{
  self->_isRestoreFromBackup = a3;
}

- (void)performMigration
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ISRootMigrator performMigration]";
  _os_log_fault_impl(&dword_1B96C1000, log, OS_LOG_TYPE_FAULT, "%s: failed to retrieve currentVersion; bailing...",
    (uint8_t *)&v1,
    0xCu);
}

@end
