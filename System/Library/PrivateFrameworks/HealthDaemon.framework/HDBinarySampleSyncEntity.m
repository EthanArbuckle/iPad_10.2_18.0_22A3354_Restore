@implementation HDBinarySampleSyncEntity

+ (int)nanoSyncObjectType
{
  return 22;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  if (a3 >= 6)
    return 3;
  else
    return 0;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 26);
}

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "sample");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataType");
  v7 = _HKValidDataTypeCode();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB6AD8], "createWithCodable:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v5, "sample");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = a1;
      v15 = 2048;
      v16 = objc_msgSend(v11, "dataType");
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignorning unknown data type code %lld", (uint8_t *)&v13, 0x16u);

    }
    v8 = 0;
  }

  return v8;
}

+ (BOOL)_insertObjectsFromCodableObjectCollection:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  char v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  BOOL v46;
  NSObject *v47;
  void *v48;
  id v49;
  id *v51;
  BOOL v52;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  id obj;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  uint64_t v67;
  _BYTE v68[128];
  void *v69;
  uint8_t buf[4];
  id v71;
  __int16 v72;
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend((id)objc_msgSend(a1, "healthEntityClass"), "codableObjectsFromObjectCollection:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  v58 = v10;
  +[HDDataSyncUtilities provenanceFromCollection:syncStore:profile:error:](HDDataSyncUtilities, "provenanceFromCollection:syncStore:profile:error:", v10, v11, v12, &v66);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v66;
  v15 = v14 == 0;
  if (v14)
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = v13;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    if (v16)
    {
      v17 = v16;
      v51 = a6;
      v52 = v14 == 0;
      v53 = v13;
      v18 = *(_QWORD *)v63;
      v55 = v12;
      v56 = v11;
      v54 = *(_QWORD *)v63;
LABEL_4:
      v19 = 0;
      v57 = v17;
      while (1)
      {
        if (*(_QWORD *)v63 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v19);
        objc_msgSend(v20, "sample", v51);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "dataType");

        if (v22 != 144)
          break;
        v61 = 0;
        v23 = +[HDECGSampleEntity _insertECGWithCodableBinarySample:syncStore:profile:provenance:error:](HDECGSampleEntity, "_insertECGWithCodableBinarySample:syncStore:profile:provenance:error:", v20, v11, v12, v14, &v61);
        v24 = v61;
        v25 = v24;
        if (!v23)
        {
          if (objc_msgSend(v24, "hk_isHealthKitErrorWithCode:", 123))
          {
            v49 = v25;
            v48 = v49;
            v13 = v53;
            v15 = v52;
            if (v49)
            {
              if (v51)
                *v51 = objc_retainAutorelease(v49);
              else
                _HKLogDroppedError();
            }

            goto LABEL_40;
          }
          _HKInitializeLogging();
          v26 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v71 = v11;
            v72 = 2114;
            v73 = v25;
            _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "failed to insert ECG sample from binary sample synced from store %{public}@: %{public}@", buf, 0x16u);
          }
LABEL_25:
          objc_msgSend(v12, "daemon");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "autoBugCaptureReporter");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "reportApplyDataFailure:duringSyncFromStore:error:", objc_opt_class(), v11, v60);

        }
LABEL_26:

        if (v17 == ++v19)
        {
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
          v46 = 1;
          if (v17)
            goto LABEL_4;
          goto LABEL_34;
        }
      }
      v27 = v20;
      v28 = v12;
      v29 = v14;
      v30 = v14;
      v31 = v58;
      v32 = (void *)objc_opt_self();
      v33 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      v35 = v34;
      objc_msgSend(v32, "_objectWithCodable:collection:", v27, v31);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v36, "_validateWithConfiguration:", v33, v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          _HKInitializeLogging();
          v38 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v71 = v27;
            v72 = 2114;
            v73 = v37;
            _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "Codable object %@ failed validation: %{public}@", buf, 0x16u);
          }
        }
        objc_msgSend(v28, "dataManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v36;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 0;
        v41 = objc_msgSend(v39, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:updateSourceOrder:resolveAssociations:error:", v40, v30, 1, 0, 0, &v67, 2.22507386e-308);

        v25 = 0;
        v12 = v55;
        v11 = v56;
        v14 = v29;
        v18 = v54;
        v17 = v57;
        if ((v41 & 1) != 0)
          goto LABEL_26;
      }
      else
      {
        _HKInitializeLogging();
        v42 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v71 = v27;
          _os_log_error_impl(&dword_1B7802000, v42, OS_LOG_TYPE_ERROR, "failed to create client object with codable %@", buf, 0xCu);
        }

        v12 = v55;
        v11 = v56;
        v14 = v29;
        v18 = v54;
        v17 = v57;
      }
      if ((objc_msgSend(0, "hk_isHealthKitErrorWithCode:", 123) & 1) != 0)
      {
        v46 = 0;
LABEL_34:
        v13 = v53;
        goto LABEL_41;
      }
      _HKInitializeLogging();
      v43 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v71 = v11;
        v72 = 2114;
        v73 = v60;
        _os_log_error_impl(&dword_1B7802000, v43, OS_LOG_TYPE_ERROR, "failed to insert objects synced from store %{public}@: %{public}@", buf, 0x16u);
      }
      v25 = 0;
      goto LABEL_25;
    }
    v46 = 1;
  }
  else
  {
    _HKInitializeLogging();
    v47 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v71 = v11;
      v72 = 2114;
      v73 = v60;
      _os_log_impl(&dword_1B7802000, v47, OS_LOG_TYPE_DEFAULT, "Failed to create provenance for codable object collection from store %{public}@: %{public}@", buf, 0x16u);
    }
    objc_msgSend(v12, "daemon");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "autoBugCaptureReporter");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "reportApplyDataFailure:duringSyncFromStore:error:", objc_opt_class(), v11, v60);
LABEL_40:

    v46 = v15;
  }
LABEL_41:

  return v46;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(a4, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsSampleExpiration");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "_allBinarySampleTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v10, v5, *MEMORY[0x1E0CB6120]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
