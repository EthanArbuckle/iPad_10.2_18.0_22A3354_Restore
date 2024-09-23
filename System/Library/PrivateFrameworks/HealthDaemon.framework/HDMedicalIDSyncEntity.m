@implementation HDMedicalIDSyncEntity

+ (BOOL)touchSyncAnchorIfNecessaryWithProfile:(id)a3 error:(id *)a4
{
  return +[HDMedicalIDSyncEntity _touchSyncAnchorWithProfile:shouldIncrement:error:]((uint64_t)a1, a3, 0, a4);
}

+ (BOOL)_touchSyncAnchorWithProfile:(int)a3 shouldIncrement:(_QWORD *)a4 error:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v15;

  v6 = a2;
  v7 = objc_opt_self();
  v15 = 0;
  v8 = +[HDMedicalIDSyncEntity _getCurrentSyncAnchorWithProfile:error:](v7, v6, (uint64_t)&v15);
  v9 = v15;
  if (v9)
  {
    if (a4)
    {
      v10 = 0;
      *a4 = objc_retainAutorelease(v9);
    }
    else
    {
      _HKLogDroppedError();
      v10 = 0;
    }
  }
  else
  {
    if (v8 == -1)
    {
      v11 = 1;
    }
    else
    {
      if (!a3)
      {
        v10 = 1;
        goto LABEL_11;
      }
      v11 = v8 + 1;
    }
    v12 = v6;
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[HDKeyValueEntity setNumber:forKey:domain:category:profile:error:](HDUnprotectedKeyValueEntity, "setNumber:forKey:domain:category:profile:error:", v13, CFSTR("CurrentRevisionAnchor"), CFSTR("MedicalIDDomain"), 0, v12, a4);

  }
LABEL_11:

  return v10;
}

+ (BOOL)incrementSyncAnchorWithProfile:(id)a3 error:(id *)a4
{
  return +[HDMedicalIDSyncEntity _touchSyncAnchorWithProfile:shouldIncrement:error:]((uint64_t)a1, a3, 1, a4);
}

+ (uint64_t)_getCurrentSyncAnchorWithProfile:(uint64_t)a3 error:
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a2;
  objc_opt_self();
  +[HDKeyValueEntity numberForKey:domain:category:profile:entity:error:](HDUnprotectedKeyValueEntity, "numberForKey:domain:category:profile:entity:error:", CFSTR("CurrentRevisionAnchor"), CFSTR("MedicalIDDomain"), 0, v4, 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "longLongValue");
  else
    v6 = -1;

  return v6;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 15);
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  id v39;
  int64_t v40;
  void *v41;
  id start;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  end = a4.end;
  start = (id)a4.start;
  v54 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "medicalIDDataManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v15, "fetchMedicalIDWithError:", &v45);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v45;
  v18 = v17;
  if (v16 || !v17)
  {
    v41 = v14;
    v20 = +[HDMedicalIDSyncEntity _getCurrentSyncAnchorWithProfile:error:]((uint64_t)a1, v13, (uint64_t)a7);
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x1E0CB5300];
    v40 = end;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      HDSyncAnchorRangeDescription((uint64_t)start, end);
      v23 = v12;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v47 = a1;
      v48 = 2112;
      v49 = v16;
      v50 = 2114;
      v51 = v24;
      v52 = 2048;
      v53 = v20;
      _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Generate sync objects for MedicalID %@ with syncAnchorRange %{public}@ and newSyncAnchor %lld", buf, 0x2Au);

      v12 = v23;
    }
    if (v16)
    {
      v44 = 0;
      objc_msgSend(a1, "getSyncProvencanceOfMedicalIDForProfile:error:", v13, &v44);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v44;
      v36 = v25;
      if (v25)
      {
        v26 = objc_msgSend(v25, "longLongValue", v25);
      }
      else
      {
        _HKInitializeLogging();
        v27 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v47 = v39;
          _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "Error reading syncProvenance, even though medical ID exists on disk %{public}@", buf, 0xCu);
        }
        v26 = 0;
      }
      v38 = v12;
      objc_msgSend(v12, "excludedSyncStores", v36);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hk_map:", &__block_literal_global_128);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 == -1)
      {
        v19 = 0;
      }
      else
      {
        v19 = 1;
        if (v20 > (uint64_t)start && v20 <= v40)
        {
          v30 = v26;
          v31 = v29;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v31;
          LOBYTE(v31) = objc_msgSend(v31, "containsObject:", v32);

          if ((v31 & 1) != 0)
          {
            v19 = 1;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_codableFromMedicalID:", v16);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              objc_msgSend(v33, "addObject:", v34);
              v19 = objc_msgSend(v41, "sendCodableChange:resultAnchor:sequence:done:error:", v33, v20, 0, 1, a7);
            }
            else
            {
              v19 = 0;
            }

          }
          v29 = v43;
        }
      }

      v12 = v38;
    }
    else
    {
      v19 = 1;
    }
    v14 = v41;
  }
  else if (a7)
  {
    v19 = 0;
    *a7 = objc_retainAutorelease(v17);
  }
  else
  {
    _HKLogDroppedError();
    v19 = 0;
  }

  return v19;
}

uint64_t __100__HDMedicalIDSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "syncProvenance"));
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;

  v10 = a3;
  v11 = a5;
  objc_msgSend(a1, "getSyncProvencanceOfMedicalIDForProfile:error:", v11, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = objc_msgSend(v12, "longLongValue");
  else
    v14 = 0;
  objc_msgSend(v10, "excludedSyncStores");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hk_map:", &__block_literal_global_192_2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "containsObject:", v17);

  if ((v18 & 1) == 0)
  {
    v19 = +[HDMedicalIDSyncEntity _getCurrentSyncAnchorWithProfile:error:]((uint64_t)a1, v11, (uint64_t)a6);
    if (v19 > a4 && v19 != -1)
      a4 = v19;
  }

  return a4;
}

uint64_t __81__HDMedicalIDSyncEntity_nextSyncAnchorWithSession_startSyncAnchor_profile_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "syncProvenance"));
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableMedicalIDData *v4;

  v3 = a3;
  v4 = -[HDCodableMedicalIDData initWithData:]([HDCodableMedicalIDData alloc], "initWithData:", v3);

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  int64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "lastObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(a1, "_medicalIDFromCodable:", v14);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        objc_msgSend(v13, "medicalIDDataManager");
        v27 = a7;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "syncProvenance"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v20 = objc_msgSend(v18, "updateMedicalIDWithSyncedData:provenance:error:", v17, v19, &v28);
        v21 = v28;

        a7 = v27;
        v22 = 0;
        if ((v20 & 1) != 0)
          goto LABEL_15;
        goto LABEL_8;
      }

    }
  }
  v21 = 0;
LABEL_8:
  objc_msgSend(v12, "profile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = +[HDMedicalIDSyncEntity _getCurrentSyncAnchorWithProfile:error:]((uint64_t)a1, v23, 0);

  _HKInitializeLogging();
  v25 = *MEMORY[0x1E0CB5300];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543874;
    v30 = a1;
    v31 = 2048;
    v32 = v24;
    v33 = 2114;
    v34 = v21;
    _os_log_fault_impl(&dword_1B7802000, v25, OS_LOG_TYPE_FAULT, "%{public}@ Failed to save MedicalID with ignorable failure, SyncAnchor: %lld, Error: %{public}@, ", buf, 0x20u);
  }
  v21 = v21;
  if (v21)
  {
    if (a7)
      *a7 = objc_retainAutorelease(v21);
    else
      _HKLogDroppedError();
  }

  v22 = 1;
LABEL_15:

  return v22;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "syncStoreType");
  return (v3 < 6) & (0x22u >> v3);
}

+ (id)_codableFromMedicalID:(id)a3
{
  void *v3;
  id v4;
  HDCodableMedicalIDData *v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    v5 = objc_alloc_init(HDCodableMedicalIDData);
    -[HDCodableMedicalIDData setMedicalIDBytes:](v5, "setMedicalIDBytes:", v3);
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Failed to encode codable medical ID: %{public}@", buf, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

+ (id)_medicalIDFromCodable:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "medicalIDBytes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Failed to decode codable medical ID: %{public}@", buf, 0xCu);
    }
  }

  return v4;
}

+ (id)getSyncProvencanceOfMedicalIDForProfile:(id)a3 error:(id *)a4
{
  return +[HDKeyValueEntity numberForKey:domain:category:profile:entity:error:](HDUnprotectedKeyValueEntity, "numberForKey:domain:category:profile:entity:error:", CFSTR("CurrentMedicalIDSyncProvenance"), CFSTR("MedicalIDDomain"), 0, a3, 0, a4);
}

+ (BOOL)setSyncProvenance:(id)a3 profile:(id)a4 error:(id *)a5
{
  return +[HDKeyValueEntity setNumber:forKey:domain:category:profile:error:](HDUnprotectedKeyValueEntity, "setNumber:forKey:domain:category:profile:error:", a3, CFSTR("CurrentMedicalIDSyncProvenance"), CFSTR("MedicalIDDomain"), 0, a4, a5);
}

@end
