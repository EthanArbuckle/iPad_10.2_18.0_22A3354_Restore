@implementation HDAttachmentReferenceEntity

+ (id)databaseTable
{
  return CFSTR("attachment_references");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 11;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDAttachmentEntityColumnDefinitions_0;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)insertReference:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  HDInsertAttachmentReferenceOperation *v13;
  BOOL v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "metadata");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        objc_msgSend(v7, "metadata"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "hk_validateAttachmentMetadataKeysAndValuesWithError:", a5),
        v11,
        v10,
        !v12))
  {
    v14 = 0;
  }
  else
  {
    v13 = -[HDInsertAttachmentReferenceOperation initWithReference:]([HDInsertAttachmentReferenceOperation alloc], "initWithReference:", v7);
    v14 = -[HDJournalableOperation performOrJournalWithProfile:error:](v13, "performOrJournalWithProfile:error:", v8, a5);

  }
  return v14;
}

+ (id)anyReferenceWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__201;
  v22 = __Block_byref_object_dispose__201;
  v23 = 0;
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__HDAttachmentReferenceEntity_anyReferenceWithPredicate_profile_error___block_invoke;
  v14[3] = &unk_1E6CEC9E0;
  v17 = a1;
  v11 = v8;
  v15 = v11;
  v16 = &v18;
  objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v10, a5, v14);

  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

uint64_t __71__HDAttachmentReferenceEntity_anyReferenceWithPredicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "anyInDatabase:predicate:error:", v6, *(_QWORD *)(a1 + 32), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[HDAttachmentReferenceEntity _propertiesForEntity]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__HDAttachmentReferenceEntity_anyReferenceWithPredicate_profile_error___block_invoke_2;
    v11[3] = &unk_1E6CEEDC8;
    v11[4] = *(_QWORD *)(a1 + 40);
    v9 = objc_msgSend(v7, "getValuesForProperties:database:error:handler:", v8, v6, a3, v11);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (id)_propertiesForEntity
{
  _QWORD v1[11];

  v1[10] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = CFSTR("identifier");
  v1[1] = CFSTR("schema_identifier");
  v1[2] = CFSTR("schema_version");
  v1[3] = CFSTR("object_identifier");
  v1[4] = CFSTR("attachment_identifier");
  v1[5] = CFSTR("creation_date");
  v1[6] = CFSTR("options");
  v1[7] = CFSTR("metadata");
  v1[8] = CFSTR("type");
  v1[9] = CFSTR("cloud_status");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __71__HDAttachmentReferenceEntity_anyReferenceWithPredicate_profile_error___block_invoke_2(uint64_t a1)
{
  HDAttachmentReferenceSchemaIdentifier *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  HDAttachmentReference *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  HDAttachmentReferenceSchemaIdentifier *v17;

  v2 = [HDAttachmentReferenceSchemaIdentifier alloc];
  HDSQLiteColumnWithNameAsString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HDAttachmentReferenceSchemaIdentifier initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:](v2, "initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:", v3, v4, v5, v6);

  v7 = [HDAttachmentReference alloc];
  HDSQLiteColumnWithNameAsUUID();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsData();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableMetadataDictionary decodeMetadataFromData:](HDCodableMetadataDictionary, "decodeMetadataFromData:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = HDSQLiteColumnWithNameAsInt64();
  v14 = -[HDAttachmentReference initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:](v7, "initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:", v8, v17, v9, v10, v12, v13, HDSQLiteColumnWithNameAsInt64());
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

+ (id)referenceWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = a4;
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("identifier"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "anyReferenceWithPredicate:profile:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)enumerateReferencesWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDAttachmentReferenceEntity _propertiesForEntity]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __101__HDAttachmentReferenceEntity_enumerateReferencesWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v17[3] = &unk_1E6CE91B8;
  v18 = v10;
  v15 = v10;
  LOBYTE(a5) = objc_msgSend(v13, "enumerateProperties:error:enumerationHandler:", v14, a5, v17);

  return (char)a5;
}

uint64_t __101__HDAttachmentReferenceEntity_enumerateReferencesWithPredicate_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  HDAttachmentReferenceSchemaIdentifier *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  HDAttachmentReferenceSchemaIdentifier *v7;
  HDAttachmentReference *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HDAttachmentReference *v15;
  uint64_t v16;

  v2 = [HDAttachmentReferenceSchemaIdentifier alloc];
  HDSQLiteColumnWithNameAsString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDAttachmentReferenceSchemaIdentifier initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:](v2, "initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:", v3, v4, v5, v6);

  v8 = [HDAttachmentReference alloc];
  HDSQLiteColumnWithNameAsUUID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsData();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableMetadataDictionary decodeMetadataFromData:](HDCodableMetadataDictionary, "decodeMetadataFromData:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = HDSQLiteColumnWithNameAsInt64();
  v15 = -[HDAttachmentReference initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:](v8, "initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:", v9, v7, v10, v11, v13, v14, HDSQLiteColumnWithNameAsInt64());

  v16 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v16;
}

+ (BOOL)enumerateReferencesForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = a5;
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("SELECT %@,%@,%@,%@,%@,%@,%@,%@,%@,%@ FROM %@ WHERE %@ = ? AND %@ = ?"), CFSTR("identifier"), CFSTR("schema_identifier"), CFSTR("schema_version"), CFSTR("object_identifier"), CFSTR("attachment_identifier"), CFSTR("creation_date"), CFSTR("options"), CFSTR("metadata"), CFSTR("type"), CFSTR("cloud_status"), v17, CFSTR("object_identifier"), CFSTR("schema_identifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "databaseForEntityClass:", a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __124__HDAttachmentReferenceEntity_enumerateReferencesForObjectIdentifier_schemaIdentifier_transaction_error_enumerationHandler___block_invoke;
  v26[3] = &unk_1E6CE7750;
  v27 = v12;
  v28 = v13;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __124__HDAttachmentReferenceEntity_enumerateReferencesForObjectIdentifier_schemaIdentifier_transaction_error_enumerationHandler___block_invoke_2;
  v24[3] = &unk_1E6CE82B0;
  v25 = v14;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  LOBYTE(a6) = objc_msgSend(v19, "executeSQL:error:bindingHandler:enumerationHandler:", v18, a6, v26, v24);

  return (char)a6;
}

uint64_t __124__HDAttachmentReferenceEntity_enumerateReferencesForObjectIdentifier_schemaIdentifier_transaction_error_enumerationHandler___block_invoke()
{
  HDSQLiteBindStringToStatement();
  return HDSQLiteBindStringToStatement();
}

uint64_t __124__HDAttachmentReferenceEntity_enumerateReferencesForObjectIdentifier_schemaIdentifier_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1)
{
  HDAttachmentReferenceSchemaIdentifier *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  HDAttachmentReferenceSchemaIdentifier *v7;
  HDAttachmentReference *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HDAttachmentReference *v15;
  uint64_t v16;

  v2 = [HDAttachmentReferenceSchemaIdentifier alloc];
  HDSQLiteColumnWithNameAsString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDAttachmentReferenceSchemaIdentifier initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:](v2, "initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:", v3, v4, v5, v6);

  v8 = [HDAttachmentReference alloc];
  HDSQLiteColumnWithNameAsUUID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsData();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableMetadataDictionary decodeMetadataFromData:](HDCodableMetadataDictionary, "decodeMetadataFromData:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = HDSQLiteColumnWithNameAsInt64();
  v15 = -[HDAttachmentReference initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:](v8, "initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:", v9, v7, v10, v11, v13, v14, HDSQLiteColumnWithNameAsInt64());

  v16 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v16;
}

+ (BOOL)enumerateReferencesForAttachmentIdentifier:(id)a3 type:(int64_t)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  int64_t v27;
  _QWORD v28[4];
  id v29;

  v12 = a3;
  v13 = a7;
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = a5;
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("SELECT %@,%@,%@,%@,%@,%@,%@,%@,%@,%@ FROM %@ WHERE %@ = ? AND %@ = ?"), CFSTR("identifier"), CFSTR("schema_identifier"), CFSTR("schema_version"), CFSTR("object_identifier"), CFSTR("attachment_identifier"), CFSTR("creation_date"), CFSTR("options"), CFSTR("metadata"), CFSTR("type"), CFSTR("cloud_status"), v16, CFSTR("attachment_identifier"), CFSTR("type"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "databaseForEntityClass:", a1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __116__HDAttachmentReferenceEntity_enumerateReferencesForAttachmentIdentifier_type_transaction_error_enumerationHandler___block_invoke;
  v28[3] = &unk_1E6CEB2F8;
  v29 = v17;
  v24 = v13;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __116__HDAttachmentReferenceEntity_enumerateReferencesForAttachmentIdentifier_type_transaction_error_enumerationHandler___block_invoke_2;
  v25[3] = &unk_1E6CE82D8;
  v26 = v12;
  v27 = a4;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __116__HDAttachmentReferenceEntity_enumerateReferencesForAttachmentIdentifier_type_transaction_error_enumerationHandler___block_invoke_3;
  v23[3] = &unk_1E6CE82B0;
  v19 = v13;
  v20 = v12;
  v21 = v17;
  LOBYTE(a6) = objc_msgSend(v18, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &enumerateReferencesForAttachmentIdentifier_type_transaction_error_enumerationHandler__lookupKey, a6, v28, v25, v23);

  return (char)a6;
}

id __116__HDAttachmentReferenceEntity_enumerateReferencesForAttachmentIdentifier_type_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __116__HDAttachmentReferenceEntity_enumerateReferencesForAttachmentIdentifier_type_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

uint64_t __116__HDAttachmentReferenceEntity_enumerateReferencesForAttachmentIdentifier_type_transaction_error_enumerationHandler___block_invoke_3(uint64_t a1)
{
  HDAttachmentReferenceSchemaIdentifier *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  HDAttachmentReferenceSchemaIdentifier *v7;
  HDAttachmentReference *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HDAttachmentReference *v15;
  uint64_t v16;

  v2 = [HDAttachmentReferenceSchemaIdentifier alloc];
  HDSQLiteColumnWithNameAsString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDAttachmentReferenceSchemaIdentifier initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:](v2, "initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:", v3, v4, v5, v6);

  v8 = [HDAttachmentReference alloc];
  HDSQLiteColumnWithNameAsUUID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsData();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableMetadataDictionary decodeMetadataFromData:](HDCodableMetadataDictionary, "decodeMetadataFromData:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = HDSQLiteColumnWithNameAsInt64();
  v15 = -[HDAttachmentReference initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:](v8, "initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:", v9, v7, v10, v11, v13, v14, HDSQLiteColumnWithNameAsInt64());

  v16 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v16;
}

+ (BOOL)setCloudStatus:(int64_t)a3 references:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D29848];
  objc_msgSend(v10, "hk_map:", &__block_literal_global_241);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "containsPredicateWithProperty:values:", CFSTR("identifier"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = CFSTR("cloud_status");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__HDAttachmentReferenceEntity_setCloudStatus_references_transaction_error___block_invoke_2;
  v17[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  v17[4] = a3;
  LOBYTE(a6) = +[HDSQLiteEntity updateProperties:predicate:database:error:bindingHandler:](HDAttachmentReferenceEntity, "updateProperties:predicate:database:error:bindingHandler:", v15, v14, v11, a6, v17);

  return (char)a6;
}

uint64_t __75__HDAttachmentReferenceEntity_setCloudStatus_references_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __75__HDAttachmentReferenceEntity_setCloudStatus_references_transaction_error___block_invoke_2()
{
  JUMPOUT(0x1BCCAB114);
}

+ (BOOL)setCloudStatus:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  void *v7;
  _QWORD v9[5];

  objc_msgSend(a4, "protectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__HDAttachmentReferenceEntity_setCloudStatus_transaction_error___block_invoke_2;
  v9[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v9[4] = a3;
  LOBYTE(a5) = objc_msgSend(v7, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &setCloudStatus_transaction_error__lookupKey, a5, &__block_literal_global_243_0, v9, 0);

  return (char)a5;
}

id __64__HDAttachmentReferenceEntity_setCloudStatus_transaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDAttachmentReferenceEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ?"), v1, CFSTR("cloud_status"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __64__HDAttachmentReferenceEntity_setCloudStatus_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

+ (BOOL)filteredNonTombstoneReferences:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v10 = a3;
  v11 = a6;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_map:", &__block_literal_global_247_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ IN (%@)"), CFSTR("identifier"), CFSTR("schema_identifier"), CFSTR("schema_version"), CFSTR("object_identifier"), CFSTR("attachment_identifier"), CFSTR("creation_date"), CFSTR("options"), CFSTR("metadata"), CFSTR("type"), CFSTR("cloud_status"), v16, CFSTR("type"), CFSTR("identifier"), v14, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __99__HDAttachmentReferenceEntity_filteredNonTombstoneReferences_transaction_error_enumerationHandler___block_invoke_2;
  v23[3] = &unk_1E6CE9508;
  v24 = v10;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __99__HDAttachmentReferenceEntity_filteredNonTombstoneReferences_transaction_error_enumerationHandler___block_invoke_4;
  v21[3] = &unk_1E6CE82B0;
  v22 = v11;
  v18 = v11;
  v19 = v10;
  LOBYTE(a5) = objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v17, a5, v23, v21);

  return (char)a5;
}

const __CFString *__99__HDAttachmentReferenceEntity_filteredNonTombstoneReferences_transaction_error_enumerationHandler___block_invoke()
{
  return CFSTR("?");
}

void __99__HDAttachmentReferenceEntity_filteredNonTombstoneReferences_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  id v3;

  sqlite3_bind_int64(a2, 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_254_0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValuesToStatement();

}

uint64_t __99__HDAttachmentReferenceEntity_filteredNonTombstoneReferences_transaction_error_enumerationHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __99__HDAttachmentReferenceEntity_filteredNonTombstoneReferences_transaction_error_enumerationHandler___block_invoke_4(uint64_t a1)
{
  HDAttachmentReferenceSchemaIdentifier *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  HDAttachmentReferenceSchemaIdentifier *v7;
  HDAttachmentReference *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HDAttachmentReference *v15;
  uint64_t v16;

  v2 = [HDAttachmentReferenceSchemaIdentifier alloc];
  HDSQLiteColumnWithNameAsString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDAttachmentReferenceSchemaIdentifier initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:](v2, "initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:", v3, v4, v5, v6);

  v8 = [HDAttachmentReference alloc];
  HDSQLiteColumnWithNameAsUUID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsData();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableMetadataDictionary decodeMetadataFromData:](HDCodableMetadataDictionary, "decodeMetadataFromData:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = HDSQLiteColumnWithNameAsInt64();
  v15 = -[HDAttachmentReference initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:](v8, "initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:", v9, v7, v10, v11, v13, v14, HDSQLiteColumnWithNameAsInt64());

  v16 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v16;
}

+ (BOOL)insertTombstones:(id)a3 cloudStatus:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  id v35;
  id *v36;
  BOOL v37;
  id v38;
  char v39;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  id obj;
  id v47;
  void *v49;
  _QWORD v50[6];
  _QWORD v51[5];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_map:", &__block_literal_global_255);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  v47 = a1;
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ? AND %@ IN (%@)"), CFSTR("identifier"), v14, CFSTR("type"), CFSTR("identifier"), v12, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v65 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_2;
  v63[3] = &unk_1E6CE9508;
  v18 = v8;
  v64 = v18;
  v61[0] = v17;
  v61[1] = 3221225472;
  v61[2] = __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_4;
  v61[3] = &unk_1E6CE8CF8;
  v19 = v16;
  v62 = v19;
  v49 = v10;
  LOBYTE(v8) = objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", v15, &v65, v63, v61);
  v20 = v65;
  v21 = v20;
  if ((v8 & 1) != 0)
  {
    v43 = v9;
    v44 = v20;
    v42 = v12;
    v59[0] = v17;
    v59[1] = 3221225472;
    v59[2] = __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_5;
    v59[3] = &unk_1E6CFA3C0;
    v22 = v19;
    v60 = v22;
    objc_msgSend(v18, "hk_filter:", v59);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v17;
    v57[1] = 3221225472;
    v57[2] = __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_6;
    v57[3] = &unk_1E6CFA3C0;
    v58 = v22;
    objc_msgSend(v18, "hk_filter:", v57);
    v41 = objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v23;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v54;
LABEL_4:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v54 != v26)
          objc_enumerationMutation(obj);
        v28 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v27);
        v51[1] = 3221225472;
        v51[2] = __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_7;
        v51[3] = &__block_descriptor_40_e15___NSString_8__0l;
        v51[4] = v47;
        v52 = 0;
        v50[0] = v17;
        v50[1] = 3221225472;
        v50[2] = __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_8;
        v50[3] = &unk_1E6CE82D8;
        v50[4] = v28;
        v50[5] = a4;
        v51[0] = v17;
        v29 = objc_msgSend(v49, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertTombstones_cloudStatus_transaction_error__insertKey, &v52, v51, v50, 0);
        v30 = v52;
        v31 = v30;
        if ((v29 & 1) == 0)
        {
          if (!v30)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to insert tombstones."));
            v38 = (id)objc_claimAutoreleasedReturnValue();
            if (v38)
              goto LABEL_24;
            v31 = 0;
            v39 = 1;
            v12 = v42;
            v9 = v43;
            v33 = (void *)v41;
LABEL_28:

            v34 = v39;
LABEL_29:

            v32 = obj;
            goto LABEL_30;
          }
          if ((objc_msgSend(v30, "hd_isConstraintViolation") & 1) == 0)
          {
            v38 = v31;
LABEL_24:
            v9 = v43;
            v33 = (void *)v41;
            if (a6)
              *a6 = objc_retainAutorelease(v38);
            else
              _HKLogDroppedError();
            v12 = v42;

            v39 = 0;
            v34 = 0;
            if (!v31)
              goto LABEL_28;
            goto LABEL_29;
          }
        }

        if (v25 == ++v27)
        {
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
          if (v25)
            goto LABEL_4;
          break;
        }
      }
    }
    v32 = obj;

    v33 = (void *)v41;
    v9 = v43;
    v34 = +[HDAttachmentReferenceEntity setCloudStatus:references:transaction:error:](HDAttachmentReferenceEntity, "setCloudStatus:references:transaction:error:", a4, v41, v43, a6);
    v12 = v42;
LABEL_30:

    v35 = v60;
    v21 = v44;
    goto LABEL_31;
  }
  if (v20)
  {
    v35 = v20;
    v36 = a6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to fetch filtered non-tombstone references."));
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v36 = a6;
    if (!v35)
    {
      v34 = 1;
LABEL_31:

      v37 = v34;
      goto LABEL_32;
    }
  }
  if (v36)
    *v36 = objc_retainAutorelease(v35);
  else
    _HKLogDroppedError();

  v34 = 0;
  v37 = 0;
  if (!v21)
    goto LABEL_31;
LABEL_32:

  return v37;
}

const __CFString *__78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke()
{
  return CFSTR("?");
}

void __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  id v3;

  sqlite3_bind_int64(a2, 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_259);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValuesToStatement();

}

uint64_t __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  HDSQLiteColumnWithNameAsUUID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

uint64_t __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

id __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_7(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), v2, CFSTR("identifier"), CFSTR("schema_identifier"), CFSTR("schema_version"), CFSTR("object_identifier"), CFSTR("attachment_identifier"), CFSTR("creation_date"), CFSTR("options"), CFSTR("metadata"), CFSTR("type"), CFSTR("cloud_status"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_8(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, 0);
  HDSQLiteBindFoundationValueToStatement();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 7, 0);
  sqlite3_bind_null(a2, 8);
  sqlite3_bind_int64(a2, 9, 1);
  return sqlite3_bind_int64(a2, 10, *(_QWORD *)(a1 + 40));
}

+ (BOOL)deleteReferences:(id)a3 cloudStatus:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  BOOL v20;
  id v21;
  char v22;
  _QWORD v24[4];
  id v25;
  int64_t v26;
  id v27;

  v10 = a3;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_map:", &__block_literal_global_270_1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ? WHERE %@ IN (%@)"), v15, CFSTR("schema_identifier"), CFSTR("schema_version"), CFSTR("object_identifier"), CFSTR("attachment_identifier"), CFSTR("creation_date"), CFSTR("options"), CFSTR("metadata"), CFSTR("type"), CFSTR("cloud_status"), CFSTR("identifier"), v13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __78__HDAttachmentReferenceEntity_deleteReferences_cloudStatus_transaction_error___block_invoke_2;
  v24[3] = &unk_1E6CE82D8;
  v26 = a4;
  v17 = v10;
  v25 = v17;
  LOBYTE(v14) = objc_msgSend(v11, "executeSQL:error:bindingHandler:enumerationHandler:", v16, &v27, v24, 0);
  v18 = v27;
  v19 = v18;
  if ((v14 & 1) != 0)
  {
    v20 = 1;
    goto LABEL_13;
  }
  if (v18)
  {
    v21 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to update references to tombstones."));
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v22 = 1;
LABEL_12:

      v20 = v22;
      goto LABEL_13;
    }
  }
  if (a6)
    *a6 = objc_retainAutorelease(v21);
  else
    _HKLogDroppedError();

  v22 = 0;
  v20 = 0;
  if (!v19)
    goto LABEL_12;
LABEL_13:

  return v20;
}

const __CFString *__78__HDAttachmentReferenceEntity_deleteReferences_cloudStatus_transaction_error___block_invoke()
{
  return CFSTR("?");
}

void __78__HDAttachmentReferenceEntity_deleteReferences_cloudStatus_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  id v6;

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, 0);
  HDSQLiteBindFoundationValueToStatement();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 6, 0);
  sqlite3_bind_null(a2, 7);
  sqlite3_bind_int64(a2, 8, 1);
  sqlite3_bind_int64(a2, 9, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_274_0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValuesToStatement();

}

uint64_t __78__HDAttachmentReferenceEntity_deleteReferences_cloudStatus_transaction_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

+ (id)_insertReference:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "metadata");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        objc_msgSend(v8, "metadata"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "hk_validateAttachmentMetadataKeysAndValuesWithError:", a5),
        v12,
        v11,
        v13))
  {
    objc_msgSend(v9, "databaseForEntityClass:", a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attachmentIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    +[HDAttachmentEntity attachmentWithIdentifier:transaction:error:](HDAttachmentEntity, "attachmentWithIdentifier:transaction:error:", v15, v9, &v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v24;

    if (objc_msgSend(v8, "type") || v16)
    {
      +[HDAttachmentReferenceEntity _propertiesForEntity]();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __74__HDAttachmentReferenceEntity__insertReference_databaseTransaction_error___block_invoke;
      v22[3] = &unk_1E6CE84C8;
      v23 = v8;
      objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v14, v18, a5, v22);
      v19 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v17)
      {
        v18 = v17;
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Attachment does not exist for reference: %@"), v8);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
LABEL_10:
        if (a5)
          *a5 = objc_retainAutorelease(v18);
        else
          _HKLogDroppedError();

        v19 = 0;
        v20 = 0;
        if (v17)
          goto LABEL_17;
        goto LABEL_16;
      }
      v19 = 0;
    }
LABEL_16:

    v20 = (void *)v19;
LABEL_17:

    goto LABEL_18;
  }
  v20 = 0;
LABEL_18:

  return v20;
}

void __74__HDAttachmentReferenceEntity__insertReference_databaseTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("identifier"), v4);

  objc_msgSend(*(id *)(a1 + 32), "schemaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("schema_identifier"), v5);

  MEMORY[0x1BCCAB114](a2, CFSTR("schema_version"), objc_msgSend(*(id *)(a1 + 32), "schemaVersion"));
  objc_msgSend(*(id *)(a1 + 32), "objectIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("object_identifier"), v6);

  objc_msgSend(*(id *)(a1 + 32), "attachmentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("attachment_identifier"), v7);

  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("creation_date"), v8);

  MEMORY[0x1BCCAB114](a2, CFSTR("options"), objc_msgSend(*(id *)(a1 + 32), "options"));
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_codableMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1BCCAB0D8](a2, CFSTR("metadata"), v13);

  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("metadata"));
  }
  MEMORY[0x1BCCAB114](a2, CFSTR("type"), objc_msgSend(*(id *)(a1 + 32), "type"));
  objc_msgSend(*(id *)(a1 + 32), "cloudStatus");
  JUMPOUT(0x1BCCAB114);
}

+ (id)_insertIfDoesNotExistReference:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v23;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "metadata");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v8, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hk_validateAttachmentMetadataKeysAndValuesWithError:", a5);

    if (!v13)
    {
      v21 = 0;
      goto LABEL_8;
    }
  }
  objc_msgSend(v8, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("identifier"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "databaseForEntityClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(a1, "anyInDatabase:predicate:error:", v16, v15, &v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v23;
  v19 = v18;
  if (v17)
  {
    v20 = v17;
  }
  else
  {
    if (v18)
    {
      if (a5)
      {
        v21 = 0;
        *a5 = objc_retainAutorelease(v18);
      }
      else
      {
        _HKLogDroppedError();
        v21 = 0;
      }
      goto LABEL_6;
    }
    objc_msgSend(a1, "_insertReference:databaseTransaction:error:", v8, v9, a5);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;
LABEL_6:

LABEL_8:
  return v21;
}

@end
