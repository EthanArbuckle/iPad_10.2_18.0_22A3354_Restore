@implementation HDScoredAssessmentEntity

+ (id)databaseTable
{
  return CFSTR("scored_assessment_samples");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_66;
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

+ (int64_t)protectionClass
{
  return 2;
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
  id v19;
  void *v20;
  id v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDScoredAssessmentEntity.m"), 73, CFSTR("Subclasses must override %s"), "+[HDScoredAssessmentEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v16 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(v12, "answers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __90__HDScoredAssessmentEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
    v28[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v28[4] = a1;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __90__HDScoredAssessmentEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2;
    v24[3] = &unk_1E6CE7C30;
    v19 = v14;
    v25 = v19;
    v26 = v12;
    v27 = v18;
    if (objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertDataObject_withProvenance_inDatabase_persistentID_error__insertKey_3, a7, v28, v24, 0))v20 = v19;
    else
      v20 = 0;
    v21 = v20;

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

id __90__HDScoredAssessmentEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (%@, %@, %@, %@) VALUES (?, ?, ?, ?)"), v2, CFSTR("data_id"), CFSTR("score"), CFSTR("answers"), CFSTR("risk"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __90__HDScoredAssessmentEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;

  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "score"));
  _HDSQLiteValueForData();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 40), "risk"));
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "scoredAssessmentSamples");
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addScoredAssessmentSamples:", a3);
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDScoredAssessmentEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDScoredAssessmentEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

@end
