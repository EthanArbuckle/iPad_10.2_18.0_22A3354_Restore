@implementation HDMedicalRecordEntity

+ (id)databaseTable
{
  return CFSTR("medical_records");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 13;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_74;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  SEL v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  SEL v53;
  id v54;
  id v55;
  _QWORD v56[15];

  v56[13] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDMedicalRecordEntity.m"), 96, CFSTR("Subclasses must override %s"), "+[HDMedicalRecordEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v56[0] = CFSTR("data_id");
  v56[1] = CFSTR("note");
  v56[2] = CFSTR("entered_in_error");
  v56[3] = CFSTR("modified_date");
  v56[4] = CFSTR("fhir_identifier");
  v56[5] = CFSTR("original_fhir_resource_rowid");
  v56[6] = CFSTR("original_signed_clinical_data_rowid");
  v56[7] = CFSTR("locale");
  v56[8] = CFSTR("extraction_version");
  v56[9] = CFSTR("sort_date");
  v56[10] = CFSTR("sort_date_key_path");
  v56[11] = CFSTR("country");
  v56[12] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "FHIRIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = a2;
  if (v17)
  {
    objc_msgSend(v12, "FHIRIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringValue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v46 = 0;
  }
  objc_msgSend(v12, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0CB72D8];
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72D8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(v12, "originIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "signedClinicalDataRecordIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v44 = v16;
      v36 = v13;
      v23 = v14;
      objc_msgSend(v12, "originIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "signedClinicalDataRecordIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0;
      v22 = v36;
      +[HDOriginalSignedClinicalDataRecordEntity entityWithSyncIdentifier:database:error:](HDOriginalSignedClinicalDataRecordEntity, "entityWithSyncIdentifier:database:error:", v38, v36, &v55);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v55;

      if (v25)
      {
        v27 = objc_msgSend(v25, "persistentID");
        v26 = 0;
        goto LABEL_8;
      }
      if (v24)
      {
        v14 = v23;
        if (a7)
          *a7 = objc_retainAutorelease(v24);
        else
          _HKLogDroppedError();
      }
      else
      {
        v39 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v12, "originIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "signedClinicalDataRecordIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "hk_assignError:code:format:", a7, 118, CFSTR("Original signed clinical data record with sync identifier %@ does not exist"), v41);

        v14 = v23;
      }
      v13 = v22;

      v33 = 0;
      v16 = v44;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a7, 100, CFSTR("Attempting to save a medical record without an origin."));
      v33 = 0;
    }
    v29 = v46;
    goto LABEL_23;
  }
  v44 = v16;
  v22 = v13;
  v23 = v14;
  objc_msgSend(v12, "metadata");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "longLongValue");
  v27 = 0;
LABEL_8:

  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __87__HDMedicalRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v47[3] = &unk_1E6D00ED0;
  v14 = v23;
  v28 = v23;
  v48 = v28;
  v49 = v12;
  v29 = v46;
  v50 = v46;
  v51 = v26;
  v52 = v27;
  v53 = v45;
  v54 = a1;
  v13 = v22;
  v30 = v22;
  v16 = v44;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v30, v44, a7, v47);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    v32 = v28;
  else
    v32 = 0;
  v33 = v32;

LABEL_23:
  return v33;
}

void __87__HDMedicalRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  MEMORY[0x1BCCAB114](a2, CFSTR("data_id"), objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(*(id *)(a1 + 40), "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("note"), v4);

  MEMORY[0x1BCCAB0CC](a2, CFSTR("entered_in_error"), objc_msgSend(*(id *)(a1 + 40), "enteredInError"));
  objc_msgSend(*(id *)(a1 + 40), "modifiedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("modified_date"), v5);

  objc_msgSend(*(id *)(a1 + 40), "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("locale"), v7);

  MEMORY[0x1BCCAB114](a2, CFSTR("extraction_version"), objc_msgSend(*(id *)(a1 + 40), "extractionVersion"));
  objc_msgSend(*(id *)(a1 + 40), "sortDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("sort_date"), v9);

  objc_msgSend(*(id *)(a1 + 40), "sortDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("sort_date_key_path"), v11);

  objc_msgSend(*(id *)(a1 + 40), "country");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("country"), v12);

  MEMORY[0x1BCCAB114](a2, CFSTR("state"), objc_msgSend(*(id *)(a1 + 40), "state"));
  MEMORY[0x1BCCAB144](a2, CFSTR("fhir_identifier"), *(_QWORD *)(a1 + 48));
  if (*(uint64_t *)(a1 + 56) >= 1)
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("original_signed_clinical_data_rowid"));
    goto LABEL_6;
  }
  if (*(uint64_t *)(a1 + 64) >= 1)
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("original_fhir_resource_rowid"));
LABEL_6:
    JUMPOUT(0x1BCCAB114);
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), CFSTR("HDMedicalRecordEntity.m"), 176, CFSTR("No OrignalFHIRResource or OriginalSignedClinicalDataRecord ROWID provided for FK on insert"));

}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("original_fhir_resource_rowid");
  +[HDHealthEntity defaultForeignKey](HDOriginalFHIRResourceEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("original_signed_clinical_data_rowid");
  v7[0] = v2;
  +[HDHealthEntity defaultForeignKey](HDOriginalSignedClinicalDataRecordEntity, "defaultForeignKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)checkConstraints
{
  void *v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0D298A8], "checkConstraintWithSQL:", CFSTR("(original_fhir_resource_rowid IS NOT NULL AND original_signed_clinical_data_rowid IS NULL) OR (original_fhir_resource_rowid IS NULL AND original_signed_clinical_data_rowid IS NOT NULL)"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)_latestDateForProperty:(void *)a3 sampleTypes:(void *)a4 profile:(uint64_t)a5 error:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  char v16;
  id v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  void *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_opt_self();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__latestDateForProperty_sampleTypes_profile_error_, v11, CFSTR("HDMedicalRecordEntity.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile"));

  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__146;
  v29 = __Block_byref_object_dispose__146;
  v30 = 0;
  HDSampleEntityPredicateForDataTypes(v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__HDMedicalRecordEntity__latestDateForProperty_sampleTypes_profile_error___block_invoke;
  v20[3] = &unk_1E6D00EF8;
  v24 = v11;
  v14 = v8;
  v21 = v14;
  v15 = v12;
  v22 = v15;
  v23 = &v25;
  v16 = objc_msgSend(v11, "performReadTransactionWithHealthDatabase:error:block:", v13, a5, v20);

  if ((v16 & 1) != 0)
    v17 = (id)v26[5];
  else
    v17 = 0;

  _Block_object_dispose(&v25, 8);
  return v17;
}

uint64_t __74__HDMedicalRecordEntity__latestDateForProperty_sampleTypes_profile_error___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v17;

  v5 = (void *)a1[7];
  v6 = a1[4];
  v7 = a1[5];
  objc_msgSend(a2, "databaseForEntityClass:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v5, "maxValueForProperty:predicate:database:error:", v6, v7, v8, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;

  if (v9)
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v9, "doubleValue");
    v12 = objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
    v13 = *(_QWORD *)(a1[6] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

LABEL_3:
    v15 = 1;
    goto LABEL_4;
  }
  if (!v10)
    goto LABEL_3;
  if (a3)
  {
    v15 = 0;
    *a3 = objc_retainAutorelease(v10);
  }
  else
  {
    _HKLogDroppedError();
    v15 = 0;
  }
LABEL_4:

  return v15;
}

+ (id)latestCreationDateWithProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "futureMigrationsEnabled"))
    v9 = 8;
  else
    v9 = 0;

  objc_msgSend(MEMORY[0x1E0CB6B00], "medicalRecordTypesWithOptions:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMedicalRecordEntity _latestDateForProperty:sampleTypes:profile:error:]((uint64_t)a1, CFSTR("creation_date"), v10, v6, (uint64_t)a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)latestModifiedDateWithProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "futureMigrationsEnabled"))
    v9 = 8;
  else
    v9 = 0;

  objc_msgSend(MEMORY[0x1E0CB6B00], "medicalRecordTypesWithOptions:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMedicalRecordEntity _latestDateForProperty:sampleTypes:profile:error:]((uint64_t)a1, CFSTR("modified_date"), v10, v6, (uint64_t)a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)medicalRecordWithAttachmentObjectIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  char v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v33 = 0;
  v34 = 0;
  v32 = 0;
  v9 = objc_msgSend(MEMORY[0x1E0CB62D8], "componentsFromAttachmentObjectIdentifier:sampleTypeIdentifier:bundleIdentifier:FHIRIdentifier:", a3, &v34, &v33, &v32);
  v10 = v34;
  v11 = v33;
  v12 = v32;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 2000, CFSTR("Failed parse attachment objectIdentifier into components"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v24;
    if (v24)
    {
      if (a5)
      {
        v15 = objc_retainAutorelease(v24);
        v23 = 0;
        *a5 = v15;
      }
      else
      {
        _HKLogDroppedError();
        v23 = 0;
      }
      v14 = v15;
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB6868], "medicalTypeForIdentifier:", v10);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Invalid medicalType identifier: %@"), v10);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

LABEL_22:
    v14 = 0;
    goto LABEL_23;
  }
  v14 = (id)v13;
  objc_msgSend(a1, "predicateForObjectsFromLocalSourceWithBundleIdentifier:profile:error:", v11, v8, a5);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
LABEL_23:
    v23 = 0;
    goto LABEL_24;
  }
  v16 = v12;
  v14 = v14;
  v17 = v8;
  v15 = v15;
  v28 = objc_opt_self();
  v31 = v16;
  HDMedicalRecordEntityPredicateForFHIRIdentifier(v16);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = CFSTR("SkipApplyingConceptIndex");
  v40[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v17;
  +[HDSampleEntity samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:](HDMedicalRecordEntity, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v14, v17, v19, v18, 0, 0, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20 && objc_msgSend(v20, "count"))
  {
    if ((unint64_t)objc_msgSend(v21, "count") >= 2)
    {
      _HKInitializeLogging();
      v22 = (void *)*MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_FAULT))
      {
        v26 = v22;
        HKSensitiveLogItem();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v28;
        v37 = 2114;
        v38 = v27;
        _os_log_fault_impl(&dword_1B7802000, v26, OS_LOG_TYPE_FAULT, "%{public}@ Unexpectedly found more than 1 medical record for FHIR resource %{public}@!", buf, 0x16u);

      }
    }
    objc_msgSend(v21, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

LABEL_24:
  return v23;
}

+ (id)attachmentObjectIdentifierForSampleWithUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_class();
  v15 = CFSTR("SkipApplyingConceptIndex");
  v16[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectWithUUID:encodingOptions:profile:error:", v9, v11, v8, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "attachmentObjectIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)willDeleteWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDMedicalRecordEntity;
  return -[HDHealthEntity willDeleteWithProfile:transaction:error:](&v6, sel_willDeleteWithProfile_transaction_error_, a3, a4, a5);
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDMedicalRecordEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[_HDMedicalRecordEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDMedicalRecordEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB53D0]);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0D29888];
    v8 = objc_opt_class();
    v9 = objc_msgSend(v4, "ascending");
    v10 = CFSTR("modified_date");
  }
  else
  {
    objc_msgSend(v4, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB53D8]);

    if (!v12)
    {
      v16.receiver = a1;
      v16.super_class = (Class)&OBJC_METACLASS___HDMedicalRecordEntity;
      objc_msgSendSuper2(&v16, sel_orderingTermForSortDescriptor_, v4);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v7 = (void *)MEMORY[0x1E0D29888];
    v8 = objc_opt_class();
    v9 = objc_msgSend(v4, "ascending");
    v10 = CFSTR("sort_date");
  }
  objc_msgSend(v7, "orderingTermWithProperty:entityClass:ascending:", v10, v8, v9);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v14 = (void *)v13;

  return v14;
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
  objc_super v13;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("user_domain_concepts.uuid")))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E20]);
    +[HDMedicalUserDomainConceptMappingEntity joinClausesForProperty:](HDMedicalUserDomainConceptMappingEntity, "joinClausesForProperty:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithSet:", v6);

    v8 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v9, objc_opt_class(), 0, CFSTR("data_id"), CFSTR("data_id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

    v11 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___HDMedicalRecordEntity;
    objc_msgSendSuper2(&v13, sel_joinClausesForProperty_, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end
