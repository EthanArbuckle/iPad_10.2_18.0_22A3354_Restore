@implementation HDSeriesBuilderEntity

+ (Class)seriesEntityClass
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (id)persistentEntityForBuilderIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = a4;
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("uuid"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "anyWithPredicate:healthDatabase:error:", v10, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)createPersistentEntityForBuilderIdentifier:(id)a3 seriesType:(id)a4 state:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  int64_t v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v26[0] = CFSTR("uuid");
  v26[1] = CFSTR("state");
  v26[2] = CFSTR("series_type");
  v14 = (void *)MEMORY[0x1E0C99D20];
  v15 = a6;
  objc_msgSend(v14, "arrayWithObjects:count:", v26, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __99__HDSeriesBuilderEntity_createPersistentEntityForBuilderIdentifier_seriesType_state_profile_error___block_invoke;
  v22[3] = &unk_1E6CE8268;
  v24 = v13;
  v25 = a5;
  v23 = v12;
  v18 = v13;
  v19 = v12;
  objc_msgSend(a1, "insertOrReplaceEntity:healthDatabase:properties:error:bindingHandler:", 0, v17, v16, a7, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __99__HDSeriesBuilderEntity_createPersistentEntityForBuilderIdentifier_seriesType_state_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB168](a2, CFSTR("uuid"), *(_QWORD *)(a1 + 32));
  MEMORY[0x1BCCAB114](a2, CFSTR("state"), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "code");
  JUMPOUT(0x1BCCAB114);
}

+ (id)freezeSeriesWithIdentifier:(id)a3 metadata:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  char v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__99;
  v31 = __Block_byref_object_dispose__99;
  v32 = 0;
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __75__HDSeriesBuilderEntity_freezeSeriesWithIdentifier_metadata_profile_error___block_invoke;
  v21[3] = &unk_1E6CF5470;
  v14 = v10;
  v22 = v14;
  v15 = v12;
  v23 = v15;
  v16 = v11;
  v24 = v16;
  v25 = &v27;
  v26 = a1;
  v17 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v13, a6, v21);

  if ((v17 & 1) != 0
    && (objc_msgSend((id)v28[5], "performOrJournalWithProfile:error:", v15, a6) & 1) != 0
    && objc_msgSend(a1, "discardBuilderWithIdentifier:profile:error:", v14, v15, a6))
  {
    v18 = (_QWORD *)v28[5];
    if (v18)
      v18 = (_QWORD *)v18[5];
    v19 = v18;
  }
  else
  {
    v19 = 0;
  }

  _Block_object_dispose(&v27, 8);
  return v19;
}

BOOL __75__HDSeriesBuilderEntity_freezeSeriesWithIdentifier_metadata_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  HDFreezeSeriesOperation *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  NSUUID *identifier;
  uint64_t v19;
  NSDictionary *metadata;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v5 = a2;
  +[HDSeriesBuilderEntity persistentEntityForBuilderIdentifier:profile:error:](HDSeriesBuilderEntity, "persistentEntityForBuilderIdentifier:profile:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "metadataWithTransaction:error:", v5, a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = *a3;
    v11 = *a3 == 0;
    if (!v10)
    {
      if (v8)
        objc_msgSend(v7, "addEntriesFromDictionary:", v8);
      if (*(_QWORD *)(a1 + 48))
        objc_msgSend(v7, "addEntriesFromDictionary:");
      v12 = [HDFreezeSeriesOperation alloc];
      v13 = *(void **)(a1 + 32);
      v14 = (void *)objc_msgSend(*(id *)(a1 + 64), "seriesEntityClass");
      v15 = v13;
      v16 = v7;
      if (v12)
      {
        v24.receiver = v12;
        v24.super_class = (Class)HDFreezeSeriesOperation;
        v12 = (HDFreezeSeriesOperation *)objc_msgSendSuper2(&v24, sel_init);
        if (v12)
        {
          v17 = objc_msgSend(v15, "copy");
          identifier = v12->_identifier;
          v12->_identifier = (NSUUID *)v17;

          v19 = objc_msgSend(v16, "copy");
          metadata = v12->_metadata;
          v12->_metadata = (NSDictionary *)v19;

          objc_storeStrong((id *)&v12->_entityClass, v14);
        }
      }

      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v12;

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)discardBuilderWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = a4;
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("uuid"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(a1, "deleteEntitiesWithPredicate:healthDatabase:error:", v10, v11, a5);
  return (char)a5;
}

- (int64_t)stateWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v16[0] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__HDSeriesBuilderEntity_stateWithTransaction_error___block_invoke;
  v11[3] = &unk_1E6CEEDC8;
  v11[4] = &v12;
  -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v7, v8, a4, v11);

  v9 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __52__HDSeriesBuilderEntity_stateWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = HDSQLiteColumnWithNameAsInt64();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)setBuilderState:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("state");
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  objc_msgSend(v8, "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__HDSeriesBuilderEntity_setBuilderState_transaction_error___block_invoke;
  v13[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  v13[4] = a3;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v10, v11, a5, v13);

  return (char)a5;
}

void __59__HDSeriesBuilderEntity_setBuilderState_transaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB114);
}

- (id)metadataWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__99;
  v16 = __Block_byref_object_dispose__99;
  v17 = 0;
  v18[0] = CFSTR("metadata");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__HDSeriesBuilderEntity_metadataWithTransaction_error___block_invoke;
  v11[3] = &unk_1E6CEEDC8;
  v11[4] = &v12;
  -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v7, v8, a4, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __55__HDSeriesBuilderEntity_metadataWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  HDSQLiteColumnWithNameAsData();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[HDCodableMetadataDictionary decodeMetadataFromData:](HDCodableMetadataDictionary, "decodeMetadataFromData:", v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)insertMetadata:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HDSeriesBuilderEntity metadataWithTransaction:error:](self, "metadataWithTransaction:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (*a5)
  {
    v12 = 0;
  }
  else
  {
    v13 = (void *)objc_msgSend(v10, "mutableCopy");
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = v15;

    objc_msgSend(v16, "addEntriesFromDictionary:", v8);
    v17 = (id)objc_msgSend(v16, "copy");
    if (self)
    {
      v25[0] = CFSTR("metadata");
      v18 = (void *)MEMORY[0x1E0C99D20];
      v19 = v9;
      objc_msgSend(v18, "arrayWithObjects:count:", v25, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "databaseForEntity:", self);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __56__HDSeriesBuilderEntity__setMetadata_transaction_error___block_invoke;
      v23[3] = &unk_1E6CE84C8;
      v24 = v17;
      v12 = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v20, v21, a5, v23);

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

void __56__HDSeriesBuilderEntity__setMetadata_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    JUMPOUT(0x1BCCAB120);
  objc_msgSend(*(id *)(a1 + 32), "hk_codableMetadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0D8](a2, CFSTR("metadata"), v4);

}

+ (id)databaseTable
{
  return CFSTR("series_builders");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_53;
}

+ (int64_t)protectionClass
{
  return 1;
}

@end
