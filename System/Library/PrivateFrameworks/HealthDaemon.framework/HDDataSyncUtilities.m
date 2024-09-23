@implementation HDDataSyncUtilities

+ (Class)medicationDoseEventSyncEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)quantitySampleSyncEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)correlationSampleSyncEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)deletedSampleSyncEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)deletedSampleEntityClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)insertObjectsFromCodableObjectCollection:(id)a3 syncEntityClass:(Class)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  BOOL v24;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id *v31;
  void *context;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1BCCACAC4]();
  objc_msgSend((id)objc_opt_class(), "objectsFromCodableObjectsInCollection:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {

    objc_autoreleasePoolPop(v14);
LABEL_10:
    v24 = 1;
    goto LABEL_11;
  }
  v34 = 0;
  +[HDDataSyncUtilities provenanceFromCollection:syncStore:profile:error:](HDDataSyncUtilities, "provenanceFromCollection:syncStore:profile:error:", v11, v12, v13, &v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v34;
  if (!v16)
  {
    _HKInitializeLogging();
    v21 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = v12;
      v37 = 2114;
      v38 = v17;
      _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "Failed to create provenance for codable object collection from store %{public}@: %{public}@", buf, 0x16u);
    }
    objc_msgSend(v13, "daemon");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "autoBugCaptureReporter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "reportApplyDataFailure:duringSyncFromStore:error:", a4, v12, v17);

    goto LABEL_9;
  }
  v31 = a7;
  context = v14;
  objc_msgSend(v13, "dataManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v17;
  v19 = objc_msgSend(v18, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:updateSourceOrder:resolveAssociations:error:", v15, v16, 1, 0, 0, &v33, 2.22507386e-308);
  v20 = v33;

  if ((v19 & 1) != 0)
  {
    v17 = v20;
    v14 = context;
LABEL_9:

    objc_autoreleasePoolPop(v14);
    goto LABEL_10;
  }
  _HKInitializeLogging();
  v26 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v36 = v12;
    v37 = 2114;
    v38 = v20;
    _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "failed to insert objects synced from store %{public}@: %{public}@", buf, 0x16u);
  }
  objc_msgSend(v13, "daemon");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "autoBugCaptureReporter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "reportApplyDataFailure:duringSyncFromStore:error:", a4, v12, v20);

  objc_autoreleasePoolPop(context);
  v29 = v20;
  v30 = v29;
  if (v29)
  {
    if (v31)
      *v31 = objc_retainAutorelease(v29);
    else
      _HKLogDroppedError();
  }

  v24 = 0;
LABEL_11:

  return v24;
}

+ (id)provenanceFromCollection:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  int v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  BOOL v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  uint64_t v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  id v72;
  void *v73;
  void *v74;
  __CFString *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  id v83;
  _BYTE *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  __int128 v90;
  uint64_t v91;
  _BYTE buf[24];
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v80 = a4;
  v79 = a5;
  v77 = v8;
  objc_msgSend(v8, "provenance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "source");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
      v10 = objc_msgSend(v80, "syncProvenance");
    else
      v10 = 0;
    objc_msgSend(v9, "decodedSourceUUID");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "decodedDeviceUUID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v9, "contributorUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_UUIDWithData:", v14);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
      +[HDContributorReference contributorReferenceForOtherUserWithUUID:](HDContributorReference, "contributorReferenceForOtherUserWithUUID:");
    else
      +[HDContributorReference contributorReferenceForNoContributor](HDContributorReference, "contributorReferenceForNoContributor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v76)
    {
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v80;
        _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "missing source for object collection received from %{public}@", buf, 0xCu);
      }
      v78 = 0;
      v20 = 0;
LABEL_29:
      if (v73)
      {
        objc_msgSend(v79, "database");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v20;
        +[HDDeviceEntity deviceEntityWithUUID:healthDatabase:error:](HDDeviceEntity, "deviceEntityWithUUID:healthDatabase:error:", v73, v29, &v88);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v88;

        if (v74)
        {
LABEL_35:
          objc_msgSend(v9, "originProductType");
          v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v75)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v80, "remoteProductType");
              v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v75 = CFSTR("UnknownDevice");
            }
          }
          if (v78 && v74)
          {
            if (objc_msgSend(v9, "hasOriginMajorVersion"))
            {
              v35 = objc_msgSend(v9, "originMajorVersion");
              v66 = (int)objc_msgSend(v9, "originMinorVersion");
              v67 = v35;
              v65 = (int)objc_msgSend(v9, "originPatchVersion");
            }
            else
            {
              objc_msgSend(v9, "originBuild");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              HDVersionFromBuildStringForProductType(v40, v75, buf);
              v66 = *(_QWORD *)&buf[8];
              v67 = *(_QWORD *)buf;
              v65 = *(_QWORD *)&buf[16];

            }
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v93 = __Block_byref_object_copy__7;
            v94 = __Block_byref_object_dispose__7;
            objc_msgSend(v79, "syncIdentityManager");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "legacySyncIdentity");
            v95 = (id)objc_claimAutoreleasedReturnValue();

            v64 = v10;
            v68 = v15;
            if (objc_msgSend(v77, "hasSyncIdentity"))
            {
              objc_msgSend(v77, "syncIdentity");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = 0;
              +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v42, &v86);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v86;

              if (v43)
              {
                objc_msgSend(v79, "database");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v85 = v44;
                v81[0] = MEMORY[0x1E0C809B0];
                v81[1] = 3221225472;
                v81[2] = __72__HDDataSyncUtilities_provenanceFromCollection_syncStore_profile_error___block_invoke;
                v81[3] = &unk_1E6CE8DD8;
                v84 = buf;
                v82 = v79;
                v83 = v43;
                v46 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performWriteTransactionWithHealthDatabase:error:block:", v45, &v85, v81);
                v47 = v85;

                if (!v46)
                {
                  _HKInitializeLogging();
                  v48 = *MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
                  {
                    LODWORD(v90) = 138543362;
                    *(_QWORD *)((char *)&v90 + 4) = v47;
                    _os_log_fault_impl(&dword_1B7802000, v48, OS_LOG_TYPE_FAULT, "HDDataSyncEntity ConcreteSyncIdentity from received codable is nil %{public}@", (uint8_t *)&v90, 0xCu);
                  }
                }

                v44 = v47;
              }
              else
              {
                _HKInitializeLogging();
                v49 = *MEMORY[0x1E0CB5370];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
                {
                  LODWORD(v90) = 138543362;
                  *(_QWORD *)((char *)&v90 + 4) = v44;
                  _os_log_fault_impl(&dword_1B7802000, v49, OS_LOG_TYPE_FAULT, "HDDataSyncEntity SyncIdentity from received codable is nil %{public}@", (uint8_t *)&v90, 0xCu);
                }
              }

            }
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "entity");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v50, "persistentID");
            objc_msgSend(v9, "originBuild");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "sourceVersion");
            v53 = objc_claimAutoreleasedReturnValue();
            v54 = (void *)v53;
            if (v53)
              v55 = (const __CFString *)v53;
            else
              v55 = &stru_1E6D11BB8;
            objc_msgSend(v9, "timeZoneName");
            v56 = objc_claimAutoreleasedReturnValue();
            v57 = (void *)v56;
            if (v56)
              v58 = (const __CFString *)v56;
            else
              v58 = &stru_1E6D11BB8;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v78, "persistentID"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v74, "persistentID"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&v90 = v67;
            *((_QWORD *)&v90 + 1) = v66;
            v91 = v65;
            +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", v64, v51, v75, v52, &v90, v55, v58, v59, v60, v68);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = v68;
            _Block_object_dispose(buf, 8);

          }
          else
          {
            _HKInitializeLogging();
            v36 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
            {
              v37 = v36;
              objc_msgSend(v69, "UUIDString");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "UUIDString");
              v39 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v80;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v38;
              *(_WORD *)&buf[22] = 2114;
              v93 = v39;
              _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_INFO, "missing source/device provenance for object collection received from %{public}@, %{public}@/%{public}@.", buf, 0x20u);

            }
            v12 = 0;
          }
          v61 = v72;
          v62 = v61;
          if (v61)
          {
            if (a6)
              *a6 = objc_retainAutorelease(v61);
            else
              _HKLogDroppedError();
          }

          goto LABEL_68;
        }
        _HKInitializeLogging();
        v30 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
        {
          v31 = v30;
          objc_msgSend(v73, "UUIDString");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v32;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v72;
          _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_INFO, "failed to find expected device \"%{public}@\": %{public}@", buf, 0x16u);

        }
      }
      else
      {
        v72 = v20;
      }
      objc_msgSend(v79, "deviceManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v72;
      objc_msgSend(v33, "deviceEntityForNoDeviceWithError:", &v87);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v87;

      v72 = v34;
      goto LABEL_35;
    }
    objc_msgSend(v76, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      objc_msgSend(v80, "syncStoreDefaultSourceBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

    }
    else
    {
      v18 = 1;
    }
    LOBYTE(v90) = 0;
    objc_msgSend(v79, "sourceManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0;
    objc_msgSend(v21, "sourceForCodableSource:provenance:createIfNecessary:isDeleted:error:", v76, v10, v18, &v90, &v89);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v89;

    if (v78)
    {
      if (!(_BYTE)v90)
      {
LABEL_28:

        goto LABEL_29;
      }
      v22 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v76, "decodedUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hk_error:format:", 100, CFSTR("Source %@ is deleted"), v23);
      v24 = v20;
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      v25 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        if ((_DWORD)v18)
          v26 = " or create";
        else
          v26 = "";
        v27 = v25;
        objc_msgSend(v76, "decodedUUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 2114;
        v93 = (uint64_t (*)(uint64_t, uint64_t))v20;
        _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "failed to look-up%s source %{public}@: %{public}@", buf, 0x20u);

      }
      objc_msgSend(v79, "daemon");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "autoBugCaptureReporter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "bundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "reportMissingSource:duringSyncFromStore:", v24, v80);
    }

    v78 = 0;
    goto LABEL_28;
  }
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v80;
    _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "No provenance information on codable object collection received from %{public}@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 3, CFSTR("No provenance information on codable object collection received from %@"), v80);
  v12 = 0;
LABEL_68:

  return v12;
}

BOOL __72__HDDataSyncUtilities_provenanceFromCollection_syncStore_profile_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "syncIdentityManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "concreteIdentityForIdentity:shouldCreate:transaction:error:", a1[5], 1, v6, a3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  return *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
}

+ (BOOL)insertDeletedObjectsFromCodableObjectCollection:(id)a3 syncEntityClass:(Class)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  BOOL v28;
  id v29;
  NSObject *v30;
  void *v31;
  Class v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "deletedSamples");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v35 = 0;
    +[HDDataSyncUtilities provenanceFromCollection:syncStore:profile:error:](HDDataSyncUtilities, "provenanceFromCollection:syncStore:profile:error:", v11, v12, v13, &v35);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v35;
    if (v16)
    {
      v33 = a4;
      objc_msgSend(v11, "deletedSamples");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "daemon");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "behavior");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "shouldReceiveECGSamples");

      if ((v21 & 1) != 0)
      {
        v22 = v18;
      }
      else
      {
        objc_msgSend(v11, "deletedSamples");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "hk_filter:", &__block_literal_global_7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v22, "count"))
        {
          v23 = 1;
LABEL_26:

          goto LABEL_27;
        }
      }
      v34 = v17;
      v28 = +[HDDeletedSampleEntity insertCodableDeletedSamples:provenance:profile:error:](HDDeletedSampleEntity, "insertCodableDeletedSamples:provenance:profile:error:", v22, v16, v13, &v34);
      v26 = v34;

      if (v28)
      {
        v23 = 1;
LABEL_25:
        v17 = v26;
        goto LABEL_26;
      }
      if (objc_msgSend(v26, "hk_isHealthKitErrorWithCode:", 123))
      {
        v29 = v26;
        v25 = v29;
        if (v29)
        {
          if (a7)
          {
            v25 = objc_retainAutorelease(v29);
            v23 = 0;
            *a7 = v25;
          }
          else
          {
            _HKLogDroppedError();
            v23 = 0;
          }
          v26 = v25;
        }
        else
        {
          v26 = 0;
          v23 = 0;
        }
      }
      else
      {
        _HKInitializeLogging();
        v30 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v37 = v12;
          v38 = 2114;
          v39 = v26;
          _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "Failed to insert deleted samples during sync for store %{public}@: %{public}@", buf, 0x16u);
        }
        objc_msgSend(v13, "daemon");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "autoBugCaptureReporter");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "reportApplyDataFailure:duringSyncFromStore:error:", v33, v12, v26);

        v23 = 1;
      }
LABEL_24:

      goto LABEL_25;
    }
    _HKInitializeLogging();
    v24 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v37 = v12;
      v38 = 2114;
      v39 = v17;
      _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "Failed to look up provenance for deleted samples from store %{public}@: %{public}@", buf, 0x16u);
      if (v17)
        goto LABEL_9;
    }
    else if (v17)
    {
LABEL_9:
      objc_msgSend(v13, "daemon");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "autoBugCaptureReporter");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "reportApplyDataFailure:duringSyncFromStore:error:", a4, v12, v17);
      v23 = 1;
      v26 = v17;
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 11, CFSTR("Failed to look up provenance for deleted samples from store"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v23 = 1;
LABEL_27:

  return v23;
}

BOOL __111__HDDataSyncUtilities_insertDeletedObjectsFromCodableObjectCollection_syncEntityClass_syncStore_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "hasSample"))
  {
    objc_msgSend(v2, "sample");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "dataType") != 144;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)generateCodableObjectCollectionsForEntityClass:(Class)a3 predicate:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  Class v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__7;
  v28 = __Block_byref_object_dispose__7;
  v29 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__HDDataSyncUtilities_generateCodableObjectCollectionsForEntityClass_predicate_profile_error___block_invoke;
  v18[3] = &unk_1E6CE8E90;
  v13 = v11;
  v19 = v13;
  v22 = a3;
  v14 = v10;
  v23 = a1;
  v20 = v14;
  v21 = &v24;
  if (-[objc_class performReadTransactionWithHealthDatabase:error:block:](a3, "performReadTransactionWithHealthDatabase:error:block:", v12, a6, v18))v15 = (void *)v25[5];
  else
    v15 = 0;
  v16 = v15;

  _Block_object_dispose(&v24, 8);
  return v16;
}

uint64_t __94__HDDataSyncUtilities_generateCodableObjectCollectionsForEntityClass_predicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  HDDataProvenanceCache *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HDDataProvenanceCache *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[4];
  HDDataProvenanceCache *v20;
  id v21;
  id v22;
  __int128 v23;

  v5 = a2;
  v6 = -[HDDataProvenanceCache initWithProfile:transaction:purpose:]([HDDataProvenanceCache alloc], "initWithProfile:transaction:purpose:", *(_QWORD *)(a1 + 32), v5, 0);
  objc_msgSend(*(id *)(a1 + 56), "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", *(_QWORD *)(a1 + 32), v5, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 56);
  objc_msgSend(v7, "orderedProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __94__HDDataSyncUtilities_generateCodableObjectCollectionsForEntityClass_predicate_profile_error___block_invoke_2;
  v19[3] = &unk_1E6CE8E68;
  v12 = v6;
  v20 = v12;
  v21 = *(id *)(a1 + 32);
  v13 = v7;
  v22 = v13;
  v23 = *(_OWORD *)(a1 + 56);
  v14 = objc_msgSend(v8, "enumerateEntitiesForSyncWithProperties:predicate:healthDatabase:error:block:", v9, v10, v11, a3, v19);

  if ((_DWORD)v14)
  {
    -[HDDataProvenanceCache allCodableObjectCollectionsByProvenance](v12, "allCodableObjectCollectionsByProvenance");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
  return v14;
}

uint64_t __94__HDDataSyncUtilities_generateCodableObjectCollectionsForEntityClass_predicate_profile_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnWithNameAsInt64());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "provenanceWithID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a8, 100, CFSTR("Failed to retrieve provenance for id %@"), v12);
LABEL_9:
    v18 = 0;
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "codableObjectCollectionForProvenance:profile:", v13, *(_QWORD *)(a1 + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a8, 100, CFSTR("Failed to find/create codable object collection for provenance %@"), v13);
    goto LABEL_9;
  }
  v15 = *(void **)(a1 + 48);
  v16 = objc_msgSend(v11, "persistentID");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __94__HDDataSyncUtilities_generateCodableObjectCollectionsForEntityClass_predicate_profile_error___block_invoke_3;
  v21[3] = &unk_1E6CE8E40;
  v25 = *(_QWORD *)(a1 + 56);
  v22 = *(id *)(a1 + 32);
  v23 = v13;
  v24 = *(id *)(a1 + 40);
  if ((objc_msgSend(v15, "generateCodableRepresentationsForPersistentID:row:maxBytesPerRepresentation:error:handler:", v16, a4, 0x80000, a8, v21) & 1) == 0)
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: failed to generate codable representation for sync", buf, 0xCu);
    }
  }

  v18 = 1;
LABEL_10:

  return v18;
}

uint64_t __94__HDDataSyncUtilities_generateCodableObjectCollectionsForEntityClass_predicate_profile_error___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v5 = a1[6];
  v4 = (void *)a1[7];
  v6 = a2;
  objc_msgSend(v2, "codableObjectCollectionForProvenance:profile:", v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "addCodableObject:toCollection:", v6, v7);

  if ((_DWORD)v3)
    return 0;
  else
    return 2;
}

@end
