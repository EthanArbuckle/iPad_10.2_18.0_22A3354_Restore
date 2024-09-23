@implementation HDSyncIdentityEntity

+ (id)concreteIdentityForIdentity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncIdentityEntity _concreteIdentityForIdentity:database:error:]((uint64_t)a1, v8, v9, (uint64_t)a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_concreteIdentityForIdentity:(void *)a3 database:(uint64_t)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  HDConcreteSyncIdentity *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__19;
  v26 = __Block_byref_object_dispose__19;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__HDSyncIdentityEntity__concreteIdentityForIdentity_database_error___block_invoke;
  v17[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v17[4] = v8;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__HDSyncIdentityEntity__concreteIdentityForIdentity_database_error___block_invoke_2;
  v15[3] = &unk_1E6CE9508;
  v10 = v6;
  v16 = v10;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __68__HDSyncIdentityEntity__concreteIdentityForIdentity_database_error___block_invoke_3;
  v14[3] = &unk_1E6CEB2A8;
  v14[4] = &v22;
  v14[5] = &v18;
  if (objc_msgSend(v7, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_concreteIdentityForIdentity_database_error__lookupKey, a4, v17, v15, v14)&& v23[5])
  {
    v11 = [HDConcreteSyncIdentity alloc];
    v12 = -[HDConcreteSyncIdentity initWithIdentity:entity:isChild:](v11, v10, (void *)v23[5], *((_BYTE *)v19 + 24));
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

+ (id)concreteIdentityForPersistentID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(v8, "databaseForEntityClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "concreteIdentityForPersistentID:database:error:", a3, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)concreteIdentityForPersistentID:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  id v8;
  HDSyncIdentityEntity *v9;
  HDConcreteSyncIdentity *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__19;
  v24 = __Block_byref_object_dispose__19;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v9 = -[HDSQLiteEntity initWithPersistentID:]([HDSyncIdentityEntity alloc], "initWithPersistentID:", a3);
  v14[4] = a3;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__HDSyncIdentityEntity_concreteIdentityForPersistentID_database_error___block_invoke;
  v15[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v15[4] = a1;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__HDSyncIdentityEntity_concreteIdentityForPersistentID_database_error___block_invoke_2;
  v14[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__HDSyncIdentityEntity_concreteIdentityForPersistentID_database_error___block_invoke_3;
  v13[3] = &unk_1E6CEB2A8;
  v13[4] = &v20;
  v13[5] = &v16;
  if (objc_msgSend(v8, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &concreteIdentityForPersistentID_database_error__lookupKey, a5, v15, v14, v13))
  {
    v10 = [HDConcreteSyncIdentity alloc];
    v11 = -[HDConcreteSyncIdentity initWithIdentity:entity:isChild:](v10, (void *)v21[5], v9, *((_BYTE *)v17 + 24));
  }
  else
  {
    v11 = 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

id __71__HDSyncIdentityEntity_concreteIdentityForPersistentID_database_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@ FROM %@ WHERE %@=?"), CFSTR("hardware_identifier"), CFSTR("database_identifier"), CFSTR("instance_discriminator"), CFSTR("is_child"), v1, *MEMORY[0x1E0D29618]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __71__HDSyncIdentityEntity_concreteIdentityForPersistentID_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __71__HDSyncIdentityEntity_concreteIdentityForPersistentID_database_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  HDSyncIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = [HDSyncIdentity alloc];
  MEMORY[0x1BCCAB1E0](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1E0](a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a2, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDSyncIdentity initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:](v4, "initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:", v5, v6, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = MEMORY[0x1BCCAB174](a2, 3);
  return 0;
}

+ (id)insertOrLookupConcreteIdentityForIdentity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "insertOrLookupConcreteIdentityForIdentity:database:error:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)insertOrLookupConcreteIdentityForIdentity:(id)a3 database:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSyncIdentityEntity.m"), 192, CFSTR("Attempt to insert a nil sync identity into the db."));

  }
  v22 = 0;
  +[HDSyncIdentityEntity _concreteIdentityForIdentity:database:error:]((uint64_t)a1, v9, v10, (uint64_t)&v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v22;
  v13 = v12;
  if (v11)
  {
    v14 = v11;
  }
  else if (v12)
  {
    if (a5)
    {
      v14 = 0;
      *a5 = objc_retainAutorelease(v12);
    }
    else
    {
      _HKLogDroppedError();
      v14 = 0;
    }
  }
  else
  {
    v23[0] = CFSTR("hardware_identifier");
    v23[1] = CFSTR("database_identifier");
    v23[2] = CFSTR("instance_discriminator");
    v23[3] = CFSTR("is_child");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __81__HDSyncIdentityEntity_insertOrLookupConcreteIdentityForIdentity_database_error___block_invoke;
    v20[3] = &unk_1E6CE84C8;
    v17 = v9;
    v21 = v17;
    objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v10, v16, a5, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      v14 = -[HDConcreteSyncIdentity initWithIdentity:entity:isChild:]([HDConcreteSyncIdentity alloc], v17, v18, 0);
    else
      v14 = 0;

  }
  return v14;
}

void __81__HDSyncIdentityEntity_insertOrLookupConcreteIdentityForIdentity_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "hardwareIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("hardware_identifier"), v4);

  objc_msgSend(*(id *)(a1 + 32), "databaseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("database_identifier"), v5);

  objc_msgSend(*(id *)(a1 + 32), "instanceDiscriminator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("instance_discriminator"), v6);

  objc_msgSend(MEMORY[0x1E0C9AAA0], "intValue");
  JUMPOUT(0x1BCCAB114);
}

+ (id)updateIsChild:(BOOL)a3 concreteIdentity:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  id v15;
  HDConcreteSyncIdentity *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  BOOL v22;
  _QWORD v23[5];

  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "databaseForEntityClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __73__HDSyncIdentityEntity_updateIsChild_concreteIdentity_transaction_error___block_invoke;
  v23[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v23[4] = a1;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __73__HDSyncIdentityEntity_updateIsChild_concreteIdentity_transaction_error___block_invoke_2;
  v20[3] = &unk_1E6CEB2D0;
  v22 = a3;
  v13 = v10;
  v21 = v13;
  v14 = objc_msgSend(v12, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &updateIsChild_concreteIdentity_transaction_error__updateKey, a6, v23, v20, 0);
  v15 = 0;
  if (v14)
  {
    v16 = [HDConcreteSyncIdentity alloc];
    objc_msgSend(v13, "identity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "entity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HDConcreteSyncIdentity initWithIdentity:entity:isChild:](v16, v17, v18, a3);

  }
  return v15;
}

id __73__HDSyncIdentityEntity_updateIsChild_concreteIdentity_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ? WHERE %@ = ? AND %@ = ? AND %@ = ?"), v2, CFSTR("is_child"), CFSTR("hardware_identifier"), CFSTR("database_identifier"), CFSTR("instance_discriminator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __73__HDSyncIdentityEntity_updateIsChild_concreteIdentity_transaction_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hardwareIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "identity");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instanceDiscriminator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

id __68__HDSyncIdentityEntity__concreteIdentityForIdentity_database_error___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *MEMORY[0x1E0D29618];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@, %@ FROM %@ WHERE %@=? AND %@=? AND %@=?"), v2, CFSTR("is_child"), v3, CFSTR("hardware_identifier"), CFSTR("database_identifier"), CFSTR("instance_discriminator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __68__HDSyncIdentityEntity__concreteIdentityForIdentity_database_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "hardwareIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "databaseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "instanceDiscriminator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

uint64_t __68__HDSyncIdentityEntity__concreteIdentityForIdentity_database_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  HDSyncIdentityEntity *v4;
  uint64_t v5;
  void *v6;

  v4 = -[HDSQLiteEntity initWithPersistentID:]([HDSyncIdentityEntity alloc], "initWithPersistentID:", HDSQLiteColumnAsInt64());
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = MEMORY[0x1BCCAB174](a2, 1);
  return 0;
}

- (id)concreteIdentityWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  HDConcreteSyncIdentity *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  objc_msgSend(v6, "databaseForEntity:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__19;
  v22 = __Block_byref_object_dispose__19;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v12[4] = self;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__HDSyncIdentityEntity_concreteIdentityWithTransaction_error___block_invoke;
  v13[3] = &unk_1E6CEB2F8;
  v13[4] = self;
  v11[5] = &v14;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__HDSyncIdentityEntity_concreteIdentityWithTransaction_error___block_invoke_2;
  v12[3] = &unk_1E6CE9508;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__HDSyncIdentityEntity_concreteIdentityWithTransaction_error___block_invoke_3;
  v11[3] = &unk_1E6CEB2A8;
  v11[4] = &v18;
  if (objc_msgSend(v7, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &concreteIdentityWithTransaction_error__lookupKey, a4, v13, v12, v11))
  {
    v8 = [HDConcreteSyncIdentity alloc];
    v9 = -[HDConcreteSyncIdentity initWithIdentity:entity:isChild:](v8, (void *)v19[5], self, *((_BYTE *)v15 + 24));
  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v9;
}

id __62__HDSyncIdentityEntity_concreteIdentityWithTransaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@ FROM %@ WHERE %@=?"), CFSTR("hardware_identifier"), CFSTR("database_identifier"), CFSTR("instance_discriminator"), CFSTR("is_child"), v1, *MEMORY[0x1E0D29618]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __62__HDSyncIdentityEntity_concreteIdentityWithTransaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __62__HDSyncIdentityEntity_concreteIdentityWithTransaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  HDSyncIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = [HDSyncIdentity alloc];
  MEMORY[0x1BCCAB1E0](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1E0](a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a2, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDSyncIdentity initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:](v4, "initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:", v5, v6, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = MEMORY[0x1BCCAB174](a2, 3);
  return 0;
}

+ (BOOL)enumerateConcreteIdentitiesWithTransaction:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];

  v8 = a5;
  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92__HDSyncIdentityEntity_enumerateConcreteIdentitiesWithTransaction_error_enumerationHandler___block_invoke;
  v14[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v14[4] = a1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__HDSyncIdentityEntity_enumerateConcreteIdentitiesWithTransaction_error_enumerationHandler___block_invoke_2;
  v12[3] = &unk_1E6CE82B0;
  v10 = v8;
  LOBYTE(a4) = objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &enumerateConcreteIdentitiesWithTransaction_error_enumerationHandler__lookupKey, a4, v14, 0, v12);

  return (char)a4;
}

id __92__HDSyncIdentityEntity_enumerateConcreteIdentitiesWithTransaction_error_enumerationHandler___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0CB3940];
  v1 = *MEMORY[0x1E0D29618];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@ FROM %@"), v1, CFSTR("hardware_identifier"), CFSTR("database_identifier"), CFSTR("instance_discriminator"), CFSTR("is_child"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __92__HDSyncIdentityEntity_enumerateConcreteIdentitiesWithTransaction_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  HDSyncIdentityEntity *v4;
  HDSyncIdentity *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  HDSyncIdentity *v10;
  id v11;

  v4 = -[HDSQLiteEntity initWithPersistentID:]([HDSyncIdentityEntity alloc], "initWithPersistentID:", HDSQLiteColumnAsInt64());
  v5 = [HDSyncIdentity alloc];
  v6 = 1;
  MEMORY[0x1BCCAB1E0](a2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1E0](a2, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a2, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDSyncIdentity initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:](v5, "initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:", v7, v8, v9);

  LOBYTE(a2) = MEMORY[0x1BCCAB174](a2, 4);
  v11 = -[HDConcreteSyncIdentity initWithIdentity:entity:isChild:]([HDConcreteSyncIdentity alloc], v10, v4, a2);
  if (v11)
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v6;
}

+ (id)childIdentitiesForCurrentSyncIdentityWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__19;
  v19 = __Block_byref_object_dispose__19;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "unprotectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__19;
  v13[4] = __Block_byref_object_dispose__19;
  v14 = 0;
  v11[5] = &v15;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__HDSyncIdentityEntity_childIdentitiesForCurrentSyncIdentityWithTransaction_error___block_invoke;
  v12[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v12[4] = a1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__HDSyncIdentityEntity_childIdentitiesForCurrentSyncIdentityWithTransaction_error___block_invoke_3;
  v11[3] = &unk_1E6CEB2A8;
  v11[4] = v13;
  if (objc_msgSend(v7, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &childIdentitiesForCurrentSyncIdentityWithTransaction_error__lookupKey, a4, v12, &__block_literal_global_23, v11))v8 = (void *)v16[5];
  else
    v8 = 0;
  v9 = v8;
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(&v15, 8);
  return v9;
}

id __83__HDSyncIdentityEntity_childIdentitiesForCurrentSyncIdentityWithTransaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SELECT %@, %@, %@ FROM %@ WHERE %@=?"), CFSTR("hardware_identifier"), CFSTR("database_identifier"), CFSTR("instance_discriminator"), v1, CFSTR("is_child"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __83__HDSyncIdentityEntity_childIdentitiesForCurrentSyncIdentityWithTransaction_error___block_invoke_2(int a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, 1);
}

uint64_t __83__HDSyncIdentityEntity_childIdentitiesForCurrentSyncIdentityWithTransaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  HDSyncIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = [HDSyncIdentity alloc];
  MEMORY[0x1BCCAB1E0](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1E0](a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a2, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDSyncIdentity initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:](v4, "initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:", v5, v6, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 1;
}

+ (id)databaseTable
{
  return CFSTR("sync_identities");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_10;
}

+ (id)uniquedColumns
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("hardware_identifier");
  v3[1] = CFSTR("database_identifier");
  v3[2] = CFSTR("instance_discriminator");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)protectionClass
{
  return 1;
}

@end
