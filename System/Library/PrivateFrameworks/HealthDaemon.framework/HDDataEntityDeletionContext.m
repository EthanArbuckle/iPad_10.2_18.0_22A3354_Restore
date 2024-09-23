@implementation HDDataEntityDeletionContext

- (void)setInsertDeletedObjects:(BOOL)a3
{
  self->_insertDeletedObjects = a3;
}

- (void)setRecursiveDeleteAuthorizationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)deleteObjectWithPersistentID:(int64_t)a3 entityClass:(Class)a4 error:(id *)a5
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  Class v14;
  void *v15;
  void *v16;
  id WeakRetained;
  char v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v28;
  void *v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deleteStatementsByClassName, "objectForKeyedSubscript:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HDDatabaseTransaction databaseForEntityClass:](self->_transaction, "databaseForEntityClass:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v9;
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[objc_class deleteStatementsForRelatedEntitiesWithTransaction:](a4, "deleteStatementsForRelatedEntitiesWithTransaction:", self->_transaction);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v12);

    v13 = -[objc_class baseDataEntityClass](a4, "baseDataEntityClass");
    if (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", v13))
    {
      v14 = a4;
      do
      {
        -[objc_class deleteStatementWithProperty:database:](v14, "deleteStatementWithProperty:database:", CFSTR("data_id"), v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v15);
        v14 = (Class)-[objc_class superclass](v14, "superclass");

      }
      while ((-[objc_class isSubclassOfClass:](v14, "isSubclassOfClass:", v13) & 1) != 0);
    }
    v9 = v29;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deleteStatementsByClassName, "setObject:forKeyedSubscript:", v10, v29);
  }
  if (self->_callWillDeleteWithProfileTransaction)
  {
    v16 = (void *)objc_msgSend([a4 alloc], "initWithPersistentID:", a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      v18 = objc_msgSend(v16, "willDeleteWithProfile:transaction:error:", WeakRetained, self->_transaction, a5);

      if ((v18 & 1) == 0)
      {

        v19 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      objc_msgSend(v16, "willDeleteFromDatabase:", v11);
    }

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v20 = v10;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v21)
  {
    v22 = v21;
    v28 = v11;
    v23 = *(_QWORD *)v32;
    v24 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v30[0] = v24;
        v30[1] = 3221225472;
        v30[2] = __78__HDDataEntityDeletionContext_deleteObjectWithPersistentID_entityClass_error___block_invoke;
        v30[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
        v30[4] = a3;
        if (!objc_msgSend(v26, "performStatementWithError:bindingHandler:", a5, v30))
        {
          v19 = 0;
          goto LABEL_22;
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v22)
        continue;
      break;
    }
    v19 = 1;
LABEL_22:
    v11 = v28;
    v9 = v29;
  }
  else
  {
    v19 = 1;
  }

LABEL_25:
  return v19;
}

- (void)finish
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_deleteStatementsByClassName, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_109);
}

- (NSNumber)lastInsertedDeletedObjectPersistentID
{
  return self->_lastInsertedDeletedObjectPersistentID;
}

- (unint64_t)deletedObjectCount
{
  return self->_deletedObjectCount;
}

- (NSSet)deletedObjectTypeSet
{
  return &self->_deletedObjectTypeSet->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastInsertedDeletedObjectPersistentID, 0);
  objc_storeStrong(&self->_recursiveDeleteAuthorizationBlock, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_deleteInfoSQL, 0);
  objc_storeStrong((id *)&self->_startAndEndDatesSQL, 0);
  objc_storeStrong((id *)&self->_deletedObjectTypeSet, 0);
  objc_storeStrong((id *)&self->_localSourceIDsByOriginalSourceID, 0);
  objc_storeStrong((id *)&self->_deletedObjectProvenanceIDsByOriginalProvenanceID, 0);
  objc_storeStrong((id *)&self->_deleteStatementsByClassName, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (HDDataEntityDeletionContext)initWithProfile:(id)a3 transaction:(id)a4
{
  id v7;
  id v8;
  HDDataEntityDeletionContext *v9;
  HDDataEntityDeletionContext *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *deleteStatementsByClassName;
  NSMutableSet *v13;
  NSMutableSet *deletedObjectTypeSet;
  NSNumber *lastInsertedDeletedObjectPersistentID;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataEntityDeletionContext.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

  }
  v18.receiver = self;
  v18.super_class = (Class)HDDataEntityDeletionContext;
  v9 = -[HDDataEntityDeletionContext init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_profile, v7);
    objc_storeStrong((id *)&v10->_transaction, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deleteStatementsByClassName = v10->_deleteStatementsByClassName;
    v10->_deleteStatementsByClassName = v11;

    v10->_deletedObjectCount = 0;
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    deletedObjectTypeSet = v10->_deletedObjectTypeSet;
    v10->_deletedObjectTypeSet = v13;

    lastInsertedDeletedObjectPersistentID = v10->_lastInsertedDeletedObjectPersistentID;
    v10->_lastInsertedDeletedObjectPersistentID = 0;

    *(_WORD *)&v10->_preserveExactStartAndEndDates = 256;
  }

  return v10;
}

- (_HDObjectDeletionInfo)deleteInfoForObjectWithUUID:(SEL)a3 error:(id)a4
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  void *v14;
  NSString *v15;
  NSString *deleteInfoSQL;
  void *v17;
  NSString *v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t *v22;
  __int128 v23;
  _HDObjectDeletionInfo *result;
  void *v25;
  void *v26;
  void *v27;
  _HDObjectDeletionInfo *v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;

  v8 = a4;
  if (!self->_deleteInfoSQL)
  {
    +[HDDataEntity disambiguatedSQLForProperty:](HDDataEntity, "disambiguatedSQLForProperty:", CFSTR("data_id"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDataEntity disambiguatedSQLForProperty:](HDDataEntity, "disambiguatedSQLForProperty:", CFSTR("data_provenances.source_id"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDataEntity disambiguatedSQLForProperty:](HDDataEntity, "disambiguatedSQLForProperty:", CFSTR("provenance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDataEntity disambiguatedSQLForProperty:](HDDataEntity, "disambiguatedSQLForProperty:", CFSTR("uuid"));
    v28 = retstr;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDataEntity disambiguatedSQLForProperty:](HDDataEntity, "disambiguatedSQLForProperty:", CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v8;
    v12 = a5;
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataProvenanceEntity, "disambiguatedDatabaseTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDataProvenanceEntity databaseTable](HDDataProvenanceEntity, "databaseTable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@, %@, %@ FROM %@ INNER JOIN %@ AS %@ ON %@.%@=%@.ROWID WHERE ((%@ = ?) AND (%@ = ?))"), v27, v26, v25, v11, v13, v14, v11, CFSTR("provenance"), v14, v9, v10, 0);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    deleteInfoSQL = self->_deleteInfoSQL;
    self->_deleteInfoSQL = v15;

    a5 = v12;
    v8 = v29;

    retstr = v28;
  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x4010000000;
  v36 = &unk_1B805FAAD;
  v37 = 0u;
  v38 = 0u;
  -[HDDatabaseTransaction databaseForEntityClass:](self->_transaction, "databaseForEntityClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_deleteInfoSQL;
  v19 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __65__HDDataEntityDeletionContext_deleteInfoForObjectWithUUID_error___block_invoke;
  v31[3] = &unk_1E6CE9508;
  v20 = v8;
  v32 = v20;
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __65__HDDataEntityDeletionContext_deleteInfoForObjectWithUUID_error___block_invoke_2;
  v30[3] = &unk_1E6CE8540;
  v30[4] = &v33;
  v21 = objc_msgSend(v17, "executeSQL:error:bindingHandler:enumerationHandler:", v18, a5, v31, v30);
  v22 = v34;
  *((_BYTE *)v34 + 32) = v21;
  v23 = *((_OWORD *)v22 + 3);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v22 + 2);
  *(_OWORD *)&retstr->var2 = v23;

  _Block_object_dispose(&v33, 8);
  return result;
}

uint64_t __65__HDDataEntityDeletionContext_deleteInfoForObjectWithUUID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, 1);
}

uint64_t __65__HDDataEntityDeletionContext_deleteInfoForObjectWithUUID_error___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = HDSQLiteColumnAsInt64();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = HDSQLiteColumnAsInt64();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = HDSQLiteColumnAsInt64();
  return 0;
}

uint64_t __78__HDDataEntityDeletionContext_deleteObjectWithPersistentID_entityClass_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __125__HDDataEntityDeletionContext__deleteAssociatedObjectsForPersistentID_entityClass_deletionDate_deletedSampleIntervals_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v15 = *(void **)(a1 + 32);
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a3;
  objc_msgSend(v15, "addObject:", v18);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);

  v20 = objc_msgSend(*(id *)(a1 + 48), "deleteObjectWithPersistentID:objectUUID:entityClass:objectType:provenanceIdentifier:deletionDate:deletedSampleIntervals:error:", a2, v19, a4, v18, v17, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a8);
  return v20;
}

- (BOOL)deleteObjectWithPersistentID:(int64_t)a3 objectUUID:(id)a4 entityClass:(Class)a5 objectType:(id)a6 provenanceIdentifier:(id)a7 deletionDate:(id)a8 deletedSampleIntervals:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  id v23;
  id v24;
  int v25;
  void *v26;
  id WeakRetained;
  int v28;
  id v29;
  NSObject *v30;
  id v31;
  NSString *startAndEndDatesSQL;
  id v33;
  id v34;
  void *v35;
  NSString *v36;
  NSString *v37;
  void *v38;
  double v39;
  double v40;
  id v41;
  NSMutableDictionary *deletedObjectProvenanceIDsByOriginalProvenanceID;
  void *v43;
  void *v44;
  id v45;
  NSMutableDictionary *v46;
  NSMutableDictionary *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  NSMutableDictionary *localSourceIDsByOriginalSourceID;
  uint64_t v57;
  NSMutableDictionary *v58;
  NSMutableDictionary *v59;
  id v60;
  void *v61;
  void *v62;
  unint64_t v63;
  NSObject *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  NSNumber *lastInsertedDeletedObjectPersistentID;
  id v72;
  _BOOL4 v73;
  int v74;
  NSObject *v75;
  id v76;
  NSObject *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  int v83;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  id *location;
  void *v92;
  id v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  char v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  int64_t v113;
  uint64_t v114;
  double *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  double *v119;
  uint64_t v120;
  uint64_t v121;
  _BYTE buf[24];
  void *v123;
  uint64_t *v124;
  uint64_t *v125;
  HDDataEntityDeletionContext *v126;
  id v127;
  id v128;
  id *v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v99 = a4;
  v97 = a6;
  v96 = a7;
  v100 = a8;
  v101 = a9;
  if (!self->_recursiveDeleteAuthorizationBlock)
  {
LABEL_9:
    v26 = (void *)objc_opt_class();
    location = (id *)&self->_profile;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v26, "attachmentObjectIdentifierForSampleWithUUID:profile:transaction:error:", v99, WeakRetained, self->_transaction, a10);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    v107 = 0;
    v108 = 0;
    v106 = 1;
    -[HDDatabaseTransaction databaseForEntityClass:](self->_transaction, "databaseForEntityClass:", a5);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = 0;
    v105 = 0;
    v28 = +[HDDataExternalSyncIdentifierEntity populateSyncInfoForObjectID:database:localSourceIDOut:externalSyncObjectCodeOut:syncIdentifierOut:syncVersionOut:deletedOut:errorOut:](HDDataExternalSyncIdentifierEntity, "populateSyncInfoForObjectID:database:localSourceIDOut:externalSyncObjectCodeOut:syncIdentifierOut:syncVersionOut:deletedOut:errorOut:", a3, v98, &v108, &v107, &v105, &v104, &v106, a10);
    v29 = v105;
    v94 = v104;
    if (!v28)
    {
      v38 = v29;
LABEL_91:

      goto LABEL_92;
    }
    if (v29)
    {
      if (v106)
      {
        _HKInitializeLogging();
        v30 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = a3;
          _os_log_impl(&dword_1B7802000, v30, OS_LOG_TYPE_DEFAULT, "Attempted to delete the object with ID '%lld' which external sync already considers to be deleted", buf, 0xCu);
        }
      }
    }
    if (self->_insertDeletedObjects)
    {
      v31 = v98;
      v118 = 0;
      v119 = (double *)&v118;
      v120 = 0x2020000000;
      v121 = 0;
      v114 = 0;
      v115 = (double *)&v114;
      v116 = 0x2020000000;
      v117 = 0;
      startAndEndDatesSQL = self->_startAndEndDatesSQL;
      if (!startAndEndDatesSQL)
      {
        v33 = v29;
        v34 = objc_alloc(MEMORY[0x1E0CB3940]);
        +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (NSString *)objc_msgSend(v34, "initWithFormat:", CFSTR("SELECT %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("start_date"), CFSTR("end_date"), v35, CFSTR("data_id"));
        v37 = self->_startAndEndDatesSQL;
        self->_startAndEndDatesSQL = v36;

        startAndEndDatesSQL = self->_startAndEndDatesSQL;
        v29 = v33;
      }
      v109 = (id)MEMORY[0x1E0C809B0];
      v110 = 3221225472;
      v111 = (uint64_t)__123__HDDataEntityDeletionContext__startAndEndDatesForSampleWithPersistentID_startTimestampOut_endTimestampOut_database_error___block_invoke;
      v112 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
      v113 = a3;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __123__HDDataEntityDeletionContext__startAndEndDatesForSampleWithPersistentID_startTimestampOut_endTimestampOut_database_error___block_invoke_2;
      v123 = &unk_1E6CEB2A8;
      v124 = &v118;
      v125 = &v114;
      v28 = objc_msgSend(v31, "executeSQL:error:bindingHandler:enumerationHandler:", startAndEndDatesSQL, a10, &v109, buf);
      v38 = v29;
      v39 = 0.0;
      v40 = 0.0;
      if ((v28 & 1) != 0)
      {
        v39 = v119[3];
        v40 = v115[3];
      }
      _Block_object_dispose(&v114, 8);
      _Block_object_dispose(&v118, 8);

      if (!v28)
        goto LABEL_91;
    }
    else
    {
      v38 = v29;
      v39 = 0.0;
      v40 = 0.0;
    }
    if (!-[HDDataEntityDeletionContext deleteObjectWithPersistentID:entityClass:error:](self, "deleteObjectWithPersistentID:entityClass:error:", a3, a5, a10))
    {
LABEL_90:
      LOBYTE(v28) = 0;
      goto LABEL_91;
    }
    if (v101)
      objc_msgSend(v101, "insertIntervalWithStartTime:endTime:", v39, v40);
    if (!v100 || !v96 || !self->_insertDeletedObjects)
    {
LABEL_88:
      v80 = objc_loadWeakRetained(location);
      objc_msgSend(v80, "attachmentManager");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "attachmentSchemaIdentifier");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v81, "removeAttachmentReferencesWithObjectIdentifier:schemaIdentifier:transaction:error:", v95, v82, self->_transaction, a10);

      if (v83)
      {
        ++self->_deletedObjectCount;
        -[NSMutableSet addObject:](self->_deletedObjectTypeSet, "addObject:", v97);
        LOBYTE(v28) = 1;
        goto LABEL_91;
      }
      goto LABEL_90;
    }
    objc_msgSend(MEMORY[0x1E0CB65B8], "_deletedObjectWithUUID:metadata:", v99, 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = (void *)-[objc_class _deletedEntityClass](a5, "_deletedEntityClass");
    if (!v89)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataEntityDeletionContext.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deletedEntityClass != Nil"));

    }
    v103 = 0;
    v41 = v96;
    deletedObjectProvenanceIDsByOriginalProvenanceID = self->_deletedObjectProvenanceIDsByOriginalProvenanceID;
    if (deletedObjectProvenanceIDsByOriginalProvenanceID)
    {
      v43 = v41;
      -[NSMutableDictionary objectForKeyedSubscript:](deletedObjectProvenanceIDsByOriginalProvenanceID, "objectForKeyedSubscript:");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        v45 = v44;
        goto LABEL_61;
      }
    }
    else
    {
      v43 = v41;
      v46 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v47 = self->_deletedObjectProvenanceIDsByOriginalProvenanceID;
      self->_deletedObjectProvenanceIDsByOriginalProvenanceID = v46;

    }
    v48 = objc_loadWeakRetained(location);
    objc_msgSend(v48, "dataProvenanceManager");
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v92, "originProvenanceForPersistentID:transaction:error:", v43, self->_transaction, &v103);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v49;
    v50 = v49;
    if (!v49)
      goto LABEL_60;
    if (!objc_msgSend(v49, "syncProvenance"))
    {
      v51 = objc_msgSend(v45, "syncIdentity");
      v52 = objc_loadWeakRetained(location);
      LOBYTE(v51) = v51 == objc_msgSend(v52, "currentSyncIdentityPersistentID");

      if ((v51 & 1) != 0)
        goto LABEL_39;
    }
    objc_msgSend(v45, "sourceID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = 0;
    v55 = v54;
    localSourceIDsByOriginalSourceID = self->_localSourceIDsByOriginalSourceID;
    if (localSourceIDsByOriginalSourceID)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](localSourceIDsByOriginalSourceID, "objectForKeyedSubscript:", v55);
      v57 = objc_claimAutoreleasedReturnValue();
      if (v57)
      {
LABEL_47:

        v63 = (unint64_t)v109;
        if (v57 || !v63)
        {
          if (v57 | v63)
          {
            v87 = (void *)objc_msgSend(v45, "copy");
            objc_msgSend(v87, "setSyncProvenance:", 0);
            objc_msgSend(v87, "setSourceID:", v57);
            v65 = objc_loadWeakRetained(location);
            objc_msgSend(v87, "setSyncIdentity:", objc_msgSend(v65, "currentSyncIdentityPersistentID"));

            objc_msgSend(v92, "provenanceEntityForProvenance:error:", v87, &v103);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v66;
            if (v66)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v66, "persistentID"));
              v53 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v53 = 0;
            }

            if (!v53)
              goto LABEL_59;
            goto LABEL_58;
          }
          _HKInitializeLogging();
          v64 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v43;
            _os_log_impl(&dword_1B7802000, v64, OS_LOG_TYPE_INFO, "Unable to find localSourceID for originalProvenanceID (%@), so we'll keep using the originalProvenanceID", buf, 0xCu);
          }
LABEL_39:
          v53 = v43;
LABEL_58:
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deletedObjectProvenanceIDsByOriginalProvenanceID, "setObject:forKeyedSubscript:", v53, v43);
LABEL_59:
          v50 = v45;
          v45 = v53;
          goto LABEL_60;
        }
        v103 = objc_retainAutorelease((id)v63);

        v50 = v45;
        v45 = 0;
LABEL_60:

LABEL_61:
        v93 = v103;
        if (!v45)
        {
          _HKInitializeLogging();
          v75 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v43;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v93;
            _os_log_impl(&dword_1B7802000, v75, OS_LOG_TYPE_INFO, "Failed to get deleted object provenance for original provenance %{public}@: %{public}@", buf, 0x16u);
          }
          v76 = v93;
          v69 = v76;
          if (v76)
          {
            if (a10)
            {
              v69 = objc_retainAutorelease(v76);
              *a10 = v69;
            }
            else
            {
              _HKLogDroppedError();
            }
          }
          v74 = 1;
LABEL_87:

          if (v74)
            goto LABEL_90;
          goto LABEL_88;
        }
        if (!self->_preserveExactStartAndEndDates)
        {
          v39 = (double)((uint64_t)v39 / 86400) * 86400.0;
          v40 = (double)((uint64_t)v40 / 86400 + 1) * 86400.0;
        }
        v102 = 0;
        objc_msgSend(v89, "insertDeletedObject:dataType:provenanceIdentifier:deletionDate:persistStartAndEndDates:startTimestamp:endTimestamp:inDatabase:error:", v88, v97, v45, v100, 1, v98, v39, v40, &v102);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v102;
        if (v68)
        {
          v70 = objc_msgSend(v68, "longLongValue");
          lastInsertedDeletedObjectPersistentID = self->_lastInsertedDeletedObjectPersistentID;
          if (!lastInsertedDeletedObjectPersistentID
            || v70 > -[NSNumber longLongValue](lastInsertedDeletedObjectPersistentID, "longLongValue"))
          {
            objc_storeStrong((id *)&self->_lastInsertedDeletedObjectPersistentID, v68);
          }
          if (!v38
            || (v72 = objc_loadWeakRetained(location),
                LOBYTE(v86) = 1,
                v73 = +[HDDataExternalSyncIdentifierEntity insertSyncIdentifierWithProfile:database:objectID:localSourceID:externalSyncObjectCode:syncIdentifier:syncVersion:deleted:errorOut:](HDDataExternalSyncIdentifierEntity, "insertSyncIdentifierWithProfile:database:objectID:localSourceID:externalSyncObjectCode:syncIdentifier:syncVersion:deleted:errorOut:", v72, v98, v70, v108, v107, v38, v94, v86, a10), v72, v73))
          {
            v74 = 0;
LABEL_86:

            goto LABEL_87;
          }
        }
        else
        {
          _HKInitializeLogging();
          v77 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v89;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = a5;
            *(_WORD *)&buf[22] = 2114;
            v123 = v69;
            _os_log_impl(&dword_1B7802000, v77, OS_LOG_TYPE_INFO, "Failed to insert deleted object with entity class %{public}@ after deleting an object of class %{public}@: %{public}@", buf, 0x20u);
          }
          v78 = v69;
          v79 = v78;
          if (v78)
          {
            if (a10)
              *a10 = objc_retainAutorelease(v78);
            else
              _HKLogDroppedError();
          }

        }
        v74 = 1;
        goto LABEL_86;
      }
    }
    else
    {
      v58 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v59 = self->_localSourceIDsByOriginalSourceID;
      self->_localSourceIDsByOriginalSourceID = v58;

    }
    v60 = objc_loadWeakRetained(location);
    objc_msgSend(v60, "sourceManager");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "localSourceForSourceID:copyIfNecessary:error:", v55, 1, &v109);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v62, "persistentID"));
      v57 = objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localSourceIDsByOriginalSourceID, "setObject:forKeyedSubscript:", v57, v55);

    }
    else
    {
      v57 = 0;
    }
    goto LABEL_47;
  }
  v16 = v100;
  v17 = v101;
  -[HDDatabaseTransaction databaseForEntityClass:](self->_transaction, "databaseForEntityClass:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v109 = 0;
  v110 = (uint64_t)&v109;
  v111 = 0x2020000000;
  v112 = 0;
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __125__HDDataEntityDeletionContext__deleteAssociatedObjectsForPersistentID_entityClass_deletionDate_deletedSampleIntervals_error___block_invoke;
  v123 = &unk_1E6CF9F50;
  v129 = &v109;
  v21 = (uint64_t *)v19;
  v124 = v21;
  v22 = (uint64_t *)v20;
  v125 = v22;
  v126 = self;
  v23 = v16;
  v127 = v23;
  v24 = v17;
  v128 = v24;
  if ((-[objc_class enumerateAssociatedObjectsForIdentifier:inDatabase:error:associatedObjectHandler:](a5, "enumerateAssociatedObjectsForIdentifier:inDatabase:error:associatedObjectHandler:", a3, v18, a10, buf) & 1) != 0)
  {
    if (!*(_QWORD *)(v110 + 24) || ((*((uint64_t (**)(void))self->_recursiveDeleteAuthorizationBlock + 2))() & 1) != 0)
    {
      v25 = 1;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a10, 3, CFSTR("object not found"));
    objc_msgSend(v18, "requireRollback");
  }
  v25 = 0;
LABEL_8:

  _Block_object_dispose(&v109, 8);
  if (v25)
    goto LABEL_9;
  LOBYTE(v28) = 0;
LABEL_92:

  return v28;
}

uint64_t __123__HDDataEntityDeletionContext__startAndEndDatesForSampleWithPersistentID_startTimestampOut_endTimestampOut_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __123__HDDataEntityDeletionContext__startAndEndDatesForSampleWithPersistentID_startTimestampOut_endTimestampOut_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = MEMORY[0x1BCCAB1A4](a2, 0);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = MEMORY[0x1BCCAB1A4](a2, 1);
  return 1;
}

void __37__HDDataEntityDeletionContext_finish__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "finish");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (HDDatabaseTransaction)transaction
{
  return self->_transaction;
}

- (id)recursiveDeleteAuthorizationBlock
{
  return self->_recursiveDeleteAuthorizationBlock;
}

- (BOOL)insertDeletedObjects
{
  return self->_insertDeletedObjects;
}

- (BOOL)preserveExactStartAndEndDates
{
  return self->_preserveExactStartAndEndDates;
}

- (void)setPreserveExactStartAndEndDates:(BOOL)a3
{
  self->_preserveExactStartAndEndDates = a3;
}

- (BOOL)callWillDeleteWithProfileTransaction
{
  return self->_callWillDeleteWithProfileTransaction;
}

- (void)setCallWillDeleteWithProfileTransaction:(BOOL)a3
{
  self->_callWillDeleteWithProfileTransaction = a3;
}

@end
