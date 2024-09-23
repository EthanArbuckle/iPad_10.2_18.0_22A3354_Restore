@implementation HDAssociationEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

+ (id)joinClausesForProperty:(id)a3
{
  id v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  objc_super v17;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("parent_id_objects.uuid")) & 1) != 0)
  {
    v6 = CFSTR("destination_object_id");
    goto LABEL_7;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("child_id_objects.uuid")) & 1) != 0)
    goto LABEL_6;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("child_id_samples.end_date")) & 1) == 0)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("child_id_objects.creation_date")) & 1) != 0)
    {
LABEL_6:
      v6 = CFSTR("source_object_id");
      goto LABEL_7;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("child_id_samples.data_type")) & 1) == 0
      && !objc_msgSend(v5, "isEqualToString:", CFSTR("child_id_samples.data_id")))
    {
      goto LABEL_14;
    }
  }
  v6 = CFSTR("source_object_id");
LABEL_7:
  v7 = objc_opt_class();
  if (!v7)
  {
LABEL_14:
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_METACLASS___HDAssociationEntity;
    objc_msgSendSuper2(&v17, sel_joinClausesForProperty_, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v8 = v7;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAssociationEntity.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[components count] == 2"));

  }
  v10 = (void *)MEMORY[0x1E0D29870];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v11, v8, v12, v6, CFSTR("data_id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v14;
}

+ (id)databaseTable
{
  return CFSTR("associations");
}

+ (id)tableAliases
{
  return &unk_1E6DF8B40;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 9;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_22;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("destination_object_id");
  v3[1] = CFSTR("source_object_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)indices
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D29860]);
  v3 = objc_opt_class();
  v8 = CFSTR("source_object_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEntity:name:columns:", v3, CFSTR("source_object_id"), v4);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (id)privateSubEntities
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)associateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 lastInsertedEntityID:(id *)a7 profile:(id)a8 error:(id *)a9
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v24;

  v15 = (void *)MEMORY[0x1E0C99D68];
  v16 = a8;
  v17 = a6;
  v18 = a4;
  v19 = a3;
  if (a5)
    objc_msgSend(v15, "now");
  else
    objc_msgSend(v15, "distantPast");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hk_dataForAllUUIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v24) = 256;
  v22 = objc_msgSend(a1, "_insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:", v18, v21, 0, objc_msgSend(v16, "currentSyncIdentityPersistentID"), a5, 0, v20, v17, v24, v16, a7, a9);

  return v22;
}

+ (BOOL)associateSampleUUIDData:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 lastInsertedEntityID:(id *)a7 profile:(id)a8 error:(id *)a9
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  uint64_t v23;

  v15 = (void *)MEMORY[0x1E0C99D68];
  v16 = a8;
  v17 = a6;
  v18 = a4;
  v19 = a3;
  if (a5)
    objc_msgSend(v15, "now");
  else
    objc_msgSend(v15, "distantPast");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v23) = 0;
  v21 = objc_msgSend(a1, "_insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:", v18, v19, 0, objc_msgSend(v16, "currentSyncIdentityPersistentID"), a5, 0, v20, v17, v23, v16, a7, a9);

  return v21;
}

+ (BOOL)associateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 lastInsertedEntityID:(id *)a7 profile:(id)a8 provenance:(int64_t)a9 syncIdentity:(int64_t)a10 creationDate:(id)a11 error:(id *)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  char v23;
  uint64_t v25;

  v17 = a3;
  v18 = a4;
  v19 = a6;
  v20 = a8;
  v21 = a11;
  if (!v21)
  {
    if (a5)
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
    else
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "hk_dataForAllUUIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v25) = 256;
  v23 = objc_msgSend(a1, "_insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:", v18, v22, a9, a10, a5, 0, v21, v19, v25, v20, a7, a12);

  return v23;
}

+ (BOOL)disassociateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 lastInsertedEntityID:(id *)a7 profile:(id)a8 error:(id *)a9
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v24;

  v15 = (void *)MEMORY[0x1E0C99D68];
  v16 = a8;
  v17 = a6;
  v18 = a4;
  v19 = a3;
  if (a5)
    objc_msgSend(v15, "now");
  else
    objc_msgSend(v15, "distantPast");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hk_dataForAllUUIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v24) = 256;
  v22 = objc_msgSend(a1, "_insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:", v18, v21, 0, objc_msgSend(v16, "currentSyncIdentityPersistentID"), a5, 1, v20, v17, v24, v16, a7, a9);

  return v22;
}

+ (BOOL)disassociateSampleUUIDData:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 profile:(id)a7 error:(id *)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  uint64_t v22;

  v14 = (void *)MEMORY[0x1E0C99D68];
  v15 = a7;
  v16 = a6;
  v17 = a4;
  v18 = a3;
  if (a5)
    objc_msgSend(v14, "now");
  else
    objc_msgSend(v14, "distantPast");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v22) = 0;
  v20 = objc_msgSend(a1, "_insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:", v17, v18, 0, objc_msgSend(v15, "currentSyncIdentityPersistentID"), a5, 1, v19, v16, v22, v15, 0, a8);

  return v20;
}

+ (BOOL)insertEntriesWithAssociation:(id)a3 objects:(id)a4 type:(unint64_t)a5 destinationSubObject:(id)a6 enforceSameSource:(BOOL)a7 profile:(id)a8 transaction:(id)a9 error:(id *)a10
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  _HDAssociationInsertionContext *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  void *v31;
  _BOOL4 v32;
  id v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v32 = a7;
  v41 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v34 = a6;
  v15 = a8;
  v16 = a9;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v18 = v14;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "hk_appendBytesWithUUID:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v20);
  }

  if (a5)
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v13;
  objc_msgSend(v13, "UUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[_HDAssociationInsertionContext initWithParentUUID:enforceSameSource:permitPendingAssociations:profile:transaction:]([_HDAssociationInsertionContext alloc], "initWithParentUUID:enforceSameSource:permitPendingAssociations:profile:transaction:", v25, v32, 0, v15, v16);
  v27 = objc_msgSend(v15, "currentSyncIdentityPersistentID");
  HDReferenceForAssociatableObject(v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = +[HDAssociationEntity _insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:lastInsertedEntityID:context:error:]((uint64_t)a1, v25, v17, 0, v27, a5, 0, v24, v28, 0, v26, a10);

  return v29;
}

+ (BOOL)_insertEntriesWithParentUUID:(void *)a3 childUUIDsData:(uint64_t)a4 provenance:(uint64_t)a5 syncIdentity:(uint64_t)a6 type:(char)a7 deleted:(void *)a8 creationDate:(void *)a9 destinationSubObjectReference:(_QWORD *)a10 lastInsertedEntityID:(void *)a11 context:(_QWORD *)a12 error:
{
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  int v31;
  id v32;
  _BOOL8 v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  id v44;
  id v45;
  void *v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  char v63;
  int v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  _QWORD v75[5];
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  uint64_t *v82;
  _BYTE *v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  char v91;
  char v92;
  id v93;
  id v94;
  id v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  _BYTE buf[24];
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;
  id v116;
  id v117;
  uint64_t *v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v73 = a2;
  v70 = a3;
  v71 = a8;
  v72 = a9;
  v14 = a11;
  v15 = objc_opt_self();
  v68 = objc_msgSend(v14, "enforceSameSource");
  v63 = objc_msgSend(v14, "permitPendingAssociations");
  objc_msgSend(v14, "transaction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "databaseForEntityClass:", v15);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = 0;
  v97 = &v96;
  v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__46;
  v100 = __Block_byref_object_dispose__46;
  v101 = 0;
  HDDataEntityPredicateForDataUUID();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = 0;
  +[HDDataEntity anyInDatabase:predicate:error:](HDDataEntity, "anyInDatabase:predicate:error:", v74, v17, &v95);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v95;

  if (v18)
  {
    v61 = objc_msgSend(v18, "persistentID");
    if (!v68)
    {
      v34 = (void *)MEMORY[0x1E0CB3940];
      +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("SELECT %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("data_id"), CFSTR("type"), v35, CFSTR("uuid"), 0);
      v30 = (id)objc_claimAutoreleasedReturnValue();

      v25 = 0;
      goto LABEL_36;
    }
    objc_msgSend(v18, "valueForProperty:database:", CFSTR("data_provenances.source_id"), v74);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "profile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sourceManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = 0;
    objc_msgSend(v20, "clientSourceForPersistentID:error:", v60, &v94);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v94;

    if (v62)
    {
      objc_msgSend(v14, "profile");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sourceManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "bundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allSourcesForBundleIdentifier:error:", v23, a12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hk_map:", &__block_literal_global_270);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        v30 = 0;
        v31 = 1;
        goto LABEL_34;
      }
      +[HDDataEntity joinClausesForProperty:](HDDataEntity, "joinClausesForProperty:", CFSTR("data_provenances.source_id"));
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "count") == 1)
      {
        v58 = (void *)MEMORY[0x1E0CB3940];
        +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "anyObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "SQLJoinClause");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "stringWithFormat:", CFSTR("SELECT %@, %@, %@ FROM %@ %@ WHERE %@ = ?"), CFSTR("data_id"), CFSTR("type"), CFSTR("data_provenances.source_id"), v27, v29, CFSTR("uuid"), 0);
        v30 = (id)objc_claimAutoreleasedReturnValue();

        v31 = 0;
LABEL_33:

LABEL_34:
        if (v31)
        {
          v33 = 0;
LABEL_49:

          goto LABEL_50;
        }
LABEL_36:
        if (v72)
        {
          objc_msgSend(v14, "transaction");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = 0;
          objc_msgSend(v72, "persistentIDInTransaction:error:", v50, &v93);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v93;

        }
        else
        {
          v51 = 0;
          v52 = 0;
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v113 = __Block_byref_object_copy__46;
        v114 = __Block_byref_object_dispose__46;
        v115 = 0;
        v106 = 0;
        v107 = &v106;
        v108 = 0x2020000000;
        LOBYTE(v109) = 1;
        v75[0] = MEMORY[0x1E0C809B0];
        v75[1] = 3221225472;
        v75[2] = __182__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error___block_invoke_277;
        v75[3] = &unk_1E6CF0368;
        v75[4] = v74;
        v30 = v30;
        v90 = v68;
        v76 = v30;
        v82 = &v106;
        v83 = buf;
        v25 = v25;
        v77 = v25;
        v91 = a7;
        v78 = v73;
        v85 = v15;
        v86 = v61;
        v87 = a4;
        v88 = a5;
        v89 = a6;
        v53 = v51;
        v79 = v53;
        v80 = v71;
        v84 = &v96;
        v92 = v63;
        v81 = v72;
        objc_msgSend(v70, "hk_enumerateUUIDBytesUsingBlock:", v75);
        if (!*((_BYTE *)v107 + 24))
        {
          v54 = *(id *)(*(_QWORD *)&buf[8] + 40);
          v55 = v54;
          if (v54)
          {
            if (a12)
              *a12 = objc_retainAutorelease(v54);
            else
              _HKLogDroppedError();
          }

        }
        if (a10)
        {
          v56 = (void *)v97[5];
          if (v56)
            *a10 = objc_retainAutorelease(v56);
        }
        v33 = *((_BYTE *)v107 + 24) != 0;

        _Block_object_dispose(&v106, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_49;
      }
      _HKInitializeLogging();
      v47 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = CFSTR("data_provenances.source_id");
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v26;
        _os_log_fault_impl(&dword_1B7802000, v47, OS_LOG_TYPE_FAULT, "Unexpected join clauses for %{public}@: %{public}@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a12, 100, CFSTR("Unexpected join clauses for %@"), CFSTR("data_provenances.source_id"));
      v30 = 0;
LABEL_32:
      v31 = 1;
      goto LABEL_33;
    }
    if (v59)
    {
      v26 = v59;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error_, CFSTR("Unable to find parent source for source id %@"), v60);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        v25 = 0;
        v30 = 0;
        v59 = 0;
        goto LABEL_32;
      }
    }
    if (a12)
    {
      v26 = objc_retainAutorelease(v26);
      v25 = 0;
      v30 = 0;
      *a12 = v26;
    }
    else
    {
      _HKLogDroppedError();
      v25 = 0;
      v30 = 0;
    }
    v31 = 1;
    v59 = v26;
    goto LABEL_33;
  }
  if (v69)
  {
    v32 = v69;
    v25 = v32;
    if (a12)
    {
      v33 = 0;
      *a12 = objc_retainAutorelease(v32);
      goto LABEL_50;
    }
    _HKLogDroppedError();
LABEL_19:
    v33 = 0;
    goto LABEL_50;
  }
  if (!objc_msgSend(v14, "permitPendingAssociations"))
  {
    v46 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v73, "UUIDString");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "hk_assignError:code:format:", a12, 3, CFSTR("Unable to find parent object for UUID %@ when inserting associations."), v25);
    goto LABEL_19;
  }
  objc_msgSend(v72, "UUID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v73;
  v38 = v70;
  v39 = v71;
  v40 = v36;
  v41 = v74;
  v42 = objc_opt_self();
  v106 = 0;
  v107 = &v106;
  v108 = 0x3032000000;
  v109 = __Block_byref_object_copy__46;
  v110 = __Block_byref_object_dispose__46;
  v111 = 0;
  v102 = 0;
  v103 = &v102;
  v104 = 0x2020000000;
  v105 = 1;
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __167__HDAssociationEntity__insertPendingAssociationsForParentUUID_childUUIDData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectUUID_database_error___block_invoke;
  v113 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CF0478;
  v120 = v42;
  v43 = (void (*)(uint64_t))v37;
  v114 = v43;
  v121 = a4;
  v122 = a5;
  v123 = a6;
  v25 = v40;
  v115 = v25;
  v124 = a7;
  v44 = v39;
  v116 = v44;
  v45 = v41;
  v117 = v45;
  v118 = &v106;
  v119 = &v102;
  objc_msgSend(v38, "hk_enumerateUUIDBytesUsingBlock:", buf);
  if (*((_BYTE *)v103 + 24))
  {
    v33 = 1;
  }
  else
  {
    v48 = (id)v107[5];
    v49 = v48;
    if (v48)
    {
      if (a12)
        *a12 = objc_retainAutorelease(v48);
      else
        _HKLogDroppedError();
    }

    v33 = *((_BYTE *)v103 + 24) != 0;
  }

  _Block_object_dispose(&v102, 8);
  _Block_object_dispose(&v106, 8);

LABEL_50:
  _Block_object_dispose(&v96, 8);

  return v33;
}

+ (BOOL)insertEntriesWithAssociationUUID:(id)a3 objectUUIDsData:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 profile:(id)a7 error:(id *)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  uint64_t v22;

  v14 = (void *)MEMORY[0x1E0C99D68];
  v15 = a7;
  v16 = a6;
  v17 = a4;
  v18 = a3;
  if (a5)
    objc_msgSend(v14, "now");
  else
    objc_msgSend(v14, "distantPast");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v22) = 256;
  v20 = objc_msgSend(a1, "_insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:", v18, v17, 0, objc_msgSend(v15, "currentSyncIdentityPersistentID"), a5, 0, v19, v16, v22, v15, 0, a8);

  return v20;
}

+ (BOOL)copyAssociationsFromObject:(id)a3 toObject:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(a1, "copyAssociationsFromObject:toObject:type:profile:error:", v10, v11, 0, v12, a6))
    v13 = objc_msgSend(a1, "copyAssociationsFromObject:toObject:type:profile:error:", v10, v11, 1, v12, a6);
  else
    v13 = 0;

  return v13;
}

+ (BOOL)copyAssociationsFromObject:(id)a3 toObject:(id)a4 type:(unint64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  unint64_t v22;

  v12 = a3;
  v13 = a4;
  objc_msgSend(a6, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__HDAssociationEntity_copyAssociationsFromObject_toObject_type_profile_error___block_invoke;
  v18[3] = &unk_1E6CEA620;
  v19 = v12;
  v20 = v13;
  v21 = a1;
  v22 = a5;
  v15 = v13;
  v16 = v12;
  LOBYTE(a7) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v14, a7, v18);

  return (char)a7;
}

uint64_t __78__HDAssociationEntity_copyAssociationsFromObject_toObject_type_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  id v30;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  +[HDDataEntity anyInDatabase:predicate:error:](HDSampleEntity, "anyInDatabase:predicate:error:", v5, v7, &v30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v30;

  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForDataUUID();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    +[HDDataEntity anyInDatabase:predicate:error:](HDSampleEntity, "anyInDatabase:predicate:error:", v5, v12, &v29);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v29;

    if (v9)
    {
      if (a3)
      {
        v10 = 0;
        *a3 = objc_retainAutorelease(v9);
LABEL_17:

        goto LABEL_18;
      }
      _HKLogDroppedError();
    }
    else
    {
      if (v8 && v13)
      {
        v14 = objc_msgSend(v8, "persistentID");
        v15 = objc_msgSend(v13, "persistentID");
        if (*(_QWORD *)(a1 + 56) == 1)
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
        else
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __78__HDAssociationEntity_copyAssociationsFromObject_toObject_type_profile_error___block_invoke_2;
        v28[3] = &__block_descriptor_40_e15___NSString_8__0l;
        v20 = *(_QWORD *)(a1 + 56);
        v28[4] = *(_QWORD *)(a1 + 48);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __78__HDAssociationEntity_copyAssociationsFromObject_toObject_type_profile_error___block_invoke_3;
        v23[3] = &unk_1E6CF02B0;
        v24 = v16;
        v25 = v15;
        v26 = v14;
        v27 = v20;
        v21 = v16;
        v10 = objc_msgSend(v5, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &HDAssociationEntityPropertyChildDataID_block_invoke_insertKey, a3, v28, v23, 0);

        goto LABEL_17;
      }
      v17 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hk_assignError:code:format:", a3, 3, CFSTR("One of the provided objects (UUIDs %@ and %@) was not found in database"), v18, v19);

    }
    v10 = 0;
    goto LABEL_17;
  }
  if (a3)
  {
    v9 = objc_retainAutorelease(v9);
    v10 = 0;
    *a3 = v9;
  }
  else
  {
    _HKLogDroppedError();
    v10 = 0;
  }
LABEL_18:

  return v10;
}

id __78__HDAssociationEntity_copyAssociationsFromObject_toObject_type_profile_error___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("INSERT INTO %@(%@, %@, %@, %@, %@, %@, %@) SELECT ?, %@, %@, %@, %@, %@, ? FROM %@ WHERE %@=? AND %@=? AND %@=? AND %@ IS NULL"), v3, CFSTR("destination_object_id"), CFSTR("source_object_id"), CFSTR("sync_provenance"), CFSTR("sync_identity"), CFSTR("type"), CFSTR("deleted"), CFSTR("creation_date"), CFSTR("source_object_id"), CFSTR("sync_provenance"), CFSTR("sync_identity"), CFSTR("type"), CFSTR("deleted"), v4, CFSTR("destination_object_id"), CFSTR("type"),
                 CFSTR("deleted"),
                 CFSTR("destination_sub_object_id"),
                 0);

  return v5;
}

uint64_t __78__HDAssociationEntity_copyAssociationsFromObject_toObject_type_profile_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  sqlite3_bind_double(a2, 2, v4);
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 48));
  sqlite3_bind_int64(a2, 4, *(_QWORD *)(a1 + 56));
  return sqlite3_bind_int64(a2, 5, 0);
}

+ (BOOL)copyAssociationsFromChildID:(id)a3 toObjectID:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__HDAssociationEntity_copyAssociationsFromChildID_toObjectID_profile_error___block_invoke;
  v18[3] = &unk_1E6CE7C58;
  v19 = v10;
  v20 = v12;
  v21 = v11;
  v22 = a1;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  LOBYTE(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v13, a6, v18);

  return (char)a6;
}

uint64_t __76__HDAssociationEntity_copyAssociationsFromChildID_toObjectID_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[8];

  v18[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("source_object_id"), *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("destination_object_id");
  v18[1] = CFSTR("sync_provenance");
  v18[2] = CFSTR("sync_identity");
  v18[3] = CFSTR("type");
  v18[4] = CFSTR("destination_sub_object_id");
  v18[5] = CFSTR("deleted");
  v18[6] = CFSTR("creation_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__HDAssociationEntity_copyAssociationsFromChildID_toObjectID_profile_error___block_invoke_2;
  v14[3] = &unk_1E6CEDF88;
  v10 = *(void **)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 56);
  v15 = v10;
  v16 = v5;
  v11 = v5;
  v12 = objc_msgSend(v8, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v7, v6, v9, a3, v14);

  return v12;
}

uint64_t __76__HDAssociationEntity_copyAssociationsFromChildID_toObjectID_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;

  v7 = HDSQLiteColumnWithNameAsInt64();
  v8 = HDSQLiteColumnWithNameAsInt64();
  v9 = HDSQLiteColumnWithNameAsInt64();
  v10 = HDSQLiteColumnWithNameAsInt64();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnWithNameAsInt64());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HDSQLiteColumnWithNameAsBoolean();
  HDSQLiteColumnWithNameAsDate();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[HDAssociationEntity _insertAssociationEntryWithParentID:childID:provenance:syncIdentity:type:destinationSubObjectID:deleted:creationDate:lastInsertedEntityID:database:error:](*(_QWORD *)(a1 + 48), v7, objc_msgSend(*(id *)(a1 + 32), "longLongValue"), v8, v9, v10, v11, v12, v13, &v16, *(void **)(a1 + 40), a5);

  return v14;
}

+ (uint64_t)_insertAssociationEntryWithParentID:(uint64_t)a3 childID:(uint64_t)a4 provenance:(uint64_t)a5 syncIdentity:(uint64_t)a6 type:(void *)a7 destinationSubObjectID:(char)a8 deleted:(void *)a9 creationDate:(_QWORD *)a10 lastInsertedEntityID:(void *)a11 database:(uint64_t)a12 error:
{
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;

  v17 = a7;
  v18 = a9;
  v19 = a11;
  v20 = objc_opt_self();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __176__HDAssociationEntity__insertAssociationEntryWithParentID_childID_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_lastInsertedEntityID_database_error___block_invoke_2;
  v27[3] = &unk_1E6CF0450;
  v30 = a2;
  v31 = a3;
  v32 = a4;
  v33 = a5;
  v34 = a6;
  v35 = a8;
  v28 = v17;
  v29 = v18;
  v26 = v18;
  v21 = v17;
  v22 = objc_msgSend(v19, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_insertAssociationEntryWithParentID_childID_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_lastInsertedEntityID_database_error__insertKey, a12, &__block_literal_global_294, v27, 0);
  +[HDAssociationEntity _findAssociationEntryWithParentID:childID:type:destinationSubObjectID:deleted:database:error:](v20, a2, a3, a6, v21, a8, v19, a12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  *a10 = v23;
  return v22;
}

+ (uint64_t)_insertPendingAssociationForParentUUID:(uint64_t)a3 childUUIDBytes:(uint64_t)a4 provenance:(uint64_t)a5 syncIdentity:(uint64_t)a6 type:(void *)a7 destinationSubObjectID:(char)a8 deleted:(void *)a9 creationDate:(void *)a10 database:(_QWORD *)a11 error:
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  id v38;

  v16 = a2;
  v17 = a7;
  v18 = a9;
  v19 = a10;
  objc_opt_self();
  v38 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __165__HDAssociationEntity__insertPendingAssociationForParentUUID_childUUIDBytes_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_database_error___block_invoke_2;
  v29[3] = &unk_1E6CF02F8;
  v20 = v16;
  v30 = v20;
  v33 = a3;
  v34 = a4;
  v35 = a5;
  v36 = a6;
  v37 = a8;
  v21 = v18;
  v31 = v21;
  v22 = v17;
  v32 = v22;
  LOBYTE(v18) = objc_msgSend(v19, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_insertPendingAssociationForParentUUID_childUUIDBytes_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_database_error__insertKey, &v38, &__block_literal_global_51, v29, 0);

  v23 = v38;
  v24 = v23;
  if ((v18 & 1) != 0 || (objc_msgSend(v23, "hd_isConstraintViolation") & 1) != 0)
  {
    v25 = 1;
  }
  else
  {
    v26 = v24;
    if (v26)
    {
      if (a11)
        *a11 = objc_retainAutorelease(v26);
      else
        _HKLogDroppedError();
    }

    v25 = 0;
  }

  return v25;
}

id __165__HDAssociationEntity__insertPendingAssociationForParentUUID_childUUIDBytes_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_database_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDPendingAssociationEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"), v1, CFSTR("parent_uuid"), CFSTR("child_uuid"), CFSTR("sync_provenance"), CFSTR("sync_identity"), CFSTR("type"), CFSTR("deleted"), CFSTR("creation_date"), CFSTR("destination_sub_uuid"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __165__HDAssociationEntity__insertPendingAssociationForParentUUID_childUUIDBytes_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_blob(a2, 2, *(const void **)(a1 + 56), 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 64));
  sqlite3_bind_int64(a2, 4, *(_QWORD *)(a1 + 72));
  sqlite3_bind_int64(a2, 5, *(_QWORD *)(a1 + 80));
  sqlite3_bind_int64(a2, 6, *(unsigned __int8 *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  sqlite3_bind_double(a2, 7, v4);
  if (*(_QWORD *)(a1 + 48))
    return HDSQLiteBindFoundationValueToStatement();
  else
    return sqlite3_bind_null(a2, 8);
}

+ (id)journalEntryForAssociation:(id)a3 objects:(id)a4 profile:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _HDAssociationInsertionJournalEntry *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _HDAssociationInsertionJournalEntry *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "UUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hk_appendBytesWithUUID:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  v17 = [_HDAssociationInsertionJournalEntry alloc];
  objc_msgSend(v7, "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v9, "currentSyncIdentityPersistentID");
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = 0;
  v21 = -[_HDAssociationInsertionJournalEntry initWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:](v17, "initWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:", v18, v10, 0, v19, 0, 0, v20, 0, v23);

  return v21;
}

uint64_t __182__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "persistentID"));
}

void __182__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error___block_invoke_277(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  uint64_t v50;
  char v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  id v61;
  id v62;
  id obj;
  _QWORD v64[8];
  char v65;
  _QWORD v66[5];
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  char v83;
  uint8_t buf[4];
  id v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = -1;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = -1;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v67 = 0;
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __182__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error___block_invoke_2;
  v66[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v66[4] = a2;
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __182__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error___block_invoke_3;
  v64[3] = &unk_1E6CF0340;
  v64[4] = &v72;
  v64[5] = &v76;
  v65 = *(_BYTE *)(a1 + 152);
  v64[6] = &v68;
  v64[7] = &v80;
  v8 = objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", v7, &v67, v66, v64);
  v9 = v67;
  v10 = v67;
  if ((v8 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    *a3 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v9);
    goto LABEL_7;
  }
  if (*((_BYTE *)v77 + 24))
  {
    _HKInitializeLogging();
    v11 = (id)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a2);
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v85 = v13;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "Not inserting association since object %{public}@ was previously deleted", buf, 0xCu);

    }
LABEL_5:

    goto LABEL_7;
  }
  if (!*((_BYTE *)v81 + 24))
  {
    if (*(_BYTE *)(a1 + 153))
    {
      *a3 = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 118, CFSTR("Unable to find relationship for parentUUID and child."));
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

      goto LABEL_7;
    }
    if (!*(_BYTE *)(a1 + 154))
    {
      _HKInitializeLogging();
      v11 = (id)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a2);
        objc_msgSend(v52, "UUIDString");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v85 = v53;
        _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "Not inserting association, unable to look up entity for object %{public}@ and pending associations are disabled.", buf, 0xCu);

      }
      goto LABEL_5;
    }
    v42 = *(_QWORD *)(a1 + 112);
    v43 = *(void **)(a1 + 56);
    v44 = *(_QWORD *)(a1 + 136);
    v59 = *(_QWORD *)(a1 + 128);
    v45 = *(_QWORD *)(a1 + 144);
    objc_msgSend(*(id *)(a1 + 80), "UUID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *(_BYTE *)(a1 + 153);
    v48 = *(void **)(a1 + 72);
    v49 = *(void **)(a1 + 32);
    v50 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v60 = *(id *)(v50 + 40);
    v51 = +[HDAssociationEntity _insertPendingAssociationForParentUUID:childUUIDBytes:provenance:syncIdentity:type:destinationSubObjectID:deleted:creationDate:database:error:](v42, v43, a2, v59, v44, v45, v46, v47, v48, v49, &v60);
    objc_storeStrong((id *)(v50 + 40), v60);

    if ((v51 & 1) != 0)
      goto LABEL_7;
    goto LABEL_24;
  }
  if (!*(_BYTE *)(a1 + 152)
    || (v14 = *(void **)(a1 + 48),
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v69[3]),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v14) = objc_msgSend(v14, "containsObject:", v15),
        v15,
        (v14 & 1) != 0))
  {
    if (*(_BYTE *)(a1 + 153))
    {
      v16 = *(_QWORD *)(a1 + 112);
      v17 = *(_QWORD *)(a1 + 120);
      v18 = v73[3];
      v19 = *(_QWORD *)(a1 + 144);
      v20 = *(void **)(a1 + 64);
      v21 = *(void **)(a1 + 32);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      obj = *(id *)(v22 + 40);
      v23 = +[HDAssociationEntity _removeAssociationEntryWithParentID:childID:provenance:syncIdentity:type:destinationSubObjectID:deleted:database:error:](v16, v17, v18, v19, v20, v21, (uint64_t)&obj);
      objc_storeStrong((id *)(v22 + 40), obj);
      if (!v23)
        goto LABEL_24;
      v24 = *(_BYTE *)(a1 + 153) != 0;
    }
    else
    {
      v24 = 0;
    }
    v29 = *(_QWORD *)(a1 + 112);
    v30 = *(_QWORD *)(a1 + 120);
    v31 = v73[3];
    v32 = *(_QWORD *)(a1 + 128);
    v33 = *(_QWORD *)(a1 + 136);
    v34 = *(_QWORD *)(a1 + 144);
    v35 = *(void **)(a1 + 64);
    v36 = *(void **)(a1 + 72);
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v38 = *(void **)(v37 + 40);
    v39 = *(void **)(a1 + 32);
    v40 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v61 = *(id *)(v40 + 40);
    v62 = v38;
    v41 = +[HDAssociationEntity _insertAssociationEntryWithParentID:childID:provenance:syncIdentity:type:destinationSubObjectID:deleted:creationDate:lastInsertedEntityID:database:error:](v29, v30, v31, v32, v33, v34, v35, v24, v36, &v62, v39, (uint64_t)&v61);
    objc_storeStrong((id *)(v37 + 40), v62);
    objc_storeStrong((id *)(v40 + 40), v61);
    if ((v41 & 1) != 0)
      goto LABEL_7;
LABEL_24:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    *a3 = 1;
    goto LABEL_7;
  }
  _HKInitializeLogging();
  v28 = (id)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 56), "UUIDString");
    v54 = (id)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a2);
    objc_msgSend(v55, "UUIDString");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v69[3];
    v58 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544130;
    v85 = v54;
    v86 = 2114;
    v87 = v56;
    v88 = 2048;
    v89 = v57;
    v90 = 2114;
    v91 = v58;
    _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "Not inserting assocation from %{public}@ to %{public}@ because child source ID %lld is not in the allowable set of parent source IDs %{public}@", buf, 0x2Au);

  }
LABEL_7:

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v80, 8);
}

uint64_t __182__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_blob(a2, 1, *(const void **)(a1 + 32), 16, 0);
  return sqlite3_bind_int64(a2, 2, 1);
}

uint64_t __182__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error___block_invoke_3(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = HDSQLiteColumnAsInt64() == 2;
  if (*(_BYTE *)(a1 + 64))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = HDSQLiteColumnAsInt64();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return 1;
}

+ (uint64_t)_removeAssociationEntryWithParentID:(uint64_t)a3 childID:(uint64_t)a4 provenance:(void *)a5 syncIdentity:(void *)a6 type:(uint64_t)a7 destinationSubObjectID:deleted:database:error:
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;

  v12 = a6;
  v13 = a5;
  v14 = objc_opt_self();
  +[HDAssociationEntity _findAssociationEntryWithParentID:childID:type:destinationSubObjectID:deleted:database:error:](v14, a2, a3, a4, v13, 0, v12, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDAssociationEntity, "disambiguatedDatabaseTable");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ?"), v17, *MEMORY[0x1E0D29618]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __142__HDAssociationEntity__removeAssociationEntryWithParentID_childID_provenance_syncIdentity_type_destinationSubObjectID_deleted_database_error___block_invoke;
    v21[3] = &unk_1E6CE9508;
    v22 = v15;
    v19 = objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v18, a7, v21, 0);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (BOOL)_insertEntriesWithParentUUID:(id)a3 childUUIDsData:(id)a4 provenance:(int64_t)a5 syncIdentity:(int64_t)a6 type:(unint64_t)a7 deleted:(BOOL)a8 creationDate:(id)a9 destinationSubObjectReference:(id)a10 enforceSameSource:(BOOL)a11 permitPendingAssociations:(BOOL)a12 profile:(id)a13 lastInsertedEntityID:(id *)a14 error:(id *)a15
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  void *v26;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v16 = a3;
  v17 = a4;
  v18 = a9;
  v19 = a10;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__46;
  v32 = __Block_byref_object_dispose__46;
  v33 = 0;
  v20 = a13;
  v21 = v16;
  v22 = v17;
  v23 = v18;
  v24 = v19;
  v25 = HKWithAutoreleasePool();
  if (a14)
  {
    v26 = (void *)v29[5];
    if (v26)
      *a14 = objc_retainAutorelease(v26);
  }

  _Block_object_dispose(&v28, 8);
  return v25;
}

uint64_t __226__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_enforceSameSource_permitPendingAssociations_profile_lastInsertedEntityID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  char v21;
  char v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int16 v33;
  char v34;

  v4 = *(void **)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __226__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_enforceSameSource_permitPendingAssociations_profile_lastInsertedEntityID_error___block_invoke_2;
  v23[3] = &unk_1E6CF0390;
  v24 = *(id *)(a1 + 40);
  v33 = *(_WORD *)(a1 + 112);
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 80);
  v25 = v7;
  v30 = v8;
  v26 = *(id *)(a1 + 48);
  v31 = *(_OWORD *)(a1 + 88);
  v32 = *(_QWORD *)(a1 + 104);
  v34 = *(_BYTE *)(a1 + 114);
  v27 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v28 = v9;
  v29 = v10;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __226__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_enforceSameSource_permitPendingAssociations_profile_lastInsertedEntityID_error___block_invoke_3;
  v13[3] = &unk_1E6CF03B8;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v19 = *(_OWORD *)(a1 + 88);
  v20 = *(_QWORD *)(a1 + 104);
  v21 = *(_BYTE *)(a1 + 114);
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 64);
  v22 = *(_BYTE *)(a1 + 112);
  v18 = *(id *)(a1 + 32);
  v11 = objc_msgSend(v4, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v5, a2, v23, v13);

  return v11;
}

BOOL __226__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_enforceSameSource_permitPendingAssociations_profile_lastInsertedEntityID_error___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  _HDAssociationInsertionContext *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  id obj;

  v5 = a2;
  v6 = -[_HDAssociationInsertionContext initWithParentUUID:enforceSameSource:permitPendingAssociations:profile:transaction:]([_HDAssociationInsertionContext alloc], "initWithParentUUID:enforceSameSource:permitPendingAssociations:profile:transaction:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 112), *(unsigned __int8 *)(a1 + 113), *(_QWORD *)(a1 + 40), v5);

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 88);
  v10 = *(_QWORD *)(a1 + 96);
  v11 = *(_QWORD *)(a1 + 104);
  v12 = *(_BYTE *)(a1 + 114);
  v13 = *(void **)(a1 + 48);
  v14 = *(void **)(a1 + 56);
  v15 = *(void **)(a1 + 64);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v16 + 40);
  v17 = +[HDAssociationEntity _insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:lastInsertedEntityID:context:error:](v8, v7, v13, v9, v10, v11, v12, v14, v15, &obj, v6, a3);
  objc_storeStrong((id *)(v16 + 40), obj);

  return v17;
}

uint64_t __226__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_enforceSameSource_permitPendingAssociations_profile_lastInsertedEntityID_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _HDAssociationInsertionJournalEntry *v5;
  _HDAssociationInsertionJournalEntry *v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;

  v5 = [_HDAssociationInsertionJournalEntry alloc];
  LOBYTE(v10) = *(_BYTE *)(a1 + 97);
  v6 = -[_HDAssociationInsertionJournalEntry initWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:](v5, "initWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v10);
  objc_msgSend(*(id *)(a1 + 64), "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "addJournalEntry:error:", v6, a3);

  return v8;
}

+ (id)_findAssociationEntryWithParentID:(uint64_t)a3 childID:(uint64_t)a4 type:(void *)a5 destinationSubObjectID:(char)a6 deleted:(void *)a7 database:(uint64_t)a8 error:
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v9 = a5;
  v27 = a7;
  objc_opt_self();
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__46;
  v39 = __Block_byref_object_dispose__46;
  v40 = 0;
  v10 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDAssociationEntity, "disambiguatedDatabaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D29618];
  objc_msgSend(v10, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ? AND %@ IS NULL"), *MEMORY[0x1E0D29618], v11, CFSTR("destination_object_id"), CFSTR("source_object_id"), CFSTR("type"), CFSTR("deleted"), CFSTR("destination_sub_object_id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDAssociationEntity, "disambiguatedDatabaseTable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?"), v12, v15, CFSTR("destination_object_id"), CFSTR("source_object_id"), CFSTR("type"), CFSTR("deleted"), CFSTR("destination_sub_object_id"));
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v16;
  }
  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __116__HDAssociationEntity__findAssociationEntryWithParentID_childID_type_destinationSubObjectID_deleted_database_error___block_invoke;
  v29[3] = &unk_1E6CF0408;
  v31 = a2;
  v32 = a3;
  v33 = a4;
  v34 = a6;
  v18 = v9;
  v30 = v18;
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __116__HDAssociationEntity__findAssociationEntryWithParentID_childID_type_destinationSubObjectID_deleted_database_error___block_invoke_2;
  v28[3] = &unk_1E6CE8540;
  v28[4] = &v35;
  if ((objc_msgSend(v27, "executeSQL:error:bindingHandler:enumerationHandler:", v13, a8, v29, v28) & 1) != 0)
  {
    v19 = (void *)v36[5];
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a8, 3, CFSTR("Unable to find all associations for parent object for %lld when dis-associating."), a2);
      v19 = (void *)v36[5];
    }
    v20 = (void *)objc_msgSend(v19, "copy");
  }
  else
  {
    v20 = 0;
  }

  _Block_object_dispose(&v35, 8);
  return v20;
}

void *__116__HDAssociationEntity__findAssociationEntryWithParentID_childID_type_destinationSubObjectID_deleted_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *result;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 48));
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 56));
  sqlite3_bind_int64(a2, 4, *(unsigned __int8 *)(a1 + 64));
  result = *(void **)(a1 + 32);
  if (result)
    return (void *)sqlite3_bind_int64(a2, 5, objc_msgSend(result, "longLongValue"));
  return result;
}

uint64_t __116__HDAssociationEntity__findAssociationEntryWithParentID_childID_type_destinationSubObjectID_deleted_database_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnAsInt64());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 1;
}

uint64_t __142__HDAssociationEntity__removeAssociationEntryWithParentID_childID_provenance_syncIdentity_type_destinationSubObjectID_deleted_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
}

id __176__HDAssociationEntity__insertAssociationEntryWithParentID_childID_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_lastInsertedEntityID_database_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDAssociationEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"), v1, CFSTR("destination_object_id"), CFSTR("source_object_id"), CFSTR("sync_provenance"), CFSTR("sync_identity"), CFSTR("destination_sub_object_id"), CFSTR("type"), CFSTR("deleted"), CFSTR("creation_date"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __176__HDAssociationEntity__insertAssociationEntryWithParentID_childID_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_lastInsertedEntityID_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  double v5;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 48));
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 56));
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 64));
  sqlite3_bind_int64(a2, 4, *(_QWORD *)(a1 + 72));
  v4 = *(void **)(a1 + 32);
  if (v4)
    sqlite3_bind_int64(a2, 5, objc_msgSend(v4, "longLongValue"));
  else
    sqlite3_bind_null(a2, 5);
  sqlite3_bind_int64(a2, 6, *(_QWORD *)(a1 + 80));
  sqlite3_bind_int64(a2, 7, *(unsigned __int8 *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  return sqlite3_bind_double(a2, 8, v5);
}

void __167__HDAssociationEntity__insertPendingAssociationsForParentUUID_childUUIDData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectUUID_database_error___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  id obj;

  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 104);
  v10 = *(void **)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v12 = *(_BYTE *)(a1 + 112);
  v13 = *(void **)(a1 + 48);
  v14 = *(void **)(a1 + 56);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v15 + 40);
  v16 = +[HDAssociationEntity _insertPendingAssociationForParentUUID:childUUIDBytes:provenance:syncIdentity:type:destinationSubObjectID:deleted:creationDate:database:error:](v6, v10, a2, v7, v8, v9, v11, v12, v13, v14, &obj);
  objc_storeStrong((id *)(v15 + 40), obj);
  if ((v16 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    *a3 = 1;
  }
}

+ (BOOL)realizePendingAssociationsWithTransaction:(id)a3 startingAnchor:(int64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  BOOL v21;
  id v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[5];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (qword_1EF199D60 != -1)
    dispatch_once(&qword_1EF199D60, &__block_literal_global_298_0);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "databaseForEntityClass:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = _MergedGlobals_3;
  v12 = MEMORY[0x1E0C809B0];
  v32 = a1;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __86__HDAssociationEntity_realizePendingAssociationsWithTransaction_startingAnchor_error___block_invoke_2;
  v33[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v33[4] = a4;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __86__HDAssociationEntity_realizePendingAssociationsWithTransaction_startingAnchor_error___block_invoke_3;
  v29[3] = &unk_1E6CF04C0;
  v13 = v10;
  v30 = v13;
  v14 = v9;
  v31 = v14;
  if (objc_msgSend(v13, "executeSQL:error:bindingHandler:enumerationHandler:", v11, a5, v33, v29))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v16)
    {
      v17 = v16;
      v23 = v14;
      v18 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v24[0] = v12;
          v24[1] = 3221225472;
          v24[2] = __86__HDAssociationEntity_realizePendingAssociationsWithTransaction_startingAnchor_error___block_invoke_4;
          v24[3] = &unk_1E6CE9508;
          v24[4] = v20;
          if (!objc_msgSend(v13, "executeSQL:error:bindingHandler:enumerationHandler:", qword_1EF199D58, a5, v24, 0))
          {
            v21 = 0;
            goto LABEL_15;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        if (v17)
          continue;
        break;
      }
      v21 = 1;
LABEL_15:
      v14 = v23;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

void __86__HDAssociationEntity_realizePendingAssociationsWithTransaction_startingAnchor_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v12 = (void *)MEMORY[0x1E0CB3940];
  v11 = *MEMORY[0x1E0D29618];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDPendingAssociationEntity, "disambiguatedDatabaseTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDPendingAssociationEntity, "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("SELECT parent.%@, child.%@, a.%@, a.%@, a.%@, a.%@, a.%@, a.%@, a.%@ FROM %@ parent CROSS JOIN %@ a ON parent.%@ = a.%@ INNER JOIN %@ child ON child.%@ = a.%@ WHERE parent.%@ > ? UNION SELECT parent.%@, child.%@, a.%@, a.%@, a.%@, a.%@, a.%@, a.%@, a.%@ FROM %@ child CROSS JOIN %@ a ON child.%@ = a.%@ INNER JOIN %@ parent ON parent.%@ = a.%@ WHERE child.%@ > ?"), CFSTR("data_id"), CFSTR("data_id"), CFSTR("sync_provenance"), CFSTR("sync_identity"), v11, CFSTR("type"), CFSTR("deleted"), CFSTR("creation_date"), CFSTR("destination_sub_uuid"), v10, v9, CFSTR("uuid"), CFSTR("parent_uuid"), v0, CFSTR("uuid"), CFSTR("child_uuid"),
    CFSTR("data_id"),
    CFSTR("data_id"),
    CFSTR("data_id"),
    CFSTR("sync_provenance"),
    CFSTR("sync_identity"),
    v11,
    CFSTR("type"),
    CFSTR("deleted"),
    CFSTR("creation_date"),
    CFSTR("destination_sub_uuid"),
    v1,
    v2,
    CFSTR("uuid"),
    CFSTR("child_uuid"),
    v3,
    CFSTR("uuid"),
    CFSTR("parent_uuid"),
    CFSTR("data_id"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = v4;

  v6 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDPendingAssociationEntity, "disambiguatedDatabaseTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ?"), v13, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1EF199D58;
  qword_1EF199D58 = v7;

}

uint64_t __86__HDAssociationEntity_realizePendingAssociationsWithTransaction_startingAnchor_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 32));
}

uint64_t __86__HDAssociationEntity_realizePendingAssociationsWithTransaction_startingAnchor_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v18;
  id v19;

  v6 = HDSQLiteColumnAsInt64();
  v7 = HDSQLiteColumnAsInt64();
  v18 = HDSQLiteColumnAsInt64();
  v8 = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB1C8](a2, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HDSQLiteColumnAsInt64();
  v11 = MEMORY[0x1BCCAB174](a2, 6);
  MEMORY[0x1BCCAB198](a2, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1C8](a2, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    && !+[HDAssociationEntity _removeAssociationEntryWithParentID:childID:provenance:syncIdentity:type:destinationSubObjectID:deleted:database:error:](*(_QWORD *)(a1 + 48), v6, v7, v10, v13, *(void **)(a1 + 32), a3))
  {
    v15 = 0;
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 48);
    v19 = 0;
    v15 = +[HDAssociationEntity _insertAssociationEntryWithParentID:childID:provenance:syncIdentity:type:destinationSubObjectID:deleted:creationDate:lastInsertedEntityID:database:error:](v14, v6, v7, v18, v8, v10, v13, v11, v12, &v19, *(void **)(a1 + 32), a3);
    v16 = v19;
    if ((_DWORD)v15)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

  }
  return v15;
}

uint64_t __86__HDAssociationEntity_realizePendingAssociationsWithTransaction_startingAnchor_error___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
}

+ (id)objectIDsForAssociationEntityWithPersistentID:(int64_t)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v8 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__46;
  v17 = __Block_byref_object_dispose__46;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__HDAssociationEntity_objectIDsForAssociationEntityWithPersistentID_profile_error___block_invoke;
  v12[3] = &unk_1E6CF0510;
  v12[5] = a1;
  v12[6] = a3;
  v12[4] = &v13;
  LOBYTE(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v9, a5, v12);

  if ((a5 & 1) != 0)
    v10 = (id)v14[5];
  else
    v10 = (id)MEMORY[0x1E0C9AA60];
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __83__HDAssociationEntity_objectIDsForAssociationEntityWithPersistentID_profile_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[5];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithProperty:equalToValue:", CFSTR("destination_object_id"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v9, "setPredicate:", v8);
  objc_msgSend(v9, "setEntityClass:", a1[5]);
  v15[0] = CFSTR("source_object_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29898]), "initWithDatabase:descriptor:", v5, v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__HDAssociationEntity_objectIDsForAssociationEntityWithPersistentID_profile_error___block_invoke_2;
  v14[3] = &unk_1E6CF04E8;
  v14[4] = a1[4];
  v12 = objc_msgSend(v11, "enumerateProperties:error:enumerationHandler:", v10, a3, v14);

  return v12;
}

uint64_t __83__HDAssociationEntity_objectIDsForAssociationEntityWithPersistentID_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  MEMORY[0x1BCCAB1C8](a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

  return 1;
}

+ (id)deleteStatementForParentIDWithTransaction:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deleteStatementWithProperty:database:", CFSTR("destination_object_id"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)deleteStatementForChildIDsWithTransaction:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deleteStatementWithProperty:database:", CFSTR("source_object_id"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)objectsAssociatedWithObjectPID:(int64_t)a3 subObjectReference:(id)a4 dataTypes:(id)a5 associationType:(unint64_t)a6 limit:(unint64_t)a7 sortDescending:(BOOL)a8 profile:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t *v31;
  int64_t v32;
  unint64_t v33;
  id v34;
  unint64_t v35;
  BOOL v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v15 = a4;
  v16 = a5;
  v17 = a9;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__46;
  v45 = __Block_byref_object_dispose__46;
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__46;
  v39[4] = __Block_byref_object_dispose__46;
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__46;
  v37[4] = __Block_byref_object_dispose__46;
  v38 = 0;
  objc_msgSend(v17, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __134__HDAssociationEntity_objectsAssociatedWithObjectPID_subObjectReference_dataTypes_associationType_limit_sortDescending_profile_error___block_invoke;
  v25[3] = &unk_1E6CF0560;
  v19 = v16;
  v26 = v19;
  v32 = a3;
  v20 = v15;
  v27 = v20;
  v33 = a6;
  v34 = a1;
  v36 = a8;
  v35 = a7;
  v21 = v17;
  v28 = v21;
  v29 = v37;
  v30 = v39;
  v31 = &v41;
  LOBYTE(a5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDataEntity, "performReadTransactionWithHealthDatabase:error:block:", v18, a10, v25);

  if ((a5 & 1) != 0)
    v22 = (id)v42[5];
  else
    v22 = 0;

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(&v41, 8);
  return v22;
}

uint64_t __134__HDAssociationEntity_objectsAssociatedWithObjectPID_subObjectReference_dataTypes_associationType_limit_sortDescending_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id obj;
  id v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v49[4];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _QWORD v56[3];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v45 = a2;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = *(id *)(a1 + 32);
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v47)
  {
    v4 = 0x1E0D29000uLL;
    v5 = 0x1E0CB3000uLL;
    v46 = *(_QWORD *)v52;
    v6 = CFSTR("child_id_samples.data_type");
    while (2)
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v52 != v46)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v10 = *(void **)(v4 + 2104);
        objc_msgSend(*(id *)(v5 + 2024), "numberWithLongLong:", *(_QWORD *)(a1 + 80));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "predicateWithProperty:equalToValue:", CFSTR("destination_object_id"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v12);

        v13 = *(void **)(a1 + 40);
        if (v13)
        {
          objc_msgSend(v13, "persistentIDInTransaction:error:", v45, a3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
            goto LABEL_25;
          v15 = v14;
          v16 = objc_msgSend(v14, "longLongValue");
          v17 = *(void **)(v4 + 2104);
          objc_msgSend(*(id *)(v5 + 2024), "numberWithLongLong:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "predicateWithProperty:equalToValue:", CFSTR("destination_sub_object_id"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v19);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("destination_sub_object_id"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);
        }

        objc_msgSend(*(id *)(v4 + 2104), "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAA0]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v20);

        v21 = *(void **)(v4 + 2104);
        objc_msgSend(*(id *)(v5 + 2024), "numberWithInteger:", objc_msgSend(v8, "code"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "predicateWithProperty:equalToValue:", v6, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v23);

        v24 = *(void **)(v4 + 2104);
        objc_msgSend(*(id *)(v5 + 2024), "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 88));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "predicateWithProperty:equalToValue:", CFSTR("type"), v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v26);

        if (*(_BYTE *)(a1 + 112))
        {
          objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("creation_date"), objc_opt_class(), 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", v6, objc_opt_class(), 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("ROWID"), *(_QWORD *)(a1 + 96), 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v56[0] = v28;
          v56[1] = v27;
          v56[2] = v29;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 3);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v30 = 0;
        }
        v31 = *(void **)(a1 + 96);
        v32 = v6;
        v55[0] = v6;
        v55[1] = CFSTR("child_id_samples.data_id");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v9);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(_QWORD *)(a1 + 104);
        objc_msgSend(*(id *)(a1 + 48), "database");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __134__HDAssociationEntity_objectsAssociatedWithObjectPID_subObjectReference_dataTypes_associationType_limit_sortDescending_profile_error___block_invoke_2;
        v49[3] = &unk_1E6CF0538;
        v50 = *(_OWORD *)(a1 + 56);
        LODWORD(v31) = objc_msgSend(v31, "enumerateProperties:withPredicate:orderingTerms:groupBy:limit:healthDatabase:error:enumerationHandler:", v33, v34, v30, 0, v35, v36, a3, v49);

        if (!(_DWORD)v31)
          goto LABEL_24;
        v5 = 0x1E0CB3000;
        v6 = v32;
        v4 = 0x1E0D29000;
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
          && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
        {
          objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("data_id"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          +[HDSampleEntity samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:](HDSampleEntity, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48), 0, v37, *(_QWORD *)(a1 + 104), 0, a3);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) || !objc_msgSend(v38, "count"))
          {

LABEL_24:
LABEL_25:

            v42 = 0;
            goto LABEL_26;
          }
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObjectsFromArray:", v39);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "removeAllObjects");
          v40 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v41 = *(void **)(v40 + 40);
          *(_QWORD *)(v40 + 40) = 0;

        }
      }
      v42 = 1;
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      if (v47)
        continue;
      break;
    }
  }
  else
  {
    v42 = 1;
  }
LABEL_26:

  return v42;
}

uint64_t __134__HDAssociationEntity_objectsAssociatedWithObjectPID_subObjectReference_dataTypes_associationType_limit_sortDescending_profile_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", HDSQLiteColumnAsInt64());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = HDSQLiteColumnAsInt64();
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  return 1;
}

+ (id)countOfObjectsAssociatedWithObjectUUID:(id)a3 subObjectReference:(id)a4 excludeDeleted:(BOOL)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  id v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__46;
  v31 = __Block_byref_object_dispose__46;
  v32 = 0;
  objc_msgSend(v14, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __110__HDAssociationEntity_countOfObjectsAssociatedWithObjectUUID_subObjectReference_excludeDeleted_profile_error___block_invoke;
  v21[3] = &unk_1E6CF0588;
  v16 = v12;
  v22 = v16;
  v17 = v13;
  v26 = a5;
  v23 = v17;
  v24 = &v27;
  v25 = a1;
  LODWORD(a7) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDataEntity, "performReadTransactionWithHealthDatabase:error:block:", v15, a7, v21);

  if ((_DWORD)a7)
    v18 = (void *)v28[5];
  else
    v18 = &unk_1E6DFACB8;
  v19 = v18;

  _Block_object_dispose(&v27, 8);
  return v19;
}

BOOL __110__HDAssociationEntity_countOfObjectsAssociatedWithObjectUUID_subObjectReference_excludeDeleted_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  v5 = a2;
  objc_msgSend(v5, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity anyInDatabase:predicate:error:](HDDataEntity, "anyInDatabase:predicate:error:", v6, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_opt_new();
    v10 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithProperty:equalToValue:", CFSTR("destination_object_id"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);

    v13 = *(void **)(a1 + 40);
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0D29838];
      objc_msgSend(v13, "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _HDSQLiteValueForUUID();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "predicateWithProperty:equalToValue:", CFSTR("child_id_objects.uuid"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v17);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("destination_sub_object_id"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v15);
    }

    if (*(_BYTE *)(a1 + 64))
    {
      v19 = (void *)MEMORY[0x1E0D29838];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "predicateWithProperty:equalToValue:", CFSTR("deleted"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v21);

    }
    v22 = *(void **)(a1 + 56);
    v23 = *MEMORY[0x1E0D29620];
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "protectedDatabase");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "countValueForProperty:predicate:database:error:", v23, v24, v25, a3);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)countOfObjectsAssociatedWithObjectPID:(int64_t)a3 excludeDeleted:(BOOL)a4 associationType:(unint64_t)a5 anchor:(int64_t)a6 transaction:(id)a7 error:(id *)a8
{
  _BOOL4 v10;
  id v13;
  void *v14;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;

  v10 = a4;
  v13 = a7;
  v14 = (void *)objc_opt_new();
  v15 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateWithProperty:equalToValue:", CFSTR("destination_object_id"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v17);

  if (v10)
  {
    v18 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predicateWithProperty:equalToValue:", CFSTR("deleted"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v20);

  }
  v21 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "predicateWithProperty:equalToValue:", CFSTR("type"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v23);

  v24 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "predicateWithProperty:greaterThanValue:", CFSTR("ROWID"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v26);

  v27 = *MEMORY[0x1E0D29620];
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "protectedDatabase");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "countValueForProperty:predicate:database:error:", v27, v28, v29, a8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

+ (id)objectUUIDsAssociatedWithObjectUUID:(id)a3 subObjectReference:(id)a4 excludeDeleted:(BOOL)a5 profile:(id)a6 error:(id *)a7
{
  return +[HDAssociationEntity _UUIDsAssociatedWithUUID:subObjectReference:predicateProperty:enumerateProperty:excludeDeleted:profile:error:]((uint64_t)a1, a3, a4, CFSTR("destination_object_id"), CFSTR("child_id_objects.uuid"), a5, a6, (uint64_t)a7);
}

+ (id)_UUIDsAssociatedWithUUID:(void *)a3 subObjectReference:(void *)a4 predicateProperty:(void *)a5 enumerateProperty:(char)a6 excludeDeleted:(void *)a7 profile:(uint64_t)a8 error:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _BOOL4 v27;
  void *v28;
  id v29;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  char v40;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = objc_opt_self();
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v17, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __132__HDAssociationEntity__UUIDsAssociatedWithUUID_subObjectReference_predicateProperty_enumerateProperty_excludeDeleted_profile_error___block_invoke;
  v32[3] = &unk_1E6CF05B0;
  v33 = v13;
  v34 = v14;
  v40 = a6;
  v38 = v19;
  v39 = v18;
  v35 = v15;
  v36 = v16;
  v37 = v17;
  v21 = v19;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  v26 = v13;
  v27 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDataEntity, "performReadTransactionWithHealthDatabase:error:block:", v20, a8, v32);

  if (v27)
    v28 = v21;
  else
    v28 = (void *)MEMORY[0x1E0C9AA60];
  v29 = v28;

  return v29;
}

+ (id)associationUUIDsForObjectUUID:(id)a3 subObjectReference:(id)a4 excludeDeleted:(BOOL)a5 profile:(id)a6 error:(id *)a7
{
  return +[HDAssociationEntity _UUIDsAssociatedWithUUID:subObjectReference:predicateProperty:enumerateProperty:excludeDeleted:profile:error:]((uint64_t)a1, a3, a4, CFSTR("source_object_id"), CFSTR("parent_id_objects.uuid"), a5, a6, (uint64_t)a7);
}

uint64_t __132__HDAssociationEntity__UUIDsAssociatedWithUUID_subObjectReference_predicateProperty_enumerateProperty_excludeDeleted_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
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
  id v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  +[HDDataEntity anyInDatabase:predicate:error:](HDDataEntity, "anyInDatabase:predicate:error:", v6, v7, &v35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v35;

  if (v8)
  {
    v10 = *(void **)(a1 + 40);
    if (v10)
    {
      v34 = 0;
      objc_msgSend(v10, "persistentIDInTransaction:error:", v5, &v34);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v34;
      if (!v11)
      {
        v29 = v12;
        v15 = v29;
        if (v29)
        {
          if (a3)
          {
            v15 = objc_retainAutorelease(v29);
            v14 = 0;
            *a3 = v15;
          }
          else
          {
            _HKLogDroppedError();
            v14 = 0;
          }
          v11 = v15;
        }
        else
        {
          v11 = 0;
          v14 = 1;
        }
        goto LABEL_15;
      }
      v30 = a3;

    }
    else
    {
      v30 = a3;
      v11 = 0;
    }
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = (void *)MEMORY[0x1E0D29838];
    v17 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateWithProperty:equalToValue:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v19);

    if (v11)
      objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("destination_sub_object_id"), v11);
    else
      objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("destination_sub_object_id"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v20, v30);

    if (*(_BYTE *)(a1 + 88))
    {
      v21 = (void *)MEMORY[0x1E0D29838];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "predicateWithProperty:equalToValue:", CFSTR("deleted"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v23);

    }
    v24 = *(void **)(a1 + 80);
    v36[0] = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "database");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __132__HDAssociationEntity__UUIDsAssociatedWithUUID_subObjectReference_predicateProperty_enumerateProperty_excludeDeleted_profile_error___block_invoke_2;
    v32[3] = &unk_1E6CE9FC0;
    v33 = *(id *)(a1 + 72);
    v14 = objc_msgSend(v24, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v25, v26, v27, v31, v32);

LABEL_15:
    goto LABEL_16;
  }
  v13 = v9;
  v11 = v13;
  if (v13)
  {
    if (a3)
    {
      v11 = objc_retainAutorelease(v13);
      v14 = 0;
      *a3 = v11;
    }
    else
    {
      _HKLogDroppedError();
      v14 = 0;
    }
  }
  else
  {
    v14 = 1;
  }
LABEL_16:

  return v14;
}

uint64_t __132__HDAssociationEntity__UUIDsAssociatedWithUUID_subObjectReference_predicateProperty_enumerateProperty_excludeDeleted_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;

  MEMORY[0x1BCCAB1E0](a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  return 1;
}

+ (BOOL)_enumerateAssociationsWithPredicate:(id)a3 syncEntityClass:(Class)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 lastSyncAnchor:(int64_t *)a7 healthDatabase:(id)a8 error:(id *)a9 block:(id)a10
{
  int64_t end;
  int64_t start;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  char v24;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int64_t v32;
  _QWORD v33[4];

  end = a6.end;
  start = a6.start;
  v33[3] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a5;
  v18 = a8;
  v19 = a10;
  objc_msgSend(a1, "predicateForSyncWithPredicate:syncEntityClass:session:syncAnchorRange:", v16, a4, v17, start, end);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = start;
  v33[0] = CFSTR("parent_id_objects.uuid");
  v33[1] = CFSTR("child_id_objects.uuid");
  v33[2] = CFSTR("sync_identity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __141__HDAssociationEntity__enumerateAssociationsWithPredicate_syncEntityClass_session_syncAnchorRange_lastSyncAnchor_healthDatabase_error_block___block_invoke;
  v26[3] = &unk_1E6CF0600;
  v22 = v19;
  v27 = v22;
  v28 = &v29;
  v23 = objc_msgSend(a1, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v21, v20, v18, a9, v26);

  v24 = v23 ^ 1;
  if (!a7)
    v24 = 1;
  if ((v24 & 1) == 0)
    *a7 = v30[3];

  _Block_object_dispose(&v29, 8);
  return v23;
}

uint64_t __141__HDAssociationEntity__enumerateAssociationsWithPredicate_syncEntityClass_session_syncAnchorRange_lastSyncAnchor_healthDatabase_error_block___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v3 = *(id *)(a1 + 32);
  v1 = HKWithAutoreleasePool();

  return v1;
}

BOOL __141__HDAssociationEntity__enumerateAssociationsWithPredicate_syncEntityClass_session_syncAnchorRange_lastSyncAnchor_healthDatabase_error_block___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  char v6;

  MEMORY[0x1BCCAB1E0](a1[6], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1E0](a1[6], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnAsInt64();
  v6 = 0;
  (*(void (**)(void))(a1[4] + 16))();
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a1[7];
  v4 = v6 == 0;

  return v4;
}

+ (BOOL)_enumerateTypedAssociationsWithPredicate:(id)a3 syncEntityClass:(Class)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 lastSyncAnchor:(int64_t *)a7 healthDatabase:(id)a8 transaction:(id)a9 error:(id *)a10 block:(id)a11
{
  int64_t end;
  int64_t start;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  char v25;
  char v26;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int64_t v36;
  _QWORD v37[9];

  end = a6.end;
  start = a6.start;
  v37[7] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  v20 = a11;
  objc_msgSend(a1, "predicateForSyncWithPredicate:syncEntityClass:session:syncAnchorRange:", v16, a4, v17, start, end);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = start;
  v37[0] = CFSTR("parent_id_objects.uuid");
  v37[1] = CFSTR("child_id_objects.uuid");
  v37[2] = CFSTR("sync_identity");
  v37[3] = CFSTR("type");
  v37[4] = CFSTR("deleted");
  v37[5] = CFSTR("creation_date");
  v37[6] = CFSTR("destination_sub_object_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __158__HDAssociationEntity__enumerateTypedAssociationsWithPredicate_syncEntityClass_session_syncAnchorRange_lastSyncAnchor_healthDatabase_transaction_error_block___block_invoke;
  v29[3] = &unk_1E6CF0650;
  v23 = v19;
  v30 = v23;
  v24 = v20;
  v31 = v24;
  v32 = &v33;
  v25 = objc_msgSend(a1, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v22, v21, v18, a10, v29);

  v26 = v25 ^ 1;
  if (!a7)
    v26 = 1;
  if ((v26 & 1) == 0)
    *a7 = v34[3];

  _Block_object_dispose(&v33, 8);
  return v25;
}

uint64_t __158__HDAssociationEntity__enumerateTypedAssociationsWithPredicate_syncEntityClass_session_syncAnchorRange_lastSyncAnchor_healthDatabase_transaction_error_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v4;
  id v5;

  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v2 = HKWithAutoreleasePool();

  return v2;
}

uint64_t __158__HDAssociationEntity__enumerateTypedAssociationsWithPredicate_syncEntityClass_session_syncAnchorRange_lastSyncAnchor_healthDatabase_transaction_error_block___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  MEMORY[0x1BCCAB1E0](*(_QWORD *)(a1 + 56), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1E0](*(_QWORD *)(a1 + 56), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnAsInt64();
  HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB174](*(_QWORD *)(a1 + 56), 4);
  MEMORY[0x1BCCAB198](*(_QWORD *)(a1 + 56), 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HDSQLiteColumnAsInt64();
  HDReferenceForUnknownAssociatableObjectWithPersistentID(v7, *(void **)(a1 + 32), a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(a1 + 64);

  return 1;
}

+ (BOOL)_insertCodableObjectAssociations:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  BOOL v16;
  id obj;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(obj);
        v19 = v10;
        v20 = v9;
        v15 = HKWithAutoreleasePool();

        if (!v15)
        {
          v16 = 0;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_11:

  return v16;
}

BOOL __80__HDAssociationEntity__insertCodableObjectAssociations_syncStore_profile_error___block_invoke(id *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v16;
  int8x16_t v17;
  _QWORD v18[4];
  int8x16_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__46;
  v25 = __Block_byref_object_dispose__46;
  objc_msgSend(a1[4], "syncIdentityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legacySyncIdentity");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__HDAssociationEntity__insertCodableObjectAssociations_syncStore_profile_error___block_invoke_2;
  v18[3] = &unk_1E6CF0008;
  v20 = &v21;
  v17 = *((int8x16_t *)a1 + 2);
  v6 = (id)v17.i64[0];
  v19 = vextq_s8(v17, v17, 8uLL);
  v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performWriteTransactionWithHealthDatabase:error:block:", v5, a2, v18);

  if (v7)
  {
    objc_msgSend(a1[5], "decodedAssociationUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "objectUuids");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(a1[6], "syncProvenance");
    objc_msgSend((id)v22[5], "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "persistentID");
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v16) = 256;
    v14 = +[HDAssociationEntity _insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:](HDAssociationEntity, "_insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:", v8, v9, v10, v12, 0, 0, v13, 0, v16, a1[4], 0, a2);

  }
  else
  {
    v14 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __80__HDAssociationEntity__insertCodableObjectAssociations_syncStore_profile_error___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hasSyncIdentity"))
  {
    objc_msgSend(*(id *)(a1 + 32), "syncIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v6, &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v8;
      v10 = 1;
      objc_msgSend(v9, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v7, 1, v5, &v18);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v18;

      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v11;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
LABEL_16:

        goto LABEL_17;
      }
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v12;
        _os_log_fault_impl(&dword_1B7802000, v15, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      v12 = v12;
      if (!v12)
      {
LABEL_15:

        v10 = 0;
        goto LABEL_16;
      }
      if (!a3)
      {
LABEL_8:
        _HKLogDroppedError();
        goto LABEL_15;
      }
    }
    else
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v8;
        _os_log_fault_impl(&dword_1B7802000, v16, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      v12 = v8;
      if (!v12)
        goto LABEL_15;
      if (!a3)
        goto LABEL_8;
    }
    v12 = objc_retainAutorelease(v12);
    *a3 = v12;
    goto LABEL_15;
  }
  v10 = 1;
LABEL_17:

  return v10;
}

@end
