@implementation HDDataEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (objc_msgSend(a1, "requiresSampleTypePredicate"))
  {
    v5 = (void *)MEMORY[0x1E0D29890];
    HDDataEntityPredicateForType(objc_msgSend(a1, "preferredEntityType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "compoundPredicateWithPredicate:otherPredicate:", v4, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

+ (id)_insertDataObject:(id)a3 withProvenanceID:(id)a4 inDatabase:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v29;
  id v30;
  id v31;
  _BYTE buf[24];
  void *v33;
  id v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend(a1, "superclass");
  if (objc_msgSend(v13, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(v13, "_insertDataObject:withProvenanceID:inDatabase:error:", v10, v11, v12, a6);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(a1, "participatesInInsertion"))
  {
    v15 = objc_opt_class();
    if (v15 == objc_opt_class())
    {
      v21 = v10;
      v30 = v11;
      v22 = v12;
      v23 = objc_opt_self();
      v24 = (void *)objc_opt_class();
      if ((objc_msgSend(v24, "isEqual:", objc_opt_class()) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__insertBaseDataObject_withProvenance_inDatabase_error_, v23, CFSTR("HDDataEntity.m"), 1339, CFSTR("Subclasses must not override %s"), "+[HDDataEntity _insertBaseDataObject:withProvenance:inDatabase:error:]");

      }
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __70__HDDataEntity__insertBaseDataObject_withProvenance_inDatabase_error___block_invoke;
      v33 = &unk_1E6CE7750;
      v25 = v21;
      v34 = v25;
      v26 = v30;
      v35 = v26;
      v27 = 0;
      if (objc_msgSend(v22, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT OR IGNORE INTO objects (uuid, provenance, type, creation_date) VALUES (?, ?, ?, ?)"), a6, buf, 0))
      {
        if ((int)objc_msgSend(v22, "getChangesCount") < 1)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 115, CFSTR("Duplicate HKObject"));
          v27 = 0;
        }
        else
        {
          objc_msgSend(v22, "lastInsertRowID");
          v27 = objc_claimAutoreleasedReturnValue();
        }
      }

      goto LABEL_25;
    }
    if (v14)
    {
      objc_msgSend(a1, "insertDataObject:withProvenance:inDatabase:persistentID:error:", v10, v11, v12, v14, a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v31 = 0;
        v17 = objc_msgSend(a1, "_removeObjectWithPersistentID:database:error:", objc_msgSend(v14, "longLongValue"), v12, &v31);
        v18 = v31;
        if ((v17 & 1) == 0)
        {
          _HKInitializeLogging();
          v19 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v14;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v18;
            _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_INFO, "Failed to remove object with persistent id %{public}@ after failing subclasss insertion: %{public}@", buf, 0x16u);
          }
          v20 = v18;
          if (v20)
          {
            if (a6)
              *a6 = objc_retainAutorelease(v20);
            else
              _HKLogDroppedError();
          }

        }
        v14 = 0;
      }
      v14 = v14;

      v27 = (uint64_t)v14;
LABEL_25:

      v14 = (id)v27;
    }
  }

  return v14;
}

+ (BOOL)isBackedByTable
{
  return 1;
}

+ (id)entityEnumeratorWithProfile:(id)a3
{
  id v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if ((objc_msgSend(a1, "isConcreteEntity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataEntity.m"), 918, CFSTR("%@ should not be used for abstract class %@"), v9, v10);

  }
  v6 = -[HDDataEntityEnumerator _initWithEntityClass:profile:]([HDDataEntityEnumerator alloc], "_initWithEntityClass:profile:", a1, v5);

  return v6;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D29618]))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v6, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)objc_msgSend(a1, "entityForProperty:", v4);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "disambiguatedDatabaseTable");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.%@"), v10, v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = v4;
    }
  }

  return v7;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v5 = (id)objc_msgSend(a1, "entityForProperty:", v4);
  if (v5)
  {
    v6 = v5;
    if (v5 != a1)
    {
      v7 = (void *)MEMORY[0x1E0D29870];
      objc_msgSend(a1, "disambiguatedDatabaseTable");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v8, v6, 0, CFSTR("data_id"), CFSTR("data_id"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "joinClausesForProperty:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v10, "setByAddingObjectsFromSet:", v11);
        v12 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v12;
      }

      goto LABEL_28;
    }
  }
  if (qword_1ED5522D0 != -1)
    dispatch_once(&qword_1ED5522D0, &__block_literal_global_318);
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.sync_provenance")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.origin_build")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.origin_product_type")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.local_build")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.local_product_type")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.source_version")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.tz_name")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.source_id")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.device_id")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.origin_major_version")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.origin_minor_version")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.origin_patch_version")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.derived_flags")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.contributor_id")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("data_provenances.sync_identity")) & 1) != 0)
  {
    v13 = &_MergedGlobals_5;
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("external_sync_ids.sid")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("external_sync_ids.version")) & 1) == 0
      && !objc_msgSend(v4, "isEqualToString:", CFSTR("external_sync_ids.object_code")))
    {
      goto LABEL_34;
    }
    v13 = &qword_1ED5522C8;
  }
  v14 = (id)*v13;
  if (!v14)
  {
LABEL_34:
    v22.receiver = a1;
    v22.super_class = (Class)&OBJC_METACLASS___HDDataEntity;
    objc_msgSendSuper2(&v22, sel_joinClausesForProperty_, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  v9 = v14;
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = (void *)MEMORY[0x1E0C99E60];
  if (v15 == v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v19, objc_opt_class(), 0, CFSTR("data_id"), CFSTR("data_id"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithObjects:", v9, v20, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_28:

LABEL_29:
  return v10;
}

+ (Class)baseDataEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("data_provenances.sync_provenance");
}

+ (int64_t)countOfObjectsWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  objc_super v12;

  v8 = a4;
  objc_msgSend(a1, "predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___HDDataEntity;
  v10 = objc_msgSendSuper2(&v12, sel_countOfObjectsWithPredicate_healthDatabase_error_, v9, v8, a5);

  return (int64_t)v10;
}

+ (id)anyInDatabase:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  objc_super v12;

  v8 = a3;
  objc_msgSend(a1, "predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___HDDataEntity;
  objc_msgSendSuper2(&v12, sel_anyInDatabase_predicate_error_, v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsObjectMerging
{
  return 0;
}

+ (id)_primitiveInsertDataObject:(void *)a3 insertionContext:(void *)a4 entityClass:(uint64_t)a5 provenanceEntityID:(void *)a6 profile:(void *)a7 transaction:(uint64_t)a8 error:
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v14 = a2;
  v15 = a3;
  v16 = a6;
  v17 = a7;
  objc_msgSend(v17, "databaseForEntityClass:", objc_opt_self());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a4, "_insertDataObject:withProvenanceID:inDatabase:error:", v14, v19, v18, a8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (objc_msgSend(v14, "hd_insertRelatedDataWithPersistentID:insertionContext:profile:transaction:error:", v20, v15, v16, v17, a8))v21 = v20;
    else
      v21 = 0;
    v22 = v21;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (int64_t)shouldInsertObject:(id)a3 sourceID:(id)a4 profile:(id)a5 transaction:(id)a6 objectToReplace:(id *)a7 objectID:(id *)a8 error:(id *)a9
{
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  _QWORD v58[5];
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  id v66;
  uint8_t buf[4];
  id v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v57 = a4;
  v15 = a5;
  v56 = a6;
  objc_msgSend(v14, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CB55D0];
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CB55D0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v15, "sourceManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localSourceForSourceID:copyIfNecessary:error:", v57, 1, a9);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v55)
    {
      v40 = 2;
LABEL_41:

      goto LABEL_42;
    }
    objc_msgSend(v56, "databaseForEntityClass:", objc_opt_class());
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    v20 = +[HDDataExternalSyncIdentifierEntity populateSyncInfoForLocalSourceID:externalSyncObjectCode:syncIdentifier:deleted:database:objectIDOut:errorOut:](HDDataExternalSyncIdentifierEntity, "populateSyncInfoForLocalSourceID:externalSyncObjectCode:syncIdentifier:deleted:database:objectIDOut:errorOut:", objc_msgSend(v55, "persistentID"), objc_msgSend(v14, "_externalSyncObjectCode"), v18, 0, v54, &v66, a9);
    v21 = v66;
    if (v20)
    {
      v22 = v21;
      if (v21)
      {
        v51 = (void *)objc_msgSend(v14, "hd_dataEntityClass");
        v60 = 0;
        v61 = &v60;
        v62 = 0x3032000000;
        v63 = __Block_byref_object_copy__73;
        v64 = __Block_byref_object_dispose__73;
        v65 = 0;
        objc_msgSend(v51, "entityEnumeratorWithProfile:", v15);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:value:comparisonType:", CFSTR("data_id"), v22, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setPredicate:", v23);

        objc_msgSend(v53, "setIgnoreEntityClassAdditionalPredicateForEnumeration:", 1);
        v59 = 0;
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __95__HDDataEntity_shouldInsertObject_sourceID_profile_transaction_objectToReplace_objectID_error___block_invoke;
        v58[3] = &unk_1E6CE7EA0;
        v58[4] = &v60;
        objc_msgSend(v53, "enumerateWithError:handler:", &v59, v58);
        v24 = v59;
        v25 = (void *)v61[5];
        if (!v25)
        {
          if (v24)
          {
            v27 = v24;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Could not find existing object of class %@ to delete with external sync identifier '%@' (object ID %@)"), v51, v18, v22);
            v27 = (id)objc_claimAutoreleasedReturnValue();
            if (!v27)
            {
              v50 = 0;
              v40 = 2;
              goto LABEL_39;
            }
          }
          if (a9)
          {
            v27 = objc_retainAutorelease(v27);
            *a9 = v27;
          }
          else
          {
            _HKLogDroppedError();
          }
          v40 = 2;
          v50 = v27;
          goto LABEL_39;
        }
        v50 = v24;
        if (a7)
          *a7 = objc_retainAutorelease(v25);
        if (a8)
          *a8 = objc_retainAutorelease(v22);
        objc_msgSend((id)v61[5], "metadata");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v17);
        v27 = (id)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v27, "isEqualToString:", v18))
        {
          v48 = (id)v61[5];
          v49 = v14;
          v28 = objc_opt_self();
          if (!v49)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel__shouldReplaceExistingObject_withObject_dataEntityClass_, v28, CFSTR("HDDataEntity.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataObject != nil"));

          }
          v29 = v48;
          if (!v48)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", sel__shouldReplaceExistingObject_withObject_dataEntityClass_, v28, CFSTR("HDDataEntity.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("existingObject != nil"));

            v29 = 0;
          }
          -[NSObject metadata](v29, "metadata");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = *MEMORY[0x1E0CB55D8];
          objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0CB55D8]);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            objc_msgSend(v49, "metadata");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectForKeyedSubscript:", v31);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v34)
            {

LABEL_44:
              v40 = 1;
              goto LABEL_39;
            }
            v35 = objc_msgSend(v34, "compare:", v32);
            if (!v35)
            {
              objc_msgSend(v49, "_creationDate");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject _creationDate](v48, "_creationDate");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v36, "compare:", v37);

              if (!v35)
              {
                v35 = objc_msgSend(v51, "compareForReplacmentWithObject:existingObject:", v49, v48);
                if (!v35)
                {
                  objc_msgSend(v49, "UUID");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "UUIDString");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject UUID](v48, "UUID");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "UUIDString");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = objc_msgSend(v47, "compare:", v39);

                }
              }
            }

            if (v35 == -1)
              goto LABEL_44;
LABEL_38:
            v40 = 0;
LABEL_39:

            _Block_object_dispose(&v60, 8);
            goto LABEL_40;
          }

          v41 = v48;
        }
        else
        {
          _HKInitializeLogging();
          v41 = (id)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)v61[5], "UUID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "UUIDString");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v68 = v27;
            v69 = 2112;
            v70 = v18;
            v71 = 2114;
            v72 = v43;
            _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "Unexpected sync identifier %@ (expected %@) for existing object %{public}@", buf, 0x20u);

          }
        }

        goto LABEL_38;
      }
      v40 = 0;
    }
    else
    {
      v22 = v21;
      v40 = 2;
    }
LABEL_40:

    goto LABEL_41;
  }
  v40 = 0;
LABEL_42:

  return v40;
}

uint64_t __95__HDDataEntity_shouldInsertObject_sourceID_profile_transaction_objectToReplace_objectID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

id __113__HDDataEntity__insertDataObject_insertionContext_provenanceEntityID_profile_transaction_insertedEntityID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return +[HDDataEntity _primitiveInsertDataObject:insertionContext:entityClass:provenanceEntityID:profile:transaction:error:](*(_QWORD *)(a1 + 56), a2, *(void **)(a1 + 32), *(void **)(a1 + 64), *(_QWORD *)(a1 + 72), *(void **)(a1 + 40), *(void **)(a1 + 48), a3);
}

+ (BOOL)replaceExistingObject:(id)a3 existingObjectID:(id)a4 replacementObject:(id)a5 replacementObjectID:(id)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  if (+[HDAssociationEntity copyAssociationsFromChildID:toObjectID:profile:error:](HDAssociationEntity, "copyAssociationsFromChildID:toObjectID:profile:error:", a4, a6, v13, a9))
  {
    objc_msgSend(v13, "dataManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "deleteDataObjects:restrictedSourceEntities:failIfNotFound:recursiveDeleteAuthorizationBlock:error:", v15, 0, 1, 0, a9);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (void)insertDataObjects:(id)a3 insertionContext:(id)a4 profile:(id)a5 completionHandler:(id)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  uint64_t (**v22)(_QWORD, _QWORD, _QWORD);
  void *v23;
  char v24;
  id v25;
  char v26;
  void *v27;
  void (**v28)(id, uint64_t, BOOL);
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  const __CFString *v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v47;
  id v48;
  id v49;
  void *v50;
  void (**v51)(id, uint64_t, BOOL);
  uint64_t v52;
  id obj;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  __int128 *v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  _BYTE *v64;
  id v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE buf[12];
  __int16 v73;
  const __CFString *v74;
  __int16 v75;
  id v76;
  _BYTE v77[24];
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v9 = a4;
  v48 = a5;
  v50 = v9;
  v51 = (void (**)(id, uint64_t, BOOL))a6;
  objc_msgSend(v9, "provenance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "isValid");

  if ((a5 & 1) != 0)
  {
    v67 = 0;
    v11 = v49;
    v12 = v9;
    v47 = v48;
    v52 = objc_opt_self();
    v44 = v12;
    v13 = objc_msgSend(v12, "skipInsertionFilter");
    v14 = 0;
    if ((v13 & 1) == 0)
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = v11;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v69;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v69 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v67, 3, CFSTR("Invalid data object %@"), v18);
            goto LABEL_31;
          }
          if ((v13 & 1) == 0)
          {
            v19 = objc_msgSend(v18, "hd_dataEntityClass");
            if (v19)
              v20 = (objc_class *)v19;
            else
              v20 = (objc_class *)v52;
            NSStringFromClass(v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v21);
            v22 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            if (!v22)
            {
              -[objc_class objectInsertionFilterForProfile:](v20, "objectInsertionFilterForProfile:", v47);
              v22 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v23 = _Block_copy(v22);
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, v21);

            }
            *(_QWORD *)buf = 0;
            v24 = ((uint64_t (**)(_QWORD, void *, _BYTE *))v22)[2](v22, v18, buf);
            v25 = *(id *)buf;
            if ((v24 & 1) == 0)
            {
              if (v25)
              {
                v30 = v25;
                goto LABEL_29;
              }
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Internal error occurred for %@ insertionFilter."), objc_opt_class());
              v30 = (id)objc_claimAutoreleasedReturnValue();
              if (v30)
              {
LABEL_29:
                v67 = objc_retainAutorelease(v30);

              }
LABEL_31:
              v26 = 0;
              goto LABEL_32;
            }

          }
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
        if (v15)
          continue;
        break;
      }
    }
    v26 = 1;
LABEL_32:

    v31 = v67;
    v29 = v31;
    if ((v26 & 1) != 0)
    {
      *(_QWORD *)v77 = 0;
      *(_QWORD *)&v77[8] = v77;
      *(_QWORD *)&v77[16] = 0x3032000000;
      v78 = __Block_byref_object_copy__73;
      v79 = __Block_byref_object_dispose__73;
      v80 = 0;
      *(_QWORD *)&v68 = 0;
      *((_QWORD *)&v68 + 1) = &v68;
      *(_QWORD *)&v69 = 0x2020000000;
      BYTE8(v69) = 0;
      objc_msgSend(v47, "database");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = MEMORY[0x1E0C809B0];
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __77__HDDataEntity_insertDataObjects_insertionContext_profile_completionHandler___block_invoke;
      v60[3] = &unk_1E6CF5470;
      v65 = a1;
      v66 = v29;
      v61 = v44;
      v62 = v47;
      v63 = obj;
      v64 = v77;
      v54[0] = v33;
      v54[1] = 3221225472;
      v54[2] = __77__HDDataEntity_insertDataObjects_insertionContext_profile_completionHandler___block_invoke_2;
      v54[3] = &unk_1E6CF5498;
      v58 = &v68;
      v59 = a1;
      v55 = v63;
      v56 = v61;
      v57 = v62;
      v34 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v32, &v66, v60, v54);
      v35 = v66;

      if ((v34 & 1) == 0)
      {
        _HKInitializeLogging();
        v36 = (void *)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
        {
          v37 = v36;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            v38 = (void *)objc_opt_class();
            if (*(_BYTE *)(*((_QWORD *)&v68 + 1) + 24))
              v39 = CFSTR("journaling");
            else
              v39 = CFSTR("insertion");
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v38;
            v73 = 2114;
            v74 = v39;
            v75 = 2114;
            v76 = v35;
            v40 = v38;
            _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_INFO, "%{public}@: object %{public}@ failed with error: %{public}@", buf, 0x20u);

          }
        }
      }
      if (v51)
        v51[2](v51, v34, *(_QWORD *)(*(_QWORD *)&v77[8] + 40) != 0);

      _Block_object_dispose(&v68, 8);
      _Block_object_dispose(v77, 8);

      v29 = v35;
    }
    else
    {
      if (!v31)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Internal error attempting to validate objects for insertion."));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v51)
        ((void (*)(void))v51[2])();
    }
    goto LABEL_48;
  }
  _HKInitializeLogging();
  v27 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v41 = v27;
    v42 = objc_msgSend(v49, "count");
    objc_msgSend(v50, "provenance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v77 = 134218242;
    *(_QWORD *)&v77[4] = v42;
    *(_WORD *)&v77[12] = 2114;
    *(_QWORD *)&v77[14] = v43;
    _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "Failed to insert %lu objects, invalid provenance %{public}@", v77, 0x16u);

  }
  v28 = v51;
  if (v51)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Invalid provenance."));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(id, uint64_t, BOOL), _QWORD, _QWORD, _QWORD, void *))v51[2])(v51, 0, 0, 0, v29);
LABEL_48:

    v28 = v51;
  }

}

uint64_t __77__HDDataEntity_insertDataObjects_insertionContext_profile_completionHandler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v29;
  int v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "provenance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dataProvenanceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v34 = v5;
  objc_msgSend(v8, "provenanceEntityForProvenance:transaction:error:", v7, v5, &v43);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v43;

  if (!v9)
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v46 = v7;
      v47 = 2114;
      v48 = v10;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Failed to lookup data provenance for %@: %{public}@", buf, 0x16u);
      if (v10)
        goto LABEL_12;
    }
    else if (v10)
    {
LABEL_12:
      v10 = v10;
      goto LABEL_37;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Internal error occurred fetching provenance %@"), v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_41:
      v26 = 0;
      goto LABEL_42;
    }
LABEL_37:
    if (a3)
    {
      *a3 = objc_retainAutorelease(v10);
LABEL_40:

      goto LABEL_41;
    }
LABEL_39:
    _HKLogDroppedError();
    goto LABEL_40;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "resolveAssociations") & 1) != 0 || objc_msgSend(v7, "syncProvenance"))
  {
    v11 = *(void **)(a1 + 64);
    v42 = 0;
    objc_msgSend(v11, "maxPersistentIDWithPredicate:database:error:", 0, v6, &v42);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v42;
    v14 = v13;
    if (!v12 && v13)
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v46 = v14;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "Failed to find current max persistent ID to prepare for pending association realization: %{public}@", buf, 0xCu);
      }
      if (a3)
        *a3 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();

      goto LABEL_41;
    }
    v29 = objc_msgSend(v12, "longLongValue");

    v30 = 0;
  }
  else
  {
    v29 = 0;
    v30 = 1;
  }
  v31 = a3;
  v32 = v7;
  v33 = v6;
  objc_msgSend(v9, "persistentID");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = *(id *)(a1 + 48);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v39;
LABEL_17:
    v21 = 0;
    v22 = v10;
    while (1)
    {
      if (*(_QWORD *)v39 != v20)
        objc_enumerationMutation(v17);
      v35 = *(id *)(a1 + 32);
      v36 = *(id *)(a1 + 40);
      v37 = v34;
      v23 = HKWithAutoreleasePool();
      v10 = v22;

      if (!v23)
        break;
      ++v21;
      v22 = v10;
      if (v19 == v21)
      {
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        if (v19)
          goto LABEL_17;
        goto LABEL_23;
      }
    }

    if (v10)
    {
      v10 = v10;
      v7 = v32;
      v6 = v33;
      v27 = v31;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Internal error reporting failure."));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v32;
      v6 = v33;
      v27 = v31;
      if (!v10)
        goto LABEL_41;
    }
    if (v27)
    {
      *v27 = objc_retainAutorelease(v10);
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_23:

  v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v24)
  {
    v25 = +[HDKeyValueEntity setNumber:forKey:domain:category:profile:error:](HDUnprotectedKeyValueEntity, "setNumber:forKey:domain:category:profile:error:", v24, CFSTR("HDMaxObjectPersistentID"), &stru_1E6D11BB8, 0, *(_QWORD *)(a1 + 40), v31);
    v7 = v32;
    v6 = v33;
    if (!(v30 | !v25))
      v25 = +[HDAssociationEntity realizePendingAssociationsWithTransaction:startingAnchor:error:](HDAssociationEntity, "realizePendingAssociationsWithTransaction:startingAnchor:error:", v34, v29, v31);
    v26 = v25;
  }
  else
  {
    v26 = 1;
    v7 = v32;
    v6 = v33;
  }
LABEL_42:

  return v26;
}

BOOL __77__HDDataEntity_insertDataObjects_insertionContext_profile_completionHandler___block_invoke_265(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v41;
  void *v42;
  _QWORD *v43;
  int v44;
  _QWORD *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  _BYTE v62[24];
  void *v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 40);
  v47 = *(_QWORD *)(a1 + 80);
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v7 = *(id *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = objc_opt_self();
  objc_msgSend(v8, "prepareObjectForInsertion:", v7);
  v12 = objc_msgSend(v7, "hd_dataEntityClass");
  if (v12)
    v13 = (void *)v12;
  else
    v13 = (void *)v11;
  objc_msgSend(v8, "provenance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "provenance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sourceID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v57 = 0;
  v45 = a2;
  v43 = a2;
  v16 = v9;
  v53 = v10;
  v17 = objc_msgSend(v13, "shouldInsertObject:sourceID:profile:transaction:objectToReplace:objectID:error:", v7, v15, v9, v10, &v57, &v56, v43);
  v52 = v57;
  v50 = v56;

  if (v17 == 2)
  {
    v18 = 0;
    v19 = 0;
    goto LABEL_8;
  }
  if (v17 == 1)
  {
    v18 = 0;
    v19 = 1;
LABEL_8:
    v20 = v16;
    v21 = v52;
    v22 = v50;
    goto LABEL_33;
  }
  v55 = 0;
  v20 = v16;
  +[HDDataEntity _primitiveInsertDataObject:insertionContext:entityClass:provenanceEntityID:profile:transaction:error:](v11, v7, v8, v13, v47, v16, v10, (uint64_t)&v55);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v55;
  v25 = v24;
  if (!v23)
  {
    if ((objc_msgSend(v24, "hk_isHealthKitErrorWithCode:", 115) & 1) == 0)
    {
      v33 = v25;
      v34 = v33;
      v21 = v52;
      v22 = v50;
      if (v33)
      {
        if (v45)
          *v45 = objc_retainAutorelease(v33);
        else
          _HKLogDroppedError();
      }

      v18 = 0;
      v19 = 0;
      goto LABEL_32;
    }
    if ((objc_msgSend(v13, "supportsObjectMerging") & 1) == 0)
    {
      _HKInitializeLogging();
      v35 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v62 = 138543618;
        *(_QWORD *)&v62[4] = v7;
        *(_WORD *)&v62[12] = 2114;
        *(_QWORD *)&v62[14] = v25;
        _os_log_debug_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEBUG, "Ignoring duplicate object error while inserting %{public}@: %{public}@", v62, 0x16u);
      }
      v18 = 0;
      v19 = 1;
      goto LABEL_28;
    }
    v29 = v25;
    v54 = 0;
    *(_QWORD *)v62 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v62[8] = 3221225472;
    *(_QWORD *)&v62[16] = __113__HDDataEntity__insertDataObject_insertionContext_provenanceEntityID_profile_transaction_insertedEntityID_error___block_invoke;
    v63 = &unk_1E6CF5420;
    v67 = v11;
    v64 = v8;
    v68 = v13;
    v69 = v47;
    v30 = v16;
    v65 = v30;
    v66 = v10;
    objc_msgSend(v13, "mergeDataObject:provenance:profile:transaction:error:insertHandler:", v7, v51, v30, v66, &v54, v62);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v31 = v54;
    v49 = v31;
    if (v18)
    {
      v32 = objc_retainAutorelease(v18);
      v19 = 1;
    }
    else
    {
      v25 = v29;
      if (v31)
      {
        if (v45)
        {
          v19 = 0;
          *v45 = objc_retainAutorelease(v31);
        }
        else
        {
          _HKLogDroppedError();
          v19 = 0;
        }
        goto LABEL_19;
      }
      _HKInitializeLogging();
      v19 = 1;
      v46 = (void *)*MEMORY[0x1E0CB52B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
      {
LABEL_19:

LABEL_28:
        v21 = v52;
        goto LABEL_29;
      }
      v41 = v46;
      objc_msgSend(v7, "UUID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = v11;
      v60 = 2114;
      v61 = v42;
      _os_log_impl(&dword_1B7802000, v41, OS_LOG_TYPE_INFO, "%{public}@ failed to find existing object with UUID (%{public}@) during object merge", buf, 0x16u);

      v20 = v16;
    }
    v25 = v29;
    goto LABEL_19;
  }
  v18 = objc_retainAutorelease(v23);
  v21 = v52;
  if (v52)
  {
    objc_msgSend(v16, "attachmentManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "attachmentObjectIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentObjectIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDObjectAttachmentSchemaProvider schemaIdentifier](HDObjectAttachmentSchemaProvider, "schemaIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v48, "replaceReferencesWithObjectIdentifier:replacementIdentifier:schemaIdentifier:error:", v26, v27, v28, v45);

    v21 = v52;
    v20 = v16;

    v22 = v50;
    v19 = v44
       && (objc_msgSend(v13, "replaceExistingObject:existingObjectID:replacementObject:replacementObjectID:profile:transaction:error:", v52, v50, v7, v18, v16, v53, v45) & 1) != 0;
    goto LABEL_32;
  }
  v19 = 1;
LABEL_29:
  v22 = v50;
LABEL_32:

LABEL_33:
  v36 = v18;
  v37 = v36;
  if (v36)
  {
    v38 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (!*(_QWORD *)(v38 + 40))
    {
LABEL_37:
      objc_storeStrong((id *)(v38 + 40), v18);
      goto LABEL_38;
    }
    v39 = objc_msgSend(v36, "longLongValue");
    if (v39 > objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "longLongValue"))
    {
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      goto LABEL_37;
    }
  }
LABEL_38:

  return v19;
}

uint64_t __77__HDDataEntity_insertDataObjects_insertionContext_profile_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 64), "journalObjects:insertionContext:profile:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
}

+ (BOOL)journalObjects:(id)a3 insertionContext:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  HDCodableObjectCollection *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  id *v29;
  id *v30;
  void *v31;
  char v32;
  id v33;
  BOOL v34;
  id *v36;
  void *context;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v43 = v10;
  objc_msgSend(v10, "provenance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  objc_msgSend(v11, "sourceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sourceID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v14, "clientSourceForPersistentID:error:", v15, &v49);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v49;

  objc_msgSend(v16, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v38 = v17;
    v39 = v16;
    v36 = a6;
    v41 = v12;
    v19 = objc_alloc_init(HDCodableObjectCollection);
    v42 = v18;
    context = (void *)MEMORY[0x1BCCACAC4](-[HDCodableObjectCollection setSourceBundleIdentifier:](v19, "setSourceBundleIdentifier:", v18));
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v40 = v9;
    v22 = v9;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v46 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v43, "prepareObjectForInsertion:", v27);
          objc_msgSend(v27, "hd_relatedJournalEntriesWithProfile:", v13);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObjectsFromArray:", v28);

          objc_msgSend(v27, "_setSourceBundleIdentifier:", 0);
          objc_msgSend(v27, "_setSourceRevision:", 0);
          if ((objc_msgSend(v27, "addCodableRepresentationToCollectionForJournal:", v19) & 1) == 0)
          {
            objc_msgSend(v27, "_setSourceBundleIdentifier:", v42);
            v29 = -[_HDDataInsertionJournalEntry initWithDataObject:provenance:]((id *)[_HDDataInsertionJournalEntry alloc], v27, v41);
            objc_msgSend(v20, "addObject:", v29);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v24);
    }

    v12 = v41;
    if (-[HDCodableObjectCollection count](v19, "count"))
    {
      v30 = -[_HDDataBatchInsertionJournalEntry initWithCodableObjectCollection:provenance:]((id *)[_HDDataBatchInsertionJournalEntry alloc], v19, v41);
      objc_msgSend(v20, "addObject:", v30);

    }
    objc_msgSend(v20, "addObjectsFromArray:", v21);
    objc_msgSend(v13, "database");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v38;
    v32 = objc_msgSend(v31, "addJournalEntries:error:", v20, &v44);
    v33 = v44;

    objc_autoreleasePoolPop(context);
    v16 = v39;
    v18 = v42;
    if ((v32 & 1) != 0)
    {
      v34 = 1;
      v9 = v40;
      goto LABEL_22;
    }
    v9 = v40;
    a6 = v36;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Batch journal failed on nil identifier, %@"), v12);
    v33 = (id)objc_claimAutoreleasedReturnValue();

  }
  v33 = v33;
  if (v33)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v33);
    else
      _HKLogDroppedError();
  }

  v34 = 0;
LABEL_22:

  return v34;
}

uint64_t __71__HDDataEntity__sourceBundleIdentifierForSourceEntities_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "sourceBundleIdentifierInDatabase:error:", v6, a3, (_QWORD)v16);
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v14 = 0;
          goto LABEL_11;
        }
        v13 = (void *)v12;
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  return v14;
}

+ (void)deleteDataObjects:(id)a3 restrictedSourceEntities:(id)a4 failIfNotFound:(BOOL)a5 profile:(id)a6 recursiveDeleteAuthorizationBlock:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  BOOL v51;
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__73;
  v57 = __Block_byref_object_dispose__73;
  v58 = 0;
  v19 = objc_alloc_init(MEMORY[0x1E0CB65B0]);
  v36 = a1;
  objc_msgSend(v16, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v21 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __134__HDDataEntity_deleteDataObjects_restrictedSourceEntities_failIfNotFound_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke;
  v43[3] = &unk_1E6CF54C0;
  v44 = v15;
  v45 = v16;
  v48 = v17;
  v22 = v14;
  v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v18;
  v24 = v22;
  v46 = v22;
  v25 = v19;
  v51 = a5;
  v47 = v25;
  v49 = &v59;
  v50 = &v53;
  v37[0] = v21;
  v37[1] = 3221225472;
  v37[2] = __134__HDDataEntity_deleteDataObjects_restrictedSourceEntities_failIfNotFound_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke_2;
  v37[3] = &unk_1E6CF54E8;
  v26 = v48;
  v41 = v26;
  v27 = v44;
  v38 = v27;
  v42 = v36;
  v28 = v45;
  v39 = v28;
  v29 = v24;
  v40 = v29;
  v30 = objc_msgSend(v36, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v20, &v52, v43, v37);
  v31 = v52;

  if (v23)
  {
    if ((_DWORD)v30)
    {
      if (*((_BYTE *)v60 + 24))
      {
        v32 = 0;
        v33 = v54[5];
        v34 = 1;
        v35 = v25;
      }
      else
      {
        v34 = 0;
        v33 = 0;
        v35 = 0;
        v32 = 0;
      }
    }
    else
    {
      v34 = 0;
      v33 = 0;
      v35 = 0;
      v32 = v31;
    }
    ((void (**)(_QWORD, uint64_t, uint64_t, uint64_t, id, id))v23)[2](v23, v30, v34, v33, v35, v32);
  }

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

}

uint64_t __134__HDDataEntity_deleteDataObjects_restrictedSourceEntities_failIfNotFound_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  HDDataEntityDeletionContext *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v41 = a1;
  v39 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v39)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v7 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v55 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "persistentID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }
  v13 = -[HDDataEntityDeletionContext initWithProfile:transaction:]([HDDataEntityDeletionContext alloc], "initWithProfile:transaction:", *(_QWORD *)(v41 + 40), v5);
  v14 = 1;
  -[HDDataEntityDeletionContext setInsertDeletedObjects:](v13, "setInsertDeletedObjects:", 1);
  -[HDDataEntityDeletionContext setRecursiveDeleteAuthorizationBlock:](v13, "setRecursiveDeleteAuthorizationBlock:", *(_QWORD *)(v41 + 64));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = *(id *)(v41 + 48);
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (!v44)
  {
    v27 = 0;
    goto LABEL_35;
  }
  v36 = a3;
  v37 = v5;
  v43 = *(_QWORD *)v51;
  v15 = v41;
LABEL_13:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v51 != v43)
      objc_enumerationMutation(obj);
    v17 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v16);
    v18 = objc_msgSend(v17, "hd_dataEntityClass");
    objc_msgSend(v17, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hd_sampleType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v47 = 0;
    if (!v13)
    {
      v21 = 0;
LABEL_23:
      v27 = v21;
      v21 = v27;
      goto LABEL_24;
    }
    -[HDDataEntityDeletionContext deleteInfoForObjectWithUUID:error:](v13, "deleteInfoForObjectWithUUID:error:", v19, &v47);
    v21 = v47;
    if (!(_BYTE)v48)
      goto LABEL_23;
    if (v39)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (_QWORD)v49);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v6, "containsObject:", v22);

      if (!v23)
        break;
    }
    v40 = v18;
    v24 = *((_QWORD *)&v48 + 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *((_QWORD *)&v49 + 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(v41 + 56);
    v45 = 0;
    LOBYTE(v40) = -[HDDataEntityDeletionContext deleteObjectWithPersistentID:objectUUID:entityClass:objectType:provenanceIdentifier:deletionDate:deletedSampleIntervals:error:](v13, "deleteObjectWithPersistentID:objectUUID:entityClass:objectType:provenanceIdentifier:deletionDate:deletedSampleIntervals:error:", v24, v19, v40, v20, v25, v38, v26, &v45);
    v27 = v45;

    v15 = v41;
    if ((v40 & 1) == 0)
      goto LABEL_24;
LABEL_27:

    if (v44 == ++v16)
    {
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      v44 = v28;
      if (!v28)
      {
        v27 = 0;
        v14 = 1;
        goto LABEL_33;
      }
      goto LABEL_13;
    }
  }
  v46 = 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", &v46, 3, CFSTR("object not found"));
  v27 = v46;
  v15 = v41;
LABEL_24:
  if (!*(_BYTE *)(v15 + 88) && (!v27 || objc_msgSend(v27, "code") == 3))
    goto LABEL_27;

  v14 = 0;
LABEL_33:
  a3 = v36;
  v5 = v37;
LABEL_35:

  -[HDDataEntityDeletionContext finish](v13, "finish");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v41 + 72) + 8) + 24) = -[HDDataEntityDeletionContext deletedObjectCount](v13, "deletedObjectCount") != 0;
  -[HDDataEntityDeletionContext lastInsertedDeletedObjectPersistentID](v13, "lastInsertedDeletedObjectPersistentID");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = *(_QWORD *)(*(_QWORD *)(v41 + 80) + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v29;

  if (v14
    && ((v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v41 + 80) + 8) + 40)) == 0
     || +[HDKeyValueEntity setNumber:forKey:domain:category:profile:error:](HDUnprotectedKeyValueEntity, "setNumber:forKey:domain:category:profile:error:", v32, CFSTR("HDMaxObjectPersistentID"), &stru_1E6D11BB8, 0, *(_QWORD *)(v41 + 40), a3)))
  {
    v33 = 1;
  }
  else
  {
    v34 = v27;
    if (v34)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v34);
      else
        _HKLogDroppedError();
    }

    v33 = 0;
  }

  return v33;
}

uint64_t __134__HDDataEntity_deleteDataObjects_restrictedSourceEntities_failIfNotFound_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _BYTE *v20;
  void *v21;
  uint64_t v22;
  int v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 100, CFSTR("No support for deleting objects with options when database is not available"));
    return 0;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v13 = 0;
    goto LABEL_12;
  }
  v6 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v6;
  objc_opt_self();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v8, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __71__HDDataEntity__sourceBundleIdentifierForSourceEntities_profile_error___block_invoke;
  v29[3] = &unk_1E6CE7950;
  v11 = v7;
  v30 = v11;
  v12 = v9;
  v31 = v12;
  LODWORD(v9) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v10, v3, v29);

  if (!(_DWORD)v9)
    goto LABEL_8;
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", v3, 100, CFSTR("Multiple bundle identifiers (%@) found for source entities (%@)"), v12, v11);
LABEL_8:
    v13 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v12, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  if (!v13)
    return 0;
LABEL_12:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = *(id *)(a1 + 48);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v18);
        if (v13)
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v18), "_setSourceBundleIdentifier:", v13);
        v20 = -[_HDDataDeletionJournalEntry initWithDataObject:restrictSource:]([_HDDataDeletionJournalEntry alloc], v19, v13 != 0);
        objc_msgSend(*(id *)(a1 + 40), "database");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v3;
        v23 = objc_msgSend(v21, "addJournalEntry:error:", v20, v3);

        if (!v23)
        {
          v4 = 0;
          goto LABEL_24;
        }
        ++v18;
        v3 = v22;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
      if (v16)
        continue;
      break;
    }
  }
  v4 = 1;
LABEL_24:

  return v4;
}

+ (id)dataEntityForObject:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__73;
    v24 = __Block_byref_object_dispose__73;
    v25 = 0;
    objc_msgSend(v9, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__HDDataEntity_dataEntityForObject_profile_error___block_invoke;
    v16[3] = &unk_1E6CEC940;
    v18 = &v20;
    v19 = a1;
    v17 = v8;
    v12 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v11, a5, v16);

    if (v12)
      v13 = (void *)v21[5];
    else
      v13 = 0;
    v14 = v13;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __50__HDDataEntity_dataEntityForObject_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 48), "dataEntityForObject:transaction:error:", *(_QWORD *)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

+ (id)dataEntityForObject:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__73;
  v23 = __Block_byref_object_dispose__73;
  v24 = 0;
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__HDDataEntity_dataEntityForObject_transaction_error___block_invoke_2;
  v17[3] = &unk_1E6CE9508;
  v12 = v8;
  v18 = v12;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __54__HDDataEntity_dataEntityForObject_transaction_error___block_invoke_3;
  v16[3] = &unk_1E6CE7D28;
  v16[4] = &v19;
  v16[5] = a1;
  if (objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", dataEntityForObject_transaction_error__lookupKey, a5, &__block_literal_global_80, v17, v16))v13 = (void *)v20[5];
  else
    v13 = 0;
  v14 = v13;

  _Block_object_dispose(&v19, 8);
  return v14;
}

const __CFString *__54__HDDataEntity_dataEntityForObject_transaction_error___block_invoke()
{
  return CFSTR("SELECT data_id FROM objects WHERE uuid = ? AND type = ?;");
}

uint64_t __54__HDDataEntity_dataEntityForObject_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_int64(a2, 2, 1);
}

uint64_t __54__HDDataEntity_dataEntityForObject_transaction_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithPersistentID:", HDSQLiteColumnAsInt64());
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 0;
}

+ (id)sourceIDsForObjectsOfType:(int64_t)a3 profile:(id)a4 predicate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a4;
  v11 = a5;
  if (objc_msgSend(a1, "requiresSampleTypePredicate"))
  {
    v12 = (void *)MEMORY[0x1E0D29840];
    HDDataEntityPredicateForType(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "compoundPredicateWithPredicate:otherPredicate:", v11, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v14;
  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__73;
  v29 = __Block_byref_object_dispose__73;
  v30 = 0;
  objc_msgSend(v10, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__HDDataEntity_sourceIDsForObjectsOfType_profile_predicate_error___block_invoke;
  v21[3] = &unk_1E6CEC940;
  v23 = &v25;
  v24 = a1;
  v16 = v11;
  v22 = v16;
  v17 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v15, a6, v21);

  if (v17)
    v18 = (void *)v26[5];
  else
    v18 = 0;
  v19 = v18;

  _Block_object_dispose(&v25, 8);
  return v19;
}

uint64_t __66__HDDataEntity_sourceIDsForObjectsOfType_profile_predicate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "distinctProperty:predicate:database:error:", CFSTR("data_provenances.source_id"), *(_QWORD *)(a1 + 32), v5, a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return 1;
}

+ (id)sourceIDForObjectID:(id)a3 type:(int64_t)a4 profile:(id)a5 errorOut:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;

  v10 = a3;
  v11 = (void *)MEMORY[0x1E0D29838];
  v12 = a5;
  objc_msgSend(v11, "predicateWithProperty:equalToValue:", CFSTR("data_id"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(a1, "sourceIDsForObjectsOfType:profile:predicate:error:", a4, v12, v13, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v18;
  objc_msgSend(v14, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    if (v15)
    {
      v15 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Could not find expected sourceID for object with ID %@"), v10);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_9;
    }
    if (a6)
      *a6 = objc_retainAutorelease(v15);
    else
      _HKLogDroppedError();

  }
LABEL_9:

  return v16;
}

+ (id)predicateForObjectsFromLocalSourceWithBundleIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  v7 = a3;
  objc_msgSend(a4, "sourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v8, "localSourceForBundleIdentifier:error:", v7, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;

  if (!v9)
  {
    if (v10)
    {
      if (a5)
      {
        v11 = 0;
        *a5 = objc_retainAutorelease(v10);
        goto LABEL_9;
      }
      _HKLogDroppedError();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 100, CFSTR("No source found with bundle identifier \"%@\"), v7);
    }
    v11 = 0;
    goto LABEL_9;
  }
  HDDataEntityPredicateForSourceEntity(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v11;
}

+ (id)objectWithUUID:(id)a3 encodingOptions:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a5;
  v10 = a4;
  HDDataEntityPredicateForDataUUID();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity _objectWithPredicate:encodingOptions:profile:error:]((uint64_t)a1, v11, v10, v9, (uint64_t)a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_objectWithPredicate:(void *)a3 encodingOptions:(void *)a4 profile:(uint64_t)a5 error:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__73;
  v19 = __Block_byref_object_dispose__73;
  v20 = 0;
  objc_msgSend((id)objc_opt_self(), "entityEnumeratorWithProfile:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v8);
  objc_msgSend(v11, "addEncodingOptionsFromDictionary:", v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__HDDataEntity__objectWithPredicate_encodingOptions_profile_error___block_invoke;
  v14[3] = &unk_1E6CE7EA0;
  v14[4] = &v15;
  objc_msgSend(v11, "enumerateWithError:handler:", a5, v14);
  v12 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v12;
}

+ (id)objectWithID:(id)a3 encodingOptions:(id)a4 profile:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = (void *)MEMORY[0x1E0D29838];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "predicateWithProperty:value:comparisonType:", CFSTR("data_id"), a3, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity _objectWithPredicate:encodingOptions:profile:error:]((uint64_t)a1, v13, v12, v11, (uint64_t)a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __67__HDDataEntity__objectWithPredicate_encodingOptions_profile_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncEntityClass:(Class)a4 predicate:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 profile:(id)a7 messageHandler:(id)a8 error:(id *)a9
{
  int64_t end;
  int64_t start;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  Class v30;
  id v31;
  int64_t v32;
  int64_t v33;

  end = a6.end;
  start = a6.start;
  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v17, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __117__HDDataEntity_generateSyncObjectsForSession_syncEntityClass_predicate_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v25[3] = &unk_1E6CF5558;
  v26 = v17;
  v27 = v15;
  v30 = a4;
  v31 = a1;
  v28 = v18;
  v29 = v16;
  v32 = start;
  v33 = end;
  v20 = v16;
  v21 = v18;
  v22 = v15;
  v23 = v17;
  LOBYTE(a1) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v19, a9, v25);

  return (char)a1;
}

uint64_t __117__HDDataEntity_generateSyncObjectsForSession_syncEntityClass_predicate_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  HDDataProvenanceCache *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _HDDataEntitySyncMessageBuilder *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _HDDataEntitySyncMessageBuilder *v16;
  uint64_t v17;
  _QWORD v20[4];
  _HDDataEntitySyncMessageBuilder *v21;
  uint64_t v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = -[HDDataProvenanceCache initWithProfile:transaction:purpose:]([HDDataProvenanceCache alloc], "initWithProfile:transaction:purpose:", *(_QWORD *)(a1 + 32), v4, 0);
  v6 = objc_msgSend(*(id *)(a1 + 40), "maxEncodedBytesPerChangeSetForSyncEntityClass:", *(_QWORD *)(a1 + 64));
  v7 = objc_msgSend(*(id *)(a1 + 40), "maxEncodedBytesPerCodableChangeForSyncEntityClass:", *(_QWORD *)(a1 + 64));
  v8 = 0;
  if (objc_msgSend(*(id *)(a1 + 40), "shouldOverrideCycleTrackingSymptomsForBackwardsCompatibilty"))
  {
    v23 = CFSTR("OverrideMCCategorySampleValue");
    v24[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(*(id *)(a1 + 64), "syncVersionRangeForSession:", *(_QWORD *)(a1 + 40));
  else
    v9 = 0;
  v10 = -[_HDDataEntitySyncMessageBuilder initWithProfile:transaction:entityClass:version:provenanceCache:encodingOptions:messageHandler:bytesPerChangeSet:bytesPerChange:]([_HDDataEntitySyncMessageBuilder alloc], "initWithProfile:transaction:entityClass:version:provenanceCache:encodingOptions:messageHandler:bytesPerChangeSet:bytesPerChange:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 72), v9, v5, v8, *(_QWORD *)(a1 + 48), v6, v7);
  v22 = -1;
  v11 = *(void **)(a1 + 72);
  -[_HDDataEntitySyncMessageBuilder orderedProperties](v10, "orderedProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __117__HDDataEntity_generateSyncObjectsForSession_syncEntityClass_predicate_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v20[3] = &unk_1E6CF5530;
  v16 = v10;
  v21 = v16;
  v17 = objc_msgSend(v11, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v12, v13, v14, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), 0, &v22, v15, a3, v20);

  if ((_DWORD)v17 && v22 != -1)
    v17 = -[_HDDataEntitySyncMessageBuilder finishAndFlushWithError:](v16, "finishAndFlushWithError:", a3);

  return v17;
}

uint64_t __117__HDDataEntity_generateSyncObjectsForSession_syncEntityClass_predicate_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = *(void **)(a1 + 32);
  v17 = 0;
  v13 = objc_msgSend(v12, "addEntity:row:anchor:error:", v11, a4, a5, &v17);
  v14 = v17;
  if (v13 == 2)
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v11;
      v20 = 2114;
      v21 = v14;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "Failed to include entity %{public}@ when constructing messages for sync: %{public}@.", buf, 0x16u);
    }
  }
  else if (v13 == 1)
  {
    *a7 = 1;
  }

  return 1;
}

void __39__HDDataEntity_joinClausesForProperty___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29870], "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v4, objc_opt_class(), 0, CFSTR("provenance"), *MEMORY[0x1E0D29618]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = v0;

  objc_msgSend(MEMORY[0x1E0D29870], "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v4, objc_opt_class(), 0, CFSTR("data_id"), CFSTR("object_id"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED5522C8;
  qword_1ED5522C8 = v2;

}

+ (id)propertyForSyncIdentity
{
  return CFSTR("data_provenances.sync_identity");
}

+ (id)databaseTable
{
  return CFSTR("objects");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_38;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("provenance");
  +[HDHealthEntity defaultForeignKey](HDDataProvenanceEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultForeignKey
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D29858]), "initWithEntityClass:property:deletionAction:", a1, CFSTR("data_id"), 2);
}

+ (id)indices
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "disambiguatedSQLForProperty:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ = %ld"), v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0D29860]);
  v6 = objc_opt_class();
  v11 = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithEntity:name:columns:unique:predicateString:", v6, CFSTR("deleted"), v7, 0, v4);
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (Class)_deletedEntityClass
{
  NSRequestConcreteImplementation();
  return 0;
}

+ (Class)_entityClassForDeletion
{
  NSRequestConcreteImplementation();
  return 0;
}

+ (BOOL)requiresSampleTypePredicate
{
  return 0;
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "ascending");
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB56C8]))
  {
    v7 = (void *)MEMORY[0x1E0D29888];
    v8 = objc_opt_class();
    v9 = CFSTR("data_id");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB71D8]))
    {
      v13.receiver = a1;
      v13.super_class = (Class)&OBJC_METACLASS___HDDataEntity;
      objc_msgSendSuper2(&v13, sel_orderingTermForSortDescriptor_, v4);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v7 = (void *)MEMORY[0x1E0D29888];
    v8 = objc_opt_class();
    v9 = CFSTR("creation_date");
  }
  objc_msgSend(v7, "orderingTermWithProperty:entityClass:ascending:", v9, v8, v6);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v11 = (void *)v10;

  return v11;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

uint64_t __70__HDDataEntity__insertBaseDataObject_withProvenance_inDatabase_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 32), "entityType"));
  objc_msgSend(*(id *)(a1 + 32), "_creationTimestamp");
  return sqlite3_bind_double(a2, 4, v5);
}

+ (BOOL)_removeObjectWithPersistentID:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  char v11;

  v8 = a4;
  v9 = (void *)objc_msgSend(a1, "superclass");
  if (objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class())
    && !objc_msgSend(v9, "_removeObjectWithPersistentID:database:error:", a3, v8, a5))
  {
    v11 = 0;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistentID:", a3);
    v11 = objc_msgSend(v10, "deleteFromDatabase:error:", v8, a5);

  }
  return v11;
}

+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (int64_t)compareForReplacmentWithObject:(id)a3 existingObject:(id)a4
{
  return 0;
}

+ (int64_t)preferredEntityType
{
  return 0;
}

+ (BOOL)isConcreteEntity
{
  return 0;
}

+ (id)objectInsertionFilterForProfile:(id)a3
{
  return &__block_literal_global_357;
}

uint64_t __48__HDDataEntity_objectInsertionFilterForProfile___block_invoke()
{
  return 1;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDDataEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[_HDDataEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDDataEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (BOOL)acceptsObject:(id)a3
{
  return 1;
}

+ (id)deleteStatementsForRelatedEntitiesWithTransaction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HDMetadataValueEntity deleteStatementForObjectMetadataWithTransaction:](HDMetadataValueEntity, "deleteStatementForObjectMetadataWithTransaction:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  +[HDAssociationEntity deleteStatementForChildIDsWithTransaction:](HDAssociationEntity, "deleteStatementForChildIDsWithTransaction:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)enumerateAssociatedObjectsForIdentifier:(int64_t)a3 inDatabase:(id)a4 error:(id *)a5 associatedObjectHandler:(id)a6
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return 0;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (id)columnNamesForTimeOffset
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() != a1)
    return 0;
  v3[0] = CFSTR("creation_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)attachmentObjectIdentifierForSampleWithUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(a3, "UUIDString");
}

+ (id)hk_timeZoneEncodingOptions
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("IncludeAutomaticTimeZone");
  v4[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
