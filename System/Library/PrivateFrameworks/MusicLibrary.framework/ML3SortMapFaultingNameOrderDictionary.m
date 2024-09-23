@implementation ML3SortMapFaultingNameOrderDictionary

- (ML3SortMapFaultingNameOrderDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  ML3SortMapFaultingNameOrderDictionary *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ML3SortMapFaultingNameOrderDictionary;
  v8 = -[ML3SortMapFaultingNameOrderDictionary init](&v14, sel_init);
  if (v8)
    v9 = a5 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    do
    {
      v11 = (uint64_t)*a3++;
      v10 = v11;
      v12 = (uint64_t)*a4++;
      -[NSMutableDictionary setObject:forKey:](v8->_dirtyInserts, "setObject:forKey:", v10, v12);
      --a5;
    }
    while (a5);
  }
  return v8;
}

- (unint64_t)count
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[ML3DatabaseConnection executeQuery:](self->_connection, "executeQuery:", CFSTR("SELECT COUNT() from sort_map"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "int64ValueForFirstRowAndColumn");
  v5 = -[NSMutableDictionary count](self->_dirtyInserts, "count") + v4;

  return v5;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dirtyInserts, "setObject:forKey:", a3, a4);
}

- (void)removeObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dirtyInserts, "removeObjectForKey:", a3);
}

- (id)objectForKey:(id)a3
{
  id v5;
  void *v6;
  id v7;
  ML3DatabaseConnection *connection;
  void *v9;
  void *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5079;
  v17 = __Block_byref_object_dispose__5080;
  v18 = 0;
  -[NSMutableDictionary objectForKey:](self->_dirtyInserts, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_dirtyInserts, "objectForKey:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    connection = self->_connection;
    v19[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3DatabaseConnection executeQuery:withParameters:](connection, "executeQuery:withParameters:", CFSTR("SELECT name, name_order, name_section FROM sort_map WHERE name = ?"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__ML3SortMapFaultingNameOrderDictionary_objectForKey___block_invoke;
    v12[3] = &unk_1E5B61900;
    v12[5] = &v13;
    v12[6] = a2;
    v12[4] = self;
    objc_msgSend(v10, "enumerateRowsWithBlock:", v12);
    v7 = (id)v14[5];

  }
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (id)keyEnumerator
{
  _ML3SortMapFaultingNameOrderDictionaryEnumerator *v3;
  void *v4;
  _ML3SortMapFaultingNameOrderDictionaryEnumerator *v5;

  v3 = [_ML3SortMapFaultingNameOrderDictionaryEnumerator alloc];
  -[NSMutableDictionary keyEnumerator](self->_dirtyInserts, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_ML3SortMapFaultingNameOrderDictionaryEnumerator initWithDirtyInsertsEnumerator:connection:](v3, "initWithDirtyInsertsEnumerator:connection:", v4, self->_connection);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyInserts, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __54__ML3SortMapFaultingNameOrderDictionary_objectForKey___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "stringForColumnIndex:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 1);
  v5 = objc_msgSend(v3, "intForColumnIndex:", 2);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithML3NameOrder:", v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("ML3SortMap.m"), 1278, CFSTR("got nil name from the sort map!"));

    v9 = 0;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("ML3SortMap.m"), 1279, CFSTR("valueWithML3NameOrder returned nil!"));

    v9 = v12;
  }

}

@end
