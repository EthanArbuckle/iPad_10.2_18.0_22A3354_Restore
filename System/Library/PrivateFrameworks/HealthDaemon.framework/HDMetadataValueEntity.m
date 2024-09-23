@implementation HDMetadataValueEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)_insertMetadataValueWithKeyID:(int64_t)a3 objectID:(int64_t)a4 value:(id)a5 database:(id)a6 error:(id *)a7
{
  id v12;
  int v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  int64_t v25;
  int64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;

  v12 = a6;
  v32 = 0;
  v33 = 0;
  v30 = 0;
  v31 = 0;
  v29 = 0;
  v13 = +[HDMetadataValueEntity _determineMetadataTypeForValue:stringValue:numberValue:dateValue:dataValue:type:error:]((uint64_t)a1, a5, &v32, &v31, &v30, &v29, &v33, (uint64_t)a7);
  v14 = v32;
  v15 = v31;
  v16 = v30;
  v17 = v29;
  if (v13)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __85__HDMetadataValueEntity__insertMetadataValueWithKeyID_objectID_value_database_error___block_invoke;
    v28[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v28[4] = a1;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __85__HDMetadataValueEntity__insertMetadataValueWithKeyID_objectID_value_database_error___block_invoke_2;
    v20[3] = &unk_1E6CF7828;
    v25 = a3;
    v26 = a4;
    v21 = v14;
    v22 = v15;
    v23 = v16;
    v24 = v17;
    v27 = v33;
    v18 = objc_msgSend(v12, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_insertMetadataValueWithKeyID_objectID_value_database_error__insertKey, a7, v28, v20, 0);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

id __85__HDMetadataValueEntity__insertMetadataValueWithKeyID_objectID_value_database_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v5[0] = CFSTR("key_id");
  v5[1] = CFSTR("object_id");
  v5[2] = CFSTR("string_value");
  v5[3] = CFSTR("numerical_value");
  v5[4] = CFSTR("date_value");
  v5[5] = CFSTR("data_value");
  v5[6] = CFSTR("value_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "insertSQLForProperties:shouldReplace:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)databaseTable
{
  return CFSTR("metadata_values");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_49;
}

+ (id)indices
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D29860]);
  v3 = objc_opt_class();
  v8 = CFSTR("object_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEntity:name:columns:", v3, CFSTR("object"), v4);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)deleteStatementForObjectMetadataWithTransaction:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deleteStatementWithProperty:database:", CFSTR("object_id"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)_determineMetadataTypeForValue:(_QWORD *)a3 stringValue:(_QWORD *)a4 numberValue:(_QWORD *)a5 dateValue:(_QWORD *)a6 dataValue:(uint64_t *)a7 type:(uint64_t)a8 error:
{
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v25;
  void *v26;
  NSObject *v27;
  const __CFString *v28;
  id v29;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  objc_opt_self();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    if (!a3)
      goto LABEL_13;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = v13;
    v15 = 0;
    v16 = 0;
    v14 = 0;
    v17 = 1;
    if (!a3)
      goto LABEL_13;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v13;
    v16 = 0;
    v18 = 0;
    v14 = 0;
    v17 = 2;
    if (!a3)
      goto LABEL_13;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (void *)MEMORY[0x1E0CB37E8];
    v20 = v13;
    -[__CFString _unit](v20, "_unit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString doubleValueForUnit:](v20, "doubleValueForUnit:", v21);
    objc_msgSend(v19, "numberWithDouble:");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[__CFString _unit](v20, "_unit");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "unitString");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    v16 = 0;
    v17 = 3;
    if (!a3)
    {
LABEL_13:
      if (a4)
        *a4 = objc_retainAutorelease(v18);
      if (a5)
        *a5 = objc_retainAutorelease(v15);
      if (a6)
        *a6 = objc_retainAutorelease(v16);
      if (a7)
        *a7 = v17;
      v23 = 1;
      goto LABEL_22;
    }
LABEL_12:
    *a3 = objc_retainAutorelease(v14);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v13;
    v15 = 0;
    v18 = 0;
    v14 = 0;
    v17 = 4;
    if (!a3)
      goto LABEL_13;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a8, 3, CFSTR("Received invalid metadata value type %@ (%@)"), v13, objc_opt_class());
  _HKInitializeLogging();
  v25 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)MEMORY[0x1E0CB6F18];
    v27 = v25;
    if (objc_msgSend(v26, "isAppleInternalInstall"))
      v28 = v13;
    else
      v28 = CFSTR("<redacted>");
    *(_DWORD *)buf = 138412546;
    v32 = v28;
    v33 = 2112;
    v34 = (id)objc_opt_class();
    v29 = v34;
    _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "Received invalid value %@ of type %@", buf, 0x16u);

  }
  v15 = 0;
  v16 = 0;
  v18 = 0;
  v14 = 0;
  v23 = 0;
LABEL_22:

  return v23;
}

uint64_t __85__HDMetadataValueEntity__insertMetadataValueWithKeyID_objectID_value_database_error___block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[8]);
  sqlite3_bind_int64(a2, 2, a1[9]);
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 7, a1[10]);
}

+ (BOOL)_updateMetadataValueForKeyID:(int64_t)a3 objectID:(int64_t)a4 value:(id)a5 database:(id)a6 error:(id *)a7
{
  id v12;
  int v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  char v31;
  id v32;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  _QWORD v52[4];

  v52[2] = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v50 = 0;
  v51 = 0;
  v49 = 0;
  v47 = 0;
  v48 = 0;
  v13 = +[HDMetadataValueEntity _determineMetadataTypeForValue:stringValue:numberValue:dateValue:dataValue:type:error:]((uint64_t)a1, a5, &v50, &v49, &v48, &v47, &v51, (uint64_t)a7);
  v14 = v50;
  v15 = v49;
  v16 = v48;
  v17 = v47;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
    v35 = v12;
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v18;
    objc_opt_self();
    v21 = (void *)MEMORY[0x1E0D29840];
    v22 = v20;
    objc_opt_self();
    v34 = v14;
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("key_id"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v52[0] = v23;
    v24 = v19;
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("object_id"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v52[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "predicateMatchingAllPredicates:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v35;
    v28 = MEMORY[0x1E0C809B0];
    v45 = a1;
    v46 = 0;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __84__HDMetadataValueEntity__updateMetadataValueForKeyID_objectID_value_database_error___block_invoke;
    v43[3] = &unk_1E6CEF160;
    v44 = v27;
    v36[0] = v28;
    v14 = v34;
    v36[1] = 3221225472;
    v36[2] = __84__HDMetadataValueEntity__updateMetadataValueForKeyID_objectID_value_database_error___block_invoke_2;
    v36[3] = &unk_1E6CF7850;
    v37 = v34;
    v38 = v15;
    v39 = v16;
    v29 = v17;
    v41 = v44;
    v42 = v51;
    v40 = v29;
    v30 = v44;
    v31 = objc_msgSend(v35, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_updateMetadataValueForKeyID_objectID_value_database_error__updateKey, &v46, v43, v36, 0);
    v32 = v46;

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

id __84__HDMetadataValueEntity__updateMetadataValueForKeyID_objectID_value_database_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v6[0] = CFSTR("string_value");
  v6[1] = CFSTR("numerical_value");
  v6[2] = CFSTR("date_value");
  v6[3] = CFSTR("data_value");
  v6[4] = CFSTR("value_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateSQLForProperties:predicate:", v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __84__HDMetadataValueEntity__updateMetadataValueForKeyID_objectID_value_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  int v5;

  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  v5 = 6;
  sqlite3_bind_int64(a2, 5, *(_QWORD *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 64), "bindToStatement:bindingIndex:", a2, &v5);
}

@end
