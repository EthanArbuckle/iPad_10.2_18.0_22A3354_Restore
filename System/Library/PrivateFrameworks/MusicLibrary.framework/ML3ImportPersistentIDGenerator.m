@implementation ML3ImportPersistentIDGenerator

- (ML3ImportPersistentIDGenerator)initWithDatabaseConnection:(id)a3 tableName:(id)a4
{
  id v6;
  id v7;
  ML3ImportPersistentIDGenerator *v8;
  uint64_t v9;
  NSMutableDictionary *pregeneratedIdMappings;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3ImportPersistentIDGenerator;
  v8 = -[ML3PersistentIDGenerator initWithDatabaseConnection:tableName:](&v12, sel_initWithDatabaseConnection_tableName_, v6, v7);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    pregeneratedIdMappings = v8->_pregeneratedIdMappings;
    v8->_pregeneratedIdMappings = (NSMutableDictionary *)v9;

  }
  return v8;
}

- (void)addIdMapping:(id)a3 forProperty:(unsigned int)a4
{
  uint64_t v4;
  NSMutableDictionary *pregeneratedIdMappings;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  pregeneratedIdMappings = self->_pregeneratedIdMappings;
  v7 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](pregeneratedIdMappings, "setObject:forKey:", v7, v6);

}

- (int64_t)nextPersistentIDForImportItem:(shared_ptr<ML3ImportItem>)a3
{
  ML3ImportItem *var0;
  uint64_t v5;
  id v6;
  uint64_t j;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  SEL v20;
  const char *v21;
  id obj;
  id obja;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  var0 = a3.var0;
  v35 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[NSMutableDictionary allKeys](self->_pregeneratedIdMappings, "allKeys", a3.var0, a3.var1);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (!v5)
  {

LABEL_13:
    v21 = sel_nextPersistentID;
    do
    {
      v28.receiver = self;
      v28.super_class = (Class)ML3ImportPersistentIDGenerator;
      v6 = objc_msgSendSuper2(&v28, v21, v21);
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[NSMutableDictionary allKeys](self->_pregeneratedIdMappings, "allKeys");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(obja);
            -[NSMutableDictionary objectForKey:](self->_pregeneratedIdMappings, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "allKeysForObject:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count") == 0;

            if (!v18)
              v6 = 0;

          }
          v12 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        }
        while (v12);
      }

    }
    while (!v6);
    return (int64_t)v6;
  }
  v6 = 0;
  v20 = *(SEL *)v30;
  do
  {
    for (j = 0; j != v5; ++j)
    {
      if (*(SEL *)v30 != v20)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
      -[NSMutableDictionary objectForKey:](self->_pregeneratedIdMappings, "objectForKey:", v8, v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)var0 + 32))(*(_QWORD *)var0, objc_msgSend(v8, "longLongValue")));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v6 = (id)objc_msgSend(v11, "longLongValue");

    }
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  }
  while (v5);

  if (!v6)
    goto LABEL_13;
  return (int64_t)v6;
}

- (void)removePersistentIDFromIdMapping:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary allKeys](self->_pregeneratedIdMappings, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v21;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKey:](self->_pregeneratedIdMappings, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allKeysForObject:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v17;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v17 != v12)
                objc_enumerationMutation(v10);
              objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++));
            }
            while (v11 != v13);
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v11);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pregeneratedIdMappings, 0);
}

@end
