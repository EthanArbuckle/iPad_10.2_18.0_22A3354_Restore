@implementation EFSQLRow

- (id)objectForKeyedSubscript:(id)a3
{
  EFSQLRow *v4;
  EFSQLRow *v5;
  _BOOL4 namedColumnsInitialized;
  unint64_t columnCount;
  size_t v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  EFSQLColumn *v17;
  void *v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
  uint64_t i;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSDictionary *columns;
  char *v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  _QWORD v37[2];
  void *v38;
  char *v39;
  _QWORD *v40;
  id v41;
  EFSQLRow *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v40 = v37;
  v41 = a3;
  v4 = self;
  v5 = v4;
  namedColumnsInitialized = v4->_namedColumnsInitialized;
  v42 = v4;
  if (!namedColumnsInitialized)
  {
    columnCount = v4->_columnCount;
    if (columnCount > 0xC80000)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _initializeAllNamedColumns(EFSQLRow *__strong)");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("EFSQLRow.m"), 112, CFSTR("Temporary buffer too large or with a negative count (%zu)."), columnCount);

    }
    if (columnCount <= 1)
      v8 = 1;
    else
      v8 = columnCount;
    if (columnCount >= 0x101)
      v9 = 1;
    else
      v9 = v8;
    v10 = 8 * v9;
    MEMORY[0x1E0C80A78]();
    v12 = (char *)v37 - v11;
    bzero((char *)v37 - v11, v10);
    v39 = v12;
    if (columnCount > 0x100)
    {
      v13 = (char *)malloc_type_calloc(v8, 8uLL, 0x80040B8603338uLL);
    }
    else
    {
      bzero(v12, 8 * v8);
      v13 = 0;
    }
    v37[1] = v37;
    v38 = v13;
    if (columnCount >= 0x101)
      v12 = v13;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * columnCount);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (columnCount)
    {
      v15 = 0;
      v16 = (id *)v12;
      do
      {
        v17 = -[EFSQLColumn initWithSQLiteStatement:index:]([EFSQLColumn alloc], "initWithSQLiteStatement:index:", v42->_statement, v15);
        objc_storeStrong(v16, v17);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v18);

        -[EFSQLColumn name](v17, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v14, "addObject:", v19);

        ++v15;
        ++v16;
      }
      while (columnCount != v15);
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "sharedKeySetForKeys:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", v20);
    v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (columnCount)
    {
      for (i = 0; i != columnCount; ++i)
      {
        v23 = *(id *)&v12[8 * i];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v23, v24);

        objc_msgSend(v23, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v23, v25);
        v26 = *(void **)&v12[8 * i];
        *(_QWORD *)&v12[8 * i] = 0;

      }
    }
    v5 = v42;
    columns = v42->_columns;
    v42->_columns = v21;

    v5->_namedColumnsInitialized = 1;
    free(v38);
    v28 = v39 - 8;
    do
    {

      v10 -= 8;
    }
    while (v10);
  }

  -[NSDictionary objectForKeyedSubscript:](v5->_columns, "objectForKeyedSubscript:", v41);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    v33 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[EFSQLRow _queryString](v42, "_queryString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "initWithFormat:", CFSTR("No matching column named \"%@\" in statement: %@"), v41, v34);

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v35, 0);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v36);
  }

  return v29;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  EFSQLRow *v5;
  EFSQLRow *v6;
  unint64_t columnCount;
  size_t v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  EFSQLColumn *v17;
  void *v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
  uint64_t i;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSDictionary *columns;
  char *v28;
  NSDictionary *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  unint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  char *v42;
  uint64_t *v43;
  unint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (-[EFSQLRow columnCount](self, "columnCount") <= a3)
  {
    v35 = a3;
    v36 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[EFSQLRow _queryString](self, "_queryString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "initWithFormat:", CFSTR("Index %lu is out of range for selected columns: %@"), v35, v37);

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], v38, 0);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v39);
  }
  v43 = &v40;
  v44 = a3;
  v5 = self;
  v6 = v5;
  if (!v5->_namedColumnsInitialized)
  {
    columnCount = v5->_columnCount;
    if (columnCount > 0xC80000)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _initializeAllNamedColumns(EFSQLRow *__strong)");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("EFSQLRow.m"), 112, CFSTR("Temporary buffer too large or with a negative count (%zu)."), columnCount);

    }
    v40 = (uint64_t)&v40;
    if (columnCount <= 1)
      v8 = 1;
    else
      v8 = columnCount;
    if (columnCount >= 0x101)
      v9 = 1;
    else
      v9 = v8;
    v10 = 8 * v9;
    MEMORY[0x1E0C80A78](v5);
    v12 = (char *)&v40 - v11;
    bzero((char *)&v40 - v11, v10);
    v42 = v12;
    if (columnCount > 0x100)
    {
      v13 = (char *)malloc_type_calloc(v8, 8uLL, 0x80040B8603338uLL);
    }
    else
    {
      bzero(v12, 8 * v8);
      v13 = 0;
    }
    v41 = v13;
    if (columnCount >= 0x101)
      v12 = v13;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * columnCount, v40);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (columnCount)
    {
      v15 = 0;
      v16 = (id *)v12;
      do
      {
        v17 = -[EFSQLColumn initWithSQLiteStatement:index:]([EFSQLColumn alloc], "initWithSQLiteStatement:index:", v6->_statement, v15);
        objc_storeStrong(v16, v17);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v18);

        -[EFSQLColumn name](v17, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v14, "addObject:", v19);

        ++v15;
        ++v16;
      }
      while (columnCount != v15);
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "sharedKeySetForKeys:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", v20);
    v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (columnCount)
    {
      for (i = 0; i != columnCount; ++i)
      {
        v23 = *(id *)&v12[8 * i];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v23, v24);

        objc_msgSend(v23, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v23, v25);
        v26 = *(void **)&v12[8 * i];
        *(_QWORD *)&v12[8 * i] = 0;

      }
    }
    columns = v6->_columns;
    v6->_columns = v21;

    v6->_namedColumnsInitialized = 1;
    free(v41);
    v28 = v42 - 8;
    do
    {

      v10 -= 8;
    }
    while (v10);
  }

  v29 = v6->_columns;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v44);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (unint64_t)columnCount
{
  return self->_columnCount;
}

- (EFSQLRow)initWithPreparedStatement:(id)a3
{
  id v4;
  EFSQLRow *v5;

  v4 = objc_retainAutorelease(a3);
  v5 = -[EFSQLRow initWithSQLiteStatement:](self, "initWithSQLiteStatement:", objc_msgSend(v4, "compiled"));
  -[EFSQLRow setPreparedStatement:](v5, "setPreparedStatement:", v4);

  return v5;
}

- (void)setPreparedStatement:(id)a3
{
  objc_storeStrong((id *)&self->_preparedStatement, a3);
}

- (EFSQLRow)initWithSQLiteStatement:(sqlite3_stmt *)a3
{
  EFSQLRow *v4;
  EFSQLRow *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EFSQLRow;
  v4 = -[EFSQLRow init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_statement = a3;
    v4->_columnCount = sqlite3_column_count(a3);
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_preparedStatement, 0);
}

- (EFSQLRow)initWithColumns:(id)a3
{
  id v4;
  EFSQLRow *v5;
  uint64_t v6;
  NSDictionary *columns;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFSQLRow;
  v5 = -[EFSQLRow init](&v9, sel_init);
  if (v5)
  {
    v5->_columnCount = objc_msgSend(v4, "count");
    v6 = objc_msgSend(v4, "copy");
    columns = v5->_columns;
    v5->_columns = (NSDictionary *)v6;

    v5->_namedColumnsInitialized = 1;
  }

  return v5;
}

- (BOOL)columnExistsAtIndex:(unint64_t)a3
{
  return -[EFSQLRow columnCount](self, "columnCount") > a3;
}

- (BOOL)columnExistsWithName:(id)a3
{
  EFSQLRow *v4;
  EFSQLRow *v5;
  unint64_t columnCount;
  size_t v7;
  uint64_t v8;
  size_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  void *v13;
  uint64_t v14;
  id *v15;
  EFSQLColumn *v16;
  void *v17;
  void *v18;
  void *v19;
  NSDictionary *v20;
  uint64_t i;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSDictionary *columns;
  char *v27;
  void *v28;
  BOOL v29;
  void *v31;
  void *v32;
  _QWORD v33[2];
  void *v34;
  char *v35;
  _QWORD *v36;
  id v37;
  EFSQLRow *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v36 = v33;
  v37 = a3;
  v4 = self;
  v5 = v4;
  if (!v4->_namedColumnsInitialized)
  {
    v38 = v4;
    columnCount = v4->_columnCount;
    if (columnCount > 0xC80000)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _initializeAllNamedColumns(EFSQLRow *__strong)");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("EFSQLRow.m"), 112, CFSTR("Temporary buffer too large or with a negative count (%zu)."), columnCount);

    }
    if (columnCount <= 1)
      v7 = 1;
    else
      v7 = columnCount;
    if (columnCount >= 0x101)
      v8 = 1;
    else
      v8 = v7;
    v9 = 8 * v8;
    MEMORY[0x1E0C80A78](v4);
    v11 = (char *)v33 - v10;
    bzero((char *)v33 - v10, v9);
    v35 = v11;
    if (columnCount > 0x100)
    {
      v12 = (char *)malloc_type_calloc(v7, 8uLL, 0x80040B8603338uLL);
    }
    else
    {
      bzero(v11, 8 * v7);
      v12 = 0;
    }
    v33[1] = v33;
    v34 = v12;
    if (columnCount >= 0x101)
      v11 = v12;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * columnCount);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (columnCount)
    {
      v14 = 0;
      v15 = (id *)v11;
      do
      {
        v16 = -[EFSQLColumn initWithSQLiteStatement:index:]([EFSQLColumn alloc], "initWithSQLiteStatement:index:", v38->_statement, v14);
        objc_storeStrong(v15, v16);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v17);

        -[EFSQLColumn name](v16, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v13, "addObject:", v18);

        ++v14;
        ++v15;
      }
      while (columnCount != v14);
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "sharedKeySetForKeys:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", v19);
    v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (columnCount)
    {
      for (i = 0; i != columnCount; ++i)
      {
        v22 = *(id *)&v11[8 * i];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v22, v23);

        objc_msgSend(v22, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          -[NSDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v22, v24);
        v25 = *(void **)&v11[8 * i];
        *(_QWORD *)&v11[8 * i] = 0;

      }
    }
    v5 = v38;
    columns = v38->_columns;
    v38->_columns = v20;

    v5->_namedColumnsInitialized = 1;
    free(v34);
    v27 = v35 - 8;
    do
    {

      v9 -= 8;
    }
    while (v9);
  }

  -[NSDictionary objectForKeyedSubscript:](v5->_columns, "objectForKeyedSubscript:", v37);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 != 0;

  return v29;
}

- (id)columnNames
{
  EFSQLRow *v2;
  EFSQLRow *v3;
  unint64_t columnCount;
  size_t v5;
  uint64_t v6;
  size_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  EFSQLColumn *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDictionary *v19;
  uint64_t i;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSDictionary *columns;
  char *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  char *v34;
  uint64_t *v35;
  EFSQLRow *v36;
  uint64_t v37;

  v35 = &v32;
  v37 = *MEMORY[0x1E0C80C00];
  v2 = self;
  v3 = v2;
  if (!v2->_namedColumnsInitialized)
  {
    columnCount = v2->_columnCount;
    v36 = v2;
    if (columnCount > 0xC80000)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _initializeAllNamedColumns(EFSQLRow *__strong)");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("EFSQLRow.m"), 112, CFSTR("Temporary buffer too large or with a negative count (%zu)."), columnCount);

    }
    v32 = (uint64_t)&v32;
    if (columnCount <= 1)
      v5 = 1;
    else
      v5 = columnCount;
    if (columnCount >= 0x101)
      v6 = 1;
    else
      v6 = v5;
    v7 = 8 * v6;
    MEMORY[0x1E0C80A78](v2);
    v9 = (char *)&v32 - v8;
    bzero((char *)&v32 - v8, v7);
    v34 = v9;
    if (columnCount > 0x100)
    {
      v10 = malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
    }
    else
    {
      bzero(v9, 8 * v5);
      v10 = 0;
    }
    v33 = v10;
    if (columnCount >= 0x101)
      v11 = (id *)v10;
    else
      v11 = (id *)v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * columnCount, v32);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (columnCount)
    {
      v13 = 0;
      v14 = v11;
      do
      {
        v15 = -[EFSQLColumn initWithSQLiteStatement:index:]([EFSQLColumn alloc], "initWithSQLiteStatement:index:", v36->_statement, v13);
        objc_storeStrong(v14, v15);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v16);

        -[EFSQLColumn name](v15, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v12, "addObject:", v17);

        ++v13;
        ++v14;
      }
      while (columnCount != v13);
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "sharedKeySetForKeys:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", v18);
    v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (columnCount)
    {
      for (i = 0; i != columnCount; ++i)
      {
        v21 = v11[i];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v21, v22);

        objc_msgSend(v21, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          -[NSDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v21, v23);
        v24 = v11[i];
        v11[i] = 0;

      }
    }
    v3 = v36;
    columns = v36->_columns;
    v36->_columns = v19;

    v3->_namedColumnsInitialized = 1;
    free(v33);
    v26 = v34 - 8;
    do
    {

      v7 -= 8;
    }
    while (v7);
  }

  -[NSDictionary allKeys](v3->_columns, "allKeys");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "ef_filter:", &__block_literal_global_35);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

uint64_t __23__EFSQLRow_columnNames__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)debugDescription
{
  id v3;
  unint64_t i;
  NSDictionary *columns;
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
  objc_super v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i < -[EFSQLRow columnCount](self, "columnCount"); ++i)
  {
    columns = self->_columns;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](columns, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3940];
    if (v7)
    {
      objc_msgSend(v7, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%lu:%@:%@"), i, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v11);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu:nil"), i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v9);
    }

  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)EFSQLRow;
  -[EFSQLRow debugDescription](&v17, sel_debugDescription);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@(\n%@\n)"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_queryString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_sql(self->_statement));
}

- (sqlite3_stmt)statement
{
  return self->_statement;
}

- (EFSQLPreparedStatement)preparedStatement
{
  return self->_preparedStatement;
}

- (NSDictionary)columns
{
  return self->_columns;
}

- (BOOL)namedColumnsInitialized
{
  return self->_namedColumnsInitialized;
}

- (void)setNamedColumnsInitialized:(BOOL)a3
{
  self->_namedColumnsInitialized = a3;
}

- (void)setColumnCount:(unint64_t)a3
{
  self->_columnCount = a3;
}

@end
