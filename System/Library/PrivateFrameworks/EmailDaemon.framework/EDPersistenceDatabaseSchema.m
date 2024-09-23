@implementation EDPersistenceDatabaseSchema

+ (id)mailboxesTableName
{
  return CFSTR("mailboxes");
}

+ (id)mailboxURLColumnName
{
  return CFSTR("url");
}

+ (void)_initializeSchemas
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __49__EDPersistenceDatabaseSchema__initializeSchemas__block_invoke;
  v22[3] = &unk_1E949F928;
  v24 = a1;
  v5 = v3;
  v23 = v5;
  objc_msgSend(a1, "_schemaWithPopulationBlock:", v22);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)sSchema;
  sSchema = v6;

  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __49__EDPersistenceDatabaseSchema__initializeSchemas__block_invoke_2;
  v21[3] = &__block_descriptor_40_e43_v24__0__NSMutableArray_8__NSMutableArray_16l;
  v21[4] = a1;
  objc_msgSend(a1, "_schemaWithPopulationBlock:", v21);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)sProtectedSchema;
  sProtectedSchema = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v14, "resolveWithSchema:", sSchema) & 1) == 0
          && (objc_msgSend(v14, "resolveWithSchema:", sProtectedSchema) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EDPersistenceDatabaseSchema.m"), 98, CFSTR("Unable to resolve association: %@"), v14);

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v11);
  }

}

+ (id)_schemaWithPopulationBlock:(id)a3
{
  void (**v4)(id, id);
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id))a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4[2](v4, v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F038]), "initWithTables:", v5);
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mailboxesTableName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, 0);
  v18 = a1;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v20;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v15, "resolveWithSchema:", v6) & 1) == 0
          && (objc_msgSend(v15, "resolveToStringForTableNames:", v10) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("EDPersistenceDatabaseSchema.m"), 112, CFSTR("Unable to resolve foreign key constraint: %@"), v15);

        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  return v6;
}

void __49__EDPersistenceDatabaseSchema__initializeSchemas__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_protectedSchemaProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v14 = 0;
        objc_msgSend(v11, "protectedTablesAndForeignKeysToResolve:", &v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v14;
        objc_msgSend(v5, "addObjectsFromArray:", v12);
        objc_msgSend(v6, "addObjectsFromArray:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

+ (id)_protectedSchemaProviders
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)propertiesTableSchema
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(a1, "propertiesTableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("key"), 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "blobColumnWithName:nullable:", CFSTR("value"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithName:rowIDType:columns:", v4, 1, v7);

  objc_msgSend(v8, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E94E5530, 1);
  return v8;
}

+ (id)propertiesTableName
{
  return CFSTR("properties");
}

+ (id)partialMailboxesTableSchema
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(a1, "mailboxesTableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("url"), 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("total_count"), 0, &unk_1E94E48E0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("unread_count"), 0, &unk_1E94E48E0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("deleted_count"), 0, &unk_1E94E48E0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithName:rowIDType:columns:", v4, 2, v9);

  objc_msgSend(v10, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E94E5548, 1);
  return v10;
}

void __49__EDPersistenceDatabaseSchema__initializeSchemas__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "_schemaProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v15 = 0;
        v16 = 0;
        objc_msgSend(v11, "tablesAndForeignKeysToResolve:associationsToResolve:", &v16, &v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v16;
        v14 = v15;
        objc_msgSend(v5, "addObjectsFromArray:", v12);
        objc_msgSend(v6, "addObjectsFromArray:", v13);
        objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

+ (id)_schemaProviders
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(a1, "additionalSchemaProviders", v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_flatten");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (EFSQLSchema)schema
{
  void *v3;
  id v4;

  os_unfair_lock_lock((os_unfair_lock_t)&sSchemaLock);
  v3 = (void *)sSchema;
  if (!sSchema)
  {
    objc_msgSend(a1, "_initializeSchemas");
    v3 = (void *)sSchema;
  }
  v4 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&sSchemaLock);
  return (EFSQLSchema *)v4;
}

+ (EFSQLSchema)protectedSchema
{
  void *v3;
  id v4;

  os_unfair_lock_lock((os_unfair_lock_t)&sSchemaLock);
  v3 = (void *)sProtectedSchema;
  if (!sProtectedSchema)
  {
    objc_msgSend(a1, "_initializeSchemas");
    v3 = (void *)sProtectedSchema;
  }
  v4 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&sSchemaLock);
  return (EFSQLSchema *)v4;
}

+ (void)test_resetSchema
{
  void *v4;
  void *v5;
  void *v6;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EDPersistenceDatabaseSchema.m"), 48, CFSTR("%s can only be called from unit tests"), "+[EDPersistenceDatabaseSchema test_resetSchema]");

  }
  os_unfair_lock_lock((os_unfair_lock_t)&sSchemaLock);
  v4 = (void *)sSchema;
  sSchema = 0;

  v5 = (void *)sProtectedSchema;
  sProtectedSchema = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&sSchemaLock);
}

+ (void)registerAdditionalPropertiesForPropertyMapper:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("ROWID"), CFSTR("interaction_log"), MEMORY[0x1E0C9AA70], objc_opt_class(), sel_eventID);
  objc_msgSend(v3, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("version"), CFSTR("interaction_log"), MEMORY[0x1E0C9AA70], objc_opt_class(), sel_version);
  objc_msgSend(v3, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("date"), CFSTR("interaction_log"), MEMORY[0x1E0C9AA70], objc_opt_class(), sel_date);
  objc_msgSend(v3, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("account"), CFSTR("interaction_log"), MEMORY[0x1E0C9AA70], objc_opt_class(), sel_accountID);
  objc_msgSend(v3, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("mailbox"), CFSTR("interaction_log"), MEMORY[0x1E0C9AA70], objc_opt_class(), sel_mailboxID);
  objc_msgSend(v3, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("conversation"), CFSTR("interaction_log"), MEMORY[0x1E0C9AA70], objc_opt_class(), sel_conversationID);
  objc_msgSend(v3, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("message_id_hash"), CFSTR("interaction_log"), MEMORY[0x1E0C9AA70], objc_opt_class(), sel_messageIDHash);
  objc_msgSend(v3, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("message"), CFSTR("interaction_log"), MEMORY[0x1E0C9AA70], objc_opt_class(), sel_messagePersistentID);
  objc_msgSend(v3, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("name"), CFSTR("interaction_log"), MEMORY[0x1E0C9AA70], objc_opt_class(), sel_name);
  objc_msgSend(v3, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("data"), CFSTR("interaction_log"), MEMORY[0x1E0C9AA70], objc_opt_class(), sel_data);

}

+ (id)additionalSchemaProviders
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
