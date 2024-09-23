@implementation HDCategorySampleEntity

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

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDCategorySampleEntity.m"), 59, CFSTR("Subclasses must override %s"), "+[HDCategorySampleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __88__HDCategorySampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v22[3] = &unk_1E6CE7750;
  v23 = v14;
  v24 = v12;
  v16 = v12;
  v17 = v14;
  if (objc_msgSend(v13, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO category_samples (data_id, value) VALUES (?, ?)"), a7, v22, 0))v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  return v19;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addCategorySamples:", a3);
  return a3 != 0;
}

uint64_t __88__HDCategorySampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  return sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "value"));
}

+ (id)databaseTable
{
  return CFSTR("category_samples");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_8;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "categorySamples");
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDCategorySampleEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[_HDCategorySampleEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDCategorySampleEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0CB6978];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "_allTypesOfClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(a1, "validateEntitiesOfTypes:profile:error:validationErrorHandler:", v11, v10, a4, v9);

  return (char)a4;
}

@end
