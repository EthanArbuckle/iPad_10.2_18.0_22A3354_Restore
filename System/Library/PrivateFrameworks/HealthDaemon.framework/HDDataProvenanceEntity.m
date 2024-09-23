@implementation HDDataProvenanceEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)originProvenanceForPersistentID:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  v10[4] = &v12;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__HDDataProvenanceEntity_originProvenanceForPersistentID_database_error___block_invoke;
  v11[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v11[4] = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__HDDataProvenanceEntity_originProvenanceForPersistentID_database_error___block_invoke_2;
  v10[3] = &unk_1E6CE8540;
  objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT sync_provenance, origin_product_type, origin_build, source_version, tz_name, source_id, device_id, contributor_id, origin_major_version, origin_minor_version, origin_patch_version, sync_identity FROM data_provenances WHERE ROWID = ?"), a5, v11, v10);
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

uint64_t __73__HDDataProvenanceEntity_originProvenanceForPersistentID_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

BOOL __73__HDDataProvenanceEntity_originProvenanceForPersistentID_database_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[3];

  v5 = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB1D4](a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a2, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a2, 3);
  v8 = objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a2, 4);
  v29 = objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1C8](a2, 5);
  v28 = objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1C8](a2, 6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1C8](a2, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HDSQLiteColumnAsInt64();
  v11 = HDSQLiteColumnAsInt64();
  v12 = HDSQLiteColumnAsInt64();
  v13 = HDSQLiteColumnAsInt64();
  if (v9)
  {
    v14 = v13;
    +[HDContributorReference contributorReferenceForPersistentID:](HDContributorReference, "contributorReferenceForPersistentID:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v5;
    v17 = a1;
    v18 = (void *)v15;
    v30[0] = v10;
    v30[1] = v11;
    v30[2] = v12;
    +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", v16, v14, v6, v7, v30, v8, v29, v28, v27, v15);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(v17 + 32) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    v22 = (void *)v8;
    v23 = (void *)v29;
    v24 = (void *)v28;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Failure retrieving contributor identifier"));
    v22 = (void *)v8;
    v24 = (void *)v28;
    v23 = (void *)v29;
  }

  return v9 != 0;
}

+ (id)databaseTable
{
  return CFSTR("data_provenances");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 16;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_3;
}

+ (id)uniquedColumns
{
  _QWORD v3[15];

  v3[14] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("sync_provenance");
  v3[1] = CFSTR("origin_product_type");
  v3[2] = CFSTR("origin_build");
  v3[3] = CFSTR("local_product_type");
  v3[4] = CFSTR("local_build");
  v3[5] = CFSTR("source_id");
  v3[6] = CFSTR("device_id");
  v3[7] = CFSTR("contributor_id");
  v3[8] = CFSTR("source_version");
  v3[9] = CFSTR("tz_name");
  v3[10] = CFSTR("origin_major_version");
  v3[11] = CFSTR("origin_minor_version");
  v3[12] = CFSTR("origin_patch_version");
  v3[13] = CFSTR("sync_identity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 14);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)insertOrLookupDataProvenanceForSyncProvenance:(int64_t)a3 syncIdentity:(int64_t)a4 originProductType:(id)a5 originSystemBuild:(id)a6 originOSVersion:(id *)a7 localProductType:(id)a8 localSystemBuild:(id)a9 sourceVersion:(id)a10 timeZoneName:(id)a11 sourceID:(id)a12 deviceID:(id)a13 contributorID:(id)a14 transaction:(id)a15 error:(id *)a16
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  char v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v68;
  id v69;
  id v71;
  id v73;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  _QWORD v80[5];
  _QWORD v81[4];
  id v82;
  _QWORD aBlock[4];
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  int64_t v93;
  __int128 v94;
  int64_t var2;
  int64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  _QWORD v103[5];
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  __int128 buf;
  uint64_t (*v109)(uint64_t, sqlite3_stmt *);
  void *v110;
  uint64_t v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = v20;
  v24 = a11;
  v25 = v18;
  v26 = a12;
  v27 = a13;
  v28 = v21;
  v29 = a14;
  v76 = a15;
  if (v18)
  {
    if (v19)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataProvenanceEntity.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originProductType != nil"));

    if (v19)
    {
LABEL_3:
      if (v23)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataProvenanceEntity.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originSystemBuild != nil"));

  if (v23)
  {
LABEL_4:
    if (v28)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataProvenanceEntity.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localProductType != nil"));

  if (v28)
  {
LABEL_5:
    if (v22)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataProvenanceEntity.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localSystemBuild != nil"));

  if (v22)
  {
LABEL_6:
    if (v24)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataProvenanceEntity.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceVersion != nil"));

  if (v24)
  {
LABEL_7:
    if (v26)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataProvenanceEntity.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeZoneName != nil"));

  if (v26)
  {
LABEL_8:
    if (v27)
      goto LABEL_9;
LABEL_45:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataProvenanceEntity.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deviceID != nil"));

    if (v29)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataProvenanceEntity.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceID != nil"));

  if (!v27)
    goto LABEL_45;
LABEL_9:
  if (v29)
    goto LABEL_10;
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataProvenanceEntity.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contributorID != nil"));

LABEL_10:
  if (!v76)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataProvenanceEntity.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction != nil"));

  }
  v97 = 0;
  v98 = &v97;
  v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__11;
  v101 = __Block_byref_object_dispose__11;
  v30 = MEMORY[0x1E0C809B0];
  v102 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke;
  aBlock[3] = &unk_1E6CE9F48;
  v93 = a3;
  v68 = v25;
  v84 = v68;
  v69 = v19;
  v85 = v69;
  v71 = v23;
  v86 = v71;
  v73 = v28;
  v87 = v73;
  v31 = v26;
  v88 = v31;
  v32 = v27;
  v89 = v32;
  v33 = v29;
  v90 = v33;
  v34 = v22;
  v91 = v34;
  v35 = v24;
  v92 = v35;
  v94 = *(_OWORD *)&a7->var0;
  var2 = a7->var2;
  v96 = a4;
  v36 = _Block_copy(aBlock);
  objc_msgSend(v76, "protectedDatabase");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v30;
  v81[1] = 3221225472;
  v81[2] = __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke_2;
  v81[3] = &unk_1E6CE9F70;
  v38 = v36;
  v82 = v38;
  v80[0] = v30;
  v80[1] = 3221225472;
  v80[2] = __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke_3;
  v80[3] = &unk_1E6CE8540;
  v80[4] = &v97;
  v39 = objc_msgSend(v37, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM data_provenances WHERE sync_provenance = ? AND origin_product_type = ? AND origin_build = ? AND local_product_type = ? AND local_build = ? AND source_id = ? AND device_id = ? AND contributor_id = ? AND source_version = ? AND tz_name = ? AND origin_major_version = ? AND origin_minor_version = ? AND origin_patch_version = ? AND sync_identity = ?"), a16, v81, v80);

  if ((v39 & 1) != 0)
  {
    v40 = (void *)v98[5];
    if (v40)
    {
      v41 = v40;
    }
    else
    {
      v44 = objc_msgSend(v31, "longLongValue");
      objc_msgSend(v76, "unprotectedDatabase");
      v45 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v104 = 0;
      v105 = &v104;
      v106 = 0x2020000000;
      v107 = 0;
      *(_QWORD *)&buf = v30;
      *((_QWORD *)&buf + 1) = 3221225472;
      v109 = __66__HDDataProvenanceEntity__derivedFlagsForSourceID_database_error___block_invoke_2;
      v110 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
      v111 = v44;
      v103[0] = v30;
      v103[1] = 3221225472;
      v103[2] = __66__HDDataProvenanceEntity__derivedFlagsForSourceID_database_error___block_invoke_3;
      v103[3] = &unk_1E6CE8540;
      v103[4] = &v104;
      if ((objc_msgSend(v45, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_derivedFlagsForSourceID_database_error__lookupKey, a16, &__block_literal_global_15, &buf, v103) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v105[3]);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v46 = 0;
      }
      _Block_object_dispose(&v104, 8);

      if (v46)
      {
        objc_msgSend(v76, "protectedDatabase");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v77[0] = v30;
        v77[1] = 3221225472;
        v77[2] = __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke_254;
        v77[3] = &unk_1E6CE9F98;
        v79 = v38;
        v78 = v46;
        v48 = objc_msgSend(v47, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO data_provenances (sync_provenance, origin_product_type, origin_build, local_product_type, local_build, source_id, device_id, contributor_id, source_version, tz_name, origin_major_version, origin_minor_version, origin_patch_version, sync_identity, derived_flags) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), a16, v77, 0);

        if (v48)
        {
          objc_msgSend(v76, "protectedDatabase");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "lastInsertRowID");
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = (void *)v98[5];
          v98[5] = v50;

        }
        else
        {
          _HKInitializeLogging();
          v54 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
          {
            v55 = a16;
            if (a16)
              v55 = *a16;
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v55;
            _os_log_impl(&dword_1B7802000, v54, OS_LOG_TYPE_INFO, "Unable to insert data provenance : %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
        v41 = (id)v98[5];

      }
      else
      {
        _HKInitializeLogging();
        v52 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
        {
          v53 = a16;
          if (a16)
            v53 = *a16;
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v53;
          _os_log_impl(&dword_1B7802000, v52, OS_LOG_TYPE_INFO, "Unable to look up derived flags: %{public}@", (uint8_t *)&buf, 0xCu);
        }
        v41 = 0;
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v42 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
    {
      v43 = a16;
      if (a16)
        v43 = *a16;
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v43;
      _os_log_impl(&dword_1B7802000, v42, OS_LOG_TYPE_INFO, "Unable to look up data provenance: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v41 = 0;
  }

  _Block_object_dispose(&v97, 8);
  return v41;
}

uint64_t __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 104));
  HDSQLiteBindStringToStatement();
  HDSQLiteBindStringToStatement();
  HDSQLiteBindStringToStatement();
  HDSQLiteBindStringToStatement();
  sqlite3_bind_int64(a2, 6, objc_msgSend(*(id *)(a1 + 64), "longLongValue"));
  sqlite3_bind_int64(a2, 7, objc_msgSend(*(id *)(a1 + 72), "longLongValue"));
  sqlite3_bind_int64(a2, 8, objc_msgSend(*(id *)(a1 + 80), "longLongValue"));
  HDSQLiteBindStringToStatement();
  HDSQLiteBindStringToStatement();
  sqlite3_bind_int64(a2, 11, *(_QWORD *)(a1 + 112));
  sqlite3_bind_int64(a2, 12, *(_QWORD *)(a1 + 120));
  sqlite3_bind_int64(a2, 13, *(_QWORD *)(a1 + 128));
  return sqlite3_bind_int64(a2, 14, *(_QWORD *)(a1 + 136));
}

uint64_t __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1C8](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

uint64_t __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke_254(uint64_t a1, sqlite3_stmt *a2)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return sqlite3_bind_int64(a2, 15, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
}

+ (id)deviceIDsForSourceIDs:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E0C99E20];
  v10 = a4;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v10, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__HDDataProvenanceEntity_deviceIDsForSourceIDs_profile_error___block_invoke;
  v17[3] = &unk_1E6CE9280;
  v18 = v8;
  v20 = a1;
  v13 = v11;
  v19 = v13;
  v14 = v8;
  LODWORD(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v12, a5, v17);

  if ((_DWORD)a5)
    v15 = (void *)objc_msgSend(v13, "copy");
  else
    v15 = 0;

  return v15;
}

uint64_t __62__HDDataProvenanceEntity_deviceIDsForSourceIDs_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D29848];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  objc_msgSend(v5, "containsPredicateWithProperty:values:", CFSTR("source_id"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 48);
  objc_msgSend(v7, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "queryWithDatabase:predicate:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = CFSTR("device_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__HDDataProvenanceEntity_deviceIDsForSourceIDs_profile_error___block_invoke_2;
  v15[3] = &unk_1E6CE9FC0;
  v16 = *(id *)(a1 + 40);
  v13 = objc_msgSend(v11, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v12, a3, v15);

  return v13;
}

uint64_t __62__HDDataProvenanceEntity_deviceIDsForSourceIDs_profile_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  HDSQLiteColumnWithNameAsNumber();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

uint64_t __93__HDDataProvenanceEntity__validateUnprotectedDatabaseReferencesOnProfile_error_errorHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  uint64_t v15;

  v5 = a2;
  objc_msgSend(v5, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __93__HDDataProvenanceEntity__validateUnprotectedDatabaseReferencesOnProfile_error_errorHandler___block_invoke_2;
  v12[3] = &unk_1E6CE9FE8;
  v15 = *(_QWORD *)(a1 + 48);
  v13 = v5;
  v11 = *(_OWORD *)(a1 + 32);
  v7 = (id)v11;
  v14 = v11;
  v8 = v5;
  v9 = objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID, sync_provenance, source_id, device_id FROM data_provenances"), a3, 0, v12);

  return v9;
}

uint64_t __93__HDDataProvenanceEntity__validateUnprotectedDatabaseReferencesOnProfile_error_errorHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
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
  char v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  _QWORD v63[4];
  _QWORD v64[4];
  _QWORD v65[4];
  _QWORD v66[4];
  _QWORD v67[6];

  v67[4] = *MEMORY[0x1E0C80C00];
  MEMORY[0x1BCCAB1C8](a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB1C8](a2, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1C8](a2, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), CFSTR("HDDataProvenanceEntity.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rowID != nil"));

    if (v6)
      goto LABEL_3;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), CFSTR("HDDataProvenanceEntity.m"), 349, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceID != nil"));

    goto LABEL_3;
  }
  if (!v6)
    goto LABEL_21;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 120, CFSTR("Record in data_provenances points to non existent record in another table"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity entityWithPersistentID:](HDSyncStoreEntity, "entityWithPersistentID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "unprotectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v9;
  v11 = objc_msgSend(v9, "existsInDatabase:", v10);

  if ((v11 & 1) == 0 && v5)
  {
    v66[0] = *MEMORY[0x1E0CB4DE8];
    objc_msgSend(*(id *)(a1 + 56), "databaseTable");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = CFSTR("No database table name found");
    v15 = *MEMORY[0x1E0CB3388];
    v67[0] = v14;
    v67[1] = v61;
    v16 = *MEMORY[0x1E0CB4DF8];
    v66[1] = v15;
    v66[2] = v16;
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSyncStoreEntity databaseTable](HDSyncStoreEntity, "databaseTable");
    v19 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "databaseTable");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Cannot find rowid:%@ in table:%@ for rowid:%@ in table:%@"), v18, v20, v4, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v66[3] = *MEMORY[0x1E0CB4DE0];
    v67[2] = v22;
    v67[3] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v19;
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:userInfo:", 120, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  +[HDSQLiteEntity entityWithPersistentID:](HDSourceEntity, "entityWithPersistentID:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "unprotectedDatabase");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "existsInDatabase:", v26);

  if ((v27 & 1) == 0)
  {
    v64[0] = *MEMORY[0x1E0CB4DE8];
    objc_msgSend(*(id *)(a1 + 56), "databaseTable");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v28)
      v30 = (const __CFString *)v28;
    else
      v30 = CFSTR("No database table name found");
    v31 = *MEMORY[0x1E0CB3388];
    v65[0] = v30;
    v65[1] = v61;
    v32 = *MEMORY[0x1E0CB4DF8];
    v64[1] = v31;
    v64[2] = v32;
    v33 = (void *)MEMORY[0x1E0CB3940];
    +[HDSourceEntity databaseTable](HDSourceEntity, "databaseTable");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "databaseTable");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("Cannot find rowid:%@ in table:%@ for rowid:%@ in table:%@"), v6, v34, v4, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v64[3] = *MEMORY[0x1E0CB4DE0];
    v65[2] = v36;
    v65[3] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 4);
    v37 = v7;
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:userInfo:", 120, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v7 = v37;
  }
  +[HDSQLiteEntity entityWithPersistentID:](HDDeviceEntity, "entityWithPersistentID:", v7);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "unprotectedDatabase");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v40, "existsInDatabase:", v41);

  if ((v42 & 1) == 0)
  {
    v62[0] = *MEMORY[0x1E0CB4DE8];
    objc_msgSend(*(id *)(a1 + 56), "databaseTable");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)v43;
    if (v43)
      v45 = (const __CFString *)v43;
    else
      v45 = CFSTR("No database table name found");
    v46 = *MEMORY[0x1E0CB3388];
    v63[0] = v45;
    v63[1] = v61;
    v47 = *MEMORY[0x1E0CB4DF8];
    v62[1] = v46;
    v62[2] = v47;
    v48 = (void *)MEMORY[0x1E0CB3940];
    +[HDDeviceEntity databaseTable](HDDeviceEntity, "databaseTable");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "databaseTable");
    v59 = a1;
    v50 = v6;
    v51 = v7;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringWithFormat:", CFSTR("Cannot find rowid:%@ in table:%@ for rowid:%@ in table:%@"), v51, v49, v4, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = *MEMORY[0x1E0CB4DE0];
    v63[2] = v53;
    v63[3] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 4);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v51;
    v6 = v50;

    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:userInfo:", 120, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(v59 + 40) + 16))();

  }
  return 1;
}

+ (id)sourceIDsWithProvenanceFromSourceIDs:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E0C99E20];
  v10 = a4;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v10, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__HDDataProvenanceEntity_sourceIDsWithProvenanceFromSourceIDs_profile_error___block_invoke;
  v17[3] = &unk_1E6CE9280;
  v18 = v8;
  v20 = a1;
  v13 = v11;
  v19 = v13;
  v14 = v8;
  LODWORD(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v12, a5, v17);

  if ((_DWORD)a5)
    v15 = (void *)objc_msgSend(v13, "copy");
  else
    v15 = 0;

  return v15;
}

uint64_t __77__HDDataProvenanceEntity_sourceIDsWithProvenanceFromSourceIDs_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D29848];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  objc_msgSend(v5, "containsPredicateWithProperty:values:", CFSTR("source_id"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 48);
  objc_msgSend(v7, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "queryWithDatabase:predicate:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = CFSTR("source_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__HDDataProvenanceEntity_sourceIDsWithProvenanceFromSourceIDs_profile_error___block_invoke_2;
  v15[3] = &unk_1E6CE9FC0;
  v16 = *(id *)(a1 + 40);
  v13 = objc_msgSend(v11, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v12, a3, v15);

  return v13;
}

uint64_t __77__HDDataProvenanceEntity_sourceIDsWithProvenanceFromSourceIDs_profile_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  HDSQLiteColumnWithNameAsNumber();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

id __66__HDDataProvenanceEntity__derivedFlagsForSourceID_database_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSourceEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SELECT (%@ LIKE 'Watch%%') FROM %@ WHERE %@=? LIMIT 1"), CFSTR("product_type"), v1, *MEMORY[0x1E0D29618], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __66__HDDataProvenanceEntity__derivedFlagsForSourceID_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __66__HDDataProvenanceEntity__derivedFlagsForSourceID_database_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1BCCAB174](a2, 0))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= 1uLL;
  return 1;
}

+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  char *v16;
  uint64_t v17;

  v7 = a5;
  v8 = a3;
  v9 = objc_opt_self();
  objc_msgSend(v8, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDDatabaseTransactionContext contextForReadingProtectedData](HDDatabaseTransactionContext, "contextForReadingProtectedData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__HDDataProvenanceEntity__validateUnprotectedDatabaseReferencesOnProfile_error_errorHandler___block_invoke;
  v14[3] = &unk_1E6CEA010;
  v16 = sel__validateUnprotectedDatabaseReferencesOnProfile_error_errorHandler_;
  v17 = v9;
  v15 = v7;
  v12 = v7;
  LOBYTE(a4) = objc_msgSend(v10, "performTransactionWithContext:error:block:inaccessibilityHandler:", v11, a4, v14, 0);

  return (char)a4;
}

@end
