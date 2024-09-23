@implementation PFCloudKitMetadataModelMigrator

- (PFCloudKitMetadataModelMigrator)initWithStore:(id)a3 metadataContext:(id)a4 databaseScope:(int64_t)a5 metricsClient:(id)a6
{
  PFCloudKitMetadataModelMigrator *v10;
  NSManagedObjectContext *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PFCloudKitMetadataModelMigrator;
  v10 = -[PFCloudKitMetadataModelMigrator init](&v13, sel_init);
  if (v10)
  {
    v10->_store = (NSSQLCore *)a3;
    v11 = (NSManagedObjectContext *)a4;
    v10->_metadataContext = v11;
    -[NSManagedObjectContext setTransactionAuthor:](v11, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.migration"));
    v10->_context = objc_alloc_init(PFCloudKitMetadataMigrationContext);
    v10->_databaseScope = a5;
    v10->_metricsClient = (PFCloudKitMetricsClient *)a6;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitMetadataModelMigrator;
  -[PFCloudKitMetadataModelMigrator dealloc](&v3, sel_dealloc);
}

uint64_t __70__PFCloudKitMetadataModelMigrator_prepareContextWithConnection_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  int v8;
  int v9;

  result = objc_msgSend(*(id *)(a1 + 32), "entityNamed:", a2);
  if (a3)
  {
    v8 = *(_DWORD *)(a3 + 184);
    if (result)
    {
LABEL_3:
      v9 = *(_DWORD *)(result + 184);
      goto LABEL_4;
    }
  }
  else
  {
    v8 = 0;
    if (result)
      goto LABEL_3;
  }
  v9 = 0;
LABEL_4:
  if (v8 != v9)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)computeAncillaryEntityPrimaryKeyTableEntriesForStore:(_QWORD *)a3 error:
{
  NSSQLBlockRequestContext *v5;
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__PFCloudKitMetadataModelMigrator_computeAncillaryEntityPrimaryKeyTableEntriesForStore_error___block_invoke;
  v17[3] = &unk_1E1EDF798;
  v17[4] = a2;
  v17[5] = &v18;
  v5 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v17, 0, a2);
  -[NSSQLCore dispatchRequest:withRetries:](a2, v5, 0);

  if (!*((_BYTE *)v19 + 24))
  {
    v8 = 0;
    if (v8)
    {
      if (a3)
        *a3 = v8;
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        v24 = 1024;
        v25 = 1269;
        _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  v6 = *((_BYTE *)v19 + 24) != 0;
  _Block_object_dispose(&v18, 8);
  return v6;
}

void __70__PFCloudKitMetadataModelMigrator_prepareContextWithConnection_error___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v27[0] = 0;
  v29[0] = CFSTR("PFCloudKitMetadataFrameworkVersionKey");
  v2 = (void *)objc_msgSend(+[NSCKMetadataEntry entriesForKeys:onlyFetchingProperties:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1), &unk_1E1F525D8, *(_QWORD *)(a1[4] + 8), *(void **)(a1[4] + 16), (uint64_t)v27), "objectForKey:", CFSTR("PFCloudKitMetadataFrameworkVersionKey"));
  v3 = (void *)v27[0];
  if (v27[0])
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = v3;
  }
  else if (v2)
  {
    v5 = (void *)objc_msgSend(v2, "integerValue");
    v6 = *(void **)(a1[4] + 24);
    if (v6)
    {
      objc_setProperty_nonatomic(v6, v4, v5, 80);
      v7 = *(_QWORD *)(a1[4] + 24);
      if (v7)
        v6 = *(void **)(v7 + 80);
      else
        v6 = 0;
    }
    v8 = objc_msgSend(v6, "integerValue", v5);
    v9 = *(_QWORD *)(a1[4] + 24);
    if (v9 && (*(_BYTE *)(v9 + 33) = v8 < 940, (v10 = *(_QWORD *)(a1[4] + 24)) != 0))
      v11 = *(void **)(v10 + 80);
    else
      v11 = 0;
    v12 = objc_msgSend(v11, "integerValue");
    v13 = *(_QWORD *)(a1[4] + 24);
    if (v13 && (*(_BYTE *)(v13 + 37) = v12 < 1028, (v14 = *(_QWORD *)(a1[4] + 24)) != 0))
      v15 = *(void **)(v14 + 80);
    else
      v15 = 0;
    v16 = objc_msgSend(v15, "integerValue");
    v17 = *(_QWORD *)(a1[4] + 24);
    if (v17 && (*(_BYTE *)(v17 + 39) = v16 < 1244, (v18 = *(_QWORD *)(a1[4] + 24)) != 0))
      v19 = *(void **)(v18 + 80);
    else
      v19 = 0;
    v20 = objc_msgSend(v19, "integerValue");
    v21 = *(_QWORD *)(a1[4] + 24);
    if (v21)
      *(_BYTE *)(v21 + 40) = v20 < 1336;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v28 = CFSTR("PFCloudKitMetadataModelVersionHashesKey");
    v22 = (void *)objc_msgSend(+[NSCKMetadataEntry entriesForKeys:onlyFetchingProperties:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1), &unk_1E1F525F0, *(_QWORD *)(a1[4] + 8), *(void **)(a1[4] + 16), (uint64_t)v27), "objectForKey:", CFSTR("PFCloudKitMetadataModelVersionHashesKey"));
    v23 = (void *)v27[0];
    if (v27[0])
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = v23;
    }
    else
    {
      v25 = (void *)objc_msgSend(v22, "transformedValue");
      v26 = *(void **)(a1[4] + 24);
      if (v26)
        objc_setProperty_nonatomic(v26, v24, v25, 88);
    }
  }
}

- (void)addMigrationStatementToContext:(uint64_t)a1 forRenamingAttributeNamed:(uint64_t)a2 withOldColumnName:(uint64_t)a3 toAttributeName:(uint64_t)a4 onOldSQLEntity:(uint64_t)a5 andCurrentSQLEntity:(id *)a6
{
  uint64_t v12;
  void *v13;
  void *v14;
  NSSQLiteStatement *v15;
  NSSQLiteStatement *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSSQLiteStatement *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a6 && (v12 = objc_msgSend(a6[5], "objectForKey:", a4)) != 0)
  {
    v13 = (void *)v12;
    if (a5)
    {
      v14 = (void *)objc_msgSend(*(id *)(a5 + 40), "objectForKey:", a2);
      if (v14)
        a3 = objc_msgSend(v14, "columnName");
    }
    v15 = [NSSQLiteStatement alloc];
    v16 = -[NSSQLiteStatement initWithEntity:sqlString:](v15, "initWithEntity:sqlString:", a6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE %@ RENAME COLUMN %@ TO %@"), objc_msgSend(a6, "tableName"), a3, objc_msgSend(v13, "columnName")));
    if (a1)
    {
      v25 = v16;
      objc_msgSend(*(id *)(a1 + 8), "addObject:", v16);
      v16 = v25;
      *(_BYTE *)(a1 + 32) = 1;
    }

  }
  else
  {
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unable to find attribute to migrate to '%@' from '%@' on entity: %@");
    _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, a4);
    v24 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v27 = a4;
      v28 = 2112;
      v29 = a2;
      v30 = 2112;
      v31 = a6;
      _os_log_fault_impl(&dword_18A253000, v24, OS_LOG_TYPE_FAULT, "CoreData: Unable to find attribute to migrate to '%@' from '%@' on entity: %@", buf, 0x20u);
    }
  }
}

- (void)addMigrationStatementForAddingAttribute:(_BYTE *)a1 toContext:(uint64_t)a2 inStore:(void *)a3
{
  void *v6;
  NSSQLiteStatement *v7;
  NSSQLiteStatement *v8;
  NSSQLiteStatement *v9;

  v6 = (void *)objc_msgSend(a1, "entity");
  v7 = [NSSQLiteStatement alloc];
  v8 = -[NSSQLiteStatement initWithEntity:sqlString:](v7, "initWithEntity:sqlString:", v6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE %@ ADD COLUMN %@ %@"), objc_msgSend(v6, "tableName"), objc_msgSend(a1, "columnName"), -[NSSQLiteAdapter typeStringForColumn:]((const __CFString *)objc_msgSend(a3, "adapter"), a1)));
  if (a2)
  {
    v9 = v8;
    objc_msgSend(*(id *)(a2 + 8), "addObject:", v8);
    v8 = v9;
    *(_BYTE *)(a2 + 32) = 1;
  }

}

void __79__PFCloudKitMetadataModelMigrator_calculateMigrationStepsWithConnection_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSFetchRequest *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  NSSQLiteStatement *v8;
  NSSQLiteStatement *v9;
  uint64_t v10;

  v2 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());
  v3 = (void *)objc_msgSend(v2, "initWithZoneName:ownerName:", CFSTR("com.apple.coredata.cloudkit.zone"), getCloudKitCKCurrentUserDefaultName[0]());
  v4 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"));
  -[NSFetchRequest setPredicate:](v4, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ckRecordZoneName = %@ AND ckOwnerName = %@"), objc_msgSend(v3, "zoneName"), objc_msgSend(v3, "ownerName")));
  -[NSFetchRequest setResultType:](v4, "setResultType:", 4);
  -[NSFetchRequest setPropertiesToFetch:](v4, "setPropertiesToFetch:", &unk_1E1F52620);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v5)
  {
    v6 = -[NSManagedObjectContext _countForFetchRequest_:error:](v5, v4, (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    else if (v6 >= 2)
    {
      v8 = [NSSQLiteStatement alloc];
      v9 = -[NSSQLiteStatement initWithEntity:sqlString:](v8, "initWithEntity:sqlString:", 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@"), objc_msgSend(*(id *)(a1 + 40), "tableName")));
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      if (v10)
      {
        objc_msgSend(*(id *)(v10 + 8), "addObject:", v9);
        *(_BYTE *)(v10 + 32) = 1;
      }

    }
  }

}

void __69__PFCloudKitMetadataModelMigrator_commitMigrationMetadataAndCleanup___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSFetchRequest *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  _BOOL4 v47;
  NSCloudKitMirroringDelegatePreJazzkonMetadata *v48;
  NSManagedObject *v49;
  id v50;
  id v51;
  int v52;
  uint64_t v53;
  NSFetchRequest *v54;
  void *v55;
  NSManagedObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  int v79;
  uint64_t v80;
  _QWORD *v81;
  id v82;
  NSManagedObject *v83;
  id v84;
  NSManagedObject *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  NSManagedObject *v91;
  NSFetchRequest *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  NSFetchRequest *v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  void *v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  NSBatchDeleteRequest *v111;
  uint64_t v112;
  id v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  void *v118;
  id v119;
  char v120;
  uint64_t v121;
  char v122;
  BOOL v123;
  id v124;
  char v125;
  uint64_t v126;
  id v127;
  uint64_t PFBundleVersion;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSBatchUpdateRequest *v133;
  char v134;
  uint64_t v135;
  id v136;
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t k;
  char v142;
  NSManagedObject *v143;
  uint64_t v144;
  id v145;
  char v146;
  void *context;
  _BOOL4 v148;
  NSManagedObject *v149;
  uint64_t v150;
  uint64_t v151;
  id v152;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _QWORD v158[6];
  int8x16_t v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  id v172;
  _QWORD v173[9];
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  uint64_t v178;
  uint64_t *v179;
  uint64_t v180;
  char v181;
  _BYTE v182[128];
  _QWORD v183[3];
  _QWORD v184[3];
  uint64_t v185;
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  uint64_t v189;
  uint8_t buf[4];
  const char *v191;
  __int16 v192;
  int v193;
  void *v194;
  _QWORD v195[2];
  _QWORD v196[16];
  uint8_t v197[8];
  uint8_t *v198;
  uint64_t v199;
  void (*v200)(uint64_t, uint64_t);
  void (*v201)(uint64_t);
  uint64_t v202;
  uint64_t v203;

  v203 = *MEMORY[0x1E0C80C00];
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(*(_QWORD *)(a1 + 32) + 8)))
  {
    v196[0] = 0;
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setQueryGenerationFromToken:error:", 0, v196) & 1) == 0)
    {
      v1 = (void *)MEMORY[0x18D76B4E4]();
      v2 = __ckLoggingOverride;
      v3 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Unable to set query generation on moc: %@"));
      _NSCoreDataLog(v2 != 0, v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[PFCloudKitMetadataModelMigrator commitMigrationMetadataAndCleanup:]_block_invoke");
      objc_autoreleasePoolPop(v1);
    }
  }
  v172 = 0;
  if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("PFCloudKitMetadataModelMigratorMigrationBeganCommitKey"), 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), &v172)|| (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "save:", &v172) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v172;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return;
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(*(_QWORD *)(a1 + 32) + 8)))
  {
    v196[0] = 0;
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), v196) & 1) == 0)
    {
      v10 = (void *)MEMORY[0x18D76B4E4]();
      v11 = __ckLoggingOverride;
      v12 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Unable to set query generation on moc: %@"));
      _NSCoreDataLog(v11 != 0, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[PFCloudKitMetadataModelMigrator commitMigrationMetadataAndCleanup:]_block_invoke");
      objc_autoreleasePoolPop(v10);
    }
  }
  v19 = +[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("PFCloudKitMetadataFrameworkVersionKey"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), (uint64_t)&v172);
  v20 = v172;
  if (v172
    || (v21 = (void *)v19,
        v22 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("PFCloudKitMetadataModelVersionHashesKey"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), (uint64_t)&v172), (v20 = v172) != 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v23 = v20;
    goto LABEL_14;
  }
  v39 = objc_msgSend(v22, "transformedValue");
  if (!v39
    || ((v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)) == 0 ? (v41 = 0) : (v41 = *(void **)(v40 + 48)),
        (objc_msgSend((id)objc_msgSend(v41, "entityVersionHashesByName"), "isEqual:", v39) & 1) == 0))
  {
    if (!-[PFCloudKitMetadataModelMigrator computeAncillaryEntityPrimaryKeyTableEntriesForStore:error:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &v172))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v172;
    }
  }
  v42 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(*(_QWORD *)(v42 + 8) + 24))
  {
    v43 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v44 = v43 ? *(void **)(v43 + 48) : 0;
    v45 = +[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:transformedValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("PFCloudKitMetadataModelVersionHashesKey"), objc_msgSend(v44, "entityVersionHashesByName"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), &v172);
    v42 = *(_QWORD *)(a1 + 40);
    if (!v45)
    {
      *(_BYTE *)(*(_QWORD *)(v42 + 8) + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v172;
      v42 = *(_QWORD *)(a1 + 40);
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(v42 + 8) + 24))
    return;
  if (v21)
  {
    v46 = objc_msgSend((id)objc_msgSend(v21, "integerValue"), "unsignedIntegerValue");
    v47 = (unint64_t)objc_msgSend((id)objc_msgSend(v21, "integerValue"), "unsignedIntegerValue") < 0x3B1;
    v148 = (unint64_t)objc_msgSend((id)objc_msgSend(v21, "integerValue"), "unsignedIntegerValue") < 0x3B3;
    if (v46 > 0x399)
      goto LABEL_55;
  }
  else
  {
    v148 = 0;
    v47 = 1;
  }
  v48 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata initWithStore:]([NSCloudKitMirroringDelegatePreJazzkonMetadata alloc], "initWithStore:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  if (!-[NSCloudKitMirroringDelegatePreJazzkonMetadata load:]((uint64_t)v48, &v172))
  {
LABEL_52:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v51 = v172;
    goto LABEL_53;
  }
  v49 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), (uint64_t)&v172);
  v50 = v172;
  if (!v172)
  {
    v83 = v49;
    -[NSManagedObject setCurrentChangeToken:](v49, "setCurrentChangeToken:", -[NSCloudKitMirroringDelegatePreJazzkonMetadata changeTokenForDatabaseScope:]((uint64_t)v48, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)));
    -[NSManagedObject setHasSubscription:](v83, "setHasSubscription:", -[NSCloudKitMirroringDelegatePreJazzkonMetadata hasInitializedDatabaseSubscription]((_BOOL8)v48));
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) == 2)
    {
      v84 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", 2);
      v85 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v84, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), (uint64_t)&v172);
      v86 = v172;
      if (v172)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v86;
      }
      else
      {
        v143 = v85;
        -[NSManagedObject setHasSubscription:](v85, "setHasSubscription:", -[NSCloudKitMirroringDelegatePreJazzkonMetadata hasInitializedZoneSubscription]((_BOOL8)v48));
        -[NSManagedObject setCurrentChangeToken:](v143, "setCurrentChangeToken:", -[NSCloudKitMirroringDelegatePreJazzkonMetadata changeTokenForZoneWithID:inDatabaseWithScope:]((uint64_t)v48, v84, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)));
        -[NSManagedObject setHasRecordZone:](v143, "setHasRecordZone:", 0);
      }

    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      if (-[NSCloudKitMirroringDelegatePreJazzkonMetadata lastHistoryToken]((uint64_t)v48))
      {
        v144 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata lastHistoryToken]((uint64_t)v48);
        if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:transformedValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateLastHistoryTokenKey"), v144, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), &v172))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v172;
        }
      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      if (-[NSCloudKitMirroringDelegatePreJazzkonMetadata ckIdentityRecordName](v48))
      {
        v145 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata ckIdentityRecordName](v48);
        if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:stringValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey"), (uint64_t)v145, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), &v172))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v172;
        }
      }
    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      goto LABEL_54;
    if (!-[NSCloudKitMirroringDelegatePreJazzkonMetadata hasCheckedCKIdentity]((_BOOL8)v48))
      goto LABEL_54;
    v146 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata hasCheckedCKIdentity]((_BOOL8)v48);
    if (+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey"), v146, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), &v172))
    {
      goto LABEL_54;
    }
    goto LABEL_52;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v51 = v50;
LABEL_53:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v51;
LABEL_54:

LABEL_55:
  v52 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) && v47)
  {
    v53 = MEMORY[0x18D76B4E4]();
    v152 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v54 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"));
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v54, "setRelationshipKeyPathsForPrefetching:", &unk_1E1F526C8);
    -[NSFetchRequest setReturnsObjectsAsFaults:](v54, "setReturnsObjectsAsFaults:", 0);
    v189 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    -[NSFetchRequest setAffectedStores:](v54, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v189, 1));
    v55 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "executeFetchRequest:error:", v54, &v172);
    context = (void *)v53;
    if (v55
      && (v56 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), (uint64_t)&v172)) != 0)
    {
      v149 = v56;
      v170 = 0u;
      v171 = 0u;
      v168 = 0u;
      v169 = 0u;
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v168, v188, 16);
      if (v57)
      {
        v58 = *(_QWORD *)v169;
        do
        {
          v59 = 0;
          v150 = v57;
          do
          {
            if (*(_QWORD *)v169 != v58)
              objc_enumerationMutation(v55);
            v60 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v59);
            if (objc_msgSend((id)objc_msgSend(v60, "ckOwnerName"), "length")
              && objc_msgSend((id)objc_msgSend(v60, "ckRecordZoneName"), "length"))
            {
              v61 = -[NSCKRecordZoneMetadata createRecordZoneID](v60);
              v62 = objc_msgSend(v152, "objectForKey:", v61);
              if (v62)
              {
                v63 = (void *)objc_msgSend((id)objc_msgSend(v60, "mirroredRelationships"), "copy");
                v166 = 0u;
                v167 = 0u;
                v164 = 0u;
                v165 = 0u;
                v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v164, v187, 16);
                if (v64)
                {
                  v65 = *(_QWORD *)v165;
                  do
                  {
                    for (i = 0; i != v64; ++i)
                    {
                      if (*(_QWORD *)v165 != v65)
                        objc_enumerationMutation(v63);
                      objc_msgSend(*(id *)(*((_QWORD *)&v164 + 1) + 8 * i), "setRecordZone:", v62);
                    }
                    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v164, v187, 16);
                  }
                  while (v64);
                }

                v67 = (void *)objc_msgSend((id)objc_msgSend(v60, "records"), "copy");
                v162 = 0u;
                v163 = 0u;
                v160 = 0u;
                v161 = 0u;
                v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v160, v186, 16);
                if (v68)
                {
                  v69 = *(_QWORD *)v161;
                  do
                  {
                    for (j = 0; j != v68; ++j)
                    {
                      if (*(_QWORD *)v161 != v69)
                        objc_enumerationMutation(v67);
                      objc_msgSend(*(id *)(*((_QWORD *)&v160 + 1) + 8 * j), "setRecordZone:", v62);
                    }
                    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v160, v186, 16);
                  }
                  while (v68);
                }

                v57 = v150;
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "deleteObject:", v60);
              }
              else
              {
                objc_msgSend(v60, "setDatabase:", v149);
                objc_msgSend(v152, "setObject:forKey:", v60, v61);
              }

            }
            else
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "deleteObject:", v60);
            }
            ++v59;
          }
          while (v59 != v57);
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v168, v188, 16);
        }
        while (v57);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v172;
    }

    objc_autoreleasePoolPop(context);
    v52 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  if (v52
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hasChanges")
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "save:", &v172) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v172;
  }
  v87 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(*(_QWORD *)(v87 + 8) + 24))
    goto LABEL_168;
  v88 = *(_QWORD *)(a1 + 32);
  v89 = *(_QWORD *)(v88 + 24);
  if (v89)
  {
    if (*(_BYTE *)(v89 + 35))
    {
      v90 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", *(_QWORD *)(v88 + 32));
      v91 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v90, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), (uint64_t)&v172);
      if (-[NSManagedObject isInserted](v91, "isInserted"))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "save:", &v172);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        v92 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
        v185 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        -[NSFetchRequest setAffectedStores:](v92, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v185, 1));
        -[NSFetchRequest setFetchBatchSize:](v92, "setFetchBatchSize:", 500);
        v93 = *(_QWORD *)(a1 + 32);
        v94 = *(void **)(v93 + 16);
        v158[0] = MEMORY[0x1E0C809B0];
        v158[1] = 3221225472;
        v158[2] = __69__PFCloudKitMetadataModelMigrator_commitMigrationMetadataAndCleanup___block_invoke_2;
        v158[3] = &unk_1E1EE16E8;
        v158[4] = v91;
        v158[5] = v93;
        v159 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
        +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v92, v94, (uint64_t)v158);

      }
      v87 = *(_QWORD *)(a1 + 40);
      if (!*(_BYTE *)(*(_QWORD *)(v87 + 8) + 24))
        goto LABEL_168;
    }
  }
  v95 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (!v95 || !*(_BYTE *)(v95 + 38))
    goto LABEL_138;
  v96 = (void *)MEMORY[0x18D76B4E4]();
  v97 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath](NSCKHistoryAnalyzerState, "entityPath"));
  -[NSFetchRequest setPredicate:](v97, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("entityId = 0")));
  v98 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v98)
  {
    v99 = -[NSManagedObjectContext _countForFetchRequest_:error:](v98, v97, (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    if (v99)
    {
      if (v99 == 0x7FFFFFFFFFFFFFFFLL)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        v100 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        goto LABEL_133;
      }
      v101 = (void *)MEMORY[0x18D76B4E4]();
      v102 = __ckLoggingOverride;
      v103 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Found %lu corrupt analyzed history rows, purging."));
      if (v102 >= 3)
        v110 = 3;
      else
        v110 = v102;
      _NSCoreDataLog(v110, v103, v104, v105, v106, v107, v108, v109, (uint64_t)"-[PFCloudKitMetadataModelMigrator commitMigrationMetadataAndCleanup:]_block_invoke");
      objc_autoreleasePoolPop(v101);
      v111 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath](NSCKHistoryAnalyzerState, "entityPath")));
      -[NSBatchDeleteRequest setResultType:](v111, "setResultType:", 0);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "executeRequest:error:", v111, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "result"), "BOOLValue"))
      {
        v112 = +[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateLastHistoryTokenKey"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (v112)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "deleteObject:", v112);
LABEL_132:

          goto LABEL_133;
        }
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
          goto LABEL_132;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      v113 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      goto LABEL_132;
    }
  }
LABEL_133:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hasChanges")
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v114 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "reset");
  objc_autoreleasePoolPop(v96);
  v87 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(*(_QWORD *)(v87 + 8) + 24))
    goto LABEL_168;
LABEL_138:
  v115 = *(_QWORD *)(a1 + 32);
  v116 = *(_QWORD *)(v115 + 24);
  if (v116)
  {
    if (*(_BYTE *)(v116 + 40))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -[PFCloudKitMetadataModelMigrator checkForOrphanedMirroredRelationshipsInStore:inManagedObjectContext:error:](v115, *(void **)(v115 + 8), *(void **)(v115 + 16), &v172);
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v172;
        v87 = *(_QWORD *)(a1 + 40);
        if (!*(_BYTE *)(*(_QWORD *)(v87 + 8) + 24))
          goto LABEL_168;
      }
    }
  }
  if (v148)
  {
    if (!-[PFCloudKitMetadataModelMigrator checkForCorruptedRecordMetadataInStore:inManagedObjectContext:error:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), &v172))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      v117 = v172;
LABEL_147:
      v120 = !v148;
      v121 = a1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v117;
      goto LABEL_152;
    }
LABEL_150:
    v120 = 0;
    goto LABEL_151;
  }
  v118 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("PFCloudKitMetadataClientVersionHashesKey"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), (uint64_t)&v172);
  v119 = v172;
  if (v172)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v117 = v119;
    goto LABEL_147;
  }
  if (!v118)
    goto LABEL_150;
  v120 = objc_msgSend((id)objc_msgSend(v118, "transformedValue"), "isEqual:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "persistentStoreCoordinator"), "managedObjectModel"), "entityVersionHashesByName"));
LABEL_151:
  v121 = a1;
LABEL_152:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v121 + 40) + 8) + 24))
    goto LABEL_159;
  if (objc_msgSend(*(id *)(*(_QWORD *)(v121 + 32) + 16), "hasChanges"))
  {
    v122 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "save:", &v172);
  }
  else
  {
    v123 = +[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(*(_QWORD *)(a1 + 32) + 8));
    v121 = a1;
    if (v123)
      goto LABEL_159;
    v122 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), &v172);
  }
  v121 = a1;
  if ((v122 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v124 = v172;
    v121 = a1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v124;
  }
LABEL_159:
  v87 = *(_QWORD *)(v121 + 40);
  if (*(_BYTE *)(*(_QWORD *)(v87 + 8) + 24))
    v125 = v120;
  else
    v125 = 1;
  if ((v125 & 1) != 0)
    goto LABEL_168;
  if (-[PFCloudKitMetadataModelMigrator cleanUpAfterClientMigrationWithStore:andContext:error:](*(_QWORD *)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), &v172))
  {
    v126 = +[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:transformedValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("PFCloudKitMetadataClientVersionHashesKey"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "persistentStoreCoordinator"), "managedObjectModel"), "entityVersionHashesByName"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), &v172);
    v87 = *(_QWORD *)(a1 + 40);
    if (v126)
      goto LABEL_168;
    *(_BYTE *)(*(_QWORD *)(v87 + 8) + 24) = 0;
    v127 = v172;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v127 = v172;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v127;
  v87 = *(_QWORD *)(a1 + 40);
LABEL_168:
  if (*(_BYTE *)(*(_QWORD *)(v87 + 8) + 24))
  {
    PFBundleVersion = +[_PFRoutines _getPFBundleVersionNumber]();
    if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:integerValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("PFCloudKitMetadataFrameworkVersionKey"), PFBundleVersion, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), &v172)|| (v129 = *(_QWORD *)(a1 + 32), (v130 = *(_QWORD *)(v129 + 24)) != 0)&& *(_BYTE *)(v130 + 33)&& !+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("PFCloudKitMetadataNeedsMetadataMigrationKey"), 1, *(_QWORD *)(v129 + 8), *(void **)(v129 + 16), &v172))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v172;
    }
  }
  v131 = a1;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return;
  v132 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v132 && *(_BYTE *)(v132 + 36))
  {
    v133 = -[NSBatchUpdateRequest initWithEntityName:]([NSBatchUpdateRequest alloc], "initWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"));
    v183[0] = CFSTR("needsImport");
    v184[0] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAB0]);
    v183[1] = CFSTR("currentChangeToken");
    v184[1] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
    v183[2] = CFSTR("lastFetchDate");
    v184[2] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
    -[NSBatchUpdateRequest setPropertiesToUpdate:](v133, "setPropertiesToUpdate:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v184, v183, 3));
    -[NSBatchUpdateRequest setResultType:](v133, "setResultType:", 0);
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "executeRequest:error:", v133, &v172), "result"), "BOOLValue") & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v172;

      v133 = 0;
    }

    v131 = a1;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      return;
  }
  v134 = objc_msgSend(*(id *)(*(_QWORD *)(v131 + 32) + 16), "save:", &v172);
  v135 = a1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v134;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v136 = v172;
    v135 = a1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v136;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      return;
  }
  v137 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(v135 + 32) + 8), "metadata"), "mutableCopy");
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v138 = (void *)+[NSCloudKitMirroringDelegatePreJazzkonMetadata allDefaultsKeys]();
  v139 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v154, v182, 16);
  if (v139)
  {
    v140 = *(_QWORD *)v155;
    do
    {
      for (k = 0; k != v139; ++k)
      {
        if (*(_QWORD *)v155 != v140)
          objc_enumerationMutation(v138);
        objc_msgSend(v137, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * k));
      }
      v139 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v154, v182, 16);
    }
    while (v139);
  }
  objc_msgSend(v137, "removeObjectForKey:", CFSTR("_NSStoreAncillaryModelVersionHashesMetadataKey"));
  objc_msgSend(v137, "removeObjectForKey:", CFSTR("PFCloudKitMetadataNeedsZoneFetchAfterClientMigrationKey"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMetadata:", v137);

  v142 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "save:", &v172);
  v24 = a1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v142;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    goto LABEL_15;
  v23 = v172;
LABEL_14:
  v24 = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v23;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return;
LABEL_15:
  v25 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("PFCloudKitMetadataNeedsMetadataMigrationKey"), *(_QWORD *)(*(_QWORD *)(v24 + 32) + 8), *(void **)(*(_QWORD *)(v24 + 32) + 16), (uint64_t)&v172);
  v26 = v172;
  if (v172)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v27 = v26;
LABEL_17:
    v28 = *(_QWORD *)(a1 + 48);
LABEL_18:
    *(_QWORD *)(*(_QWORD *)(v28 + 8) + 40) = v27;
    return;
  }
  if (objc_msgSend(v25, "BOOLValue"))
  {
    v29 = *(_QWORD *)(a1 + 32);
    v30 = *(void **)(v29 + 8);
    v31 = *(void **)(v29 + 16);
    v151 = v29;
    v178 = 0;
    v179 = &v178;
    v180 = 0x2020000000;
    v181 = 1;
    *(_QWORD *)v197 = 0;
    v198 = v197;
    v199 = 0x3052000000;
    v200 = __Block_byref_object_copy__57;
    v201 = __Block_byref_object_dispose__57;
    v202 = 0;
    v32 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v31, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(v30, "configurationName"));
    v176 = 0u;
    v177 = 0u;
    v174 = 0u;
    v175 = 0u;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v174, v196, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v175;
LABEL_22:
      v35 = 0;
      while (1)
      {
        if (*(_QWORD *)v175 != v34)
          objc_enumerationMutation(v32);
        v36 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * v35);
        if (objc_msgSend((id)objc_msgSend(v36, "attributesByName"), "objectForKey:", CFSTR("ckRecordID")))
        {
          if (objc_msgSend((id)objc_msgSend(v36, "attributesByName"), "objectForKey:", CFSTR("ckRecordSystemFields")))
          {
            v37 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", objc_msgSend(v36, "name"));
            v195[0] = CFSTR("ckRecordID");
            v195[1] = CFSTR("ckRecordSystemFields");
            -[NSFetchRequest setPropertiesToFetch:](v37, "setPropertiesToFetch:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v195, 2));
            -[NSFetchRequest setPredicate:](v37, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("ckRecordID")));
            -[NSFetchRequest setFetchBatchSize:](v37, "setFetchBatchSize:", 200);
            v194 = v30;
            -[NSFetchRequest setAffectedStores:](v37, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v194, 1));
            v173[0] = MEMORY[0x1E0C809B0];
            v173[1] = 3221225472;
            v173[2] = __107__PFCloudKitMetadataModelMigrator_migrateMetadataForObjectsInStore_toNSCKRecordMetadataUsingContext_error___block_invoke;
            v173[3] = &unk_1E1EE1AE8;
            v173[4] = v151;
            v173[5] = v30;
            v173[6] = v31;
            v173[7] = v197;
            v173[8] = &v178;
            +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v37, v31, (uint64_t)v173);
            if (!*((_BYTE *)v179 + 24))
              break;
          }
        }
        if (v33 == ++v35)
        {
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v174, v196, 16);
          if (v33)
            goto LABEL_22;
          break;
        }
      }
    }
    if (!*((_BYTE *)v179 + 24))
    {
      v38 = *((id *)v198 + 5);
      if (v38)
      {
        v172 = v38;
      }
      else
      {
        v71 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v71, v72, v73, v74, v75, v76, v77, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
        v78 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v191 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
          v192 = 1024;
          v193 = 1529;
          _os_log_fault_impl(&dword_18A253000, v78, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
    }

    *((_QWORD *)v198 + 5) = 0;
    v79 = *((unsigned __int8 *)v179 + 24);
    _Block_object_dispose(v197, 8);
    _Block_object_dispose(&v178, 8);
    if (v79)
    {
      if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("PFCloudKitMetadataNeedsMetadataMigrationKey"), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), &v172))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        v27 = v172;
        goto LABEL_17;
      }
      v80 = +[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("PFCloudKitMetadataModelMigratorMigrationBeganCommitKey"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(*(_QWORD *)(a1 + 32) + 16), (uint64_t)&v172);
      if (v80)
      {
        v81 = (_QWORD *)a1;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "deleteObject:", v80);
      }
      else
      {
        v82 = v172;
        v81 = (_QWORD *)a1;
        if (v172)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v82;
        }
      }
      if (*(_BYTE *)(*(_QWORD *)(v81[5] + 8) + 24)
        && (objc_msgSend(*(id *)(v81[4] + 16), "save:", &v172) & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(v81[5] + 8) + 24) = 0;
        v27 = v172;
        v28 = v81[6];
        goto LABEL_18;
      }
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v172;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

uint64_t __69__PFCloudKitMetadataModelMigrator_commitMigrationMetadataAndCleanup___block_invoke_2(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t result;
  _QWORD *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    result = a3;
    v13 = a1 + 6;
    goto LABEL_15;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(a2);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (!objc_msgSend(v11, "recordZone"))
          objc_msgSend(v11, "setRecordZone:", a1[4]);
      }
      v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  result = objc_msgSend(*(id *)(a1[5] + 16), "hasChanges");
  if ((_DWORD)result)
  {
    v13 = a1 + 6;
    result = objc_msgSend(*(id *)(a1[5] + 16), "save:", *(_QWORD *)(a1[6] + 8) + 40);
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
      result = (uint64_t)*(id *)(*(_QWORD *)(a1[6] + 8) + 40);
LABEL_15:
      *(_QWORD *)(*(_QWORD *)(*v13 + 8) + 40) = result;
      *a4 = 1;
    }
  }
  return result;
}

- (uint64_t)checkForOrphanedMirroredRelationshipsInStore:(void *)a3 inManagedObjectContext:(_QWORD *)a4 error:
{
  id v5;
  NSFetchRequest *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSFetchRequest *v16;
  NSBatchDeleteRequest *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  _QWORD *v43;
  id v44;
  void *v45;
  void *v46;
  void *context;
  void *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  int v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v55 = 0;
  v5 = (id)objc_msgSend(a2, "persistentStoreCoordinator");
  v6 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
  -[NSFetchRequest setPropertiesToFetch:](v6, "setPropertiesToFetch:", &unk_1E1F526F8);
  -[NSFetchRequest setPropertiesToGroupBy:](v6, "setPropertiesToGroupBy:", &unk_1E1F52710);
  -[NSFetchRequest setResultType:](v6, "setResultType:", 2);
  v7 = objc_msgSend(a3, "executeFetchRequest:error:", v6, &v55);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_msgSend(v5, "managedObjectModel");
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v50 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v50)
    {
      v46 = v9;
      v43 = a4;
      v44 = v5;
      v10 = *(_QWORD *)v52;
      v45 = v8;
      while (2)
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v52 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x18D76B4E4]();
          v14 = objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("cdEntityName"));
          v15 = objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("relationshipName"));
          if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "entitiesByName"), "objectForKeyedSubscript:", v14), "relationshipsByName"), "objectForKeyedSubscript:", v15))
          {
            v49 = v13;
            v16 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
            -[NSFetchRequest setPredicate:](v16, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cdEntityName = %@ AND relationshipName = %@"), v14, v15));
            v17 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", v16);
            -[NSBatchDeleteRequest setResultType:](v17, "setResultType:", 2);
            v18 = objc_msgSend(a3, "executeRequest:error:", v17, &v55);
            if (!v18)
            {
              v32 = v55;

              objc_autoreleasePoolPop(v13);
              a4 = v43;
              v5 = v44;
              goto LABEL_19;
            }
            v19 = (void *)v18;
            context = (void *)MEMORY[0x18D76B4E4]();
            v20 = v10;
            if ((unint64_t)__ckLoggingOverride >= 3)
              v21 = 3;
            else
              v21 = __ckLoggingOverride;
            v22 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ deleted %@ mirrored relationship entries because %@:%@ is no longer in the managed object model of this store: %@"));
            objc_msgSend(v19, "result");
            v23 = v21;
            v10 = v20;
            _NSCoreDataLog(v23, v22, v24, v25, v26, v27, v28, v29, (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForOrphanedMirroredRelationshipsInStore:inManagedObjectContext:error:]");
            v8 = v45;
            v9 = v46;
            objc_autoreleasePoolPop(context);

            v13 = v49;
          }
          objc_autoreleasePoolPop(v13);
        }
        v50 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        if (v50)
          continue;
        break;
      }
      v30 = 1;
      v5 = v44;
    }
    else
    {
      v30 = 1;
    }
    goto LABEL_26;
  }
  v31 = v55;
LABEL_19:
  v33 = v55;
  if (!v33)
  {
    v34 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
    v41 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v57 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
      v58 = 1024;
      v59 = 1478;
      _os_log_fault_impl(&dword_18A253000, v41, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_24;
  }
  if (!a4)
  {
LABEL_24:
    v30 = 0;
    goto LABEL_26;
  }
  v30 = 0;
  *a4 = v33;
LABEL_26:

  return v30;
}

- (BOOL)checkForCorruptedRecordMetadataInStore:(void *)a3 inManagedObjectContext:(_QWORD *)a4 error:
{
  uint64_t v7;
  NSFetchRequest *v8;
  NSBatchDeleteRequest *v9;
  int v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL8 v38;
  _QWORD v40[9];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  int v58;
  uint64_t v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 1;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3052000000;
  v48 = __Block_byref_object_copy__57;
  v49 = __Block_byref_object_dispose__57;
  v50 = 0;
  v7 = objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel");
  v8 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
  -[NSFetchRequest setFetchBatchSize:](v8, "setFetchBatchSize:", 500);
  -[NSFetchRequest setPropertiesToFetch:](v8, "setPropertiesToFetch:", &unk_1E1F52758);
  v60[0] = a2;
  -[NSFetchRequest setAffectedStores:](v8, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1));
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __103__PFCloudKitMetadataModelMigrator_checkForCorruptedRecordMetadataInStore_inManagedObjectContext_error___block_invoke;
  v40[3] = &unk_1E1EE1B38;
  v40[4] = a2;
  v40[5] = v7;
  v40[6] = &v41;
  v40[7] = &v51;
  v40[8] = &v45;
  +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v8, a3, (uint64_t)v40);
  if (!*((_BYTE *)v52 + 24))
    goto LABEL_11;
  if (*((_BYTE *)v42 + 24))
  {
    v9 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath")));
    -[NSBatchDeleteRequest setResultType:](v9, "setResultType:", 0);
    v59 = a2;
    -[NSPersistentStoreRequest setAffectedStores:](v9, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1));
    v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "executeRequest:error:", v9, v46 + 5), "result"), "BOOLValue");
    v11 = (void *)MEMORY[0x18D76B4E4]();
    v12 = __ckLoggingOverride;
    if (v10)
    {
      v13 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Successfully purged record metadata during migration due to corrupted metadatas."));
      v20 = v12 >= 0x10 ? 16 : v12;
      _NSCoreDataLog(v20, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForCorruptedRecordMetadataInStore:inManagedObjectContext:error:]");
      objc_autoreleasePoolPop(v11);
      *((_BYTE *)v52 + 24) = 1;
    }
    else
    {
      v21 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to purged corrupted record metadata during migration: %@"));
      _NSCoreDataLog(v12 != 0, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForCorruptedRecordMetadataInStore:inManagedObjectContext:error:]");
      objc_autoreleasePoolPop(v11);
      *((_BYTE *)v52 + 24) = 0;
      v28 = (id)v46[5];
    }

    if (!*((_BYTE *)v52 + 24))
    {
LABEL_11:
      v29 = (id)v46[5];
      if (v29)
      {
        if (a4)
          *a4 = v29;
      }
      else
      {
        v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
        v37 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
          v57 = 1024;
          v58 = 1765;
          _os_log_fault_impl(&dword_18A253000, v37, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
    }
  }

  v46[5] = 0;
  v38 = *((_BYTE *)v52 + 24) != 0;
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);
  return v38;
}

- (BOOL)cleanUpAfterClientMigrationWithStore:(void *)a3 andContext:(_QWORD *)a4 error:
{
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  uint64_t v18;
  uint64_t v19;
  NSFetchRequest *v20;
  NSBatchDeleteRequest *v21;
  NSFetchRequest *v22;
  id v23;
  _BOOL8 v24;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  _QWORD v36[9];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  void *v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 1;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3052000000;
  v44 = __Block_byref_object_copy__57;
  v45 = __Block_byref_object_dispose__57;
  v46 = 0;
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v7 = (_QWORD *)objc_msgSend(a2, "model");
  if (v7)
    v7 = (_QWORD *)v7[5];
  v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));
  v9 = objc_alloc(MEMORY[0x1E0C99E20]);
  v10 = (_QWORD *)objc_msgSend(a2, "model");
  if (v10)
    v10 = (_QWORD *)v10[5];
  v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = objc_msgSend(a2, "model");
  if (v12)
    v13 = *(void **)(v12 + 40);
  else
    v13 = 0;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v38;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v13);
        v17 = *(unsigned int **)(*((_QWORD *)&v37 + 1) + 8 * v16);
        if (v17)
          v18 = v17[46];
        else
          v18 = 0;
        objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18));
        objc_msgSend(v11, "addObject:", objc_msgSend(v17, "name"));
        ++v16;
      }
      while (v14 != v16);
      v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
      v14 = v19;
    }
    while (v19);
  }
  v20 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
  -[NSFetchRequest setPredicate:](v20, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (entityId IN %@)"), v8));
  v21 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", v20);
  -[NSBatchDeleteRequest setResultType:](v21, "setResultType:", 0);
  v56 = a2;
  -[NSPersistentStoreRequest setAffectedStores:](v21, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1));
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "executeRequest:error:", v21, v42 + 5), "result"), "BOOLValue"))
  {
    v22 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
    -[NSFetchRequest setFetchBatchSize:](v22, "setFetchBatchSize:", 500);
    -[NSFetchRequest setPropertiesToFetch:](v22, "setPropertiesToFetch:", &unk_1E1F52770);
    v55 = a2;
    -[NSFetchRequest setAffectedStores:](v22, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1));
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __89__PFCloudKitMetadataModelMigrator_cleanUpAfterClientMigrationWithStore_andContext_error___block_invoke;
    v36[3] = &unk_1E1EE1AE8;
    v36[4] = v11;
    v36[5] = a2;
    v36[6] = a3;
    v36[7] = &v41;
    v36[8] = &v47;
    +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v22, a3, (uint64_t)v36);

  }
  else
  {
    *((_BYTE *)v48 + 24) = 0;
    v23 = (id)v42[5];
  }

  if (!*((_BYTE *)v48 + 24))
  {
    v26 = (id)v42[5];
    if (v26)
    {
      if (a4)
        *a4 = v26;
    }
    else
    {
      v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      v34 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v52 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        v53 = 1024;
        v54 = 1842;
        _os_log_fault_impl(&dword_18A253000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v42[5] = 0;
  v24 = *((_BYTE *)v48 + 24) != 0;
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);
  return v24;
}

- (BOOL)checkAndPerformMigrationIfNecessary:(uint64_t *)a1
{
  uint64_t v4;
  NSSQLBlockRequestContext *v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  id v10;
  NSManagedObjectContext *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  _BOOL8 v43;
  _QWORD v45[7];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  _QWORD v56[7];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  void (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char v76;
  uint8_t v77[4];
  const char *v78;
  __int16 v79;
  int v80;
  _BYTE buf[24];
  void *v82;
  uint64_t *v83;
  void *v84;
  NSManagedObjectContext *v85;
  id v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3052000000;
  v49 = __Block_byref_object_copy__57;
  v50 = __Block_byref_object_dispose__57;
  v51 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __71__PFCloudKitMetadataModelMigrator_checkAndPerformMigrationIfNecessary___block_invoke;
  v45[3] = &unk_1E1EE1A98;
  v45[4] = a1;
  v45[5] = &v52;
  v45[6] = &v46;
  v5 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v45, 0, a1[1]);
  -[NSSQLCore dispatchRequest:withRetries:](a1[1], v5, 0);

  if (!*((_BYTE *)v53 + 24))
    goto LABEL_18;
  v6 = v47;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 1;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3052000000;
  v60 = __Block_byref_object_copy__57;
  v61 = __Block_byref_object_dispose__57;
  v62 = 0;
  v7 = (void *)a1[2];
  v56[0] = v4;
  v56[1] = 3221225472;
  v56[2] = __69__PFCloudKitMetadataModelMigrator_commitMigrationMetadataAndCleanup___block_invoke;
  v56[3] = &unk_1E1EDDC88;
  v56[4] = a1;
  v56[5] = &v63;
  v56[6] = &v57;
  objc_msgSend(v7, "performBlockAndWait:", v56);
  if (!*((_BYTE *)v64 + 24))
    goto LABEL_12;
  if (a1[4] == 2)
  {
    v8 = (void *)a1[1];
    v9 = v58;
    v73 = 0;
    v74 = &v73;
    v75 = 0x2020000000;
    v76 = 1;
    v67 = 0;
    v68 = &v67;
    v69 = 0x3052000000;
    v70 = __Block_byref_object_copy__57;
    v71 = __Block_byref_object_dispose__57;
    v72 = 0;
    v10 = (id)objc_msgSend(v8, "persistentStoreCoordinator");
    v11 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
    -[NSManagedObjectContext setMergePolicy:](v11, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v11, "setPersistentStoreCoordinator:", v10);
    -[NSManagedObjectContext _setAllowAncillaryEntities:](v11, "_setAllowAncillaryEntities:", 1);
    *(_QWORD *)buf = v4;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __85__PFCloudKitMetadataModelMigrator_checkForRecordMetadataZoneCorruptionInStore_error___block_invoke;
    v82 = &unk_1E1EE1AC0;
    v83 = a1;
    v84 = v8;
    v87 = &v67;
    v88 = &v73;
    v85 = v11;
    v86 = v10;
    -[NSManagedObjectContext performBlockAndWait:](v11, "performBlockAndWait:", buf);

    if (!*((_BYTE *)v74 + 24))
    {
      v12 = (id)v68[5];
      if (v12)
      {
        v9[5] = (uint64_t)v12;
      }
      else
      {
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
        v20 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v77 = 136315394;
          v78 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
          v79 = 1024;
          v80 = 1429;
          _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v77, 0x12u);
        }
      }
    }

    v68[5] = 0;
    v21 = *((unsigned __int8 *)v74 + 24);
    _Block_object_dispose(&v67, 8);
    _Block_object_dispose(&v73, 8);
    *((_BYTE *)v64 + 24) = v21;
    if (!v21)
    {
      v22 = (id)v58[5];
      if (!*((_BYTE *)v64 + 24))
      {
LABEL_12:
        v23 = (id)v58[5];
        if (v23)
        {
          v6[5] = (uint64_t)v23;
        }
        else
        {
          v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v24, v25, v26, v27, v28, v29, v30, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
          v31 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1148;
            _os_log_fault_impl(&dword_18A253000, v31, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
      }
    }
  }

  v58[5] = 0;
  v32 = *((unsigned __int8 *)v64 + 24);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);
  *((_BYTE *)v53 + 24) = v32;
  if (!v32)
  {
    v33 = (id)v47[5];
    if (!*((_BYTE *)v53 + 24))
    {
LABEL_18:
      v34 = (id)v47[5];
      if (v34)
      {
        if (a2)
          *a2 = v34;
      }
      else
      {
        v35 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v35, v36, v37, v38, v39, v40, v41, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
        v42 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1191;
          _os_log_fault_impl(&dword_18A253000, v42, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
    }
  }

  v47[5] = 0;
  v43 = *((_BYTE *)v53 + 24) != 0;
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  return v43;
}

void __71__PFCloudKitMetadataModelMigrator_checkAndPerformMigrationIfNecessary___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  void *PFBundleVersion;
  NSManagedObjectModel *v6;
  const char *v7;
  NSSQLModel *v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  NSSQLModel *v14;
  void *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  uint64_t v21;
  NSKnownKeysDictionary *entitiesByName;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  int v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSSQLiteStatement *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  NSSQLiteStatement *v57;
  uint64_t v58;
  uint64_t v59;
  id *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  NSSQLiteStatement *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  void *v79;
  objc_class *v80;
  void *v81;
  objc_class *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  objc_class *v87;
  void *v88;
  void *v89;
  NSSQLiteStatement *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t *v94;
  uint64_t *v95;
  id v96;
  void *v97;
  objc_class *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  _BYTE *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  NSSQLiteStatement *v113;
  NSSQLiteStatement *v114;
  uint64_t v115;
  NSSQLiteStatement *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  objc_class *v123;
  void *v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t j;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSObject *v139;
  int v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t k;
  uint64_t v145;
  id v146;
  void *v147;
  objc_class *v148;
  void *v149;
  objc_class *v150;
  void *v151;
  objc_class *v152;
  NSSQLiteStatement *v153;
  uint64_t v154;
  _BYTE *v155;
  void *v156;
  objc_class *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  _BYTE *v161;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  id v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t m;
  uint64_t v177;
  void *v178;
  objc_class *v179;
  void *v180;
  objc_class *v181;
  void *v182;
  objc_class *v183;
  void *v184;
  void *v185;
  id *v186;
  id *v187;
  id v188;
  uint64_t v189;
  uint64_t v190;
  unint64_t v191;
  unint64_t v192;
  id *v193;
  id *v194;
  id v195;
  void *v196;
  NSSQLiteStatement *v197;
  uint64_t v198;
  NSSQLiteStatement *v199;
  NSSQLiteStatement *v200;
  uint64_t v201;
  NSSQLiteStatement *v202;
  NSSQLiteStatement *v203;
  uint64_t v204;
  NSSQLiteStatement *v205;
  uint64_t v206;
  NSSQLiteStatement *v207;
  NSSQLiteStatement *v208;
  uint64_t v209;
  NSSQLiteStatement *v210;
  NSSQLiteStatement *v211;
  uint64_t v212;
  void *v213;
  void *v214;
  uint64_t v215;
  id v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t n;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  _BYTE *v225;
  void *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  objc_class *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  _BYTE *v241;
  void *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  _BYTE *v255;
  void *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  NSSQLiteStatement *v266;
  void *v267;
  uint64_t v268;
  void *v269;
  NSSQLiteStatement *v270;
  uint64_t v271;
  void *v272;
  objc_class *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  _BYTE *v277;
  void *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  void *v288;
  objc_class *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  _BYTE *v293;
  void *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  void *v305;
  NSSQLiteStatement *v306;
  NSSQLiteStatement *v307;
  uint64_t v308;
  uint64_t v309;
  void *v310;
  uint64_t v311;
  uint64_t v312;
  id v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  NSObject *v321;
  int v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  void *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t ii;
  uint64_t v331;
  void *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t jj;
  uint64_t v336;
  void *v337;
  id v338;
  uint64_t v339;
  void *v341;
  void *v342;
  void *v343;
  uint64_t v344;
  uint64_t v345;
  void *v347;
  uint64_t v348;
  uint64_t v349;
  char v350;
  id v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  _QWORD v388[8];
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  uint64_t v401;
  uint64_t *v402;
  uint64_t v403;
  void (*v404)(uint64_t, uint64_t);
  void (*v405)(uint64_t);
  uint64_t v406;
  uint64_t v407;
  uint64_t *v408;
  uint64_t v409;
  char v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  _BYTE v415[128];
  _BYTE v416[128];
  _BYTE v417[128];
  _BYTE v418[128];
  _BYTE v419[128];
  _BYTE v420[128];
  _BYTE v421[128];
  _BYTE v422[128];
  _BYTE v423[24];
  char v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  uint8_t v433[4];
  const char *v434;
  __int16 v435;
  int v436;
  __int128 buf;
  uint64_t v438;
  char v439;
  uint64_t v440;
  uint64_t *v441;
  uint64_t v442;
  void (*v443)(uint64_t, uint64_t);
  void (*v444)(uint64_t);
  uint64_t v445;
  _BYTE v446[24];
  void *v447;
  uint64_t *v448;
  id *v449;
  uint64_t *v450;
  __int128 *v451;
  __int128 *p_buf;
  uint64_t v453;

  v453 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  v2 = (uint64_t *)a1[4];
  if (a2)
    v3 = *(void **)(a2 + 24);
  else
    v3 = 0;
  if (!v2)
    goto LABEL_386;
  v4 = *(_QWORD *)(a1[6] + 8);
  *(_QWORD *)&v425 = 0;
  *((_QWORD *)&v425 + 1) = &v425;
  *(_QWORD *)&v426 = 0x2020000000;
  BYTE8(v426) = 1;
  v440 = 0;
  v441 = &v440;
  v442 = 0x3052000000;
  v443 = __Block_byref_object_copy__57;
  v444 = __Block_byref_object_dispose__57;
  v445 = 0;
  PFBundleVersion = (void *)+[_PFRoutines _getPFBundleVersionNumber]();
  v6 = +[PFCloudKitMetadataModel newMetadataModelForFrameworkVersion:]((uint64_t)PFCloudKitMetadataModel, PFBundleVersion);
  v8 = -[NSSQLModel initWithManagedObjectModel:configurationName:]([NSSQLModel alloc], "initWithManagedObjectModel:configurationName:", v6, 0);
  v9 = (void *)v2[3];
  if (v9)
  {
    objc_setProperty_nonatomic(v9, v7, v6, 48);
    v11 = (void *)v2[3];
    if (v11)
      objc_setProperty_nonatomic(v11, v10, v8, 56);
  }
  v422[0] = 0;
  v12 = +[PFCloudKitMetadataModel identifyModelForStore:withConnection:hasOldMetadataTables:]((uint64_t)PFCloudKitMetadataModel, v2[1], v3, v422);
  v14 = -[NSSQLModel initWithManagedObjectModel:configurationName:]([NSSQLModel alloc], "initWithManagedObjectModel:configurationName:", v12, 0);
  v15 = (void *)v2[3];
  if (v15)
  {
    objc_setProperty_nonatomic(v15, v13, v12, 64);
    v17 = (void *)v2[3];
    if (v17)
    {
      objc_setProperty_nonatomic(v17, v16, v14, 72);
      v18 = v2[3];
      if (v18)
        *(_BYTE *)(v18 + 34) = v422[0];
    }
  }
  if (objc_msgSend((id)objc_msgSend((id)v2[1], "metadata"), "objectForKey:", CFSTR("PFCloudKitMetadataNeedsZoneFetchAfterClientMigrationKey")))
  {
    v19 = v2[3];
    if (v19)
      *(_BYTE *)(v19 + 36) = 1;
  }
  v20 = (objc_class *)objc_opt_class();
  v21 = objc_msgSend(-[NSSQLModel entityNamed:](v8, "entityNamed:", NSStringFromClass(v20)), "tableName");
  if (v3 && (-[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)v3, v21, 0) & 1) != 0)
  {
    *(_QWORD *)v423 = 0;
    *(_QWORD *)&v423[8] = v423;
    *(_QWORD *)&v423[16] = 0x2020000000;
    v424 = 0;
    if (v8)
      entitiesByName = v8->_entitiesByName;
    else
      entitiesByName = 0;
    v23 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v429 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v429 + 1) = 3221225472;
    *(_QWORD *)&v430 = __70__PFCloudKitMetadataModelMigrator_prepareContextWithConnection_error___block_invoke;
    *((_QWORD *)&v430 + 1) = &unk_1E1EE1A48;
    *(_QWORD *)&v431 = v14;
    *((_QWORD *)&v431 + 1) = v423;
    v24 = -[NSKnownKeysDictionary enumerateKeysAndObjectsUsingBlock:](entitiesByName, "enumerateKeysAndObjectsUsingBlock:", &v429);
    if (*(_BYTE *)(*(_QWORD *)&v423[8] + 24))
    {
      v25 = (void *)MEMORY[0x18D76B4E4](v24);
      v26 = __ckLoggingOverride;
      v27 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Migration discovered mutated entity IDs, precomputing z_ent changes."));
      v34 = v26 >= 0x10 ? 16 : v26;
      _NSCoreDataLog(v34, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"-[PFCloudKitMetadataModelMigrator prepareContextWithConnection:error:]");
      objc_autoreleasePoolPop(v25);
      v35 = -[PFCloudKitMetadataModelMigrator computeAncillaryEntityPrimaryKeyTableEntriesForStore:error:]((uint64_t)v2, v2[1], v441 + 5);
      *(_BYTE *)(*((_QWORD *)&v425 + 1) + 24) = v35;
      if (!v35)
        v36 = (id)v441[5];
    }
    v37 = (void *)v2[2];
    *(_QWORD *)v446 = v23;
    *(_QWORD *)&v446[8] = 3221225472;
    *(_QWORD *)&v446[16] = __70__PFCloudKitMetadataModelMigrator_prepareContextWithConnection_error___block_invoke_2;
    v447 = &unk_1E1EDDC88;
    v448 = v2;
    v449 = (id *)&v425;
    v450 = &v440;
    objc_msgSend(v37, "performBlockAndWait:", v446);
    _Block_object_dispose(v423, 8);
  }
  else
  {
    v38 = v2[3];
    if (v38)
    {
      *(_BYTE *)(v38 + 33) = 1;
      v39 = v2[3];
      if (v39)
        *(_BYTE *)(v39 + 37) = 1;
    }
  }

  if (!*(_BYTE *)(*((_QWORD *)&v425 + 1) + 24))
  {
    v40 = (id)v441[5];
    if (v40)
    {
      *(_QWORD *)(v4 + 40) = v40;
    }
    else
    {
      v41 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v41, v42, v43, v44, v45, v46, v47, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      v48 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v423 = 136315394;
        *(_QWORD *)&v423[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        *(_WORD *)&v423[12] = 1024;
        *(_DWORD *)&v423[14] = 186;
        _os_log_fault_impl(&dword_18A253000, v48, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v423, 0x12u);
      }
    }
  }

  v441[5] = 0;
  v49 = *(unsigned __int8 *)(*((_QWORD *)&v425 + 1) + 24);
  _Block_object_dispose(&v440, 8);
  _Block_object_dispose(&v425, 8);
  if (!v49)
    goto LABEL_386;
  v50 = a1[4];
  if (a2)
  {
    v51 = *(void **)(a2 + 24);
    if (!v50)
      goto LABEL_386;
  }
  else
  {
    v51 = 0;
    if (!v50)
      goto LABEL_386;
  }
  v339 = *(_QWORD *)(a1[6] + 8);
  v407 = 0;
  v408 = &v407;
  v409 = 0x2020000000;
  v410 = 1;
  v401 = 0;
  v402 = &v401;
  v403 = 0x3052000000;
  v404 = __Block_byref_object_copy__57;
  v405 = __Block_byref_object_dispose__57;
  v406 = 0;
  v52 = *(_QWORD *)(v50 + 24);
  v347 = v51;
  if (!v52)
  {
    v399 = 0u;
    v400 = 0u;
    v397 = 0u;
    v398 = 0u;
    goto LABEL_50;
  }
  if (!*(_BYTE *)(v52 + 34))
  {
    v399 = 0u;
    v400 = 0u;
    v397 = 0u;
    v398 = 0u;
LABEL_48:
    v58 = *(_QWORD *)(v52 + 56);
    if (v58)
      v52 = *(_QWORD *)(v58 + 40);
    else
      v52 = 0;
    goto LABEL_50;
  }
  v53 = (NSSQLiteStatement *)objc_msgSend(v51, "adapter");
  v411 = 0u;
  v412 = 0u;
  v413 = 0u;
  v414 = 0u;
  v54 = objc_msgSend(&unk_1E1F52728, "countByEnumeratingWithState:objects:count:", &v411, v446, 16);
  if (v54)
  {
    v55 = *(_QWORD *)v412;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v412 != v55)
          objc_enumerationMutation(&unk_1E1F52728);
        v57 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:](v53, *(_QWORD *)(*((_QWORD *)&v411 + 1) + 8 * i));
        objc_msgSend(*(id *)(v52 + 8), "addObject:", v57);
        *(_BYTE *)(v52 + 32) = 1;

      }
      v54 = objc_msgSend(&unk_1E1F52728, "countByEnumeratingWithState:objects:count:", &v411, v446, 16);
    }
    while (v54);
  }
  v52 = *(_QWORD *)(v50 + 24);
  v399 = 0u;
  v400 = 0u;
  v397 = 0u;
  v398 = 0u;
  v51 = v347;
  if (v52)
    goto LABEL_48;
LABEL_50:
  v59 = objc_msgSend((id)v52, "countByEnumeratingWithState:objects:count:", &v397, &v440, 16);
  if (v59)
  {
    v348 = *(_QWORD *)v398;
    v344 = v52;
    do
    {
      v349 = 0;
      v345 = v59;
      do
      {
        if (*(_QWORD *)v398 != v348)
          objc_enumerationMutation((id)v52);
        if (!*((_BYTE *)v408 + 24))
          goto LABEL_354;
        v60 = *(id **)(*((_QWORD *)&v397 + 1) + 8 * v349);
        v61 = objc_msgSend(v60, "tableName");
        if (!v51 || (-[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)v51, v61, 0) & 1) == 0)
        {
          v67 = *(_QWORD *)(v50 + 24);
          if (!v67)
            goto LABEL_161;
LABEL_159:
          objc_msgSend(*(id *)(v67 + 16), "addObject:", v60);
          v155 = (_BYTE *)(v67 + 32);
LABEL_160:
          *v155 = 1;
          goto LABEL_161;
        }
        if (!-[NSSQLiteConnection _tableHasRows:]((_BOOL8)v51, objc_msgSend(v60, "tableName")))
        {
          v68 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:]((NSSQLiteStatement *)objc_msgSend(v51, "adapter"), objc_msgSend(v60, "tableName"));
          v69 = *(_QWORD *)(v50 + 24);
          if (v69)
          {
            objc_msgSend(*(id *)(v69 + 8), "addObject:", v68);
            *(_BYTE *)(v69 + 32) = 1;
          }

          v67 = *(_QWORD *)(v50 + 24);
          if (v67)
            goto LABEL_159;
          goto LABEL_161;
        }
        v62 = -[NSSQLiteConnection fetchTableCreationSQLContaining:](v51, (void *)objc_msgSend(v60, "tableName"));
        v414 = 0u;
        v413 = 0u;
        v412 = 0u;
        v411 = 0u;
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v411, v446, 16);
        if (v63)
        {
          v64 = *(_QWORD *)v412;
LABEL_61:
          v65 = 0;
          while (1)
          {
            if (*(_QWORD *)v412 != v64)
              objc_enumerationMutation(v62);
            v66 = *(void **)(*((_QWORD *)&v411 + 1) + 8 * v65);
            if ((objc_msgSend((id)objc_msgSend(v66, "objectAtIndex:", 0), "isEqualToString:", objc_msgSend(v60, "tableName")) & 1) != 0)break;
            if (v63 == ++v65)
            {
              v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v411, v446, 16);
              if (v63)
                goto LABEL_61;
              goto LABEL_75;
            }
          }
          v351 = (id)objc_msgSend(v66, "objectAtIndex:", 1);
          if (v351)
            goto LABEL_78;
        }
LABEL_75:
        v70 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Couldn't find sql for table '%@', did you check if it exists first?");
        v71 = objc_msgSend(v60, "tableName");
        _NSCoreDataLog(17, v70, v72, v73, v74, v75, v76, v77, v71);
        v78 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          v131 = objc_msgSend(v60, "tableName");
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v131;
          _os_log_fault_impl(&dword_18A253000, v78, OS_LOG_TYPE_FAULT, "CoreData: Couldn't find sql for table '%@', did you check if it exists first?", (uint8_t *)&buf, 0xCu);
        }
        v351 = 0;
LABEL_78:
        v79 = (void *)objc_msgSend(v60, "name");
        v80 = (objc_class *)objc_opt_class();
        if ((objc_msgSend(v79, "isEqualToString:", NSStringFromClass(v80)) & 1) == 0)
        {
          v81 = (void *)objc_msgSend(v60, "name");
          v82 = (objc_class *)objc_opt_class();
          if (!objc_msgSend(v81, "isEqualToString:", NSStringFromClass(v82)))
          {
            v122 = (void *)objc_msgSend(v60, "name");
            v123 = (objc_class *)objc_opt_class();
            if (!objc_msgSend(v122, "isEqualToString:", NSStringFromClass(v123)))
              goto LABEL_153;
            v124 = *(void **)(v50 + 16);
            v388[0] = MEMORY[0x1E0C809B0];
            v388[1] = 3221225472;
            v388[2] = __79__PFCloudKitMetadataModelMigrator_calculateMigrationStepsWithConnection_error___block_invoke;
            v388[3] = &unk_1E1EE1A70;
            v388[4] = v50;
            v388[5] = v60;
            v388[6] = &v401;
            v388[7] = &v407;
            objc_msgSend(v124, "performBlockAndWait:", v388);
            objc_msgSend(*(id *)(v50 + 24), "addConstrainedEntityToPreflight:", v60);
            v125 = objc_msgSend(v347, "adapter");
            if (v125)
              v126 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v125, (uint64_t)v60, 0);
            else
              v126 = 0;
            v386 = 0u;
            v387 = 0u;
            v384 = 0u;
            v385 = 0u;
            v127 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v384, v423, 16);
            if (v127)
            {
              v128 = *(_QWORD *)v385;
              do
              {
                for (j = 0; j != v127; ++j)
                {
                  if (*(_QWORD *)v385 != v128)
                    objc_enumerationMutation(v126);
                  v130 = *(_QWORD *)(v50 + 24);
                  if (v130)
                  {
                    objc_msgSend(*(id *)(v130 + 8), "addObject:", *(_QWORD *)(*((_QWORD *)&v384 + 1) + 8 * j));
                    *(_BYTE *)(v130 + 32) = 1;
                  }
                }
                v127 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v384, v423, 16);
              }
              while (v127);
            }
LABEL_136:

            goto LABEL_153;
          }
        }
        v83 = *(_QWORD *)(v50 + 24);
        if (v83)
          v84 = *(void **)(v83 + 72);
        else
          v84 = 0;
        v85 = objc_msgSend(v84, "entityNamed:", objc_msgSend(v60, "name"));
        if (objc_msgSend(v351, "containsString:", CFSTR("ZENTITYNAME")))
          -[PFCloudKitMetadataModelMigrator addMigrationStatementToContext:forRenamingAttributeNamed:withOldColumnName:toAttributeName:onOldSQLEntity:andCurrentSQLEntity:](*(_QWORD *)(v50 + 24), (uint64_t)CFSTR("entityName"), (uint64_t)CFSTR("ZENTITYNAME"), (uint64_t)CFSTR("cdEntityName"), v85, v60);
        if (objc_msgSend(v351, "containsString:", CFSTR("ZISDELETED")))
          -[PFCloudKitMetadataModelMigrator addMigrationStatementToContext:forRenamingAttributeNamed:withOldColumnName:toAttributeName:onOldSQLEntity:andCurrentSQLEntity:](*(_QWORD *)(v50 + 24), (uint64_t)CFSTR("isDeleted"), (uint64_t)CFSTR("ZISDELETED"), (uint64_t)CFSTR("needsDelete"), v85, v60);
        v86 = (void *)objc_msgSend(v60, "name");
        v87 = (objc_class *)objc_opt_class();
        if (!objc_msgSend(v86, "isEqualToString:", NSStringFromClass(v87)))
        {
          v97 = (void *)objc_msgSend(v60, "name");
          v98 = (objc_class *)objc_opt_class();
          if (!objc_msgSend(v97, "isEqualToString:", NSStringFromClass(v98)))
            goto LABEL_153;
          v391 = 0u;
          v392 = 0u;
          v389 = 0u;
          v390 = 0u;
          v99 = objc_msgSend(&unk_1E1F52608, "countByEnumeratingWithState:objects:count:", &v389, &v425, 16);
          if (!v99)
            goto LABEL_153;
          v100 = *(_QWORD *)v390;
          while (2)
          {
            v101 = 0;
LABEL_100:
            if (*(_QWORD *)v390 != v100)
              objc_enumerationMutation(&unk_1E1F52608);
            v102 = *(void **)(*((_QWORD *)&v389 + 1) + 8 * v101);
            if (v60)
              v103 = (_BYTE *)objc_msgSend(v60[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v389 + 1) + 8 * v101));
            else
              v103 = 0;
            if ((objc_msgSend(v351, "containsString:", objc_msgSend(v103, "columnName")) & 1) != 0)
            {
              v104 = (void *)MEMORY[0x18D76B4E4]();
              if ((unint64_t)__ckLoggingOverride >= 9)
                v105 = 9;
              else
                v105 = __ckLoggingOverride;
              v106 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Skipping migration for '%@' because it already has a column named '%@'"));
              objc_msgSend(v60, "tableName");
              objc_msgSend(v103, "columnName");
              _NSCoreDataLog(v105, v106, v107, v108, v109, v110, v111, v112, (uint64_t)"-[PFCloudKitMetadataModelMigrator calculateMigrationStepsWithConnection:error:]");
              objc_autoreleasePoolPop(v104);
LABEL_114:
              if (v99 == ++v101)
              {
                v121 = objc_msgSend(&unk_1E1F52608, "countByEnumeratingWithState:objects:count:", &v389, &v425, 16);
                v99 = v121;
                if (!v121)
                  goto LABEL_153;
                continue;
              }
              goto LABEL_100;
            }
            break;
          }
          -[PFCloudKitMetadataModelMigrator addMigrationStatementForAddingAttribute:toContext:inStore:](v103, *(_QWORD *)(v50 + 24), *(void **)(v50 + 8));
          if ((objc_msgSend(v102, "isEqualToString:", CFSTR("recordZoneName")) & 1) != 0
            || objc_msgSend(v102, "isEqualToString:", CFSTR("relatedRecordZoneName")))
          {
            v113 = [NSSQLiteStatement alloc];
            v114 = -[NSSQLiteStatement initWithEntity:sqlString:](v113, "initWithEntity:sqlString:", v60, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = '%@'"), objc_msgSend(v60, "tableName"), objc_msgSend(v103, "columnName"), CFSTR("com.apple.coredata.cloudkit.zone")));
            v115 = *(_QWORD *)(v50 + 24);
            if (v115)
            {
              objc_msgSend(*(id *)(v115 + 8), "addObject:", v114);
              *(_BYTE *)(v115 + 32) = 1;
            }
          }
          else
          {
            if ((objc_msgSend(v102, "isEqualToString:", CFSTR("recordZoneOwnerName")) & 1) == 0
              && !objc_msgSend(v102, "isEqualToString:", CFSTR("relatedRecordZoneOwnerName")))
            {
              goto LABEL_114;
            }
            v116 = [NSSQLiteStatement alloc];
            v117 = (void *)MEMORY[0x1E0CB3940];
            v118 = objc_msgSend(v60, "tableName");
            v119 = objc_msgSend(v103, "columnName");
            v114 = -[NSSQLiteStatement initWithEntity:sqlString:](v116, "initWithEntity:sqlString:", v60, objc_msgSend(v117, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = '%@'"), v118, v119, getCloudKitCKCurrentUserDefaultName[0]()));
            v120 = *(_QWORD *)(v50 + 24);
            if (v120)
            {
              objc_msgSend(*(id *)(v120 + 8), "addObject:", v114);
              *(_BYTE *)(v120 + 32) = 1;
            }
          }

          goto LABEL_114;
        }
        if (v60)
          v88 = (void *)objc_msgSend(v60[5], "objectForKey:", CFSTR("recordZone"));
        else
          v88 = 0;
        if ((objc_msgSend(v351, "containsString:", objc_msgSend(v88, "columnName")) & 1) == 0)
        {
          v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ALTER TABLE %@ ADD COLUMN %@ INTEGER"), objc_msgSend(v60, "tableName"), objc_msgSend(v88, "columnName"));
          v90 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v60, v89);
          v91 = *(_QWORD *)(v50 + 24);
          if (v91)
          {
            objc_msgSend(*(id *)(v91 + 8), "addObject:", v90);
            *(_BYTE *)(v91 + 32) = 1;
            v92 = *(_QWORD *)(v50 + 24);
            if (v92)
              *(_BYTE *)(v92 + 35) = 1;
          }

          v93 = *(uint64_t **)(v50 + 16);
          v94 = *(uint64_t **)(v50 + 24);
          v95 = v402;
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v438 = 0x2020000000;
          v439 = 1;
          *(_QWORD *)&v411 = 0;
          *((_QWORD *)&v411 + 1) = &v411;
          *(_QWORD *)&v412 = 0x3052000000;
          *((_QWORD *)&v412 + 1) = __Block_byref_object_copy__57;
          *(_QWORD *)&v413 = __Block_byref_object_dispose__57;
          *((_QWORD *)&v413 + 1) = 0;
          *(_QWORD *)v446 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v446[8] = 3221225472;
          *(_QWORD *)&v446[16] = __149__PFCloudKitMetadataModelMigrator_addMigrationStatementsToDeleteDuplicateMirroredRelationshipsToContext_withManagedObjectContext_andSQLEntity_error___block_invoke;
          v447 = &unk_1E1EE1B10;
          v448 = v93;
          v449 = v60;
          v451 = &v411;
          v450 = v94;
          p_buf = &buf;
          objc_msgSend(v93, "performBlockAndWait:", v446);
          if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
          {
            v96 = *(id *)(*((_QWORD *)&v411 + 1) + 40);
            if (v96)
            {
              v95[5] = (uint64_t)v96;
            }
            else
            {
              v132 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
              _NSCoreDataLog(17, v132, v133, v134, v135, v136, v137, v138, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
              v139 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)v433 = 136315394;
                v434 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
                v435 = 1024;
                v436 = 1697;
                _os_log_fault_impl(&dword_18A253000, v139, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v433, 0x12u);
              }
            }
          }

          *(_QWORD *)(*((_QWORD *)&v411 + 1) + 40) = 0;
          v140 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
          _Block_object_dispose(&v411, 8);
          _Block_object_dispose(&buf, 8);
          if (!v140)
          {
            *((_BYTE *)v408 + 24) = 0;
            v146 = (id)v402[5];
            goto LABEL_153;
          }
          v141 = objc_msgSend(v347, "adapter");
          if (v141)
            v126 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v141, (uint64_t)v60, 0);
          else
            v126 = 0;
          v395 = 0u;
          v396 = 0u;
          v393 = 0u;
          v394 = 0u;
          v142 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v393, &v429, 16);
          if (v142)
          {
            v143 = *(_QWORD *)v394;
            do
            {
              for (k = 0; k != v142; ++k)
              {
                if (*(_QWORD *)v394 != v143)
                  objc_enumerationMutation(v126);
                v145 = *(_QWORD *)(v50 + 24);
                if (v145)
                {
                  objc_msgSend(*(id *)(v145 + 8), "addObject:", *(_QWORD *)(*((_QWORD *)&v393 + 1) + 8 * k));
                  *(_BYTE *)(v145 + 32) = 1;
                }
              }
              v142 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v393, &v429, 16);
            }
            while (v142);
          }
          goto LABEL_136;
        }
LABEL_153:
        v51 = v347;
        v52 = v344;
        v59 = v345;
        v147 = (void *)objc_msgSend(v60, "name");
        v148 = (objc_class *)objc_opt_class();
        if ((objc_msgSend(v147, "isEqualToString:", NSStringFromClass(v148)) & 1) != 0
          || (v149 = (void *)objc_msgSend(v60, "name"),
              v150 = (objc_class *)objc_opt_class(),
              (objc_msgSend(v149, "isEqualToString:", NSStringFromClass(v150)) & 1) != 0)
          || (v151 = (void *)objc_msgSend(v60, "name"),
              v152 = (objc_class *)objc_opt_class(),
              objc_msgSend(v151, "isEqualToString:", NSStringFromClass(v152))))
        {
          v153 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:]((NSSQLiteStatement *)objc_msgSend(v347, "adapter"), objc_msgSend(v60, "tableName"));
          v154 = *(_QWORD *)(v50 + 24);
          if (v154)
          {
            objc_msgSend(*(id *)(v154 + 8), "addObject:", v153);
            *(_BYTE *)(v154 + 32) = 1;
          }

          v67 = *(_QWORD *)(v50 + 24);
          if (v67)
            goto LABEL_159;
        }
        else
        {
          v156 = (void *)objc_msgSend(v60, "name");
          v157 = (objc_class *)objc_opt_class();
          if (objc_msgSend(v156, "isEqualToString:", NSStringFromClass(v157)))
          {
            v382 = 0u;
            v383 = 0u;
            v380 = 0u;
            v381 = 0u;
            v158 = objc_msgSend(&unk_1E1F52638, "countByEnumeratingWithState:objects:count:", &v380, v422, 16);
            if (v158)
            {
              v159 = *(_QWORD *)v381;
              do
              {
                v160 = 0;
                do
                {
                  if (*(_QWORD *)v381 != v159)
                    objc_enumerationMutation(&unk_1E1F52638);
                  if (v60)
                    v161 = (_BYTE *)objc_msgSend(v60[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v380 + 1) + 8 * v160));
                  else
                    v161 = 0;
                  if ((objc_msgSend(v351, "containsString:", objc_msgSend(v161, "columnName")) & 1) != 0)
                  {
                    v162 = (void *)MEMORY[0x18D76B4E4]();
                    if ((unint64_t)__ckLoggingOverride >= 9)
                      v163 = 9;
                    else
                      v163 = __ckLoggingOverride;
                    v164 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Skipping migration for '%@' because it already has a column named '%@'"));
                    objc_msgSend(v60, "tableName");
                    objc_msgSend(v161, "columnName");
                    _NSCoreDataLog(v163, v164, v165, v166, v167, v168, v169, v170, (uint64_t)"-[PFCloudKitMetadataModelMigrator calculateMigrationStepsWithConnection:error:]");
                    objc_autoreleasePoolPop(v162);
                  }
                  else
                  {
                    -[PFCloudKitMetadataModelMigrator addMigrationStatementForAddingAttribute:toContext:inStore:](v161, *(_QWORD *)(v50 + 24), *(void **)(v50 + 8));
                  }
                  ++v160;
                }
                while (v158 != v160);
                v171 = objc_msgSend(&unk_1E1F52638, "countByEnumeratingWithState:objects:count:", &v380, v422, 16);
                v158 = v171;
              }
              while (v171);
            }
            objc_msgSend(*(id *)(v50 + 24), "addConstrainedEntityToPreflight:", v60);
            v172 = objc_msgSend(v347, "adapter");
            if (v172)
              v173 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v172, (uint64_t)v60, 0);
            else
              v173 = 0;
            v378 = 0u;
            v379 = 0u;
            v376 = 0u;
            v377 = 0u;
            v174 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v376, v421, 16);
            if (v174)
            {
              v175 = *(_QWORD *)v377;
              do
              {
                for (m = 0; m != v174; ++m)
                {
                  if (*(_QWORD *)v377 != v175)
                    objc_enumerationMutation(v173);
                  v177 = *(_QWORD *)(v50 + 24);
                  if (v177)
                  {
                    objc_msgSend(*(id *)(v177 + 8), "addObject:", *(_QWORD *)(*((_QWORD *)&v376 + 1) + 8 * m));
                    *(_BYTE *)(v177 + 32) = 1;
                  }
                }
                v174 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v376, v421, 16);
              }
              while (v174);
            }

            v51 = v347;
          }
          v178 = (void *)objc_msgSend(v60, "name");
          v179 = (objc_class *)objc_opt_class();
          if ((objc_msgSend(v178, "isEqualToString:", NSStringFromClass(v179)) & 1) != 0
            || (v180 = (void *)objc_msgSend(v60, "name"),
                v181 = (objc_class *)objc_opt_class(),
                objc_msgSend(v180, "isEqualToString:", NSStringFromClass(v181))))
          {
            if (objc_msgSend(v351, "containsString:", CFSTR("ZHASCHANGES")))
            {
              v182 = (void *)objc_msgSend(v60, "name");
              v183 = (objc_class *)objc_opt_class();
              v350 = objc_msgSend(v182, "isEqualToString:", NSStringFromClass(v183));
              v184 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("CREATE TEMPORARY TABLE %@_tmp("), objc_msgSend(v60, "tableName"));
              v343 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("INSERT INTO %@_tmp ("), objc_msgSend(v60, "tableName"));
              v341 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT"));
              v342 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("INSERT INTO %@ ("), objc_msgSend(v60, "tableName"));
              v185 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT"));
              v186 = v60;
              while (v186)
              {
                v187 = v186;
                v186 = (id *)v186[21];
                if (v186 == v187)
                {
                  v188 = v187[9];
                  goto LABEL_200;
                }
              }
              v188 = 0;
LABEL_200:
              v189 = objc_msgSend(v188, "count");
              v190 = v189;
              if (v189)
              {
                v191 = 0;
                v192 = v189 - 1;
                do
                {
                  v193 = v60;
                  while (v193)
                  {
                    v194 = v193;
                    v193 = (id *)v193[21];
                    if (v193 == v194)
                    {
                      v195 = v194[9];
                      goto LABEL_206;
                    }
                  }
                  v195 = 0;
LABEL_206:
                  v196 = (void *)objc_msgSend(v195, "objectAtIndexedSubscript:", v191);
                  if (objc_msgSend(v351, "containsString:", objc_msgSend(v196, "columnName")))
                  {
                    objc_msgSend(v184, "appendFormat:", CFSTR(" %@"), objc_msgSend(v196, "columnName"));
                    objc_msgSend(v343, "appendFormat:", CFSTR(" %@"), objc_msgSend(v196, "columnName"));
                    objc_msgSend(v342, "appendFormat:", CFSTR(" %@"), objc_msgSend(v196, "columnName"));
                    objc_msgSend(v185, "appendFormat:", CFSTR(" %@"), objc_msgSend(v196, "columnName"));
                    objc_msgSend(v341, "appendFormat:", CFSTR(" %@"), objc_msgSend(v196, "columnName"));
                    if (v191 < v192)
                    {
                      objc_msgSend(v184, "appendString:", CFSTR(","));
                      objc_msgSend(v343, "appendString:", CFSTR(","));
                      objc_msgSend(v342, "appendString:", CFSTR(","));
                      objc_msgSend(v185, "appendString:", CFSTR(","));
                      objc_msgSend(v341, "appendString:", CFSTR(","));
                    }
                  }
                  ++v191;
                }
                while (v191 != v190);
              }
              objc_msgSend(v184, "appendString:", CFSTR(")"));
              objc_msgSend(v342, "appendString:", CFSTR(")"));
              objc_msgSend(v343, "appendString:", CFSTR(")"));
              objc_msgSend(v341, "appendFormat:", CFSTR(" FROM %@"), objc_msgSend(v60, "tableName"));
              objc_msgSend(v185, "appendFormat:", CFSTR(" FROM %@_tmp"), objc_msgSend(v60, "tableName"));
              v197 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v60, v184);
              v198 = *(_QWORD *)(v50 + 24);
              if (v198)
              {
                objc_msgSend(*(id *)(v198 + 8), "addObject:", v197);
                *(_BYTE *)(v198 + 32) = 1;
              }

              v199 = [NSSQLiteStatement alloc];
              v200 = -[NSSQLiteStatement initWithEntity:sqlString:](v199, "initWithEntity:sqlString:", v60, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v343, v341));
              v201 = *(_QWORD *)(v50 + 24);
              if (v201)
              {
                objc_msgSend(*(id *)(v201 + 8), "addObject:", v200);
                *(_BYTE *)(v201 + 32) = 1;
              }

              v202 = [NSSQLiteStatement alloc];
              v203 = -[NSSQLiteStatement initWithEntity:sqlString:](v202, "initWithEntity:sqlString:", v60, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE %@"), objc_msgSend(v60, "tableName")));
              v204 = *(_QWORD *)(v50 + 24);
              if (v204)
              {
                objc_msgSend(*(id *)(v204 + 8), "addObject:", v203);
                *(_BYTE *)(v204 + 32) = 1;
              }

              v205 = -[NSSQLiteAdapter newCreateTableStatementForEntity:]((const __CFString *)objc_msgSend(v51, "adapter"), v60);
              v351 = -[NSSQLiteStatement sqlString](v205, "sqlString");
              v206 = *(_QWORD *)(v50 + 24);
              if (v206)
              {
                objc_msgSend(*(id *)(v206 + 8), "addObject:", v205);
                *(_BYTE *)(v206 + 32) = 1;
              }

              v207 = [NSSQLiteStatement alloc];
              v208 = -[NSSQLiteStatement initWithEntity:sqlString:](v207, "initWithEntity:sqlString:", v60, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v342, v185));
              v209 = *(_QWORD *)(v50 + 24);
              if (v209)
              {
                objc_msgSend(*(id *)(v209 + 8), "addObject:", v208);
                *(_BYTE *)(v209 + 32) = 1;
              }

              v210 = [NSSQLiteStatement alloc];
              v211 = -[NSSQLiteStatement initWithEntity:sqlString:](v210, "initWithEntity:sqlString:", v60, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE %@_tmp"), objc_msgSend(v60, "tableName")));
              v212 = *(_QWORD *)(v50 + 24);
              if (v212)
              {
                objc_msgSend(*(id *)(v212 + 8), "addObject:", v211);
                *(_BYTE *)(v212 + 32) = 1;
                v213 = *(void **)(v50 + 24);
              }
              else
              {
                v213 = 0;
              }
              objc_msgSend(v213, "addConstrainedEntityToPreflight:", v60);
              v214 = v184;
              v215 = objc_msgSend(v51, "adapter");
              if (v215)
                v216 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v215, (uint64_t)v60, 0);
              else
                v216 = 0;
              v217 = v185;
              v374 = 0u;
              v375 = 0u;
              v372 = 0u;
              v373 = 0u;
              v218 = objc_msgSend(v216, "countByEnumeratingWithState:objects:count:", &v372, v420, 16);
              if (v218)
              {
                v219 = *(_QWORD *)v373;
                do
                {
                  for (n = 0; n != v218; ++n)
                  {
                    if (*(_QWORD *)v373 != v219)
                      objc_enumerationMutation(v216);
                    v221 = *(_QWORD *)(v50 + 24);
                    if (v221)
                    {
                      objc_msgSend(*(id *)(v221 + 8), "addObject:", *(_QWORD *)(*((_QWORD *)&v372 + 1) + 8 * n));
                      *(_BYTE *)(v221 + 32) = 1;
                    }
                  }
                  v218 = objc_msgSend(v216, "countByEnumeratingWithState:objects:count:", &v372, v420, 16);
                }
                while (v218);
              }

            }
            else
            {
              v350 = 0;
            }
            v370 = 0u;
            v371 = 0u;
            v368 = 0u;
            v369 = 0u;
            v222 = objc_msgSend(&unk_1E1F52650, "countByEnumeratingWithState:objects:count:", &v368, v419, 16);
            if (v222)
            {
              v223 = *(_QWORD *)v369;
              do
              {
                v224 = 0;
                do
                {
                  if (*(_QWORD *)v369 != v223)
                    objc_enumerationMutation(&unk_1E1F52650);
                  if (v60)
                    v225 = (_BYTE *)objc_msgSend(v60[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v368 + 1) + 8 * v224));
                  else
                    v225 = 0;
                  if ((objc_msgSend(v351, "containsString:", objc_msgSend(v225, "columnName")) & 1) != 0)
                  {
                    v226 = (void *)MEMORY[0x18D76B4E4]();
                    if ((unint64_t)__ckLoggingOverride >= 9)
                      v227 = 9;
                    else
                      v227 = __ckLoggingOverride;
                    v228 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Skipping migration for '%@' because it already has a column named '%@'"));
                    objc_msgSend(v60, "tableName");
                    objc_msgSend(v225, "columnName");
                    _NSCoreDataLog(v227, v228, v229, v230, v231, v232, v233, v234, (uint64_t)"-[PFCloudKitMetadataModelMigrator calculateMigrationStepsWithConnection:error:]");
                    objc_autoreleasePoolPop(v226);
                  }
                  else
                  {
                    -[PFCloudKitMetadataModelMigrator addMigrationStatementForAddingAttribute:toContext:inStore:](v225, *(_QWORD *)(v50 + 24), *(void **)(v50 + 8));
                  }
                  ++v224;
                }
                while (v222 != v224);
                v235 = objc_msgSend(&unk_1E1F52650, "countByEnumeratingWithState:objects:count:", &v368, v419, 16);
                v222 = v235;
              }
              while (v235);
            }
            v236 = (void *)objc_msgSend(v60, "name");
            v237 = (objc_class *)objc_opt_class();
            if (objc_msgSend(v236, "isEqualToString:", NSStringFromClass(v237)))
            {
              v366 = 0u;
              v367 = 0u;
              v364 = 0u;
              v365 = 0u;
              v238 = objc_msgSend(&unk_1E1F52668, "countByEnumeratingWithState:objects:count:", &v364, v418, 16);
              if (v238)
              {
                v239 = *(_QWORD *)v365;
                do
                {
                  v240 = 0;
                  do
                  {
                    if (*(_QWORD *)v365 != v239)
                      objc_enumerationMutation(&unk_1E1F52668);
                    if (v60)
                      v241 = (_BYTE *)objc_msgSend(v60[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v364 + 1) + 8 * v240));
                    else
                      v241 = 0;
                    if ((objc_msgSend(v351, "containsString:", objc_msgSend(v241, "columnName")) & 1) != 0)
                    {
                      v242 = (void *)MEMORY[0x18D76B4E4]();
                      if ((unint64_t)__ckLoggingOverride >= 9)
                        v243 = 9;
                      else
                        v243 = __ckLoggingOverride;
                      v244 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Skipping migration for '%@' because it already has a column named '%@'"));
                      objc_msgSend(v60, "tableName");
                      objc_msgSend(v241, "columnName");
                      _NSCoreDataLog(v243, v244, v245, v246, v247, v248, v249, v250, (uint64_t)"-[PFCloudKitMetadataModelMigrator calculateMigrationStepsWithConnection:error:]");
                      objc_autoreleasePoolPop(v242);
                    }
                    else
                    {
                      -[PFCloudKitMetadataModelMigrator addMigrationStatementForAddingAttribute:toContext:inStore:](v241, *(_QWORD *)(v50 + 24), *(void **)(v50 + 8));
                      v350 = 1;
                    }
                    ++v240;
                  }
                  while (v238 != v240);
                  v251 = objc_msgSend(&unk_1E1F52668, "countByEnumeratingWithState:objects:count:", &v364, v418, 16);
                  v238 = v251;
                }
                while (v251);
              }
              v362 = 0u;
              v363 = 0u;
              v360 = 0u;
              v361 = 0u;
              v252 = objc_msgSend(&unk_1E1F52680, "countByEnumeratingWithState:objects:count:", &v360, v417, 16);
              if (v252)
              {
                v253 = *(_QWORD *)v361;
                do
                {
                  v254 = 0;
                  do
                  {
                    if (*(_QWORD *)v361 != v253)
                      objc_enumerationMutation(&unk_1E1F52680);
                    if (v60)
                      v255 = (_BYTE *)objc_msgSend(v60[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v360 + 1) + 8 * v254));
                    else
                      v255 = 0;
                    if ((objc_msgSend(v351, "containsString:", objc_msgSend(v255, "columnName")) & 1) != 0)
                    {
                      v256 = (void *)MEMORY[0x18D76B4E4]();
                      if ((unint64_t)__ckLoggingOverride >= 9)
                        v257 = 9;
                      else
                        v257 = __ckLoggingOverride;
                      v258 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Skipping migration for '%@' because it already has a column named '%@'"));
                      objc_msgSend(v60, "tableName");
                      objc_msgSend(v255, "columnName");
                      _NSCoreDataLog(v257, v258, v259, v260, v261, v262, v263, v264, (uint64_t)"-[PFCloudKitMetadataModelMigrator calculateMigrationStepsWithConnection:error:]");
                      objc_autoreleasePoolPop(v256);
                    }
                    else
                    {
                      -[PFCloudKitMetadataModelMigrator addMigrationStatementForAddingAttribute:toContext:inStore:](v255, *(_QWORD *)(v50 + 24), *(void **)(v50 + 8));
                    }
                    ++v254;
                  }
                  while (v252 != v254);
                  v265 = objc_msgSend(&unk_1E1F52680, "countByEnumeratingWithState:objects:count:", &v360, v417, 16);
                  v252 = v265;
                }
                while (v265);
              }
            }
            if ((v350 & 1) != 0)
            {
              v266 = [NSSQLiteStatement alloc];
              v267 = (void *)MEMORY[0x1E0CB3940];
              v268 = objc_msgSend(v60, "tableName");
              if (v60)
                v269 = (void *)objc_msgSend(v60[5], "objectForKey:", CFSTR("hasRecordZoneNum"));
              else
                v269 = 0;
              v270 = -[NSSQLiteStatement initWithEntity:sqlString:](v266, "initWithEntity:sqlString:", v60, objc_msgSend(v267, "stringWithFormat:", CFSTR("UPDATE %@ SET %@=0"), v268, objc_msgSend(v269, "columnName")));
              v271 = *(_QWORD *)(v50 + 24);
              if (v271)
              {
                objc_msgSend(*(id *)(v271 + 8), "addObject:", v270);
                *(_BYTE *)(v271 + 32) = 1;
              }

            }
          }
          v272 = (void *)objc_msgSend(v60, "name");
          v273 = (objc_class *)objc_opt_class();
          if (objc_msgSend(v272, "isEqualToString:", NSStringFromClass(v273)))
          {
            v358 = 0u;
            v359 = 0u;
            v356 = 0u;
            v357 = 0u;
            v274 = objc_msgSend(&unk_1E1F52698, "countByEnumeratingWithState:objects:count:", &v356, v416, 16);
            if (v274)
            {
              v275 = *(_QWORD *)v357;
              do
              {
                v276 = 0;
                do
                {
                  if (*(_QWORD *)v357 != v275)
                    objc_enumerationMutation(&unk_1E1F52698);
                  if (v60)
                    v277 = (_BYTE *)objc_msgSend(v60[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v356 + 1) + 8 * v276));
                  else
                    v277 = 0;
                  if ((objc_msgSend(v351, "containsString:", objc_msgSend(v277, "columnName")) & 1) != 0)
                  {
                    v278 = (void *)MEMORY[0x18D76B4E4]();
                    if ((unint64_t)__ckLoggingOverride >= 9)
                      v279 = 9;
                    else
                      v279 = __ckLoggingOverride;
                    v280 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Skipping migration for '%@' because it already has a column named '%@'"));
                    objc_msgSend(v60, "tableName");
                    objc_msgSend(v277, "columnName");
                    _NSCoreDataLog(v279, v280, v281, v282, v283, v284, v285, v286, (uint64_t)"-[PFCloudKitMetadataModelMigrator calculateMigrationStepsWithConnection:error:]");
                    objc_autoreleasePoolPop(v278);
                  }
                  else
                  {
                    -[PFCloudKitMetadataModelMigrator addMigrationStatementForAddingAttribute:toContext:inStore:](v277, *(_QWORD *)(v50 + 24), *(void **)(v50 + 8));
                  }
                  ++v276;
                }
                while (v274 != v276);
                v287 = objc_msgSend(&unk_1E1F52698, "countByEnumeratingWithState:objects:count:", &v356, v416, 16);
                v274 = v287;
              }
              while (v287);
            }
          }
          v288 = (void *)objc_msgSend(v60, "name");
          v289 = (objc_class *)objc_opt_class();
          if (objc_msgSend(v288, "isEqualToString:", NSStringFromClass(v289)))
          {
            v354 = 0u;
            v355 = 0u;
            v352 = 0u;
            v353 = 0u;
            v290 = objc_msgSend(&unk_1E1F526B0, "countByEnumeratingWithState:objects:count:", &v352, v415, 16);
            if (v290)
            {
              v291 = *(_QWORD *)v353;
              do
              {
                v292 = 0;
                do
                {
                  if (*(_QWORD *)v353 != v291)
                    objc_enumerationMutation(&unk_1E1F526B0);
                  if (v60)
                    v293 = (_BYTE *)objc_msgSend(v60[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v352 + 1) + 8 * v292));
                  else
                    v293 = 0;
                  if ((objc_msgSend(v351, "containsString:", objc_msgSend(v293, "columnName")) & 1) != 0)
                  {
                    v294 = (void *)MEMORY[0x18D76B4E4]();
                    if ((unint64_t)__ckLoggingOverride >= 9)
                      v295 = 9;
                    else
                      v295 = __ckLoggingOverride;
                    v296 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Skipping migration for '%@' because it already has a column named '%@'"));
                    objc_msgSend(v60, "tableName");
                    objc_msgSend(v293, "columnName");
                    _NSCoreDataLog(v295, v296, v297, v298, v299, v300, v301, v302, (uint64_t)"-[PFCloudKitMetadataModelMigrator calculateMigrationStepsWithConnection:error:]");
                    objc_autoreleasePoolPop(v294);
                  }
                  else
                  {
                    -[PFCloudKitMetadataModelMigrator addMigrationStatementForAddingAttribute:toContext:inStore:](v293, *(_QWORD *)(v50 + 24), *(void **)(v50 + 8));
                  }
                  ++v292;
                }
                while (v290 != v292);
                v303 = objc_msgSend(&unk_1E1F526B0, "countByEnumeratingWithState:objects:count:", &v352, v415, 16);
                v290 = v303;
              }
              while (v303);
            }
          }
          v304 = *(_QWORD *)(v50 + 24);
          if (v304)
            v305 = *(void **)(v304 + 80);
          else
            v305 = 0;
          v51 = v347;
          v52 = v344;
          v59 = v345;
          if (objc_msgSend(v305, "integerValue") <= 976)
          {
            v306 = [NSSQLiteStatement alloc];
            v307 = -[NSSQLiteStatement initWithEntity:sqlString:](v306, "initWithEntity:sqlString:", v60, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE %@ SET Z_OPT = 1 WHERE Z_OPT IS NULL OR Z_OPT <= 0"), objc_msgSend(v60, "tableName")));
            v308 = *(_QWORD *)(v50 + 24);
            if (v308)
            {
              objc_msgSend(*(id *)(v308 + 8), "addObject:", v307);
              *(_BYTE *)(v308 + 32) = 1;
            }

          }
          v309 = *(_QWORD *)(v50 + 24);
          if (v309)
            v310 = *(void **)(v309 + 80);
          else
            v310 = 0;
          if (objc_msgSend(v310, "integerValue") <= 1031)
          {
            v311 = *(_QWORD *)(v50 + 24);
            if (v311)
            {
              v155 = (_BYTE *)(v311 + 38);
              goto LABEL_160;
            }
          }
        }
LABEL_161:
        ++v349;
      }
      while (v349 != v59);
      v312 = objc_msgSend((id)v52, "countByEnumeratingWithState:objects:count:", &v397, &v440, 16);
      v59 = v312;
    }
    while (v312);
  }
LABEL_354:
  if (!*((_BYTE *)v408 + 24))
  {
    v313 = (id)v402[5];
    if (v313)
    {
      *(_QWORD *)(v339 + 40) = v313;
    }
    else
    {
      v314 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v314, v315, v316, v317, v318, v319, v320, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      v321 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v446 = 136315394;
        *(_QWORD *)&v446[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        *(_WORD *)&v446[12] = 1024;
        *(_DWORD *)&v446[14] = 544;
        _os_log_fault_impl(&dword_18A253000, v321, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v446, 0x12u);
      }
    }
  }

  v402[5] = 0;
  v322 = *((unsigned __int8 *)v408 + 24);
  _Block_object_dispose(&v401, 8);
  _Block_object_dispose(&v407, 8);
  if (!v322)
    goto LABEL_386;
  v323 = a1[4];
  if (a2)
  {
    v324 = *(_QWORD *)(a2 + 24);
    if (v323)
      goto LABEL_362;
LABEL_386:
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    v338 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
    return;
  }
  v324 = 0;
  if (!v323)
    goto LABEL_386;
LABEL_362:
  v325 = *(_QWORD *)(v323 + 24);
  if (v325 && *(_BYTE *)(v325 + 32))
  {
    -[NSSQLiteConnection connect](v324);
    -[NSSQLiteConnection beginTransaction](v324);
    v432 = 0u;
    v431 = 0u;
    v430 = 0u;
    v429 = 0u;
    v326 = *(_QWORD *)(v323 + 24);
    if (v326)
      v327 = *(void **)(v326 + 24);
    else
      v327 = 0;
    v328 = objc_msgSend(v327, "countByEnumeratingWithState:objects:count:", &v429, v446, 16);
    if (v328)
    {
      v329 = *(_QWORD *)v430;
      do
      {
        for (ii = 0; ii != v328; ++ii)
        {
          if (*(_QWORD *)v430 != v329)
            objc_enumerationMutation(v327);
          -[NSSQLiteConnection dedupeRowsForUniqueConstraintsInCloudKitMetadataEntity:](v324, *(_QWORD *)(*((_QWORD *)&v429 + 1) + 8 * ii));
        }
        v328 = objc_msgSend(v327, "countByEnumeratingWithState:objects:count:", &v429, v446, 16);
      }
      while (v328);
    }
    v428 = 0u;
    v427 = 0u;
    v426 = 0u;
    v425 = 0u;
    v331 = *(_QWORD *)(v323 + 24);
    if (v331)
      v332 = *(void **)(v331 + 8);
    else
      v332 = 0;
    v333 = objc_msgSend(v332, "countByEnumeratingWithState:objects:count:", &v425, &v440, 16);
    if (v333)
    {
      v334 = *(_QWORD *)v426;
      do
      {
        for (jj = 0; jj != v333; ++jj)
        {
          if (*(_QWORD *)v426 != v334)
            objc_enumerationMutation(v332);
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v324, *(_QWORD **)(*((_QWORD *)&v425 + 1) + 8 * jj));
        }
        v333 = objc_msgSend(v332, "countByEnumeratingWithState:objects:count:", &v425, &v440, 16);
      }
      while (v333);
    }
    v336 = *(_QWORD *)(v323 + 24);
    if (v336)
      v337 = *(void **)(v336 + 16);
    else
      v337 = 0;
    -[NSSQLiteConnection createTablesForEntities:](v324, v337);
    -[NSSQLiteConnection commitTransaction](v324);
  }
  -[NSSQLiteConnection endFetchAndRecycleStatement:](v324, 0);
}

void __94__PFCloudKitMetadataModelMigrator_computeAncillaryEntityPrimaryKeyTableEntriesForStore_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  NSSQLiteStatement *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  NSSQLiteStatement *v11;
  uint64_t v12;
  NSSQLiteStatement *v13;
  NSSQLiteStatement *v14;
  uint64_t v15;
  NSSQLiteStatement *v16;
  NSSQLiteStatement *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSSQLiteStatement *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a2)
    v3 = *(void **)(a2 + 24);
  else
    v3 = 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (NSSQLiteStatement *)objc_msgSend(v3, "adapter");
  v26 = a1;
  v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentStoreMirroringDelegateOptionKey"));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  if (v6)
    v7 = *(void **)(v6 + 40);
  else
    v7 = 0;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v28 = *(_QWORD *)v34;
    obj = v7;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(obj);
        v10 = *(unsigned int **)(*((_QWORD *)&v33 + 1) + 8 * v9);
        v11 = [NSSQLiteStatement alloc];
        if (v10)
          v12 = v10[46];
        else
          v12 = 0;
        v13 = -[NSSQLiteStatement initWithEntity:sqlString:](v11, "initWithEntity:sqlString:", 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE Z_ENT = %@"), CFSTR("Z_PRIMARYKEY"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12)));
        objc_msgSend(v4, "addObject:", v13);

        v14 = -[NSSQLiteAdapter newPrimaryKeyInitializeStatementForEntity:withInitialMaxPK:](v5, (uint64_t)v10, 0);
        objc_msgSend(v4, "addObject:", v14);

        v15 = objc_msgSend(v10, "tableName");
        if (v3 && -[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)v3, v15, 0))
        {
          v16 = -[NSSQLiteAdapter newSimplePrimaryKeyUpdateStatementForEntity:](v5, v10);
          objc_msgSend(v4, "addObject:", v16);

          v17 = [NSSQLiteStatement alloc];
          v18 = (void *)MEMORY[0x1E0CB3940];
          v19 = objc_msgSend(v10, "tableName");
          if (v10)
            v20 = v10[46];
          else
            v20 = 0;
          v21 = -[NSSQLiteStatement initWithEntity:sqlString:](v17, "initWithEntity:sqlString:", 0, objc_msgSend(v18, "stringWithFormat:", CFSTR("UPDATE %@ SET Z_ENT = %@"), v19, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20)));
          objc_msgSend(v4, "addObject:", v21);

        }
        ++v9;
      }
      while (v8 != v9);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      v8 = v22;
    }
    while (v22);
  }
  -[NSSQLiteConnection connect]((uint64_t)v3);
  -[NSSQLiteConnection beginTransaction]((uint64_t)v3);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v4);
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v3, *(_QWORD **)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v23);
  }
  -[NSSQLiteConnection commitTransaction]((uint64_t)v3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v26 + 40) + 8) + 24) = 1;
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v3, 0);

}

void __85__PFCloudKitMetadataModelMigrator_checkForRecordMetadataZoneCorruptionInStore_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSManagedObject *v4;
  NSManagedObject *v5;
  id v6;
  NSManagedObjectID *v7;
  NSFetchRequest *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSBatchUpdateRequest *v15;
  id v16;
  NSBatchUpdateRequest *v17;
  id v18;
  uint64_t v19;
  NSBatchUpdateRequest *v20;
  id v21;
  _QWORD v22[6];
  __int128 v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint64_t v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());
  v3 = (void *)objc_msgSend(v2, "initWithZoneName:ownerName:", CFSTR("com.apple.coredata.cloudkit.zone"), getCloudKitCKCurrentUserDefaultName[0]());
  v4 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v4)
  {
    v5 = v4;
    if (-[NSManagedObject isInserted](v4, "isInserted"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v7 = -[NSManagedObject objectID](v5, "objectID");
      v8 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
      -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v8, "setRelationshipKeyPathsForPrefetching:", &unk_1E1F526E0);
      v34[0] = *(_QWORD *)(a1 + 40);
      -[NSFetchRequest setAffectedStores:](v8, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1));
      -[NSFetchRequest setFetchBatchSize:](v8, "setFetchBatchSize:", 200);
      v9 = *(void **)(a1 + 48);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __85__PFCloudKitMetadataModelMigrator_checkForRecordMetadataZoneCorruptionInStore_error___block_invoke_2;
      v22[3] = &unk_1E1EE16E8;
      v22[4] = v9;
      v22[5] = v7;
      v23 = *(_OWORD *)(a1 + 64);
      +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v8, v9, (uint64_t)v22);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    v10 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v11 && *(_BYTE *)(v11 + 37))
  {
    v12 = *(void **)(a1 + 56);
    v33 = *(_QWORD *)(a1 + 40);
    v13 = (void *)objc_msgSend(v12, "currentPersistentHistoryTokenFromStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1));
    v14 = v13
        ? (void *)objc_msgSend((id)objc_msgSend(v13, "storeTokens"), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "identifier")): &unk_1E1F4B828;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v15 = -[NSBatchUpdateRequest initWithEntityName:]([NSBatchUpdateRequest alloc], "initWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
      -[NSBatchUpdateRequest setPredicate:](v15, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ckRecordSystemFields == NULL")));
      v31[0] = CFSTR("needsUpload");
      v32[0] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAB0]);
      v31[1] = CFSTR("pendingExportTransactionNumber");
      v32[1] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v14);
      -[NSBatchUpdateRequest setPropertiesToUpdate:](v15, "setPropertiesToUpdate:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
      v30 = *(_QWORD *)(a1 + 40);
      -[NSPersistentStoreRequest setAffectedStores:](v15, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1));
      -[NSBatchUpdateRequest setResultType:](v15, "setResultType:", 0);
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v15, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "result"), "BOOLValue") & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        v16 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      }

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      {
        v17 = -[NSBatchUpdateRequest initWithEntityName:]([NSBatchUpdateRequest alloc], "initWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
        -[NSBatchUpdateRequest setPredicate:](v17, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ckRecordSystemFields != NULL")));
        v28 = CFSTR("lastExportedTransactionNumber");
        v29 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v14);
        -[NSBatchUpdateRequest setPropertiesToUpdate:](v17, "setPropertiesToUpdate:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
        -[NSBatchUpdateRequest setResultType:](v17, "setResultType:", 0);
        v27 = *(_QWORD *)(a1 + 40);
        -[NSPersistentStoreRequest setAffectedStores:](v17, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1));
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v17, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "result"), "BOOLValue") & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
          v18 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        }

      }
    }
  }
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v19 && *(_BYTE *)(v19 + 39) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v20 = -[NSBatchUpdateRequest initWithEntityName:]([NSBatchUpdateRequest alloc], "initWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"));
    -[NSBatchUpdateRequest setPredicate:](v20, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("needsNewShareInvitation == NULL")));
    v25 = CFSTR("needsNewShareInvitation");
    v26 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAA0]);
    -[NSBatchUpdateRequest setPropertiesToUpdate:](v20, "setPropertiesToUpdate:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    -[NSBatchUpdateRequest setResultType:](v20, "setResultType:", 0);
    v24 = *(_QWORD *)(a1 + 40);
    -[NSPersistentStoreRequest setAffectedStores:](v20, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1));
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v20, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "result"), "BOOLValue") & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      v21 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }

  }
}

uint64_t __85__PFCloudKitMetadataModelMigrator_checkForRecordMetadataZoneCorruptionInStore_error___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
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
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v5 = a1;
  v44 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    result = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 40) = result;
LABEL_23:
    *a4 = 1;
    return result;
  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "existingObjectWithID:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v7)
  {
    v8 = v7;
    v35 = v5;
    v36 = a4;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(a2);
          v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x18D76B4E4]();
          v15 = (void *)objc_msgSend(v13, "recordZone");
          if (!objc_msgSend(v15, "ckRecordZoneName") || objc_msgSend(v15, "isDeleted"))
          {
            v16 = (void *)MEMORY[0x18D76B4E4]();
            if ((unint64_t)__ckLoggingOverride >= 9)
              v17 = 9;
            else
              v17 = __ckLoggingOverride;
            v18 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Found corrupt zone on record metadata: %@"));
            objc_msgSend(v13, "objectID");
            _NSCoreDataLog(v17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForRecordMetadataZoneCorruptionInStore:error:]_block_invoke_2");
            objc_autoreleasePoolPop(v16);
            objc_msgSend(v13, "setRecordZone:", v8);
          }
          objc_autoreleasePoolPop(v14);
        }
        v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v10);
    }
    v5 = v35;
    result = objc_msgSend(*(id *)(v35 + 32), "save:", *(_QWORD *)(*(_QWORD *)(v35 + 48) + 8) + 40);
    a4 = v36;
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v35 + 56) + 8) + 24) = 0;
      result = (uint64_t)*(id *)(*(_QWORD *)(*(_QWORD *)(v35 + 48) + 8) + 40);
    }
  }
  else
  {
    v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to refresh zone for assignment during corrupt zone cleanup: %@");
    _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 40));
    v33 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v42 = v34;
      _os_log_fault_impl(&dword_18A253000, v33, OS_LOG_TYPE_FAULT, "CoreData: Failed to refresh zone for assignment during corrupt zone cleanup: %@", buf, 0xCu);
    }
    result = (uint64_t)*(id *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 56) + 8) + 24) = 0;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 56) + 8) + 24))
    goto LABEL_23;
  return result;
}

void __107__PFCloudKitMetadataModelMigrator_migrateMetadataForObjectsInStore_toNSCKRecordMetadataUsingContext_error___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  _QWORD *v5;
  uint64_t v6;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  _QWORD *v36;
  _BYTE *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  _BYTE v49[128];
  uint64_t v50;

  v5 = a1;
  v50 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = a3;
LABEL_28:
    *a4 = 1;
    return;
  }
  v6 = a1[4];
  if (!v6)
  {
LABEL_27:
    *(_BYTE *)(*(_QWORD *)(v5[8] + 8) + 24) = 0;
    v34 = *(id *)(*(_QWORD *)(v5[7] + 8) + 40);
    goto LABEL_28;
  }
  v8 = (void *)a1[5];
  v9 = (void *)a1[6];
  v10 = *(_QWORD *)(a1[7] + 8);
  v44 = 0;
  v11 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", *(_QWORD *)(v6 + 32));
  v12 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneClass[0]()), "initWithZoneID:", v11);
  v13 = +[NSCKRecordMetadata createMapOfMetadataMatchingObjectIDs:inStore:inManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, (void *)objc_msgSend(a2, "valueForKey:", CFSTR("objectID")), v8, v9, &v44);
  v14 = objc_msgSend(v8, "mirroringDelegate");
  if (!v13)
  {

LABEL_22:
    if (v44)
    {
      *(_QWORD *)(v10 + 40) = v44;
    }
    else
    {
      v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      v33 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        v47 = 1024;
        v48 = 1582;
        _os_log_fault_impl(&dword_18A253000, v33, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    goto LABEL_27;
  }
  v15 = v14;
  v39 = v11;
  v37 = a4;
  v38 = v9;
  v35 = v10;
  v36 = v5;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v16 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v41;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v41 != v18)
          objc_enumerationMutation(a2);
        v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v19);
        if (!objc_msgSend(v13, "objectForKey:", objc_msgSend(v20, "objectID")))
        {
          if (v15)
            v21 = *(void **)(v15 + 8);
          else
            v21 = 0;
          v22 = +[NSCKRecordMetadata insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:](NSCKRecordMetadata, "insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:", v20, objc_msgSend(v21, "preserveLegacyRecordMetadataBehavior"), objc_msgSend(v12, "zoneID"), 0, &v44);
          v23 = (id)objc_msgSend(v20, "valueForKey:", CFSTR("ckRecordSystemFields"));
          objc_msgSend(v22, "setCkRecordSystemFields:", v23);

        }
        objc_msgSend(v20, "setValue:forKey:", 0, CFSTR("ckRecordSystemFields"));
        ++v19;
      }
      while (v17 != v19);
      v24 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      v17 = v24;
    }
    while (v24);
  }
  if (!objc_msgSend(v38, "hasChanges"))
  {

    return;
  }
  v25 = objc_msgSend(v38, "save:", &v44);

  v5 = v36;
  a4 = v37;
  v10 = v35;
  if ((v25 & 1) == 0)
    goto LABEL_22;
}

void __149__PFCloudKitMetadataModelMigrator_addMigrationStatementsToDeleteDuplicateMirroredRelationshipsToContext_withManagedObjectContext_andSQLEntity_error___block_invoke(uint64_t a1)
{
  NSFetchRequest *v2;
  NSExpressionDescription *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSFetchRequest *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSSQLiteStatement *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSSQLiteStatement *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  NSExpressionDescription *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *context;
  uint8_t buf[16];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
  v3 = objc_alloc_init(NSExpressionDescription);
  -[NSPropertyDescription setName:](v3, "setName:", CFSTR("count"));
  -[NSExpressionDescription setExpression:](v3, "setExpression:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("ckRecordID.@count")));
  -[NSExpressionDescription setExpressionResultType:](v3, "setExpressionResultType:", 300);
  v59[0] = CFSTR("ckRecordID");
  v59[1] = v3;
  v43 = v3;
  -[NSFetchRequest setPropertiesToFetch:](v2, "setPropertiesToFetch:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2));
  -[NSFetchRequest setPropertiesToGroupBy:](v2, "setPropertiesToGroupBy:", &unk_1E1F52740);
  -[NSFetchRequest setResultType:](v2, "setResultType:", 2);
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v4)
  {
    v5 = v4;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v54;
      v44 = *(_QWORD *)v54;
      v45 = v5;
      do
      {
        v9 = 0;
        v46 = v7;
        do
        {
          if (*(_QWORD *)v54 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v9);
          if (objc_msgSend((id)objc_msgSend(v10, "objectForKey:", CFSTR("count")), "integerValue") >= 2)
          {
            v11 = (void *)MEMORY[0x18D76B4E4]();
            v12 = objc_msgSend(v10, "objectForKey:", CFSTR("ckRecordID"));
            if (v12)
            {
              v13 = v12;
              context = v11;
              v14 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
              v42 = v13;
              -[NSFetchRequest setPredicate:](v14, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ckRecordID = %@")));
              -[NSFetchRequest setResultType:](v14, "setResultType:", 1);
              v15 = objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", v14, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
              if (!v15)
              {
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
                v41 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
                objc_autoreleasePoolPop(v11);
                goto LABEL_37;
              }
              v16 = (void *)v15;
              v17 = a1;
              v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v49 = 0u;
              v50 = 0u;
              v51 = 0u;
              v52 = 0u;
              v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
              if (v19)
              {
                v20 = v19;
                v21 = 0;
                v22 = *(_QWORD *)v50;
                do
                {
                  for (i = 0; i != v20; ++i)
                  {
                    if (*(_QWORD *)v50 != v22)
                      objc_enumerationMutation(v16);
                    if (v21)
                      objc_msgSend(v18, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "_referenceData64")));
                    else
                      v21 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
                  }
                  v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
                }
                while (v20);
              }
              a1 = v17;
              v8 = v44;
              if (objc_msgSend(v18, "count"))
              {
                v24 = [NSSQLiteStatement alloc];
                v25 = (void *)MEMORY[0x1E0CB3940];
                v26 = objc_msgSend(*(id *)(v17 + 40), "tableName");
                v27 = *(_QWORD *)(v17 + 40);
                if (v27)
                  v28 = *(void **)(v27 + 128);
                else
                  v28 = 0;
                objc_msgSend(v28, "columnName");
                v42 = v26;
                v29 = -[NSSQLiteStatement initWithEntity:sqlString:](v24, "initWithEntity:sqlString:", 0, objc_msgSend(v25, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN %@")));
                v30 = *(_QWORD *)(v17 + 48);
                if (v30)
                {
                  objc_msgSend(*(id *)(v30 + 8), "addObject:", v29);
                  *(_BYTE *)(v30 + 32) = 1;
                }

              }
              v5 = v45;
              v7 = v46;
              v11 = context;
            }
            else
            {
              v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Found mirrored relationships without a recordID.");
              _NSCoreDataLog(17, v31, v32, v33, v34, v35, v36, v37, v42);
              v38 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_18A253000, v38, OS_LOG_TYPE_FAULT, "CoreData: Found mirrored relationships without a recordID.", buf, 2u);
              }
            }
            objc_autoreleasePoolPop(v11);
          }
          ++v9;
        }
        while (v9 != v7);
        v39 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        v7 = v39;
      }
      while (v39);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v40 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
LABEL_37:

}

void __103__PFCloudKitMetadataModelMigrator_checkForCorruptedRecordMetadataInStore_inManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v35;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(a2);
          v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v9);
          v11 = objc_msgSend((id)objc_msgSend(v10, "entityId"), "unsignedIntegerValue");
          v12 = objc_msgSend(*(id *)(a1 + 32), "model");
          if (v12)
            v13 = *(unsigned int *)(v12 + 72);
          else
            v13 = 0;
          if (v11 > v13)
          {
            v15 = (void *)MEMORY[0x18D76B4E4]();
            if ((unint64_t)__ckLoggingOverride >= 0x10)
              v16 = 16;
            else
              v16 = __ckLoggingOverride;
            v17 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Found record metadata that points to missing entity: %@"));
            _NSCoreDataLog(v16, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForCorruptedRecordMetadataInStore:inManagedObjectContext:error:]_block_invoke");
            objc_autoreleasePoolPop(v15);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            return;
          }
          if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "model"), "entityForID:", objc_msgSend((id)objc_msgSend(v10, "entityId"), "unsignedLongValue")))
          {
            v24 = (void *)MEMORY[0x18D76B4E4]();
            if ((unint64_t)__ckLoggingOverride >= 0x10)
              v25 = 16;
            else
              v25 = __ckLoggingOverride;
            v26 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Found record metadata that points to missing entity: %@"));
            goto LABEL_32;
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "configurationName"), "length")
            && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "configurationName"), "isEqualToString:", CFSTR("PF_DEFAULT_CONFIGURATION_NAME")) & 1) == 0&& (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "entitiesForConfiguration:", objc_msgSend(*(id *)(a1 + 32), "configurationName")), "containsObject:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "entitiesByName"), "objectForKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "model"), "entityForID:", objc_msgSend((id)objc_msgSend(v10, "entityId"), "unsignedLongValue")), "name"))) & 1) == 0)
          {
            v24 = (void *)MEMORY[0x18D76B4E4]();
            if ((unint64_t)__ckLoggingOverride >= 0x10)
              v25 = 16;
            else
              v25 = __ckLoggingOverride;
            v26 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Found record metadata that points to an entity that is no longer part of the store's configuration: %@"));
LABEL_32:
            _NSCoreDataLog(v25, v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForCorruptedRecordMetadataInStore:inManagedObjectContext:error:]_block_invoke");
            objc_autoreleasePoolPop(v24);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            *a4 = 1;
            return;
          }
          ++v9;
        }
        while (v7 != v9);
        v14 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        v7 = v14;
        if (v14)
          continue;
        break;
      }
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = a3;
  }
}

void __89__PFCloudKitMetadataModelMigrator_cleanUpAfterClientMigrationWithStore_andContext_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4, _BYTE *a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSBatchDeleteRequest *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(a2);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(v14, "cdEntityName"))
            || (objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(v14, "relatedEntityName")) & 1) == 0)
          {
            objc_msgSend(v9, "addObject:", objc_msgSend(v14, "objectID"));
          }
        }
        v11 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v11);
    }
    if (objc_msgSend(v9, "count"))
    {
      v15 = -[NSBatchDeleteRequest initWithObjectIDs:]([NSBatchDeleteRequest alloc], "initWithObjectIDs:", v9);
      -[NSBatchDeleteRequest setResultType:](v15, "setResultType:", 0);
      v21 = *(_QWORD *)(a1 + 40);
      -[NSPersistentStoreRequest setAffectedStores:](v15, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1));
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v15, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "result"), "BOOLValue") & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        v16 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        a5 = a4;
      }
      *a5 = 1;

    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
  }
}

@end
