@implementation ML3SortMapFaultingEntryArray

void __64__ML3SortMapFaultingEntryArray_enumerateDirtyObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v6;
  _BYTE *v7;

  if (a3[36])
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = a3;
    (*(void (**)(uint64_t, _BYTE *, uint64_t, uint64_t))(v6 + 16))(v6, v7, objc_msgSend(a2, "integerValue"), a4);

  }
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

- (id)objectAtIndex:(unint64_t)a3
{
  NSMutableDictionary *dirtyInserts;
  uint64_t v7;
  void *v8;
  ML3DatabaseConnection *connection;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5079;
  v22 = __Block_byref_object_dispose__5080;
  v23 = 0;
  dirtyInserts = self->_dirtyInserts;
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __46__ML3SortMapFaultingEntryArray_objectAtIndex___block_invoke;
  v17[3] = &unk_1E5B61838;
  v17[5] = &v24;
  v17[6] = a3;
  v17[4] = &v18;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dirtyInserts, "enumerateKeysAndObjectsUsingBlock:", v17);
  v8 = (void *)v19[5];
  if (!v8)
  {
    connection = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3 - *((int *)v25 + 6));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3DatabaseConnection executeQuery:withParameters:](connection, "executeQuery:withParameters:", CFSTR("SELECT name, name_order, name_section, sort_key FROM sort_map ORDER BY name_order LIMIT 1 OFFSET ?"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __46__ML3SortMapFaultingEntryArray_objectAtIndex___block_invoke_2;
    v16[3] = &unk_1E5B65200;
    v16[4] = &v18;
    objc_msgSend(v12, "enumerateRowsWithBlock:", v16);

    v8 = (void *)v19[5];
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3SortMap.m"), 1135, CFSTR("Did not find object at index %ld with %ld inserted objects"), a3, -[NSMutableDictionary count](self->_dirtyInserts, "count"));

      v8 = (void *)v19[5];
    }
  }
  v13 = v8;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

- (void)addObject:(id)a3
{
  NSMutableDictionary *dirtyInserts;
  void *v5;
  id v6;
  id v7;

  dirtyInserts = self->_dirtyInserts;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", -[ML3SortMapFaultingEntryArray count](self, "count"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](dirtyInserts, "setObject:forKey:", v6, v7);

}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  NSMutableDictionary *dirtyInserts;
  id v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSMutableDictionary *v15;
  _QWORD v16[4];
  NSMutableDictionary *v17;
  unint64_t v18;

  v6 = (void *)MEMORY[0x1E0C99E08];
  dirtyInserts = self->_dirtyInserts;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithCapacity:", -[NSMutableDictionary count](dirtyInserts, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_dirtyInserts;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__ML3SortMapFaultingEntryArray_insertObject_atIndex___block_invoke;
  v16[3] = &unk_1E5B61860;
  v18 = a4;
  v11 = v9;
  v17 = v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v10, "enumerateKeysAndObjectsUsingBlock:", v16);
  v12 = self->_dirtyInserts;
  self->_dirtyInserts = v11;
  v15 = v11;

  v13 = self->_dirtyInserts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v8, v14);

}

- (void)removeLastObject
{
  NSMutableDictionary *dirtyInserts;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5079;
  v9 = __Block_byref_object_dispose__5080;
  dirtyInserts = self->_dirtyInserts;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__ML3SortMapFaultingEntryArray_removeLastObject__block_invoke;
  v4[3] = &unk_1E5B61888;
  v4[4] = &v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dirtyInserts, "enumerateKeysAndObjectsUsingBlock:", v4);
  if (v6[5])
    -[NSMutableDictionary removeObjectForKey:](self->_dirtyInserts, "removeObjectForKey:");
  _Block_object_dispose(&v5, 8);

}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  NSMutableDictionary *dirtyInserts;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  _QWORD v12[4];
  NSMutableDictionary *v13;
  unint64_t v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5079;
  v20 = __Block_byref_object_dispose__5080;
  v21 = 0;
  dirtyInserts = self->_dirtyInserts;
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__ML3SortMapFaultingEntryArray_removeObjectAtIndex___block_invoke;
  v15[3] = &unk_1E5B618B0;
  v15[4] = &v16;
  v15[5] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dirtyInserts, "enumerateKeysAndObjectsUsingBlock:", v15);
  if (v17[5])
    -[NSMutableDictionary removeObjectForKey:](self->_dirtyInserts, "removeObjectForKey:");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_dirtyInserts, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_dirtyInserts;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __52__ML3SortMapFaultingEntryArray_removeObjectAtIndex___block_invoke_2;
  v12[3] = &unk_1E5B61860;
  v14 = a3;
  v9 = v7;
  v13 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v12);
  v10 = self->_dirtyInserts;
  self->_dirtyInserts = v9;
  v11 = v9;

  _Block_object_dispose(&v16, 8);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  NSMutableDictionary *dirtyInserts;
  void *v6;
  id v7;
  id v8;

  dirtyInserts = self->_dirtyInserts;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](dirtyInserts, "setObject:forKey:", v7, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyInserts, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __52__ML3SortMapFaultingEntryArray_removeObjectAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "integerValue") == *(_QWORD *)(a1 + 40))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __52__ML3SortMapFaultingEntryArray_removeObjectAtIndex___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "integerValue");
  v8 = a1 + 32;
  v7 = *(void **)(a1 + 32);
  if (v6 > *(_QWORD *)(v8 + 8))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = objc_msgSend(v5, "integerValue");

    objc_msgSend(v9, "numberWithInteger:", v10 - 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setObject:forKey:", v11, v5);

}

void __48__ML3SortMapFaultingEntryArray_removeLastObject__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  if (!v8)
    goto LABEL_4;
  v9 = objc_msgSend(v8, "integerValue");
  if (v9 < objc_msgSend(v10, "integerValue"))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v7 + 40), a2);
  }

}

void __53__ML3SortMapFaultingEntryArray_insertObject_atIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "integerValue");
  v8 = a1 + 32;
  v7 = *(void **)(a1 + 32);
  if (v6 >= *(_QWORD *)(v8 + 8))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = objc_msgSend(v5, "integerValue");

    objc_msgSend(v9, "numberWithInteger:", v10 + 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setObject:forKey:", v11, v5);

}

void __46__ML3SortMapFaultingEntryArray_objectAtIndex___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (objc_msgSend(v8, "integerValue") == a1[6])
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a3);
    *a4 = 1;
  }
  if ((unint64_t)objc_msgSend(v8, "integerValue") < a1[6])
    ++*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);

}

void __46__ML3SortMapFaultingEntryArray_objectAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  ML3MusicLibrary_SortMapEntry *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "stringForColumnIndex:", 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 1);
  v5 = objc_msgSend(v3, "intForColumnIndex:", 2);
  objc_msgSend(v3, "dataForColumnIndex:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ML3MusicLibrary_SortMapEntry initWithName:nameSection:sortKey:nameOrder:dirtyFlag:]([ML3MusicLibrary_SortMapEntry alloc], "initWithName:nameSection:sortKey:nameOrder:dirtyFlag:", v10, v5, v6, v4, 0);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

@end
