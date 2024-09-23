@implementation HDECGSampleEntity

+ (id)databaseTable
{
  return CFSTR("ecg_samples");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_105;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("data_id");
  +[HDDataEntity defaultForeignKey](HDSampleEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDECGSampleEntity.m"), 70, CFSTR("Subclasses must override %s"), "+[HDECGSampleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v24 = v12;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __83__HDECGSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v25[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v25[4] = a1;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __83__HDECGSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2;
  v22[3] = &unk_1E6CE7750;
  v23 = v14;
  v16 = v12;
  v17 = v14;
  if (objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", insertDataObject_withProvenance_inDatabase_persistentID_error__insertKey_6, a7, v25, v22, 0))v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  return v19;
}

id __83__HDECGSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?)"), v2, CFSTR("data_id"), CFSTR("private_classification"), CFSTR("average_heart_rate"), CFSTR("voltage_payload"), CFSTR("symptoms_status"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __83__HDECGSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;

  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "privateClassification"));
  objc_msgSend(*(id *)(a1 + 40), "averageHeartRate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "averageHeartRate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "_countPerMinuteUnit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValueForUnit:", v6);
    sqlite3_bind_double(a2, 3, v7);

  }
  else
  {
    sqlite3_bind_null(a2, 3);
  }

  objc_msgSend(*(id *)(a1 + 40), "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HDSQLiteValueForData();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_int64(a2, 5, objc_msgSend(*(id *)(a1 + 40), "symptomsStatus"));
}

+ (BOOL)_insertECGWithCodableBinarySample:(id)a3 syncStore:(id)a4 profile:(id)a5 provenance:(id)a6 error:(id *)a7
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  BOOL v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v50;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  id v54;
  _QWORD v55[3];

  v55[2] = *MEMORY[0x1E0C80C00];
  v48 = a6;
  v9 = a5;
  v10 = a3;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB6AD8], "createWithCodable:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CB7278];
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7278]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setPrivateClassification:", objc_msgSend(v14, "integerValue"));

  objc_msgSend(v11, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0CB7288];
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7288]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "integerValue");

  objc_msgSend(v11, "_setSymptomsStatus:", HKElectrocardiogramSymptomsStatusFromPrivateElectrocardiogramSymptoms());
  objc_msgSend(v11, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0CB7280];
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7280]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v11, "_setAverageHeartRate:", v20);

  v21 = v11;
  objc_opt_self();
  objc_msgSend(v21, "metadata");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v16);
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    v46 = v13;
    objc_msgSend(v21, "metadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v16);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "integerValue");

    if (!v27)
    {
      v33 = 0;
      v13 = v46;
      goto LABEL_9;
    }
    objc_msgSend(v21, "metadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v16);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "integerValue");

    _HKCategoryTypesForSymptomsBitmask();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v21;
    v22 = v30;
    objc_opt_self();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __66__HDECGSampleEntity__symptomSamplesForSymptomTypes_withValue_ecg___block_invoke;
    v51[3] = &unk_1E6D10BB8;
    v52 = v31;
    v53 = 0;
    v32 = v31;
    objc_msgSend(v22, "hk_map:", v51);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v46;
  }
  else
  {
    v33 = 0;
  }

LABEL_9:
  v34 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v21, "metadata");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v34, "initWithDictionary:", v35);

  v55[0] = v13;
  v55[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "removeObjectsForKeys:", v37);

  objc_msgSend(v21, "_setMetadata:", v36);
  objc_msgSend(v33, "hk_map:", &__block_literal_global_244);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v45 = +[HDAssociationEntity associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:](HDAssociationEntity, "associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:", v47, v38, 0, 0, &v50, v9, a7);
  v39 = v50;

  objc_msgSend(v9, "dataManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "arrayByAddingObjectsFromArray:", v33);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_creationDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "timeIntervalSinceReferenceDate");
  LOBYTE(v39) = objc_msgSend(v40, "insertDataObjects:withProvenance:creationDate:error:", v42, v48, a7);

  return v45 & v39;
}

uint64_t __90__HDECGSampleEntity__insertECGWithCodableBinarySample_syncStore_profile_provenance_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

id __66__HDECGSampleEntity__symptomSamplesForSymptomTypes_withValue_ecg___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
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
  char v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB6378];
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categorySampleWithType:value:startDate:endDate:device:metadata:", v6, v4, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setCreationDate:", v12);

  objc_msgSend(*(id *)(a1 + 32), "sourceRevision");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setSourceRevision:", v13);

  v20[0] = 0;
  v20[1] = 0;
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getUUIDBytes:", v20);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v20, 16);
  LOBYTE(v13) = objc_msgSend(v6, "code");

  v19 = (char)v13;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "hk_v3UUIDWithNameSpace:name:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setUUID:", v17);

  return v11;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "ecgSamples");
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addEcgSamples:", a3);
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDECGSampleEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDECGSampleEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

@end
