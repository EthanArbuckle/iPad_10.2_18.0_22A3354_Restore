@implementation HDUserDomainConceptPropertyEntity

+ (id)databaseTable
{
  return CFSTR("user_domain_concept_properties");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 12;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_82;
}

+ (id)indices
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D29860]);
  v3 = objc_opt_class();
  v8[0] = CFSTR("udc_id");
  v8[1] = CFSTR("property_type");
  v8[2] = CFSTR("version");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEntity:name:columns:", v3, CFSTR("udc_property_version"), v4);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("udc_id");
  +[HDUserDomainConceptEntity defaultForeignKey](HDUserDomainConceptEntity, "defaultForeignKey");
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

+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a3, "propertyCollection", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allBasicProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v17, "type");
        if ((HKIsDeprecatedPropertyType() & 1) == 0
          && !+[HDUserDomainConceptPropertyEntity _insertUserDomainConceptProperty:propertyCategory:userDomainConceptID:transaction:error:]((uint64_t)a1, v17, 1, a4, v10, (uint64_t)a6))
        {
          v18 = 0;
          goto LABEL_12;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v14)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_12:

  return v18;
}

+ (uint64_t)_insertUserDomainConceptProperty:(uint64_t)a3 propertyCategory:(uint64_t)a4 userDomainConceptID:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;

  v10 = a2;
  v11 = a5;
  objc_opt_self();
  objc_msgSend(v11, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __125__HDUserDomainConceptPropertyEntity__insertUserDomainConceptProperty_propertyCategory_userDomainConceptID_transaction_error___block_invoke_2;
  v16[3] = &unk_1E6CE8518;
  v18 = a4;
  v19 = a3;
  v17 = v10;
  v13 = v10;
  v14 = objc_msgSend(v12, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_insertUserDomainConceptProperty_propertyCategory_userDomainConceptID_transaction_error__statementKey, a6, &__block_literal_global_240_0, v16, 0);

  return v14;
}

+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v11 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __143__HDUserDomainConceptPropertyEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke;
  v14[3] = &unk_1E6D03BB8;
  v15 = v11;
  v12 = v11;
  LOBYTE(a7) = +[HDUserDomainConceptPropertyEntity _enumerateConceptPropertiesWithUserDomainConceptID:propertyCategory:transaction:error:enumerationHandler:]((uint64_t)a1, a4, 1, a6, (uint64_t)a7, v14);

  return (char)a7;
}

uint64_t __143__HDUserDomainConceptPropertyEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (uint64_t)_enumerateConceptPropertiesWithUserDomainConceptID:(uint64_t)a3 propertyCategory:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a4;
  v12 = objc_opt_self();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __142__HDUserDomainConceptPropertyEntity__enumerateConceptPropertiesWithUserDomainConceptID_propertyCategory_transaction_error_enumerationHandler___block_invoke;
  v16[3] = &unk_1E6CE82B0;
  v17 = v10;
  v13 = v10;
  v14 = +[HDUserDomainConceptPropertyEntity _enumerateConceptPropertyRowsWithUserDomainConceptID:propertyCategory:transaction:error:enumerationHandler:](v12, a2, a3, v11, a5, v16);

  return v14;
}

+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  return 1;
}

+ (BOOL)addPropertyDataToCodable:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v10 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__HDUserDomainConceptPropertyEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke;
  v13[3] = &unk_1E6CE8CF8;
  v14 = v10;
  v11 = v10;
  LOBYTE(a6) = +[HDUserDomainConceptPropertyEntity _enumerateConceptPropertyRowsWithUserDomainConceptID:propertyCategory:transaction:error:enumerationHandler:]((uint64_t)a1, a4, 1, a5, (uint64_t)a6, v13);

  return (char)a6;
}

uint64_t __100__HDUserDomainConceptPropertyEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke(uint64_t a1)
{
  HDCodableUserDomainConceptProperty *v2;
  uint64_t v3;
  HDCodableUserDomainConceptProperty *v4;
  void *v5;

  v2 = objc_alloc_init(HDCodableUserDomainConceptProperty);
  -[HDCodableUserDomainConceptProperty setType:](v2, "setType:", HDSQLiteColumnWithNameAsInt64());
  -[HDCodableUserDomainConceptProperty setVersion:](v2, "setVersion:", HDSQLiteColumnWithNameAsInt64());
  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableUserDomainConceptProperty setTimestamp:](v2, "setTimestamp:");
  v3 = HDSQLiteColumnWithNameAsInt64();
  -[HDCodableUserDomainConceptProperty setValueType:](v2, "setValueType:", v3);
  v4 = v2;
  switch(v3)
  {
    case 1:
      HDSQLiteColumnWithNameAsString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableUserDomainConceptProperty setStringValue:](v4, "setStringValue:", v5);
      goto LABEL_7;
    case 2:
    case 5:
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableUserDomainConceptProperty setDoubleValue:](v4, "setDoubleValue:");
      break;
    case 3:
      -[HDCodableUserDomainConceptProperty setIntegerValue:](v4, "setIntegerValue:", HDSQLiteColumnWithNameAsInt64());
      break;
    case 4:
      -[HDCodableUserDomainConceptProperty setBoolValue:](v4, "setBoolValue:", HDSQLiteColumnWithNameAsBoolean());
      break;
    case 6:
    case 7:
      HDSQLiteColumnWithNameAsData();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableUserDomainConceptProperty setDataValue:](v4, "setDataValue:", v5);
LABEL_7:

      break;
    default:
      break;
  }

  objc_msgSend(*(id *)(a1 + 32), "addProperties:", v4);
  return 1;
}

+ (uint64_t)_enumerateConceptPropertyRowsWithUserDomainConceptID:(uint64_t)a3 propertyCategory:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[6];

  v10 = a6;
  v11 = a4;
  objc_opt_self();
  objc_msgSend(v11, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __144__HDUserDomainConceptPropertyEntity__enumerateConceptPropertyRowsWithUserDomainConceptID_propertyCategory_transaction_error_enumerationHandler___block_invoke_2;
  v15[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v15[4] = a2;
  v15[5] = a3;
  v13 = objc_msgSend(v12, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_enumerateConceptPropertyRowsWithUserDomainConceptID_propertyCategory_transaction_error_enumerationHandler__statementKey, a5, &__block_literal_global_243, v15, v10);

  return v13;
}

+ (BOOL)pruneDataForUpdatedUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  void *v8;
  _QWORD v10[5];

  objc_msgSend(a5, "protectedDatabase", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __112__HDUserDomainConceptPropertyEntity_pruneDataForUpdatedUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
  v10[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v10[4] = a4;
  LOBYTE(a6) = objc_msgSend(v8, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &pruneDataForUpdatedUserDomainConcept_userDomainConceptID_transaction_error__statementKey, a6, &__block_literal_global_192, v10, 0);

  return (char)a6;
}

const __CFString *__112__HDUserDomainConceptPropertyEntity_pruneDataForUpdatedUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("DELETE FROM user_domain_concept_properties WHERE udc_id = ?AND category = ?");
}

uint64_t __112__HDUserDomainConceptPropertyEntity_pruneDataForUpdatedUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, 1);
}

+ (BOOL)insertDeviceLocalProperty:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  return +[HDUserDomainConceptPropertyEntity _insertUserDomainConceptProperty:propertyCategory:userDomainConceptID:transaction:error:]((uint64_t)a1, a3, 2, a4, a5, (uint64_t)a6);
}

+ (id)deviceLocalPropertiesWithUserDomainConceptID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a4;
  v10 = objc_alloc_init(v8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __100__HDUserDomainConceptPropertyEntity_deviceLocalPropertiesWithUserDomainConceptID_transaction_error___block_invoke;
  v14[3] = &unk_1E6D03BB8;
  v11 = v10;
  v15 = v11;
  LODWORD(a5) = +[HDUserDomainConceptPropertyEntity _enumerateConceptPropertiesWithUserDomainConceptID:propertyCategory:transaction:error:enumerationHandler:]((uint64_t)a1, a3, 2, v9, (uint64_t)a5, v14);

  if ((_DWORD)a5)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D20]), "initWithProperties:", v11);
  else
    v12 = 0;

  return v12;
}

uint64_t __100__HDUserDomainConceptPropertyEntity_deviceLocalPropertiesWithUserDomainConceptID_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (BOOL)deleteDeviceLocalPropertiesWithType:(int64_t)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  void *v9;
  _QWORD v11[6];

  objc_msgSend(a5, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __111__HDUserDomainConceptPropertyEntity_deleteDeviceLocalPropertiesWithType_userDomainConceptID_transaction_error___block_invoke_2;
  v11[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v11[4] = a4;
  v11[5] = a3;
  LOBYTE(a6) = objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &deleteDeviceLocalPropertiesWithType_userDomainConceptID_transaction_error__statementKey, a6, &__block_literal_global_236, v11, 0);

  return (char)a6;
}

const __CFString *__111__HDUserDomainConceptPropertyEntity_deleteDeviceLocalPropertiesWithType_userDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("DELETE FROM user_domain_concept_properties WHERE (udc_id = ?AND category = ? AND property_type = ?)");
}

uint64_t __111__HDUserDomainConceptPropertyEntity_deleteDeviceLocalPropertiesWithType_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  sqlite3_bind_int64(a2, 2, 2);
  return sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 40));
}

const __CFString *__125__HDUserDomainConceptPropertyEntity__insertUserDomainConceptProperty_propertyCategory_userDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("INSERT OR REPLACE INTO user_domain_concept_properties (udc_id, category, property_type, version, timestamp, value_type, string_value, number_value, date_value, uuid_value, data_value) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
}

void __125__HDUserDomainConceptPropertyEntity__insertUserDomainConceptProperty_propertyCategory_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;
  void *v5;
  void *v6;
  double v7;
  sqlite3_int64 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 48));
  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 32), "type"));
  sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 32), "version"));
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  sqlite3_bind_double(a2, 5, v4);
  sqlite3_bind_int64(a2, 6, objc_msgSend(*(id *)(a1 + 32), "valueType"));
  v12 = *(id *)(a1 + 32);
  switch(objc_msgSend(v12, "valueType"))
  {
    case 1:
      objc_msgSend(v12, "stringValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteBindFoundationValueToStatement();

      goto LABEL_4;
    case 2:
      sqlite3_bind_null(a2, 7);
      objc_msgSend(v12, "numberValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      sqlite3_bind_double(a2, 8, v7);
      goto LABEL_9;
    case 3:
      sqlite3_bind_null(a2, 7);
      objc_msgSend(v12, "numberValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "longLongValue");
      goto LABEL_8;
    case 4:
      sqlite3_bind_null(a2, 7);
      objc_msgSend(v12, "numberValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "BOOLValue");
LABEL_8:
      sqlite3_bind_int64(a2, 8, v8);
LABEL_9:

      goto LABEL_10;
    case 5:
      sqlite3_bind_null(a2, 7);
      sqlite3_bind_null(a2, 8);
      objc_msgSend(v12, "dateValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteBindFoundationValueToStatement();

      goto LABEL_11;
    case 6:
      sqlite3_bind_null(a2, 7);
      sqlite3_bind_null(a2, 8);
      sqlite3_bind_null(a2, 9);
      objc_msgSend(v12, "UUIDValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteBindFoundationValueToStatement();

      goto LABEL_12;
    case 7:
      sqlite3_bind_null(a2, 7);
      sqlite3_bind_null(a2, 8);
      sqlite3_bind_null(a2, 9);
      sqlite3_bind_null(a2, 10);
      objc_msgSend(v12, "dataValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteBindFoundationValueToStatement();

      goto LABEL_13;
    default:
      sqlite3_bind_null(a2, 7);
LABEL_4:
      sqlite3_bind_null(a2, 8);
LABEL_10:
      sqlite3_bind_null(a2, 9);
LABEL_11:
      sqlite3_bind_null(a2, 10);
LABEL_12:
      sqlite3_bind_null(a2, 11);
LABEL_13:

      return;
  }
}

const __CFString *__144__HDUserDomainConceptPropertyEntity__enumerateConceptPropertyRowsWithUserDomainConceptID_propertyCategory_transaction_error_enumerationHandler___block_invoke()
{
  return CFSTR("SELECT property_type, version, timestamp, value_type, string_value, number_value, date_value, uuid_value, data_value FROM user_domain_concept_properties WHERE (udc_id = ? AND category = ?) ORDER BY ROWID");
}

uint64_t __144__HDUserDomainConceptPropertyEntity__enumerateConceptPropertyRowsWithUserDomainConceptID_propertyCategory_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

uint64_t __142__HDUserDomainConceptPropertyEntity__enumerateConceptPropertiesWithUserDomainConceptID_propertyCategory_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v2 = HDSQLiteColumnWithNameAsInt64();
  v3 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  v5 = v4;
  v6 = HDSQLiteColumnWithNameAsInt64();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v6)
  {
    case 1:
      HDSQLiteColumnWithNameAsString();
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      v9 = (void *)MEMORY[0x1E0CB37E8];
      HDSQLiteColumnWithNameAsDouble();
      objc_msgSend(v9, "numberWithDouble:");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HDSQLiteColumnWithNameAsInt64());
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HDSQLiteColumnWithNameAsBoolean());
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      HDSQLiteColumnWithNameAsDate();
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 6:
      HDSQLiteColumnWithNameAsUUID();
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 7:
      HDSQLiteColumnWithNameAsData();
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v10 = (void *)v8;

      v7 = v10;
      break;
    default:
      break;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CF0]), "initWithType:version:timestamp:valueType:value:", v2, v3, v6, v7, v5);
  v12 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v12;
}

@end
