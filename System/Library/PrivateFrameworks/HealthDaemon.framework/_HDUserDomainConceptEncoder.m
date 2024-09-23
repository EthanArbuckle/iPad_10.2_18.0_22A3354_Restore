@implementation _HDUserDomainConceptEncoder

- (id)orderedProperties
{
  int64_t v2;
  void *v3;

  v2 = -[HDEntityEncoder purpose](self, "purpose");
  v3 = &unk_1E6DFA538;
  if (!v2)
    v3 = &unk_1E6DFA520;
  return v3;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CE8]), "_initBareObject");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v31;
  void *v34;
  id v35;
  void *v36;
  id v37[3];

  v8 = a3;
  -[HDEntityEncoder transaction](self, "transaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v35 = v9;
  v31 = (void *)objc_opt_self();
  HDSQLiteColumnWithNameAsUUID();
  v11 = objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = HDSQLiteColumnWithNameAsInt64();
  v14 = HDSQLiteColumnWithNameAsBoolean();
  HDSQLiteColumnWithNameAsDouble();
  v16 = v15;
  HDSQLiteColumnWithNameAsDouble();
  v18 = v17;
  v36 = (void *)HDSQLiteColumnWithNameAsInt64();
  v19 = (void *)HDSQLiteColumnWithNameAsInt64();
  v20 = (void *)HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = HDSQLiteColumnWithNameAsInt64();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D48]), "initWithCode:schema:", v13, v12);
  objc_msgSend(v10, "_setIdentifier:", v23);

  v34 = (void *)v11;
  objc_msgSend(v10, "_setUUID:", v11);
  objc_msgSend(v10, "_setDeleted:", v14);
  objc_msgSend(v10, "_setCreationTimestamp:", v16);
  objc_msgSend(v10, "_setModificationTimestamp:", v18);
  v37[0] = v36;
  v37[1] = v19;
  v37[2] = v20;
  objc_msgSend(v10, "_setOperatingSystemVersion:", v37);
  objc_msgSend(v10, "_setBuild:", v21);
  objc_msgSend(v10, "setHealthd_use_only_syncEntityIdentity:", v22);
  if ((v14 & 1) != 0)
  {
    LOBYTE(v24) = 1;
    v26 = (void *)v11;
    v25 = v35;
    v27 = (void *)v12;
  }
  else
  {
    v37[0] = 0;
    v24 = +[HDUserDomainConceptEntity _inflateLinkCollection:row:error:]((uint64_t)v31, v37, (uint64_t)a5, (uint64_t)a6);
    v28 = v37[0];
    v29 = v28;
    if (v24)
    {
      if (v28)
        objc_msgSend(v10, "_setLinkCollection:", v28);
      v25 = v35;
      LOBYTE(v24) = objc_msgSend(v31, "retrievePrivateDataEntitiesForUserDomainConcept:persistentID:transaction:error:", v10, a4, v35, a6, v31);
    }
    else
    {
      v25 = v35;
    }
    v27 = (void *)v12;
    v26 = v34;

  }
  return v24;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HDCodableUserDomainConcept *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  HDCodableUserDomainConcept *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v48;
  objc_class *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62[4];
  id v63;
  uint64_t *v64;
  uint64_t *v65;
  int64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint8_t v79[128];
  uint8_t buf[4];
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  -[HDEntityEncoder profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDEntityEncoder transaction](self, "transaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v8;
  v10 = v9;
  v11 = (void *)objc_opt_self();
  v12 = objc_alloc_init(HDCodableUserDomainConcept);
  HDSQLiteColumnWithNameAsData();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConcept setUuid:](v12, "setUuid:", v13);

  v14 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D48]), "initWithCode:schema:", v14, v52);
  objc_msgSend(v51, "codableRepresentationForSync");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConcept setIdentifier:](v12, "setIdentifier:", v15);

  -[HDCodableUserDomainConcept setDeleted:](v12, "setDeleted:", HDSQLiteColumnWithNameAsBoolean());
  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableUserDomainConcept setCreationDate:](v12, "setCreationDate:");
  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableUserDomainConcept setModificationDate:](v12, "setModificationDate:");
  -[HDCodableUserDomainConcept setMajorVersion:](v12, "setMajorVersion:", HDSQLiteColumnWithNameAsInt64());
  -[HDCodableUserDomainConcept setMinorVersion:](v12, "setMinorVersion:", HDSQLiteColumnWithNameAsInt64());
  -[HDCodableUserDomainConcept setPatchVersion:](v12, "setPatchVersion:", HDSQLiteColumnWithNameAsInt64());
  HDSQLiteColumnWithNameAsString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConcept setBuild:](v12, "setBuild:", v16);

  HDSQLiteColumnWithNameAsData();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConcept setLinksData:](v12, "setLinksData:", v17);

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v11, "privateDataEntities");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v79, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v55;
    while (2)
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v55 != v20)
          objc_enumerationMutation(v18);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v21), "addPropertyDataToCodable:userDomainConceptID:transaction:error:", v12, a3, v10, a5))
        {
          v37 = 0;
          goto LABEL_39;
        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v79, 16);
      if (v19)
        continue;
      break;
    }
  }

  objc_msgSend(v53, "daemon");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "userDomainConceptEntityRegistry");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "userDomainConceptEntityClassForTypeIdentifier:", v51);

  if (!v24
    || v24 == (void *)objc_opt_class()
    || !objc_msgSend(v24, "encodesCodableUserDomainConceptSubclassData"))
  {
    goto LABEL_33;
  }
  v25 = v10;
  v26 = v53;
  objc_opt_self();
  objc_msgSend(v24, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", v26, v25, 0, 0, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v27;
  v29 = v25;
  objc_opt_self();
  v49 = (objc_class *)objc_msgSend(v28, "entityClass");
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__185;
  v77 = __Block_byref_object_dispose__185;
  v78 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__185;
  v71 = __Block_byref_object_dispose__185;
  v72 = 0;
  v50 = (void *)objc_msgSend([v49 alloc], "initWithPersistentID:", a3);
  objc_msgSend(v28, "orderedProperties");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "protectedDatabase");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = (id)MEMORY[0x1E0C809B0];
  v62[1] = (id)3221225472;
  v62[2] = __97__HDUserDomainConceptEntity__codableSubclassForForUserDomainConceptID_encoder_transaction_error___block_invoke;
  v62[3] = &unk_1E6D0D6E0;
  v64 = &v73;
  v32 = v28;
  v63 = v32;
  v65 = &v67;
  v66 = a3;
  LOBYTE(v28) = objc_msgSend(v50, "getValuesForProperties:database:error:handler:", v30, v31, a5, v62);

  if ((v28 & 1) != 0)
  {
    if (v74[5])
    {
      v48 = v32;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      -[objc_class privateDataEntities](v49, "privateDataEntities");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, buf, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v59;
        while (2)
        {
          v36 = 0;
          do
          {
            if (*(_QWORD *)v59 != v35)
              objc_enumerationMutation(v33);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v36), "addPropertyDataToCodable:userDomainConceptID:transaction:error:", v74[5], a3, v29, a5) & 1) == 0)
            {

              v32 = v48;
              goto LABEL_30;
            }
            ++v36;
          }
          while (v34 != v36);
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, buf, 16);
          if (v34)
            continue;
          break;
        }
      }

      v32 = v48;
      v37 = (HDCodableUserDomainConcept *)(id)v74[5];
      goto LABEL_31;
    }
    v38 = (id)v68[5];
    v39 = v38;
    if (v38)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v38);
      else
        _HKLogDroppedError();
    }

  }
LABEL_30:
  v37 = 0;
LABEL_31:

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  if (!v37)
    goto LABEL_40;
  -[HDCodableUserDomainConcept data](v37, "data");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConcept setTypeData:](v12, "setTypeData:", v40);

LABEL_33:
  v41 = HDSQLiteColumnWithNameAsInt64();
  objc_msgSend(v53, "syncIdentityManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = 0;
  objc_msgSend(v42, "identityForEntityID:transaction:error:", v41, v10, v62);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v62[0];

  if (v43)
  {
    objc_msgSend(v43, "identity");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "codableSyncIdentity");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableUserDomainConcept setSyncIdentity:](v12, "setSyncIdentity:", v45);

    v37 = v12;
  }
  else
  {
    _HKInitializeLogging();
    v46 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v81 = v18;
      _os_log_fault_impl(&dword_1B7802000, v46, OS_LOG_TYPE_FAULT, "Unable to fetch sync identity from HDUserDomainConceptEntity %{public}@", buf, 0xCu);
    }
    v37 = 0;
  }

LABEL_39:
LABEL_40:

  return v37;
}

@end
