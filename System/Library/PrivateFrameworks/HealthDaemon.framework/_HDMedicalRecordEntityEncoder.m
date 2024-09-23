@implementation _HDMedicalRecordEntityEncoder

- (_HDMedicalRecordEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8
{
  id v14;
  _HDMedicalRecordEntityEncoder *v15;
  void *v16;
  objc_super v18;

  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)_HDMedicalRecordEntityEncoder;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:](&v18, sel_initWithHealthEntityClass_profile_transaction_purpose_encodingOptions_authorizationFilter_, a3, a4, a5, a6, v14, a8);
  if (v15)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("SkipApplyingConceptIndex"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_skipApplyingConceptIndex = objc_msgSend(v16, "BOOLValue");

  }
  return v15;
}

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[13];

  v8[12] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("note");
  v8[1] = CFSTR("entered_in_error");
  v8[2] = CFSTR("modified_date");
  v8[3] = CFSTR("fhir_identifier");
  v8[4] = CFSTR("original_fhir_resource_rowid");
  v8[5] = CFSTR("original_signed_clinical_data_rowid");
  v8[6] = CFSTR("locale");
  v8[7] = CFSTR("extraction_version");
  v8[8] = CFSTR("sort_date");
  v8[9] = CFSTR("sort_date_key_path");
  v8[10] = CFSTR("country");
  v8[11] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6858]), "_init");
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  id v35;
  id v36;
  id v37;
  id obja;
  id obj;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  uint64_t *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[4];
  int64_t v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  -[_HDMedicalRecordEntityEncoder createBareObjectWithRow:](self, "createBareObjectWithRow:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[_HDMedicalRecordEntityEncoder applyPropertiesToObject:persistentID:row:error:](self, "applyPropertiesToObject:persistentID:row:error:", v9, a3, a4, a5))goto LABEL_46;
  if (!self->_skipApplyingConceptIndex)
  {
    -[HDEntityEncoder profile](self, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v11 = v9;
    v12 = v10;
    v13 = objc_opt_self();
    v42 = v11;
    objc_msgSend(v11, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDConceptIndexEntity conceptIndexEntriesForSampleUUID:type:profile:error:](HDConceptIndexEntity, "conceptIndexEntriesForSampleUUID:type:profile:error:", v14, 0, v12, &v43);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v12, "ontologyConceptManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "count") || v41)
      {
        if (objc_msgSend(v15, "count"))
        {
          objc_msgSend(v15, "hk_mapToSet:", &__block_literal_global_176);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v40, "count") == 1)
          {
            objc_msgSend(v40, "anyObject");
            obja = (id)objc_claimAutoreleasedReturnValue();
            v17 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v15, "hk_map:", &__block_literal_global_312);
            v18 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setWithArray:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v55 = 0;
            v56 = &v55;
            v57 = 0x3032000000;
            v58 = __Block_byref_object_copy__146;
            v59 = __Block_byref_object_dispose__146;
            v60 = 0;
            objc_msgSend(v12, "ontologyDatabase");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = 0;
            v48[0] = MEMORY[0x1E0C809B0];
            v48[1] = 3221225472;
            v48[2] = __74___HDMedicalRecordEntityEncoder__applyConceptIndexToObject_profile_error___block_invoke_3;
            v48[3] = &unk_1E6D00F80;
            v52 = &v55;
            v53 = v13;
            v49 = v15;
            v35 = v19;
            v50 = v35;
            v37 = obja;
            v51 = v37;
            LOBYTE(v18) = objc_msgSend(v20, "performTransactionWithError:transactionHandler:", &v54, v48);
            v36 = v54;

            if ((v18 & 1) != 0)
            {
              v46 = 0u;
              v47 = 0u;
              v44 = 0u;
              v45 = 0u;
              obj = (id)v56[5];
              v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, buf, 16);
              if (v21)
              {
                v22 = *(_QWORD *)v45;
                while (2)
                {
                  for (i = 0; i != v21; ++i)
                  {
                    if (*(_QWORD *)v45 != v22)
                      objc_enumerationMutation(obj);
                    v24 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
                    objc_msgSend((id)v56[5], "objectForKeyedSubscript:", v24, v35);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v24) = objc_msgSend(v42, "applyConcepts:forKeyPath:error:", v25, v24, &v43);

                    if (!(_DWORD)v24)
                    {
                      v16 = 0;
                      goto LABEL_31;
                    }
                  }
                  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, buf, 16);
                  v16 = 1;
                  if (v21)
                    continue;
                  break;
                }
              }
              else
              {
                v16 = 1;
              }
LABEL_31:
              v28 = obj;
            }
            else
            {
              if (objc_msgSend(v36, "hk_isHealthKitErrorWithCode:", 1001))
                +[_HDMedicalRecordEntityEncoder _resetConceptIndexDueToError:profile:](v13, v36, v12);
              v28 = v36;
              if (v28)
              {
                v28 = objc_retainAutorelease(v28);
                v16 = 0;
                v43 = v28;
              }
              else
              {
                v16 = 0;
              }
            }

            _Block_object_dispose(&v55, 8);
            v27 = v35;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 1001, CFSTR("Concept index spans multiple ontology versions."));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[_HDMedicalRecordEntityEncoder _resetConceptIndexDueToError:profile:](v13, v26, v12);
            v27 = v26;
            if (v27)
            {
              v27 = objc_retainAutorelease(v27);
              v16 = 0;
              v43 = v27;
            }
            else
            {
              v16 = 0;
            }
            v37 = v27;
          }

        }
        else
        {
          v16 = 1;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v43, 3, CFSTR("Unable to lookup concepts without an ontology manager"));
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

    v29 = v43;
    if ((v16 & 1) != 0)
    {

      goto LABEL_38;
    }
    _HKInitializeLogging();
    v31 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349314;
      v62 = a3;
      v63 = 2114;
      v64 = v29;
      _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "Failed to apply concept index to medical record entity with persistent ID %{public}lld: %{public}@", buf, 0x16u);
    }
    v32 = v29;
    v33 = v32;
    if (v32)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v32);
      else
        _HKLogDroppedError();
    }

LABEL_46:
    v30 = 0;
    goto LABEL_47;
  }
LABEL_38:
  v30 = v9;
LABEL_47:

  return v30;
}

+ (void)_resetConceptIndexDueToError:(void *)a3 profile:
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  _HKInitializeLogging();
  HKLogHealthOntology();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HKSensitiveLogItem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Resetting concept index due to error %{public}@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(v5, "conceptIndexManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resetWithReindex");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HDOriginalSignedClinicalDataRecordEntity *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v33;
  HDOriginalSignedClinicalDataRecordEntity *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if ((_DWORD)a4)
  {
    HDSQLiteColumnWithNameAsString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setNote:", v12);

    objc_msgSend(v10, "_setEnteredInError:", HDSQLiteColumnWithNameAsBoolean());
    HDSQLiteColumnWithNameAsDate();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setModifiedDate:", v13);

    objc_msgSend(v10, "_setExtractionVersion:", HDSQLiteColumnWithNameAsInt64());
    HDSQLiteColumnWithNameAsString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(MEMORY[0x1E0CB6690], "FHIRIdentifierWithString:error:", v14, &v39);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v39;
    v38 = v16;
    if (v15)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6860]), "initWithFHIRIdentifier:", v15);
      objc_msgSend(v10, "_setOriginIdentifier:", v17);
LABEL_4:

      HDSQLiteColumnWithNameAsString();
      v18 = (HDOriginalSignedClinicalDataRecordEntity *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v18);
        objc_msgSend(v10, "_setLocale:", v19);

      }
      HDSQLiteColumnWithNameAsDate();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteColumnWithNameAsString();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v20 && v21)
      {
        objc_msgSend(MEMORY[0x1E0CB6B30], "semanticDateWithKeyPath:date:", v21, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_setSortDate:", v23);

      }
      HDSQLiteColumnWithNameAsString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(v10, "_setCountry:", v24);
      }
      else
      {
        _HKInitializeLogging();
        v31 = *MEMORY[0x1E0CB52D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "Attempting to apply properties to HDMedicalRecord, but country was nil", buf, 2u);
        }
      }
      objc_msgSend(v10, "_setState:", HDSQLiteColumnWithNameAsInt64());

      v25 = 1;
      goto LABEL_18;
    }
    v26 = v16;
    v27 = HDSQLiteColumnWithNameAsInt64();
    if (v27 < 1)
    {
      _HKInitializeLogging();
      v33 = (void *)*MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      {
        v35 = v33;
        v36 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v41 = v36;
        v42 = 2114;
        v43 = v26;
        v37 = v36;
        _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "%{public}@ invalid origin identifier, error: %{public}@", buf, 0x16u);

      }
      v34 = v26;
      v18 = v34;
      if (v34)
      {
        if (a6)
        {
          v18 = objc_retainAutorelease(v34);
          v25 = 0;
          *a6 = v18;
LABEL_18:

          goto LABEL_19;
        }
        _HKLogDroppedError();
      }
    }
    else
    {
      v28 = v27;
      v18 = -[HDSQLiteEntity initWithPersistentID:]([HDOriginalSignedClinicalDataRecordEntity alloc], "initWithPersistentID:", v27);
      -[HDEntityEncoder database](self, "database");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSQLiteEntity UUIDForProperty:database:](v18, "UUIDForProperty:database:", CFSTR("sync_identifier"), v29);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {

        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6860]), "initWithSignedClinicalDataRecordIdentifier:", v17);
        objc_msgSend(v10, "_setOriginIdentifier:", v30);

        goto LABEL_4;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 100, CFSTR("There is no original signed clinical data record with persistent id %lld"), v28);
    }
    v25 = 0;
    goto LABEL_18;
  }
  v25 = 0;
LABEL_19:

  return v25;
}

@end
