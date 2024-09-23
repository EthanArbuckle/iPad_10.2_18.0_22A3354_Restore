@implementation HDOntologyShardRegistryEntity

- (HDOntologyShardRegistryEntity)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (BOOL)insertEntry:(id)a3 database:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  id v16;

  v9 = a3;
  v10 = a4;
  if ((objc_msgSend(v10, "isWriter") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDOntologyShardRegistryEntity.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database.isWriter"));

  }
  objc_opt_self();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__HDOntologyShardRegistryEntity_insertEntry_database_error___block_invoke;
  v15[3] = &unk_1E6CE84C8;
  v16 = v9;
  v11 = v9;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v10, &unk_1E6DF8870, a5, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12 != 0;
}

void __60__HDOntologyShardRegistryEntity_insertEntry_database_error___block_invoke(uint64_t a1, uint64_t a2)
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
  void *v22;
  id v23;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("identifier"), v4);

  objc_msgSend(*(id *)(a1 + 32), "schemaType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("schema_type"), v5);

  MEMORY[0x1BCCAB114](a2, CFSTR("schema_version"), objc_msgSend(*(id *)(a1 + 32), "schemaVersion"));
  MEMORY[0x1BCCAB114](a2, CFSTR("settings"), objc_msgSend(*(id *)(a1 + 32), "settings"));
  MEMORY[0x1BCCAB114](a2, CFSTR("slot"), objc_msgSend(*(id *)(a1 + 32), "slot"));
  MEMORY[0x1BCCAB114](a2, CFSTR("desired_state"), objc_msgSend(*(id *)(a1 + 32), "desiredState"));
  objc_msgSend(*(id *)(a1 + 32), "desiredStateDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("desired_state_date"), v6);

  MEMORY[0x1BCCAB114](a2, CFSTR("current_version"), objc_msgSend(*(id *)(a1 + 32), "currentVersion"));
  objc_msgSend(*(id *)(a1 + 32), "currentVersionDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("current_version_date"), v7);

  objc_msgSend(*(id *)(a1 + 32), "currentRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("current_region"), v8);

  objc_msgSend(*(id *)(a1 + 32), "currentRegionDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("current_region_date"), v9);

  objc_msgSend(*(id *)(a1 + 32), "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("current_locale"), v10);

  objc_msgSend(*(id *)(a1 + 32), "currentLocaleDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("current_locale_date"), v11);

  MEMORY[0x1BCCAB114](a2, CFSTR("available_version"), objc_msgSend(*(id *)(a1 + 32), "availableVersion"));
  objc_msgSend(*(id *)(a1 + 32), "availableVersionDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("available_version_date"), v12);

  objc_msgSend(*(id *)(a1 + 32), "availableRegion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("available_region"), v13);

  objc_msgSend(*(id *)(a1 + 32), "availableRegionDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("available_region_date"), v14);

  objc_msgSend(*(id *)(a1 + 32), "availableLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("available_locale"), v15);

  objc_msgSend(*(id *)(a1 + 32), "availableLocaleDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("available_locale_date"), v16);

  objc_msgSend(*(id *)(a1 + 32), "availableURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("available_url"), v18);

  objc_msgSend(*(id *)(a1 + 32), "availableURLDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("available_url_date"), v19);

  objc_msgSend(*(id *)(a1 + 32), "availableChecksum");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("available_checksum"), v20);

  objc_msgSend(*(id *)(a1 + 32), "availableChecksumDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("available_checksum_date"), v21);

  MEMORY[0x1BCCAB114](a2, CFSTR("available_size"), objc_msgSend(*(id *)(a1 + 32), "availableSize"));
  objc_msgSend(*(id *)(a1 + 32), "availableSizeDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("available_size_date"), v22);

  MEMORY[0x1BCCAB114](a2, CFSTR("available_state"), objc_msgSend(*(id *)(a1 + 32), "availableState"));
  objc_msgSend(*(id *)(a1 + 32), "availableStateDate");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("available_state_date"), v23);

}

+ (BOOL)enumerateEntriesWithPredicate:(id)a3 orderingTerms:(id)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v11 = a7;
  +[HDSQLiteEntity queryWithDatabase:predicate:limit:orderingTerms:groupBy:](HDOntologyShardRegistryEntity, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", a5, a3, 0, a4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __111__HDOntologyShardRegistryEntity_enumerateEntriesWithPredicate_orderingTerms_database_error_enumerationHandler___block_invoke;
  v15[3] = &unk_1E6CE84F0;
  v16 = v11;
  v13 = v11;
  LOBYTE(a6) = objc_msgSend(v12, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", &unk_1E6DF8870, a6, v15);

  return (char)a6;
}

uint64_t __111__HDOntologyShardRegistryEntity_enumerateEntriesWithPredicate_orderingTerms_database_error_enumerationHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  HDSQLiteColumnWithNameAsString();
  v1 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v1;
  if (v1)
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v1);
  else
    v34 = 0;
  v24 = objc_alloc(MEMORY[0x1E0CB69B0]);
  HDSQLiteColumnWithNameAsString();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = HDSQLiteColumnWithNameAsInt64();
  v21 = HDSQLiteColumnWithNameAsInt64();
  v20 = HDSQLiteColumnWithNameAsInt64();
  v19 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDate();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDate();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDate();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDate();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:", v33, v23, v22, v21, v20, v19, v32, v18, v31, v17, v16, v30, v15,
                  v14,
                  v29,
                  v28,
                  v12,
                  v13,
                  v11,
                  v34,
                  v2,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8);

  v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v9;
}

+ (id)nextAvailableSlotInAllowedRange:(_NSRange)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  NSUInteger v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[3];

  length = a3.length;
  location = a3.location;
  v34[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v13, "setEntityClass:", a1);
  objc_msgSend(v13, "setPredicate:", v11);
  v34[0] = CFSTR("slot");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectSQLForProperties:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ SELECT MIN(value) FROM generate_series WHERE value NOT IN (%@)"), CFSTR("WITH RECURSIVE generate_series(value) AS (SELECT ? UNION ALL SELECT value+1 FROM generate_series WHERE value+1<=?)"), v15);
  v17 = length + location - 1;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__5;
  v32 = __Block_byref_object_dispose__5;
  v33 = 0;
  v18 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __90__HDOntologyShardRegistryEntity_nextAvailableSlotInAllowedRange_predicate_database_error___block_invoke;
  v24[3] = &unk_1E6CE8518;
  v26 = location;
  v27 = v17;
  v19 = v13;
  v25 = v19;
  v23[0] = v18;
  v23[1] = 3221225472;
  v23[2] = __90__HDOntologyShardRegistryEntity_nextAvailableSlotInAllowedRange_predicate_database_error___block_invoke_2;
  v23[3] = &unk_1E6CE8540;
  v23[4] = &v28;
  if ((objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v16, a6, v24, v23) & 1) == 0)
    goto LABEL_5;
  v20 = (void *)v29[5];
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 118, CFSTR("No slot is available in range (%ld, %ld) matching predicate %@"), location, v17, v11);
LABEL_5:
    v21 = 0;
    goto LABEL_6;
  }
  v21 = v20;
LABEL_6:

  _Block_object_dispose(&v28, 8);
  return v21;
}

uint64_t __90__HDOntologyShardRegistryEntity_nextAvailableSlotInAllowedRange_predicate_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  int v5;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  v5 = 3;
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "bindToSelectStatement:bindingIndex:", a2, &v5);
}

uint64_t __90__HDOntologyShardRegistryEntity_nextAvailableSlotInAllowedRange_predicate_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1C8](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

+ (id)databaseTable
{
  return CFSTR("shard_registry");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 28;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_0;
}

+ (id)uniquedColumns
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("identifier");
  v3[1] = CFSTR("schema_type");
  v3[2] = CFSTR("schema_version");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
