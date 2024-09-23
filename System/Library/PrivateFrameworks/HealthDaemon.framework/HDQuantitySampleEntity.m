@implementation HDQuantitySampleEntity

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
  char v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  char v35;

  v12 = a5;
  v13 = a6;
  v14 = a3;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDQuantitySampleEntity.m"), 89, CFSTR("Subclasses must override %s"), "+[HDQuantitySampleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  objc_msgSend(v14, "quantity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_unit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "quantityType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "canonicalUnit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v17, "isEqual:", v19);
  if ((v20 & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(v17, "unitString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDUnitStringEntity storeUnitString:database:error:](HDUnitStringEntity, "storeUnitString:database:error:", v22, v12, a7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v26 = 0;
      goto LABEL_10;
    }
  }
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __88__HDQuantitySampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v29[3] = &unk_1E6D11518;
  v23 = v13;
  v30 = v23;
  v31 = v16;
  v32 = v19;
  v35 = v20;
  v33 = v17;
  v34 = v21;
  v24 = v21;
  if (objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO quantity_samples (data_id, quantity, original_quantity, original_unit) VALUES (?, ?, ?, ?)"), a7, v29, 0))v25 = v23;
  else
    v25 = 0;
  v26 = v25;

LABEL_10:
  return v26;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("unit_strings.unit_string")))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = (void *)MEMORY[0x1E0D29870];
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDQuantitySampleEntity, "disambiguatedDatabaseTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v7, objc_opt_class(), CFSTR("unit_strings"), CFSTR("original_unit"), *MEMORY[0x1E0D29618]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___HDQuantitySampleEntity;
    objc_msgSendSuper2(&v11, sel_joinClausesForProperty_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addQuantitySamples:", a3);
  return a3 != 0;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "quantitySamples");
}

+ (id)databaseTable
{
  return CFSTR("quantity_samples");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_109;
}

+ (id)foreignKeys
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("original_unit");
  v2 = objc_alloc(MEMORY[0x1E0D29858]);
  v3 = (void *)objc_msgSend(v2, "initWithEntityClass:property:deletionAction:", objc_opt_class(), *MEMORY[0x1E0D29618], 0);
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "ascending");
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5A30]))
  {
    objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("quantity"), objc_opt_class(), v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___HDQuantitySampleEntity;
    objc_msgSendSuper2(&v10, sel_orderingTermForSortDescriptor_, v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

uint64_t __88__HDQuantitySampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;
  double v6;

  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(*(id *)(a1 + 40), "doubleValueForUnit:", *(_QWORD *)(a1 + 48));
  sqlite3_bind_double(a2, 2, v4);
  if (*(_BYTE *)(a1 + 72))
  {
    sqlite3_bind_null(a2, 3);
    return sqlite3_bind_null(a2, 4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "doubleValueForUnit:", *(_QWORD *)(a1 + 56));
    sqlite3_bind_double(a2, 3, v6);
    return sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 64), "longLongValue"));
  }
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDQuantitySampleEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDQuantitySampleEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (int64_t)compareForReplacmentWithObject:(id)a3 existingObject:(id)a4
{
  id v7;
  id v8;
  int64_t v9;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDQuantitySampleEntity.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[replacementObject isKindOfClass:[HKQuantitySample class]]"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDQuantitySampleEntity.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[existingObject isKindOfClass:[HKQuantitySample class]]"));

  }
  v9 = objc_msgSend(v7, "_compareFreezeStateWithSample:", v8);

  return v9;
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
