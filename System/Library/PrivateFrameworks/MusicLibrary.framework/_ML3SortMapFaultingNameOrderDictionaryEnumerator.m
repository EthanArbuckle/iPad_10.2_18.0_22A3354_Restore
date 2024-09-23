@implementation _ML3SortMapFaultingNameOrderDictionaryEnumerator

- (_ML3SortMapFaultingNameOrderDictionaryEnumerator)initWithDirtyInsertsEnumerator:(id)a3 connection:(id)a4
{
  id v7;
  id v8;
  _ML3SortMapFaultingNameOrderDictionaryEnumerator *v9;
  _ML3SortMapFaultingNameOrderDictionaryEnumerator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_ML3SortMapFaultingNameOrderDictionaryEnumerator;
  v9 = -[_ML3SortMapFaultingNameOrderDictionaryEnumerator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a4);
    objc_storeStrong((id *)&v10->_dirtyInsertsEnumerator, a3);
  }

  return v10;
}

- (id)nextObject
{
  void *v4;
  ML3DatabaseConnection *connection;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5079;
  v17 = __Block_byref_object_dispose__5080;
  -[NSEnumerator nextObject](self->_dirtyInsertsEnumerator, "nextObject");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v14[5];
  if (!v4)
  {
    connection = self->_connection;
    v6 = (void *)MEMORY[0x1E0CB37E8];
    ++self->_offset;
    objc_msgSend(v6, "numberWithUnsignedInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3DatabaseConnection executeQuery:withParameters:](connection, "executeQuery:withParameters:", CFSTR("SELECT name, name_order, name_section FROM sort_map LIMIT 1 OFFSET ?"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62___ML3SortMapFaultingNameOrderDictionaryEnumerator_nextObject__block_invoke;
    v12[3] = &unk_1E5B61900;
    v12[5] = &v13;
    v12[6] = a2;
    v12[4] = self;
    objc_msgSend(v9, "enumerateRowsWithBlock:", v12);

    v4 = (void *)v14[5];
  }
  v10 = v4;
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_dirtyInsertsEnumerator, 0);
}

@end
