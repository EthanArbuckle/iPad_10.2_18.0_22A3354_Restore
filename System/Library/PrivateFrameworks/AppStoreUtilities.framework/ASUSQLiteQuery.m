@implementation ASUSQLiteQuery

- (id)initOnConnection:(id)a3 descriptor:(id)a4
{
  id v7;
  id v8;
  ASUSQLiteQuery *v9;
  ASUSQLiteQuery *v10;
  uint64_t v11;
  ASUSQLiteQueryDescriptor *descriptor;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASUSQLiteQuery;
  v9 = -[ASUSQLiteQuery init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = objc_msgSend(v8, "copy");
    descriptor = v10->_descriptor;
    v10->_descriptor = (ASUSQLiteQueryDescriptor *)v11;

  }
  return v10;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  void *v6;
  int64_t v7;
  id v8;

  v8 = a3;
  -[ASUSQLiteQueryDescriptor predicate](self->_descriptor, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applyBinding:atIndex:", v8, a4);

  v7 = -[ASUSQLiteQueryDescriptor limitCount](self->_descriptor, "limitCount");
  if (v7)
    objc_msgSend(v8, "bindInt64:atPosition:", v7, (*a4)++);

}

- (ASUSQLiteConnection)connection
{
  return self->_connection;
}

- (id)copyEntityIdentifiers
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__ASUSQLiteQuery_copyEntityIdentifiers__block_invoke;
  v6[3] = &unk_2507A9690;
  v4 = v3;
  v7 = v4;
  -[ASUSQLiteQuery enumeratePersistentIDsUsingBlock:](self, "enumeratePersistentIDsUsingBlock:", v6);

  return v4;
}

void __39__ASUSQLiteQuery_copyEntityIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)copySelectSQLWithProperties:(id)a3
{
  id v4;
  id v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = -[ASUSQLiteQueryDescriptor entityClass](self->_descriptor, "entityClass");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[objc_class disambiguatedSQLForProperty:](v6, "disambiguatedSQLForProperty:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = -[ASUSQLiteQueryDescriptor _newSelectSQLWithProperties:columns:](self->_descriptor, "_newSelectSQLWithProperties:columns:", v7, v5);
  return v13;
}

- (int64_t)countOfEntities
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__ASUSQLiteQuery_countOfEntities__block_invoke;
  v4[3] = &unk_2507A96B8;
  v4[4] = &v5;
  -[ASUSQLiteQuery enumeratePersistentIDsUsingBlock:](self, "enumeratePersistentIDsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __33__ASUSQLiteQuery_countOfEntities__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (BOOL)createTemporaryTableWithName:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  ASUSQLiteConnection *connection;
  id v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("CREATE TEMPORARY TABLE "));
  v22 = v6;
  objc_msgSend(v8, "appendString:", v6);
  objc_msgSend(v8, "appendString:", CFSTR(" AS "));
  v9 = (void *)-[ASUSQLiteQueryDescriptor copy](self->_descriptor, "copy");
  objc_msgSend(v9, "setOrderingDirections:", 0);
  objc_msgSend(v9, "setOrderingProperties:", 0);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = -[ASUSQLiteQueryDescriptor entityClass](self->_descriptor, "entityClass");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        -[objc_class disambiguatedSQLForProperty:](v11, "disambiguatedSQLForProperty:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  v18 = (void *)objc_msgSend(v9, "_newSelectSQLWithProperties:columns:", v12, v10);
  objc_msgSend(v8, "appendString:", v18);
  objc_msgSend(v8, "appendString:", CFSTR(";"));
  connection = self->_connection;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __58__ASUSQLiteQuery_createTemporaryTableWithName_properties___block_invoke;
  v23[3] = &unk_2507A9450;
  v24 = v9;
  v20 = v9;
  LOBYTE(connection) = -[ASUSQLiteConnection executeStatement:error:bindings:](connection, "executeStatement:error:bindings:", v8, 0, v23);

  return (char)connection;
}

void __58__ASUSQLiteQuery_createTemporaryTableWithName_properties___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v5 = 1;
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyBinding:atIndex:", v3, &v5);

}

- (BOOL)deleteAllEntities
{
  ASUSQLiteConnection *connection;
  _QWORD v4[5];

  connection = self->_connection;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__ASUSQLiteQuery_deleteAllEntities__block_invoke;
  v4[3] = &unk_2507A9250;
  v4[4] = self;
  return -[ASUSQLiteConnection performTransaction:error:](connection, "performTransaction:error:", v4, 0);
}

uint64_t __35__ASUSQLiteQuery_deleteAllEntities__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "entityClass");
  v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__ASUSQLiteQuery_deleteAllEntities__block_invoke_2;
  v6[3] = &unk_2507A96E0;
  v6[5] = &v7;
  v6[6] = v2;
  v6[4] = v3;
  objc_msgSend(v3, "enumeratePersistentIDsUsingBlock:", v6);
  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __35__ASUSQLiteQuery_deleteAllEntities__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithPersistentID:onConnection:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "deleteFromDatabase");
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;

}

- (void)enumerateMemoryEntitiesUsingBlock:(id)a3
{
  ASUSQLiteQueryDescriptor *descriptor;
  id v5;
  objc_class *v6;
  id v7;

  descriptor = self->_descriptor;
  v5 = a3;
  v6 = -[ASUSQLiteQueryDescriptor memoryEntityClass](descriptor, "memoryEntityClass");
  if (!v6)
    v6 = (objc_class *)objc_opt_class();
  -[objc_class defaultProperties](v6, "defaultProperties");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ASUSQLiteQuery enumerateMemoryEntitiesWithProperties:usingBlock:](self, "enumerateMemoryEntitiesWithProperties:usingBlock:", v7, v5);

}

- (void)enumerateMemoryEntitiesWithProperties:(id)a3 usingBlock:(id)a4
{
  id v6;
  objc_class *v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  _QWORD v13[2];
  _QWORD v14[4];
  _QWORD v15[2];

  v11 = a3;
  v6 = a4;
  v7 = -[ASUSQLiteQueryDescriptor memoryEntityClass](self->_descriptor, "memoryEntityClass");
  if (!v7)
    v7 = (objc_class *)objc_opt_class();
  if (objc_msgSend(v11, "count"))
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __67__ASUSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke_2;
    v12[3] = &unk_2507A9730;
    v8 = (id *)v13;
    v13[0] = v6;
    v13[1] = v7;
    v9 = v6;
    -[ASUSQLiteQuery enumeratePersistentIDsAndProperties:usingBlock:](self, "enumeratePersistentIDsAndProperties:usingBlock:", v11, v12);
  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __67__ASUSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke;
    v14[3] = &unk_2507A9708;
    v8 = (id *)v15;
    v15[0] = v6;
    v15[1] = v7;
    v10 = v6;
    -[ASUSQLiteQuery enumeratePersistentIDsUsingBlock:](self, "enumeratePersistentIDsUsingBlock:", v14);
  }

}

void __67__ASUSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = objc_alloc_init(*(Class *)(a1 + 40));
  objc_msgSend(v4, "setDatabaseID:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __67__ASUSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;

  v5 = *(objc_class **)(a1 + 40);
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setDatabaseID:", a2);
  objc_msgSend(v7, "setValuesWithDictionary:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__ASUSQLiteQuery_enumeratePersistentIDsUsingBlock___block_invoke;
  v6[3] = &unk_2507A9758;
  v7 = v4;
  v5 = v4;
  -[ASUSQLiteQuery enumeratePersistentIDsAndProperties:usingBlock:](self, "enumeratePersistentIDsAndProperties:usingBlock:", 0, v6);

}

uint64_t __51__ASUSQLiteQuery_enumeratePersistentIDsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  ASUSQLiteConnection *connection;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (self)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v10 = -[ASUSQLiteQueryDescriptor entityClass](self->_descriptor, "entityClass");
    -[objc_class disambiguatedSQLForProperty:](v10, "disambiguatedSQLForProperty:", CFSTR("ROWID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          -[objc_class disambiguatedSQLForProperty:](v10, "disambiguatedSQLForProperty:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }

    v21 = -[ASUSQLiteQueryDescriptor _newSelectSQLWithProperties:columns:](self->_descriptor, "_newSelectSQLWithProperties:columns:", v12, v9);
  }
  else
  {
    v21 = 0;
  }

  connection = self->_connection;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __65__ASUSQLiteQuery_enumeratePersistentIDsAndProperties_usingBlock___block_invoke;
  v22[3] = &unk_2507A97A8;
  v22[4] = self;
  v23 = v8;
  v24 = v7;
  v19 = v7;
  v20 = v8;
  -[ASUSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", v21, v22);

}

void __65__ASUSQLiteQuery_enumeratePersistentIDsAndProperties_usingBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v13[4];
  int v14;

  v5 = a2;
  v6 = a3;
  v14 = 1;
  objc_msgSend(a1[4], "applyBinding:atIndex:", v5, &v14);
  v7 = objc_msgSend(a1[5], "count");
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__ASUSQLiteQuery_enumeratePersistentIDsAndProperties_usingBlock___block_invoke_2;
  v8[3] = &unk_2507A9780;
  v12 = v7;
  v9 = a1[5];
  v10 = a1[6];
  v11 = v13;
  objc_msgSend(v5, "enumerateRowsUsingBlock:", v8);

  _Block_object_dispose(v13, 8);
}

void __65__ASUSQLiteQuery_enumeratePersistentIDsAndProperties_usingBlock___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v13 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x23B7F02C4]();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", a1[7]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v8 = (void *)a1[4];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __65__ASUSQLiteQuery_enumeratePersistentIDsAndProperties_usingBlock___block_invoke_3;
    v14[3] = &unk_2507A92E8;
    v9 = v7;
    v15 = v9;
    v10 = v13;
    v16 = v10;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
    v11 = a1[5];
    v12 = objc_msgSend(v10, "int64ForColumnIndex:", 0);
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v12, v9);

  }
  objc_autoreleasePoolPop(v6);

}

void __65__ASUSQLiteQuery_enumeratePersistentIDsAndProperties_usingBlock___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 40);
  v5 = (a3 + 1);
  v6 = a2;
  ASUSQLiteCopyFoundationValue(v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (ASUSQLiteQueryDescriptor)queryDescriptor
{
  return (ASUSQLiteQueryDescriptor *)(id)-[ASUSQLiteQueryDescriptor copy](self->_descriptor, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
