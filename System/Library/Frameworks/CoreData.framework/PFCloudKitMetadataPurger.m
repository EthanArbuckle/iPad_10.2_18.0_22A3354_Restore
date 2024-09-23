@implementation PFCloudKitMetadataPurger

- (BOOL)purgeMetadataFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 withOptions:(uint64_t)a5 forRecordZones:(uint64_t)a6 inDatabaseWithScope:(__CFString *)a7 andTransactionAuthor:(_QWORD *)a8 error:
{
  NSManagedObjectContext *v15;
  const __CFString *v16;
  _BOOL8 v17;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD v28[12];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__31;
  v33 = __Block_byref_object_dispose__31;
  v34 = 0;
  v15 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a3);
  if (-[__CFString length](a7, "length"))
    v16 = a7;
  else
    v16 = CFSTR("NSCloudKitMirroringDelegate.reset");
  -[NSManagedObjectContext setTransactionAuthor:](v15, "setTransactionAuthor:", v16);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __135__PFCloudKitMetadataPurger_purgeMetadataFromStore_inMonitor_withOptions_forRecordZones_inDatabaseWithScope_andTransactionAuthor_error___block_invoke;
  v28[3] = &unk_1E1EE02B0;
  v28[4] = a2;
  v28[5] = a5;
  v28[10] = a4;
  v28[11] = a6;
  v28[6] = v15;
  v28[7] = a1;
  v28[8] = &v35;
  v28[9] = &v29;
  -[NSManagedObjectContext performBlockAndWait:](v15, "performBlockAndWait:", v28);
  if (!*((_BYTE *)v36 + 24))
  {
    v19 = (id)v30[5];
    if (v19)
    {
      if (a8)
        *a8 = v19;
    }
    else
    {
      v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        v41 = 1024;
        v42 = 245;
        _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v30[5] = 0;
  v17 = *((_BYTE *)v36 + 24) != 0;
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v17;
}

void __135__PFCloudKitMetadataPurger_purgeMetadataFromStore_inMonitor_withOptions_forRecordZones_inDatabaseWithScope_andTransactionAuthor_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSManagedObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSFetchRequest *v32;
  void *v33;
  NSFetchRequest *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  void *v67;
  id v68;
  NSFetchRequest *v69;
  void *v70;
  uint64_t *v71;
  NSFetchRequest *v72;
  void *v73;
  NSFetchRequest *v74;
  void *v75;
  NSManagedObject *v76;
  char v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  id v87;
  int v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t j;
  void *v103;
  NSManagedObject *v104;
  NSManagedObject *v105;
  uint64_t v106;
  NSManagedObject *v107;
  NSManagedObject *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t k;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t m;
  uint64_t v122;
  id v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  id v159;
  uint8_t v160[8];
  uint64_t v161;
  void *v162;
  void *v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t *v166;
  uint64_t *v167;
  uint64_t *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  void *v172;
  id v173;
  uint64_t *v174;
  uint64_t *v175;
  uint64_t v176;
  uint64_t *v177;
  uint64_t v178;
  void (*v179)(uint64_t, uint64_t);
  void (*v180)(uint64_t);
  uint64_t v181;
  uint64_t v182;
  uint64_t *v183;
  uint64_t v184;
  char v185;
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  uint64_t v193;
  uint64_t v194;
  uint8_t buf[4];
  const char *v196;
  __int16 v197;
  int v198;
  id v199;
  _QWORD v200[4];

  v200[1] = *MEMORY[0x1E0C80C00];
  v159 = 0;
  v124 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v123 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(*(id *)(a1 + 32), "configurationName"));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", *(_QWORD *)(a1 + 40));
  v130 = a1;
  if ((*(_BYTE *)(a1 + 80) & 4) != 0)
  {
    v3 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), *(void **)(a1 + 48), (uint64_t)&v159);
    if (v3)
    {
      v157 = 0u;
      v158 = 0u;
      v155 = 0u;
      v156 = 0u;
      v4 = (void *)-[NSManagedObject recordZones](v3, "recordZones");
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v155, v192, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v156;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v156 != v6)
              objc_enumerationMutation(v4);
            v8 = -[NSCKRecordZoneMetadata createRecordZoneID](*(void **)(*((_QWORD *)&v155 + 1) + 8 * i));
            objc_msgSend(v2, "addObject:", v8);

          }
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v155, v192, 16);
        }
        while (v5);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
  }
  v9 = v130;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v130 + 64) + 8) + 24))
  {
    v10 = *(_QWORD *)(v130 + 80);
    if ((v10 & 1) == 0)
    {
      if ((v10 & 2) != 0)
      {
        if (!objc_msgSend(v2, "count"))
        {
          v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Asked to purge system fields without any zones from which to purge.");
          _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, v122);
          v18 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v160 = 0;
            _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: Asked to purge system fields without any zones from which to purge.", v160, 2u);
          }
        }
        v149 = 0u;
        v150 = 0u;
        v147 = 0u;
        v148 = 0u;
        v128 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v147, v190, 16);
        if (v128)
        {
          v126 = *(_QWORD *)v148;
LABEL_20:
          v19 = 0;
          while (1)
          {
            if (*(_QWORD *)v148 != v126)
              objc_enumerationMutation(v2);
            v20 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * v19);
            v21 = (void *)MEMORY[0x18D76B4E4]();
            v22 = (unint64_t)__ckLoggingOverride >= 3 ? 3 : __ckLoggingOverride;
            v23 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Purging system fields from data in zone: %@"));
            objc_msgSend(*(id *)(v130 + 48), "transactionAuthor");
            _NSCoreDataLog(v22, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:]_block_invoke");
            objc_autoreleasePoolPop(v21);
            if (!*(_QWORD *)(v130 + 56))
              break;
            v30 = *(void **)(v130 + 32);
            v31 = *(void **)(v130 + 48);
            v182 = 0;
            v183 = &v182;
            v184 = 0x2020000000;
            v185 = 1;
            v176 = 0;
            v177 = &v176;
            v178 = 0x3052000000;
            v179 = __Block_byref_object_copy__31;
            v180 = __Block_byref_object_dispose__31;
            v181 = 0;
            v32 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
            -[NSFetchRequest setReturnsObjectsAsFaults:](v32, "setReturnsObjectsAsFaults:", 0);
            -[NSFetchRequest setFetchBatchSize:](v32, "setFetchBatchSize:", 250);
            v33 = (void *)MEMORY[0x1E0CB3880];
            v122 = objc_msgSend(v20, "zoneName");
            objc_msgSend(v20, "ownerName");
            -[NSFetchRequest setPredicate:](v32, "setPredicate:", objc_msgSend(v33, "predicateWithFormat:", CFSTR("recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@")));
            v200[0] = v30;
            -[NSFetchRequest setAffectedStores:](v32, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v200, 1));
            *(_QWORD *)v160 = MEMORY[0x1E0C809B0];
            v161 = 3221225472;
            v162 = __135__PFCloudKitMetadataPurger__wipeSystemFieldsAndResetUploadStateForMetadataInZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke;
            v163 = &unk_1E1EE02D8;
            v164 = (uint64_t)v31;
            v165 = &v176;
            v166 = &v182;
            +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v32, v31, (uint64_t)v160);
            if (!*((_BYTE *)v183 + 24))
              goto LABEL_29;
            v34 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
            -[NSFetchRequest setReturnsObjectsAsFaults:](v34, "setReturnsObjectsAsFaults:", 0);
            -[NSFetchRequest setFetchBatchSize:](v34, "setFetchBatchSize:", 250);
            v35 = (void *)MEMORY[0x1E0CB3880];
            v122 = objc_msgSend(v20, "zoneName");
            objc_msgSend(v20, "ownerName");
            -[NSFetchRequest setPredicate:](v34, "setPredicate:", objc_msgSend(v35, "predicateWithFormat:", CFSTR("recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@")));
            v199 = v30;
            -[NSFetchRequest setAffectedStores:](v34, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v199, 1));
            v169 = MEMORY[0x1E0C809B0];
            v170 = 3221225472;
            v171 = __135__PFCloudKitMetadataPurger__wipeSystemFieldsAndResetUploadStateForMetadataInZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke_2;
            v172 = &unk_1E1EE02D8;
            v173 = v31;
            v174 = &v176;
            v175 = &v182;
            +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v34, v31, (uint64_t)&v169);
            if (!*((_BYTE *)v183 + 24))
            {
LABEL_29:
              v36 = (id)v177[5];
              if (v36)
              {
                v159 = v36;
              }
              else
              {
                v37 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                _NSCoreDataLog(17, v37, v38, v39, v40, v41, v42, v43, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
                v44 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v196 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
                  v197 = 1024;
                  v198 = 615;
                  _os_log_fault_impl(&dword_18A253000, v44, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                }
              }
            }

            v177[5] = 0;
            v45 = *((unsigned __int8 *)v183 + 24);
            _Block_object_dispose(&v176, 8);
            _Block_object_dispose(&v182, 8);
            if (!v45)
              break;
            if (v128 == ++v19)
            {
              v128 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v147, v190, 16);
              if (v128)
                goto LABEL_20;
              goto LABEL_71;
            }
          }
LABEL_70:
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v130 + 64) + 8) + 24) = 0;
        }
      }
      goto LABEL_71;
    }
    if (!objc_msgSend(v2, "count"))
    {
      v46 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Asked to purge user rows without any zones from which to purge.");
      _NSCoreDataLog(17, v46, v47, v48, v49, v50, v51, v52, v122);
      v53 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v160 = 0;
        _os_log_fault_impl(&dword_18A253000, v53, OS_LOG_TYPE_FAULT, "CoreData: Asked to purge user rows without any zones from which to purge.", v160, 2u);
      }
    }
    v153 = 0u;
    v154 = 0u;
    v151 = 0u;
    v152 = 0u;
    v129 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v151, v191, 16);
    if (!v129)
    {
LABEL_71:
      v9 = v130;
      if ((*(_BYTE *)(v130 + 81) & 1) != 0)
      {
        +[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateBypassHistoryOnExportKey"), 1, *(_QWORD *)(v130 + 32), *(void **)(v130 + 48), &v159);
        v9 = v130;
        if (v159 || (v90 = objc_msgSend(*(id *)(v130 + 48), "save:", &v159), v9 = v130, (v90 & 1) == 0))
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v9 + 64) + 8) + 24) = 0;
      }
      goto LABEL_75;
    }
    v125 = *(_QWORD *)v152;
LABEL_42:
    v54 = 0;
    while (1)
    {
      if (*(_QWORD *)v152 != v125)
        objc_enumerationMutation(v2);
      v55 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * v54);
      v56 = (void *)MEMORY[0x18D76B4E4]();
      if ((unint64_t)__ckLoggingOverride >= 3)
        v57 = 3;
      else
        v57 = __ckLoggingOverride;
      v58 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Removing cloud metadata and client rows in zone: %@"));
      objc_msgSend(*(id *)(v130 + 48), "transactionAuthor");
      _NSCoreDataLog(v57, v58, v59, v60, v61, v62, v63, v64, (uint64_t)"-[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:]_block_invoke");
      objc_autoreleasePoolPop(v56);
      v65 = *(uint64_t **)(v130 + 56);
      if (!v65)
        goto LABEL_70;
      v127 = *(_QWORD *)(v130 + 88);
      v66 = *(_QWORD *)(v130 + 32);
      v67 = *(void **)(v130 + 48);
      v182 = 0;
      v183 = &v182;
      v184 = 0x2020000000;
      v185 = 1;
      v176 = 0;
      v177 = &v176;
      v178 = 0x3052000000;
      v179 = __Block_byref_object_copy__31;
      v180 = __Block_byref_object_dispose__31;
      v181 = 0;
      v68 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v69 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
      v70 = (void *)MEMORY[0x1E0CB3880];
      v122 = objc_msgSend(v55, "zoneName");
      objc_msgSend(v55, "ownerName");
      -[NSFetchRequest setPredicate:](v69, "setPredicate:", objc_msgSend(v70, "predicateWithFormat:", CFSTR("recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@ AND entityId != NULL AND entityPK != NULL")));
      -[NSFetchRequest setPropertiesToFetch:](v69, "setPropertiesToFetch:", &unk_1E1F524D0);
      v200[0] = v66;
      -[NSFetchRequest setAffectedStores:](v69, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v200, 1));
      -[NSFetchRequest setFetchBatchSize:](v69, "setFetchBatchSize:", 1000);
      v169 = MEMORY[0x1E0C809B0];
      v170 = 3221225472;
      v171 = __113__PFCloudKitMetadataPurger__wipeUserRowsAndMetadataForZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke;
      v172 = &unk_1E1EE02D8;
      v173 = v68;
      v174 = &v182;
      v175 = &v176;
      +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v69, v67, (uint64_t)&v169);
      v199 = 0;
      v71 = v183;
      if (*((_BYTE *)v183 + 24))
      {
        *(_QWORD *)v160 = MEMORY[0x1E0C809B0];
        v161 = 3221225472;
        v162 = __113__PFCloudKitMetadataPurger__wipeUserRowsAndMetadataForZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke_2;
        v163 = &unk_1E1EE0300;
        v164 = v66;
        v165 = v65;
        v166 = (uint64_t *)v67;
        v167 = &v182;
        v168 = &v176;
        objc_msgSend(v68, "enumerateKeysAndObjectsUsingBlock:", v160);
        v71 = v183;
        if (*((_BYTE *)v183 + 24))
        {
          v72 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
          -[NSFetchRequest setReturnsObjectsAsFaults:](v72, "setReturnsObjectsAsFaults:", 0);
          -[NSFetchRequest setFetchBatchSize:](v72, "setFetchBatchSize:", 250);
          v73 = (void *)MEMORY[0x1E0CB3880];
          v122 = objc_msgSend(v55, "zoneName");
          objc_msgSend(v55, "ownerName");
          -[NSFetchRequest setPredicate:](v72, "setPredicate:", objc_msgSend(v73, "predicateWithFormat:", CFSTR("recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@")));
          v194 = v66;
          -[NSFetchRequest setAffectedStores:](v72, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v194, 1));
          if (!-[PFCloudKitMetadataPurger _purgeObjectsMatchingFetchRequest:fromStore:usingContext:error:](v72, v67, &v199))goto LABEL_56;
          v74 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
          -[NSFetchRequest setReturnsObjectsAsFaults:](v74, "setReturnsObjectsAsFaults:", 0);
          -[NSFetchRequest setFetchBatchSize:](v74, "setFetchBatchSize:", 250);
          v75 = (void *)MEMORY[0x1E0CB3880];
          v122 = objc_msgSend(v55, "zoneName");
          objc_msgSend(v55, "ownerName");
          -[NSFetchRequest setPredicate:](v74, "setPredicate:", objc_msgSend(v75, "predicateWithFormat:", CFSTR("recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@")));
          v193 = v66;
          -[NSFetchRequest setAffectedStores:](v74, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v193, 1));
          if (!-[PFCloudKitMetadataPurger _purgeObjectsMatchingFetchRequest:fromStore:usingContext:error:](v74, v67, &v199))
          {
LABEL_56:
            *((_BYTE *)v183 + 24) = 0;
            v78 = v199;
            goto LABEL_57;
          }
          v76 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v55, v127, v66, v67, (uint64_t)&v199);
          if (!v76)
          {
            v71 = v183;
LABEL_67:
            *((_BYTE *)v71 + 24) = 0;
            v78 = v199;
LABEL_57:
            v177[5] = (uint64_t)v78;
            v71 = v183;
            goto LABEL_58;
          }
          objc_msgSend(v67, "deleteObject:", v76);
          v77 = objc_msgSend(v67, "save:", &v199);
          v71 = v183;
          if ((v77 & 1) == 0)
            goto LABEL_67;
        }
      }
LABEL_58:
      if (!*((_BYTE *)v71 + 24))
      {
        if (v177[5])
        {
          v159 = (id)v177[5];
        }
        else
        {
          v79 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v79, v80, v81, v82, v83, v84, v85, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
          v86 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v196 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
            v197 = 1024;
            v198 = 485;
            _os_log_fault_impl(&dword_18A253000, v86, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
      }

      v87 = (id)v177[5];
      v177[5] = 0;
      v88 = *((unsigned __int8 *)v183 + 24);
      _Block_object_dispose(&v176, 8);
      _Block_object_dispose(&v182, 8);
      if (!v88)
        goto LABEL_70;
      if (v129 == ++v54)
      {
        v89 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v151, v191, 16);
        v129 = v89;
        if (v89)
          goto LABEL_42;
        goto LABEL_71;
      }
    }
  }
LABEL_75:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v9 + 64) + 8) + 24))
    goto LABEL_139;
  v91 = *(_QWORD *)(v130 + 80);
  if ((v91 & 0x20) != 0)
  {
    objc_msgSend(v124, "addObject:", CFSTR("NSCloudKitMirroringDelegateLastHistoryTokenKey"));
    v91 = *(_QWORD *)(v130 + 80);
  }
  if ((v91 & 0xC) != 0 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v130 + 64) + 8) + 24))
  {
    if ((v91 & 4) == 0)
    {
      if ((v91 & 8) != 0)
      {
        if (!objc_msgSend(v2, "count"))
        {
          v92 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Asked to purge zone metadata (trying to recreate after the purge) without any zones from which to purge.");
          _NSCoreDataLog(17, v92, v93, v94, v95, v96, v97, v98, v122);
          v99 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v160 = 0;
            _os_log_fault_impl(&dword_18A253000, v99, OS_LOG_TYPE_FAULT, "CoreData: Asked to purge zone metadata (trying to recreate after the purge) without any zones from which to purge.", v160, 2u);
          }
        }
        v137 = 0u;
        v138 = 0u;
        v135 = 0u;
        v136 = 0u;
        v100 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v135, v187, 16);
        if (v100)
        {
          v101 = *(_QWORD *)v136;
          while (1)
          {
            for (j = 0; j != v100; ++j)
            {
              if (*(_QWORD *)v136 != v101)
                objc_enumerationMutation(v2);
              v103 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * j);
              if (!-[PFCloudKitMetadataPurger _purgeZoneRelatedObjectsInZoneWithID:inDatabaseWithScope:withOptions:inStore:usingContext:error:](*(_QWORD *)(v130 + 56), v103, *(_QWORD *)(v130 + 80), *(_QWORD *)(v130 + 32), *(void **)(v130 + 48), &v159))
              {
                v106 = v130;
LABEL_96:
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v106 + 64) + 8) + 24) = 0;
                goto LABEL_101;
              }
              v104 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:createIfMissing:error:]((uint64_t)NSCKRecordZoneMetadata, v103, *(_QWORD *)(v130 + 88), *(_QWORD *)(v130 + 32), *(void **)(v130 + 48), 0, (uint64_t)&v159);
              v105 = v104;
              if (v104)
              {
                v106 = v130;
                if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v130 + 64) + 8) + 24))
                {
                  if ((*(_BYTE *)(v130 + 80) & 1) != 0)
                  {
                    objc_msgSend(*(id *)(v130 + 48), "deleteObject:", v104);
                  }
                  else
                  {
                    -[NSManagedObject setCurrentChangeToken:](v104, "setCurrentChangeToken:", 0);
                    -[NSManagedObject setHasRecordZone:](v105, "setHasRecordZone:", 0);
                    -[NSManagedObject setHasSubscription:](v105, "setHasSubscription:", 0);
                  }
                  v106 = v130;
                }
              }
              else
              {
                v106 = v130;
                if (v159)
                  goto LABEL_96;
              }
LABEL_101:
              if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v106 + 64) + 8) + 24))
                goto LABEL_125;
            }
            v100 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v135, v187, 16);
            if (!v100)
              goto LABEL_125;
          }
        }
      }
      goto LABEL_125;
    }
    v107 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, *(_QWORD *)(v130 + 88), *(_QWORD *)(v130 + 32), *(void **)(v130 + 48), (uint64_t)&v159);
    v108 = v107;
    if (v107)
    {
      -[NSManagedObject setCurrentChangeToken:](v107, "setCurrentChangeToken:", 0);
      -[NSManagedObject setHasSubscription:](v108, "setHasSubscription:", 0);
      v145 = 0u;
      v146 = 0u;
      v143 = 0u;
      v144 = 0u;
      v109 = (void *)-[NSManagedObject recordZones](v108, "recordZones");
      v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v143, v189, 16);
      if (v110)
      {
        v111 = *(_QWORD *)v144;
        do
        {
          for (k = 0; k != v110; ++k)
          {
            if (*(_QWORD *)v144 != v111)
              objc_enumerationMutation(v109);
            v113 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * k);
            objc_msgSend(v113, "setCurrentChangeToken:", 0);
            objc_msgSend(v113, "setHasRecordZone:", 0);
            objc_msgSend(v113, "setHasSubscription:", 0);
            objc_msgSend(v113, "setSupportsFetchChanges:", 0);
            objc_msgSend(v113, "setSupportsAtomicChanges:", 0);
            objc_msgSend(v113, "setSupportsRecordSharing:", 0);
          }
          v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v143, v189, 16);
        }
        while (v110);
      }
      if (objc_msgSend(*(id *)(v130 + 48), "save:", &v159))
      {
        v141 = 0u;
        v142 = 0u;
        v139 = 0u;
        v140 = 0u;
        v114 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v139, v188, 16);
        if (!v114)
          goto LABEL_125;
        v115 = *(_QWORD *)v140;
LABEL_116:
        v116 = 0;
        while (1)
        {
          if (*(_QWORD *)v140 != v115)
            objc_enumerationMutation(v2);
          if (!-[PFCloudKitMetadataPurger _purgeZoneRelatedObjectsInZoneWithID:inDatabaseWithScope:withOptions:inStore:usingContext:error:](*(_QWORD *)(v130 + 56), *(void **)(*((_QWORD *)&v139 + 1) + 8 * v116), *(_QWORD *)(v130 + 80), *(_QWORD *)(v130 + 32), *(void **)(v130 + 48), &v159))break;
          if (v114 == ++v116)
          {
            v114 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v139, v188, 16);
            if (!v114)
              goto LABEL_125;
            goto LABEL_116;
          }
        }
      }
    }
    else if (!v159)
    {
      goto LABEL_125;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v130 + 64) + 8) + 24) = 0;
  }
LABEL_125:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v130 + 64) + 8) + 24))
  {
    if ((*(_BYTE *)(v130 + 80) & 0x10) == 0
      || (objc_msgSend(v124, "addObject:", CFSTR("NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey")),
          objc_msgSend(v124, "addObject:", CFSTR("NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey")),
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v130 + 64) + 8) + 24)))
    {
      if (objc_msgSend(v124, "count"))
      {
        v117 = +[NSCKMetadataEntry entriesForKeys:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, objc_msgSend(v124, "allObjects"), *(_QWORD *)(v130 + 32), *(void **)(v130 + 48), (uint64_t)&v159);
        if (v117)
        {
          v133 = 0u;
          v134 = 0u;
          v131 = 0u;
          v132 = 0u;
          v118 = (void *)objc_msgSend(v117, "allValues");
          v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v131, v186, 16);
          if (v119)
          {
            v120 = *(_QWORD *)v132;
            do
            {
              for (m = 0; m != v119; ++m)
              {
                if (*(_QWORD *)v132 != v120)
                  objc_enumerationMutation(v118);
                objc_msgSend(*(id *)(v130 + 48), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * m));
              }
              v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v131, v186, 16);
            }
            while (v119);
          }
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v130 + 64) + 8) + 24) = 0;
        }
      }
    }
  }
LABEL_139:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v130 + 64) + 8) + 24)
    || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v130 + 64) + 8) + 24) = objc_msgSend(*(id *)(v130 + 48), "save:", &v159)) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v130 + 72) + 8) + 40) = v159;
  }

}

- (uint64_t)_purgeZoneRelatedObjectsInZoneWithID:(uint64_t)a1 inDatabaseWithScope:(void *)a2 withOptions:(char)a3 inStore:(uint64_t)a4 usingContext:(void *)a5 error:(_QWORD *)a6
{
  NSFetchRequest *v11;
  NSFetchRequest *v12;
  NSFetchRequest *v13;
  uint64_t v14;
  NSBatchDeleteRequest *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v26 = 0;
  if ((a3 & 0x41) != 0)
  {
    v11 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
    -[NSFetchRequest setFetchBatchSize:](v11, "setFetchBatchSize:", 1000);
    -[NSFetchRequest setPredicate:](v11, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@"), objc_msgSend(a2, "zoneName"), objc_msgSend(a2, "ownerName")));
    v34[0] = a4;
    -[NSFetchRequest setAffectedStores:](v11, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1));
    if (!-[PFCloudKitMetadataPurger _purgeObjectsMatchingFetchRequest:fromStore:usingContext:error:](v11, a5, &v26))goto LABEL_7;
  }
  if ((a3 & 0x81) == 0)
    return 1;
  v12 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
  -[NSFetchRequest setFetchBatchSize:](v12, "setFetchBatchSize:", 1000);
  -[NSFetchRequest setPredicate:](v12, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@"), objc_msgSend(a2, "zoneName"), objc_msgSend(a2, "ownerName")));
  v33 = a4;
  -[NSFetchRequest setAffectedStores:](v12, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1));
  if (!-[PFCloudKitMetadataPurger _purgeObjectsMatchingFetchRequest:fromStore:usingContext:error:](v12, a5, &v26))goto LABEL_7;
  v13 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKImportPendingRelationship entityPath]());
  -[NSFetchRequest setPredicate:](v13, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("recordZoneName = %@ AND recordZoneOwnerName = %@"), objc_msgSend(a2, "zoneName"), objc_msgSend(a2, "ownerName")));
  v32 = a4;
  v14 = 1;
  -[NSFetchRequest setAffectedStores:](v13, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1));
  v15 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", v13);
  -[NSBatchDeleteRequest setResultType:](v15, "setResultType:", 0);
  v31 = a4;
  -[NSPersistentStoreRequest setAffectedStores:](v15, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1));
  -[NSBatchDeleteRequest setResultType:](v15, "setResultType:", 0);
  v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "executeRequest:error:", v15, &v26), "result"), "BOOLValue");

  if ((v16 & 1) == 0)
  {
LABEL_7:
    if (v26)
    {
      if (a6)
      {
        v14 = 0;
        *a6 = v26;
        return v14;
      }
    }
    else
    {
      v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      v24 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        v29 = 1024;
        v30 = 676;
        _os_log_fault_impl(&dword_18A253000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    return 0;
  }
  return v14;
}

- (BOOL)purgeMetadataMatchingObjectIDs:(uint64_t)a3 inRequest:(uint64_t)a4 inStore:(uint64_t)a5 withMonitor:(_QWORD *)a6 error:
{
  NSManagedObjectContext *v9;
  _BOOL8 v10;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[9];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__31;
  v26 = __Block_byref_object_dispose__31;
  v27 = 0;
  v9 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a5);
  -[NSManagedObjectContext setMergePolicy:](v9, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __95__PFCloudKitMetadataPurger_purgeMetadataMatchingObjectIDs_inRequest_inStore_withMonitor_error___block_invoke;
  v21[3] = &unk_1E1EDF498;
  v21[4] = a2;
  v21[5] = a4;
  v21[6] = v9;
  v21[7] = &v28;
  v21[8] = &v22;
  -[NSManagedObjectContext performBlockAndWait:](v9, "performBlockAndWait:", v21);

  if (!*((_BYTE *)v29 + 24))
  {
    v12 = (id)v23[5];
    if (v12)
    {
      if (a6)
        *a6 = v12;
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        v34 = 1024;
        v35 = 329;
        _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v23[5] = 0;
  v10 = *((_BYTE *)v29 + 24) != 0;
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v10;
}

void __95__PFCloudKitMetadataPurger_purgeMetadataMatchingObjectIDs_inRequest_inStore_withMonitor_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSFetchRequest *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  NSFetchRequest *v20;
  NSBatchDeleteRequest *v21;
  id v22;
  id v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  void *context;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  _QWORD v42[2];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = +[PFCloudKitMetadataModel createMapOfEntityIDToPrimaryKeySetForObjectIDs:fromStore:](PFCloudKitMetadataModel, "createMapOfEntityIDToPrimaryKeySetForObjectIDs:fromStore:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v2;
  v26 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v38;
LABEL_3:
    v3 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v25)
        objc_enumerationMutation(obj);
      v4 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v3);
      context = (void *)MEMORY[0x18D76B4E4]();
      v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v6 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
      -[NSFetchRequest setPredicate:](v6, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("entityId = %@ AND entityPK IN %@"), v4, objc_msgSend(obj, "objectForKey:", v4)));
      -[NSFetchRequest setFetchBatchSize:](v6, "setFetchBatchSize:", 100);
      v45 = *(_QWORD *)(a1 + 40);
      -[NSFetchRequest setAffectedStores:](v6, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1));
      v7 = (void *)objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      if (v7)
      {
        v8 = v7;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v34 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              if (objc_msgSend(v13, "ckRecordName"))
                objc_msgSend(v5, "addObject:", objc_msgSend(v13, "ckRecordName"));
              objc_msgSend((id)objc_msgSend(v13, "recordZone"), "setCurrentChangeToken:", 0);
              objc_msgSend((id)objc_msgSend(v13, "recordZone"), "setLastFetchDate:", 0);
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "recordZone"), "database"), "setCurrentChangeToken:", 0);
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "recordZone"), "database"), "setLastFetchDate:", 0);
              objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v13);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
          }
          while (v10);
        }
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        v14 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v42[0] = +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath");
        v42[1] = +[NSCKImportPendingRelationship entityPath]();
        v15 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v30;
          while (2)
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v30 != v18)
                objc_enumerationMutation(v15);
              v20 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
              -[NSFetchRequest setPredicate:](v20, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("recordName IN %@ OR relatedRecordName IN %@"), v5, v5));
              v21 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", v20);
              -[NSBatchDeleteRequest setResultType:](v21, "setResultType:", 0);
              v41 = *(_QWORD *)(a1 + 40);
              -[NSPersistentStoreRequest setAffectedStores:](v21, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1));
              -[NSBatchDeleteRequest setResultType:](v21, "setResultType:", 0);
              if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v21, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "result"), "BOOLValue") & 1) == 0)
              {
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
                v22 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);

                goto LABEL_29;
              }

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
            if (v17)
              continue;
            break;
          }
        }
      }
LABEL_29:
      if ((objc_msgSend(*(id *)(a1 + 48), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) & 1) == 0)
      {
        v23 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      }
      objc_msgSend(*(id *)(a1 + 48), "reset");

      v24 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      objc_autoreleasePoolPop(context);
      if (!v24)
        break;
      if (++v3 == v26)
      {
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (v26)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __113__PFCloudKitMetadataPurger__wipeUserRowsAndMetadataForZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
    *a4 = 1;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(a2);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (!v9
            || (v14 = objc_msgSend(v9, "integerValue"),
                v14 != objc_msgSend((id)objc_msgSend(v13, "entityId"), "integerValue")))
          {

            v9 = (id)objc_msgSend(v13, "entityId");
            v15 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
            if (v15)
            {
              v10 = v15;
            }
            else
            {
              v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v10, objc_msgSend(v13, "entityId"));
            }
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(v13, "entityPK"));
        }
        v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }

  }
}

void __113__PFCloudKitMetadataPurger__wipeUserRowsAndMetadataForZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE buf[12];
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = (void *)_sqlCoreLookupSQLEntityForEntityID(*(void **)(a1 + 32), objc_msgSend(a2, "unsignedLongValue"));
  if (v8)
  {
    v9 = v8;
    v39 = a4;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v41;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(a3);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v14);
        if (objc_msgSend(v15, "longValue") < 1)
        {
          v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Cannot create objectID: got a 0 pk for entity: %@");
          v18 = objc_msgSend((id)objc_msgSend(v9, "entityDescription"), "name");
          _NSCoreDataLog(17, v17, v19, v20, v21, v22, v23, v24, v18);
          v25 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v27 = objc_msgSend((id)objc_msgSend(v9, "entityDescription"), "name");
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v27;
            _os_log_fault_impl(&dword_18A253000, v25, OS_LOG_TYPE_FAULT, "CoreData: Cannot create objectID: got a 0 pk for entity: %@", buf, 0xCu);
          }
        }
        else
        {
          v16 = (void *)objc_msgSend(*(id *)(a1 + 32), "newObjectIDForEntity:pk:", v9, objc_msgSend(v15, "longValue"));
          objc_msgSend(v10, "addObject:", v16);

        }
        if ((unint64_t)objc_msgSend(v10, "count") >= 0x1F4)
        {
          v26 = (void *)MEMORY[0x18D76B4E4]();
          *(_QWORD *)buf = 0;
          if ((-[PFCloudKitMetadataPurger _purgeBatchOfObjectIDs:fromStore:inManagedObjectContext:error:](*(_QWORD *)(a1 + 40), v10, *(_QWORD *)(a1 + 32), *(void **)(a1 + 48), (uint64_t)buf) & 1) == 0)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = *(id *)buf;
          }
          objc_autoreleasePoolPop(v26);
        }
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          if (v12)
            goto LABEL_4;
          break;
        }
      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) && objc_msgSend(v10, "count"))
    {
      v28 = (void *)MEMORY[0x18D76B4E4]();
      *(_QWORD *)buf = 0;
      if ((-[PFCloudKitMetadataPurger _purgeBatchOfObjectIDs:fromStore:inManagedObjectContext:error:](*(_QWORD *)(a1 + 40), v10, *(_QWORD *)(a1 + 32), *(void **)(a1 + 48), (uint64_t)buf) & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = *(id *)buf;
      }
      objc_autoreleasePoolPop(v28);
    }

    a4 = v39;
  }
  else
  {
    v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Cannot create objectID. Unable to find entity with id '%@' in store '%@'\n%@");
    _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)a2);
    v36 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v37 = *(_QWORD *)(a1 + 32);
      v38 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = a2;
      v45 = 2112;
      v46 = v37;
      v47 = 2112;
      v48 = v38;
      _os_log_fault_impl(&dword_18A253000, v36, OS_LOG_TYPE_FAULT, "CoreData: Cannot create objectID. Unable to find entity with id '%@' in store '%@'\n%@", buf, 0x20u);
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a4 = 1;
}

- (uint64_t)_purgeBatchOfObjectIDs:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:
{
  NSFetchRequest *v9;
  NSBatchDeleteRequest *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v9 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "anyObject"), "entity"), "name"));
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@"), a2));
  v10 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", v9);
  -[NSBatchDeleteRequest setResultType:](v10, "setResultType:", 0);
  v13[0] = a3;
  -[NSPersistentStoreRequest setAffectedStores:](v10, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1));
  v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "executeRequest:error:", v10, a5), "result"), "BOOLValue");

  return v11;
}

- (uint64_t)_purgeObjectsMatchingFetchRequest:(_QWORD *)a3 fromStore:usingContext:error:
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__31;
  v20 = __Block_byref_object_dispose__31;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__PFCloudKitMetadataPurger__purgeObjectsMatchingFetchRequest_fromStore_usingContext_error___block_invoke;
  v15[3] = &unk_1E1EE02D8;
  v15[4] = a2;
  v15[5] = &v16;
  v15[6] = &v22;
  +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, a1, a2, (uint64_t)v15);
  if (!*((_BYTE *)v23 + 24))
  {
    v6 = (id)v17[5];
    if (v6)
    {
      if (a3)
        *a3 = v6;
    }
    else
    {
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      v14 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        v28 = 1024;
        v29 = 542;
        _os_log_fault_impl(&dword_18A253000, v14, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v17[5] = 0;
  v4 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v4;
}

uint64_t __91__PFCloudKitMetadataPurger__purgeObjectsMatchingFetchRequest_fromStore_usingContext_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4, _BYTE *a5)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    result = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(a2);
          objc_msgSend(*(id *)(a1 + 32), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }
    result = objc_msgSend(*(id *)(a1 + 32), "hasChanges");
    if ((_DWORD)result)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if ((result & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        result = (uint64_t)*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        *a4 = 1;
        *a5 = 1;
      }
    }
  }
  return result;
}

uint64_t __135__PFCloudKitMetadataPurger__wipeSystemFieldsAndResetUploadStateForMetadataInZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    result = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(a2);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v12, "setEncodedRecord:", 0);
          objc_msgSend(v12, "setCkRecordSystemFields:", 0);
          objc_msgSend(v12, "setCkShare:", 0);
        }
        v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
    result = objc_msgSend(*(id *)(a1 + 32), "hasChanges");
    if ((_DWORD)result)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if ((result & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        result = (uint64_t)*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        *a4 = 1;
      }
    }
  }
  return result;
}

uint64_t __135__PFCloudKitMetadataPurger__wipeSystemFieldsAndResetUploadStateForMetadataInZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    result = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      v11 = MEMORY[0x1E0C9AAA0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(a2);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v13, "setCkRecordSystemFields:", 0);
          objc_msgSend(v13, "setIsUploaded:", v11);
        }
        v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
    result = objc_msgSend(*(id *)(a1 + 32), "hasChanges");
    if ((_DWORD)result)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if ((result & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        result = (uint64_t)*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        *a4 = 1;
      }
    }
  }
  return result;
}

- (BOOL)purgeMetadataAfterAccountChangeFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 inDatabaseWithScope:(_QWORD *)a5 error:
{
  NSManagedObjectContext *v8;
  _BOOL8 v9;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[9];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__31;
  v25 = __Block_byref_object_dispose__31;
  v26 = 0;
  v8 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a3);
  -[NSManagedObjectContext setTransactionAuthor:](v8, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.reset"));
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __105__PFCloudKitMetadataPurger_purgeMetadataAfterAccountChangeFromStore_inMonitor_inDatabaseWithScope_error___block_invoke;
  v20[3] = &unk_1E1EDFC90;
  v20[4] = a2;
  v20[5] = v8;
  v20[6] = &v27;
  v20[7] = &v21;
  v20[8] = a4;
  -[NSManagedObjectContext performBlockAndWait:](v8, "performBlockAndWait:", v20);
  if (!*((_BYTE *)v28 + 24))
  {
    v11 = (id)v22[5];
    if (v11)
    {
      if (a5)
        *a5 = v11;
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        v33 = 1024;
        v34 = 795;
        _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v22[5] = 0;
  v9 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v9;
}

void __105__PFCloudKitMetadataPurger_purgeMetadataAfterAccountChangeFromStore_inMonitor_inDatabaseWithScope_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSBatchDeleteRequest *v17;
  void *PFBundleVersion;
  NSManagedObjectModel *v19;
  id v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *v23;
  objc_class *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  NSBatchDeleteRequest *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _BOOL8 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSManagedObject *v51;
  NSManagedObject *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t m;
  id obj;
  NSManagedObjectModel *v66;
  void *context;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84;
  _BYTE v85[128];
  _QWORD v86[3];
  _BYTE v87[128];
  uint64_t v88;
  const __CFString *v89;
  void *v90;
  uint64_t v91;
  _BYTE v92[128];
  uint64_t v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v84 = 0;
  v2 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(*(id *)(a1 + 32), "configurationName"));
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v2;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v81;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v81 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x18D76B4E4]();
        if ((unint64_t)__ckLoggingOverride >= 3)
          v9 = 3;
        else
          v9 = __ckLoggingOverride;
        v10 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Removing rows after account change: %@"));
        objc_msgSend(*(id *)(a1 + 40), "transactionAuthor");
        objc_msgSend(v7, "name");
        _NSCoreDataLog(v9, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitMetadataPurger purgeMetadataAfterAccountChangeFromStore:inMonitor:inDatabaseWithScope:error:]_block_invoke");
        objc_autoreleasePoolPop(v8);
        v17 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", objc_msgSend(v7, "name")));
        v93 = *(_QWORD *)(a1 + 32);
        -[NSPersistentStoreRequest setAffectedStores:](v17, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1));
        -[NSBatchDeleteRequest setResultType:](v17, "setResultType:", 0);
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "executeRequest:error:", v17, &v84), "result"), "BOOLValue") & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

          goto LABEL_14;
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_14:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    PFBundleVersion = (void *)+[_PFRoutines _getPFBundleVersionNumber]();
    v19 = +[PFCloudKitMetadataModel newMetadataModelForFrameworkVersion:]((uint64_t)PFCloudKitMetadataModel, PFBundleVersion);
    v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v21 = (objc_class *)objc_opt_class();
    objc_msgSend(v20, "addObject:", NSStringFromClass(v21));
    v22 = (objc_class *)objc_opt_class();
    objc_msgSend(v20, "addObject:", NSStringFromClass(v22));
    v23 = (objc_class *)objc_opt_class();
    objc_msgSend(v20, "addObject:", NSStringFromClass(v23));
    v24 = (objc_class *)objc_opt_class();
    objc_msgSend(v20, "addObject:", NSStringFromClass(v24));
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v66 = v19;
    v25 = -[NSManagedObjectModel countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v77;
      while (2)
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v77 != v27)
            objc_enumerationMutation(v66);
          v29 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
          if ((objc_msgSend(v20, "containsObject:", objc_msgSend(v29, "name")) & 1) == 0)
          {
            v30 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", _PFModelMapPathForEntity(v29)));
            -[NSBatchDeleteRequest setResultType:](v30, "setResultType:", 1);
            v91 = *(_QWORD *)(a1 + 32);
            -[NSPersistentStoreRequest setAffectedStores:](v30, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1));
            v31 = (void *)objc_msgSend(*(id *)(a1 + 40), "executeRequest:error:", v30, &v84);

            if (!objc_msgSend(v31, "result"))
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
              v42 = (void *)MEMORY[0x18D76B4E4]();
              v43 = __ckLoggingOverride != 0;
              v44 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to purge cloudkit metadata entity (%@): %@"));
              objc_msgSend(v29, "name");
              _NSCoreDataLog(v43, v44, v45, v46, v47, v48, v49, v50, (uint64_t)"-[PFCloudKitMetadataPurger purgeMetadataAfterAccountChangeFromStore:inMonitor:inDatabaseWithScope:error:]_block_invoke");
              objc_autoreleasePoolPop(v42);
              goto LABEL_31;
            }
            context = (void *)MEMORY[0x18D76B4E4]();
            if ((unint64_t)__ckLoggingOverride >= 3)
              v32 = 3;
            else
              v32 = __ckLoggingOverride;
            v33 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Removed cloud metadata after account change %@"));
            objc_msgSend(*(id *)(a1 + 40), "transactionAuthor");
            objc_msgSend(v29, "name");
            _NSCoreDataLog(v32, v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[PFCloudKitMetadataPurger purgeMetadataAfterAccountChangeFromStore:inMonitor:inDatabaseWithScope:error:]_block_invoke");
            objc_autoreleasePoolPop(context);
            v40 = (void *)objc_msgSend(v31, "result");
            if (objc_msgSend(v40, "count"))
            {
              v89 = CFSTR("deleted");
              v90 = v40;
              v41 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
              v88 = *(_QWORD *)(a1 + 40);
              +[NSManagedObjectContext mergeChangesFromRemoteContextSave:intoContexts:](NSManagedObjectContext, "mergeChangesFromRemoteContextSave:intoContexts:", v41, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1));
            }
          }
        }
        v26 = -[NSManagedObjectModel countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
        if (v26)
          continue;
        break;
      }
    }
LABEL_31:

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v51 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)&v84);
      if (v51)
      {
        v52 = v51;
        -[NSManagedObject setCurrentChangeToken:](v51, "setCurrentChangeToken:", 0);
        -[NSManagedObject setHasSubscription:](v52, "setHasSubscription:", 0);
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v53 = (void *)-[NSManagedObject recordZones](v52, "recordZones");
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v73;
          do
          {
            for (k = 0; k != v55; ++k)
            {
              if (*(_QWORD *)v73 != v56)
                objc_enumerationMutation(v53);
              v58 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
              objc_msgSend(v58, "setCurrentChangeToken:", 0);
              objc_msgSend(v58, "setHasRecordZone:", 0);
              objc_msgSend(v58, "setHasSubscription:", 0);
              objc_msgSend(v58, "setSupportsFetchChanges:", 0);
              objc_msgSend(v58, "setSupportsAtomicChanges:", 0);
              objc_msgSend(v58, "setSupportsRecordSharing:", 0);
            }
            v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
          }
          while (v55);
        }
      }
      else if (v84)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      }
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v86[0] = CFSTR("NSCloudKitMirroringDelegateLastHistoryTokenKey");
    v86[1] = CFSTR("NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey");
    v86[2] = CFSTR("NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey");
    v59 = +[NSCKMetadataEntry entriesForKeys:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 3), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)&v84);
    if (v59)
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v60 = (void *)objc_msgSend(v59, "allValues");
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
      if (v61)
      {
        v62 = v61;
        v63 = *(_QWORD *)v69;
        do
        {
          for (m = 0; m != v62; ++m)
          {
            if (*(_QWORD *)v69 != v63)
              objc_enumerationMutation(v60);
            objc_msgSend(*(id *)(a1 + 40), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * m));
          }
          v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
        }
        while (v62);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "save:", &v84)) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v84;
  }

}

- (BOOL)deleteZoneMetadataFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 forRecordZones:(uint64_t)a5 inDatabaseWithScope:(_QWORD *)a6 error:
{
  NSManagedObjectContext *v10;
  _BOOL8 v11;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[10];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__31;
  v27 = __Block_byref_object_dispose__31;
  v28 = 0;
  v10 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a3);
  -[NSManagedObjectContext setTransactionAuthor:](v10, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.reset"));
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __107__PFCloudKitMetadataPurger_deleteZoneMetadataFromStore_inMonitor_forRecordZones_inDatabaseWithScope_error___block_invoke;
  v22[3] = &unk_1E1EDF960;
  v22[4] = a4;
  v22[5] = a2;
  v22[6] = v10;
  v22[7] = &v29;
  v22[8] = &v23;
  v22[9] = a5;
  -[NSManagedObjectContext performBlockAndWait:](v10, "performBlockAndWait:", v22);
  if (!*((_BYTE *)v30 + 24))
  {
    v13 = (id)v24[5];
    if (v13)
    {
      if (a6)
        *a6 = v13;
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        v35 = 1024;
        v36 = 849;
        _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v24[5] = 0;
  v11 = *((_BYTE *)v30 + 24) != 0;
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v11;
}

void __107__PFCloudKitMetadataPurger_deleteZoneMetadataFromStore_inMonitor_forRecordZones_inDatabaseWithScope_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSManagedObject *v16;
  NSManagedObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v34 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(v2, "count"))
  {
    v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Asked to purge zone metadata (trying to recreate after the purge) without any zones from which to purge.");
    _NSCoreDataLog(17, v3, v4, v5, v6, v7, v8, v9, v29);
    v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18A253000, v10, OS_LOG_TYPE_FAULT, "CoreData: Asked to purge zone metadata (trying to recreate after the purge) without any zones from which to purge.", buf, 2u);
    }
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
LABEL_6:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v13)
        objc_enumerationMutation(v2);
      v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
      v16 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v15, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v34);
      if (v16)
      {
        v17 = v16;
        if (objc_msgSend((id)-[NSManagedObject records](v16, "records"), "count"))
        {
          v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Attempting to delete a zone metadata that has records (%ld): %@ - %@");
          v19 = *(_QWORD *)(a1 + 72);
          objc_msgSend(*(id *)(a1 + 40), "URL");
          _NSCoreDataLog(17, v18, v20, v21, v22, v23, v24, v25, v19);
          v26 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v27 = *(_QWORD *)(a1 + 72);
            v28 = objc_msgSend(*(id *)(a1 + 40), "URL");
            *(_DWORD *)buf = 134218498;
            v36 = v27;
            v37 = 2112;
            v38 = v28;
            v39 = 2112;
            v40 = v15;
            _os_log_fault_impl(&dword_18A253000, v26, OS_LOG_TYPE_FAULT, "CoreData: Attempting to delete a zone metadata that has records (%ld): %@ - %@", buf, 0x20u);
          }
        }
        objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v17);
      }
      else if (v34)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      }
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
        if (v12)
          goto LABEL_6;
        break;
      }
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "save:", &v34)) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v34;
  }

}

@end
