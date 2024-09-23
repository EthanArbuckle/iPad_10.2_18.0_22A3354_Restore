@implementation _HDDataEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("uuid");
  v7[1] = CFSTR("provenance");
  v7[2] = CFSTR("creation_date");
  v7[3] = CFSTR("external_sync_ids.object_code");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_includeAutomaticTimeZones)
  {
    objc_msgSend(v3, "arrayByAddingObject:", CFSTR("data_provenances.tz_name"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (id)_copyBaseMetadataForRow:(uint64_t)a1
{
  void *v1;
  id v2;

  if (!a1 || !*(_BYTE *)(a1 + 96))
    return 0;
  HDSQLiteColumnWithNameAsString();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, *MEMORY[0x1E0CB7250]);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)finish
{
  objc_super v3;

  -[HDSQLiteStatement finish](self->_metadataValueStatement, "finish");
  v3.receiver = self;
  v3.super_class = (Class)_HDDataEntityEncoder;
  -[HDEntityEncoder finish](&v3, sel_finish);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_metadataKeyFilter, 0);
  objc_storeStrong((id *)&self->_dataProvenanceCache, 0);
  objc_storeStrong((id *)&self->_metadataValueStatement, 0);
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HDCodableHealthObject *v12;
  void *v13;
  void *v14;

  -[HDEntityEncoder profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_HDDataEntityEncoder _copyBaseMetadataForRow:]((uint64_t)self);
  objc_msgSend(v9, "metadataForObjectID:baseMetadata:keyFilter:statement:error:", a3, v10, self->_metadataKeyFilter, self->_metadataValueStatement, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc_init(HDCodableHealthObject);
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableHealthObject setCreationDate:](v12, "setCreationDate:");
    HDSQLiteColumnWithNameAsData();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableHealthObject setUuid:](v12, "setUuid:", v13);

    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
      -[HDCodableHealthObject setExternalSyncObjectCode:](v12, "setExternalSyncObjectCode:", HDSQLiteColumnWithNameAsInt64());
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "hk_codableMetadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableHealthObject setMetadataDictionary:](v12, "setMetadataDictionary:", v14);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (_HDDataEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8
{
  id v14;
  id v15;
  id v16;
  _HDDataEntityEncoder *v17;
  uint64_t v18;
  HDMetadataValueStatement *metadataValueStatement;
  HDDataProvenanceCache *v20;
  HDDataProvenanceCache *dataProvenanceCache;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id metadataKeyFilter;
  objc_super v28;

  v14 = a4;
  v15 = a5;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)_HDDataEntityEncoder;
  v17 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:](&v28, sel_initWithHealthEntityClass_profile_transaction_purpose_encodingOptions_authorizationFilter_, a3, v14, v15, a6, v16, a8);
  if (v17)
  {
    +[HDMetadataValueStatement metadataValueStatementWithTransaction:](HDMetadataValueStatement, "metadataValueStatementWithTransaction:", v15);
    v18 = objc_claimAutoreleasedReturnValue();
    metadataValueStatement = v17->_metadataValueStatement;
    v17->_metadataValueStatement = (HDMetadataValueStatement *)v18;

    v20 = -[HDDataProvenanceCache initWithProfile:transaction:purpose:]([HDDataProvenanceCache alloc], "initWithProfile:transaction:purpose:", v14, v15, a6);
    dataProvenanceCache = v17->_dataProvenanceCache;
    v17->_dataProvenanceCache = v20;

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("IncludeAutomaticTimeZone"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_includeAutomaticTimeZones = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("IncludeContributorInformation"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_includeContributorInformation = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ExcludePrivateMetadata"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLValue");

    if (v25)
    {
      metadataKeyFilter = v17->_metadataKeyFilter;
      v17->_metadataKeyFilter = &__block_literal_global_534;

    }
  }

  return v17;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v9;
  id v10;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6950]), "_init");
  if (-[_HDDataEntityEncoder applyPropertiesToObject:persistentID:row:error:](self, "applyPropertiesToObject:persistentID:row:error:", v9, a3, a4, a5))
  {
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HDDataProvenanceCache *dataProvenanceCache;
  uint64_t v15;
  id v16;
  id v17;
  HDDataProvenanceCache *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id *v22;
  void *v23;
  NSObject *v24;
  id v25;
  BOOL v26;
  HDDataProvenanceCache *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  id metadataKeyFilter;
  HDMetadataValueStatement *metadataValueStatement;
  void *v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v41;
  id *v42;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataEntity.m"), 1597, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[object isKindOfClass:[HKObject class]]"));

  }
  HDSQLiteColumnWithNameAsDouble();
  objc_msgSend(v9, "_setCreationTimestamp:");
  HDSQLiteColumnWithNameAsUUID();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setUUID:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnWithNameAsInt64());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDataProvenanceCache provenanceWithID:](self->_dataProvenanceCache, "provenanceWithID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDEntityEncoder profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  dataProvenanceCache = self->_dataProvenanceCache;
  v49 = 0;
  -[HDDataProvenanceCache sourceRevisionForProvenanceID:dataProvenance:profile:error:](dataProvenanceCache, "sourceRevisionForProvenanceID:dataProvenance:profile:error:", v11, v12, v13, &v49);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v49;
  v44 = (void *)v15;
  v45 = v12;
  if (v15)
  {
    v42 = a6;
    objc_msgSend(v9, "_setSourceRevision:", v15);
    objc_msgSend(v12, "deviceID");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = self->_dataProvenanceCache;
      v48 = v16;
      -[HDDataProvenanceCache deviceForPersistentID:profile:error:](v18, "deviceForPersistentID:profile:error:", v17, v13, &v48);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v48;

      if (!v19 && v20)
      {
        _HKInitializeLogging();
        v21 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v51 = v20;
          _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "Expected device not found. %{public}@", buf, 0xCu);
        }
        v22 = v42;
        if (v42)
        {
          v23 = v20;
LABEL_26:
          v20 = objc_retainAutorelease(v23);
          v26 = 0;
          *v22 = v20;
          goto LABEL_47;
        }
        _HKLogDroppedError();
LABEL_42:
        v26 = 0;
        goto LABEL_47;
      }
      objc_msgSend(v9, "_setDevice:", v19);

      v12 = v45;
    }
    else
    {
      v20 = v16;
    }
    if (self->_includeContributorInformation)
    {
      v27 = self->_dataProvenanceCache;
      objc_msgSend(v12, "contributorReference");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v20;
      -[HDDataProvenanceCache contributorForReference:profile:error:](v27, "contributorForReference:profile:error:", v28, v13, &v47);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v47;

      if (!v29 && v30)
      {
        _HKInitializeLogging();
        v31 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v51 = v30;
          _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "Expected contributor not found. %{public}@", buf, 0xCu);
        }
        v22 = v42;
        if (!v42)
        {
          _HKLogDroppedError();
          v26 = 0;
          v20 = v30;
          goto LABEL_47;
        }
        v23 = v30;
        goto LABEL_26;
      }
      if (v29)
        objc_msgSend(v9, "_setContributor:", v29);

    }
    else
    {
      v30 = v20;
    }
    objc_msgSend(v13, "metadataManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[_HDDataEntityEncoder _copyBaseMetadataForRow:]((uint64_t)self);
    metadataKeyFilter = self->_metadataKeyFilter;
    metadataValueStatement = self->_metadataValueStatement;
    v46 = v30;
    objc_msgSend(v32, "metadataForObjectID:baseMetadata:keyFilter:statement:error:", a4, v33, metadataKeyFilter, metadataValueStatement, &v46);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v46;

    v26 = v36 != 0;
    if (v36)
    {
      if (objc_msgSend(v36, "count"))
        objc_msgSend(v9, "_setMetadata:", v36);
    }
    else
    {
      _HKInitializeLogging();
      v37 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v51 = v20;
        _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "Error retrieving metadata: %{public}@", buf, 0xCu);
      }
      v38 = v20;
      v39 = v38;
      if (v38)
      {
        if (v42)
          *v42 = objc_retainAutorelease(v38);
        else
          _HKLogDroppedError();
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v24 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v51 = v16;
      _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "sourceRevision not found. %{public}@", buf, 0xCu);
    }
    v25 = v16;
    v17 = v25;
    if (!v25)
    {
      v20 = 0;
      goto LABEL_42;
    }
    if (a6)
    {
      v17 = objc_retainAutorelease(v25);
      v26 = 0;
      *a6 = v17;
    }
    else
    {
      _HKLogDroppedError();
      v26 = 0;
    }
    v20 = v17;
  }
LABEL_47:

  return v26;
}

@end
