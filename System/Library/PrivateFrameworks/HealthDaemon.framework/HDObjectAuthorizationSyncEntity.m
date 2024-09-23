@implementation HDObjectAuthorizationSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 23);
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end;
  int64_t start;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  char v23;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  int64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[8];

  end = a4.end;
  start = a4.start;
  v39[6] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = CFSTR("object");
  v39[1] = CFSTR("source");
  v39[2] = CFSTR("status");
  v39[3] = CFSTR("session");
  v39[4] = CFSTR("sync_identity");
  v39[5] = CFSTR("modification_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = -1;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __110__HDObjectAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v26[3] = &unk_1E6D001A8;
  v17 = v15;
  v27 = v17;
  v18 = v11;
  v33 = start;
  v34 = end;
  v28 = v18;
  v32 = &v35;
  v19 = v16;
  v29 = v19;
  v20 = v14;
  v30 = v20;
  v21 = v12;
  v31 = v21;
  if (+[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDObjectAuthorizationEntity, "performReadTransactionWithHealthDatabase:error:block:", v19, a7, v26))
  {
    objc_msgSend(v20, "allValues");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v13, "sendCodableChange:resultAnchor:sequence:done:error:", v22, v36[3], 0, 1, a7);

  }
  else
  {
    v23 = 0;
  }

  _Block_object_dispose(&v35, 8);
  return v23;
}

BOOL __110__HDObjectAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _BOOL8 v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __110__HDObjectAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v15[3] = &unk_1E6CED2F8;
  v9 = *(_QWORD *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 64);
  v18 = v5;
  v11 = *(_QWORD *)(a1 + 80);
  v10 = *(_QWORD *)(a1 + 88);
  v12 = v5;
  v13 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDObjectAuthorizationEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v7, v11, v10, 0, v8, v9, a3, v15);

  return v13;
}

BOOL __110__HDObjectAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v10;
  HDCodableObjectAuthorization *v11;
  void *v12;
  HDCodableObjectSourceAuthorization *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;

  HDSQLiteColumnWithNameAsUUID();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
  v11 = (HDCodableObjectAuthorization *)objc_claimAutoreleasedReturnValue();
  if (v11
    || (v11 = objc_alloc_init(HDCodableObjectAuthorization),
        objc_msgSend(v10, "hk_dataForUUIDBytes"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HDCodableObjectAuthorization setObjectUUID:](v11, "setObjectUUID:", v12),
        v12,
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v10),
        v11))
  {
    v13 = objc_alloc_init(HDCodableObjectSourceAuthorization);
    HDSQLiteColumnWithNameAsUUID();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_dataForUUIDBytes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableObjectSourceAuthorization setSourceUUID:](v13, "setSourceUUID:", v15);

    -[HDCodableObjectSourceAuthorization setAuthorizationStatus:](v13, "setAuthorizationStatus:", HDSQLiteColumnWithNameAsInt64());
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableObjectSourceAuthorization setModificationDate:](v13, "setModificationDate:");
    HDSQLiteColumnWithNameAsUUID();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hk_dataForUUIDBytes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableObjectSourceAuthorization setSessionUUID:](v13, "setSessionUUID:", v17);

    v18 = HDSQLiteColumnWithNameAsInt64();
    objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identityForEntityID:transaction:error:", v18, *(_QWORD *)(a1 + 48), a8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v20 != 0;
    if (v20)
    {
      objc_msgSend(v20, "identity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "codableSyncIdentity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableObjectSourceAuthorization setSyncIdentity:](v13, "setSyncIdentity:", v23);

      -[HDCodableObjectAuthorization addAuthorizations:](v11, "addAuthorizations:", v13);
    }

  }
  else
  {
    v21 = 1;
  }

  return v21;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  int64_t v11;

  v9 = a3;
  objc_msgSend(a5, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:](HDObjectAuthorizationEntity, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, 0, v9, v10, a6);

  return v11;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableObjectAuthorization *v4;

  v3 = a3;
  v4 = -[HDCodableObjectAuthorization initWithData:]([HDCodableObjectAuthorization alloc], "initWithData:", v3);

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  BOOL v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v60;
  id obj;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  __int128 *p_buf;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 buf;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  id v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v73 = a6;
  v70 = v10;
  v71 = (void *)objc_opt_self();
  v60 = objc_msgSend(v10, "syncProvenance");
  v68 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v9;
  v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
  if (v64)
  {
    v63 = *(_QWORD *)v85;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v85 != v63)
        {
          v12 = v11;
          objc_enumerationMutation(obj);
          v11 = v12;
        }
        v65 = v11;
        v13 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v11);
        objc_msgSend(v13, "objectUUID");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (v66)
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          objc_msgSend(v13, "authorizations");
          v69 = (id)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
          if (!v14)
            goto LABEL_39;
          v72 = *(_QWORD *)v81;
          while (1)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v81 != v72)
                objc_enumerationMutation(v69);
              v16 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
              objc_msgSend(v16, "sourceUUID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                if ((objc_msgSend(v16, "hasAuthorizationStatus") & 1) != 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", v17);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_alloc_init(MEMORY[0x1E0CB6970]);
                  objc_msgSend(v19, "setObjectUUID:", v67);
                  objc_msgSend(v19, "setSourceUUID:", v18);
                  objc_msgSend(v19, "setStatus:", objc_msgSend(v16, "authorizationStatus"));
                  objc_msgSend(v16, "modificationDate");
                  objc_msgSend(v19, "setModificationDate:");
                  v20 = (void *)MEMORY[0x1E0CB3A28];
                  objc_msgSend(v16, "sessionUUID");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "hk_UUIDWithData:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "setSessionUUID:", v22);

                  *(_QWORD *)&buf = 0;
                  *((_QWORD *)&buf + 1) = &buf;
                  v89 = 0x3032000000;
                  v90 = __Block_byref_object_copy__140;
                  v91 = __Block_byref_object_dispose__140;
                  objc_msgSend(v73, "syncIdentityManager");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "legacySyncIdentity");
                  v92 = (id)objc_claimAutoreleasedReturnValue();

                  if (!objc_msgSend(v16, "hasSyncIdentity"))
                    goto LABEL_18;
                  objc_msgSend(v16, "syncIdentity");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v79 = 0;
                  +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v24, &v79);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = v79;

                  if (v25)
                  {
                    objc_msgSend(v73, "database");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v78 = v26;
                    v74[0] = MEMORY[0x1E0C809B0];
                    v74[1] = 3221225472;
                    v74[2] = __90__HDObjectAuthorizationEntity__insertCodableObjectAuthorizations_syncStore_profile_error___block_invoke;
                    v74[3] = &unk_1E6CE8DD8;
                    p_buf = &buf;
                    v75 = v73;
                    v28 = v25;
                    v76 = v28;
                    v29 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performWriteTransactionWithHealthDatabase:error:block:", v27, &v78, v74);
                    v30 = v78;

                    if (v29)
                    {

LABEL_18:
                      v31 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "entity");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "numberWithLongLong:", objc_msgSend(v32, "persistentID"));
                      v26 = (id)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v68, "objectForKeyedSubscript:", v26);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      v28 = v33;
                      if (v33)
                      {
                        objc_msgSend(v33, "addObject:", v19);
                      }
                      else
                      {
                        v38 = objc_alloc(MEMORY[0x1E0C99DE8]);
                        v97 = v19;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        v28 = (id)objc_msgSend(v38, "initWithArray:", v39);

                      }
                      objc_msgSend(v68, "setObject:forKeyedSubscript:", v28, v26);
                    }
                    else
                    {
                      v26 = v30;
                    }
                  }
                  else
                  {
                    _HKInitializeLogging();
                    v40 = *MEMORY[0x1E0CB5370];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
                    {
                      LODWORD(v93) = 138543362;
                      *(_QWORD *)((char *)&v93 + 4) = v26;
                      _os_log_fault_impl(&dword_1B7802000, v40, OS_LOG_TYPE_FAULT, "HDObjectAuthorizationSyncEntity SyncIdentity from received codable is nil %{public}@", (uint8_t *)&v93, 0xCu);
                    }
                    v28 = 0;
                  }

                  _Block_object_dispose(&buf, 8);
                  goto LABEL_33;
                }
                _HKInitializeLogging();
                v36 = (void *)*MEMORY[0x1E0CB5370];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                {
                  v44 = v36;
                  v45 = (void *)objc_opt_class();
                  LODWORD(buf) = 138543362;
                  *(_QWORD *)((char *)&buf + 4) = v45;
                  v46 = v45;
                  _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "%{public}@ is missing authorization status and will be ignored.", (uint8_t *)&buf, 0xCu);

                }
                objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Missing authorization status"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "daemon");
                v19 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "autoBugCaptureReporter");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "reportApplyDataFailure:duringSyncFromStore:error:", objc_opt_class(), v70, v18);

              }
              else
              {
                _HKInitializeLogging();
                v34 = (void *)*MEMORY[0x1E0CB5370];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                {
                  v41 = v34;
                  v42 = (void *)objc_opt_class();
                  LODWORD(buf) = 138543362;
                  *(_QWORD *)((char *)&buf + 4) = v42;
                  v43 = v42;
                  _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "%{public}@ is missing a source ID and will be ignored.", (uint8_t *)&buf, 0xCu);

                }
                objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Missing source ID"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "daemon");
                v19 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "autoBugCaptureReporter");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "reportApplyDataFailure:duringSyncFromStore:error:", objc_opt_class(), v70, v18);

              }
LABEL_33:

            }
            v14 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
            if (!v14)
              goto LABEL_39;
          }
        }
        _HKInitializeLogging();
        v47 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v49 = v47;
          v50 = (void *)objc_opt_class();
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v50;
          v51 = v50;
          _os_log_error_impl(&dword_1B7802000, v49, OS_LOG_TYPE_ERROR, "%{public}@ is missing an object ID and will be ignored.", (uint8_t *)&buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Missing Object ID"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "daemon");
        v69 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "autoBugCaptureReporter");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "reportApplyDataFailure:duringSyncFromStore:error:", objc_opt_class(), v70, v67);

LABEL_39:
        v11 = v65 + 1;
      }
      while (v65 + 1 != v64);
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
    }
    while (v64);
  }

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v52 = v68;
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v93, &buf, 16);
  if (v53)
  {
    v54 = *(_QWORD *)v94;
    v55 = 1;
LABEL_43:
    v56 = 0;
    while (1)
    {
      if (*(_QWORD *)v94 != v54)
        objc_enumerationMutation(v52);
      v57 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v56);
      objc_msgSend(v52, "objectForKeyedSubscript:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v57) = objc_msgSend(v71, "setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:", v58, v60, (int)objc_msgSend(v57, "intValue"), v73, a7);

      if ((v57 & 1) == 0)
        break;
      if (v53 == ++v56)
      {
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v93, &buf, 16);
        if (v53)
          goto LABEL_43;
        goto LABEL_49;
      }
    }
  }
  else
  {
LABEL_49:
    v55 = 0;
  }

  return v55;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
