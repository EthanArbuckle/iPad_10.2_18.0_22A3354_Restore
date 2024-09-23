@implementation HDClinicalRecordEntity

+ (id)databaseTable
{
  return CFSTR("clinical_record_samples");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 12;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_86;
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

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("originalFHIRResource.id")))
  {
    v5 = (void *)MEMORY[0x1E0D29870];
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDClinicalRecordEntity, "disambiguatedDatabaseTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v6, objc_opt_class(), CFSTR("originalFHIRResource"), CFSTR("original_fhir_resource_rowid"), *MEMORY[0x1E0D29618]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v7, 0);
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___HDClinicalRecordEntity;
    objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  SEL v44;
  id v45;
  _QWORD v46[14];

  v46[12] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDClinicalRecordEntity.m"), 95, CFSTR("Subclasses must override %s"), "+[HDClinicalRecordEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v46[0] = CFSTR("data_id");
  v46[1] = CFSTR("display_name");
  v46[2] = CFSTR("fhir_resource_fhir_version_major");
  v46[3] = CFSTR("fhir_resource_fhir_version_minor");
  v46[4] = CFSTR("fhir_resource_fhir_version_patch");
  v46[5] = CFSTR("fhir_resource_resource_type");
  v46[6] = CFSTR("fhir_resource_identifier");
  v46[7] = CFSTR("fhir_resource_data");
  v46[8] = CFSTR("fhir_resource_source_url");
  v46[9] = CFSTR("fhir_resource_last_updated_date");
  v46[10] = CFSTR("original_fhir_resource_rowid");
  v46[11] = CFSTR("original_signed_clinical_data_rowid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CB72D8];
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72D8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19
    || (objc_msgSend(v12, "metadata"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v20, "objectForKeyedSubscript:", v18),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "longLongValue"),
        v21,
        v20,
        !v22))
  {
    objc_msgSend(v12, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0CB72E0];
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72E0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v12, "metadata");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v27, "initWithUUIDString:", v29);

      +[HDOriginalSignedClinicalDataRecordEntity existingEntityWithSyncIdentifier:database:error:](HDOriginalSignedClinicalDataRecordEntity, "existingEntityWithSyncIdentifier:database:error:", v30, v13, a7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {

        goto LABEL_16;
      }
      v32 = v31;
      v23 = objc_msgSend(v31, "persistentID");

      if (v23)
      {
        v22 = 0;
        goto LABEL_10;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a7, 118, CFSTR("No OrignalFHIRResource or OriginalSignedClinicalDataRecord ROWID provided for FK on insert"));
LABEL_16:
    v36 = 0;
    goto LABEL_17;
  }
  v23 = 0;
LABEL_10:
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __88__HDClinicalRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v39[3] = &unk_1E6D09C48;
  v33 = v14;
  v40 = v33;
  v41 = v12;
  v42 = v22;
  v43 = v23;
  v44 = a2;
  v45 = a1;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v13, v16, a7, v39);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    v35 = v33;
  else
    v35 = 0;
  v36 = v35;

LABEL_17:
  return v36;
}

void __88__HDClinicalRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  MEMORY[0x1BCCAB114](a2, CFSTR("data_id"), objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(*(id *)(a1 + 40), "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("display_name"), v4);

  objc_msgSend(*(id *)(a1 + 40), "FHIRResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "FHIRVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB114](a2, CFSTR("fhir_resource_fhir_version_major"), objc_msgSend(v6, "majorVersion"));

  objc_msgSend(*(id *)(a1 + 40), "FHIRResource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "FHIRVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB114](a2, CFSTR("fhir_resource_fhir_version_minor"), objc_msgSend(v8, "minorVersion"));

  objc_msgSend(*(id *)(a1 + 40), "FHIRResource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "FHIRVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB114](a2, CFSTR("fhir_resource_fhir_version_patch"), objc_msgSend(v10, "patchVersion"));

  objc_msgSend(*(id *)(a1 + 40), "FHIRResource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resourceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("fhir_resource_resource_type"), v12);

  objc_msgSend(*(id *)(a1 + 40), "FHIRResource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("fhir_resource_identifier"), v14);

  objc_msgSend(*(id *)(a1 + 40), "FHIRResource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0D8](a2, CFSTR("fhir_resource_data"), v16);

  objc_msgSend(*(id *)(a1 + 40), "FHIRResource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sourceURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "absoluteString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("fhir_resource_source_url"), v19);

  objc_msgSend(*(id *)(a1 + 40), "FHIRResource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastUpdatedDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("fhir_resource_last_updated_date"), v21);

  if (*(uint64_t *)(a1 + 48) >= 1)
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("original_signed_clinical_data_rowid"));
    JUMPOUT(0x1BCCAB114);
  }
  if (*(uint64_t *)(a1 + 56) >= 1)
  {
    MEMORY[0x1BCCAB114](a2, CFSTR("original_signed_clinical_data_rowid"));
    JUMPOUT(0x1BCCAB120);
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), CFSTR("HDClinicalRecordEntity.m"), 164, CFSTR("No OrignalFHIRResource or OriginalSignedClinicalDataRecord ROWID provided for FK on insert"));

}

+ (id)clinicalRecordWithAttachmentObjectIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  char v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v21;
  id v22;
  id v23;

  v8 = a4;
  v22 = 0;
  v23 = 0;
  v21 = 0;
  v9 = objc_msgSend(MEMORY[0x1E0CB62D8], "componentsFromAttachmentObjectIdentifier:sampleTypeIdentifier:bundleIdentifier:FHIRIdentifier:", a3, &v23, &v22, &v21);
  v10 = v23;
  v11 = v22;
  v12 = v21;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB6B00], "clinicalTypeForIdentifier:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Invalid clinicalType identifier: %@"), v10);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v15 = v19;
      if (v19)
      {
        if (a5)
        {
          v15 = objc_retainAutorelease(v19);
          v17 = 0;
          *a5 = v15;
        }
        else
        {
          _HKLogDroppedError();
          v17 = 0;
        }
        v14 = v15;
      }
      else
      {
        v14 = 0;
        v17 = 0;
      }
      goto LABEL_18;
    }
    objc_msgSend(a1, "predicateForObjectsFromLocalSourceWithBundleIdentifier:profile:error:", v11, v8, a5);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(a1, "_predicateForRecordWithFHIRResourceIdentifier:", v12);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_clinicalRecordForSampleType:predicate:profile:error:", v13, v16, v8, a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 2000, CFSTR("Failed parse attachment objectIdentifier into components"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v18;
  if (!v18)
  {
    v13 = 0;
LABEL_14:
    v17 = 0;
    goto LABEL_19;
  }
  if (a5)
  {
    v14 = objc_retainAutorelease(v18);
    v17 = 0;
    *a5 = v14;
  }
  else
  {
    _HKLogDroppedError();
    v17 = 0;
  }
  v13 = v14;
LABEL_19:

  return v17;
}

+ (id)attachmentObjectIdentifierForSampleWithUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "objectWithUUID:encodingOptions:profile:error:", v9, 0, v8, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "attachmentObjectIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)existingClinicalRecordCreatedFromResourceWithIdentifier:(id)a3 basePredicate:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  id v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a1, "_predicateForRecordWithFHIRResourceIdentifier:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB63D8];
  objc_msgSend(v10, "resourceType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sampleTypesForResourceType:error:", v16, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v28 = v13;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v19)
    {
      v20 = v19;
      v26 = v11;
      v27 = v10;
      v21 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(a1, "_clinicalRecordForSampleType:predicate:profile:error:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v14, v12, a6);
          v23 = objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = (void *)v23;
            goto LABEL_12;
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v20)
          continue;
        break;
      }
      v24 = 0;
LABEL_12:
      v11 = v26;
      v10 = v27;
    }
    else
    {
      v24 = 0;
    }

    v13 = v28;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)_clinicalRecordForSampleType:(id)a3 predicate:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  +[HDSampleEntity samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:](HDSampleEntity, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v10, a5, 0, a4, 0, 0, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && objc_msgSend(v11, "count"))
  {
    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        v17 = a1;
        v18 = 2114;
        v19 = v10;
        _os_log_fault_impl(&dword_1B7802000, v13, OS_LOG_TYPE_FAULT, "%{public}@ Unexpectedly found more than 1 clinical record for clinical sampleType %{public}@!", buf, 0x16u);
      }
    }
    objc_msgSend(v12, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_predicateForRecordWithFHIRResourceIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D29838];
  v4 = a3;
  objc_msgSend(v4, "resourceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("fhir_resource_resource_type"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "predicateWithProperty:equalToValue:", CFSTR("fhir_resource_identifier"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D29840];
  v14[0] = v9;
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateMatchingAllPredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDClinicalRecordEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDClinicalRecordEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

@end
