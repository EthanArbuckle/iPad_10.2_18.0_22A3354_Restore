@implementation AMSSQLiteEntity

- (AMSSQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  id v7;
  AMSSQLiteEntity *v8;
  AMSSQLiteEntity *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMSSQLiteEntity;
  v8 = -[AMSSQLiteEntity init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a4);
    v9->_persistentID = a3;
  }

  return v9;
}

- (AMSSQLiteEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFUUID *v11;
  id v12;
  AMSSQLiteEntity *v13;
  id v14;
  id v15;
  AMSSQLiteEntity *v16;
  _QWORD v18[4];
  AMSSQLiteEntity *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("ROWID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "longLongValue");
  }
  else
  {
    v11 = CFUUIDCreate(0);
    v10 = *(_OWORD *)&CFUUIDGetUUIDBytes(v11);
    CFRelease(v11);
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v12 = -[AMSSQLiteEntity _copyTableClusteredValuesWithValues:](self, "_copyTableClusteredValuesWithValues:", v6);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __55__AMSSQLiteEntity_initWithPropertyValues_onConnection___block_invoke;
  v18[3] = &unk_1E25459F0;
  v13 = self;
  v19 = v13;
  v14 = v12;
  v20 = v14;
  v23 = v10;
  v15 = v7;
  v21 = v15;
  v22 = &v24;
  objc_msgSend(v15, "performTransaction:", v18);
  if (!*((_BYTE *)v25 + 24))
  {

    v13 = 0;
  }
  v16 = -[AMSSQLiteEntity initWithPersistentID:onConnection:](v13, "initWithPersistentID:onConnection:", v10, v15);

  _Block_object_dispose(&v24, 8);
  return v16;
}

uint64_t __55__AMSSQLiteEntity_initWithPropertyValues_onConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__AMSSQLiteEntity_initWithPropertyValues_onConnection___block_invoke_2;
  v9[3] = &unk_1E25459C8;
  v3 = *(_QWORD *)(a1 + 64);
  v12 = v2;
  v13 = v3;
  v4 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  return v7;
}

uint64_t __55__AMSSQLiteEntity_initWithPropertyValues_onConnection___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 48), "_insertValues:intoTable:withPersistentID:onConnection:", a3, a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

+ (id)databaseTable
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("+[%@ databaseTable] not implemented"), a1);
  return 0;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "joinClauseForProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "databaseTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%@"), v8, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)foreignDatabaseColumnForProperty:(id)a3
{
  return 0;
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  return 0;
}

+ (id)foreignDatabaseTablesToDelete
{
  return 0;
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  return 0;
}

+ (id)joinClauseForProperty:(id)a3
{
  return 0;
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

- (BOOL)deleteFromDatabase
{
  AMSSQLiteConnection *connection;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  connection = self->_connection;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AMSSQLiteEntity_deleteFromDatabase__block_invoke;
  v5[3] = &unk_1E2545A18;
  v5[4] = self;
  v5[5] = &v6;
  -[AMSSQLiteConnection performTransaction:](connection, "performTransaction:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

BOOL __37__AMSSQLiteEntity_deleteFromDatabase__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "databaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "_deleteRowFromTable:usingColumn:", v3, CFSTR("ROWID"));

  objc_msgSend((id)objc_opt_class(), "foreignDatabaseTablesToDelete");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend((id)objc_opt_class(), "foreignKeyColumnForTable:", v9, (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_deleteRowFromTable:usingColumn:", v9, v10);
          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          {

            goto LABEL_12;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 8);
    *(_QWORD *)(v11 + 8) = 0;

    v13 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)existsInDatabase
{
  id v3;
  void *v4;
  void *v5;
  AMSSQLiteConnection *connection;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "databaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;"), v4, CFSTR("ROWID"));

  connection = self->_connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__AMSSQLiteEntity_existsInDatabase__block_invoke;
  v8[3] = &unk_1E2545A40;
  v8[4] = self;
  v8[5] = &v9;
  -[AMSSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", v5, v8);
  LOBYTE(self) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

void __35__AMSSQLiteEntity_existsInDatabase__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  objc_msgSend(v4, "bindInt64:atPosition:", v3, 1);
  LOBYTE(v3) = objc_msgSend(v4, "hasRows");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

- (id)getValuesForProperties:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  AMSSQLiteConnection *connection;
  id v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  void *v35;
  _BYTE v36[128];
  const __CFString *v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") == 1
    && (objc_msgSend(v4, "objectAtIndexedSubscript:", 0),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ROWID")),
        v5,
        v6))
  {
    v37 = CFSTR("ROWID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_persistentID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend(v9, "databaseTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT "));
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __42__AMSSQLiteEntity_getValuesForProperties___block_invoke;
    v32[3] = &unk_1E2545A68;
    v35 = v9;
    v12 = v10;
    v33 = v12;
    v13 = v11;
    v34 = v13;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v32);
    objc_msgSend(v12, "appendString:", CFSTR(" FROM "));
    objc_msgSend(v12, "appendString:", v7);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v18);
          objc_msgSend(v12, "appendString:", CFSTR(" "));
          objc_msgSend(v12, "appendString:", v19);
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v16);
    }

    objc_msgSend(v12, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v12, "appendString:", v7);
    objc_msgSend(v12, "appendString:", CFSTR(".ROWID = ?;"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    connection = self->_connection;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __42__AMSSQLiteEntity_getValuesForProperties___block_invoke_2;
    v25[3] = &unk_1E2545AB8;
    v25[4] = self;
    v26 = v4;
    v22 = v20;
    v27 = v22;
    -[AMSSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", v12, v25);
    v23 = v27;
    v8 = v22;

  }
  return v8;
}

void __42__AMSSQLiteEntity_getValuesForProperties___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a1[6];
  v6 = a2;
  objc_msgSend(v5, "disambiguatedSQLForProperty:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
    objc_msgSend(a1[4], "appendString:", CFSTR(", "));
  objc_msgSend(a1[4], "appendString:", v8);
  objc_msgSend(a1[6], "joinClauseForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(a1[5], "addObject:", v7);

}

void __42__AMSSQLiteEntity_getValuesForProperties___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  objc_msgSend(v4, "bindInt64:atPosition:", v3, 1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AMSSQLiteEntity_getValuesForProperties___block_invoke_3;
  v5[3] = &unk_1E25403B8;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateRowsUsingBlock:", v5);

}

void __42__AMSSQLiteEntity_getValuesForProperties___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v8 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x18D78A1C4]();
  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__AMSSQLiteEntity_getValuesForProperties___block_invoke_4;
    v9[3] = &unk_1E2545A90;
    v7 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  }
  objc_autoreleasePoolPop(v6);

}

void __42__AMSSQLiteEntity_getValuesForProperties___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  AMSSQLiteCopyFoundationValue(v5, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99D80]);
  v9 = v8;
  if (v6)
  {
    v10 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v6, v7, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v11, v7, 0);

  }
  v12 = -[AMSSQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v10);

  return v12;
}

- (BOOL)setValuesWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AMSSQLiteConnection *connection;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v5, "databaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke;
  v11[3] = &unk_1E2545B58;
  v11[4] = self;
  v8 = v4;
  v12 = v8;
  v15 = v5;
  v9 = v6;
  v13 = v9;
  v14 = &v16;
  -[AMSSQLiteConnection performTransaction:](connection, "performTransaction:", v11);
  LOBYTE(v5) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v5;
}

uint64_t __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyTableClusteredValuesWithValues:", *(_QWORD *)(a1 + 40));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_2;
  v7[3] = &unk_1E2545B30;
  v11 = *(_QWORD *)(a1 + 64);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v10 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  return v5;
}

void __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  __CFString *v10;
  char v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 56), "foreignKeyColumnForTable:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = (__CFString *)v9;
  else
    v10 = CFSTR("ROWID");
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  v11 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));
  v12 = MEMORY[0x1E0C809B0];
  if ((v11 & 1) == 0)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT 1 FROM "));
    objc_msgSend(v13, "appendString:", v7);
    objc_msgSend(v13, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v13, "appendString:", v10);
    objc_msgSend(v13, "appendString:", CFSTR(" =  ? LIMIT 1;"));
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(v14 + 8);
    v32[0] = v12;
    v32[1] = 3221225472;
    v32[2] = __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_3;
    v32[3] = &unk_1E2545A40;
    v32[4] = v14;
    v32[5] = &v33;
    objc_msgSend(v15, "executeQuery:withResults:", v13, v32);

  }
  if (*((_BYTE *)v34 + 24))
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("UPDATE "));
    objc_msgSend(v17, "appendString:", v7);
    objc_msgSend(v17, "appendString:", CFSTR(" SET "));
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v31 = 0;
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_4;
    v26[3] = &unk_1E2545AE0;
    v29 = v30;
    v18 = v17;
    v27 = v18;
    v19 = v16;
    v28 = v19;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v26);
    objc_msgSend(v18, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v18, "appendString:", v7);
    objc_msgSend(v18, "appendString:", CFSTR("."));
    objc_msgSend(v18, "appendString:", v10);
    objc_msgSend(v18, "appendString:", CFSTR(" = ?;"));
    v20 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_5;
    v23[3] = &unk_1E2545B08;
    v21 = v19;
    v22 = *(_QWORD *)(a1 + 40);
    v24 = v21;
    v25 = v22;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v20, "executeStatement:error:bindings:", v18, 0, v23);

    _Block_object_dispose(v30, 8);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_opt_class(), "_insertValues:intoTable:withPersistentID:onConnection:", v8, v7, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) ^ 1;
  _Block_object_dispose(&v33, 8);

}

void __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  objc_msgSend(v4, "bindInt64:atPosition:", v3, 1);
  LOBYTE(v3) = objc_msgSend(v4, "hasRows");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

void __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v6);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" = ?"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = 1;
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        AMSSQLiteBindFoundationValue(v3, v10 + v9, *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9));
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v8 = (v10 + v9);
    }
    while (v6);
    v11 = (v10 + v9);
  }
  else
  {
    v11 = 1;
  }

  objc_msgSend(v3, "bindInt64:atPosition:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), v11, (_QWORD)v12);
}

- (id)valueForProperty:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSSQLiteEntity getValuesForProperties:](self, "getValuesForProperties:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)_insertValues:(id)a3 intoTable:(id)a4 withPersistentID:(int64_t)a5 onConnection:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  char v27;
  id v28;
  uint64_t v29;
  _QWORD v32[4];
  id v33;
  int64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("INSERT OR REPLACE INTO "));
  objc_msgSend(v12, "appendString:", v10);
  objc_msgSend(v12, "appendString:", CFSTR(" ("));
  objc_msgSend(a1, "foreignKeyColumnForTable:", v10);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR("ROWID");
  objc_msgSend(v12, "appendString:", v15);
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  v40 = 0u;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v41 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v12, "appendString:", CFSTR(", "));
        objc_msgSend(v12, "appendString:", v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v18);
  }

  objc_msgSend(v12, "appendString:", CFSTR(") VALUES (?"));
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = v16;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    while (1)
    {
      if (*(_QWORD *)v37 != v25)
        objc_enumerationMutation(v22);
      objc_msgSend(v12, "appendString:", CFSTR(", ?"));
      if (!--v24)
      {
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (!v24)
          break;
      }
    }
  }

  objc_msgSend(v12, "appendString:", CFSTR(");"));
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __73__AMSSQLiteEntity__insertValues_intoTable_withPersistentID_onConnection___block_invoke;
  v32[3] = &unk_1E2543588;
  v34 = a5;
  v35 = 0;
  v26 = v22;
  v33 = v26;
  v27 = objc_msgSend(v11, "executeStatement:error:bindings:", v12, &v35, v32);
  v28 = v35;
  if (v28)
  {
    v29 = objc_opt_class();
    NSLog(CFSTR("[%public}@] Error: %@"), v29, v28);
  }

  return v27;
}

void __73__AMSSQLiteEntity__insertValues_intoTable_withPersistentID_onConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "bindInt64:atPosition:", *(_QWORD *)(a1 + 40), 1);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    v8 = 2;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        AMSSQLiteBindFoundationValue(v3, v8 + v9, v10);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v8 = (v8 + v9);
    }
    while (v6);
  }

}

- (id)_copyTableClusteredValuesWithValues:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  void *v16;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = (void *)objc_opt_class();
  objc_msgSend(v6, "databaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__AMSSQLiteEntity__copyTableClusteredValuesWithValues___block_invoke;
  v13[3] = &unk_1E2545B80;
  v16 = v6;
  v14 = v7;
  v8 = v5;
  v15 = v8;
  v9 = v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v13);

  v10 = v15;
  v11 = v8;

  return v11;
}

void __55__AMSSQLiteEntity__copyTableClusteredValuesWithValues___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ROWID")) & 1) == 0)
  {
    objc_msgSend(a1[6], "foreignDatabaseTableForProperty:", v10);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (id)v6;
      objc_msgSend(a1[6], "foreignDatabaseColumnForProperty:", v10);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v10;
      v7 = a1[4];
    }
    objc_msgSend(a1[5], "objectForKey:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(a1[5], "setObject:forKey:", v9, v7);
    }
    objc_msgSend(v9, "setObject:forKey:", v5, v8);

  }
}

- (BOOL)_deleteRowFromTable:(id)a3 usingColumn:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  AMSSQLiteConnection *connection;
  _QWORD v12[5];

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ?;"), v8, v7);

  connection = self->_connection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__AMSSQLiteEntity__deleteRowFromTable_usingColumn___block_invoke;
  v12[3] = &unk_1E2543448;
  v12[4] = self;
  LOBYTE(v8) = -[AMSSQLiteConnection executeStatement:error:bindings:](connection, "executeStatement:error:bindings:", v9, 0, v12);

  return (char)v8;
}

uint64_t __51__AMSSQLiteEntity__deleteRowFromTable_usingColumn___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindInt64:atPosition:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 1);
}

- (AMSSQLiteConnection)connection
{
  return self->_connection;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (id)anyOnConnection:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__63;
  v20 = __Block_byref_object_dispose__63;
  v21 = 0;
  objc_msgSend(a1, "queryOnConnection:predicate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__AMSSQLiteEntity_AMSSQLiteQueryAdditions__anyOnConnection_predicate___block_invoke;
  v12[3] = &unk_1E2545D30;
  v14 = &v16;
  v15 = a1;
  v9 = v6;
  v13 = v9;
  objc_msgSend(v8, "enumeratePersistentIDsUsingBlock:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __70__AMSSQLiteEntity_AMSSQLiteQueryAdditions__anyOnConnection_predicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithPersistentID:onConnection:", a2, *(_QWORD *)(a1 + 32));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a4 = 1;
}

+ (id)countForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return (id)objc_msgSend(a1, "_aggregateValueForProperty:function:predicate:onConnection:", a3, CFSTR("COUNT"), a4, a5);
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return (id)objc_msgSend(a1, "_aggregateValueForProperty:function:predicate:onConnection:", a3, CFSTR("MAX"), a4, a5);
}

+ (id)minValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return (id)objc_msgSend(a1, "_aggregateValueForProperty:function:predicate:onConnection:", a3, CFSTR("MIN"), a4, a5);
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4
{
  return (id)objc_msgSend(a1, "queryOnConnection:predicate:orderingProperties:", a3, a4, 0);
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSSQLiteQueryDescriptor *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(AMSSQLiteQueryDescriptor);
  -[AMSSQLiteQueryDescriptor setEntityClass:](v11, "setEntityClass:", a1);
  -[AMSSQLiteQueryDescriptor setMemoryEntityClass:](v11, "setMemoryEntityClass:", objc_msgSend(a1, "memoryEntityClass"));
  -[AMSSQLiteQueryDescriptor setOrderingProperties:](v11, "setOrderingProperties:", v8);

  -[AMSSQLiteQueryDescriptor setPredicate:](v11, "setPredicate:", v9);
  v12 = -[AMSSQLiteQuery initOnConnection:descriptor:]([AMSSQLiteQuery alloc], "initOnConnection:descriptor:", v10, v11);

  return v12;
}

+ (id)_aggregateValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 onConnection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AMSSQLiteQueryDescriptor *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  AMSSQLiteQueryDescriptor *v21;
  id v22;
  _QWORD v24[4];
  AMSSQLiteQueryDescriptor *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__63;
  v31 = __Block_byref_object_dispose__63;
  v32 = 0;
  v14 = objc_alloc_init(AMSSQLiteQueryDescriptor);
  -[AMSSQLiteQueryDescriptor setEntityClass:](v14, "setEntityClass:", a1);
  -[AMSSQLiteQueryDescriptor setPredicate:](v14, "setPredicate:", v12);
  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(a1, "disambiguatedSQLForProperty:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@(%@)"), v11, v16);

  v33[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[AMSSQLiteQueryDescriptor _newSelectSQLWithProperties:columns:](v14, "_newSelectSQLWithProperties:columns:", v18, v19);

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __103__AMSSQLiteEntity_AMSSQLiteQueryAdditions___aggregateValueForProperty_function_predicate_onConnection___block_invoke;
  v24[3] = &unk_1E2545A40;
  v21 = v14;
  v25 = v21;
  v26 = &v27;
  objc_msgSend(v13, "executeQuery:withResults:", v20, v24);
  v22 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v22;
}

void __103__AMSSQLiteEntity_AMSSQLiteQueryAdditions___aggregateValueForProperty_function_predicate_onConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  int v7;

  v7 = 1;
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyBinding:atIndex:", v4, &v7);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __103__AMSSQLiteEntity_AMSSQLiteQueryAdditions___aggregateValueForProperty_function_predicate_onConnection___block_invoke_2;
  v6[3] = &unk_1E2545D58;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "enumerateRowsUsingBlock:", v6);

}

void __103__AMSSQLiteEntity_AMSSQLiteQueryAdditions___aggregateValueForProperty_function_predicate_onConnection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  AMSSQLiteCopyFoundationValue(a2, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a4 = 1;
}

@end
