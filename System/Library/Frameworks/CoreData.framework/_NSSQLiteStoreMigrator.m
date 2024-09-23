@implementation _NSSQLiteStoreMigrator

+ (BOOL)_annotatesMigrationMetadata
{
  return _annotatesMigrationMetadata
      || +[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") > 0;
}

+ (void)_setAnnotatesMigrationMetadata:(BOOL)a3
{
  _annotatesMigrationMetadata = a3;
}

- (_QWORD)initWithStore:(void *)a3 destinationModel:(void *)a4 mappingModel:
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[5];
  objc_super v15;

  if (!a1)
    return 0;
  v15.receiver = a1;
  v15.super_class = (Class)_NSSQLiteStoreMigrator;
  v7 = objc_msgSendSuper2(&v15, sel_init);
  if (v7)
  {
    v7[1] = a2;
    v7[2] = a3;
    v7[3] = (id)objc_msgSend(a2, "model");
    v7[6] = -[NSSQLCore connectionForMigration](a2);
    v7[4] = (id)objc_msgSend(a2, "adapter");
    v7[5] = a4;
    v8 = v7[6];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70___NSSQLiteStoreMigrator_initWithStore_destinationModel_mappingModel___block_invoke;
    v14[3] = &unk_1E1EDD520;
    v14[4] = v7;
    -[NSSQLiteConnection performAndWait:](v8, (uint64_t)v14);
    v9 = objc_msgSend((id)objc_msgSend(a4, "entityMappings"), "count");
    v7[12] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v9);
    v7[15] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v9);
    v7[13] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v9);
    v7[14] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v9);
    v7[9] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v9);
    v7[10] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v9);
    v7[11] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v9);
    v7[16] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v9);
    v10 = objc_alloc(MEMORY[0x1E0C99E08]);
    v11 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7[19] = objc_msgSend(v10, "initWithObjectsAndKeys:", v11, CFSTR("inserted"), v12, CFSTR("updated"), objc_msgSend(MEMORY[0x1E0C99DE8], "array"), CFSTR("deleted"), 0);
    v7[23] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7[24] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7[20] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7[21] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7[25] = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7[26] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_WORD *)v7 + 108) = 0;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_adapter = 0;
  self->_connection = 0;

  self->_dstModel = 0;
  self->_srcModel = 0;

  self->_store = 0;
  self->_mappingModel = 0;

  self->_existingTableNames = 0;
  self->_tableGenerationSQL = 0;

  self->_addedEntityMigrations = 0;
  self->_removedEntityMigrations = 0;

  self->_transformedEntityMigrations = 0;
  self->_copiedEntityMigrations = 0;

  self->_reindexedEntities = 0;
  self->_reindexedPropertiesByEntity = 0;

  self->_sourceToDestinationEntityMap = 0;
  self->_tableMigrationDescriptionsByEntity = 0;

  self->_pkTableUpdateStatements = 0;
  self->_attributeExtensionsToUpdate = 0;

  self->_derivationsToDrop = 0;
  self->_derivationsToRun = 0;

  self->_defaultValueStatements = 0;
  self->_indexesToCreate = 0;

  self->_indexesToDrop = 0;
  self->_historyMigrationPropertyDataForEntityCache = 0;

  self->_cloudKitUpdateStatements = 0;
  self->_destinationConfigurationForCloudKitValidation = 0;

  self->_stageLabel = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSSQLiteStoreMigrator;
  -[_NSSQLiteStoreMigrator dealloc](&v3, sel_dealloc);
}

- (void)_disconnect
{
  uint64_t v1;
  _QWORD v2[5];

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 48);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __37___NSSQLiteStoreMigrator__disconnect__block_invoke;
    v2[3] = &unk_1E1EDD520;
    v2[4] = a1;
    -[NSSQLiteConnection performAndWait:](v1, (uint64_t)v2);
  }
}

- (void)_originalRootsForAddedEntity:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  if (a2)
    a2 = (_QWORD *)a2[19];
  v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a2);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 96), "objectForKey:", objc_msgSend(v9, "name", (_QWORD)v11)))
          objc_msgSend(v4, "addObjectsFromArray:", -[_NSSQLiteStoreMigrator _originalRootsForAddedEntity:](a1, v9));
        else
          objc_msgSend(v4, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "valueForKey:", objc_msgSend(v9, "name")), "sourceEntity"), "rootEntity"));
      }
      v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v4;
}

- (BOOL)performMigration:(uint64_t)a1
{
  BOOL v4;
  const char *v5;
  BOOL v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  id v10;
  _BOOL8 v11;
  _QWORD v13[8];
  BOOL v14;
  BOOL v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  if (!a1)
    return 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__35;
  v21 = __Block_byref_object_dispose__35;
  v22 = 0;
  v4 = +[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") > 0;
  v5 = getprogname();
  if (v5)
  {
    v6 = !strncmp("assetsd", v5, 7uLL) || !strncmp("photolibraryd", v5, 0xDuLL);
    v7 = strncmp("homed", v5, 5uLL) == 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v8 = *(_QWORD *)(a1 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43___NSSQLiteStoreMigrator_performMigration___block_invoke;
  v13[3] = &unk_1E1EE0700;
  v14 = v4;
  v15 = v6;
  v13[4] = a1;
  v13[5] = &v17;
  v13[6] = &v23;
  v13[7] = a2;
  v16 = v7;
  -[NSSQLiteConnection performAndWait:](v8, (uint64_t)v13);
  v9 = (void *)v18[5];
  if (v9)
  {
    v10 = v9;
    if (a2)
      *a2 = v18[5];
  }
  v11 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v11;
}

- (uint64_t)deleteStatementsForHistory
{
  uint64_t v1;
  _QWORD *v2;
  id v3;
  id *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSSQLiteStatement *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSSQLiteStatement *v67;
  id v68;
  NSSQLiteStatement *v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  NSSQLiteStatement *v142;
  NSSQLiteStatement *v143;
  void *v144;
  NSSQLiteStatement *v145;
  void *v146;
  void *context;
  int v148;
  uint64_t v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[128];
  _BYTE v159[128];
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = a1;
  context = (void *)MEMORY[0x18D76B4E4]();
  v148 = +[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel");
  if (objc_msgSend(*(id *)(v1 + 104), "count"))
  {
    v2 = *(_QWORD **)(v1 + 16);
    objc_msgSend(*(id *)(v1 + 8), "options");
    v3 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v2);
    v4 = (id *)objc_msgSend(v3, "entityNamed:", CFSTR("CHANGE"));
    v5 = objc_msgSend(v3, "entityNamed:", CFSTR("TRANSACTION"));
    if (v4)
      v6 = v5 == 0;
    else
      v6 = 1;
    if (v6)
      goto LABEL_77;
    v146 = (void *)v5;
    v156 = 0u;
    v157 = 0u;
    v154 = 0u;
    v155 = 0u;
    v149 = v1;
    v7 = *(void **)(v1 + 104);
    v8 = 0;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v154, v159, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v155;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v155 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x18D76B4E4]();
          v14 = (void *)objc_msgSend(*(id *)(v149 + 104), "objectForKey:", v12);
          v15 = v14;
          if (v8)
          {
            v16 = objc_msgSend(v14, "sourceEntity");
            if (v16)
              v17 = *(unsigned int *)(v16 + 184);
            else
              v17 = 0;
            objc_msgSend(v8, "appendFormat:", CFSTR(",%u"), v17);
          }
          else
          {
            v18 = objc_alloc(MEMORY[0x1E0CB37A0]);
            v19 = objc_msgSend(v15, "sourceEntity");
            if (v19)
              v20 = *(unsigned int *)(v19 + 184);
            else
              v20 = 0;
            v8 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("%u"), v20);
          }
          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v21 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v154, v159, 16);
        v9 = v21;
      }
      while (v21);
    }
    objc_msgSend((id)objc_msgSend(v4[5], "objectForKey:", CFSTR("ENTITY")), "columnName");
    v22 = objc_msgSend((id)objc_msgSend(v4[5], "objectForKey:", CFSTR("TRANSACTIONID")), "columnName");
    v23 = objc_alloc(MEMORY[0x1E0CB3940]);
    v138 = v22;
    objc_msgSend(v4, "tableName");
    v24 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("SELECT MAX(%@) FROM %@ WHERE %@ IN (%@)"));
    v25 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v4, v24);
    -[NSSQLiteConnection prepareSQLStatement:](*(_QWORD *)(v149 + 48), v25);
    objc_msgSend(*(id *)(v149 + 48), "execute");
    v26 = -[NSSQLiteConnection newFetchedArray](*(_QWORD *)(v149 + 48));
    v27 = v26;
    if (v26)
    {
      if ((unint64_t)objc_msgSend(v26, "count") < 2)
      {
        v30 = 0;
      }
      else
      {
        v28 = objc_msgSend(v27, "objectAtIndex:", 0);
        if (v28 == NSKeyValueCoding_NullValue)
          v29 = 0;
        else
          v29 = (void *)objc_msgSend(v27, "objectAtIndex:", 0);
        v30 = v29;
      }

    }
    else
    {
      v30 = 0;
    }
    -[NSSQLiteConnection endFetchAndRecycleStatement:](*(_QWORD *)(v149 + 48), 0);

    if (!v30 || objc_msgSend(v30, "longLongValue") < 1)
      goto LABEL_56;
    v31 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v149 + 8), "options"), "valueForKey:", CFSTR("NSPersistentHistoryTrackingKey"));
    if (objc_msgSend(v31, "isNSDictionary")
      && objc_msgSend((id)objc_msgSend(v31, "valueForKey:", CFSTR("NSPersistentHistoryAllowPartialHistoryMigration")), "BOOLValue"))
    {
      v32 = objc_msgSend(*(id *)(v149 + 104), "allKeys");
      _NSCoreDataLog(2, (uint64_t)CFSTR("Warning: Persistent History will be removing entries that tracked the following entities being removed: %@"), v33, v34, v35, v36, v37, v38, v32);
      v39 = objc_alloc(MEMORY[0x1E0CB3940]);
      v138 = objc_msgSend(v4, "tableName");
      v144 = (void *)objc_msgSend(v39, "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN (%@)"));
      v145 = -[NSSQLiteAdapter newStatementWithSQLString:](*(NSSQLiteStatement **)(v149 + 32), (uint64_t)v144);
      if (v148 <= 0)
      {
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(v149 + 48), v145);
      }
      else
      {
        _NSCoreDataLog(4, (uint64_t)CFSTR("Begin executing mass delete of removed entries from history statement: %@"), v40, v41, v42, v43, v44, v45, (uint64_t)v145);
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(v149 + 48), v145);
        _NSCoreDataLog(4, (uint64_t)CFSTR("Completed execution mass delete of removed entries from history statement."), v46, v47, v48, v49, v50, v51, v139);
      }
LABEL_55:

LABEL_56:
      v1 = v149;
      goto LABEL_57;
    }
    v52 = objc_msgSend(v30, "longLongValue");
    objc_msgSend(*(id *)(v149 + 104), "allKeys");
    _NSCoreDataLog(1, (uint64_t)CFSTR("Error: Persistent History (%lld) has to be truncated due to the following entities being removed: %@"), v53, v54, v55, v56, v57, v58, v52);
    v145 = (NSSQLiteStatement *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE Z_PK <= %lld"), objc_msgSend(v146, "tableName"), objc_msgSend(v30, "longLongValue"));
    v143 = -[NSSQLiteAdapter newStatementWithSQLString:](*(NSSQLiteStatement **)(v149 + 32), (uint64_t)v145);
    v59 = objc_alloc(MEMORY[0x1E0CB3940]);
    v60 = objc_msgSend(v4, "tableName");
    objc_msgSend(v30, "longLongValue");
    v144 = (void *)objc_msgSend(v59, "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ <= %lld"));
    v142 = -[NSSQLiteAdapter newStatementWithSQLString:](*(NSSQLiteStatement **)(v149 + 32), (uint64_t)v144);
    _NSCoreDataLog(2, (uint64_t)CFSTR("Warning: Dropping Indexes for Persistent History"), v61, v62, v63, v64, v65, v66, v60);
    v67 = *(NSSQLiteStatement **)(v149 + 32);
    if (v67)
    {
      v68 = -[NSSQLiteAdapter newDropIndexStatementsForEntity:defaultIndicesOnly:](v67, (uint64_t)v146, 0);
      v69 = *(NSSQLiteStatement **)(v149 + 32);
      if (v69)
      {
        v70 = -[NSSQLiteAdapter newDropIndexStatementsForEntity:defaultIndicesOnly:](v69, (uint64_t)v4, 0);
LABEL_42:
        v152 = 0u;
        v153 = 0u;
        v150 = 0u;
        v151 = 0u;
        v71 = (void *)objc_msgSend(v68, "arrayByAddingObjectsFromArray:", v70);
        v78 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v150, v158, 16);
        if (v78)
        {
          v79 = *(_QWORD *)v151;
          do
          {
            for (i = 0; i != v78; ++i)
            {
              if (*(_QWORD *)v151 != v79)
                objc_enumerationMutation(v71);
              v81 = *(_QWORD **)(*((_QWORD *)&v150 + 1) + 8 * i);
              if (v148 >= 1)
                _NSCoreDataLog(4, (uint64_t)CFSTR("Executing drop index from history statement: %@"), v72, v73, v74, v75, v76, v77, *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * i));
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(v149 + 48), v81);
            }
            v78 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v150, v158, 16);
          }
          while (v78);
        }

        v82 = objc_msgSend(v30, "longLongValue");
        _NSCoreDataLog(2, (uint64_t)CFSTR("Warning: Dropping Transactions prior to %lld for Persistent History"), v83, v84, v85, v86, v87, v88, v82);
        if (v148 <= 0)
        {
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(v149 + 48), v143);
          v108 = objc_msgSend(v30, "longLongValue");
          _NSCoreDataLog(2, (uint64_t)CFSTR("Warning: Dropping Changes prior to TransactionID %lld for Persistent History"), v109, v110, v111, v112, v113, v114, v108);
        }
        else
        {
          _NSCoreDataLog(4, (uint64_t)CFSTR("Executing mass delete of transactions from history statement: %@"), v89, v90, v91, v92, v93, v94, (uint64_t)v143);
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(v149 + 48), v143);
          v95 = objc_msgSend(v30, "longLongValue");
          _NSCoreDataLog(2, (uint64_t)CFSTR("Warning: Dropping Changes prior to TransactionID %lld for Persistent History"), v96, v97, v98, v99, v100, v101, v95);
          _NSCoreDataLog(4, (uint64_t)CFSTR("Executing mass delete of changes from history statement: %@"), v102, v103, v104, v105, v106, v107, (uint64_t)v142);
        }
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(v149 + 48), v142);

        goto LABEL_55;
      }
    }
    else
    {
      v68 = 0;
    }
    v70 = 0;
    goto LABEL_42;
  }
LABEL_57:
  v115 = -[NSSQLiteConnection numberOfTombstones](*(_QWORD *)(v1 + 48));
  v116 = +[_PFPersistentHistoryModel _maxCountOfTombstonesInModel:]((uint64_t)_PFPersistentHistoryModel, *(_QWORD **)(v1 + 16));
  v123 = v116;
  if (v115 >= v116)
  {
    if (!v115 || !v116)
      goto LABEL_71;
    if (v148 > 0)
      goto LABEL_67;
LABEL_70:
    if ((-[_NSSQLiteStoreMigrator shiftTombstones]((id *)v1) & 1) == 0)
      goto LABEL_77;
    goto LABEL_71;
  }
  if (v148 >= 1)
    _NSCoreDataLog(4, (uint64_t)CFSTR("Beginning adding new tombstone columns"), v117, v118, v119, v120, v121, v122, v138);
  if (!-[NSSQLiteConnection addTombstoneColumnsForRange:](*(id **)(v1 + 48), v115, v123))
    goto LABEL_77;
  if (v148 <= 0)
  {
    if (!v115)
      goto LABEL_71;
    goto LABEL_70;
  }
  _NSCoreDataLog(4, (uint64_t)CFSTR("Finished adding new tombstone columns"), v117, v118, v119, v120, v121, v122, v138);
  if (!v115)
    goto LABEL_71;
LABEL_67:
  _NSCoreDataLog(4, (uint64_t)CFSTR("Beginning remapping of shifted tombstone columns"), v117, v118, v119, v120, v121, v122, v138);
  if (!-[_NSSQLiteStoreMigrator shiftTombstones]((id *)v1))
    goto LABEL_77;
  _NSCoreDataLog(4, (uint64_t)CFSTR("Finished remapping of shifted tombstone columns"), v124, v125, v126, v127, v128, v129, v140);
LABEL_71:
  if (v115 > v123)
  {
    if (v148 < 1)
    {
      if (-[_NSSQLiteStoreMigrator clearTombstoneColumnsForRange:](v1, v115, v123))
        goto LABEL_76;
    }
    else
    {
      _NSCoreDataLog(4, (uint64_t)CFSTR("Beginning clearing contents from removed tombstone columns"), v117, v118, v119, v120, v121, v122, v138);
      if (-[_NSSQLiteStoreMigrator clearTombstoneColumnsForRange:](v1, v115, v123))
      {
        _NSCoreDataLog(4, (uint64_t)CFSTR("Finished clearing contents from removed tombstone columns"), v130, v131, v132, v133, v134, v135, v141);
        goto LABEL_76;
      }
    }
LABEL_77:
    v136 = 0;
    goto LABEL_78;
  }
LABEL_76:
  v136 = 1;
LABEL_78:
  objc_autoreleasePoolPop(context);
  return v136;
}

- (NSSQLiteStatement)updateStatementsForHistoryChanges
{
  NSSQLiteStatement **v1;
  void *v2;
  void *v3;
  NSSQLiteStatement *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  NSSQLiteStatement *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  unsigned int *v38;
  char *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  int *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  NSSQLiteStatement *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  _QWORD *v74;
  void *v75;
  id *v76;
  void *v77;
  char *v78;
  NSSQLiteStatement *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSSQLiteStatement **v84;
  void *context;
  NSSQLiteStatement *obj;
  char *obja;
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)MEMORY[0x18D76B4E4]();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v4 = v1[2];
    -[NSSQLiteStatement options](v1[1], "options");
    v74 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v4);
    v5 = objc_msgSend(v74, "entityNamed:", CFSTR("CHANGE"));
    if (v5)
    {
      v6 = (id *)v5;
      v75 = v2;
      v76 = (id *)v5;
      v84 = v1;
      v77 = v3;
      if (-[NSSQLiteStatement count](v1[9], "count"))
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSSQLiteStatement count](v1[9], "count"));
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        obj = v1[9];
        v8 = -[NSSQLiteStatement countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
        if (v8)
        {
          v9 = v8;
          v10 = 0;
          v88 = *(id *)v103;
          do
          {
            v11 = 0;
            do
            {
              if (*(id *)v103 != v88)
                objc_enumerationMutation(obj);
              v12 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * v11);
              v13 = (void *)MEMORY[0x18D76B4E4]();
              v14 = -[NSSQLiteStatement entityNamed:](v1[3], "entityNamed:", v12);
              v15 = -[NSSQLiteStatement objectForKey:](v1[9], "objectForKey:", v12);
              if (v15)
                v16 = *(unsigned int *)(v15 + 184);
              else
                v16 = 0;
              v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16);
              if (v14)
                v18 = *(unsigned int *)(v14 + 184);
              else
                v18 = 0;
              objc_msgSend(v7, "setObject:forKey:", v17, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18));
              if (v10)
              {
                v1 = v84;
                if (v14)
                  v19 = *(unsigned int *)(v14 + 184);
                else
                  v19 = 0;
                objc_msgSend(v10, "appendFormat:", CFSTR(",%u"), v19);
              }
              else
              {
                v20 = objc_alloc(MEMORY[0x1E0CB37A0]);
                v1 = v84;
                if (v14)
                  v21 = *(unsigned int *)(v14 + 184);
                else
                  v21 = 0;
                v10 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%u"), v21);
              }
              objc_autoreleasePoolPop(v13);
              ++v11;
            }
            while (v9 != v11);
            v22 = -[NSSQLiteStatement countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
            v9 = v22;
          }
          while (v22);
        }
        else
        {
          v10 = 0;
        }
        v23 = objc_msgSend((id)objc_msgSend(v76[5], "objectForKey:", CFSTR("ENTITY")), "columnName");
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("UPDATE OR FAIL "));
        objc_msgSend(v24, "appendString:", objc_msgSend(v76, "tableName"));
        objc_msgSend(v24, "appendString:", CFSTR(" SET "));
        objc_msgSend(v24, "appendString:", v23);
        objc_msgSend(v24, "appendString:", CFSTR(" =(CASE"));
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v99;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v99 != v27)
                objc_enumerationMutation(v7);
              v29 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
              v30 = (void *)objc_msgSend(v7, "objectForKey:", v29);
              objc_msgSend(v24, "appendString:", CFSTR(" WHEN "));
              objc_msgSend(v24, "appendString:", v23);
              objc_msgSend(v24, "appendFormat:", CFSTR(" = %d THEN %d"), objc_msgSend(v29, "intValue"), objc_msgSend(v30, "intValue"));
            }
            v26 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
          }
          while (v26);
        }
        objc_msgSend(v24, "appendString:", CFSTR(" ELSE "));
        objc_msgSend(v24, "appendString:", v23);
        objc_msgSend(v24, "appendString:", CFSTR(" END) WHERE "));
        objc_msgSend(v24, "appendString:", v23);
        objc_msgSend(v24, "appendString:", CFSTR(" IN ("));
        objc_msgSend(v24, "appendString:", v10);
        objc_msgSend(v24, "appendString:", CFSTR(")"));
        v1 = v84;
        v31 = -[NSSQLiteAdapter newStatementWithSQLString:](v84[4], (uint64_t)v24);
        v3 = v77;
        objc_msgSend(v77, "addObject:", v31);

        v2 = v75;
        v6 = v76;
      }
      if (-[NSSQLiteStatement count](v1[14], "count"))
      {
        -[NSSQLiteConnection registerMigrationUpdateFunctionWithMigrator:]((uint64_t)v1[6], v1);
        v82 = objc_msgSend((id)objc_msgSend(v6[5], "objectForKey:", CFSTR("ENTITY")), "columnName");
        v81 = objc_msgSend((id)objc_msgSend(v6[5], "objectForKey:", CFSTR("COLUMNS")), "columnName");
        v80 = objc_msgSend((id)objc_msgSend(v6[5], "objectForKey:", CFSTR("CHANGETYPE")), "columnName");
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v79 = v1[14];
        v32 = -[NSSQLiteStatement countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
        if (v32)
        {
          v33 = (char *)v32;
          v83 = *(_QWORD *)v95;
          do
          {
            v34 = 0;
            v78 = v33;
            do
            {
              if (*(_QWORD *)v95 != v83)
                objc_enumerationMutation(v79);
              v35 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)v34);
              v36 = MEMORY[0x18D76B4E4]();
              v37 = (_QWORD *)-[NSSQLiteStatement objectForKey:](v1[14], "objectForKey:", v35);
              context = (void *)v36;
              obja = v34;
              if (v37)
                v38 = (unsigned int *)v37[4];
              else
                v38 = 0;
              v39 = (char *)objc_msgSend(v37, "sourceEntity");
              v40 = objc_msgSend((id)-[NSSQLEntity properties]((uint64_t)v39), "count");
              if (v40 != objc_msgSend((id)-[NSSQLEntity properties]((uint64_t)v38), "count"))
                goto LABEL_63;
              v41 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v106 = 0u;
              v107 = 0u;
              v108 = 0u;
              v109 = 0u;
              v89 = (id)objc_msgSend(v38, "entityDescription");
              v42 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
              if (v42)
              {
                v43 = v42;
                v44 = *(_QWORD *)v107;
                while (2)
                {
                  for (j = 0; j != v43; ++j)
                  {
                    if (*(_QWORD *)v107 != v44)
                      objc_enumerationMutation(v89);
                    v46 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * j);
                    v47 = (void *)MEMORY[0x18D76B4E4]();
                    v48 = (void *)objc_msgSend(v39, "entityDescription");
                    v49 = objc_msgSend(v46, "name");
                    if (!v48
                      || (v50 = objc_msgSend((id)objc_msgSend(v48, "propertiesByName"), "objectForKey:", v49)) == 0
                      || (v51 = (void *)v50,
                          objc_msgSend(v41, "addObject:", v50),
                          (objc_msgSend(v51, "_isSchemaEqual:", v46) & 1) == 0)
                      && (!objc_msgSend(v51, "_isRelationship")
                       || (v52 = (void *)objc_msgSend(v46, "destinationEntity")) == 0
                       || !objc_msgSend((id)objc_msgSend(v52, "userInfo"), "valueForKey:", CFSTR("NSEntityRenamingShouldRebaseKey"))))
                    {
                      objc_autoreleasePoolPop(v47);
                      v2 = v75;
                      v6 = v76;
                      v1 = v84;
                      v3 = v77;
                      v33 = v78;
                      goto LABEL_63;
                    }
                    objc_autoreleasePoolPop(v47);
                  }
                  v43 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
                  v2 = v75;
                  v6 = v76;
                  v1 = v84;
                  if (v43)
                    continue;
                  break;
                }
              }
              v53 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "entityDescription"), "propertiesByName"), "count");
              v54 = objc_msgSend(v41, "count");
              v3 = v77;
              v33 = v78;
              if (v53 != v54)
              {
LABEL_63:
                v55 = objc_alloc(MEMORY[0x1E0CB3940]);
                v56 = objc_msgSend(v6, "tableName");
                if (v38)
                {
                  v57 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
                  v58 = v38[46];
                  if (v39)
                    goto LABEL_65;
LABEL_72:
                  v59 = 0;
                  if (!v38)
                    goto LABEL_73;
LABEL_66:
                  v60 = *(unsigned int *)((char *)v38 + v57[465]);
                }
                else
                {
                  v58 = 0;
                  v57 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
                  if (!v39)
                    goto LABEL_72;
LABEL_65:
                  v59 = *(unsigned int *)&v39[v57[465]];
                  if (v38)
                    goto LABEL_66;
LABEL_73:
                  v60 = 0;
                }
                v61 = (void *)objc_msgSend(v55, "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET %@ = NSPersistentHistoryMigrateUpdates(3, %d, %d, %@) WHERE %@ == %d AND %@ == %ld;"),
                                v56,
                                v81,
                                v58,
                                v59,
                                v81,
                                v82,
                                v60,
                                v80,
                                1);
                v62 = -[NSSQLiteAdapter newStatementWithSQLString:](v1[4], (uint64_t)v61);
                objc_msgSend(v3, "addObject:", v62);

              }
              objc_autoreleasePoolPop(context);
              v34 = obja + 1;
            }
            while (obja + 1 != v33);
            v63 = -[NSSQLiteStatement countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
            v33 = (char *)v63;
          }
          while (v63);
        }
      }
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      if (v74)
        v64 = (void *)v74[5];
      else
        v64 = 0;
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
      if (v65)
      {
        v66 = v65;
        v67 = *(_QWORD *)v91;
        do
        {
          v68 = 0;
          do
          {
            if (*(_QWORD *)v91 != v67)
              objc_enumerationMutation(v64);
            v69 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v68);
            v70 = (void *)MEMORY[0x18D76B4E4]();
            v71 = (uint64_t)v1[4];
            if (v71)
              v72 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v71, v69, 0);
            else
              v72 = 0;
            objc_msgSend(v3, "addObjectsFromArray:", v72);

            objc_autoreleasePoolPop(v70);
            ++v68;
          }
          while (v66 != v68);
          v73 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
          v66 = v73;
        }
        while (v73);
      }
      objc_autoreleasePoolPop(v2);
      return (NSSQLiteStatement **)v3;
    }
    else
    {

      objc_autoreleasePoolPop(v2);
      return 0;
    }
  }
  return result;
}

- (uint64_t)_countNullsInColumn:(uint64_t)a3 forEntity:
{
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFArray *v9;
  const __CFArray *v10;
  uint64_t v11;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT count(*) FROM "));
  objc_msgSend(v6, "appendString:", objc_msgSend((id)a3, "tableName"));
  objc_msgSend(v6, "appendString:", CFSTR(" WHERE "));
  objc_msgSend(v6, "appendString:", objc_msgSend(a2, "columnName"));
  objc_msgSend(v6, "appendString:", CFSTR(" is NULL"));
  if (!a3)
  {
    objc_msgSend(v6, "appendString:", CFSTR(" AND "));
    objc_msgSend(v6, "appendString:", CFSTR("Z_ENT"));
    v8 = 0;
    goto LABEL_6;
  }
  v7 = *(void **)(a3 + 152);
  if (v7 && objc_msgSend(v7, "count") || *(_QWORD *)(a3 + 160))
  {
    objc_msgSend(v6, "appendString:", CFSTR(" AND "));
    objc_msgSend(v6, "appendString:", CFSTR("Z_ENT"));
    v8 = *(unsigned int *)(a3 + 184);
LABEL_6:
    objc_msgSend(v6, "appendFormat:", CFSTR(" = %d"), v8);
  }
  v9 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](*(_QWORD *)(a1 + 48), v6);
  v10 = v9;
  if (v9)
  {
    if (CFArrayGetCount(v9) >= 1 && *(_QWORD *)CFArrayGetValueAtIndex(v10, 0))
      v11 = *(_QWORD *)CFArrayGetValueAtIndex(v10, 1);
    else
      v11 = -1;
    CFRelease(v10);
  }
  else
  {
    v11 = -1;
  }

  return v11;
}

- (uint64_t)_countUnreferencedPrimaryKeysForEntity:(uint64_t)a3 inForeignKeyColumnName:(uint64_t)a4 fromTable:
{
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFArray *v11;
  const __CFArray *v12;
  uint64_t v13;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT count(*) FROM "));
  objc_msgSend(v8, "appendString:", objc_msgSend((id)a2, "tableName"));
  objc_msgSend(v8, "appendString:", CFSTR(" WHERE "));
  objc_msgSend(v8, "appendString:", CFSTR("Z_PK"));
  objc_msgSend(v8, "appendString:", CFSTR(" NOT IN (SELECT "));
  objc_msgSend(v8, "appendString:", a3);
  objc_msgSend(v8, "appendString:", CFSTR(" FROM "));
  objc_msgSend(v8, "appendString:", a4);
  objc_msgSend(v8, "appendString:", CFSTR(" WHERE "));
  objc_msgSend(v8, "appendString:", a3);
  objc_msgSend(v8, "appendString:", CFSTR(" IS NOT NULL)"));
  if (!a2)
  {
    objc_msgSend(v8, "appendString:", CFSTR(" AND "));
    objc_msgSend(v8, "appendString:", CFSTR("Z_ENT"));
    v10 = 0;
    goto LABEL_6;
  }
  v9 = *(void **)(a2 + 152);
  if (v9 && objc_msgSend(v9, "count") || *(_QWORD *)(a2 + 160))
  {
    objc_msgSend(v8, "appendString:", CFSTR(" AND "));
    objc_msgSend(v8, "appendString:", CFSTR("Z_ENT"));
    v10 = *(unsigned int *)(a2 + 184);
LABEL_6:
    objc_msgSend(v8, "appendFormat:", CFSTR(" = %d"), v10);
  }
  v11 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](*(_QWORD *)(a1 + 48), v8);
  v12 = v11;
  if (v11)
  {
    if (CFArrayGetCount(v11) >= 1 && *(_QWORD *)CFArrayGetValueAtIndex(v12, 0))
      v13 = *(_QWORD *)CFArrayGetValueAtIndex(v12, 1);
    else
      v13 = -1;
    CFRelease(v12);
  }
  else
  {
    v13 = -1;
  }

  return v13;
}

- (uint64_t)enforceCloudKitConstraintsForEntity:(uint64_t)result
{
  void *v2;

  if (result)
  {
    v2 = (void *)result;
    if (*(_BYTE *)(result + 216))
    {
      if (objc_msgSend((id)objc_msgSend((id)result, "destinationConfigurationForCloudKitValidation"), "length")
        && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "entityDescription"), "managedObjectModel"), "configurations"), "containsObject:", objc_msgSend(v2, "destinationConfigurationForCloudKitValidation")))
      {
        return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "entityDescription"), "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(v2, "destinationConfigurationForCloudKitValidation")), "containsObject:", objc_msgSend(a2, "entityDescription"));
      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_determineAttributeTriggerToMigrateForAttributeNamed:(uint64_t)a3 withSourceEntity:(uint64_t)a4 andDestinationEntity:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *const *v13;
  void *v14;
  id v15;

  if (!a3)
  {
    v7 = 0;
    if (a4)
      goto LABEL_3;
LABEL_19:
    v8 = 0;
    goto LABEL_4;
  }
  v7 = (void *)objc_msgSend(*(id *)(a3 + 40), "objectForKey:", a2);
  if (!a4)
    goto LABEL_19;
LABEL_3:
  v8 = (void *)objc_msgSend(*(id *)(a4 + 40), "objectForKey:", a2);
LABEL_4:
  v9 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "propertyDescription"), "userInfo"), "objectForKey:", CFSTR("NSTriggerKey"));
  v10 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "propertyDescription"), "userInfo"), "objectForKey:", CFSTR("NSTriggerKey"));
  v11 = v10;
  if (!v9 && v10)
  {
    v15 = (id)+[NSSQLAttributeExtensionFactory createUnvalidatedTriggerForString:onAttribute:]((uint64_t)NSSQLAttributeExtensionFactory, v10, v8);
    v12 = *(void **)(a1 + 152);
    v13 = &NSInsertedObjectsKey;
LABEL_10:
    objc_msgSend((id)objc_msgSend(v12, "objectForKey:", *v13), "addObject:", v15);
LABEL_11:

    return;
  }
  if (v9 && !v10)
  {
    v15 = (id)+[NSSQLAttributeExtensionFactory createUnvalidatedTriggerForString:onAttribute:]((uint64_t)NSSQLAttributeExtensionFactory, v9, v7);
    v12 = *(void **)(a1 + 152);
    v13 = &NSDeletedObjectsKey;
    goto LABEL_10;
  }
  if (v9 && v10)
  {
    v14 = (void *)+[NSSQLAttributeExtensionFactory createUnvalidatedTriggerForString:onAttribute:]((uint64_t)NSSQLAttributeExtensionFactory, v9, v7);
    v15 = (id)+[NSSQLAttributeExtensionFactory createUnvalidatedTriggerForString:onAttribute:]((uint64_t)NSSQLAttributeExtensionFactory, v11, v8);
    if ((objc_msgSend(v15, "isEqualToExtension:", v14) & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "objectForKey:", CFSTR("deleted")), "addObject:", v14);
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "objectForKey:", CFSTR("inserted")), "addObject:", v15);
    }

    goto LABEL_11;
  }
}

- (void)_determineRTreeExtensionsToMigrateForAttributeNamed:(void *)a3 withSourceEntity:(void *)a4 andDestinationEntity:
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSString *const *v12;
  NSSQLLocationAttributeRTreeExtension *v13;
  NSSQLLocationAttributeRTreeExtension *v14;

  v8 = objc_msgSend((id)objc_msgSend(-[NSEntityDescription _attributeNamed:](objc_msgSend(a3, "entityDescription"), a2), "userInfo"), "objectForKey:", CFSTR("_NSLocationAttributeDerivedComponents"));
  v9 = objc_msgSend((id)objc_msgSend(-[NSEntityDescription _attributeNamed:](objc_msgSend(a4, "entityDescription"), a2), "userInfo"), "objectForKey:", CFSTR("_NSLocationAttributeDerivedComponents"));
  v10 = v9;
  if (!v8 && v9)
  {
    v14 = -[NSSQLLocationAttributeRTreeExtension initWithObjectFromUserInfo:onAttributeNamed:onEntity:]([NSSQLLocationAttributeRTreeExtension alloc], "initWithObjectFromUserInfo:onAttributeNamed:onEntity:", v9, a2, a4);
    v11 = *(void **)(a1 + 152);
    v12 = &NSInsertedObjectsKey;
LABEL_7:
    objc_msgSend((id)objc_msgSend(v11, "objectForKey:", *v12), "addObject:", v14);
LABEL_8:

    return;
  }
  if (v8 && !v9)
  {
    v14 = -[NSSQLLocationAttributeRTreeExtension initWithObjectFromUserInfo:onAttributeNamed:onEntity:]([NSSQLLocationAttributeRTreeExtension alloc], "initWithObjectFromUserInfo:onAttributeNamed:onEntity:", v8, a2, a3);
    v11 = *(void **)(a1 + 152);
    v12 = &NSDeletedObjectsKey;
    goto LABEL_7;
  }
  if (v8 && v9)
  {
    v13 = -[NSSQLLocationAttributeRTreeExtension initWithObjectFromUserInfo:onAttributeNamed:onEntity:]([NSSQLLocationAttributeRTreeExtension alloc], "initWithObjectFromUserInfo:onAttributeNamed:onEntity:", v8, a2, a3);
    v14 = -[NSSQLLocationAttributeRTreeExtension initWithObjectFromUserInfo:onAttributeNamed:onEntity:]([NSSQLLocationAttributeRTreeExtension alloc], "initWithObjectFromUserInfo:onAttributeNamed:onEntity:", v10, a2, a4);
    if (!-[NSSQLLocationAttributeRTreeExtension isEqualToExtension:](v14, "isEqualToExtension:", v13))
    {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "objectForKey:", CFSTR("deleted")), "addObject:", v13);
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "objectForKey:", CFSTR("inserted")), "addObject:", v14);
    }

    goto LABEL_8;
  }
}

- (uint64_t)entityMigrationDescriptionForEntity:(uint64_t)result
{
  id *v3;
  void *v4;
  id v5;

  if (result)
  {
    v3 = (id *)result;
    v4 = a2;
    if (objc_msgSend(a2, "model") == *(_QWORD *)(result + 24))
    {
      result = objc_msgSend(v3[13], "objectForKey:", objc_msgSend(a2, "name"));
      if (result)
        return result;
      v4 = (void *)objc_msgSend(v3[11], "objectForKey:", objc_msgSend(a2, "name"));
    }
    result = objc_msgSend(v3[14], "objectForKey:", objc_msgSend(v4, "name"));
    if (!result)
    {
      result = objc_msgSend(v3[15], "objectForKey:", objc_msgSend(v4, "name"));
      if (!result)
      {
        result = objc_msgSend(v3[12], "objectForKey:", objc_msgSend(v4, "name"));
        if (!result)
        {
          v5 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134110, (uint64_t)CFSTR("Can't find entity migration description for entity"), (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a2, CFSTR("entity"), 0));
          objc_exception_throw(v5);
        }
      }
    }
  }
  return result;
}

- (uint64_t)tableMigrationDescriptionForEntity:(uint64_t)result
{
  void *v2;
  uint64_t v3;

  if (result)
  {
    v2 = a2;
    v3 = result;
    if (objc_msgSend(a2, "model") != *(_QWORD *)(result + 24))
      return objc_msgSend(*(id *)(v3 + 128), "objectForKey:", objc_msgSend((id)objc_msgSend(v2, "rootEntity"), "name"));
    result = objc_msgSend(*(id *)(v3 + 128), "objectForKey:", objc_msgSend((id)objc_msgSend(v2, "rootEntity"), "name"));
    if (!result)
    {
      v2 = (void *)objc_msgSend(*(id *)(v3 + 88), "objectForKey:", objc_msgSend(v2, "name"));
      return objc_msgSend(*(id *)(v3 + 128), "objectForKey:", objc_msgSend((id)objc_msgSend(v2, "rootEntity"), "name"));
    }
  }
  return result;
}

- (uint64_t)_addEntityMigration:(void *)a3 toTableMigrationForRootEntity:(int)a4 tableMigrationType:
{
  _QWORD *v8;

  v8 = (_QWORD *)objc_msgSend(*(id *)(a1 + 128), "objectForKey:", objc_msgSend(a3, "name"));
  if (!v8)
  {
    v8 = -[_NSSQLTableMigrationDescription initWithRootEntity:migrationType:]([_NSSQLTableMigrationDescription alloc], a3, a4);
    objc_msgSend(*(id *)(a1 + 128), "setObject:forKey:", v8, objc_msgSend(a3, "name"));

  }
  return -[_NSSQLTableMigrationDescription addEntityMigrationDescription:]((uint64_t)v8, a2);
}

- (BOOL)clearTombstoneColumnsForRange:(uint64_t)a3
{
  _QWORD *v6;
  void *v7;
  uint64_t i;
  void *v9;
  NSSQLiteStatement *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  v6 = *(_QWORD **)(a1 + 16);
  objc_msgSend(*(id *)(a1 + 8), "options");
  v18 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v6);
  v7 = (void *)objc_msgSend(v18, "entityNamed:", CFSTR("CHANGE"));
  if (v7)
  {
    for (i = a2 - 1; i >= a3; --i)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE %@ SET Z%@%lu = NULL"), objc_msgSend(v7, "tableName"), CFSTR("TOMBSTONE"), i);
      v10 = -[NSSQLiteAdapter newStatementWithSQLString:](*(NSSQLiteStatement **)(a1 + 32), (uint64_t)v9);
      if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") >= 1)
        _NSCoreDataLog(4, (uint64_t)CFSTR("Executing clearing tombstone column statement: %@"), v11, v12, v13, v14, v15, v16, (uint64_t)v10);
      -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(a1 + 48), v10);

    }
  }

  return v7 != 0;
}

- (uint64_t)shiftTombstones
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t result;
  id *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  NSSQLiteStatement *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;
  _QWORD v67[2];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v51 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v2 = (void *)objc_msgSend(a1[5], "entityMappings");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  v52 = a1;
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v62;
    v49 = v2;
    v53 = *(_QWORD *)v62;
    do
    {
      v6 = 0;
      v55 = v4;
      do
      {
        if (*(_QWORD *)v62 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v6);
        v8 = objc_msgSend(a1[3], "entityNamed:", objc_msgSend(v7, "sourceEntityName"));
        v9 = objc_msgSend(a1[2], "entityNamed:", objc_msgSend(v7, "destinationEntityName"));
        if ((v8 != 0) == (v9 != 0))
        {
          v10 = (_QWORD *)v9;
          v11 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, (_QWORD *)v8);
          v12 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, v10);
          if ((objc_msgSend(v11, "isEqualToArray:", v12) & 1) == 0)
          {
            if (objc_msgSend(v11, "count"))
            {
              v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              if (objc_msgSend(v12, "count"))
              {
                v14 = 0;
                v15 = 0;
                do
                {
                  v16 = objc_msgSend(v11, "indexOfObject:", objc_msgSend(v12, "objectAtIndex:", v14));
                  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v66 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
                    v17 = (void *)MEMORY[0x1E0C99D20];
                    v18 = &v66;
                    v19 = 1;
                  }
                  else
                  {
                    v20 = v16;
                    v15 |= v14 != v16;
                    v67[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
                    v67[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
                    v17 = (void *)MEMORY[0x1E0C99D20];
                    v18 = v67;
                    v19 = 2;
                  }
                  objc_msgSend(v13, "addObject:", objc_msgSend(v17, "arrayWithObjects:count:", v18, v19));
                  ++v14;
                }
                while (v14 < objc_msgSend(v12, "count"));
                a1 = v52;
                v2 = v49;
                if ((v15 & 1) != 0)
                {
                  if (v8)
                    v21 = *(unsigned int *)(v8 + 184);
                  else
                    v21 = 0;
                  objc_msgSend(v51, "setObject:forKey:", v13, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v21));
                }
              }
            }
          }

          v5 = v53;
          v4 = v55;
        }
        ++v6;
      }
      while (v6 != v4);
      v22 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      v4 = v22;
    }
    while (v22);
  }
  if (!objc_msgSend(v51, "count"))
    return 1;
  v23 = a1[2];
  objc_msgSend(a1[1], "options");
  result = objc_msgSend(+[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v23), "entityNamed:", CFSTR("CHANGE"));
  if (result)
  {
    v25 = (id *)result;
    v48 = objc_msgSend((id)objc_msgSend(*(id *)(result + 40), "objectForKey:", CFSTR("ENTITY")), "columnName");
    v47 = objc_msgSend((id)objc_msgSend(v25[5], "objectForKey:", CFSTR("CHANGETYPE")), "columnName");
    v46 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), 2);
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = (id)objc_msgSend(v51, "allKeys");
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (!v50)
      return 1;
    v44 = *(_QWORD *)v58;
    v45 = v25;
    while (1)
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v58 != v44)
          objc_enumerationMutation(obj);
        v54 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v26);
        v56 = v26;
        v27 = (void *)objc_msgSend(v51, "objectForKey:");
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("UPDATE "));
        objc_msgSend(v28, "appendString:", objc_msgSend(v25, "tableName"));
        objc_msgSend(v28, "appendString:", CFSTR(" SET "));
        if (objc_msgSend(v27, "count"))
        {
          v29 = 0;
          v30 = 1;
          while (1)
          {
            v31 = (void *)objc_msgSend(v27, "objectAtIndex:", v29);
            v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Z%@%lu"), CFSTR("TOMBSTONE"), v29);
            if (objc_msgSend(v31, "count") == 1)
              break;
            if ((objc_msgSend((id)objc_msgSend(v31, "objectAtIndexedSubscript:", 0), "isEqualToValue:", objc_msgSend(v31, "objectAtIndexedSubscript:", 1)) & 1) == 0)
            {
              if ((v30 & 1) == 0)
                objc_msgSend(v28, "appendString:", CFSTR(" , "));
              v35 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Z%@%lu"), CFSTR("TOMBSTONE"), objc_msgSend((id)objc_msgSend(v31, "objectAtIndexedSubscript:", 1), "unsignedIntegerValue"));
              objc_msgSend(v28, "appendString:", v32);
              objc_msgSend(v28, "appendString:", CFSTR(" = "));
              v33 = v28;
              v34 = (const __CFString *)v35;
              goto LABEL_41;
            }
LABEL_42:
            if (++v29 >= (unint64_t)objc_msgSend(v27, "count"))
              goto LABEL_43;
          }
          if ((v30 & 1) == 0)
            objc_msgSend(v28, "appendString:", CFSTR(" , "));
          objc_msgSend(v28, "appendString:", v32);
          v33 = v28;
          v34 = CFSTR(" = NULL");
LABEL_41:
          objc_msgSend(v33, "appendString:", v34);
          v30 = 0;
          goto LABEL_42;
        }
LABEL_43:
        objc_msgSend(v28, "appendString:", CFSTR(" WHERE "));
        objc_msgSend(v28, "appendString:", v48);
        objc_msgSend(v28, "appendString:", CFSTR(" == "));
        objc_msgSend(v28, "appendFormat:", CFSTR("%@"), v54);
        objc_msgSend(v28, "appendString:", CFSTR(" AND "));
        objc_msgSend(v28, "appendString:", v47);
        objc_msgSend(v28, "appendString:", CFSTR(" == "));
        objc_msgSend(v28, "appendString:", v46);
        v36 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)v52[4], (uint64_t)v28);
        if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") > 0)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Executing shift tombstone column statement: %@"), v37, v38, v39, v40, v41, v42, (uint64_t)v36);
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v52[6], v36);

        v26 = v56 + 1;
        v25 = v45;
      }
      while (v56 + 1 != v50);
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      if (!v50)
        return 1;
    }
  }
  return result;
}

- (NSString)destinationConfigurationForCloudKitValidation
{
  return self->_destinationConfigurationForCloudKitValidation;
}

- (void)setDestinationConfigurationForCloudKitValidation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

@end
