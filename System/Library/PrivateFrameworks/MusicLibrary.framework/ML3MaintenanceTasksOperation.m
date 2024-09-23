@implementation ML3MaintenanceTasksOperation

- (ML3MaintenanceTasksOperation)initWithLibrary:(id)a3 activity:(id)a4
{
  id v7;
  id v8;
  ML3MaintenanceTasksOperation *v9;
  ML3MaintenanceTasksOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3MaintenanceTasksOperation;
  v9 = -[ML3MaintenanceTasksOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    objc_storeStrong((id *)&v10->_activity, a4);
  }

  return v10;
}

- (void)main
{
  void *v2;
  char v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  NSObject *v8;
  ML3MusicLibrary *v9;
  NSObject *v10;
  ML3MusicLibrary *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  _QWORD *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  _BOOL4 v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  id v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  id v63;
  void *v64;
  _BOOL4 v65;
  NSObject *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  id v78;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  NSObject *v86;
  id v87;
  void *v88;
  NSObject *v89;
  NSObject *v90;
  NSObject *v91;
  NSObject *v92;
  OS_xpc_object *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t k;
  void *v100;
  __CFString *v101;
  void *v102;
  int v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  dispatch_semaphore_t v113;
  void *v114;
  id v115;
  NSObject *v116;
  int v117;
  BOOL v118;
  NSObject *v119;
  NSObject *v120;
  NSObject *v121;
  NSObject *v122;
  void *v123;
  int v124;
  NSObject *v125;
  ML3MusicLibrary *library;
  NSObject *v127;
  ML3MusicLibrary *v128;
  NSObject *v129;
  void *v130;
  __CFString *v131;
  __CFString *v132;
  __CFString *v133;
  void *v134;
  __CFString *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  ML3MusicLibrary *v145;
  id v146;
  NSObject *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t m;
  ML3MusicLibrary *v151;
  void *v152;
  void *v153;
  NSObject *v154;
  void *v155;
  id v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  char v161;
  id v162;
  NSObject *v163;
  uint64_t v164;
  NSObject *v165;
  NSObject *v166;
  OS_xpc_object *v167;
  NSObject *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  ML3MusicLibrary *v185;
  NSObject *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  ML3MusicLibrary *v191;
  void *v192;
  xpc_activity_t activity;
  _xpc_activity_s *activitya;
  id v196;
  uint64_t v197;
  int v198;
  void *v199;
  id v200;
  void *v201;
  void *v202;
  id obj;
  id obja;
  id objb;
  id objc;
  NSObject *log;
  uint64_t loga;
  void *logb;
  ML3MusicLibrary *v210;
  ML3MusicLibrary *v211;
  uint64_t v212;
  void *v213;
  id v214;
  _QWORD v215[5];
  _QWORD v216[4];
  id v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  uint8_t v222[4];
  uint64_t v223;
  __int16 v224;
  void *v225;
  uint8_t v226[32];
  __int128 v227;
  __int128 v228;
  NSObject *v229;
  __int128 *v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  _QWORD v235[2];
  _QWORD v236[2];
  void *v237;
  uint64_t v238;
  void (*v239)(uint64_t, uint64_t, uint64_t *);
  void *v240;
  id v241;
  const __CFString *v242;
  _QWORD v243[2];
  __CFString *v244;
  uint64_t v245;
  void (*v246)(uint64_t, uint64_t, uint64_t *);
  void *v247;
  id v248;
  const __CFString *v249;
  __int128 v250;
  uint64_t v251;
  void *v252;
  ML3MusicLibrary *v253;
  id v254;
  id v255;
  _QWORD v256[2];
  _BYTE v257[24];
  void *v258;
  id v259;
  _QWORD v260[2];
  _QWORD v261[4];
  _BYTE buf[24];
  void *v263;
  ML3MusicLibrary *v264;
  id v265;
  uint8_t *v266;
  __int128 *v267;
  uint64_t v268;

  v268 = *MEMORY[0x1E0C80C00];
  -[ML3MusicLibrary databasePath](self->_library, "databasePath");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", v188);

  if ((v3 & 1) != 0)
  {
    -[ML3MusicLibrary valueForDatabaseProperty:](self->_library, "valueForDatabaseProperty:", CFSTR("MLMaintenanceTaskOperationDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Cleaning up missing foreign keys", buf, 2u);
    }

    v9 = self->_library;
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck: Checking library %{public}@", buf, 0xCu);
    }

    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck_block_invoke;
    v263 = &unk_1E5B619C8;
    v11 = v9;
    v264 = v11;
    LOBYTE(v265) = 1;
    -[ML3MusicLibrary performDatabaseTransactionWithBlock:](v11, "performDatabaseTransactionWithBlock:", buf);
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v226 = 138543362;
      *(_QWORD *)&v226[4] = v11;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck: Finished checking library %{public}@", v226, 0xCu);
    }

    v13 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Removing cached playlists not played since %{public}@", buf, 0xCu);
    }

    v210 = self->_library;
    v14 = v7;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("is_hidden"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v231 = v15;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("cloud_is_subscribed"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&v231 + 1) = v16;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("store_cloud_id"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v232 = v17;
    +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("cloud_global_id"), &stru_1E5B66908, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&v232 + 1) = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v231, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("date_played_local"), v22, 6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&v250 = 0;
    *((_QWORD *)&v250 + 1) = &v250;
    v251 = 0x2020000000;
    LODWORD(v252) = 0;
    *(_QWORD *)v257 = v20;
    *(_QWORD *)&v257[8] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v257, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    +[ML3Entity allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:](ML3Container, "allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:", v210, v25, MEMORY[0x1E0C9AA60], 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = CFSTR("name");
    v245 = (uint64_t)CFSTR("cloud_global_id");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v244, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v218 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v218 + 1) = 3221225472;
    *(_QWORD *)&v219 = __ML3MaintenanceUtilitiesRemoveCachedPlaylistsNotPlayedSinceDate_block_invoke;
    *((_QWORD *)&v219 + 1) = &unk_1E5B61BA8;
    *((_QWORD *)&v220 + 1) = &v250;
    v29 = v27;
    *(_QWORD *)&v220 = v29;
    objc_msgSend(v26, "enumeratePersistentIDsAndProperties:usingBlock:", v28, &v218);

    v30 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_msgSend(v29, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v31;
      _os_log_impl(&dword_1AC149000, v30, OS_LOG_TYPE_DEFAULT, "[Maintenance] Found %lu total cached playlists to purge", buf, 0xCu);
    }

    if (objc_msgSend(v29, "count"))
    {
      v199 = v26;
      v32 = malloc_type_malloc(8 * objc_msgSend(v29, "count"), 0x100004000313F17uLL);
      obj = v25;
      v33 = v20;
      v34 = v14;
      v227 = 0u;
      v228 = 0u;
      memset(v226, 0, sizeof(v226));
      v35 = v29;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", v226, buf, 16);
      if (v36)
      {
        v37 = 0;
        v38 = **(_QWORD **)&v226[16];
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (**(_QWORD **)&v226[16] != v38)
              objc_enumerationMutation(v35);
            v32[v37 + i] = objc_msgSend(*(id *)(*(_QWORD *)&v226[8] + 8 * i), "longLongValue");
          }
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", v226, buf, 16);
          v37 += i;
        }
        while (v36);
      }

      v25 = obj;
      v14 = v34;
      v20 = v33;
      +[ML3Container deleteFromLibrary:deletionType:persistentIDs:count:](ML3Container, "deleteFromLibrary:deletionType:persistentIDs:count:", v210, 2, v32, objc_msgSend(v35, "count"));
      free(v32);
      v26 = v199;
    }

    _Block_object_dispose(&v250, 8);
    v40 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl(&dword_1AC149000, v40, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Removing orphaned tracks before %{public}@", buf, 0xCu);
    }

    v191 = self->_library;
    v186 = v14;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("remote_location_id"), 50);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.store_saga_id"), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v261[0] = v41;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.sync_id"), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v261[1] = v42;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.purchase_history_id"), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v261[2] = v43;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.is_ota_purchased"), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v261[3] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v261, 4);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v45);
    v187 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = (void *)MEMORY[0x1E0CB37E8];
    -[NSObject timeIntervalSinceReferenceDate](v186, "timeIntervalSinceReferenceDate");
    objc_msgSend(v46, "numberWithDouble:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("date_added"), v47, 6);
    v184 = (void *)objc_claimAutoreleasedReturnValue();

    v260[0] = v184;
    v260[1] = v187;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v260, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v48);
    v182 = (void *)objc_claimAutoreleasedReturnValue();

    +[ML3Entity allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:](ML3Track, "allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:", v191, v182, MEMORY[0x1E0C9AA60], 0);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v189, "countOfEntities");
    log = os_log_create("com.apple.amp.medialibrary", "Default");
    v50 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v49)
    {
      if (v50)
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v49;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v189;
        _os_log_impl(&dword_1AC149000, log, OS_LOG_TYPE_DEFAULT, "Found %lu potential orphan tracks to evaluate using query: %{public}@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v257 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v257[8] = 3221225472;
      *(_QWORD *)&v257[16] = __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke;
      v258 = &unk_1E5B65960;
      v52 = v51;
      v259 = v52;
      objc_msgSend(v189, "enumeratePersistentIDsUsingBlock:", v257);
      +[ML3PropertyPredicate predicateWithProperty:](ML3PropertyPredicate, "predicateWithProperty:", CFSTR("cloud_is_subscribed"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v256[0] = v53;
      +[ML3PropertyPredicate predicateWithProperty:](ML3PropertyPredicate, "predicateWithProperty:", CFSTR("cloud_is_curator_playlist"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v256[1] = v54;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v256, 2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AnyCompoundPredicate, "predicateMatchingPredicates:", v55);
      v177 = (void *)objc_claimAutoreleasedReturnValue();

      +[ML3Entity allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:](ML3Container, "allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:", v191, v177, MEMORY[0x1E0C9AA60], 0);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v56, OS_LOG_TYPE_DEFAULT, "Keeping the following tracks from subscribed containers...", buf, 2u);
      }

      *(_QWORD *)&v250 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v250 + 1) = 3221225472;
      v251 = (uint64_t)__ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke_9;
      v252 = &unk_1E5B61928;
      v211 = v191;
      v253 = v211;
      v200 = v181;
      v254 = v200;
      v57 = v52;
      v255 = v57;
      objc_msgSend(v175, "enumeratePersistentIDsUsingBlock:", &v250);
      -[ML3MusicLibrary currentDevicePlaybackHistoryPlaylist](v211, "currentDevicePlaybackHistoryPlaylist");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3Track containerQueryWithContainer:predicate:](ML3Track, "containerQueryWithContainer:predicate:", v174, v200);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v58, OS_LOG_TYPE_DEFAULT, "Keeping the following tracks from playback history...", buf, 2u);
      }

      v249 = CFSTR("item_extra.title");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v249, 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v244 = (__CFString *)MEMORY[0x1E0C809B0];
      v245 = 3221225472;
      v246 = __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke_11;
      v247 = &unk_1E5B62770;
      v196 = v57;
      v248 = v196;
      objc_msgSend(v173, "enumeratePersistentIDsAndProperties:usingBlock:", v59, &v244);

      objc_msgSend(v196, "allObjects");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v221 = 0u;
      v219 = 0u;
      v220 = 0u;
      v218 = 0u;
      v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v218, buf, 16);
      if (v60)
      {
        v61 = *(_QWORD *)v219;
        do
        {
          for (j = 0; j != v60; ++j)
          {
            if (*(_QWORD *)v219 != v61)
              objc_enumerationMutation(obja);
            v63 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Track, "newWithPersistentID:inLibrary:", objc_msgSend(*(id *)(*((_QWORD *)&v218 + 1) + 8 * j), "longLongValue"), v211);
            objc_msgSend(v63, "valueForProperty:", CFSTR("base_location_id"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v64, "longLongValue") > 0;

            if (v65)
            {
              v66 = os_log_create("com.apple.amp.medialibrary", "Default");
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                v67 = objc_msgSend(v63, "persistentID");
                objc_msgSend(v63, "valueForProperty:", CFSTR("item_extra.title"));
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v226 = 134218242;
                *(_QWORD *)&v226[4] = v67;
                *(_WORD *)&v226[12] = 2114;
                *(_QWORD *)&v226[14] = v68;
                _os_log_impl(&dword_1AC149000, v66, OS_LOG_TYPE_DEFAULT, "Removing assets for track: %lld - %{public}@", v226, 0x16u);

              }
            }

          }
          v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v218, buf, 16);
        }
        while (v60);
      }
      +[ML3Track unlinkRedownloadableAssetsFromLibrary:persistentIDs:deletionType:deletedFileSize:](ML3Track, "unlinkRedownloadableAssetsFromLibrary:persistentIDs:deletionType:deletedFileSize:", v211, obja, 2, 0);
      +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("item_stats.liked_state"), &unk_1E5BAAEF0, 2);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v243[0] = v69;
      v243[1] = v200;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v243, 2);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v70);
      v172 = (void *)objc_claimAutoreleasedReturnValue();

      +[ML3Entity allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:](ML3Track, "allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:", v211, v172, MEMORY[0x1E0C9AA60], 0);
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v226 = 0;
        _os_log_impl(&dword_1AC149000, v71, OS_LOG_TYPE_DEFAULT, "Keeping the following tracks from the love cache...", v226, 2u);
      }

      v242 = CFSTR("item_extra.title");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v242, 1);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v237 = (void *)MEMORY[0x1E0C809B0];
      v238 = 3221225472;
      v239 = __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke_13;
      v240 = &unk_1E5B62770;
      v73 = v196;
      v241 = v73;
      objc_msgSend(v171, "enumeratePersistentIDsAndProperties:usingBlock:", v72, &v237);

      +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("album.liked_state"), &unk_1E5BAAEF0, 2);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v236[0] = v74;
      v236[1] = v200;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v236, 2);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v75);
      v170 = (void *)objc_claimAutoreleasedReturnValue();

      +[ML3Entity allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:](ML3Track, "allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:", v211, v170, MEMORY[0x1E0C9AA60], 0);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v226 = 0;
        _os_log_impl(&dword_1AC149000, v76, OS_LOG_TYPE_DEFAULT, "Keeping the following tracks that are in albums from the love cache...", v226, 2u);
      }

      v235[0] = CFSTR("item_extra.title");
      v235[1] = CFSTR("album.album");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v235, 2);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v216[0] = MEMORY[0x1E0C809B0];
      v216[1] = 3221225472;
      v216[2] = __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke_14;
      v216[3] = &unk_1E5B62770;
      v78 = v73;
      v217 = v78;
      objc_msgSend(v169, "enumeratePersistentIDsAndProperties:usingBlock:", v77, v216);

      v179 = objc_msgSend(v78, "count");
      v79 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v226 = 134217984;
        *(_QWORD *)&v226[4] = v179;
        _os_log_impl(&dword_1AC149000, v79, OS_LOG_TYPE_DEFAULT, "Found %lu orphan tracks to delete.", v226, 0xCu);
      }

      activity = (xpc_activity_t)malloc_type_malloc(8 * v179, 0x100004000313F17uLL);
      v233 = 0u;
      v234 = 0u;
      v231 = 0u;
      v232 = 0u;
      log = v78;
      v80 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v231, v226, 16);
      if (v80)
      {
        v81 = 0;
        v82 = *(_QWORD *)v232;
        do
        {
          v83 = 0;
          v197 = v81;
          v84 = (char *)activity + 8 * v81;
          do
          {
            if (*(_QWORD *)v232 != v82)
              objc_enumerationMutation(log);
            v85 = objc_msgSend(*(id *)(*((_QWORD *)&v231 + 1) + 8 * v83), "longLongValue");
            *(_QWORD *)&v84[8 * v83] = v85;
            v86 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              v87 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Track, "newWithPersistentID:inLibrary:", v85, v211);
              objc_msgSend(v87, "valueForProperty:", CFSTR("item_extra.title"));
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v222 = 134218242;
              v223 = v85;
              v224 = 2114;
              v225 = v88;
              _os_log_impl(&dword_1AC149000, v86, OS_LOG_TYPE_DEFAULT, "Deleting track: %lld - %{public}@", v222, 0x16u);

            }
            ++v83;
          }
          while (v80 != v83);
          v80 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v231, v226, 16);
          v81 = v197 + v83;
        }
        while (v80);
      }

      +[ML3Track deleteFromLibrary:deletionType:persistentIDs:count:](ML3Track, "deleteFromLibrary:deletionType:persistentIDs:count:", v211, 2, activity, v179);
      free(activity);

    }
    else if (v50)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, log, OS_LOG_TYPE_DEFAULT, "No potential orphan tracks to evaluate at this time.", buf, 2u);
    }

    v90 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v90, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Removing orphaned assets", buf, 2u);
    }

    +[ML3MusicLibrary removeOrphanedTracks](ML3MusicLibrary, "removeOrphanedTracks");
    v91 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v91, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Cleaning up artwork for maintenance activity.", buf, 2u);
    }

    -[ML3MusicLibrary cleanupArtworkWithOptions:](self->_library, "cleanupArtworkWithOptions:", 30);
    v92 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v92, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Start maintenance activity to convert existing artwork to ASTC.", buf, 2u);
    }

    v93 = self->_activity;
    v185 = self->_library;
    activitya = v93;
    LOBYTE(v93) = CFPreferencesGetAppBooleanValue(CFSTR("EnableASTCEncoding"), CFSTR("com.apple.mobileipod"), 0) == 0;
    -[ML3MusicLibrary valueForDatabaseProperty:](v185, "valueForDatabaseProperty:", CFSTR("MLArtworkShouldConvertToASTC"));
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v93 & 1) == 0 && objc_msgSend(v183, "integerValue") == 1)
    {
      -[ML3MusicLibrary artworkDirectory](v185, "artworkDirectory");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3MusicLibrary pathForResourceFileOrFolder:](ML3MusicLibrary, "pathForResourceFileOrFolder:", 18);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v192, "fileExistsAtPath:", v180))
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v180);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v94 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v178, 1);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      loga = *MEMORY[0x1E0C999D0];
      *(_QWORD *)v257 = *MEMORY[0x1E0C999D0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v257, 1);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v176, v95, 4, 0);
      v96 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)&v231 = 0;
      *((_QWORD *)&v231 + 1) = &v231;
      *(_QWORD *)&v232 = 0x2020000000;
      BYTE8(v232) = 0;
      v218 = 0u;
      v219 = 0u;
      v220 = 0u;
      v221 = 0u;
      v97 = v96;
      v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v218, buf, 16);
      if (v98)
      {
        v198 = 0;
        objb = *(id *)v219;
        while (2)
        {
          v212 = v98;
          for (k = 0; k != v212; ++k)
          {
            if (*(id *)v219 != objb)
              objc_enumerationMutation(v97);
            v100 = *(void **)(*((_QWORD *)&v218 + 1) + 8 * k);
            v244 = 0;
            objc_msgSend(v100, "getResourceValue:forKey:error:", &v244, loga, 0);
            v101 = v244;
            if ((-[__CFString BOOLValue](v101, "BOOLValue") & 1) == 0)
            {
              objc_msgSend(v100, "absoluteString");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              v103 = objc_msgSend(v94, "containsObject:", v102);

              if (v103)
              {
                v104 = os_log_create("com.apple.amp.medialibrary", "Default");
                if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(v250) = 138543362;
                  *(_QWORD *)((char *)&v250 + 4) = v100;
                  _os_log_impl(&dword_1AC149000, v104, OS_LOG_TYPE_DEFAULT, "URL %{public}@ is in known list of paths that could not be converted to ASTC .. skipping.", (uint8_t *)&v250, 0xCu);
                }

              }
              else
              {
                objc_msgSend(v100, "lastPathComponent");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "UUIDString");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "stringByAppendingString:", v105);
                v201 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v100, "URLByDeletingLastPathComponent");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "URLByAppendingPathComponent:", v201);
                v109 = (void *)objc_claimAutoreleasedReturnValue();

                v110 = v97;
                v111 = v94;
                v112 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D018]), "initWithSourceURL:destinationURL:destinationFormat:", v100, v109, 2);
                v113 = dispatch_semaphore_create(0);
                objc_msgSend(MEMORY[0x1E0D4D008], "sharedService");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)v226 = MEMORY[0x1E0C809B0];
                *(_QWORD *)&v226[8] = 3221225472;
                *(_QWORD *)&v226[16] = __ML3MaintenanceUtilitiesConvertExistingArtworkToASTC_block_invoke;
                *(_QWORD *)&v226[24] = &unk_1E5B61950;
                *(_QWORD *)&v227 = v190;
                *((_QWORD *)&v227 + 1) = v100;
                v230 = &v231;
                *(_QWORD *)&v228 = v192;
                v115 = v109;
                *((_QWORD *)&v228 + 1) = v115;
                v116 = v113;
                v229 = v116;
                objc_msgSend(v114, "sendRequest:completionHandler:", v112, v226);

                v94 = v111;
                v97 = v110;
                dispatch_semaphore_wait(v116, 0xFFFFFFFFFFFFFFFFLL);

                v117 = v198 + 1;
                v118 = v198 != 4 || activitya == 0;
                if (v198 == 4)
                  v117 = 0;
                if (v118)
                {
                  v198 = v117;
                }
                else
                {
                  if (xpc_activity_should_defer(activitya))
                  {
                    if (!xpc_activity_set_state(activitya, 3))
                    {
                      v122 = os_log_create("com.apple.amp.medialibrary", "Default");
                      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                      {
                        LOWORD(v250) = 0;
                        _os_log_impl(&dword_1AC149000, v122, OS_LOG_TYPE_DEFAULT, "Error deferring artwork conversion activity as the conditions have changed.", (uint8_t *)&v250, 2u);
                      }

                    }
                    goto LABEL_109;
                  }
                  v198 = 0;
                }
              }
            }

          }
          v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v218, buf, 16);
          if (v98)
            continue;
          break;
        }
      }

      if (*(_BYTE *)(*((_QWORD *)&v231 + 1) + 24))
      {
LABEL_109:
        if (objc_msgSend(v190, "count"))
        {
          objc_msgSend(v180, "stringByDeletingLastPathComponent");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = objc_msgSend(v192, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v123, 1, 0, 0);

          if (v124)
          {
            if (v94)
              objc_msgSend(v190, "addObjectsFromArray:", v94);
            objc_msgSend(v190, "writeToFile:atomically:", v180, 1);
          }
        }
      }
      else
      {
        v119 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v250) = 0;
          _os_log_impl(&dword_1AC149000, v119, OS_LOG_TYPE_DEFAULT, "All artwork are converted to ASTC", (uint8_t *)&v250, 2u);
        }

        if (!-[ML3MusicLibrary deleteDatabaseProperty:](v185, "deleteDatabaseProperty:", CFSTR("MLArtworkShouldConvertToASTC")))
        {
          v120 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v250) = 0;
            _os_log_impl(&dword_1AC149000, v120, OS_LOG_TYPE_DEFAULT, "Error removing MLArtworkShouldConvertToASTC key.", (uint8_t *)&v250, 2u);
          }

        }
        if ((objc_msgSend(v192, "removeItemAtPath:error:", v180, 0) & 1) == 0)
        {
          v121 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v250) = 138543362;
            *(_QWORD *)((char *)&v250 + 4) = v180;
            _os_log_impl(&dword_1AC149000, v121, OS_LOG_TYPE_DEFAULT, "Error removing failed assets plist at %{public}@.", (uint8_t *)&v250, 0xCu);
          }

        }
      }
      _Block_object_dispose(&v231, 8);

    }
    v125 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v125, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Start maintenance activity to prune unused metadata", buf, 2u);
    }

    library = self->_library;
    v215[0] = MEMORY[0x1E0C809B0];
    v215[1] = 3221225472;
    v215[2] = __36__ML3MaintenanceTasksOperation_main__block_invoke;
    v215[3] = &unk_1E5B65580;
    v215[4] = self;
    -[ML3MusicLibrary performDatabaseTransactionWithBlock:](library, "performDatabaseTransactionWithBlock:", v215);
    v127 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v127, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Reconciling HLS Asset Size", buf, 2u);
    }

    if (v6 > 3600.0)
      v6 = v6 + -3600.0;
    v128 = self->_library;
    v129 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v6;
      _os_log_impl(&dword_1AC149000, v129, OS_LOG_TYPE_DEFAULT, "ML3MaintenanceUtilitiesReconcileHLSAssetSize: Starting reconcile. reconcileStartInterval=%f", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = CFSTR("base_location.path");
    *(_QWORD *)&v231 = CFSTR("base_location.path");
    v132 = CFSTR("item_extra.location");
    *((_QWORD *)&v231 + 1) = CFSTR("item_extra.location");
    v133 = CFSTR("item_extra.file_size");
    *(_QWORD *)&v232 = CFSTR("item_extra.file_size");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v231, 3);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("base_location_id"), &unk_1E5BAAF08, 6);
    v135 = (__CFString *)objc_claimAutoreleasedReturnValue();
    +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("base_location_id"), &unk_1E5BAAF20, 4);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = v135;
    v245 = (uint64_t)v136;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v244, 2);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v137);
    logb = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("item_stats.date_played"), v138, 4);
    v213 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("item_stats.date_accessed"), v139, 4);
    objc = (id)objc_claimAutoreleasedReturnValue();

    v237 = v213;
    v238 = (uint64_t)objc;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v237, 2);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AnyCompoundPredicate, "predicateMatchingPredicates:", v140);
    v202 = (void *)objc_claimAutoreleasedReturnValue();

    +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("item_video.hls_asset_traits"), &unk_1E5BAAEF0, 2);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v250 = logb;
    *((_QWORD *)&v250 + 1) = v141;
    v251 = (uint64_t)v202;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v250, 3);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();

    +[ML3Entity queryWithLibrary:predicate:](ML3Track, "queryWithLibrary:predicate:", v128, v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v226 = 0;
    *(_QWORD *)&v226[8] = v226;
    *(_QWORD *)&v226[16] = 0x2020000000;
    *(_QWORD *)&v226[24] = 0;
    *(_QWORD *)&v218 = 0;
    *((_QWORD *)&v218 + 1) = &v218;
    v219 = 0x2020000000uLL;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __ML3MaintenanceUtilitiesReconcileHLSAssetSize_block_invoke;
    v263 = &unk_1E5B61A00;
    v145 = v128;
    v264 = v145;
    v146 = v130;
    v265 = v146;
    v266 = v226;
    v267 = &v218;
    objc_msgSend(v144, "enumeratePersistentIDsAndProperties:usingBlock:", v134, buf);
    v147 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
    {
      v148 = *(_QWORD *)(*((_QWORD *)&v218 + 1) + 24);
      v149 = *(_QWORD *)(*(_QWORD *)&v226[8] + 24);
      *(_DWORD *)v257 = 134218240;
      *(_QWORD *)&v257[4] = v148;
      *(_WORD *)&v257[12] = 2048;
      *(_QWORD *)&v257[14] = v149;
      _os_log_impl(&dword_1AC149000, v147, OS_LOG_TYPE_DEFAULT, "ML3MaintenanceUtilitiesReconcileHLSAssetSize: Finished! Reconciled %llu tracks for a total discrepancy of %lld bytes", v257, 0x16u);
    }

    _Block_object_dispose(&v218, 8);
    _Block_object_dispose(v226, 8);

    for (m = 16; m != -8; m -= 8)
    v151 = self->_library;
    v152 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v152, "numberWithDouble:");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3MusicLibrary setValue:forDatabaseProperty:](v151, "setValue:forDatabaseProperty:", v153, CFSTR("MLMaintenanceTaskOperationDate"));

    v154 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v154, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Cleaning up old Cache", buf, 2u);
    }

    +[ML3MusicLibrary mediaFolderPathByAppendingPathComponent:](ML3MusicLibrary, "mediaFolderPathByAppendingPathComponent:", CFSTR("CloudAssets"));
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v156, "enumeratorAtPath:", v155);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "nextObject");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    if (v158)
    {
      v159 = 0;
      do
      {
        objc_msgSend(v155, "stringByAppendingPathComponent:", v158);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        v214 = v159;
        v161 = objc_msgSend(v156, "removeItemAtPath:error:", v160, &v214);
        v162 = v214;

        if ((v161 & 1) == 0)
        {
          v163 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v158;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v162;
            _os_log_impl(&dword_1AC149000, v163, OS_LOG_TYPE_ERROR, "Failed to remove cached asset %{public}@ error %{public}@", buf, 0x16u);
          }

        }
        objc_msgSend(v157, "nextObject");
        v164 = objc_claimAutoreleasedReturnValue();

        v158 = (void *)v164;
        v159 = v162;
      }
      while (v164);
    }
    else
    {
      v162 = 0;
    }
    v165 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v165, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Marking Purgeable Artwork", buf, 2u);
    }

    ML3MaintenanceUtilitiesMarkArtworkPurgeable(self->_library);
    v166 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v166, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] All maintenance completed.", buf, 2u);
    }

    v167 = self->_activity;
    if (v167 && !xpc_activity_set_state(v167, 5))
    {
      v168 = os_log_create("com.apple.amp.medialibrary", "Service");
      if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v168, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Failed to set state of maintenance activity to DONE.", buf, 2u);
      }

    }
    v89 = v186;
  }
  else
  {
    v89 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v188;
      _os_log_impl(&dword_1AC149000, v89, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Skipping maintenance because no file exists at path '%{public}@'", buf, 0xCu);
    }
  }

}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

uint64_t __36__ML3MaintenanceTasksOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  int v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "executeQuery:", CFSTR("SELECT COUNT() FROM album"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "int64ValueForFirstRowAndColumn");

  objc_msgSend(v3, "executeQuery:", CFSTR("SELECT COUNT(DISTINCT(album_pid)) FROM item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "int64ValueForFirstRowAndColumn");

  objc_msgSend(v3, "executeQuery:", CFSTR("SELECT COUNT() FROM album_artist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "int64ValueForFirstRowAndColumn");

  objc_msgSend(v3, "executeQuery:", CFSTR("SELECT COUNT(DISTINCT(album_artist_pid)) FROM item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "int64ValueForFirstRowAndColumn");

  objc_msgSend(v3, "executeQuery:", CFSTR("SELECT COUNT() FROM item_artist"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "int64ValueForFirstRowAndColumn");

  objc_msgSend(v3, "executeQuery:", CFSTR("SELECT COUNT(DISTINCT(item_artist_pid)) FROM item"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "int64ValueForFirstRowAndColumn");

  if (v5 >= 0)
    v16 = v5;
  else
    v16 = v5 + 1;
  if (v9 >= 0)
    v17 = v9;
  else
    v17 = v9 + 1;
  if (v13 >= 0)
    v18 = v13;
  else
    v18 = v13 + 1;
  if (v7 < v16 >> 1 || v11 < v17 >> 1 || v15 < v18 >> 1)
  {
    v19 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 134219264;
      v29 = v7;
      v30 = 2048;
      v31 = v5;
      v32 = 2048;
      v33 = v11;
      v34 = 2048;
      v35 = v9;
      v36 = 2048;
      v37 = v15;
      v38 = 2048;
      v39 = v13;
      _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Rebuilding collections (itemAlbumCount=%lld, totalAlbumCount=%lld, itemAlbumArtistCount=%lld, totalAlbumArtistCount=%lld, itemItemArtistCount=%lld, totalItemArtistCount=%lld)", (uint8_t *)&v28, 0x3Eu);
    }

    if (!+[ML3Collection removeOrphanedCollectionsInLibrary:usingConnection:](ML3Collection, "removeOrphanedCollectionsInLibrary:usingConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248), v3))goto LABEL_24;
  }
  objc_msgSend(v3, "executeQuery:", CFSTR("SELECT COUNT() FROM sort_map"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "int64ValueForFirstRowAndColumn");

  objc_msgSend(v3, "executeQuery:", CFSTR("SELECT COUNT() FROM sort_map WHERE name_order IN (SELECT title_order FROM item) OR name_order IN (SELECT item_artist_order FROM item) OR name_order IN (SELECT series_name_order FROM item) OR name_order IN (SELECT album_order FROM item) OR name_order IN (SELECT album_artist_order FROM item) OR name_order IN (SELECT genre_order FROM item) OR name_order IN (SELECT composer_order FROM item) OR name_order IN (SELECT name_order FROM container) OR name_order IN (SELECT search_title FROM item_search) OR name_order IN (SELECT search_album FROM item_search) OR name_order IN (SELECT search_artist FROM item_search) OR name_order in (SELECT search_composer FROM item_search) OR name_order IN (SELECT search_album_artist FROM item_search)"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "int64ValueForFirstRowAndColumn");

  v24 = v21 >= 0 ? v21 : v21 + 1;
  if (v23 >= v24 >> 1)
    goto LABEL_25;
  v25 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 134218240;
    v29 = v23;
    v30 = 2048;
    v31 = v21;
    _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Rebuilding sort map (usedSortMapEntryCount=%lld, totalSortMapEntryCount=%lld)", (uint8_t *)&v28, 0x16u);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "inTransactionUpdateSortMapOnConnection:forceRebuild:forceUpdateOriginals:", v3, 1, 1)&& objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "inTransactionUpdateSearchMapOnConnection:", v3))
  {
LABEL_25:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "performColorAnalysisForArtworkWithConnection:shouldRegenerateColorAnalysis:", v3, 0);
    v26 = 1;
  }
  else
  {
LABEL_24:
    v26 = 0;
  }

  return v26;
}

@end
